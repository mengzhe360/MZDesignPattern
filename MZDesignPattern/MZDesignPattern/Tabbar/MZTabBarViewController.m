//
//  MZTabBarViewController.m
//  MZDesignPattern
//
//  Created by 孟哲 on 2021/8/7.
//

#import "MZTabBarViewController.h"
#import "MZAViewController.h"
#import "MZBViewController.h"
#import "MZCViewController.h"

@interface MZTabBarViewController ()

@end

@implementation MZTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    MZAViewController *v1 = [MZAViewController new];
    MZBViewController *v2 = [MZBViewController new];
    MZCViewController *v3 = [MZCViewController new];
    
    UINavigationController *n1 = [[UINavigationController alloc] initWithRootViewController:v1];
    n1.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"AVC" image:nil selectedImage:nil];
    
    UINavigationController *n2 = [[UINavigationController alloc] initWithRootViewController:v2];
    n2.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"BVC" image:nil selectedImage:nil];
    
    UINavigationController *n3 = [[UINavigationController alloc] initWithRootViewController:v3];
    n3.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"CVC" image:nil selectedImage:nil];
    
    self.viewControllers = @[n1,n2,n3];
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
