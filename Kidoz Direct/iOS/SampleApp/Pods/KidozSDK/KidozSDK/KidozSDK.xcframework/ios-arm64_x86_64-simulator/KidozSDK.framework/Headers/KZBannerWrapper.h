//
//  KZBanner.h
//  KidozSDK
//
//  Created by Lev Firer on 09/10/2018.
//  Copyright © 2018 Kidoz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <StoreKit/StoreKit.h>

@class KZWebViewWrapper;

@protocol KDZBannerDelegate <NSObject>
-(void)bannerDidInitialize;
-(void)bannerDidClose;
-(void)bannerDidOpen;
-(void)bannerIsReady;
-(void)bannerReturnedWithNoOffers;
-(void)bannerLoadFailed:(int)errorCode andMessage:(NSString*)errorMessage;
-(void)bannerShowFailed:(int)errorCode andMessage:(NSString*)errorMessage;
-(void)bannerDidReciveError:(NSString*)errorMessage;
-(void)bannerImpression;
-(void)bannerLeftApplication;
@end

@protocol KZWrapperDelegate;
@class KZParentalLockViewController;
@class KZWebViewController;
@class AdParameters;

typedef enum {
    BOTTOM_CENTER,TOP_LEFT,TOP_CENTER,TOP_RIGHT,BOTTOM_LEFT,BOTTOM_RIGHT,POSITION_NONE
}BANNER_POSITION;

@interface KZBannerWrapper : NSObject<KZWrapperDelegate>

@property (nonatomic, weak) id <KDZBannerDelegate> mDelegate;
@property (nonatomic, strong) KZParentalLockViewController *parentalGate ;
@property (nonatomic, strong) UIViewController *mViewController;
@property (nonatomic, strong) NSString *styleID;
@property (nonatomic, retain) NSTimer *mTimeOutTImer;
@property (nonatomic, assign) Boolean isParentalLockEnabled;
@property (nonatomic, strong) KZWebViewWrapper *mKZWebViewWrapper;
@property (nonatomic, strong) KZWebViewController *webView;
@property (nonatomic, strong) UIView *mBannerView;

@property (nonatomic, strong) NSLayoutConstraint *bottom;
@property (nonatomic, strong) NSLayoutConstraint *height;
@property (nonatomic, strong) NSLayoutConstraint *width;
@property (nonatomic, strong) NSLayoutConstraint *trailing;
@property (nonatomic, strong) NSLayoutConstraint *leading;
@property (nonatomic, strong) NSLayoutConstraint *centerX;
@property (nonatomic, strong) NSLayoutConstraint *top;
@property(strong, nonatomic) AdParameters *mAdParameters;



typedef enum {
    BANNER_NOT_INITIALIZED,
    BANNER_INITIALIZING,
    BANNER_INITIALIZED,
    BANNER_LOADING,
    BANNER_LOADED,
    BANNER_SHOW,
    BANNER_SHOWING
}BannerState;

#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)


@property (nonatomic, assign) BannerState bannerState;
@property (nonatomic, assign) BANNER_POSITION mBANNER_POSITION;

- (id)initWitViewController:(UIViewController*)viewController withDelegate:(id<KDZBannerDelegate>)delegate;
- (id)initWitViewController:(UIViewController*)viewController withView:(UIView *)view withDelegate:(id<KDZBannerDelegate>)delegate;

- (id)initWitView:(UIView*)view withDelegate:(id<KDZBannerDelegate>)delegate;
- (void)setDelegate:(id<KDZBannerDelegate>)delegate;
- (void)initBannerView;
- (void)initWebView;
- (void)load;
- (void)show:(UIViewController *)viewController;
- (void)hide;
- (void)setBannerPosition:(BANNER_POSITION)bannerPosition;

//- (NSString*)convertStateToString:(BannerState) bannerState;
- (BOOL)isInitialized;
- (BOOL)isReady;
- (BOOL)isPresented;

@end
