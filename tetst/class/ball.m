//
//  Ball.m
//  dt2
//
//  Created by zhao-y on 2012/10/29.
//  Copyright (c) 2012年 zhao-y. All rights reserved.
//

#import "Ball.h"

@implementation Ball


- (id)init
{
   
    if(self == [super init]){
        pos = [[MyPoint alloc]init];
        velocity = 2.0;
        vectorx = velocity;
        vectory = velocity;
        length = 5;
        width = 5;
    }
    return self;
}


- (void)move:(int)x:(int)y:(int)w:(int)v;
{
    
    self.pos.x+= vectorx;
    
    if(self.pos.x < 20){
        if(vectorx < 0) {
            vectorx = vectorx * -1.0;
        }
    }
    
    if(self.pos.x > 300){
        if(vectorx > 0) {
            vectorx  = vectorx * -1.0;
        }
    }
    
    
    self.pos.y += vectory;
    
    if(self.pos.y < 20){
        vectory = vectory * -1.0 ;
    }
    
    if(self.pos.y > 400 && self.pos.x < (x + w/2) && self.pos.x > (x - w/2)){
        vectory  = vectory * -1.0;
        if(v != 0) {
            vectorx *= 1.05;
            if(v * vectorx < 0){
                vectorx *= -1.0;
            }
            
            NSLog(@"hit %f", vectorx);
        }
    }
    
    if(self.pos.y > 410){
        self.pos.x = 50;
        self.pos.y = 50;
    }
    
    if(x/y > 1.3 || (x - y) > 2){
        y = x * 0.95;
    }
}


@end
