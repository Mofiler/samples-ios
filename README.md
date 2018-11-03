# Mofiler samples-ios

In this repository you'll find 2 samples, one written in ObjectiveC (`MofilerAppObjC`) and the other in Swift (`MofilerAppSwift`), showing how to use the Mofiler SDK.

## How to integrate
You can use CocoaPods or Carthage to use the Mofile SDK.

### CocoaPods
If you don't have CocoaPods installed, please procees by running the following command in your OS X:

`$ gem install cocoapods`

Find more details in CocoaPods <a href="https://cocoapods.org/" target="_blank"> full documentation</a>

### Carthage
If you don't have Carthage installed, please procees by running the following command in your OS X:

`$ brew install carthage`

Find more details in Carthage <a href="https://github.com/Carthage/Carthage#installing-carthage" target="_blank"> full documentation</a>

## Installation via CocoaPods

After installing the tool, go to your Xcode project’s directory and create a Podfile by running:

`$ pod init`

Than open the generated Podfile and add Mofiler's dependencies:

`pod ‘Mofiler’`

Run `$ pod install` command in the directory containing the Podfile.

## Installation via Carthage
After installing the tool, please add the following line to your Cartfile:

`github "Mofiler/sdk-ios" "develop"`

Then run `carthage update` and drag the built framework `Mofiler.framework` into your Xcode project.

## Using the SDK

### SWIFT

1) Add the following import
```
import Mofiler
```

2) Add the class that will use the MofilerDelegate
```
class AppDelegate: UIResponder, UIApplicationDelegate, MofilerDelegate {
}
```

3) Features

```
//Singleton mofiler
let mof = Mofiler.sharedInstance

//Init with required fields        
mof.initializeWith(appKey: "MY-­APPKEY-­HERE-IOS", appName: "MyIosTestApplication")

// different init options
// init specifing that you don't want to use advertisingId        
// mof.initializeWith(appKey: "MY-­APPKEY-­HERE-IOS", appName: "MyIosTestApplication", useAdvertisingId: false)

// init specifing that you don't want to use location tracking
// mof.initializeWith(appKey: "MY-­APPKEY-­HERE-IOS", appName: "MyIosTestApplication", useLoc: false)

// mof.initializeWith(appKey: "MY-­APPKEY-­HERE-IOS", appName: "MyIosTestApplication", useLoc: false, useAdvertisingId: false)
// mof.initializeWith(appKey: "MY-­APPKEY-­HERE-IOS", appName: "MyIosTestApplication", useLoc: true, useAdvertisingId: false)

//Assign delegate
mof.delegate = self

//Init optional parameters
mof.url = "mofiler.com"
mof.addIdentity(identity: ["name":"john doe"])
mof.addIdentity(identity: ["email":"john@doe.com"])
mof.useVerboseContext = true
        
//Inject values
mof.injectValue(newValue: ["mykey1":"myvalue1"])
mof.injectValue(newValue: ["mykey2":"myvalue2"], expirationDateInMilliseconds: 100000000.0)
mof.injectValue(newValue: ["mykey3":"myvalue3"])
mof.injectValue(newValue: ["mykey4":"myvalue4"], expirationDateInMilliseconds: 100000000.0)
mof.injectValue(newValue: ["mykey5":"myvalue5"])
mof.injectValue(newValue: ["mykey6":"myvalue6"])
mof.injectValue(newValue: ["mykey7":"myvalue7"], expirationDateInMilliseconds: 100000000.0)
mof.injectValue(newValue: ["mykey8":"myvalue8"])
mof.injectValue(newValue: ["mykey9":"myvalue9"])
mof.injectValue(newValue: ["mykey10":"myvalue10"])
mof.injectValue(newValue: ["mykey11":"myvalue11"])
mof.injectValue(newValue: ["mykey12":"myvalue12"])
mof.injectValue(newValue: ["mykey13":"myvalue13"])
        
//Force to send values to endpoint
mof.flushDataToMofiler()


```

#### Use of Sessions and Identity

The SDK handles sessions automatically, but it is important to note that identities should be declare by the app owner. There is no need to declare them more than once, since the SDK will keep those persisted. This is the recommended way to declare it:

1. Call `mof.initializeWith(appKey: "MY-­APPKEY-­HERE-IOS", appName: "MyIosTestApplication")` and then `mof.addIdentity(identity: ["name":"john doe"])` as soon as you can identify the user for the first time.
2. Call `mof.flushDataToMofiler()` every time the user does logout to foce cleaning all the records.


### OBJECTIVE C

1) Add the following import
```
#import <Mofiler/Mofiler-Swift.h>
```

2) Add the class the will use MofilerDelegate
```
@interface AppDelegate () <MofilerDelegate>
```

3) Features
```
//Singleton mofiler
Mofiler* mof = [Mofiler sharedInstance];
    
//Init with required fields           
[mof initializeWithAppKey:@"MY-APPKEY-HERE-IOS" appName:@"MyIosTestApplication"];

// different init options
// [mof initializeWithAppKey:@"MY-APPKEY-HERE-IOS" appName:@"MyIosTestApplication" useLoc: true useAdvertisingId: true];
// [mof initializeWithAppKey:@"MY-APPKEY-HERE-IOS" appName:@"MyIosTestApplication" useLoc: true useAdvertisingId: false];


//Assign delegate 
mof.delegate = self;
    
//Init optional parameters
mof.url = @"mofiler.com";
[mof addIdentityWithIdentity:@{@"name":@"john doe"}];
[mof addIdentityWithIdentity:@{@"email":@"john@doe.com"}];
mof.useVerboseContext = true;
    
//Inject values
[mof injectValueWithNewValue:@{@"mykey1":@"myvalue1"} expirationDateInMilliseconds:nil];
    [mof injectValueWithNewValue:@{@"mykey2":@"myvalue2"} expirationDateInMilliseconds:[NSNumber numberWithFloat:100000000.0]];
    [mof injectValueWithNewValue:@{@"mykey3":@"myvalue3"} expirationDateInMilliseconds:nil];
    [mof injectValueWithNewValue:@{@"mykey4":@"myvalue4"} expirationDateInMilliseconds:[NSNumber numberWithFloat:100000000.0]];
    [mof injectValueWithNewValue:@{@"mykey5":@"myvalue5"} expirationDateInMilliseconds:nil];
    [mof injectValueWithNewValue:@{@"mykey6":@"myvalue6"} expirationDateInMilliseconds:nil];
    [mof injectValueWithNewValue:@{@"mykey7":@"myvalue7"} expirationDateInMilliseconds:[NSNumber numberWithFloat:100000000.0]];
    [mof injectValueWithNewValue:@{@"mykey8":@"myvalue8"} expirationDateInMilliseconds:nil];
    [mof injectValueWithNewValue:@{@"mykey9":@"myvalue9"} expirationDateInMilliseconds:nil];
    [mof injectValueWithNewValue:@{@"mykey10":@"myvalue10"} expirationDateInMilliseconds:nil];
    [mof injectValueWithNewValue:@{@"mykey11":@"myvalue11"} expirationDateInMilliseconds:nil];
    [mof injectValueWithNewValue:@{@"mykey12":@"myvalue12"} expirationDateInMilliseconds:nil];
    [mof injectValueWithNewValue:@{@"mykey13":@"myvalue13"} expirationDateInMilliseconds:nil];


//Force to send values to endpoint  
[mof flushDataToMofiler];
```

### IMPORTANT: LOCATION 

The SDK may access the location of the device. To do so, the app needs to add the keys `NSLocationAlwaysUsageDescription` and `NSLocationAlwaysAndWhenInUseUsageDescription` to the `Info.plist` explaining how you will use this information.


```
<dict>
    [...]
    <key>NSLocationAlwaysAndWhenInUseUsageDescription</key>
    <string>This apps tracks your location from time to time to better understand how you make use of it, and improve your UX in upcoming releases.</string>
    [...]
</dict>
```


