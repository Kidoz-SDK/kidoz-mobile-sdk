//
//  Kidoz.h
//  KidozSDK
//
//  Created by Maria on 09/05/2023.
//

#ifndef Kidoz_h
#define Kidoz_h


#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol KidozInitDelegate <NSObject>
@optional
-(void)onInitSuccess;
-(void)onInitError:(NSString *)error;
@end

@interface Kidoz : NSObject

+ (instancetype)instance;

- (void)initializeWithPublisherID:(NSString *)publisherID securityToken:(NSString *)securityToken withDelegate:(id<KidozInitDelegate>)delegate;
- (void)initializeWithPublisherID:(NSString *)publisherID securityToken:(NSString *)securityToken;


- (BOOL)isSDKInitialized;
- (NSString*)getSdkVersion;

- (void)suppressSKANWarnings;
+ (void)setExtensionType:(NSString*)extensionType version:(NSString*)extensionVersion;
@end



#endif /* Kidoz_h */
