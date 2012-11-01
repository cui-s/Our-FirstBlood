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

- (id)init
{
   
    if(self == [super init]){
        pos = [[MyPoint alloc]init];
        velocity = 2.75;
        maxSpeed = 7.3;
        vectorx = velocity;
        vectory = velocity;
        length = 5;
        width = 5;
        pos.x = arc4random()%280 +20;
        pos.y = arc4random()%100 +20;
    }
    return self;
}

//ボール　運動関数
- (void)move:(int)x:(int)y:(int)w:(int)v;
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
            vectorx = (arc4random()%2 - 1 ) * velocity;
            gameOverFlag = 0;
        }
        
    }else if(gameOverFlag == 0) {
        
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
    
    
    
        if(self.pos.y < 20){
            if(vectory < 0) {
                vectory = vectory * -1.0 ;
            }
        }
    
        if(self.pos.y < 411 && self.pos.y > 399 && self.pos.x < (x + w/2 +1)  && self.pos.x > (x - w/2 -1)){
            if(vectory > 0) {
//            NSLog(@"*1%d, %d, %d, %d, %f", (x + w/2),(x - w/2), self.pos.x, self.pos.y, vectory);
            vectory  = vectory * -1.0;
            vectory  = vectory * 1.3;
//            NSLog(@"*2%d, %d, %d, %d, %f", (x + w/2),(x - w/2), self.pos.x, self.pos.y, vectory);
            if(v != 0) {
                vectorx *= 1.3;
                if(v * vectorx < 0){
                    vectorx *= -1.0;
                }
            
//                NSLog(@"hit %f", vectorx);
            }
            }
        }
    
        if(x/y > 1.3 || (x - y) > 2){
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
        vectorx = 5.0;
    }
    if(vectory > maxSpeed){
        vectory = 5.0;
    }
}


@end
