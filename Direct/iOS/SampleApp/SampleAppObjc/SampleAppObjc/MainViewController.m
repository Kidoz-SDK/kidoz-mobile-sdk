//
//  MainViewController.m
//  SampleAppObjc
//
//  Created by Maria on 31/07/2023.
//

#import "MainViewController.h"
#import "MainViewHandler.h"
#import <CommonSampleApp/CommonSampleApp.h>

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor]; 
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 10 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
        [self openMain];
    });
}

- (void)openMain {
    [BaseMainViewController launchScreenWithViewController:self mainViewHandler:[MainViewHandler init]];
}

@end
