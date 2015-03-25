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
		
		spr.add("none",			 [3],0,false);
		spr.add("bot",			 [4],0,false);
		spr.add("right",		 [6],0,false);
		spr.add("all",			 [7],0,false);
		spr.add("left-bot-right",[8],0,false);
		spr.add("top",			 [9],0,false);
		spr.add("top-right",	 [10],0,false);
		spr.add("left-top-right",[11],0,false);
		
		spr.play("bot");
		
		pillar.originY = -30;
		graphic = new Graphiclist([pillar,spr]);
		
		this.setHitbox(102-16,102-16,-8,-8);
		type = "platform";
		this.layer = -Math.round(y);
	}		

}
