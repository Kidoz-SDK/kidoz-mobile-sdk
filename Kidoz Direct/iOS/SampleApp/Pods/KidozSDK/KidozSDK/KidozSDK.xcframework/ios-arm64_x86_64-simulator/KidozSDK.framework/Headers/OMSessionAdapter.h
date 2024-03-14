//
//  OMSessionAdapter.h
//  KidozSDK
//
//  Created by Lev Firer on 01/11/2020.
//  Copyright © 2020 Kidoz. All rights reserved.
//

#ifndef OMSessionAdapter_h
#define OMSessionAdapter_h
#endif /* OMSessionAdapter_h */

@protocol OMSessionProtocol;
@class OMIDAdSession;
@class OMIDKidoznetAdSession;

@interface OMSessionAdapter : NSObject<OMSessionProtocol>
- (id)initWithOMIDKidoznetAdSession:(OMIDKidoznetAdSession*)omidKidoznetAdSession;
-(BOOL)isOMSessionStarted;
-(BOOL)isOMSessionFinished;
@end
