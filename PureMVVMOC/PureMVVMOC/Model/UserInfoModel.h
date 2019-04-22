//
//  UserInfoModel.h
//  PureMVVMOC
//
//  Created by vine on 2019/4/21.
//  Copyright © 2019 vine. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface UserInfoModel : NSObject

@property (nonatomic, copy)     NSString    *name;
@property (nonatomic, assign)   NSInteger   age;
@property (nonatomic, copy)     NSString    *city;

@end

NS_ASSUME_NONNULL_END
