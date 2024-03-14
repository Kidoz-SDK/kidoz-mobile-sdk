//
//  KZParentalLockViewController.h
//  KidozSDK
//
//  Created by Lev Firer on 31/12/2017.
//  Copyright © 2017 kidoz. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol KZParentalLockDelegate <NSObject>

-(void)parentalLockExitWithRes:(BOOL)res targetCode:(int)targetCocde;

@end


@interface KZParentalLockViewController : UIViewController{

void (^_resultHandler)(BOOL result);

}

@property(nonatomic, weak) id <KZParentalLockDelegate> mDelegate;


-(id)initWithDelegate:(id<KZParentalLockDelegate>)delegate targetCode:(int)targetCode;
-(id)initWithHandler:(void(^)(BOOL))handler;
-(id)initWithRootViewController:(UIViewController*)viewController withHandler:(void(^)(BOOL))handler;

@end
