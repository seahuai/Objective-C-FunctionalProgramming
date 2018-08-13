//
//  WrapSequence+Chain.m
//  SequenceOperation
//
//  Created by 张思槐 on 2018/8/13.
//  Copyright © 2018年 张思槐. All rights reserved.
//

#import "WrapSequence+Chain.h"

#define INIT_WRAPSEQUENCE(...)  [[WrapSequence alloc] initWithSequence:__VA_ARGS__]

@implementation WrapSequence (Chain)

- (void (^)(ForEachBlock))forEach {
    return ^void (ForEachBlock block) {
        [self.sequence forEach:block];
    };
}

- (void (^)(ForEachWithIndexBlock))forEachWithIndex {
    return ^void (ForEachWithIndexBlock block) {
        [self.sequence forEachWithIndex:block];
    };
}

- (WrapSequence *(^)(MapBlock))map {
    return ^WrapSequence* (MapBlock block) {
        return INIT_WRAPSEQUENCE([self.sequence map:block]);
    };
}

- (WrapSequence *(^)(FlatMapBlock))flatMap {
    return ^WrapSequence* (FlatMapBlock block) {
        return INIT_WRAPSEQUENCE([self.sequence flatMap:block]);
    };
}

- (WrapSequence *(^)(CompactMapBlock))compactMap {
    return ^WrapSequence* (CompactMapBlock block) {
        return INIT_WRAPSEQUENCE([self.sequence compactMap:block]);
    };
}

- (WrapSequence *(^)(PredictBlock))filter {
    return ^WrapSequence* (PredictBlock block) {
        return INIT_WRAPSEQUENCE([self.sequence filter:block]);
    };
}

- (WrapSequence*)flat {
    return INIT_WRAPSEQUENCE([self.sequence flat]);
}

- (WrapSequence* (^)(id<NSFastEnumeration> otherSequence))contact {
    return ^WrapSequence* (id<NSFastEnumeration> otherSequence) {
        return INIT_WRAPSEQUENCE([self.sequence contact:otherSequence]);
    };
}

- (id (^)(PredictBlock block))firstObject {
    return ^id (PredictBlock block) {
        return [self.sequence firstObjectWhere:block];
    };
}

- (NSInteger (^)(PredictBlock block))firstIndex {
    return ^NSInteger (PredictBlock block) {
        return [self.sequence firstIndexWhere:block];
    };
}

- (WrapSequence *(^)(NSUInteger count))take {
    return ^WrapSequence* (NSUInteger count) {
        return INIT_WRAPSEQUENCE([self.sequence take:count]);
    };
}

- (WrapSequence *(^)(NSUInteger count))skip {
    return ^WrapSequence* (NSUInteger count) {
        return INIT_WRAPSEQUENCE([self.sequence skip:count]);
    };
}
- (id(^)(id startValue, ReduceBlock block))reduceWithStartValue {
    return ^id (id value, ReduceBlock block) {
        return [self.sequence reduceWithStartValue:value reduceBlock:block];
    };
}

- (id(^)(ReduceBlock block))reduce {
    return ^id (ReduceBlock block) {
        return [self.sequence reduce:block];
    };
}
- (BOOL(^)(PredictBlock block))any {
    return ^BOOL (PredictBlock block) {
        return [self.sequence any:block];
    };
}
- (WrapSequence *(^)(id<NSFastEnumeration> otherSequence))zip {
    return ^WrapSequence* (id<NSFastEnumeration> otherSequence) {
        return INIT_WRAPSEQUENCE([self.sequence zip:otherSequence]);
    };
};


@end
