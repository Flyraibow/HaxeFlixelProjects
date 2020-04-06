package myUI;

import flixel.addons.ui.FlxUIButton;

import flash.display.BitmapData;
import flash.geom.Point;
import flash.geom.Rectangle;
import flash.text.Font;
import flash.text.TextFormat;
import flixel.addons.ui.BorderDef;
import flixel.addons.ui.FontDef;
import flixel.addons.ui.interfaces.IFlxUIButton;
import flixel.addons.ui.interfaces.IHasParams;
import flixel.addons.ui.interfaces.ILabeled;
import flixel.FlxSprite;
import flixel.math.FlxMath;
import flixel.system.FlxAssets;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.util.FlxDestroyUtil;
import openfl.Assets;
import openfl.text.TextFormatAlign;
/**
 * A simple button class that calls a function when clicked by the mouse.
 */
class SimpleTextButton extends FlxUIButton {
	private static var DefaultFont:String = AssetPaths.HanyiSentySuciTablet__ttf;

	/**
	 * Creates a new FlxButton object with a gray background
	 * and a callback function on the UI thread.
	 *
	 * @param   Text      The text that you want to appear on the button.
	 * @param   OnClick   The function to call whenever the button is clicked.
	 */
	/**
	 * Creates a new FlxUIButton.
	 *
	 * @param	X			The X position of the button.
	 * @param	Y			The Y position of the button.
	 * @param	Label		The text that you want to appear on the button.
	 * @param	OnClick		The function to call whenever the button is clicked.
	 * @param	LoadDefaultGraphics	By default it will load up with placeholder graphics. Pass false if you want to skip this (i.e. if you will provide your own graphics subsequently, can save time)
	 * @param	LoadBlank	Load this button without ANY visible graphics, but still functions (in case you need an invisible click area)
	 */
	public function new(X:Float = 0, Y:Float = 0, ?Label:String, ?OnClick:Void->Void, ?FontSize:Int = 8, ?TextColor:FlxColor = FlxColor.BLACK,
			?Color:FlxColor = FlxColor.WHITE) {
		super(X, Y, Label, OnClick, null, null, Color);

		setLabelFormat(DefaultFont, FontSize, TextColor);
	}

	/**
	 * You can use this if you have a lot of text parameters
	 * to set instead of the individual properties.
	 *
	 * @param	Font			The name of the font face for the text display.
	 * @param	Size			The size of the font (in pixels essentially).
	 * @param	Color			The color of the text in traditional flash 0xRRGGBB format.
	 * @param	Alignment		The desired alignment
	 * @param	BorderStyle		NONE, SHADOW, OUTLINE, or OUTLINE_FAST (use setBorderFormat)
	 * @param	BorderColor 	Int, color for the border, 0xRRGGBB format
	 * @param	EmbeddedFont	Whether this text field uses embedded fonts or not
	 * @return	This FlxText instance (nice for chaining stuff together, if you're into that).
	 */
	override public function setLabelFormat(?Font:String, Size:Int = 8, Color:FlxColor = FlxColor.WHITE, ?Alignment:FlxTextAlign,
			?BorderStyle:FlxTextBorderStyle, BorderColor:FlxColor = FlxColor.TRANSPARENT, Embedded:Bool = true):FlxText {
		var text: FlxText = super.setLabelFormat(Font, Size, Color, Alignment, BorderStyle, BorderColor, Embedded);
		// auto resize the button
		resize(text.width, text.height);
		return text;
	}
}
