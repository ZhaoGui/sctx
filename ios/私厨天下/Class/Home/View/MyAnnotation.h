//
//  MyAnnotation.h
//  Map
//
//  Created by 廖靖宇 on 15/12/20.
//  Copyright © 2015年 liaojingyu. All rights reserved.
//

/*
 该类就是自定义大头针
 
 */


#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>
@interface MyAnnotation : NSObject <MKAnnotation>
//传入地理位置
//title
@property (nonatomic, copy) NSString *aTitle;

@property (nonatomic, copy) NSString *aSubTitle;

//地理坐标
@property (nonatomic,readwrite) CLLocationCoordinate2D coordinate;

@end
