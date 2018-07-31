//
//  Sequence.h
//  SequenceOperation
//
//  Created by 张思槐 on 2018/7/31.
//  Copyright © 2018年 张思槐. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Sequence<T> : NSObject<NSFastEnumeration>

@property (nonatomic, strong) NSEnumerator *objectEnumerator;

- (instancetype)initWithCollection:(id<NSFastEnumeration>)collection;


@end
