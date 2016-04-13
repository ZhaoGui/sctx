//
//  MyAnnotation.m
//  Map
//
//  Created by 廖靖宇 on 15/12/20.
//  Copyright © 2015年 liaojingyu. All rights reserved.
//

#import "MyAnnotation.h"

@implementation MyAnnotation

//标注的标题
-(NSString *)title{

return @"你当前的位置";

}

//地理坐标信息
-(NSString *)subtitle{
    //subTitle是子标题
    if(_aSubTitle !=nil){
        return _aSubTitle;
    }
return @"";
}

@end
