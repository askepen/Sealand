import com.haxepunk.Scene;
import com.haxepunk.HXP;
import com.haxepunk.Entity;


/**
 * ...
 * @author aske
 */
class Scene1 extends Scene
{
	
	public var tiles:Array<PlatformTile> = [];
	
	public var landTiles:Array<Array<Int>> = [[0, 0, 0, 0],
											  [0, 0, 1, 0],
											  [0, 1, 1, 1],
											  [1, 0, 1, 0],
											  [0, 1, 1, 1]
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
					var p:PlatformTile = new PlatformTile(j,i);
					add(p);
					p.updateHitbox(landTiles, j, i);
					tiles.push(p);
				}
			}
		}
		
		for(i in 0...tiles.length)
		{
			var p:PlatformTile = tiles[i];
			var l:Int = landTiles.length -1;
			var l2:Int = landTiles[p.posy].length-1;
			
			
			var s:String = "";
			s += (p.posy > 0  && landTiles[p.posy - 1][p.posx    ] == 0 ) ? "_" : "N";
			s += (p.posx < l2 && landTiles[p.posy    ][p.posx + 1] == 0 ) ? "_" : "E";
			s += (p.posy < l  && landTiles[p.posy + 1][p.posx    ] == 0 ) ? "_" : "S";
			s += (p.posx > 0  && landTiles[p.posy    ][p.posx - 1] == 0 ) ? "_" : "W";
			p.updateGraphic(s);
		}
		
		
		var e:Dude = new Dude();
		e.x = 210;
		e.y = 170;
		add(e);
		
		var e:Dude = new Dude();
		e.x = 250;
		e.y = 170;
		add(e);
		
		var e:Dude = new Dude();
		e.x = 260;
		e.y = 170;
		add(e);
		
		var e:Dude = new Dude();
		e.x = 250;
		e.y = 180;
		add(e);
		
		var e:Dude = new Dude();
		e.x = 240;
		e.y = 160;
		add(e);
		
		add(new Selector());
	}	
	
	override public function update()
	{
			
		
		super.update();
	}	

}
