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

static const int GAMESTART = 1;
static const int GAMEOVER = 0;

@interface DisplayView : UIView


@property (nonatomic) int gameStatus;

@property (nonatomic) float length;
@property (nonatomic) float width;
@property (nonatomic) float granularity;
@property (nonatomic) float coinNum;
@property (nonatomic) NSInteger gameScore;
@property (nonatomic) float gameTime;

@property (nonatomic) Ball* bao;
@property (nonatomic) Wall* wallLeft;
@property (nonatomic) Wall* wallTop;
@property (nonatomic) Wall* wallRight;

@property (nonatomic) NSMutableArray* coins;

-(void)okonau:(float)x:(float)y:(float)w:(float)v;
-(void)addCoins:(int)num;
-(void)owari;
-(void)restart;

@end
