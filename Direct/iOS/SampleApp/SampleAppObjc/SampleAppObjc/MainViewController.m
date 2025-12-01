//
//  MainViewController.m
//  SampleAppObjc
//
//  Created by Maria on 31/07/2023.
//

#import "MainViewController.h"
#import "MainViewHandler.h"
#import <CommonSampleApp/CommonSampleApp.h>

@implementation MainViewController

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear: animated];
    [self openMain];
}

- (void)openMain {
    [BaseMainViewController launchScreenWithViewController:self mainViewHandler:[[MainViewHandler alloc] init]];
}

@end
