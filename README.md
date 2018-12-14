# FileChooser ANE (Android+iOS)
FileChooser is a very easy to work with extension and lets you choose a file from your device and use it inside your AIR project. you can use the choose method and pass the type of file you need by passing its mimetype. \*/\* for example means any file with any mimetype! but image/\* means any image file while image/png means any png image file! on iOS, due to the OS limitations, no matter what input you set, it will allow you to pick images only at the moment. (in future versions, we will support picking video files on iOS too)

This extension can also optionally resize the picked image as fast as a few milliseconds for you so you don't have to load a huge image into your app!

[find the latest **asdoc** for this ANE here.](http://myflashlab.github.io/asdoc/com/myflashlab/air/extensions/fileChooser/package-detail.html)

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

# Premium Support #
[![Premium Support package](https://www.myflashlabs.com/wp-content/uploads/2016/06/professional-support.jpg)](https://www.myflashlabs.com/product/myflashlabs-support/)
If you are an [active MyFlashLabs club member](https://www.myflashlabs.com/product/myflashlabs-club-membership/), you will have access to our private and secure support ticket system for all our ANEs. Even if you are not a member, you can still receive premium help if you purchase the [premium support package](https://www.myflashlabs.com/product/myflashlabs-support/).