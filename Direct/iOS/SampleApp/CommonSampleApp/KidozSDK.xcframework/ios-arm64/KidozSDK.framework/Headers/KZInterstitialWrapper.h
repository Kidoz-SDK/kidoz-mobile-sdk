//
//  KZInterstitialWrapper.h
//  KidozSDK
//
//  Created by Lev Firer on 14/02/2018.
//  Copyright © 2018 Kidoz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol KDZInterstitialDelegate <NSObject>
-(void)interstitialDidInitialize;
-(void)interstitialDidClose;
-(void)interstitialDidOpen;
-(void)interstitialIsReady;
-(void)interstitialReturnedWithNoOffers;
-(void)interstitialDidPause;
-(void)interstitialDidResume;
-(void)interstitialLoadFailed:(int)errorCode andMessage:(NSString*)errorMessage;
-(void)interstitialImpression;
-(void)interstitialShowFailed:(int)errorCode andMessage:(NSString*)errorMessage;
-(void)interstitialDidReciveError:(NSString*)errorMessage;
-(void)interstitialLeftApplication;
@end

@class KZBaseInterstitial;
@protocol KZBaseInterstitialDelegate;

@interface KZInterstitialWrapper : NSObject<KZBaseInterstitialDelegate>

@property (nonatomic, strong) id <KDZInterstitialDelegate> mDelegate;

@property (nonatomic, strong) KZBaseInterstitial *mKZBaseInterstitial;

-(void)setDelegate:(id<KDZInterstitialDelegate>)delegate;

-(void)initWebView;
-(void)initViewController;
-(id)initWithRootViewController:(UIViewController*)mRootViewController withDelegate:(id<KDZInterstitialDelegate>)delegate;

-(void)load;
-(void)show:(UIViewController *)viewController;


-(BOOL)isInitialized;
-(BOOL)isReady;
-(BOOL)isPresented;

@end
