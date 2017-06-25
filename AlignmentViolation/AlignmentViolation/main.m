//
//  main.m
//  AlignmentViolation
//
//  Created by pmst on 23/06/2017.
//  Copyright © 2017 pmst. All rights reserved.
//

#import <Foundation/Foundation.h>

struct Packet {
    int magic;
    int payloadLength;
    char payload[];
}__attribute__((packed));

typedef struct Packet Packet;

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        char byteStream[] = {0x77,0x77,0x64,0x63,0x00,0x00,0x00,0x09,'H','e','y',0x00,'K','u','b','a','!',0x77,0x77,0x64,0x63,0x00,0x00,0x00,0x0E,'H','o','w',',','s',' ','i','t',' ','g','o','i','n','g','?'};
        
        Packet *p = (Packet *)(byteStream + 17);
        if (p->magic != 0x12233333) {
            NSLog(@"出错了");
        }
    }
    return 0;
}





























