//
//  main.m
//  IntegerOverflowDemo
//
//  Created by pmst on 23/06/2017.
//  Copyright © 2017 pmst. All rights reserved.
//

#import <Foundation/Foundation.h>


int average(int *array, int length) {
    int total = 0;
    
    for (int idx = 0; idx < length; idx++) {
        total += array[idx];
    }
    return total/length;
}

int getNonNegativeInteger(){
    return 43;
}

void testNonNegativeAverage(){
    int length = 10001;
    int array[length];
    
    for (int idx = 0; idx < length; idx++) {
        array[idx] = getNonNegativeInteger();
    }
    
    int avg = average(array, length);
    
    assert( avg >= 0);
}


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        int x = 2147483647;
        x += 1;
        NSLog(@"x value is %d",x);// 输出-2147483648
    }
    return 0;
}
