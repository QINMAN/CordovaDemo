//
//  CordovaPlugin.m
//  CordovaDemo
//
//  Created by qinman on 2017/1/10.
//
//

#import "CordovaPlugin.h"
#import "NativeViewController.h"
@interface CordovaPlugin()
@property (nonatomic, strong)CDVInvokedUrlCommand *myCommand;
@end
@implementation CordovaPlugin
- (void)requestNative:(CDVInvokedUrlCommand*)command {
    self.myCommand = command;
    NSString *myarg = [command.arguments objectAtIndex:0];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeValue:) name:@"soHigh" object:nil];
    NativeViewController *nativeVC = [[NativeViewController alloc] init];
    nativeVC.str = myarg;
    [self.viewController.navigationController pushViewController:nativeVC animated:YES];
}

- (void)changeValue:(NSNotification *)noti {
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"soHigh" object:nil];
    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:noti.object];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:self.myCommand.callbackId];

}
@end
