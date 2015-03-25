import com.haxepunk.Engine;
import com.haxepunk.HXP;
import com.haxepunk.utils.Input;
import com.haxepunk.utils.Key;
import com.grapefrukt.utils.Toggler;

import flash.display.Shape;

class Main extends Engine
{
	var t:Toggler;
	var grid:Shape = new Shape();
	
	override public function init()
	{
		
#if debug
		HXP.console.enable();
	//t = new Toggler(Settings,true,300);
	//	t.x = HXP.width - 400;
	//	this.addChild(t);
#end

		HXP.scene = new Scene1();
		HXP.screen.color = 0x8ac2de;
		/*
		addChild(grid);
		for(i in 0...Math.round(HXP.height/102))
		{
			grid.graphics.lineStyle(1,0xff0000);
			grid.graphics.moveTo(0,i*102);
			grid.graphics.lineTo(HXP.width,i*102);
		}
		for(i in 0...Math.round(HXP.width/102))
		{
			grid.graphics.lineStyle(1,0xff0000);
			grid.graphics.moveTo(i*102,0);
			grid.graphics.lineTo(i*102,HXP.height);
		}*/
	}
	
	public static function main() { new Main(); }
	
	override public function update()
	{
		if(Input.pressed(Key.R)) scene = new Scene1();
		
		super.update();
	}
	
}