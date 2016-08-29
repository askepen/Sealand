
import com.haxepunk.Entity;
import com.haxepunk.graphics.Spritemap;


class Click extends Entity
{
	private var spr:Spritemap = new Spritemap("assets/click.png", 20, 20);
	
	public function new() 
	{
		super();
		
		spr.add("click",[0,1,2,2], 10, false);
		spr.play("click");
		
		graphic = spr;
	}	
	
	override public function update():Void 
	{
		super.update();
		
		if (spr.index > 2) scene.remove(this);
	}
	
}