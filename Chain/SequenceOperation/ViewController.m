//
//  ViewController.m
//  SequenceOperation
//
//  Created by 张思槐 on 2018/7/31.
//  Copyright © 2018年 张思槐. All rights reserved.
//

#import "ViewController.h"
#import "Sequence+ChainOperation.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    Sequence
    .array(@[@1,@2,@3,@4,@5])
    .take(2)
    .map(^(NSNumber *number){
        return [NSString stringWithFormat:@"%@", number];
    })
    .forEach(^(NSString *numString){
        NSLog(@"%@, %@",[numString class], numString);
    });
    
}

@end
