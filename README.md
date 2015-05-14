# FileChooser Air Native Extension (Android)
FileChooser is a very easy to work extension to let you choose a file from your sdcard to be able to use it inside your Air project. you can use the choose method and pass the type of file you need by passing its mimetype. **(*/*)** for example means any file in any extension! but **(image/**)* means any image file while **(image/png)** means any png image file!

depending on the Android version of the target device, this extension will work differently to make sure it is using the latest features of the currently running Android! try it right now and run it on different devices to see how easy and straight forward it is.

This ANE has been built based on https://github.com/iPaulPro/aFileChooser

#AS3 USAGE
```actionscript
import com.doitflash.air.extensions.fileChooser.FileChooser
import com.doitflash.air.extensions.fileChooser.FileChooserEvent;

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

Enjoy,
MyFlashLab Team

Find more extensions at http://www.myappsnippet.com