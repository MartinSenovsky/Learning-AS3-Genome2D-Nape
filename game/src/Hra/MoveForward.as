package Hra 
{
	import com.genome2d.components.GComponent;
	import com.genome2d.core.GNode;
	
	/**
	 * ...
	 * @author Andrej Senovsky
	 */
	public class MoveForward extends GComponent 
	{
		
		public var speed:int = 300;
		
		public function MoveForward(p_node:GNode) 
		{
			super(p_node);
			
		}
		
		override public function update(p_deltaTime:Number, p_parentTransformUpdate:Boolean, p_parentColorUpdate:Boolean):void 
		{
			
			
			
			node.transform.x += Math.cos(node.transform.rotation) * speed * p_deltaTime / 1000;
			node.transform.y += Math.sin(node.transform.rotation) * speed * p_deltaTime / 1000;
			
			
			
			super.update(p_deltaTime, p_parentTransformUpdate, p_parentColorUpdate);
		}
	}
}