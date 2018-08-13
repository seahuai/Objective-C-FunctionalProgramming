//
//  Sequence+WrapSequence.m
//  SequenceOperation
//
//  Created by 张思槐 on 2018/8/13.
//  Copyright © 2018年 张思槐. All rights reserved.
//

#import "Sequence+WrapSequence.h"

@implementation Sequence (WrapSequence)

+ (WrapSequence *(^)(NSArray *))array {
    return ^WrapSequence* (NSArray *anArray) {
        Sequence *sequence = [[Sequence alloc] initWithCollection:anArray];
        WrapSequence *wrapSequence = [[WrapSequence alloc] initWithSequence:sequence];
        return wrapSequence;
    };
}

@end
