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
@synthesize isMissed;

- (id)init
{
    
    if(self == [super init]){
        pos = [[MyPoint alloc]init];
        
        length = arc4random()%10 + 10;
        width = arc4random()%10 + 10;
        pos.x = arc4random()%280 + 20;
        pos.y = arc4random()%300 + 20;
        velocity = arc4random()%30/10.0 + 0.7;
//        NSLog(@"%f", velocity);
        
        
        isHitted = FALSE;
        isCatched = FALSE;
        isMissed = FALSE;
    }
    return self;
}


-(BOOL)hitJudge:(int)x:(int)y;{
    //NSLog(@"isHitted Judge");
    if(pos.x -1 < x && x < (pos.x + width + 1)){
        if(pos.y - 1 < y && y < (pos.y + length + 1)){
//            NSLog(@"hit score");
            isHitted = TRUE;
            return TRUE;
        }
    }
    
    return FALSE;
}


-(BOOL)catchJudge:(int)x:(int)w{
    //NSLog(@"isCatched Judge, %f", pos.y);
    pos.y += velocity;
    
    
    if(pos.y > 399 && pos.y <411){
        if((pos.x > x - w/2 -1 && pos.x < x + w/2 +1) || (pos.x + width  > x - w/2 -1 && pos.x + width < x + w/2 +1)){
//            NSLog(@"catch");
            isCatched = TRUE;
            return TRUE;
        }
    }
    if(pos.y > 410){
        isMissed = TRUE;
    }
    
    return FALSE;
}
@end
