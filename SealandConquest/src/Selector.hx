import com.haxepunk.HXP;
import com.haxepunk.Entity;
import com.haxepunk.graphics.Image;
import com.haxepunk.utils.Input;
import com.haxepunk.math.Vector;


/**
 * ...
 * @author aske
 */
class Selector extends Entity
{
	public var x1:Float = 0;
	public var y1:Float = 0;
	public var x2:Float = 0;
	public var y2:Float = 0;
	public var w:Float = 0;
	public var h:Float = 0;
	
	public var arr:Array<Dude>      = [];
	public var allDudes:Array<Dude> = [];
	
	public function new () 
	{
		super();
		
	}	
	
	override public function update()
	{
		if (Input.mousePressed)
		{
			x1 = Input.mouseX;
			y1 = Input.mouseY;
			
			x = Input.mouseX;
			y = Input.mouseY;
		}
		
		if (Input.mouseDown)
		{		
			x2 = Input.mouseX;
			y2 = Input.mouseY;
			
		
			
			w = x2 - x1;
			h = y2 - y1;
			
			if (w < 0)
			{
				x = x2;
				w = Math.abs(w);
			} 
			
			if (h < 0)
			{
				y = y2;
				h = Math.abs(h);
			} 
			
			
			if (h != 0 && w != 0) graphic = Image.createRect(Math.round(w),Math.round(h),0xff0000,0.2);
			else graphic = null;
			
			
		}
		
		if (Input.mouseReleased)
		{
			arr= [];
			scene.collideRectInto("dude", x, y, w, h+26, arr);
			
			allDudes = [];
			scene.getClass(Dude,allDudes);
			
			for (i in 0...allDudes.length)
			{
				allDudes[i].selected = false;
			}
			
			for (i in 0...arr.length)
			{
				arr[i].selected = true;
			}
			
			graphic = null;
		}
		
		if (Input.rightMouseDown)
		{
			for (i in 0...arr.length)
			{
				arr[i].target = new Vector(Input.mouseX,Input.mouseY);
			}
		}
		
		super.update();
	}

}
