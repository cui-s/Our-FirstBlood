//
//  ViewController.h
//  tetst
//
//  Created by zhao-y on 2012/10/29.
//  Copyright (c) 2012年 zhao-y. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DisplayView.h"

@interface ViewController : UIViewController
{
    DisplayView *av;
    GLfloat maeniNoBarPosition;
    GLfloat sakiNoBarPosition;
}
-(IBAction)handlePan:(UIPanGestureRecognizer *)recongizer;
@property (strong, nonatomic) IBOutlet UIPanGestureRecognizer *reg_z;

@end
