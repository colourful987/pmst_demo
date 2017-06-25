//
//  main.m
//  AddressSanitizerDemo2
//
//  Created by pmst on 22/06/2017.
//  Copyright © 2017 pmst. All rights reserved.
//

#import <Foundation/Foundation.h>

int *allocate(){
    return malloc(sizeof(int));
}

void deallocate(int *p) {
    free(p);
}

void perform_heap_operations(){
    int *integer_pointer = allocate();
    int *integer_pointer1 = allocate();
    *integer_pointer = 42;
    *integer_pointer1 = 0x12345678;
    NSLog(@"%d",*integer_pointer);
    deallocate(integer_pointer);
    NSLog(@"Done.");
    deallocate(integer_pointer1);
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        perform_heap_operations();
    }
    return 0;
}
