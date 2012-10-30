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
        
        self.wallLeft = [[Wall alloc]init];
        self.wallLeft.width = 20;
        self.wallLeft.length = 400;
        self.wallLeft.pos.x = 0;
        self.wallLeft.pos.y = 0;
        
        self.wallTop = [[Wall alloc]init];
        self.wallTop.width = 280;
        self.wallTop.length = 20;
        self.wallTop.pos.x = 20;
        self.wallTop.pos.y = 0;
        
        self.wallRight = [[Wall alloc]init];
        self.wallRight.width = 20;
        self.wallRight.length = 400;
        self.wallRight.pos.x = 300;
        self.wallRight.pos.y = 0;
        
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
