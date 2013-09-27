package Hra 
{
	import com.genome2d.components.GComponent;
	import com.genome2d.components.physics.nape.GNapeBody;
	import com.genome2d.components.renderables.GSprite;
	import com.genome2d.core.GNode;
	import com.genome2d.physics.GNapeFactory;
	import nape.callbacks.CbEvent;
	import nape.callbacks.CbType;
	import nape.callbacks.InteractionCallback;
	
	/**
	 * ...
	 * @author Andrej Senovsky
	 */
	public class Bullet extends GComponent 
	{
		public var used:Boolean;
		public var gsprite:GSprite;
		
		public function Bullet(p_node:GNode) 
		{
			super(p_node);
			
			gsprite = node.addComponent(GSprite) as GSprite;
			gsprite.setTexture(Atlas.allAtlas.getTexture("bullet"));
			
			var moveForward:MoveForward = node.addComponent(MoveForward) as MoveForward;
			moveForward.speed = 500;
			
			var body:GNapeBody = node.addComponent(GNapeBody) as GNapeBody;
			body.napeBody = GNapeFactory.createCircle(3);
			body.addCollisionListener(CbEvent.BEGIN, CbType.ANY_BODY, onHit);
		}
		
		public function onHit(cb:InteractionCallback):void
		{
			trace("HIIIIIT");
			
			BulletPool.storeBullet(this);
		}
		
	}
}