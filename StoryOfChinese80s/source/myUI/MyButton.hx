package myUI;

import language.LanguageManager;
import language.LanguageProtocol;
import language.LanguageData;
import flixel.addons.ui.FlxUIButton;

class MyButton extends FlxUIButton implements LanguageProtocol {
	private var _textData:LanguageData;

	public function new(textData:LanguageData, ?OnClick:Void->Void, ?fontSize:Int = 16) {
        super(0, 0, "", OnClick);
        _textData = textData;
        this.size = fontSize;

        LanguageManager.instance.updateLanguageForUI(this);
    }
    
    public var text(default, set):String;

    public var font(get, set):String;

    public var size(get, set):Int;
    
    public function getTextData():LanguageData {
        return _textData;
    }

    public function setTextData(textData:LanguageData) : Void {
        _textData = textData;
        LanguageManager.instance.updateLanguageForUI(this);
    }

	inline function get_size():Int {
		return this.label.size;
	}

	inline function set_size(size:Int):Int {
        this.label.size = size;
		return size;
	}

	inline function set_font(font:String):String {
		this.label.font = font;
		return font;
	}

	inline function get_font():String {
		return this.label.font;
    }
    
	inline function get_Text():String {
		return this.label.text;
	}

	inline function set_text(text:String):String {
        this.label.text = text;
		return text;
	}
}
