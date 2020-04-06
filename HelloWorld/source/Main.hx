package;

import flixel.FlxGame;
import openfl.display.Sprite;
import flixel.util.FlxSave;

class Main extends Sprite
{
	public function new()
	{
		var startFullscreen:Bool = false;
		var save:FlxSave = new FlxSave();
		save.bind("HelloWolrd");
		#if desktop
		trace("full screen?", save.data.fullscreen);
		if (save.data.fullscreen != null)
		{
			startFullscreen = save.data.fullscreen;
		}
		#end
		super();
		addChild(new FlxGame(0, 0, PlayState, 1, 60, 60, true, startFullscreen));
	}
}
