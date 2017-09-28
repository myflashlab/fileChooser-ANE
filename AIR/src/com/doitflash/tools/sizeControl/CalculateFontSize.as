package com.doitflash.tools.sizeControl 
{
	import com.doitflash.starling.TextArea;
	import flash.text.TextFormat;
	import flash.text.TextFieldAutoSize;
	import flash.text.AntiAliasType;
	
	/**
	 * ...
	 * @author Majid Hejazi 8/7/2013 12:33 PM
	 */
	public class CalculateFontSize 
	{
		
		public function CalculateFontSize() 
		{
			
		}
		
		public static function fontSize($text:String, $font:String, $width:int):int
		{
			var fontSize:int;
			
			var _text:TextArea = new TextArea();
			_text.txt.autoSize = TextFieldAutoSize.LEFT;
			_text.txt.antiAliasType = AntiAliasType.ADVANCED;
			_text.txt.embedFonts = true;
			var i:int = 120;
			
			for (i = 120; i > 0; i--) 
			{
				_text.txt.htmlText = "<font face=\"" + $font + "\" size=\"" + i + "\">" + $text +"</font>";
				if (_text.txt.width < $width)
				{
					fontSize = i;
					break;
				}
			}
			
			return fontSize;
		}
		
		public static function fontSizeByWH($text:String, $font:String, $width:int, $height:int):int
		{
			var fontSize:int;
			var fontSizeW:int;
			var fontSizeH:int;
			
			var _text:TextArea = new TextArea();
			_text.txt.autoSize = TextFieldAutoSize.LEFT;
			_text.txt.antiAliasType = AntiAliasType.ADVANCED;
			_text.txt.embedFonts = true;
			var i:int = 120;
			
			for (i = 120; i > 0; i--) 
			{
				_text.txt.htmlText = "<font face=\"" + $font + "\" size=\"" + i + "\">" + $text +"</font>";
				if (_text.txt.width < $width)
				{
					fontSizeW = i;
					break;
				}
			}
			
			for (i = 120; i > 0; i--) 
			{
				_text.txt.htmlText = "<font face=\"" + $font + "\" size=\"" + i + "\">" + $text +"</font>";
				if (_text.txt.height < $height)
				{
					fontSizeH = i;
					break;
				}
			}
			
			fontSize = Math.min(fontSizeW, fontSizeH);
			
			return fontSize;
		}
		
	}

}