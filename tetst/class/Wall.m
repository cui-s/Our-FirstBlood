//
//  Wall.m
//  tetst
//
//  Created by zhao-y on 2012/10/30.
//  Copyright (c) 2012年 zhao-y. All rights reserved.
//

#import "Wall.h"

@implementation Wall
- (id)init
{
    
    if(self == [super init]){
        pos = [[MyPoint alloc]init];
        length = 400;
        width = 20;
    }
    return self;
}
@end
