//
//  WrapSequence+Chain.h
//  SequenceOperation
//
//  Created by 张思槐 on 2018/8/13.
//  Copyright © 2018年 张思槐. All rights reserved.
//

#import "WrapSequence.h"
#import "Sequence+Operation.h"

@interface WrapSequence<T> (Chain)

- (void (^)(ForEachBlock block))forEach;
- (void (^)(ForEachWithIndexBlock block))forEachWithIndex;
- (WrapSequence* (^)(MapBlock block))map;
- (WrapSequence* (^)(FlatMapBlock block))flatMap;
- (WrapSequence* (^)(CompactMapBlock block))compactMap;
- (WrapSequence* (^)(PredictBlock block))filter;
- (WrapSequence*)flat;
- (WrapSequence* (^)(id<NSFastEnumeration> otherSequence))contact;
- (T (^)(PredictBlock block))firstObject;
- (NSInteger (^)(PredictBlock block))firstIndex;
- (WrapSequence *(^)(NSUInteger count))take;
- (WrapSequence *(^)(NSUInteger count))skip;
- (id(^)(id startValue, ReduceBlock block))reduceWithStartValue;
- (id(^)(ReduceBlock block))reduce;
- (BOOL(^)(PredictBlock block))any;
- (WrapSequence *(^)(id<NSFastEnumeration> otherSequence))zip;

@end
