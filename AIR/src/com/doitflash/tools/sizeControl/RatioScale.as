/*

import com.doitflash.tools.sizeControl.RatioScale;

var _resizedArray:Array = RatioScale.toResize([myWidth, myHeight], [maxWidth, maxHeight]);

*/
package com.doitflash.tools.sizeControl
{
	public class RatioScale
	{
		
		public function RatioScale():void
		{
			
		}
		
		public static function toResize($income:Array, $perfect:Array, $biggerScale:Boolean = false):Array
		{
			// save the incoming details
			var _incomeW:Number = $income[0];
			var _incomeH:Number = $income[1];
			
			var _perfectW:Number = $perfect[0];
			var _perfectH:Number = $perfect[1];
			
			var _finalW:Number;
			var _finalH:Number;
			
			if ($biggerScale)
			{
				if(_incomeH > _incomeW)
				{
					// analyze the perfect width
					_finalW = _incomeW*_perfectH/_incomeH;
					
					// set the perfect width and perfect height
					_incomeW = _finalW;
					_incomeH = _perfectH;
				}
				else if(_incomeW > _incomeH)
				{
					if (_perfectW >= _perfectH)
					{
						if (_incomeW >= _perfectW)
						{
							// analyze the perfect height
							_finalH = _incomeH*_perfectW/_incomeW;
							
							// set the perfect width and perfect height
							_incomeW = _perfectW;
							_incomeH = _finalH;
						}
						else
						{
							// analyze the perfect width
							_finalW = _incomeW * _perfectH / _incomeH;
							
							// set the perfect width and perfect height
							_incomeW = _finalW;
							_incomeH = _perfectH;
						}
					}
					else if (_perfectW < _perfectH)
					{
						// analyze the perfect height
						_finalH = _incomeH*_perfectW/_incomeW;
						
						// set the perfect width and perfect height
						_incomeW = _perfectW;
						_incomeH = _finalH;
					}
				}
				else if (_incomeW == _incomeH)
				{
					if (_perfectW > _perfectH)
					{
						// analyze the perfect height
						_finalH = _incomeH * _perfectW / _incomeW;
						
						// set the perfect width and perfect height
						_incomeW = _perfectW;
						_incomeH = _finalH;
					}
					else if (_perfectW < _perfectH)
					{
						// analyze the perfect width
						_finalW = _incomeW*_perfectH/_incomeH;
						
						// set the perfect width and perfect height
						_incomeW = _finalW;
						_incomeH = _perfectH;
					}
					else
					{
						_incomeW = _perfectW;
						_incomeH = _perfectH;
					}
				}
			}
			else
			{
				if (!_perfectW || !_perfectH)
				{
					if (!_perfectW)
					{
						// analyze the perfect width
						_finalW = _incomeW * _perfectH / _incomeH;
						
						// set the perfect width and perfect height
						_incomeW = _finalW;
						_incomeH = _perfectH;
					}
					else if (!_perfectH)
					{
						// analyze the perfect height
						_finalH = _incomeH*_perfectW/_incomeW;
						
						// set the perfect width and perfect height
						_incomeW = _perfectW;
						_incomeH = _finalH;
					}
				}
				else
				{
					// start calculating
					if(_incomeH > _incomeW && _incomeH > _perfectH)
					{
						// analyze the perfect width
						_finalW = _incomeW*_perfectH/_incomeH;
						
						// set the perfect width and perfect height
						_incomeW = _finalW;
						_incomeH = _perfectH;
					}
					else if(_incomeW > _incomeH && _incomeW > _perfectW)
					{
						// analyze the perfect height
						_finalH = _incomeH*_perfectW/_incomeW;
						
						// set the perfect width and perfect height
						_incomeW = _perfectW;
						_incomeH = _finalH;
					}
					else if(_incomeW == _incomeH && _incomeW > _perfectH)
					{
						// set the perfect width and perfect height
						_incomeW = _perfectH;
						_incomeH = _perfectH;
					}
					else if(_incomeW == _incomeH && _incomeH > _perfectW)
					{
						// set the perfect width and perfect height
						_incomeW = _perfectW;
						_incomeH = _perfectW;
					}
				}
			}
			
			// set the output
			var outPut:Array = [_incomeW, _incomeH]
			return outPut;
		}
	}
}