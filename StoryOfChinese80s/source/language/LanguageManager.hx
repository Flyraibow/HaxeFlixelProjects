package language;

import myUI.DefaultUI;
import flixel.util.FlxSave;
import haxe.Json;
import openfl.Assets;

class LanguageManager {
	private static var DefaultLanguage:String = "ch";

	public static final instance:LanguageManager = new LanguageManager();

	private var _currLanguage:String;
    private var _currmap:Map<String, String>;

    private function new() {
		var savedData:FlxSave = new FlxSave();
		savedData.bind("Language");
		var language:String = savedData.data;
		if (language == null) {
			language = DefaultLanguage;
		}
		setLanguage(language);
	}

	public function setLanguage(language:String):Void {
		_currLanguage = language;
	}

	public function parse(data:LanguageData):String {
		if (_currLanguage != DefaultLanguage) {
			if (_currLanguage == "en") {
				loadLanguageIfNecessary();
				if (_currmap.exists(data.text())) {
					return _currmap[data.text()];
				}
			}
		}
		return data.text();
	}

	private function loadLanguageIfNecessary() {
		if (_currmap != null) {
			return;
		}
		var path:String;
		if (_currLanguage == "en") {
			path = Assets.getText(AssetPaths.en__json);
		} else {
			return;
		}
		var parse = haxe.Json.parse(path);
		_currmap = new Map();
		for (field in Reflect.fields(parse)) {
			_currmap.set(field, Reflect.field(parse, field));
		}
	}

	public function updateLanguageForUI(ui:LanguageProtocol):Void {
		ui.font = DefaultUI.Font;
		ui.text = parse(ui.getTextData());
	}
}
