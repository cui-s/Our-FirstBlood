//
//  ViewController.m
//  tetst
//
//  Created by zhao-y on 2012/10/29.
//  Copyright (c) 2012年 zhao-y. All rights reserved.
//

#import "ViewController.h"

#import "DisplayView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    
    CGSize size = CGSizeMake(320, 400);
    av = [[DisplayView alloc] initWithFrame:CGRectMake(0, 0, size.width, size.height)];
    
    [av setLength:(400)];
    [av setWidth:(320)];
    
    
    [[self view] addSubview:av];
    //create timer
    NSTimer *timer;
    timer = [NSTimer scheduledTimerWithTimeInterval: 0.017
                                             target: self
                                           selector: @selector(handleTimer:)
                                           userInfo: nil
                                            repeats: YES];
}

//Inertia Moving


-(IBAction)handlePan:(UIPanGestureRecognizer *)recongizer{
    
    CGPoint translation = [recongizer translationInView:self.view];
    
    
    
    recongizer.view.center = CGPointMake(recongizer.self.view.center.x + translation.x,recongizer.view.center.y);
    
    
    
    [recongizer setTranslation:CGPointMake(0, 0) inView:self.view];
    
    if (recongizer.state == UIGestureRecognizerStateEnded) {
        
        
        
        CGPoint velocity = [recongizer velocityInView:self.view];//define the velocity
        
        CGFloat magnitude = sqrtf((velocity.x * velocity.x) + (velocity.y * velocity.y));//y disabled,define the speed
        
      
        
//        NSLog(@"magnitude: %f, slideMult: %f", magnitude, slideMult);
        
        
        
        float slideFactor = 0.2 * magnitude *0.01; // Increase for more of a slide
        
        CGPoint finalPoint = CGPointMake(recongizer.view.center.x + (velocity.x * slideFactor),
                                         
                                         recongizer.view.center.y );
        
        finalPoint.x = MIN(MAX(finalPoint.x, 0), self.view.bounds.size.width);
        
        finalPoint.y = MIN(MAX(finalPoint.y, 0), self.view.bounds.size.height);
        
        
        
        [UIView animateWithDuration:slideFactor*1 delay:0
         
                            options:UIViewAnimationOptionCurveEaseOut animations:^{
                                
                                recongizer.view.center = finalPoint;
                                
                            } completion:nil];
        
        
        
    }
    
    if(recongizer.self.view.center.x>=300-self.imageStick.bounds.size.width/2)
        
        recongizer.view.center = CGPointMake(300-self.imageStick.bounds.size.width/2,recongizer.view.center.y);
    
    if(recongizer.self.view.center.x<=20+self.imageStick.bounds.size.width/2)
        
        recongizer.view.center = CGPointMake(20+self.imageStick.bounds.size.width/2,recongizer.view.center.y);
}




- (void) handleTimer: (NSTimer *) timer
{
    //cacluate velocity
//    CGPoint velocity = [self.reg_z velocityInView:self.view];
    
    GLfloat imaNoBarPostion = self.reg_z.view.center.x;
    
    float tmp = imaNoBarPostion - maeniNoBarPosition;
    
    maeniNoBarPosition = sakiNoBarPosition;
    
    sakiNoBarPosition = imaNoBarPostion;
//    NSLog(@"%3.1f", tmp*100 );
    
    
    if(av.gameStatus == GAMEOVER){
        if(tmp * 100 > 1500){
//            NSLog(@"gogogo");
            [av restart];
        }
        [av owari];
    } else {
    
        [av okonau:self.reg_z.view.center.x
              :self.reg_z.view.center.y
              :self.reg_z.view.bounds.size.width
              :tmp*100.0];
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
   

}

- (IBAction)changeSize:(id)sender {
    
    
    UISlider * sld = (UISlider *)sender;
    float size = sld.value;
    
    self.imageStick.bounds = CGRectMake(0, 0, 80*size, 24);
//    NSLog(@"%f",self.self.reg_z.view.center.x);
    
//    NSLog(@"%f",self.imageStick.bounds.size.width);
    if (self.reg_z.view.center.x - self.imageStick.bounds.size.width/2<20) {
        self.reg_z.view.center = CGPointMake(20+self.imageStick.bounds.size.width/2,self.reg_z.view.center.y);
    }
    if (self.reg_z.view.center.x + self.imageStick.bounds.size.width/2>300) {
        self.reg_z.view.center = CGPointMake(300-self.imageStick.bounds.size.width/2,self.reg_z.view.center.y);
        
        
    }
    
}

- (IBAction)changeBallSpeed:(id)sender {
    
    
    UISlider * sld = (UISlider *)sender;
    
    
    
    
    
}


@end
