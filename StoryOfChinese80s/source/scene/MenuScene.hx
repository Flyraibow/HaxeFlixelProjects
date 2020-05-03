package scene;

import flixel.FlxSprite;
import flixel.FlxState;
import flixel.ui.FlxSpriteButton;
import flixel.FlxG;
import myUI.MyLabel;
import myUI.MyButton;
import language.LanguageData;

class MenuScene extends FlxState {
	override public function create() {
		super.create();
		var background = new FlxSprite(0, 0, AssetPaths.menuScene__png);
		add(background);

		var title = new MyLabel(new LanguageData("80后的故事"), 128);
		title.x = FlxG.width * 0.1;
		title.y = FlxG.height * 0.2;
        add(title);
        
        var startButton = new MyButton(new LanguageData("开始游戏"), onClickSettings, 48);
		startButton.resize(200, 80);
		startButton.x = FlxG.width * 0.1;
		startButton.y = FlxG.height * 0.46;
        add(startButton);
        
        var settingButton = new MyButton(new LanguageData("设置"), onClickSettings, 48);
		settingButton.resize(200, 80);
		settingButton.x = FlxG.width * 0.1;
		settingButton.y = FlxG.height * 0.58;
		add(settingButton);

		#if desktop
		var exitButton = new MyButton(new LanguageData("退出"), clickExit, 48);
		exitButton.resize(200, 80);
		exitButton.x = FlxG.width * 0.1;
		exitButton.y = FlxG.height * 0.7;
		add(exitButton);
		#end
	}

	override public function update(elapsed:Float) {
		super.update(elapsed);
	}

	#if desktop
	function clickExit() {
		Sys.exit(0);
	}
	#end

	function onClickSettings() {
		trace("onClickSettings");
	}
}
