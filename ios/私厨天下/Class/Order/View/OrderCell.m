//
//  OrderCell.m
//  私厨天下
//
//  Created by 廖靖宇 on 16/4/7.
//  Copyright © 2016年 liaojingyu. All rights reserved.
//

#import "OrderCell.h"

@implementation OrderCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    

    if (self == [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.backgroundColor =[UIColor clearColor];
        [self setupAllChilds];

    }
    return self;
}

-(void)setupAllChilds{
    //背景
    UIImageView *imageView =[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 180)];
    imageView.backgroundColor =[UIColor whiteColor];
    [self addSubview:imageView];
    
    //商家头像
    UIImageView *shopView =[[UIImageView alloc]initWithFrame:CGRectMake(20, 60, 80, 70)];
    shopView.backgroundColor =[UIColor blackColor];
    [imageView addSubview:shopView];
    
    // 商家名字
    
    // 订单状态
    
    // 价格
    
    // 日期
    
    // 配送
    
    // 再来一单
    
    
    
    
    
}


@end
