import com.haxepunk.Scene;
import com.haxepunk.HXP;
import com.haxepunk.Entity;


/**
 * ...
 * @author aske
 */
class Scene1 extends Scene
{
	
	public var landTiles:Array<Array<Int>> = [[0, 0, 0, 1],
											  [0, 0, 1, 1],
											  [0, 0, 1, 1],
											  [0, 0, 1, 0],
											  [0, 0, 1, 1]
											  ];
	 
	public function new () 
	{
		super();
		
		for (i in 0...landTiles.length)
		{
			for (j in 0...landTiles[i].length)
			{
				if (landTiles[i][j] == 1)
				{
					var p:PlatformTile = new PlatformTile();
					p.x = j * 102;
					p.y = i * 102;
					add(p);
				}
			}
		}
		
		
		var e:Dude = new Dude();
		e.x = 210;
		e.y = 170;
		add(e);
		
		var e:Dude = new Dude();
		e.x = 250;
		e.y = 170;
		add(e);
		
		add(new Selector());
	}	
	
	override public function update()
	{
			
		
		
		
		
		super.update();
	}	

}
