package language;

class LanguageData {
    private var _description : String;
    private var _text : String;
    public function new(defaultText: String, desc: String = "") {
        _text = defaultText;
        _description = desc;
    }

    public function text() : String {
        return  _text;
    }
}