//
//  AppDelegate.m
//  AddressSanitizerDemo
//
//  Created by pmst on 21/06/2017.
//  Copyright © 2017 pmst. All rights reserved.
//

#import "AppDelegate.h"

BOOL is_some_condition_true () {
    return YES;
}

int calculate_value(){
    return 1;
}

/// 定义一个指针函数
int *returns_address_of_stack() {
    // 1
    int a = 42;
    return &a;
}

@interface AppDelegate ()

@end

@implementation AppDelegate

char * buffer;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    /// 1 detect use-after-free issues
    buffer = malloc(32);
    snprintf(buffer, 32, "Hello, World!");
    NSLog(@"%s",buffer);
    free(buffer);
    
    /// 2 detect use-after-scope issues
//    int *integer_pointer = NULL; // 1
//    if (is_some_condition_true()) {
//        int value = calculate_value(); //2
//        integer_pointer = &value; // 3
//    }
//    *integer_pointer = 42; // 4
    
    /// 3 detect use-after-return issues
    int *integer_pointer = returns_address_of_stack();
    *integer_pointer = 43;
    return YES;
}

- (void)applicationWillTerminate:(UIApplication *)application {
    /// 1 detect use-after-free issues
    NSLog(@"%s",buffer);
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}





@end
