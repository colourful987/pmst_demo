//
//  ViewController.m
//  MainThreadCheckerDemo1
//
//  Created by pmst on 21/06/2017.
//  Copyright © 2017 pmst. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (IBAction)changeText:(UIButton *)sender {
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    dispatch_async(queue, ^{
        // 执行繁重的计算工作 这里用延迟模拟
        [NSThread sleepForTimeInterval:5];
        
        // 更新UI
        self.descriptionLabel.text = @"计算完毕";
    });
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
