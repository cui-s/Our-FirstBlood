//
//  ball.h
//  dt2
//
//  Created by zhao-y on 2012/10/29.
//  Copyright (c) 2012年 zhao-y. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ball : NSObject{
    int x;
    int y;
    float vectorx;
    float vectory;
    float velocity;
}
- (void)move:(int)x:(int)y:(int)w;
-(float)ball_speed:(float)s;
@property (readwrite, nonatomic) int x;
@property (readwrite,nonatomic) int y;
@property (nonatomic) float vectorx;
@property (nonatomic) float vectory;
@property (nonatomic) float velocity;



@end
