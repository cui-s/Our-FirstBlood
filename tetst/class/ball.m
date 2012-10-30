//
//  Ball.m
//  dt2
//
//  Created by zhao-y on 2012/10/29.
//  Copyright (c) 2012年 zhao-y. All rights reserved.
//

#import "Ball.h"

@implementation Ball

@synthesize ballPos;

- (id)init
{
   
    if(self == [super init]){
        ballPos = [[MyPoint alloc]init];
        velocity = 2.0;
        vectorx = velocity;
        vectory = velocity;
    }
    return self;
}


- (void)move:(int)x:(int)y:(int)w;
{
    
    self.ballPos.x+= vectorx;
    
    if(self.ballPos.x < 20){
        vectorx = velocity;
    }
    
    if(self.ballPos.x > 300){
        vectorx  = velocity * -1;
    }
    
    
    self.ballPos.y += vectory;
    
    if(self.ballPos.y < 20){
        vectory = velocity ;
    }
    
    if(self.ballPos.y > 400 && self.ballPos.x < (x + w/2) && self.ballPos.x > (x - w/2)){
        vectory  = velocity * -1;
    }
    
    if(self.ballPos.y > 410){
        self.ballPos.x = 50;
        self.ballPos.y = 50;
    }
}

- (CGMutablePathRef)generatePath{
    CGMutablePathRef thePath=CGPathCreateMutable();
    CGPathMoveToPoint(thePath,NULL,ballPos.x,ballPos.y);
    CGPathAddLineToPoint(thePath, NULL, ballPos.x+5, ballPos.y);
    CGPathAddLineToPoint(thePath, NULL, ballPos.x+5, ballPos.y+5);
    CGPathAddLineToPoint(thePath, NULL, ballPos.x, ballPos.y+5);
    CGPathCloseSubpath(thePath);
    return thePath;
}

@end
