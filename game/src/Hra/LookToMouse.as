package Hra 
{
	import com.genome2d.components.GComponent;
	import com.genome2d.core.GNode;
	
	/**
	 * ...
	 * @author Andrej Senovsky
	 */
	public class LookToMouse extends GComponent 
	{
		
		public function LookToMouse(p_node:GNode) 
		{
			super(p_node);
			
		}
		
		override public function update(p_deltaTime:Number, p_parentTransformUpdate:Boolean, p_parentColorUpdate:Boolean):void 
		{
			var mouseX:int = node.core.stage.mouseX;
			var mouseY:int = node.core.stage.mouseY;
			
			var dx:int = mouseX - node.transform.x;
			var dy:int = mouseY - node.transform.y;
			
			var angle:Number;
			
			angle = Math.atan2(dy, dx);
			
			node.transform.rotation = angle;
			
			super.update(p_deltaTime, p_parentTransformUpdate, p_parentColorUpdate);
		}
		
	}
}