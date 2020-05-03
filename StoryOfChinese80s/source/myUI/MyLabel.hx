package myUI;

import language.LanguageProtocol;
import language.LanguageData;
import language.LanguageManager;
import flixel.text.FlxText;

class MyLabel extends FlxText implements LanguageProtocol{
    private var _textData : LanguageData;
	public function new(textData:LanguageData, size:Int = 8) {
		super(0, 0, 0, "", size, true);
        _textData = textData;

        LanguageManager.instance.updateLanguageForUI(this);
	}

	public function getTextData():LanguageData {
        return _textData;
    }

    public function setTextData(textData:LanguageData) : Void {
        _textData = textData;
        LanguageManager.instance.updateLanguageForUI(this);
    }
}
