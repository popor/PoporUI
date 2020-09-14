//
//  PoporUIVCPresenter.m
//  PoporUI
//
//  Created by apple on 2019/9/16.
//  Copyright © 2019 wangkq. All rights reserved.

#import "PoporUIVCPresenter.h"
#import "PoporUIVCInteractor.h"

#import "VC_UITextField+pPlaceholder.h"
#import "BTVC.h"
#import "LabelVC.h"
#import "TfVC.h"
#import "ACVC.h"
#import "NcBarLineVC.h"


@interface PoporUIVCPresenter ()

@property (nonatomic, weak  ) id<PoporUIVCProtocol> view;
@property (nonatomic, strong) PoporUIVCInteractor * interactor;

@end

@implementation PoporUIVCPresenter

- (id)init {
    if (self = [super init]) {
        
    }
    return self;
}

- (void)setMyInteractor:(PoporUIVCInteractor *)interactor {
    self.interactor = interactor;
    
}

- (void)setMyView:(id<PoporUIVCProtocol>)view {
    self.view = view;
    
}

// 开始执行事件,比如获取网络数据
- (void)startEvent {
    
    
}

#pragma mark - VC_DataSource
#pragma mark - TV_Delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 6;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 44;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString * CellID = @"CellID";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:CellID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellID];
        //cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        
    }
    
    switch (indexPath.row) {
        case 0: {
            cell.textLabel.text = [NSString stringWithFormat:@"%li : 输入框默认文字颜色", indexPath.row];
            break;
        }
        case 1: {
            cell.textLabel.text = [NSString stringWithFormat:@"%li : 按钮", indexPath.row];
            break;
        }
        case 2: {
            cell.textLabel.text = [NSString stringWithFormat:@"%li : Label", indexPath.row];
            break;
        }
        case 3: {
            cell.textLabel.text = [NSString stringWithFormat:@"%li : TextField", indexPath.row];
            break;
        }
        case 4: {
            cell.textLabel.text = [NSString stringWithFormat:@"%li : UIAlertControler", indexPath.row];
            break;
        }
        case 5: {
            cell.textLabel.text = [NSString stringWithFormat:@"%li : NC 导航栏底部线条", indexPath.row];
            break;
        }
            
        default:
            break;
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
 
    [self pushIndex:indexPath.row];
    [self saveLastVCIndex:[NSString stringWithFormat:@"%li", indexPath.row]];
}

- (void)pushIndex:(NSInteger)index {
    switch (index) {
        case 0: {
            [self.view.vc.navigationController pushViewController:[VC_UITextField_pPlaceholder new] animated:YES];
            break;
        }
        case 1: {
            [self.view.vc.navigationController pushViewController:[BTVC new] animated:YES];
            break;
        }
        case 2: {
            [self.view.vc.navigationController pushViewController:[LabelVC new] animated:YES];
            break;
        }
        case 3: {
            [self.view.vc.navigationController pushViewController:[TfVC new] animated:YES];
            break;
        }
        case 4: {
            [self.view.vc.navigationController pushViewController:[ACVC new] animated:YES];
            break;
        }
        case 5: {
            [self.view.vc.navigationController pushViewController:[NcBarLineVC new] animated:YES];
            break;
        }
            
        default:
            break;
    }
}

#pragma mark - VC_EventHandler
- (void)saveLastVCIndex:(NSString *)lastVCIndex {
    [[NSUserDefaults standardUserDefaults] setObject:lastVCIndex forKey:@"lastVCIndex"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (NSString *)getLastVCIndex {
    NSString * info = [[NSUserDefaults standardUserDefaults] objectForKey:@"lastVCIndex"];
    return info;
}



#pragma mark - Interactor_EventHandler

@end
