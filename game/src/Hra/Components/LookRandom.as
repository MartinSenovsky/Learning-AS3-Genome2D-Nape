package Hra.Components 
{
	import com.genome2d.components.GComponent;
	import com.genome2d.core.GNode;
	
	/**
	 * ...
	 * @author Andrej Senovsky
	 */
	public class LookRandom extends GComponent 
	{
		
		public function LookRandom(p_node:GNode) 
		{
			super(p_node);
			node.transform.rotation = Game.randomInt(0, 360) * Game.degToRad;
		}
		
		override public function update(p_deltaTime:Number, p_parentTransformUpdate:Boolean, p_parentColorUpdate:Boolean):void 
		{
			node.transform.rotation += (Game.randomInt(0, 10) - 5 ) / 360;
			
			super.update(p_deltaTime, p_parentTransformUpdate, p_parentColorUpdate);
		}
		
	}
}