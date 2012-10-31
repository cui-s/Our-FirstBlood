//
//  DisplayView.m
//  dt2
//
//  Created by zhao-y on 2012/10/29.
//  Copyright (c) 2012年 zhao-y. All rights reserved.
//

#import "DisplayView.h"

@implementation DisplayView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.bao = [[Ball alloc]init];
        self.bao.pos.x =50;
        self.bao.pos.y =50;
        
        self.granularity = 20;
        
        self.width = frame.size.width;
        self.length = frame.size.height;
        
        self.wallLeft = [[Wall alloc]init];
        self.wallLeft.width = self.granularity;
        self.wallLeft.length = self.length;
        self.wallLeft.pos.x = 0;
        self.wallLeft.pos.y = 0;
        
        self.wallTop = [[Wall alloc]init];
        self.wallTop.width = self.width - self.granularity * 2;
        self.wallTop.length = self.granularity;
        self.wallTop.pos.x = self.granularity;
        self.wallTop.pos.y = 0;
        
        self.wallRight = [[Wall alloc]init];
        self.wallRight.width = self.granularity;
        self.wallRight.length = self.length;
        self.wallRight.pos.x = self.width - self.granularity;
        self.wallRight.pos.y = 0;
        
        self.coinTest = [[Coin alloc]init];
        self.coinTest.pos.x = self.width/3.7;
        self.coinTest.pos.y = self.length/3;
        
        self.coinTest2 = [[Coin alloc]init];
        self.coinTest2.pos.x = self.width/2.9;
        self.coinTest2.pos.y = self.length/2.4;
        
        self.coinTest3 = [[Coin alloc]init];
        self.coinTest3.pos.x = self.width/4 * 3.3;
        self.coinTest3.pos.y = self.length/4;
        
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

-(void)drawRect:(CGRect)rect
{


    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGRect refreshRect;
    refreshRect.origin.x = 20;
    refreshRect.origin.y = 20;
    refreshRect.size.height = 380;
    refreshRect.size.width = 280;
    CGContextClearRect(context, refreshRect);
    

    
    CGContextBeginPath(context);
        CGContextAddPath(context, [self.wallLeft generatePath]);
        CGContextAddPath(context, [self.wallTop generatePath]);
        CGContextAddPath(context, [self.wallRight generatePath]);
        CGContextAddPath(context, [self.coinTest generatePath]);
        CGContextAddPath(context, [self.coinTest2 generatePath]);
        CGContextAddPath(context, [self.coinTest3 generatePath]);
        CGContextAddPath(context, [self.bao generatePath]);
    CGContextClosePath(context);
  

    
    [[UIColor grayColor] setFill];
    [[UIColor grayColor] setStroke];
    CGContextDrawPath(context,kCGPathFillStroke);
}

-(void)okonau:(int)x:(int)y:(int)w:(int)v{
    [self.bao move:x:y:w:v];
    [self.coinTest hitJudge:self.bao.pos.x:self.bao.pos.y];
    [self.coinTest2 hitJudge:self.bao.pos.x:self.bao.pos.y];
    [self.coinTest3 hitJudge:self.bao.pos.x:self.bao.pos.y];
    
    CGRect refreshRect;
    refreshRect.origin.x = 20;
    refreshRect.origin.y = 20;
    refreshRect.size.height = 380;
    refreshRect.size.width = 280;
    
    [self setNeedsDisplayInRect:refreshRect];
}

@end
