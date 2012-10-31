//
//  Coin.h
//  tetst
//
//  Created by zhao-y on 2012/10/31.
//  Copyright (c) 2012年 zhao-y. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MyRect.h"


@interface Coin : MyRect{
    BOOL isHitted;
    BOOL isCatched;
    BOOL isMissed;
    float velocity;
}

-(BOOL)hitJudge:(int)x:(int)y;
-(BOOL)catchJudge:(int)x:(int)w;

@property (atomic) BOOL isHitted;
@property (atomic) BOOL isCatched;
@property (atomic) BOOL isMissed;
@property (nonatomic) float velocity;
@end
