//
//  KZRewardedWrapper.h
//  KidozSDK
//
//  Created by Lev Firer on 14/02/2018.
//  Copyright © 2018 Kidoz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol KDZRewardedDelegate <NSObject>
-(void)rewardedDidInitialize;
-(void)rewardedDidClose;
-(void)rewardedDidOpen;
-(void)rewardedIsReady;
-(void)rewardedReturnedWithNoOffers;
-(void)rewardedDidPause;
-(void)rewardedDidResume;
-(void)rewardedLoadFailed:(int)errorCode andMessage:(NSString*)errorMessage;
-(void)rewardedShowFailed:(int)errorCode andMessage:(NSString*)errorMessage;
-(void)rewardedDidReciveError:(NSString*)errorMessage;
-(void)rewardReceived;
-(void)rewardedStarted;
-(void)rewardedImpression;
-(void)rewardedLeftApplication;
@end

@protocol KZBaseInterstitialDelegate;
@class KZBaseInterstitial;

@interface KZRewardedWrapper : NSObject<KZBaseInterstitialDelegate>

@property (nonatomic, strong) id <KDZRewardedDelegate> mDelegate;

@property (nonatomic, strong) KZBaseInterstitial *mKZBaseInterstitial;

-(void)setDelegate:(id<KDZRewardedDelegate>)delegate;


-(void)initWebView;
-(void)initViewController;
-(id)initWithRootViewController:(UIViewController*)mRootViewController withDelegate:(id<KDZRewardedDelegate>)delegate;

-(void)setDelegate:(id<KDZRewardedDelegate>)delegate;
-(void)load;
-(void)show:(UIViewController *)viewController;



-(BOOL)isInitialized;
-(BOOL)isReady;
-(BOOL)isPresented;


@end
