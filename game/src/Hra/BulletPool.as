package Hra 
{
	import com.genome2d.core.GNodeFactory;
	/**
	 * ...
	 * @author Andrej Senovsky
	 */
	public class BulletPool 
	{
		static public var bullets:Vector.<Bullet> = new Vector.<Bullet>();
		
		static public function getBullet():Bullet
		{
			for (var i:int = 0; i < bullets.length; i++)
			{
				if (bullets[i].used == false)
				{
					bullets[i].used = true;
					return bullets[i];
				}
			}
			
			var b:Bullet = GNodeFactory.createNodeWithComponent(Bullet) as Bullet;
			b.used = true;
			bullets.push(b);
			
			return b;
		}
		
		static public function storeBullet(b:Bullet):void
		{
			b.used = false;
			
			if(b.node.parent)
			{
				b.node.parent.removeChild(b.node);
			}
		}
		
		
	}
}