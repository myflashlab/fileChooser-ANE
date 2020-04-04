FileBrowser Adobe Air Native Extension

*Apr 04, 2020 - V5.0.1*
- Upgraded to Androidx dependencies
```xml
<extensionID>com.myflashlab.air.extensions.dependency.overrideAir</extensionID>
<extensionID>com.myflashlab.air.extensions.dependency.androidx.core</extensionID>
<extensionID>com.myflashlab.air.extensions.dependency.googlePlayServices.drive</extensionID>
<extensionID>com.myflashlab.air.extensions.dependency.googlePlayServices.base</extensionID>
<extensionID>com.myflashlab.air.extensions.dependency.googlePlayServices.basement</extensionID>
<extensionID>com.myflashlab.air.extensions.dependency.googlePlayServices.tasks</extensionID>
```

*Aug 02, 2019 - V4.2.21*
* Added Android 64-bit Support
* Supports iOS 10+
* Removed **.os** property, use `OverrideAir.os` instead

*Feb 18, 2019 - V4.2.2*
* subclassing the ios native imagepicker window to support AIR app's current orientation

*Feb 12, 2019 - V4.2.1*
* fixed the bug when on iOS, the app's launcher image was shown on iOS 11+ for a few miliseconds
* When the picker window is open and you take the app to background, the window will be closed now.
* Added `isOpen` property which returns if currently the file-picker window is open or not

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
