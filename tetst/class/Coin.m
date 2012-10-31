//
//  Coin.m
//  tetst
//
//  Created by zhao-y on 2012/10/31.
//  Copyright (c) 2012年 zhao-y. All rights reserved.
//

#import "Coin.h"

@implementation Coin
- (id)init
{
    
    if(self == [super init]){
        pos = [[MyPoint alloc]init];
        length = 10;
        width = 10;
    }
    return self;
}


-(BOOL)hitJudge:(int)x:(int)y;{
    
    if(pos.x < x && x < (pos.x + width)){
        if(pos.y < y && y < (pos.y + length)){
            NSLog(@"hit score");
            return TRUE;
        }
    }
    return FALSE;
}
@end
