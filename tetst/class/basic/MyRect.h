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
    int length;
    int width;
}
- (void)move:(int)x:(int)y:(int)w;

@property (readwrite, nonatomic) MyPoint* pos;
@property (readwrite, nonatomic) int length;
@property (readwrite, nonatomic) int width;

- (CGMutablePathRef)generatePath;

@end
