import com.haxepunk.HXP;
import com.haxepunk.Entity;
import com.haxepunk.graphics.Image;
import com.haxepunk.utils.Input;
import com.haxepunk.math.Vector;
import flash.geom.Rectangle;

/**
 * ...
 * @author aske
 */
class Dude extends Entity
{
	
	public var spr:Image = new Image("assets/sheet_1.png", new Rectangle(102,0,25,45));
	public var speed:Float = 3.2;
	public var target:Vector;
	public var selected:Bool = false;
	
	public function new ()
	{
		super();
		
		
		graphic = spr;
		
		this.setHitbox(8,8,4,8);
		spr.originX = 12;
		spr.originY = 41;
		
		type = "dude";
		
	}		
	
	override public function update()
	{
/*		if ( Input.mousePressed ) 
		{
			if(target == null) target = new Vector(0,0);
			target.x = Input.mouseX;
			target.y = Input.mouseY;
		}*/
		moveToTarget();
		
		if (selected) spr.color = 0xf3452e;
		else spr.color = 0xffffff;
		
		this.layer = -Math.round(y);
	}
	
	function moveLeft()
	{
		if( collide("platform",x + this.width + speed,y) != null) x += speed;
	}
	
	function moveRight()
	{
		if( collide("platform",x - this.width - speed,y) != null) x -= speed;
	}
	
	function moveDown()
	{
		if( collide("platform",x, y + this.height + speed) != null) y += speed;
	}
	
	function moveUp()
	{
		if( collide("platform",x, y - this.height - speed) != null) y -= speed;
	}
	
	function moveToTarget()
	{
		if (target == null) return;
		
		var a:Float = HXP.angle(x,y,target.x,target.y);
		var sx:Float = Math.cos(a * HXP.RAD) *speed;
		var sy:Float = Math.sin(a * HXP.RAD) *speed;
		
		
		if (HXP.distance(x,y,target.x,target.y) < speed) 
		{
			x = target.x;
			y = target.y;
		}
		else
		{
			if( collide("platform",x + sx, y) != null && collide("dude",x + sx, y) == null) x +=  sx ;
			if( collide("platform",x, y + sy) != null && collide("dude",x, y + sy) == null) y +=  sy ;
			HXP.screen.shake(1,0.005);
		}
	}	

}
