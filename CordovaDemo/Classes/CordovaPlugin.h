//
//  CordovaPlugin.h
//  CordovaDemo
//
//  Created by qinman on 2017/1/10.
//
//

#import <Cordova/CDVPlugin.h>

@interface CordovaPlugin : CDVPlugin
- (void)requestNative:(CDVInvokedUrlCommand*)command;
@end
