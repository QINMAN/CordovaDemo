//
//  NativeViewController.m
//  CordovaDemo
//
//  Created by qinman on 2017/1/10.
//
//

#import "NativeViewController.h"
#import "MainViewController.h"

@interface NativeViewController ()

@end

@implementation NativeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"原生页";
    self.view.backgroundColor = [UIColor whiteColor];
    [self showArgument];
}

- (void)showArgument {
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(20, 100, 200, 20)];
    label.text = self.str;
    label.textColor = [UIColor blackColor];
    [self.view addSubview:label];
}
- (IBAction)transferValueByPlugin:(UIButton *)sender {
    [[NSNotificationCenter defaultCenter] postNotificationName:@"soHigh" object:@"transferValueByPlugin"];
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)transferValue:(UIButton *)sender {
    for (UIViewController *vc in self.navigationController.viewControllers) {
        if ([vc isKindOfClass:[MainViewController class]]) {
            ((MainViewController *)vc).backMessage = @"transferValue";
            ((MainViewController *)vc).isRefresh = YES;
            [self.navigationController popToViewController:vc animated:YES];
        }
    }
    [self.navigationController popViewControllerAnimated:YES];
}


@end
