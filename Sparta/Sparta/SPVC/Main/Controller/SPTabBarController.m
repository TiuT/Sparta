#import "SPTabBarController.h"
#import "SPNavigationController.h"
#import "SPFoundViewController.h"
#import "SPSubscribeViewController.h"
#import "SPTopicViewController.h"
#import "SPMeViewController.h"
//#import "LYDanPingController.h"
//#import "LYCategoryController.h"
//#import "LYMeController.h"

@interface SPTabBarController ()<UITabBarDelegate>

@end

@implementation SPTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    // 添加子控制器
    [self addChildController:[[SPFoundViewController alloc] init] imageName:@"TabBar_home_23x23_" selectedImage:@"TabBar_home_23x23_selected" title:@"发现"];
    
    [self addChildController:[[SPSubscribeViewController alloc] init] imageName:@"TabBar_gift_23x23_" selectedImage:@"TabBar_gift_23x23_selected" title:@"订阅"];
    
    [self addChildController:[[SPTopicViewController alloc] init] imageName:@"TabBar_category_23x23_" selectedImage:@"TabBar_category_23x23_selected" title:@"话题"];
    
    [self addChildController:[[SPMeViewController alloc] init] imageName:@"TabBar_me_boy_23x23_" selectedImage:@"TabBar_me_boy_23x23_selected" title:@"我的"];

}


/**
 *	@brief	设置TabBarItem主题
 */

+ (void)initialize {
    
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSFontAttributeName] = [UIFont systemFontOfSize:12];
    attrs[NSForegroundColorAttributeName] = [UIColor grayColor];
    
    NSMutableDictionary *selectedAttrs = [NSMutableDictionary dictionary];
    selectedAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:12];
    selectedAttrs[NSForegroundColorAttributeName] = SPGlobalBg;
    
    UITabBarItem *item = [UITabBarItem appearance];
    
    [item setTitleTextAttributes:attrs forState:UIControlStateNormal];
    [item setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];
    
    
}

/**
 *	@brief	添加子控制器
 *
 *	@param 	childVC 	子控制期器
 *	@param 	imageName 	默认图片
 *	@param 	selectedName 	选中图片
 *	@param 	title 	标题
 */
- (void)addChildController:(UIViewController *)childVC imageName:(NSString *)image selectedImage:(NSString *)selectedImage title:(NSString *)title
{
    
    // 设置文字和图片
    childVC.title = title;
    childVC.tabBarItem.image = [UIImage sp_imageOriginalWithName:image];
    childVC.tabBarItem.selectedImage = [UIImage sp_imageOriginalWithName:selectedImage];
    
    // 包装一个导航控制器，添加导航控制器为tabBarController的子控制器
    SPNavigationController *nav = [[SPNavigationController alloc] initWithRootViewController:childVC];
    
    [self addChildViewController:nav];
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
