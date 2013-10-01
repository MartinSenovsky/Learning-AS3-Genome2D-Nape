package Hra 
{
	import com.genome2d.components.physics.nape.GNapeBody;
	import com.genome2d.components.renderables.GSprite;
	import com.genome2d.core.GNode;
	import com.genome2d.physics.GNapeFactory;
	import Hra.Components.MoveForward;
	import Hra.Components.PoolableComponent;
	import Hra.Components.LookToPlayer;
	
	/**
	 * ...
	 * @author Andrej Senovsky
	 */
	public class Enemy extends PoolableComponent 
	{
		private var body:GNapeBody;
		public var gsprite:GSprite;
		public var moveForward:MoveForward;
		public const maxHp:int = 5;
		public var hp:int;
		
		public function Enemy(p_node:GNode) 
		{
			super(p_node);
			gsprite = node.addComponent(GSprite) as GSprite;
			gsprite.setTexture(Atlas.allAtlas.getTexture("zomb"));
			
			//node.addComponent(LookRandom);
			node.addComponent(LookToPlayer);
			node.addComponent(LookOffset);
			moveForward = node.addComponent(MoveForward) as MoveForward;
			moveForward.speed = 20;
			
			body = node.addComponent(GNapeBody) as GNapeBody;
			body.napeBody = GNapeFactory.createCircle(8);
			body.napeBody.cbTypes.add(CbTypes.ENEMY);
			
			ready();
		}
		
		
		public function ready():void
		{
			hp = maxHp;
			body.rotation = Game.randomInt(0, 360) * Game.degToRad;
		}
		
	}
}