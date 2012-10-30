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
	// Do any additional setup after loading the view, typically from a nib.
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    
    CGSize size = CGSizeMake(320, 400);
    av = [[DisplayView alloc] initWithFrame:CGRectMake(0, 0, size.width, size.height)];
    
    [av setLength:(400)];
    [av setWidth:(320)];
    
    
    [[self view] addSubview:av];
    
    NSTimer *timer;
    timer = [NSTimer scheduledTimerWithTimeInterval: 0.01
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
        
        CGFloat slideMult = magnitude / 280;
        
//        NSLog(@"magnitude: %f, slideMult: %f", magnitude, slideMult);
        
        
        
        float slideFactor = 0.05 * slideMult; // Increase for more of a slide
        
        CGPoint finalPoint = CGPointMake(recongizer.view.center.x + (velocity.x * slideFactor),
                                         
                                         recongizer.view.center.y );
        
        finalPoint.x = MIN(MAX(finalPoint.x, 0), self.view.bounds.size.width);
        
        finalPoint.y = MIN(MAX(finalPoint.y, 0), self.view.bounds.size.height);
        
        
        
        [UIView animateWithDuration:slideFactor*2 delay:0
         
                            options:UIViewAnimationOptionCurveEaseOut animations:^{
                                
                                recongizer.view.center = finalPoint;
                                
                            } completion:nil];
        
        
        
    }
    
    if(recongizer.self.view.center.x>=280)
        
        recongizer.view.center = CGPointMake(280,recongizer.view.center.y);
    
    if(recongizer.self.view.center.x<=40)
        
        recongizer.view.center = CGPointMake(40,recongizer.view.center.y);}




- (void) handleTimer: (NSTimer *) timer
{
    //在这里进行处理
    [av okonau:self.reg_z.view.center.x:self.reg_z.view.center.y:self.reg_z.view.bounds.size.width];
//    NSLog(@"%f", self.reg_z.view.center.x);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
   

}

@end
