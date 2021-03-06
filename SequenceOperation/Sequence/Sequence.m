//
//  Sequence.m
//  SequenceOperation
//
//  Created by 张思槐 on 2018/7/31.
//  Copyright © 2018年 张思槐. All rights reserved.
//

#import "Sequence.h"

@interface Sequence ()
@property (nonatomic, strong) id<NSFastEnumeration> collection;
@end

@implementation Sequence

- (instancetype)initWithCollection:(id<NSFastEnumeration>)collection {
    if (self = [super init]) {
        _collection = collection;
    }
    return self;
}

- (id)as:(Class)class {
    if ([(id)self.collection isMemberOfClass:class]) {
        return self.collection;
    }
    if (class == [NSArray class] && [(id)self.collection isKindOfClass:class]) {
        return [(id)self.collection copy];
    }
    //todo
    return nil;
}

- (NSArray *)asArray {
    return [self as:[NSArray class]];
}

- (NSUInteger)countByEnumeratingWithState:(NSFastEnumerationState *)state objects:(id  _Nullable __unsafe_unretained [])buffer count:(NSUInteger)len {
    return [self.collection countByEnumeratingWithState:state objects:buffer count:len];
}

- (NSEnumerator *)objectEnumerator {
    if ([(id)self.collection respondsToSelector:@selector(objectEnumerator)]) {
        return [(id)self.collection objectEnumerator];
    }else {
        return nil; // 自定义enumerator
    }
}

- (BOOL)containObject:(id)object {
    for (id obj in self) {
        if ([obj isEqual:object]) {
            return true;
        }
    }
    return false;
}

- (id)firstObject {
    for (id obj in self) {
        return obj;
    }
    return nil;
}


@end
