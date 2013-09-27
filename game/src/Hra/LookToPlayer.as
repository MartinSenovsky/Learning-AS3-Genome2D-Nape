package Hra 
{
	import com.genome2d.components.GComponent;
	import com.genome2d.core.GNode;
	
	/**
	 * ...
	 * @author Andrej Senovsky
	 */
	public class LookToPlayer extends GComponent 
	{
		
		public function LookToPlayer(p_node:GNode) 
		{
			super(p_node);
			
		}
		
		override public function update(p_deltaTime:Number, p_parentTransformUpdate:Boolean, p_parentColorUpdate:Boolean):void 
		{
			var mouseX:int = Game.player.node.transform.x;
			var mouseY:int = Game.player.node.transform.y;
			
			var dx:int = mouseX - node.transform.x;
			var dy:int = mouseY - node.transform.y;
			
			var angle:Number;
			
			angle = Math.atan2(dy, dx);
			
			node.transform.rotation = angle;
			
			super.update(p_deltaTime, p_parentTransformUpdate, p_parentColorUpdate);
		}
	}
}