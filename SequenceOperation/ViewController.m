//
//  ViewController.m
//  SequenceOperation
//
//  Created by 张思槐 on 2018/7/31.
//  Copyright © 2018年 张思槐. All rights reserved.
//

#import "ViewController.h"
#import "Sequence.h"
#import "Sequence+Operation.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    Sequence<NSNumber*> *numbers = [[Sequence alloc] initWithCollection: @[@1, @2, @3, @4]];
    Sequence *characters =[[Sequence alloc] initWithCollection:@[@"a", @"b", @"c"]];
    
    [[numbers zip:characters] forEach:^(id  _Nonnull obj) {
        NSLog(@"%@",obj);
    }];
    
    NSNumber *result = [numbers reduceWithStartValue:@10 reduceBlock:^id(id value, NSNumber * _Nonnull obj) {
        NSInteger tmp = ((NSNumber*)value).integerValue + obj.integerValue;
        return [NSNumber numberWithInteger:tmp];
    }];
    NSLog(@"%@", result);

}

@end
