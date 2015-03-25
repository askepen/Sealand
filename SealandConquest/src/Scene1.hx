import com.haxepunk.Scene;
import com.haxepunk.HXP;
import com.haxepunk.Entity;


/**
 * ...
 * @author aske
 */
class Scene1 extends Scene
{
	
	
	 
	public function new () 
	{
		super();
		
		var p:PlatformTile = new PlatformTile();
		p.x = 200;
		p.y = 150;
		add(p);
		
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
