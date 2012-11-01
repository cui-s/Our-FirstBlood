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

@property (nonatomic) int length;
@property (nonatomic) int width;
@property (nonatomic) int granularity;
@property (nonatomic) int coinNum;

@property (nonatomic) Ball* bao;
@property (nonatomic) Wall* wallLeft;
@property (nonatomic) Wall* wallTop;
@property (nonatomic) Wall* wallRight;

@property (nonatomic) NSMutableArray* coins;

-(void)okonau:(int)x:(int)y:(int)w:(int)v;

@end
