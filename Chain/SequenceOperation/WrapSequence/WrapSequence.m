//
//  WrapSequence.m
//  SequenceOperation
//
//  Created by 张思槐 on 2018/8/13.
//  Copyright © 2018年 张思槐. All rights reserved.
//

#import "WrapSequence.h"

@interface WrapSequence ()

@property (nonatomic, strong) Sequence *sequence;

@end

@implementation WrapSequence

- (instancetype)initWithSequence:(Sequence *)sequence {
    if (self = [super init]) {
        _sequence = sequence;
    }
    return self;
}

- (Sequence *)unwrap {
    return self.sequence;
}

- (NSArray *)asArray {
    return [self.sequence asArray];
}

- (id)as:(Class)class {
    return [self.sequence as:class];
}



@end
