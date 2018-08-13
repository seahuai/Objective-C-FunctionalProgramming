//
//  Sequence+Operation.h
//  SequenceOperation
//
//  Created by 张思槐 on 2018/7/31.
//  Copyright © 2018年 张思槐. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Sequence.h"

@interface Sequence<T> (Operation)

typedef void(^ForEachBlock)(T _Nonnull obj);
typedef void(^ForEachWithIndexBlock)(NSUInteger index, T _Nonnull obj);
typedef id _Nullable (^MapBlock)(T _Nonnull obj);
typedef id _Nullable (^FlatMapBlock)(T _Nonnull obj);
typedef id _Nullable (^CompactMapBlock)(T _Nonnull obj);
typedef BOOL (^PredictBlock)(T _Nonnull obj);
typedef id (^ReduceBlock)(id value, T _Nonnull obj);


- (void)forEach:(ForEachBlock)block;
- (void)forEachWithIndex:(ForEachWithIndexBlock)block;
- (Sequence*)map:(MapBlock)block;
- (Sequence*)flatMap:(FlatMapBlock)block;
- (Sequence*)compactMap:(CompactMapBlock)block;
- (Sequence*)filter:(PredictBlock)blpredictock;
- (Sequence*)flat;
- (Sequence*)contact:(id<NSFastEnumeration>)otherSequence;
- (T)firstObjectWhere:(PredictBlock)predict;
- (NSInteger)firstIndexWhere:(PredictBlock)predict;
- (Sequence *)take:(NSUInteger)count;
- (Sequence *)skip:(NSUInteger)count;
- (id)reduceWithStartValue:(id)startValue reduceBlock:(ReduceBlock)block;
- (id)reduce:(ReduceBlock)block;
- (BOOL)any:(PredictBlock)block;
- (Sequence *)zip:(id<NSFastEnumeration>)otherSequence;

@end
