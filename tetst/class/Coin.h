//
//  Coin.h
//  tetst
//
//  Created by zhao-y on 2012/10/31.
//  Copyright (c) 2012年 zhao-y. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MyRect.h"


@interface Coin : MyRect

-(BOOL)hitJudge:(int)x:(int)y;
@end
