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
        self.bao.ballPos.x =50;
        self.bao.ballPos.y =50;
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
    
    CGMutablePathRef thePath=CGPathCreateMutable();
    CGPathMoveToPoint(thePath,NULL,0,0);
    CGPathAddLineToPoint(thePath, NULL, self.width, 0);
    CGPathAddLineToPoint(thePath, NULL, self.width, self.length);
    CGPathAddLineToPoint(thePath, NULL, self.width - 20, self.length);
    CGPathAddLineToPoint(thePath, NULL, self.width - 20, 20);
    CGPathAddLineToPoint(thePath, NULL, 20, 20);
    CGPathAddLineToPoint(thePath, NULL, 20, self.length);
    CGPathAddLineToPoint(thePath, NULL, 0, self.length);
    CGPathCloseSubpath(thePath);
    
    
    CGContextBeginPath(context);
        CGContextAddPath(context, thePath);
        CGContextAddPath(context, [self.bao generatePath]);
    CGContextClosePath(context);
  

    
    [[UIColor blueColor] setFill];
    [[UIColor grayColor] setStroke];
    CGContextDrawPath(context,kCGPathFillStroke);
}

-(void)okonau:(int)x:(int)y:(int)w{
    [self.bao move:x:y:w];
    
    CGRect refreshRect;
    refreshRect.origin.x = 20;
    refreshRect.origin.y = 20;
    refreshRect.size.height = 380;
    refreshRect.size.width = 280;
    
    [self setNeedsDisplayInRect:refreshRect];
}

@end
