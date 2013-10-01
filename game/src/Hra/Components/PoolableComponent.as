package Hra.Components
{
	import com.genome2d.components.GComponent;
	import com.genome2d.core.GNode;
	
	/**
	 * ...
	 * @author martin senovsky
	 */
	public class PoolableComponent extends GComponent
	{
		public var used:Boolean;
		
		public function PoolableComponent(p_node:GNode)
		{
			super(p_node);
		
		}
	
	}

}