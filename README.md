## install

1. firststep  
ios plugin pod SDK use swift.  
this plugin install your project.
```
cordova plugin add cordova-plugin-add-swift-support
```

1. install plugin
```
cordova plugin add https://github.com/eeenbnb/cordova-plugin-channel-io.git
```

1. AndroidManifest update  
use API28.
```
<edit-config file="AndroidManifest.xml" target="/manifest/application" mode="merge">
  <application android:usesCleartextTraffic="true" />
</edit-config>
```
this config don't work to `cordova 9.0`
https://issues.apache.org/jira/browse/CB-13514  
use this repo `./script/merge-app-attr.js` set your project.
and this config your `config.xml` add.
```
<platform name="android">
  <hook type="after_prepare" src="scripts/merge-app-attr.js" />
</platform>
```

## how to use

#### start gust user
```
window.cordova.plugins.channel.io.startWithGuestUser("YOUR_PLUGIN_TOKEN");
```

#### start registered user
```
window.cordova.plugins.channel.io.startWithRegisteredUser("YOUR_PLUGIN_TOKEN","USER_ID","USER_NAME");
```

set name and email.
```
window.cordova.plugins.channel.io.startWithRegisteredUserAndEmail("YOUR_PLUGIN_TOKEN","USER_ID","USER_NAME","USER_EMAIL");
```

#### launchOptions
show
```
window.cordova.plugins.channel.io.showLauncher()
```

hide
```
window.cordova.plugins.channel.io.showLauncher()
```

open
```
window.cordova.plugins.channel.io.openLauncher()
```

#### push settings
use cordova-firebase-messageing.  
https://github.com/chemerisuk/cordova-plugin-firebase-messaging

android
```
cordova.plugins.firebase.messaging.getToken().then(function(token) {
  window.cordova.plugins.channel.io.setDeviceToken(token)
});
```

ios
```
cordova.plugins.firebase.messaging.getToken("apns-string").then(function(token) {
    window.cordova.plugins.channel.io.setDeviceToken(token)
});
```
