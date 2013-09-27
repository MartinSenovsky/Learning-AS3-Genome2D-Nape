package  
{
	import com.genome2d.components.particles.GSimpleEmitter;
	import com.genome2d.components.renderables.GSprite;
	import com.genome2d.context.GBlendMode;
	import com.genome2d.core.Genome2D;
	import com.genome2d.core.GNode;
	import com.genome2d.core.GNodeFactory;
	import Hra.Enemy;
	import Hra.Player;
	/**
	 * ...
	 * @author Andrej Senovsky
	 */
	public class Game 
	{
		public var genome2d:Genome2D;
		public static var player:Player;
		
		public static const degToRad:Number = 0.0174532925;
		
		public static var layerZomies:GNode;
		public static var layerPlayer:GNode;
		public static var layerBullets:GNode;
		public static var layerBg:GNode;
		
		
		public function Game() 
		{
			genome2d = Genome2D.getInstance();
			
			layerBg = GNodeFactory.createNode();
			genome2d.root.addChild(layerBg);
			
			layerPlayer = GNodeFactory.createNode();
			genome2d.root.addChild(layerPlayer);
			
			layerZomies = GNodeFactory.createNode();
			genome2d.root.addChild(layerZomies);
			
			layerBullets = GNodeFactory.createNode();
			genome2d.root.addChild(layerBullets);
			
			
			
			player = GNodeFactory.createNodeWithComponent(Player) as Player;
			layerPlayer.addChild(player.node);
			player.node.transform.setPosition(randomInt(10,800), randomInt(10,800));
			
			for (var i:int = 0; i < 100; i++)
			{
				var e:Enemy = GNodeFactory.createNodeWithComponent(Enemy) as Enemy;
				layerZomies.addChild(e.node);
				e.node.transform.setPosition(randomInt(10,800), randomInt(10,800));
			}
			
			var bg:GSprite = GNodeFactory.createNodeWithComponent(GSprite) as GSprite;
			bg.setTexture(Atlas.allAtlas.getTexture("grass"));
			bg.node.transform.setPosition(512, 512);
			layerBg.addChild(bg.node);
			
		}
		
		
		/**
		 * Vracia nahodne cislo od do vratane od vratane do
		 * @param	from
		 * @param	to
		 * @return
		 */
		static public function randomInt(from:int, to:int):int
		{
			return Math.random() * ((to - from) + from + 1);
		}
		
		static public function showEffect():void
		{
			
		}
	}
}