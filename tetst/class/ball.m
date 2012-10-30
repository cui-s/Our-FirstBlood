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


- (void)move:(int)x:(int)y:(int)w;
{
    
    self.pos.x+= vectorx;
    
    if(self.pos.x < 20){
        vectorx = velocity;
    }
    
    if(self.pos.x > 300){
        vectorx  = velocity * -1;
    }
    
    
    self.pos.y += vectory;
    
    if(self.pos.y < 20){
        vectory = velocity ;
    }
    
    if(self.pos.y > 400 && self.pos.x < (x + w/2) && self.pos.x > (x - w/2)){
        vectory  = velocity * -1;
    }
    
    if(self.pos.y > 410){
        self.pos.x = 50;
        self.pos.y = 50;
    }
}


@end
