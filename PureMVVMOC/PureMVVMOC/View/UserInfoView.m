//
//  UserInfoView.m
//  PureMVVMOC
//
//  Created by vine on 2019/4/21.
//  Copyright © 2019 vine. All rights reserved.
//

#import "UserInfoView.h"

// context of KVO
static NSInteger ctxKVOName     = 0;
static NSInteger ctxKVOAge      = 1;
static NSInteger ctxKVOCity     = 2;

@implementation UserInfoView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.textFieldName = [[UITextField alloc] initWithFrame:CGRectMake(20, 50, 200, 30)];
        self.textFieldName.text = @"name";
        [self addSubview:self.textFieldName];
        
        self.textFieldAge = [[UITextField alloc] initWithFrame:CGRectMake(20, 100, 200, 30)];
        self.textFieldAge.text = @"age";
        [self addSubview:self.textFieldAge];
        
        self.textFieldCity = [[UITextField alloc] initWithFrame:CGRectMake(20, 150, 200, 30)];
        self.textFieldCity.text = @"city";
        [self addSubview:self.textFieldCity];
    }
    return self;
}

- (void)setViewModelUserInfo:(UserInfoViewModel *)viewModelUserInfo
{
    _viewModelUserInfo = viewModelUserInfo;
    
    // View -> Model
    /**
     Using UserEvent to bind
     */
    [self.textFieldName addTarget:self
                           action:@selector(actionViewTextFieldChanged:)
                 forControlEvents:UIControlEventEditingChanged];
    [self.textFieldAge addTarget:self
                          action:@selector(actionViewTextFieldChanged:)
                forControlEvents:UIControlEventEditingChanged];
    [self.textFieldCity addTarget:self
                           action:@selector(actionViewTextFieldChanged:)
                 forControlEvents:UIControlEventEditingChanged];
    
    
    // Model -> View
    /**
     Using KVO to bind
     */
    [_viewModelUserInfo.modelUserInfo addObserver:self
                                       forKeyPath:@"name"
                                          options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionInitial
                                          context:&ctxKVOName];
    [_viewModelUserInfo.modelUserInfo addObserver:self
                                       forKeyPath:@"age"
                                          options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionInitial
                                          context:&ctxKVOAge];
    [_viewModelUserInfo.modelUserInfo addObserver:self
                                       forKeyPath:@"city"
                                          options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionInitial
                                          context:&ctxKVOCity];
}

- (void)actionViewTextFieldChanged:(UITextView *)sender
{
    NSLog(@"View -> Model--%d", __LINE__);
    
    if ([sender isEqual:self.textFieldName]) {
        self.viewModelUserInfo.modelUserInfo.name = sender.text;
    } else if ([sender isEqual:self.textFieldAge]) {
        self.viewModelUserInfo.modelUserInfo.age = [sender.text integerValue];
    } else if ([sender isEqual:self.textFieldCity]) {
        self.viewModelUserInfo.modelUserInfo.city = sender.text;
    }
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    NSLog(@"Model -> View--%d", __LINE__);
    if (context == &ctxKVOName) {
        
        NSString *newName = change[NSKeyValueChangeNewKey];
        if (![newName isKindOfClass:[NSNull class]] && newName) {
            dispatch_async(dispatch_get_main_queue(), ^{
                self.textFieldName.text = newName;
            });
        }
        
    } else if (context == &ctxKVOAge) {
        
        NSNumber *newAge = change[NSKeyValueChangeNewKey];
        if (![newAge isKindOfClass:[NSNull class]] && newAge) {
            dispatch_async(dispatch_get_main_queue(), ^{
                self.textFieldAge.text = [NSString stringWithFormat:@"%@", newAge];
            });
        }
        
    } else if (context == &ctxKVOCity) {
        
        NSString *newCity = change[NSKeyValueChangeNewKey];
        if (![newCity isKindOfClass:[NSNull class]] && newCity) {
            dispatch_async(dispatch_get_main_queue(), ^{
                self.textFieldCity.text = newCity;
            });
        }
        
    } else {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}
@end
