//
//  UserInfoView.h
//  PureMVVMOC
//
//  Created by vine on 2019/4/21.
//  Copyright © 2019 vine. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UserInfoViewModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface UserInfoView : UIView

@property (nonatomic, strong) UITextField *textFieldName;
@property (nonatomic, strong) UITextField *textFieldAge;
@property (nonatomic, strong) UITextField *textFieldCity;

/**
 View持有ViewModel，ViewModel持有Model
 */
@property (nonatomic, strong) UserInfoViewModel *viewModelUserInfo;

@end

NS_ASSUME_NONNULL_END
