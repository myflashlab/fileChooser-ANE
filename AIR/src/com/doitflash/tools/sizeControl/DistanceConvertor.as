package com.doitflash.tools.sizeControl
{
	
	/**
	 * @private
	 * @author Hadi Tavakoli
	 */
	public class DistanceConvertor 
	{
		
		public function DistanceConvertor():void
		{
			
		}
		
		public static function distance($distance:Number):String
		{
			var results:String;
			
			var s:Array = ['m', 'Km', 'Mm'];
			var e:Number = Math.floor(Math.log($distance) / Math.log(1000));
			
			if(e < 1) results = ($distance / Math.pow(1000, Math.floor(e))).toFixed(0) + " " + s[e];
			else results = ($distance / Math.pow(1000, Math.floor(e))).toFixed(2) + " " + s[e];
			
			return results;
		}
	}
	
}