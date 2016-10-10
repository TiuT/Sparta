//
//  SPFoundViewController.m
//  Sparta
//
//  Created by Ginvar on 16/9/30.
//  Copyright © 2016年 Ginvar. All rights reserved.
//

#import "SPFoundViewController.h"

@interface SPFoundViewController ()

@end

@implementation SPFoundViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setNav];
    
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
