//
//  ViewController.m
//  PureMVVMOC
//
//  Created by vine on 2019/4/21.
//  Copyright © 2019 vine. All rights reserved.
//

#import "ViewController.h"
#import "UserInfoView.h"
#import "UserInfoViewModel.h"

@interface ViewController ()
/**
 View持有ViewModel，ViewModel持有Model
 */
@property (nonatomic, strong) UserInfoView *viewUserInfo;
@property (nonatomic, strong) UserInfoViewModel *viewModelUserInfo;

@property (nonatomic, strong) UIButton *btnUpdate;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.viewUserInfo.viewModelUserInfo = self.viewModelUserInfo;
    
    [self.view addSubview:self.viewUserInfo];
    [self.view addSubview:self.btnUpdate];
    
    // View -> Model
    [self.btnUpdate addTarget:self action:@selector(actionUpdate:) forControlEvents:UIControlEventTouchUpInside];
}

- (UserInfoView *)viewUserInfo
{
    if (!_viewUserInfo) {
        _viewUserInfo = [[UserInfoView alloc] initWithFrame:self.view.bounds];
    }
    
    return _viewUserInfo;
}

- (UserInfoViewModel *)viewModelUserInfo
{
    if (!_viewModelUserInfo) {
        _viewModelUserInfo = [[UserInfoViewModel alloc] init];
    }
    
    return _viewModelUserInfo;
}

- (UIButton *)btnUpdate
{
    if (!_btnUpdate) {
        _btnUpdate = [[UIButton alloc] initWithFrame:CGRectMake(100, 250, 100, 50)];
        _btnUpdate.backgroundColor = [UIColor greenColor];
        [_btnUpdate setTitle:@"Update" forState:UIControlStateNormal];
    }
    return _btnUpdate;
}

- (void)actionUpdate:(UIButton *)sender
{
    // Model -> View
    NSLog(@"Model -> View");
    [self.viewModelUserInfo updateModelFromMockWeb];
}

@end
