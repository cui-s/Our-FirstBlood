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
        pos.x = arc4random()%254 + 22;
        pos.y = arc4random()%300 + 20;
        velocity = arc4random()%30/10.0 + 0.7;
        self.opacity = 1.0;
//        NSLog(@"%f", velocity);
        
        self.myColor = [[Color alloc]init];
        
        
        
        self.myColor.r = arc4random()%256/256.0;
        self.myColor.g = arc4random()%256/256.0;
        self.myColor.b = arc4random()%256/256.0;
        
        
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
    self.opacity *= 0.98;
    
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
