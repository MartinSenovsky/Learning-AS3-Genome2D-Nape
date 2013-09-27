package  
{
	import com.genome2d.textures.factories.GTextureAtlasFactory;
	import com.genome2d.textures.GTextureAtlas;
	/**
	 * ...
	 * @author Andrej Senovsky
	 */
	public class Atlas 
	{
		static public var allAtlas:GTextureAtlas;
		[Embed(source = "../assets/all.png")] public static var AllPng:Class;
		[Embed(source = "../assets/all.xml", mimeType="application/octet-stream")] public static var AllXml:Class;
		
		static public function init():void 
		{
			allAtlas = GTextureAtlasFactory.createFromAssets("all", AllPng, AllXml);
		}
		
	}
}