//
//  DisplayView.h
//  dt2
//
//  Created by zhao-y on 2012/10/29.
//  Copyright (c) 2012年 zhao-y. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "Ball.h"

@interface DisplayView : UIView

@property (nonatomic) int length;
@property (nonatomic) int width;
@property (nonatomic) Ball* bao;

-(void)okonau:(int)x:(int)y:(int)w;

@end
