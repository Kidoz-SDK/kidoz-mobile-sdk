//
//  KDZEnums.h
//  KidozSDK
//
//  Created by Lev Firer on 26/01/2020.
//  Copyright © 2020 Kidoz. All rights reserved.
//

#ifndef KDZEnums_h
#define KDZEnums_h

typedef NS_ENUM(NSUInteger, OrientationState) {
    LANDSCAPE = 0,
    PORTRAIT = 1,
    AUTO_ROTATE = 2,
    FIXED = 3
};

typedef NS_ENUM(NSUInteger, RedirectType) {
    BROWSER = 0,
    APPSTORE = 1,
    WEBVIEW = 2
};

typedef enum {
    BOTTOM_CENTER,TOP_LEFT,TOP_CENTER,TOP_RIGHT,BOTTOM_LEFT,BOTTOM_RIGHT,POSITION_NONE
}BANNER_POSITION;

#endif /* KDZEnums_h */
