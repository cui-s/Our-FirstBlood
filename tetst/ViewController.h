//
//  ViewController.h
//  tetst
//
//  Created by zhao-y on 2012/10/29.
//  Copyright (c) 2012年 zhao-y. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "testv.h"

@interface ViewController : UIViewController
{
    testv *av;
}
-(IBAction)handlePan:(UIPanGestureRecognizer *)recongizer;
- (IBAction)handleRotate:(UIRotationGestureRecognizer *)recognizer;
@property (weak, nonatomic) IBOutlet UIImageView *imageStick;
@property (strong, nonatomic) IBOutlet UIPanGestureRecognizer *reg_z;
- (IBAction)changeSize:(id)sender;
- (IBAction)changeBallSpeed:(id)sender;

@end
