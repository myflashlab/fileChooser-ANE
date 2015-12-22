# FileChooser ANE V3.9.1 (Android+iOS)
FileChooser is a very easy to work extension to let you choose a file from your sdcard to be able to use it inside your Air project. you can use the choose method and pass the type of file you need by passing its mimetype. * / * for example means any file in any extension! but image/* means any image file while image/png means any png image file! on iOS, no matter what input you set, it will allow you to pick images and videos.

depending on the Android version of the target device, this extension will work differently to make sure it is using the latest features of the currently running Android! try it right now and run it on different devices to see how easy and straight forward it is.

on the iOS side, the extension will open the native ImagePicker lib which is basically the same on all different iOS versions.

checkout here for the commercial version: http://www.myflashlabs.com/product/file-image-pick-ane-adobe-air-native-extension/

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
	var file:File = e.param as File;
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

Enjoy,
MyFlashLabs Team

Find more extensions at http://www.myflashlabs.com