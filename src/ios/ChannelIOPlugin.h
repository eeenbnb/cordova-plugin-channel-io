#import <Cordova/CDV.h>
#import "AppDelegate.h"

@interface ChannelIOPlugin : CDVPlugin

- (void)startWithGuestUser:(CDVInvokedUrlCommand *)command;
- (void)startWithRegisteredUser:(CDVInvokedUrlCommand *)command;
- (void)setDeviceToken:(CDVInvokedUrlCommand *)command;
- (void)openLauncher:(CDVInvokedUrlCommand *)command;
- (void)showLauncher:(CDVInvokedUrlCommand *)command;
- (void)hideLauncher:(CDVInvokedUrlCommand *)command;

@end
