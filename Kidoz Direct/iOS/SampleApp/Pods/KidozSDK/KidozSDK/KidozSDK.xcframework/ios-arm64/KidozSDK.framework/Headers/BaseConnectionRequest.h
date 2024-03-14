//
//  BaseConnectionRequest.h
//  KidozSDK
//
//  Created by Lev Firer on 14/11/2017.
//  Copyright © 2017 kidoz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KidozLog.h"

@interface BaseConnectionRequest : NSObject<NSURLSessionTaskDelegate>{
    
 //void (^_completionHandler)(NSData *returnVal,NSURLResponse *response,NSError error);
 void (^_completionHandler)(NSData *returnVal, NSURLResponse *response ,NSError *error);
    
}

@property (strong,nonatomic) NSString *mPublicherId;
@property (strong,nonatomic) NSString *mSecurityToken;
@property (strong,nonatomic) NSString *HTTP_SCHEME;
//@property (strong,nonatomic) NSString *SERVER_DOMAIN;
@property (strong,nonatomic) NSString *MAIN_API;
@property (strong,nonatomic) NSString *KIDOZ_ANALITYCS_SERVER_URL;
@property (strong,nonatomic) NSString *SDK_API_URL;
@property (strong,nonatomic) NSString *SDK_DOMAIN_URL;




+(void)updateDomain:(NSString*)domain;

- (void)startDownLoadConnectionWithURL:(NSString*)URL withHandler:(void(^)(NSData*, NSURLResponse*,NSError*))handler;

- (void)startGetConnectionWithURL:(NSString*)URL withParams:(NSDictionary*)params withHandler:(void(^)(NSData*, NSURLResponse*,NSError*))handler;

typedef enum{GET_METHOD,POST_METHOD} HTTPMethod;

@property (strong,nonatomic) NSMutableURLRequest *request;
@property (strong,nonatomic) NSURLSession *session;
@property (strong,nonatomic) NSString *GOOGLE_ANALYTICS_API_URL;



- (id) init;

@end
