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

typedef id _Nullable (^MapBlock)(T _Nonnull obj);
typedef id _Nullable (^FlatMapBlock)(T _Nonnull obj);
typedef id _Nullable (^CompactMapBlock)(T _Nonnull obj);
typedef BOOL (^PredictBlock)(T _Nonnull obj);

- (void)forEach:(void(^)(T _Nonnull obj))block;
- (void)forEachWithIndex:(void(^)(NSInteger index, T _Nonnull obj))block;
- (Sequence*)map:(MapBlock)block;
- (Sequence*)flatMap:(FlatMapBlock)block;
- (Sequence*)compactMap:(CompactMapBlock)block;
- (Sequence*)filter:(PredictBlock)blpredictock;
- (Sequence*)flat;
- (Sequence*)contact:(id<NSFastEnumeration>)otherSequence;
- (T)firstObjectWhere:(PredictBlock)predict;
- (NSInteger)firstIndexWhere:(PredictBlock)predict;
- (Sequence *)take:(NSInteger)count;
- (Sequence *)skip:(NSInteger)count;
- (Sequence *)zip:(id<NSFastEnumeration>)otherSequence;

@end
