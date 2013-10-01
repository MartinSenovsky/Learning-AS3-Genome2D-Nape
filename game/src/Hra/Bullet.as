package Hra 
{
	import com.genome2d.components.physics.nape.GNapeBody;
	import com.genome2d.components.renderables.GSprite;
	import com.genome2d.core.GNode;
	import com.genome2d.physics.GNapeFactory;
	import Hra.Components.MoveForward;
	import Hra.Components.PoolableComponent;
	import nape.callbacks.CbEvent;
	import nape.callbacks.InteractionCallback;
	
	/**
	 * ...
	 * @author Andrej Senovsky
	 */
	public class Bullet extends PoolableComponent 
	{
		private var body:GNapeBody;
		public var gsprite:GSprite;
		public var dmg:int;
		
		public function Bullet(p_node:GNode) 
		{
			super(p_node);
			
			dmg = 1;
			
			gsprite = node.addComponent(GSprite) as GSprite;
			gsprite.setTexture(Atlas.allAtlas.getTexture("bullet"));
			
			var moveForward:MoveForward = node.addComponent(MoveForward) as MoveForward;
			moveForward.speed = 500;
			
			body = node.addComponent(GNapeBody) as GNapeBody;
			body.napeBody = GNapeFactory.createCircle(3);
			body.napeBody.cbTypes.add(CbTypes.BULLET);
			body.addCollisionListener(CbEvent.BEGIN, CbTypes.ENEMY, onHit);
		}
		
		public function onHit(cb:InteractionCallback):void
		{
			var enemy:Enemy = cb.int2.castBody.userData.component.node.getComponent(Enemy) as Enemy;
			
			enemy.hp -= dmg;
			
			if (enemy.hp <= 0)
			{
				Game.removeEnemy(enemy);
			}
			
			BulletPool.storeBullet(this);
		}
		
	}
}