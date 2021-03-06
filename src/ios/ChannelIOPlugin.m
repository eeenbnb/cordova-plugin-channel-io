#import "ChannelIOPlugin.h"
#import <ChannelIO/ChannelIO-swift.h>


@implementation ChannelIOPlugin

- (void)pluginInitialize {
    NSLog(@"Starting Channel IO plugin");
}

- (void)startWithGuestUser:(CDVInvokedUrlCommand *)command {
    NSString* pluginKey = [command.arguments objectAtIndex:0];

    ChannelPluginSettings *settings = [[ChannelPluginSettings alloc] init];
    [settings setPluginKey:pluginKey];

    [ChannelIO bootWith:settings profile:nil completion:^(ChannelPluginCompletionStatus status, User* user) {
      [ChannelIO trackWithEventName:@"init_cordova_channelio" eventProperty:nil];
    }];

    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)startWithRegisteredUser:(CDVInvokedUrlCommand *)command {
    NSString* pluginKey = [command.arguments objectAtIndex:0];
    NSString* userId = [command.arguments objectAtIndex:1];
    NSString* userName = [command.arguments objectAtIndex:2];

    ChannelPluginSettings *settings = [[ChannelPluginSettings alloc] init];
    [settings setPluginKey:pluginKey];
    [settings setMemberId:userId];

    Profile *profile = [[Profile alloc] init];
    [profile setWithName:userName];

    [ChannelIO bootWith:settings profile:profile completion:^(ChannelPluginCompletionStatus status, User* user) {
      [ChannelIO trackWithEventName:@"init_cordova_channelio" eventProperty:nil];
    }];

    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)startWithRegisteredUserAndEmail:(CDVInvokedUrlCommand *)command {
    NSString* pluginKey = [command.arguments objectAtIndex:0];
    NSString* userId = [command.arguments objectAtIndex:1];
    NSString* userName = [command.arguments objectAtIndex:2];
    NSString* userEmail = [command.arguments objectAtIndex:3];

    ChannelPluginSettings *settings = [[ChannelPluginSettings alloc] init];
    [settings setPluginKey:pluginKey];
    [settings setMemberId:userId];

    Profile *profile = [[Profile alloc] init];
    [profile setWithName:userName];
    [profile setWithEmail:userEmail];

    [ChannelIO bootWith:settings profile:profile completion:^(ChannelPluginCompletionStatus status, User* user) {
      [ChannelIO trackWithEventName:@"init_cordova_channelio" eventProperty:nil];
    }];

    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)setDeviceToken:(CDVInvokedUrlCommand *)command {
    NSString* token = [command.arguments objectAtIndex:0];
    if ([token isEqual:[NSNull null]]){
      NSLog(@"token is null");
    }else{
      [ChannelIO initPushTokenWithTokenString:token];
    }

    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)openLauncher:(CDVInvokedUrlCommand *)command {
    [ChannelIO openWithAnimated:YES];

    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)showLauncher:(CDVInvokedUrlCommand *)command {
    [ChannelIO showWithAnimated:YES];

    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)hideLauncher:(CDVInvokedUrlCommand *)command {
    [ChannelIO hideWithAnimated:YES];

    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)track:(CDVInvokedUrlCommand *)command {
    NSString* eventName = [command.arguments objectAtIndex:0];
    NSDictionary<NSString *, id>* eventProperty = [command.arguments objectAtIndex:1];

    [ChannelIO trackWithEventName:eventName eventProperty:eventProperty];

    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

@end
