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

- (id)init
{
   
    if(self == [super init]){
        pos = [[MyPoint alloc]init];
        velocity = 1.9;
        vectorx = velocity;
        vectory = velocity;
        length = 5;
        width = 5;
    }
    return self;
}


- (void)move:(int)x:(int)y:(int)w:(int)v;
{
    static int gameOverFlag = 0;
    
    
    self.pos.x+= vectorx;
    self.pos.y += vectory;
    self.pos.y += 1.0;
    
    if(gameOverFlag == 1){
        
       // NSLog(@"%d", self.pos.y);
        if(pos.y > 700) {
            pos.x = 50;
            pos.y = 50;
            vectorx = velocity;
            vectory = velocity;
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
    
        if(self.pos.y < 411 && self.pos.y > 399 && self.pos.x < (x + w/2)  && self.pos.x > (x - w/2)){
            if(vectory > 0) {
//            NSLog(@"*1%d, %d, %d, %d, %f", (x + w/2),(x - w/2), self.pos.x, self.pos.y, vectory);
            vectory  = vectory * -1.0;
            vectory  = vectory - 0.5;
//            NSLog(@"*2%d, %d, %d, %d, %f", (x + w/2),(x - w/2), self.pos.x, self.pos.y, vectory);
            if(v != 0) {
                vectorx += 0.5;
                if(v * vectorx < 0){
                    vectorx *= -1.0;
                }
            
                NSLog(@"hit %f", vectorx);
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
            NSLog(@"GameOver, %d", self.pos.y);
            gameOverFlag = 1;
        }
    }
}


@end
