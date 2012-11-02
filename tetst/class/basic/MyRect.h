//
//  MyRect.h
//  tetst
//
//  Created by zhao-y on 2012/10/30.
//  Copyright (c) 2012年 zhao-y. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MyPoint.h"

@interface MyRect : NSObject{
    MyPoint* pos;
    float length;
    float width;
}

@property (readwrite, nonatomic) MyPoint* pos;
@property (readwrite, nonatomic) float length;
@property (readwrite, nonatomic) float width;

- (CGMutablePathRef)generatePath;

- (CGRect)generateRect;

@end
