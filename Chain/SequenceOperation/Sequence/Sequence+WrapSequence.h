//
//  Sequence+WrapSequence.h
//  SequenceOperation
//
//  Created by 张思槐 on 2018/8/13.
//  Copyright © 2018年 张思槐. All rights reserved.
//

#import "Sequence.h"
#import "WrapSequence.h"

@interface Sequence<T> (WrapSequence)

+ (WrapSequence *(^)(NSArray* anArray))array;



@end
