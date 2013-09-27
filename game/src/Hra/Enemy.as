package Hra 
{
	import com.genome2d.components.GComponent;
	import com.genome2d.components.physics.nape.GNapeBody;
	import com.genome2d.components.renderables.GSprite;
	import com.genome2d.core.GNode;
	import com.genome2d.physics.GNapeFactory;
	
	/**
	 * ...
	 * @author Andrej Senovsky
	 */
	public class Enemy extends GComponent 
	{
		public var gsprite:GSprite;
		public var moveForward:MoveForward;
		
		public function Enemy(p_node:GNode) 
		{
			super(p_node);
			gsprite = node.addComponent(GSprite) as GSprite;
			gsprite.setTexture(Atlas.allAtlas.getTexture("zomb"));
			
			//node.addComponent(LookRandom);
			node.addComponent(LookToPlayer);
			moveForward = node.addComponent(MoveForward) as MoveForward;
			moveForward.speed = 50;
			
			var body:GNapeBody = node.addComponent(GNapeBody) as GNapeBody;
			body.napeBody = GNapeFactory.createCircle(8);
		}
		
	}
}