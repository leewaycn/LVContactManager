//
//  homeViewController.m
//  purecodeDemo
//
//  Created by 孔友夫 on 2018/5/15.
//  Copyright © 2018年 LeeJay. All rights reserved.
//

#import "homeViewController.h"
#import "LJContactManager.h"
@interface homeViewController ()

@end

@implementation homeViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor lightGrayColor];


    NSArray *tits = @[@"",@"",@"",@""];
    for (int i = 0; i< 4; i++) {

        UIButton *btn = [UIButton new];
        btn.frame =CGRectMake(0, i*50, 300, 50);
        [btn setTitle:tits[i] forState:UIControlStateNormal];
        btn.backgroundColor = [UIColor blueColor];

        [self.view addSubview:btn];
        [btn addTarget:self action:@selector(btnclick:) forControlEvents:UIControlEventTouchUpInside];
        btn.tag = i;
    }


}
-(void)btnclick:(UIButton*)btn{

    switch (btn.tag) {
        case 0:
            {
                [[LJContactManager sharedInstance] selectContactAtController:self complection:^(NSString *name, NSString *phone) {
//                    self.nameTextField.text = name;
//                    self.phoneNumTextField.text = phone;
                }];
            }
            break;

        default:
            break;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
