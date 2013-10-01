package Hra 
{
	import com.genome2d.components.GComponent;
	import com.genome2d.core.GNode;
	
	/**
	 * ...
	 * @author martin senovsky
	 */
	public class LookOffset extends GComponent 
	{
		
		public function LookOffset(p_node:GNode) 
		{
			super(p_node);
			
		}
		
		override public function update(p_deltaTime:Number, p_parentTransformUpdate:Boolean, p_parentColorUpdate:Boolean):void 
		{
			node.transform.rotation += (Game.randomInt(0, 10) - 5 ) * Game.degToRad;
			
			super.update(p_deltaTime, p_parentTransformUpdate, p_parentColorUpdate);
		}
		
	}

}