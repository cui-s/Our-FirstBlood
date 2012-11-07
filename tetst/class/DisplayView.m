//
//  DisplayView.m
//  dt2
//
//  Created by zhao-y on 2012/10/29.
//  Copyright (c) 2012年 zhao-y. All rights reserved.
//

#import "DisplayView.h"

@implementation DisplayView

@synthesize gameTime;
@synthesize gameStatus;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code

        self.gameStatus = GAMESTART;
        
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
        
       
        
        self.coinNum = 10;
        
        // initial coins
        self.coins = [[NSMutableArray alloc]init];
        for(int i = 0; i< self.coinNum; i++){
            Coin *coinTest = [[Coin alloc]init];
            [self.coins addObject:coinTest];
        }
        
        self.gameScore = 0;
        self.gameTime = 30.0 * 1.0 / 0.017;
        
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
   
    
    
    UIImage *image =[UIImage  imageNamed:@"background.jpg"];
    CGContextDrawImage((CGContextRef)context, refreshRect, ((UIImage*)image).CGImage);

    
    //　上のWALL　描く
    UIImage *image1 =[UIImage  imageNamed:@"topWall.jpg"];    
    CGContextDrawImage((CGContextRef)context, [self.wallTop generateRect], ((UIImage*)image1).CGImage);
    //CGContextSetAlaha();
    
    //　左のWALL　描く
    UIImage *image2 =[UIImage  imageNamed:@"leftWall.jpg"];
    CGContextDrawImage((CGContextRef)context, [self.wallLeft generateRect], ((UIImage*)image2).CGImage);
    
    // 右のWALL 描く
    UIImage *image3 =[UIImage  imageNamed:@"rightWall.jpg"];
    CGContextDrawImage((CGContextRef)context, [self.wallRight generateRect], ((UIImage*)image3).CGImage);
    

    
    if(self.gameStatus == GAMEOVER){
        NSString *text = [[NSString alloc]initWithFormat:@"GAME OVER"];
        UIFont *font = [UIFont fontWithName:@"Georgia" size:20];
        [text drawAtPoint:CGPointMake(100, 100) forWidth:1000 withFont:font
              minFontSize:30 actualFontSize:NULL
            lineBreakMode:UILineBreakModeTailTruncation
       baselineAdjustment:UIBaselineAdjustmentAlignBaselines];
        
        text = [[NSString alloc]initWithFormat:@"Score:%d", self.gameScore];
        [text drawAtPoint:CGPointMake(100, 170) forWidth:1000 withFont:font
              minFontSize:30 actualFontSize:NULL
            lineBreakMode:UILineBreakModeTailTruncation
       baselineAdjustment:UIBaselineAdjustmentAlignBaselines];
        return;
    }
    
    // Coins 描く
    for(Coin* onecoin in self.coins){
        CGContextSetRGBFillColor(context,onecoin.myColor.r, onecoin.myColor.g, onecoin.myColor.b, onecoin.opacity);
        CGContextAddPath(context, [onecoin generatePath]);
        CGContextFillPath(context);
    }
    
    
    // BALL　描く
    CGContextSetRGBFillColor(context, 0.0, 0.0, 1.0, 1.0);
    CGContextAddPath(context, [self.bao generatePath]);
    CGContextFillPath(context);
    
    NSString *text = [[NSString alloc]initWithFormat:@"%d", self.gameScore];
    UIFont *font = [UIFont fontWithName:@"Georgia" size:20];
    [text drawAtPoint:CGPointMake(30, 370) forWidth:60 withFont:font
          minFontSize:8 actualFontSize:NULL
        lineBreakMode:UILineBreakModeTailTruncation
   baselineAdjustment:UIBaselineAdjustmentAlignBaselines];
    
    
    //change game time to second単位
    int tmp = self.gameTime * 0.017;
    
    NSString *text2 = [[NSString alloc]initWithFormat:@"%d", tmp];
    UIFont *font2 = [UIFont fontWithName:@"Georgia" size:20];
    [text2 drawAtPoint:CGPointMake(260, 370) forWidth:60 withFont:font
          minFontSize:8 actualFontSize:NULL
        lineBreakMode:UILineBreakModeTailTruncation
   baselineAdjustment:UIBaselineAdjustmentAlignBaselines];

}

-(void)okonau:(float)x:(float)y:(float)w:(float)v{
    if([self.bao move:x:y:w:v] == FALSE){
        //Missed the ball, GAMEOVER
        self.gameStatus = GAMEOVER;
        return;
    };
    BOOL addSingal = FALSE;
    
    for(Coin* onecoin in self.coins){
        if([onecoin isHitted] == FALSE){
            if([onecoin hitJudge:self.bao.pos.x:self.bao.pos.y] == TRUE){
                self.gameScore += onecoin.myScore;
                self.gameTime += onecoin.myTime;
                if(onecoin.kind == S_COIN){//hit S_COIN
                    addSingal = TRUE;
                }
            };
        } else {
            if([onecoin catchJudge:x:w]){
                self.gameScore += onecoin.myScore;
                self.gameTime += onecoin.myTime;
            }
        }
    }
    
    //if hit S_COIN, add coins
    if(addSingal == TRUE){
        [self addCoins:10];
    }
    
    // NSMutableArray　削除の為
    NSMutableArray*forRemove = [[NSMutableArray alloc]init];
    
    // collect gabrage coins
    for(Coin* onecoin in self.coins){
        if(onecoin.isCatched || onecoin.isMissed || onecoin.isNormalCoinAndIsEnd){
            [forRemove addObject:onecoin];
        }
    }
    
    // 削除する
    [self.coins removeObjectsInArray:forRemove];
//    NSLog(@"coins: %d", self.coins.count);
    
    
    if(self.coins.count < 5){
        [self addCoins:3];
    }
    
    //  部分　refresh 区域
    CGRect refreshRect;
    refreshRect.origin.x = 20;
    refreshRect.origin.y = 20;
    refreshRect.size.height = 380;
    refreshRect.size.width = 280;
    
    //　Refreshする
    [self setNeedsDisplayInRect:refreshRect];
    
    
    
    self.gameTime -= 1;
    
    if(self.gameTime < 0){
        self.gameStatus = GAMEOVER;
    }
}

-(void)addCoins:(int)num{
    if(self.coins.count > 100){
        return;
    }
    for(int i = 0; i < num; i++){
        Coin *coinTest = [[Coin alloc]init];
            [self.coins addObject:coinTest];
    }
}


-(void)owari{    //  部分　refresh 区域
   
    CGRect refreshRect;
    refreshRect.origin.x = 20;
    refreshRect.origin.y = 20;
    refreshRect.size.height = 380;
    refreshRect.size.width = 280;
    
    //　Refreshする
    [self setNeedsDisplayInRect:refreshRect];
}

-(void)restart{
    // Initialization code
    
    self.gameStatus = GAMESTART;
    
    
    self.coinNum = 10;
    
    self.bao = [[Ball alloc] init];
    
    // initial coins
    self.coins = [[NSMutableArray alloc]init];
    for(int i = 0; i< self.coinNum; i++){
        Coin *coinTest = [[Coin alloc]init];
        [self.coins addObject:coinTest];
    }
    
    self.gameScore = 0;
    self.gameTime = 30.0 * 1.0 / 0.017;

}

@end
