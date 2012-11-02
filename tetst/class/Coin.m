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
@synthesize kind;
@synthesize myScore;
@synthesize opacity;
@synthesize velocity;
@synthesize myColor;



- (id)init
{
    
    if(self == [super init]){
        
        pos = [[MyPoint alloc]init];
        pos.x = arc4random()%254 + 22;
        pos.y = arc4random()%300 + 20;
        
        self.myColor = [[Color alloc]init];
        
        isHitted = FALSE;
        isCatched = FALSE;
        isMissed = FALSE;
        
        int tmpForKindDecided = arc4random()%100;
        
        if(tmpForKindDecided < 70){
            self.kind = NORMAL_COIN;
        } else {
            self.kind = DROPABLE_COIN;
        }
        
        if(self.kind == NORMAL_COIN){
            length = 12;
            width = 12;
            velocity = 2;
            self.opacity = 1.0;
            self.myColor.r = 0.7;
            self.myColor.g = 0.3;
            self.myColor.b = 0.5;
            self.myScore = 10;
        }
        if(self.kind == DROPABLE_COIN){
            length = 9;
            width = 9;
            velocity = 3;
            self.opacity = 1.0;
            self.myColor.r = 0.2;
            self.myColor.g = 0.7;
            self.myColor.b = 0.5;
            self.myScore = 20;
        }
    }
    return self;
}


-(BOOL)hitJudge:(float)x:(float)y;{
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


-(BOOL)catchJudge:(float)x:(float)w{
    //NSLog(@"isCatched Judge, %f", pos.y);
    pos.y += velocity;
    self.opacity *= 0.975;
    
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
