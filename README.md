# FileChooser ANE V4.1.6 (Android+iOS)
FileChooser is a very easy to work with extension and lets you choose a file from your device and use it inside your AIR project. you can use the choose method and pass the type of file you need by passing its mimetype. \*/\* for example means any file with any mimetype! but image/\* means any image file while image/png means any png image file! on iOS, due to the OS limitations, no matter what input you set, it will allow you to pick images only at the moment. (in future versions, we will support picking video files on iOS too)

This extension can also optionally resize the picked image as fast as a few milliseconds for you so you don't have to load a huge image into your app!

# asdoc
[find the latest asdoc for this ANE here.](http://myflashlab.github.io/asdoc/com/myflashlab/air/extensions/fileChooser/package-detail.html)

[Download demo ANE](https://github.com/myflashlab/fileChooser-ANE/tree/master/AIR/lib)

# AIR Usage
For the complete AS3 code usage, see the [demo project here](https://github.com/myflashlab/fileChooser-ANE/blob/master/AIR/src/MainFinal.as).

```actionscript
import com.myflashlab.air.extensions.fileChooser.*;

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

# AIR .xml manifest
```xml
<!--
FOR ANDROID:
-->
	<uses-sdk android:targetSdkVersion="26"/>

	<activity android:name="com.doitflash.fileBrowser.Chooser" android:theme="@style/Theme.Transparent" />

	
	
<!--
FOR iOS:
-->
	<key>MinimumOSVersion</key>
	<string>8.0</string>

	<key>NSPhotoLibraryUsageDescription</key>
	<string>My description about why I need this feature in my app</string>


<!--
Embedding the ANE:
-->
  <extensions>
	<extensionID>com.myflashlab.air.extensions.fileBrowser</extensionID>
	
	<extensionID>com.myflashlab.air.extensions.permissionCheck</extensionID>
	
	<!-- dependency ANEs https://github.com/myflashlab/common-dependencies-ANE -->
    <extensionID>com.myflashlab.air.extensions.dependency.overrideAir</extensionID>
    <extensionID>com.myflashlab.air.extensions.dependency.androidSupport.core</extensionID>
    <extensionID>com.myflashlab.air.extensions.dependency.androidSupport.v4</extensionID>
	<extensionID>com.myflashlab.air.extensions.dependency.googlePlayServices.drive</extensionID>
    <extensionID>com.myflashlab.air.extensions.dependency.googlePlayServices.base</extensionID>
    <extensionID>com.myflashlab.air.extensions.dependency.googlePlayServices.basement</extensionID>
    <extensionID>com.myflashlab.air.extensions.dependency.googlePlayServices.tasks</extensionID>
  </extensions>
```

# Requirements
* Android SDK 15+
* iOS 8.0+
* AIR SDK 30+

# Permissions
Below are the list of Permissions this ANE might require. Check out the demo project available at this repository to see how we have used the [PermissionCheck ANE](http://www.myflashlabs.com/product/native-access-permission-check-settings-menu-air-native-extension/) to ask for the permissions.

Necessary | Optional
--------------------------- | ---------------------------
[SOURCE_STORAGE](https://myflashlab.github.io/asdoc/com/myflashlab/air/extensions/nativePermissions/PermissionCheck.html#SOURCE_STORAGE) | NONE 


# Commercial Version
https://www.myflashlabs.com/product/file-image-pick-ane-adobe-air-native-extension/

[![file picker ANE](https://www.myflashlabs.com/wp-content/uploads/2015/11/product_adobe-air-ane-extension-file-or-image-picker-2018-595x738.jpg)](https://www.myflashlabs.com/product/file-image-pick-ane-adobe-air-native-extension/)

# Tech Details
1. on the iOS side, the extension will open the native ImagePicker lib which is basically the same on all different iOS versions.

2. You have the option to resize the images because in a real life scenario you surely don't want to load a big image like 5MB into your app, right? Although you can resize the picked image in flash and maybe with using threads (Actionscript workers) but it will be a VERY slow process. so we decided to put a native image scaler inside the ```choose``` method to scale down the selected image with keeping the aspect ratio untouched. This will make working with this extension very exceptional.

# Changelog
*Nov 17, 2018 - V4.1.6*
* Works with OverrideAir ANE V5.6.1 or higher
* Works with ANELAB V1.1.26 or higher

*Sep 22, 2018 - V4.1.5*
* Removed androidSupport dependency
* Fixed a bug where Files from GoogleDrive where throwing an exception when selected. From this version, you can pick a file from GoogleDrive to your AIR app with no problem.
* Introduced new dependencies:
    * [permissionCheck.ane](https://github.com/myflashlab/PermissionCheck-ANE/)
    * overrideAir.ane
    * googlePlayServices_base.ane
    * googlePlayServices_basement.ane
    * googlePlayServices_drive.ane
    * googlePlayServices_tasks.ane

*May 12, 2018 - V4.1.4*
* On Android, the chooser activity used to open in portrait always. This problem is now fixed. And if your app is in landscape, the chooser activity also opens in landscape mode.

*Dec 15, 2017 - V4.1.3*
* Optimized for [ANE-LAB software](https://github.com/myflashlab/ANE-LAB).

*Sep 28, 2017 - V4.1.2*
* Fixed duplicated windows on landscape apps reported [here issue:18](https://github.com/myflashlab/fileChooser-ANE/issues/18).

*Mar 17, 2017 - V4.1.1*
* Fixed the white screen problem on iOS
* Updated with the new OverrideAir ANE.
* Even if you are building for iOS only, you still need to add the OverrideAir dependency.

*Nov 10, 2016 - V4.1.0*
* Optimized for Android manual permissions if you are targeting AIR SDK 24+
* From now on, this ANE will depend on androidSupport.ane and overrideAir.ane on the Android side

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