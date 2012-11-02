//
//  Ball.m
//  dt2
//
//  Created by zhao-y on 2012/10/29.
//  Copyright (c) 2012年 zhao-y. All rights reserved.
//

#import "Ball.h"

@implementation Ball
@synthesize velocity;
@synthesize maxSpeed;
@synthesize vectorx;
@synthesize vectory;


- (id)init
{
   
    if(self == [super init]){
        pos = [[MyPoint alloc]init];
        velocity = 2.75;
        maxSpeed = 7.0;
        vectorx = velocity;
        vectory = velocity;
        length = 6;
        width = 6;
        pos.x = arc4random()%280 +20;
        pos.y = arc4random()%100 +20;
    }
    return self;
}

//ボール　運動関数
- (void)move:(float)x:(float)y:(float)w:(float)v;
{
    static int gameOverFlag = 0;
    
    if(fabs(vectorx) < 0.001){
        vectorx = 1.0;
    }
    
    self.pos.x += vectorx;
    self.pos.y += vectory;
    
    if(gameOverFlag == 1){
        
       // NSLog(@"%d", self.pos.y);
        if(pos.y > 700) {
            pos.x = arc4random()%280 +20;
            pos.y = arc4random()%100 +20;
            vectory= velocity;
            vectorx = (arc4random()%2 - 1.0 ) * velocity;
            gameOverFlag = 0;
        }
        
    }else if(gameOverFlag == 0) {
        
        if(self.pos.x < 20.0){
        
            if(vectorx < 0.0) {
                vectorx = vectorx * -1.0;
            }
        }
    
        if(self.pos.x > 300.0){
            if(vectorx > 0.0) {
                vectorx  = vectorx * -1.0;
            }
        }

    
        if(self.pos.y < 20.0){
            if(vectory < 0.0) {
                vectory = vectory * -1.0 ;
            }
        }
    
        if(self.pos.y < 411.0 && self.pos.y > 399.0 && self.pos.x < (x + w/2.0 +1.0)  && self.pos.x > (x - w/2.0 -1.0)){
            if(vectory > 0.0) {
                vectory  = vectory * -1.0;
                vectory  = vectory * 1.3;
                if(abs(v) > 0.01) {
                    vectorx = (v / 3500.0) * maxSpeed;
                }
            }
        }
    
        if(x/y > 1.3 || (x - y) > 2.1){
            y = x * 0.95;
        }
        
//        if(self.pos.y > 400){
//            NSLog(@"%d, %d, %d, %d", (x + w/2),(x - w/2), self.pos.x, self.pos.y);
//        }
    
        if(self.pos.y > 410){
            
//            NSLog(@"GameOver, %d, %d, xmax:%d", self.pos.x, self.pos.y, x + w/2 +1);
            gameOverFlag = 1;
        }
    }
    
    // fake gravity
    self.pos.y += 0.67;
    
    if(vectorx > maxSpeed){
        vectorx = maxSpeed;
    }
    if(vectory > maxSpeed){
        vectory = maxSpeed;
    }
}


@end
