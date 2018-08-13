### support chain operation

```
    Sequence
    .array(@[@1,@2,@3,@4,@5])
    .take(2)
    .map(^(NSNumber *number){
        return [NSString stringWithFormat:@"%@", number];
    })
    .forEach(^(NSString *numString){
        NSLog(@"%@, %@",[numString class], numString);
    });
```