package;

import flixel.FlxGame;
import openfl.display.Sprite;
import flixel.util.FlxSave;
import scene.MenuScene;
import language.LanguageManager;

class Main extends Sprite
{
	public function new()
	{
		var fullscreen = true;
		var savedData:FlxSave = new FlxSave();
		savedData.bind("GameSettings");
		var gameSettings:GameSettings = savedData.data;

		#if desktop
		trace("full screen?", gameSettings.fullscreen);
		if (gameSettings.fullscreen != null)
		{
			fullscreen = gameSettings.fullscreen;
		}
		#end

		super();
		addChild(new FlxGame(0, 0, MenuScene, 1, 60, 60, true, fullscreen));
	}
}
