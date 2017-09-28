package com.doitflash.tools.sizeControl
{
////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////// import classes
////////////////////////////////////////////////////////////////////////////////////
	//import flash.display.Sprite;
	//import flash.events.*;
	//import flash.net.*;
	
	//import com.luaye.console.C;
	
	/**
	 * Scaler is a class to create scale your abstract numbers, you can use it to resize your photos, videos... anything,
	 * it priveds you abstract numbers so that you can use them in any way that you'd like to.
	 * @author Ali Tavakoli - 7/13/2010 7:22 PM - modified by Hadi - 7/14/2010 12:47 AM
	 * @version 3.0
	 * 
	 * @example In this example you see how to use Scaler class to perfect your income numbers.
	 * 
	 * <listing version="3.0">
	 * import com.doitflash.tools.sizeControl.Scaler;
	 * 
	 * var _resizedArray:Array = Scaler.resize([myWidth, myHeight], [perfectWidth, perfectHeight], true, true);
	 * </listing>
	 */
	public class Scaler
	{
		public function Scaler():void 
		{
			// I'm ready
		}
		
		public static function resize($income:Array, $perfect:Array, $scaleBigger:Boolean = true, $scaleSmaller:Boolean = true):Array
		{
			var width:Number;
			var height:Number;
			var widthChecked:Boolean = false;
			var heightChecked:Boolean = false;
			
			if (!$scaleBigger) // if we didn't want to scale bigger
			{
				if ($income[0] < $perfect[0] && $income[1] < $perfect[1]) // if income is smaller dimensions, break
				{
					return $income;
				}
			}
			
			if (!$scaleSmaller) // if we didn't want to scale smaller
			{
				if ($income[0] > $perfect[0] && $income[1] > $perfect[1]) // if income is bigger dimensions, break
				{
					return $income;
				}
			}
			
			// example-> perfect:50X25, income:50X100 || perfect:50X25, income:60X100
			// example-> perfect:25X50, income:50X100 || perfect:25X50, income:60X100
			
			// example-> perfect:50X25, income:100X50 || perfect:50X25, income:100X60
			// example-> perfect:50X35, income:100X60 || perfect:50X35, income:100X80
			
			// example-> perfect:25X50, income:100X50 || perfect:25X50, income:100X60
			// example-> perfect:35X50, income:100X60 || perfect:35X50, income:100X80
			
			// example-> perfect:25X50, income:100X100 || perfect:25X50, income:100X100
			// example-> perfect:50X50, income:100X100 || perfect:50X50, income:100X100
			
			basedOnWidth();
			if (height > $perfect[1]) basedOnHeight(); // if perfection was wrong, do it again in other way this time
			
			
			function basedOnWidth():void
			{
				width = $perfect[0];
				height = $income[1] / ($income[0] / $perfect[0]); // Periodic Table-> $income[0] / ? = $perfect[0] / 1
			}
			function basedOnHeight():void
			{
				height = $perfect[1];
				width = $income[0] / ($income[1] / $perfect[1]); // Periodic Table-> $income[1] / ? = $perfect[1] / 1
			}
			
			
			return [width, height];
		}
		
		
		
		// this function is more understandable, but used unnecessary if staments
		/*public static function resize($income:Array, $perfect:Array, $scaleBigger:Boolean = true, $scaleSmaller:Boolean = true):Array
		{
			var width:Number;
			var height:Number;
			
			if (!$scaleBigger) // if we didn't want to scale bigger
			{
				if ($income[0] < $perfect[0] && $income[1] < $perfect[1]) // if income is smaller dimensions, break
				{
					return $income;
				}
			}
			
			if (!$scaleSmaller) // if we didn't want to scale smaller
			{
				if ($income[0] > $perfect[0] && $income[1] > $perfect[1]) // if income is bigger dimensions, break
				{
					return $income;
				}
			}
			
			
			if ($income[0] > $income[1]) // if width is bigger
			{
				basedOnWidth();
				
				// with dimensions like 100X80 we have to go with basedOnHeight()
				if (height > $perfect[1]) basedOnHeight();
				
			}
			else if ($income[0] < $income[1]) // if height is bigger
			{
				basedOnHeight();
				
				// with dimensions like 80X100 we have to go with basedOnWidth()
				if (width > $perfect[0]) basedOnWidth();
			}
			else if ($income[0] == $income[1])
			{
				// see which perfect dimension is smaller set income dimensions according to that one
				($perfect[1] >= $perfect[0]) ? basedOnWidth() : basedOnHeight();
			}
			
			
			function basedOnWidth():void
			{
				width = $perfect[0];
				height = $income[1] / ($income[0] / $perfect[0]); // Periodic Table-> $income[0] / ? = $perfect[0] / 1
			}
			function basedOnHeight():void
			{
				height = $perfect[1];
				width = $income[0] / ($income[1] / $perfect[1]); // Periodic Table-> $income[1] / ? = $perfect[1] / 1
			}
			
			
			return [width, height];
		}*/
	}
}