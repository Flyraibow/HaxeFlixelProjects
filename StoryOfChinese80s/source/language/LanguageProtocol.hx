package language;

interface LanguageProtocol {
    public var text(default, set):String;

    public var font(get, set):String;

    public var size(get, set):Int;

    public function getTextData() : LanguageData;
}