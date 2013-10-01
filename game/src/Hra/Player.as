package Hra 
{
	import com.genome2d.components.GComponent;
	import com.genome2d.components.physics.nape.GNapeBody;
	import com.genome2d.components.renderables.GMovieClip;
	import com.genome2d.core.GNode;
	import com.genome2d.physics.GNapeFactory;
	import flash.events.MouseEvent;
	import Hra.Components.LookToMouse;
	import Hra.Components.MoveForward;
	
	/**
	 * ...
	 * @author Andrej Senovsky
	 */
	public class Player extends GComponent 
	{
		public var gmc:GMovieClip;
		public var shooting:Boolean;
		public var readyToShoot:Boolean;
		public var fireEachNthFrame:int = 5; // 30 fps / 5 = 6 bullets per second
		public var fireEachNthFrameN:int;
		
		public var animStand:Array = ["stand"];
		public var animShoot:Array = ["shoot"];
		public var animWalk:Array = ["stand", "walk1", "walk2", "walk3", "walk4", "walk5"];
		
		public function Player(p_node:GNode) 
		{
			super(p_node);
			
			gmc = node.addComponent(GMovieClip) as GMovieClip;
			gmc.setTextureAtlas(Atlas.allAtlas);
			gmc.frameRate = 10;
			playAnim(animStand);
			
			node.transform.setScale(0.5, 0.5);
			
			
			node.addComponent(LookToMouse);
			
			var body:GNapeBody = node.addComponent(GNapeBody) as GNapeBody;
			body.napeBody = GNapeFactory.createCircle(12);
			
			node.core.stage.addEventListener(MouseEvent.MOUSE_DOWN, onDown, false, 0, true);
			node.core.stage.addEventListener(MouseEvent.MOUSE_UP, onUp, false, 0, true);
			
			node.core.stage.addEventListener(MouseEvent.RIGHT_MOUSE_DOWN, onDownR, false, 0, true);
			node.core.stage.addEventListener(MouseEvent.RIGHT_MOUSE_UP, onUpR, false, 0, true);
		}
		
		public function playAnim(anim:Array):void
		{
			gmc.frames = anim;
			gmc.play();
		}
		
		private function onUp(e:MouseEvent):void 
		{
			shooting = false;
			
			if (readyToShoot)
			{
				
			}
			else
			{
				if (node.hasComponent(MoveForward))
				{
					node.removeComponent(MoveForward);
					playAnim(animStand);
				}
			}
		}
		
		private function onDown(e:MouseEvent):void 
		{
			if (readyToShoot)
			{
				shoot();
				shooting = true;
			}
			else
			{
				if (node.hasComponent(MoveForward) == false)
				{
					node.addComponent(MoveForward);
					playAnim(animWalk);
				}
			}
		}
		
		private function onUpR(e:MouseEvent):void 
		{
			readyToShoot = false;
			playAnim(animStand);
		}
		
		private function onDownR(e:MouseEvent):void 
		{
			readyToShoot = true;
			playAnim(animShoot);
			if (node.hasComponent(MoveForward))
			{
				node.removeComponent(MoveForward);
			}
		}
		
		override public function update(p_deltaTime:Number, p_parentTransformUpdate:Boolean, p_parentColorUpdate:Boolean):void 
		{
			if (shooting && fireEachNthFrameN == 0)
			{
				shoot();
			}
			
			fireEachNthFrameN--;
			
			super.update(p_deltaTime, p_parentTransformUpdate, p_parentColorUpdate);
		}
		
		
		public function shoot():void
		{
			var b:Bullet = BulletPool.getBullet();
			b.node.transform.rotation = node.transform.rotation;
			b.node.transform.setPosition(node.transform.x, node.transform.y);
			Game.layerBullets.addChild(b.node);
			fireEachNthFrameN = fireEachNthFrame;
		}
		
	}
}