# FileChooser ANE V4.0.0 (Android+iOS)
FileChooser is a very easy to work extension to let you choose a file from your sdcard to be able to use it inside your Air project. you can use the choose method and pass the type of file you need by passing its mimetype. * / * for example means any file in any extension! but image/* means any image file while image/png means any png image file! on iOS, due to the OS limitations, no matter what input you set, it will allow you to pick images only at the moment. (in future versions, we will support picking video files on iOS too)

depending on the Android version of the target device, this extension will work differently to make sure it is using the latest features of the currently running Android! try it right now and run it on different devices to see how easy and straight forward it is.

on the iOS side, the extension will open the native ImagePicker lib which is basically the same on all different iOS versions.

checkout here for the commercial version: http://www.myflashlabs.com/product/file-image-pick-ane-adobe-air-native-extension/

![file picker ANE](http://www.myflashlabs.com/wp-content/uploads/2015/11/product_adobe-air-ane-extension-file-or-image-picker-595x738.jpg)

#AS3 USAGE
```actionscript
import com.myflashlab.air.extensions.fileChooser.FileChooser
import com.myflashlab.air.extensions.fileChooser.FileChooserEvent;

var _ex:FileChooser = new FileChooser();
_ex.addEventListener(FileChooserEvent.RESULT, onResult);
_ex.addEventListener(FileChooserEvent.ERROR, onError);

_ex.choose("*/*", "pick a file!");

function onResult(e:FileChooserEvent):void
{
	var file:File = e.param.original as File;
	trace("file.name = " + file.name);
	trace("file.extension = " + file.extension);
	trace("file.size = " + FileSizeConvertor.size(file.size));
	trace("------------------------------");
}

function onError(e:FileChooserEvent):void
{
	trace("onError = " + e.param);
}
```

and you also need to add the following activity to your manifest

```xml
<activity android:name="com.doitflash.fileBrowser.Chooser" android:theme="@style/Theme.Transparent" />
```

on the ios side, make sure to set the min iOS version to 7.1
```xml
<key>MinimumOSVersion</key>
<string>7.1</string>
```

# Changelog
* May 06, 2013	>> V1.0: 	beginning of the journey!
* Oct 15, 2015	>> V3.0:	Added iOS support (for picking images only at the moment)
* Nov 03, 2015	>> V3.9:	doitflash devs merged into MyFLashLab Team.
* Dec 20, 2015 	>> V3.9.1: 	minor bug fixes

* Jan 21, 2016	>> V4.0.0:	Now you can optionally resize an image with native speed as soon as you pick an image.
  *	simply pass in an object like this _ex.choose("image/*", "pick an image!", {width:500, height:500, quality:50});
  *	how you get the image path in FileChooserEvent.RESULT has also changed a bit as follow: 
		```// e.param.resized is only available if you are picking an image and have specified the resize object for it.
		private function onResult(e:FileChooserEvent):void
		{
			var originalFile:File = e.param.original;
			var resizedFile:File = e.param.resized;
		}```
  *							bypassing xCode 7.2 bug causing iOS conflict when compiling with AirSDK 20 without waiting on Adobe or Apple to fix the problem.
  *							This is a must have upgrade for your app to make sure you can compile multiple ANEs in your project with AirSDK 20 or greater.
  https://forums.adobe.com/thread/2055508
  https://forums.adobe.com/message/8294948