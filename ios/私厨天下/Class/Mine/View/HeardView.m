//
//  HeardView.m
//  私厨天下
//
//  Created by 廖靖宇 on 16/4/7.
//  Copyright © 2016年 liaojingyu. All rights reserved.
//

#import "HeardView.h"

@implementation HeardView




- (instancetype)initWithFrame:(CGRect)frame{
    
    
    if (self =[super initWithFrame:frame]) {
        
        
        [self setupAllChilds];
 
    }
    return self;
}

-(void)setupAllChilds{
    //背景图
    UIImageView *imageView =[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height)];
    imageView.backgroundColor =[UIColor blackColor];
    imageView.userInteractionEnabled = YES;
    [self addSubview:imageView];
    
    //头像
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    btn.frame = CGRectMake(self.bounds.size.width/2 -35, self.bounds.size.height/2-90, 70, 70);
    
    [btn.layer setMasksToBounds:YES];
    
    [btn.layer setCornerRadius:35.0]; //设置矩形四个圆角半径
    
    [btn.layer setBorderWidth:1.0];   //边框宽度
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    
    CGColorRef colorref = CGColorCreate(colorSpace,(CGFloat[]){ 1, 0, 0, 1 });
    
    [btn.layer setBorderColor:colorref];//边框颜色
    
    [btn setBackgroundImage:[UIImage imageNamed:@"1.jpg"] forState:UIControlStateNormal];
    
    [btn addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
    
    [imageView addSubview:btn];
    
    //名字
    UILabel *NameLabel =[[UILabel alloc]initWithFrame:CGRectMake(self.bounds.size.width/2 -55, self.bounds.size.height/2-10, 130, 20)];
    
    NameLabel.text =@"我是名字,别打我";
    NameLabel.textColor =[UIColor whiteColor];
    
    [imageView addSubview:NameLabel];
    
    //
    for (int i =0; i<3; i++) {
        CGFloat x = i * [UIScreen mainScreen].bounds.size.width/3;
        CGFloat h = 85;
        CGFloat y = imageView.bounds.size.height-h;

        CGFloat w = [UIScreen mainScreen].bounds.size.width/3;
        UIImageView *image =[[UIImageView alloc]initWithFrame:CGRectMake(x, y, w, h)];
        image.backgroundColor =[UIColor yellowColor];
        [imageView addSubview:image];
    }

}
-(void)click{
    NSLog(@"123");
}
@end
