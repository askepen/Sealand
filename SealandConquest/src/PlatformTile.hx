import com.haxepunk.Entity;
import com.haxepunk.graphics.Image;
import com.haxepunk.graphics.Spritemap;
import com.haxepunk.graphics.Graphiclist;
import flash.geom.Rectangle;
import com.haxepunk.masks.Grid;


/**
 * ...
 * @author aske
 */
class PlatformTile extends Entity
{
	
	public var spr:Spritemap    = new Spritemap("assets/sheet_1.png", 102,102);
	public var pillar:Image = new Image("assets/sheet_1.png", new Rectangle(204,0,102,102));
	public var posx:Int;
	public var posy:Int;
	
	
	public function new (x:Int, y:Int ) 
	{
		super();
		
		spr.add("____",		[3], 0, false);
		spr.add("N___",		[9], 0, false);
		spr.add("NE__",	 	[10],0, false);
		spr.add("N_S_",		[12], 0, false); 
		spr.add("N__W",	 	[10],0, false); //FLIPME
		spr.add("NES_",		[12],0, false); //FIXME: NOT DRAWN
		spr.add("NE_W",		[11],0, false);
		spr.add("N_SW",		[7], 0, false); //FIXME: NOT DRAWN
		spr.add("NESW",		[7], 0, false);
		spr.add("_E__",		[6], 0, false);
		spr.add("_ES_",		[7], 0, false); //FIXME: NOT DRAWN
		spr.add("_E_W",		[13],0, false);
		spr.add("_ESW",		[8], 0, false);
		spr.add("__S_",		[4], 0, false);
		spr.add("__SW",		[7], 0, false); //FIXME: NOT DRAWN
		spr.add("___W",		[6], 0, false); //FLIPME
		
		spr.play("____");
		
		this.x = x * 102;
		this.y = y * 102;
		posx = x;
		posy = y;
		
		pillar.originY = -30;
		graphic = new Graphiclist([pillar,spr]);
		
		this.setHitbox(102-16,102-16,-8,-8);
		type = "platform";
		this.layer = -Math.round(y);
	}		
	
	public function updateHitbox(tiles:Array<Array<Int>>, posX:Int, posY:Int):Void
	{
		if (tiles[posY][posX + 1] == 1) 
		{
			if (tiles[posY][posX - 1] == 1) 
			{
				this.originX = 0;
				this.width = 102;
			}
			else this.width = 102 - 8;
		}
		else if (tiles[posY][posX - 1] == 1)
		{
			this.originX = 0;
			this.width = 102 - 8;
		}
		
		
		if (tiles[posY + 1] != null && tiles[posY + 1][posX] == 1) 
		{
			if (tiles[posY - 1] != null && tiles[posY - 1][posX] == 1) 
			{
				this.originY = 0;
				this.height = 102;
			}
			else this.height = 102 - 8;
		}
		else if (tiles[posY - 1] != null && tiles[posY - 1][posX] == 1)
		{
			this.originY = 0;
			this.height = 102 - 8;
		}
		
	}
	
	public function updateGraphic( s:String ):Void 
	{
		spr.play(s);
	}
	
}
