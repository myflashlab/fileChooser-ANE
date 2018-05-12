package 
{
import com.myflashlab.air.extensions.dependency.OverrideAir;
import com.myflashlab.air.extensions.fileChooser.FileChooser
	import com.myflashlab.air.extensions.fileChooser.FileChooserEvent;
	import com.myflashlab.air.extensions.nativePermissions.PermissionCheck;
	
	import flash.display.Bitmap;
	import flash.display.Loader;
	import flash.geom.Rectangle;
	import flash.net.URLRequest;
	import flash.utils.setTimeout;
	
	import com.doitflash.consts.Direction;
	import com.doitflash.consts.Orientation;
	
	import com.doitflash.mobileProject.commonCpuSrc.DeviceInfo;
	
	import com.doitflash.starling.utils.list.List;
	
	import com.doitflash.text.modules.MySprite;
	
	import com.doitflash.tools.sizeControl.FileSizeConvertor;
	
	import com.luaye.console.C;
	
	import flash.desktop.NativeApplication;
	import flash.desktop.SystemIdleMode;
	
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	
	import flash.events.Event;
	import flash.events.StatusEvent;
	import flash.events.InvokeEvent;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	
	import flash.filesystem.File;
	
	import flash.text.AntiAliasType;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;
	
	import flash.ui.Keyboard;
	import flash.ui.Multitouch;
	import flash.ui.MultitouchInputMode;
	
	/**
	 * 
	 * @author Hadi Tavakoli - 5/13/2015 5:48 PM
	 */
	public class MainFinal extends Sprite 
	{
		private var _ex:FileChooser;
		private var _exPermissions:PermissionCheck = new PermissionCheck();
		
		private const BTN_WIDTH:Number = 150;
		private const BTN_HEIGHT:Number = 60;
		private const BTN_SPACE:Number = 2;
		private var _txt:TextField;
		private var _body:Sprite;
		private var _list:List;
		private var _numRows:int = 1;
		
		public function MainFinal():void 
		{
			OverrideAir.enableDebugger(myDebuggerDelegate);
			
			Multitouch.inputMode = MultitouchInputMode.GESTURE;
			NativeApplication.nativeApplication.addEventListener(Event.ACTIVATE, handleActivate);
			NativeApplication.nativeApplication.addEventListener(Event.DEACTIVATE, handleDeactivate);
			NativeApplication.nativeApplication.addEventListener(InvokeEvent.INVOKE, onInvoke);
			NativeApplication.nativeApplication.addEventListener(KeyboardEvent.KEY_DOWN, handleKeys);
			
			stage.addEventListener(Event.RESIZE, onResize);
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.align = StageAlign.TOP_LEFT;
			
			C.startOnStage(this, "`");
			C.commandLine = false;
			C.commandLineAllowed = false;
			C.x = 100;
			C.width = 500;
			C.height = 250;
			C.strongRef = true;
			C.visible = true;
			C.scaleX = C.scaleY = DeviceInfo.dpiScaleMultiplier;
			
			_txt = new TextField();
			_txt.autoSize = TextFieldAutoSize.LEFT;
			_txt.antiAliasType = AntiAliasType.ADVANCED;
			_txt.multiline = true;
			_txt.wordWrap = true;
			_txt.embedFonts = false;
			_txt.htmlText = "<font face='Arimo' color='#333333' size='20'><b>File Chooser V" + FileChooser.VERSION + " for adobe air</b></font>";
			_txt.scaleX = _txt.scaleY = DeviceInfo.dpiScaleMultiplier;
			this.addChild(_txt);
			
			_body = new Sprite();
			this.addChild(_body);
			
			_list = new List();
			_list.holder = _body;
			_list.itemsHolder = new Sprite();
			_list.orientation = Orientation.VERTICAL;
			_list.hDirection = Direction.LEFT_TO_RIGHT;
			_list.vDirection = Direction.TOP_TO_BOTTOM;
			_list.space = BTN_SPACE;
			
			checkPermissions();
		}
		
		private function myDebuggerDelegate($ane:String, $class:String, $msg:String):void
		{
			trace("\t"+$ane+": "+$msg);
		}
		
		private function onInvoke(e:InvokeEvent):void
		{
			NativeApplication.nativeApplication.removeEventListener(InvokeEvent.INVOKE, onInvoke);
		}
		
		private function handleActivate(e:Event):void 
		{
			NativeApplication.nativeApplication.systemIdleMode = SystemIdleMode.KEEP_AWAKE;
		}
		
		private function handleDeactivate(e:Event):void 
		{
			NativeApplication.nativeApplication.systemIdleMode = SystemIdleMode.NORMAL;
		}
		
		private function handleKeys(e:KeyboardEvent):void
		{
			if(e.keyCode == Keyboard.BACK)
            {
				e.preventDefault();
				
				NativeApplication.nativeApplication.exit();
            }
		}
		
		private function onResize(e:*=null):void
		{
			if (_txt)
			{
				_txt.width = stage.stageWidth * (1 / DeviceInfo.dpiScaleMultiplier);
				
				C.x = 0;
				C.y = _txt.y + _txt.height + 0;
				C.width = stage.stageWidth * (1 / DeviceInfo.dpiScaleMultiplier);
				C.height = 300 * (1 / DeviceInfo.dpiScaleMultiplier);
			}
			
			if (_list)
			{
				_numRows = Math.floor(stage.stageWidth / (BTN_WIDTH * DeviceInfo.dpiScaleMultiplier + BTN_SPACE));
				_list.row = _numRows;
				_list.itemArrange();
			}
			
			if (_body)
			{
				_body.y = stage.stageHeight - _body.height;
			}
		}
		
		private function checkPermissions():void
		{
			// first you need to make sure you have access to the Strorage if you are on Android?
			var permissionState:int = _exPermissions.check(PermissionCheck.SOURCE_STORAGE);
			
			if (permissionState == PermissionCheck.PERMISSION_UNKNOWN || permissionState == PermissionCheck.PERMISSION_DENIED)
			{
				_exPermissions.request(PermissionCheck.SOURCE_STORAGE, onRequestResult);
			}
			else
			{
				init();
			}
			
			function onRequestResult($state:int):void
			{
				if ($state != PermissionCheck.PERMISSION_GRANTED)
				{
					C.log("You did not allow the app the required permissions!");
				}
				else
				{
					init();
				}
			}
		}
		
		private function init(e:Event=null):void
		{
			_ex = new FileChooser();
			_ex.addEventListener(FileChooserEvent.RESULT, onResult);
			_ex.addEventListener(FileChooserEvent.ERROR, onError);
			
			var btn1:MySprite = createBtn("select image!");
			btn1.addEventListener(MouseEvent.CLICK, selectImage);
			_list.add(btn1);
			
			function selectImage(e:MouseEvent):void
			{
				/**
				 * 	you may optionally resize the selected image while keeping the aspect ratio. if so, you can simply
				 * 	pass an object like {width:500, height:500, quality:50} as the third parameter. The extension will 
				 * 	generate a new jpg file with the max size width/height dimensions while keeping the image aspect ratio.
				 * 	
				 * 	if you wish to use the original image, you can simply remove this third parameter or pass null.
				 * 	
				 * 	NOTICE: you must use the resizing object when you are selecting an image file ONLY. trying this object
				 * 	on other file formats will crash the app of course.
				 */
				
				// to return the original image only
				//_ex.choose("image/*", "pick an image!");
				
				// to return the original and a resized image
				_ex.choose("image/*", "pick an image!", {width:500, height:500, quality:50});
			}
			
			// -------------------------
			
			var btn2:MySprite = createBtn("select file!"); // NOT SUPPORTED ON iOS
			btn2.addEventListener(MouseEvent.CLICK, selectFile);
			if(_ex.os != FileChooser.IOS) _list.add(btn2);
			
			function selectFile(e:MouseEvent):void
			{
				_ex.choose("*/*", "pick a file!");
			}
			
			// -------------------------
			
			var btn3:MySprite = createBtn("select video!"); // NOT SUPPORTED ON iOS
			btn3.addEventListener(MouseEvent.CLICK, selectVideo);
			if(_ex.os != FileChooser.IOS)_list.add(btn3);
			
			function selectVideo(e:MouseEvent):void
			{
				_ex.choose("video/*", "pick a video!");
			}
			
			// -------------------------
			
			var btn4:MySprite = createBtn("select text file!"); // NOT SUPPORTED ON iOS
			btn4.addEventListener(MouseEvent.CLICK, selectText);
			if(_ex.os != FileChooser.IOS)_list.add(btn4);
			
			function selectText(e:MouseEvent):void
			{
				_ex.choose("text/*", "pick a text file!");
			}
			
			onResize();
		}
		
		private function onResult(e:FileChooserEvent):void
		{
			var originalFile:File = e.param.original;
			
			C.log("original file.name = " + originalFile.name);
			C.log("original file.extension = " + originalFile.extension);
			C.log("original file.size = " + FileSizeConvertor.size(originalFile.size));
			C.log("");
			
			// e.param.resized is only available if you are picking an image and have specified the resize object for it.
			var resizedFile:File = e.param.resized;
			if (resizedFile) 
			{
				C.log("resized file.name = " + resizedFile.name);
				C.log("resized file.extension = " + resizedFile.extension);
				C.log("resized file.size = " + FileSizeConvertor.size(resizedFile.size));
				C.log("resized path = " + resizedFile.url);
				
			}
			
			C.log("------------------------------");
			
		}
		
		private function onError(e:FileChooserEvent):void
		{
			C.log("onError = " + e.param);
		}
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		private function createBtn($str:String):MySprite
		{
			var sp:MySprite = new MySprite();
			sp.addEventListener(MouseEvent.MOUSE_OVER,  onOver);
			sp.addEventListener(MouseEvent.MOUSE_OUT,  onOut);
			sp.addEventListener(MouseEvent.CLICK,  onOut);
			sp.bgAlpha = 1;
			sp.bgColor = 0xDFE4FF;
			sp.drawBg();
			sp.width = BTN_WIDTH * DeviceInfo.dpiScaleMultiplier;
			sp.height = BTN_HEIGHT * DeviceInfo.dpiScaleMultiplier;
			
			function onOver(e:MouseEvent):void
			{
				sp.bgAlpha = 1;
				sp.bgColor = 0xFFDB48;
				sp.drawBg();
			}
			
			function onOut(e:MouseEvent):void
			{
				sp.bgAlpha = 1;
				sp.bgColor = 0xDFE4FF;
				sp.drawBg();
			}
			
			var format:TextFormat = new TextFormat("Arimo", 16, 0x666666, null, null, null, null, null, TextFormatAlign.CENTER);
			
			var txt:TextField = new TextField();
			txt.autoSize = TextFieldAutoSize.LEFT;
			txt.antiAliasType = AntiAliasType.ADVANCED;
			txt.mouseEnabled = false;
			txt.multiline = true;
			txt.wordWrap = true;
			txt.scaleX = txt.scaleY = DeviceInfo.dpiScaleMultiplier;
			txt.width = sp.width * (1 / DeviceInfo.dpiScaleMultiplier);
			txt.defaultTextFormat = format;
			txt.text = $str;
			
			txt.y = sp.height - txt.height >> 1;
			sp.addChild(txt);
			
			return sp;
		}
	}
	
}