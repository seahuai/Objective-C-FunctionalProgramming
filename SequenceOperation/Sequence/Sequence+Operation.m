//
//  Sequence+Operation.m
//  SequenceOperation
//
//  Created by 张思槐 on 2018/7/31.
//  Copyright © 2018年 张思槐. All rights reserved.
//

#import "Sequence+Operation.h"

#define InitSequence(...) [[Sequence alloc] initWithCollection:__VA_ARGS__];

@implementation Sequence (Operation)

- (void)forEach:(void(^)(id _Nonnull obj))block {
    if (!block) { return; }
    void(^blockWithIndex)(NSInteger index, id _Nonnull obj) = ^(NSInteger index, id obj) {
        block(obj);
    };
    [self forEachWithIndex:blockWithIndex];
}

- (void)forEachWithIndex:(void(^)(NSInteger index, id _Nonnull obj))block {
    if (!block) { return; }
    NSUInteger index = 0;
    for(id obj in self) {
        block(index, obj);
        index ++;
    }
}

- (Sequence *)map:(MapBlock)block {
    if (!block) { return nil; }
    NSMutableArray *result = [NSMutableArray array];
    for (id objc in self) {
        id new = block(objc) ?: [NSNull null];
        [result addObject:new];
    }
    return InitSequence(result);
}

- (Sequence *)compactMap:(CompactMapBlock)block {
    if (!block) { return nil; }
    NSMutableArray *result = [NSMutableArray array];
    for (id objc in self) {
        id new = block(objc);
        if (new == nil) { continue; }
        [result addObject:new];
    }
    return InitSequence(result);
}

- (Sequence *)flatMap:(FlatMapBlock)block {
    if (!block) { return nil; }
    NSMutableArray *result = [NSMutableArray array];
    for (id objc in self) {
        id new = block(objc) ?: [NSNull null];
#warning
        if ([(id)new conformsToProtocol:@protocol(NSFastEnumeration)]) {
            Sequence *tmp = InitSequence(new);
            for (id value in tmp) {
                [result addObject:value];
            }
            continue;
        }
        [result addObject:new];
    }
    return InitSequence(result);
}

- (Sequence *)flat {
    return [self flatMap:^id _Nullable(id  _Nonnull obj) {
        return obj;
    }];
}

- (Sequence *)contact:(id<NSFastEnumeration>)otherSequence {
    if (otherSequence == nil) { return self; }
    Sequence *tmp = InitSequence(@[self, otherSequence]);
    return [tmp flat];
}

- (Sequence *)filter:(PredictBlock)predict {
    if (!predict) { return nil; }
    NSMutableArray *result = [NSMutableArray array];
    for (id obj in self) {
        if (predict(obj)) {
            [result addObject:obj];
        }
    }
    return InitSequence(result);
}

- (id)firstObjectWhere:(PredictBlock)predict {
    if (!predict) { return nil; }
    for (id obj in self) {
        if (predict(obj)){
            return obj;
        }
    }
    return nil;
}

- (NSInteger)firstIndexWhere:(PredictBlock)predict {
    if (!predict) { return NSNotFound; }
    NSInteger index = NSNotFound;
    for (id obj in self) {
        if (predict(obj)) {
            break;
        }
        index += 1;
    }
    return index;
}

- (Sequence *)take:(NSUInteger)count {
    NSMutableArray *result = [NSMutableArray array];
    NSInteger index = 0;
    for (id obj in self) {
        if (index >= count) { break; }
        [result addObject:obj];
        index += 1;
    }
    return InitSequence(result);
}

- (Sequence *)skip:(NSUInteger)count {
    NSMutableArray *result = [NSMutableArray array];
    NSInteger index = 0;
    for (id obj in self) {
        index += 1;
        if (index <= count) { continue; }
        [result addObject:obj];
    }
    return InitSequence(result);
}

- (id)reduceWithStartValue:(id)startValue reduceBlock:(ReduceBlock)block {
    if (!block || !startValue) { return nil; }
    id result = startValue;
    for (id obj in self) {
        result = block(result, obj);
    }
    return result;
}

- (id)reduce:(ReduceBlock)block {
    if (!block) { return nil; }
    id startValue = self.firstObject;
    return [[self skip:1] reduceWithStartValue:startValue reduceBlock:block];
}

- (BOOL)any:(PredictBlock)block {
    if (!block) { return false; }
    for (id obj in self) {
        if (block(obj)) {
            return true;
        }
    }
    return false;
}

- (Sequence *)zip:(id<NSFastEnumeration>)otherSequence {
    NSMutableArray *result = [NSMutableArray array];
    Sequence *tmp1 = [self flat];
    Sequence *tmp2 = [[[Sequence alloc] initWithCollection:otherSequence] flat];
    NSArray<NSEnumerator*> *_sequences = @[tmp1.objectEnumerator, tmp2.objectEnumerator];
    NSObject *breaker = [NSObject new];
    while (1) {
        NSMutableArray *values = [NSMutableArray arrayWithCapacity:2];
        [_sequences enumerateObjectsUsingBlock:^(NSEnumerator * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            id value = [obj nextObject] ?: breaker;
            [values addObject:value];
        }];
        if ([values containsObject:breaker]) {
            break;
        }
        [result addObject:values];
    }
    return InitSequence(result);
}






@end
