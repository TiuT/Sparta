//
//  SPFoundViewController.m
//  Sparta
//
//  Created by Ginvar on 16/9/30.
//  Copyright © 2016年 Ginvar. All rights reserved.
//

#import "SPFoundViewController.h"
#import "SPWebViewController.h"

@interface SPFoundViewController ()

@end

@implementation SPFoundViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setNav];
    SPWebViewController* web = [[SPWebViewController alloc] initWithUrl:[NSURL URLWithString:@"http://mp.weixin.qq.com/s?__biz=MjM5NjAxNTY0MA==&mid=2651591330&idx=1&sn=18916ebe4d4a16835b17c3ce80fae821&chksm=bd1709d58a6080c3e337e9d86a4bdf20cc649586e7d4b184d3dfb68b7c777d135556f236847a&scene=0#wechat_redirect"]];
    [self.navigationController pushViewController:web animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setNav {
    self.view.backgroundColor = [UIColor whiteColor];
//    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"Feed_SearchBtn_18x18_"] style:UIBarButtonItemStylePlain target:self action:@selector(search)];
//    self.navigationItem.rightBarButtonItem = rightItem;
}

@end
