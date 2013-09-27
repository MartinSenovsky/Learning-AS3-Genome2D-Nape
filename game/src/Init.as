package  
{
	import com.genome2d.core.GConfig;
	import com.genome2d.core.Genome2D;
	import com.genome2d.physics.GNapePhysics;
	import flash.display.Shape;
	import flash.display.Stage;
	import flash.geom.Rectangle;
	import nape.geom.Vec2;
	import nape.util.Debug;
	import nape.util.ShapeDebug;
	/**
	 * ...
	 * @author Andrej Senovsky
	 */
	public class Init 
	{
		
		private var genome2d:Genome2D;
		private var stageRect:Rectangle;
		
		public function Init(stage:Stage) 
		{
			stageRect = new Rectangle(0, 0, stage.stageWidth, stage.stageHeight);
			
			var config:GConfig = new GConfig(stageRect);
			config.enableStats = true;
			
			genome2d = Genome2D.getInstance();
			genome2d.init(stage, config);
			genome2d.onInitialized.addOnce(onGenomeInitialized);
			
		}
		
		public function onGenomeInitialized():void
		{
			Atlas.init();
			
			var debug:ShapeDebug = null;
			//var debug:ShapeDebug=new ShapeDebug(stageRect.width, stageRect.height, 0x33333333);
			//genome2d.stage.addChild(debug.display);
			
			genome2d.physics = new GNapePhysics(Vec2.get(0,0), debug);
			
			
			
			new Game();
		}
		
	}
}