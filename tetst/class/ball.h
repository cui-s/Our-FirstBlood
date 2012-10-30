//
//  Ball.h
//  dt2
//
//  Created by zhao-y on 2012/10/29.
//  Copyright (c) 2012年 zhao-y. All rights reserved.
//

#import <Foundation/Foundation.h>
#include "MyPoint.h"

@interface Ball : NSObject{
    MyPoint* ballPos;
    float vectorx;
    float vectory;
    float velocity;
}
- (void)move:(int)x:(int)y:(int)w;

@property (readwrite, nonatomic) MyPoint* ballPos;
@property (nonatomic) float vectorx;
@property (nonatomic) float vectory;
@property (nonatomic) float velocity;

- (CGMutablePathRef)generatePath;

@end
