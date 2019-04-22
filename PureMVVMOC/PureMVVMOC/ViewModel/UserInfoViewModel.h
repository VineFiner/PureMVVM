//
//  UserInfoViewModel.h
//  PureMVVMOC
//
//  Created by vine on 2019/4/21.
//  Copyright © 2019 vine. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserInfoModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface UserInfoViewModel : NSObject
@property (nonatomic, strong) UserInfoModel *modelUserInfo;

/**
 模拟服务端等对Model进行修改
 */
- (void)updateModelFromMockWeb;
@end

NS_ASSUME_NONNULL_END
