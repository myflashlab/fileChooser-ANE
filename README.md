# FileChooser ANE V4.0.2 (Android+iOS)
FileChooser is a very easy to work with extension and lets you choose a file from your device and use it inside your Air project. you can use the choose method and pass the type of file you need by passing its mimetype. * / * for example means any file with any mimetype! but image/* means any image file while image/png means any png image file! on iOS, due to the OS limitations, no matter what input you set, it will allow you to pick images only at the moment. (in future versions, we will support picking video files on iOS too)

This extension can also optionally resize the picked image as fast as a few milliseconds for you so you don't have to load a huge image into your app!

# asdoc
[find the latest asdoc for this ANE here.](http://myflashlab.github.io/asdoc/com/myflashlab/air/extensions/fileChooser/package-detail.html)

# Demo .apk
you may like to see the ANE in action? [Download demo .apk](https://github.com/myflashlab/fileChooser-ANE/tree/master/FlashDevelop/dist)

**NOTICE**: the demo ANE works only after you hit the "OK" button in the dialog which opens. in your tests make sure that you are NOT calling other ANE methods prior to hitting the "OK" button.
[Download the ANE](https://github.com/myflashlab/fileChooser-ANE/tree/master/FlashDevelop/lib)

# Air Usage
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

# Air .xml manifest
```xml
<activity android:name="com.doitflash.fileBrowser.Chooser" android:theme="@style/Theme.Transparent" />
```

on the ios side, make sure to set the min iOS version to 7.1
```xml
<key>MinimumOSVersion</key>
<string>7.1</string>
```

# Requirements
* Android SDK 10 or higher
* iOS 7.1 or higher

# Commercial Version
http://www.myflashlabs.com/product/file-image-pick-ane-adobe-air-native-extension/

![file picker ANE](http://www.myflashlabs.com/wp-content/uploads/2015/11/product_adobe-air-ane-extension-file-or-image-picker-595x738.jpg)

# Tech Details
depending on the Android version of the target device, this extension will work differently to make sure it is using the latest features of the currently running Android! try it right now and run it on different devices to see how easy and straight forward it is.

on the iOS side, the extension will open the native ImagePicker lib which is basically the same on all different iOS versions.

You also have the option to resize the images because in a real life scenario you surely don't want to load a big image like 5MB into your app, right? Although you can resize the picked image in flash and maybe with using threads (Actionscript workers) but it will be a VERY slow process. so we decided to put a native image scaler inside the ```choose``` method to scale down the selected image with keeping the aspect ratio untouched. This will make working with this extension very exceptional.

# Changelog
*Feb 07, 2016 - V4.0.2*
* Fixed missing onError dispatch on Android platform when no file was selected by the user


*Feb 04, 2016 - V4.0.1*
* Fixed resizing/scaling of images in Android and iOS


*Jan 21, 2016 - V4.0.0*
* Now you can optionally resize an image with native speed as soon as you pick an image. simply pass in an object like this _ex.choose("image/*", "pick an image!", {width:500, height:500, quality:50});
* bypassing xCode 7.2 bug causing iOS conflict when compiling with AirSDK 20 without waiting on Adobe or Apple to fix the problem. This is a must have upgrade for your app to make sure you can compile multiple ANEs in your project with AirSDK 20 or greater. https://forums.adobe.com/thread/2055508 https://forums.adobe.com/message/8294948


*Dec 20, 2015 - V3.9.1*
* minor bug fixes


*Nov 03, 2015 - V3.9*
* doitflash devs merged into MyFLashLab Team


*Oct 15, 2015 - V3.0*
* Added iOS support (for picking images only at the moment)


*May 06, 2013 - V1.0*
* beginning of the journey!