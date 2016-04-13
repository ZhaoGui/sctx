//
//  MineViewController.m
//  私厨天下
//
//  Created by 廖靖宇 on 16/4/7.
//  Copyright © 2016年 liaojingyu. All rights reserved.
//

#import "MineViewController.h"
#import "HeardView.h"

@interface MineViewController ()
@property (nonatomic,strong) NSArray *array;


@end

@implementation MineViewController

-(NSArray *)array{
  
    if (_array==nil) {
        _array = [NSArray arrayWithObjects:@"我的收藏",@"管理收获地址",nil];
    }
    return _array;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title =@"个人中心";
     HeardView *headerView = [[HeardView alloc] initWithFrame: CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 300)];
    self.tableView.tableHeaderView = headerView;
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 3;
}

- (NSInteger)tableView:(UITableView *)tabl2eView numberOfRowsInSection:(NSInteger)section {

    if (section ==0) {
        return 2;
    }
    if (section ==1) {
        return 2;
    }
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyCell" forIndexPath:indexPath];
    if (indexPath.section ==0) {
     cell.textLabel.text =self.array[indexPath.row];
    }
    else if(indexPath.section == 1){
        if (indexPath.row==0) {
            cell.textLabel.text = @"帮助与反馈";
        }else{
            cell.textLabel.text = @"在线客服";
        }
     
    }else{
        cell.textLabel.text =@"更多";
    }
    
    
    return cell;
}



/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
