//
//  Coin.m
//  tetst
//
//  Created by zhao-y on 2012/10/31.
//  Copyright (c) 2012年 zhao-y. All rights reserved.
//

#import "Coin.h"

@implementation Coin

@synthesize isHitted;
@synthesize isCatched;

- (id)init
{
    
    if(self == [super init]){
        pos = [[MyPoint alloc]init];
        length = 15;
        width = 15;
        isHitted = FALSE;
        isCatched = FALSE;
    }
    return self;
}


-(BOOL)hitJudge:(int)x:(int)y;{
    
    if(pos.x < x && x < (pos.x + width)){
        if(pos.y < y && y < (pos.y + length)){
            NSLog(@"hit score");
            isHitted = TRUE;
            return TRUE;
        }
    }
    
    return FALSE;
}


-(BOOL)catchJudge:(int)x:(int)w{
    if(isHitted){
        pos.y += 1.0;
    }
    
    if(pos.y > 399 && pos.y <410){
        if((pos.x > x - w/2 -1 && pos.x < x + w/2 +1) || (pos.x + width  > x - w/2 -1 && pos.x + width < x + w/2 +1)){
            NSLog(@"catch");
            isCatched = TRUE;
            return TRUE;
        }
    }
    
    return FALSE;
}
@end
