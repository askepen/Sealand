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
	
	public function new () 
	{
		super();
		
		spr.add("none",			 [3],0, false);
		spr.add("bot",			 [4],0, false);
		spr.add("right",		 [6],0, false);
		spr.add("all",			 [7],0, false);
		spr.add("left-bot-right",[8],0, false);
		spr.add("top",			 [9],0, false);
		spr.add("top-right",	 [10],0,false);
		spr.add("left-top-right",[11],0,false);
		spr.add("top-down",		 [12],0,false);
		spr.add("left-right",	 [13],0,false);
		
		spr.play("none");
		
		pillar.originY = -30;
		graphic = new Graphiclist([pillar,spr]);
		
		this.setHitbox(102-16,102-16,-8,-8);
		type = "platform";
		this.layer = -Math.round(y);
	}		
	
	public function updateGraphic( tiles:Array<Int> = [0,0,0,0] ):Void
	{
		switch(tiles)
		{
			case [0, 0, 0, 0] :
				spr.play("none");
				break;
			
			case [1, 0, 0, 0] :
				spr.play("right");
				break;
			
			case [0, 1, 0, 0] :
				spr.play("right");
				break;
			
			case [0, 0, 1, 0] :
				spr.play("top");
				break;
			
			case [0, 0, 0, 1] :
				spr.play("bot");
				break;
			
			case [1, 1, 0, 0] :
				spr.play("left-right");
				break;
			
			case [0, 0, 1, 1] :
				spr.play("top-down");
				break;
			
			case [1, 0, 1, 0] :
				spr.play("top-right");
				break;
			
			case [0, 1, 1, 0] :
				spr.play("top-right");
				break;
			
			case [0, 1, 0, 1] :
				spr.play("all"); // gaben fix pls
				break;
			
			case [1, 0, 0, 1] :
				spr.play("all"); // gaben pls i fan
				break;
			
			case [1, 1, 1, 0] :
				spr.play("left-top-right");
				break;
			
			case [1, 1, 0, 1] :
				spr.play("left-bot-right");
				break;
			
			case [0, 1, 1, 1] :
				spr.play("none");
				break;
			
			case [1, 0, 1, 1] :
				spr.play("none");
				break;
			
			case [1, 1, 1, 1] :
				spr.play("none");
				break;
			
			
		}
		
	}
	
}
