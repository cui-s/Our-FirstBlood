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

        self.granularity = 20;
        
        self.width = frame.size.width;
        self.length = frame.size.height;

        
        // initial ball
        self.bao = [[Ball alloc]init];
        
        // initial left wall
        self.wallLeft = [[Wall alloc]init];
        self.wallLeft.width = self.granularity;
        self.wallLeft.length = self.length;
        self.wallLeft.pos.x = 0;
        self.wallLeft.pos.y = 0;
        
        // initial top wall
        self.wallTop = [[Wall alloc]init];
        self.wallTop.width = self.width - self.granularity * 2;
        self.wallTop.length = self.granularity;
        self.wallTop.pos.x = self.granularity;
        self.wallTop.pos.y = 0;
        
        // initial right wall
        self.wallRight = [[Wall alloc]init];
        self.wallRight.width = self.granularity;
        self.wallRight.length = self.length;
        self.wallRight.pos.x = self.width - self.granularity;
        self.wallRight.pos.y = 0;
        
       
        
        self.coinNum = 2500;
        
        // initial coins
        self.coins = [[NSMutableArray alloc]init];
        for(int i = 0; i< self.coinNum; i++){
            Coin *coinTest = [[Coin alloc]init];
            [self.coins addObject:coinTest];
        }
        
        self.gameScore = 0;
        
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

    //  部分　きれいにする
    CGRect refreshRect;
    refreshRect.origin.x = 20;
    refreshRect.origin.y = 20;
    refreshRect.size.height = 380;
    refreshRect.size.width = 280;
    CGContextClearRect(context, refreshRect);
    

//    CGContextBeginPath(context);
//    //Draw Coins
//        for(Coin* onecoin in self.coins){
//            CGContextAddPath(context, [onecoin generatePath]);
//        }
//    CGContextClosePath(context);
  

    // Coins 描く
    for(Coin* onecoin in self.coins){
        CGContextSetRGBFillColor(context,onecoin.myColor.r, onecoin.myColor.g, onecoin.myColor.b, onecoin.opacity);
        CGContextAddPath(context, [onecoin generatePath]);
        CGContextFillPath(context);
    }
    
    //　上のWALL　描く
    CGContextSetRGBFillColor(context,1.0, 1.0, 0.0, 1.0);
    CGContextAddPath(context, [self.wallTop generatePath]);
    CGContextFillPath(context);
    
    //　左のWALL　描く
    CGContextSetRGBFillColor(context,1.0, 1.0, 0.0, 1.0);
    CGContextAddPath(context, [self.wallLeft generatePath]);
    CGContextFillPath(context);
    
    // 右のWALL 描く
    CGContextSetRGBFillColor(context,1.0, 1.0, 0.0, 1.0);
    CGContextAddPath(context, [self.wallRight generatePath]);
    CGContextFillPath(context);
    
    
    
    // BALL　描く
    CGContextSetRGBFillColor(context, 0.0, 0.0, 1.0, 1.0);
    CGContextAddPath(context, [self.bao generatePath]);
    CGContextFillPath(context);
    
    NSString *text = [[NSString alloc]initWithFormat:@"%d", self.gameScore];
    UIFont *font = [UIFont systemFontOfSize:20];
    [text drawAtPoint:CGPointMake(30, 380) forWidth:60 withFont:font
          minFontSize:8 actualFontSize:NULL
        lineBreakMode:UILineBreakModeTailTruncation
   baselineAdjustment:UIBaselineAdjustmentAlignBaselines];

}

-(void)okonau:(int)x:(int)y:(int)w:(int)v{
    [self.bao move:x:y:w:v];
    
    
    for(Coin* onecoin in self.coins){
        if([onecoin isHitted] == FALSE){
            if([onecoin hitJudge:self.bao.pos.x:self.bao.pos.y] == TRUE){
                self.gameScore += onecoin.myScore;
            };
        } else {
            if([onecoin catchJudge:x:w]){
                self.gameScore += onecoin.myScore;
              //  NSLog(@"%d", self.gameScore);
            }
        }
    }
    
    // NSMutableArray　削除の為
    NSMutableArray*forRemove = [[NSMutableArray alloc]init];
    
    // collect gabrage coins
    for(Coin* onecoin in self.coins){
        if(onecoin.isCatched == true || onecoin.isMissed){
            [forRemove addObject:onecoin];
        }
    }
    
    // 削除する
    [self.coins removeObjectsInArray:forRemove];
//    NSLog(@"coins: %d", self.coins.count);
    
    
    //  部分　refresh 区域
    CGRect refreshRect;
    refreshRect.origin.x = 20;
    refreshRect.origin.y = 20;
    refreshRect.size.height = 380;
    refreshRect.size.width = 280;
    
    //　Refreshする
    [self setNeedsDisplayInRect:refreshRect];
}

@end
