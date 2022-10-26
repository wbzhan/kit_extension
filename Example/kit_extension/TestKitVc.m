//
//  TestKitVc.m
//  kit_extension_Example
//
//  Created by mac on 2022/10/25.
//  Copyright © 2022 CocoaPods. All rights reserved.
//

#import "TestKitVc.h"
#import "kit_extension-Swift.h"
@interface TestKitVc ()

@end

@implementation TestKitVc

- (void)viewDidLoad {
    [super viewDidLoad];
    UILabel * lab = [[UILabel alloc]initWithFrame:CGRectMake(30, 50, 100, 20)];
    [lab addUnderLine:@"123" color:nil];
    
    
    lab.left = 120;
    
    UIButton * btn = [[UIButton alloc]initWithFrame:CGRectMake(30, 100, 50, 50)];
    btn.backgroundColor = [UIColor colorSrting:@"#000000"];
    [btn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    // Do any additional setup after loading the view.
}

-(void)back{
    [self dismissViewControllerAnimated:true completion:nil];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
