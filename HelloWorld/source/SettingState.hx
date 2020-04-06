package;

import flixel.ui.FlxButton;
import flixel.FlxG;
import flixel.FlxState;
import flixel.util.FlxAxes;
import flixel.util.FlxColor;
import flixel.util.FlxSave;

class SettingState extends FlxState {
	#if desktop
	var fullscreenButton:FlxButton;
	#end

	// a save object for saving settings
	var save:FlxSave;

	override public function create() {
		var btnConfirm:FlxButton = new FlxButton(100, 100, 'Close', onClickConfirm);
		btnConfirm.setSize(200, 50);
		add(btnConfirm);

		#if desktop
		fullscreenButton = new FlxButton(0, FlxG.height / 2, FlxG.fullscreen ? "FULLSCREEN" : "WINDOWED", clickFullscreen);
		fullscreenButton.screenCenter();
		add(fullscreenButton);
		#end

		// create and bind our save object to "flixel-tutorial"
		save = new FlxSave();
		save.bind("HelloWolrd");

		FlxG.camera.fade(FlxColor.BLACK, 0.33, true);

		super.create();
	}

	override public function update(elapsed:Float) {
		super.update(elapsed);
	}

	function onClickConfirm() {
		trace("confirmed");
		save.close();
		FlxG.camera.fade(FlxColor.BLACK, 0.33, false, function() {
			FlxG.switchState(new PlayState());
		});
	}

	#if desktop
	function clickFullscreen() {
		FlxG.fullscreen = !FlxG.fullscreen;
		var fullScreen =  FlxG.fullscreen;
		fullscreenButton.text = fullScreen ? "FULLSCREEN" : "WINDOWED";
		save.data.fullscreen = fullScreen;
		trace("full screen saved ", save.data.fullscreen);
	}
	#end
}
