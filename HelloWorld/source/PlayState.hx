package;

import flixel.ui.FlxSpriteButton;
import flixel.addons.ui.FlxUIButton;
import flixel.FlxG;
import flixel.FlxState;
import flixel.util.FlxColor;
import myUI.SimpleTextButton;

class PlayState extends FlxState {
	override public function create() {
		super.create();

		var text = new flixel.text.FlxText(0, 0, 0, "你好，世界", 64);
		text.setFormat(AssetPaths.HanyiSentySuciTablet__ttf, 64);
		text.screenCenter();
		add(text);

		var btnSetting1:SimpleTextButton = new SimpleTextButton(200, 50, "好的", onClickSetting, 40);
		add(btnSetting1);

		var btnSetting:FlxUIButton = new FlxUIButton(100, 100,"设置", onClickSetting);
		btnSetting.setLabelFormat(AssetPaths.HanyiSentySuciTablet__ttf, 30,FlxColor.BLACK);
		btnSetting.resize(100, 50);
		add(btnSetting);

		#if desktop
		var  exitButton = new FlxSpriteButton(FlxG.width - 28, 8, null, clickExit);
		exitButton.createTextLabel("X");
		add(exitButton);
		#end
	}

	override public function update(elapsed:Float) {
		super.update(elapsed);
	}

	function onClickSetting() {
		FlxG.camera.fade(FlxColor.BLACK, 0.33, false, function() {
			FlxG.switchState(new SettingState());
		});
		trace("clicked");
	}
	
	#if desktop
	function clickExit()
	{
		Sys.exit(0);
	}
	#end
}
