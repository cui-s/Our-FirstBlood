//
//  Ball.h
//  dt2
//
//  Created by zhao-y on 2012/10/29.
//  Copyright (c) 2012年 zhao-y. All rights reserved.
//

#import <Foundation/Foundation.h>
#include "MyPoint.h"
#include "MyRect.h"

@interface Ball : MyRect{
    float vectorx;
    float vectory;
    float velocity;
    float maxSpeed;
}
- (BOOL)move:(float)x:(float)y:(float)w:(float)v;


@property (nonatomic) float vectorx;
@property (nonatomic) float vectory;
@property (nonatomic) float velocity;
@property (nonatomic) float maxSpeed;


@end
