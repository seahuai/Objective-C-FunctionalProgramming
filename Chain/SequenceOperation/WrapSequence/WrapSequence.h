//
//  WrapSequence.h
//  SequenceOperation
//
//  Created by 张思槐 on 2018/8/13.
//  Copyright © 2018年 张思槐. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Sequence.h"

@interface WrapSequence<T> : NSObject

@property (nonatomic, strong, readonly) Sequence *sequence;

- (instancetype)initWithSequence:(Sequence<T> *)sequence;

- (Sequence<T> *)unwrap;

- (NSArray<T> *)asArray;

- (id)as:(Class)class;

@end
