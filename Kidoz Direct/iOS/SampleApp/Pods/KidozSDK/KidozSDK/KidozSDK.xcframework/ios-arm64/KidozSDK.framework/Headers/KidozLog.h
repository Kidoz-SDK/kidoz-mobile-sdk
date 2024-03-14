//
//  KidozLog.h
//  KidozSDK
//
//  Created by Lev Firer on 23/11/2017.
//  Copyright © 2017 kidoz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KidozLog : NSObject

+(void)Log:(id)param1,...;
+(void)KDZLog:(id)param1,...;
+(void)KDZLogWithData:(NSData *)data clasName:(NSString *)clasName selector:(NSString *)selector tag:(NSString *)tag;
+(void)KDZLogWithDictionary:(NSDictionary *)dictionary clasName:(NSString *)clasName selector:(NSString *)selector tag:(NSString *)tag;

@end
