package Hra 
{
	import com.genome2d.core.GNodeFactory;
	/**
	 * ...
	 * @author Andrej Senovsky
	 */
	public class EnemyPool 
	{
		static public var enemies:Vector.<Enemy> = new Vector.<Enemy>();
		
		static public function getEnemy():Enemy
		{
			for (var i:int = 0; i < enemies.length; i++)
			{
				if (enemies[i].used == false)
				{
					enemies[i].used = true;
					return enemies[i];
				}
			}
			
			var e:Enemy = GNodeFactory.createNodeWithComponent(Enemy) as Enemy;
			e.used = true;
			enemies.push(e);
			
			return e;
		}
		
		static public function storeEnemy(e:Enemy):void
		{
			e.used = false;
		}
		
		
	}
}