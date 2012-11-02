//
//  DisplayView.h
//  dt2
//
//  Created by zhao-y on 2012/10/29.
//  Copyright (c) 2012年 zhao-y. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "Ball.h"
#import "Wall.h"
#import "Coin.h"
@interface DisplayView : UIView

@property (nonatomic) float length;
@property (nonatomic) float width;
@property (nonatomic) float granularity;
@property (nonatomic) float coinNum;
@property (nonatomic) NSInteger gameScore;
@property (nonatomic) int gameTime;

@property (nonatomic) Ball* bao;
@property (nonatomic) Wall* wallLeft;
@property (nonatomic) Wall* wallTop;
@property (nonatomic) Wall* wallRight;

@property (nonatomic) NSMutableArray* coins;

-(void)okonau:(float)x:(float)y:(float)w:(float)v;
-(void)addCoins:(int)num;

@end
