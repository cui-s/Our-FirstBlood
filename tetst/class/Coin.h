//
//  Coin.h
//  tetst
//
//  Created by zhao-y on 2012/10/31.
//  Copyright (c) 2012年 zhao-y. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MyRect.h"

#include "Color.h"

static const int NORMAL_COIN = 1;
static const int DROPABLE_COIN = 2;
static const int S_COIN = 3;



@interface Coin : MyRect{
    BOOL isHitted;
    BOOL isCatched;
    BOOL isMissed;
    BOOL isNormalCoinAndIsEnd;
    float velocity;
    Color* myColor;
    float opacity;
    int myScore;
    int kind;
    float myTime;
}

-(BOOL)hitJudge:(float)x:(float)y;
-(BOOL)catchJudge:(float)x:(float)w;

@property (atomic) BOOL isHitted;
@property (atomic) BOOL isCatched;
@property (atomic) BOOL isMissed;
@property (atomic) BOOL isNormalCoinAndIsEnd;
@property (nonatomic) float velocity;
@property (nonatomic) float opacity;
@property (nonatomic) int myScore;
@property (nonatomic) int kind;
@property (nonatomic) float myTime;
@property (nonatomic) Color* myColor;
@end
