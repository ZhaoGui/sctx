//
//  ViewController.m
//  Map
//
//  Created by 廖靖宇 on 15/12/20.
//  Copyright © 2015年 liaojingyu. All rights reserved.
//

#import "ViewController.h"
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#import "MyAnnotation.h"

@interface ViewController () <CLLocationManagerDelegate, UISearchBarDelegate>
//显示地图

//显示经纬度

@property (nonatomic, retain) CLLocationManager *locationManager;
@property (nonatomic, retain) MKMapView *mapView;

@end

@implementation ViewController
- (void)dealloc
{
    self.locationManager = nil;
    self.mapView = nil;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //定位
    [self location];
    
    //布局地图
    [self layoutMapView];
    
    //布局buttons
    [self layoutButtons];
    
}

#pragma mark- 定位

- (void)location {
    //1.创建定位对象
    self.locationManager = [[CLLocationManager alloc] init];
    
    //2.获取授权
    [_locationManager requestAlwaysAuthorization];
    
    //3.设置精确度
    _locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    
    //4.设置米数
    _locationManager.distanceFilter = 1000.0f;
    
    //5.设置代理
    _locationManager.delegate = self;
    
    //6.开始定位
    [_locationManager startUpdatingLocation];
}

//协议方法
- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations {
    //获取位置
    CLLocation *location = locations[0];
    
    //获取位置信息
    CLLocationCoordinate2D coor = location.coordinate;
    
    NSLog(@"longitude : %f  latitude : %f", coor.longitude, coor.latitude);
    //地理编译(码)
    CLGeocoder *geocoder = [[CLGeocoder alloc] init];
    [geocoder reverseGeocodeLocation:location completionHandler:^(NSArray *placemarks, NSError *error) {
        //获取位置标识对象
        MKPlacemark *mark = placemarks[0];
        NSLog(@"%@", mark.addressDictionary);
        
        NSMutableString *address = [NSMutableString string];
        for (NSString *key in mark.addressDictionary) {
            [address appendFormat:@"%@ : %@ \n", key, [mark.addressDictionary valueForKey:key]];
        }
        NSLog(@"%@", address);
        
    }];
}

#pragma mark-
#pragma mark- 地图
- (void)layoutMapView {
    //1.创建地图对象
    self.mapView = [[MKMapView alloc] initWithFrame:self.view.bounds];
    //2.配置属性
    //显示用户当前位置
    _mapView.showsUserLocation = YES;
    
    //设置跟踪
    _mapView.userTrackingMode = MKUserTrackingModeFollow;
    //设置地图类型
    _mapView.mapType = MKMapTypeStandard;
    
    //添加
    [self.view addSubview:_mapView];
    

}

#pragma mark-
#pragma mark- 布局button

- (void)layoutButtons {
    UIButton *companyBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    [companyBtn setTitle:@"学校位置" forState:UIControlStateNormal];
    
    [companyBtn addTarget:self action:@selector(getCompanyLocation:) forControlEvents:UIControlEventTouchUpInside];
    companyBtn.frame = CGRectMake(0, 0, 100, 50);
    companyBtn.center = CGPointMake(375 / 2 , 667 / 2);
    [self.view addSubview:companyBtn];
    
    
    //创建搜索框
    UISearchBar *searchBar = [[UISearchBar alloc] init];
    searchBar.delegate = self;
    //放到导航条内
    self.navigationItem.titleView = searchBar;
    
    
}

//搜索框代理
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    [searchBar resignFirstResponder]; //取消第一响应者
    NSLog(@"%@", searchBar.text);
    
    //地理位置反编码
    CLGeocoder *geocoder = [[CLGeocoder alloc] init];
    [geocoder geocodeAddressString:searchBar.text completionHandler:^(NSArray *placemarks, NSError *error) {
        //获取位置标识
        MKPlacemark *mark = placemarks[0];
        //获取位置
        CLLocation *location = mark.location;
        
        CLLocationCoordinate2D coor = location.coordinate;
        NSLog(@"%@",location);
        //创建大头针
        MyAnnotation *ann = [[MyAnnotation alloc] init];
        
        //设置位置
        ann.coordinate = coor;
        
        //设置title
        ann.aTitle = searchBar.text;
        
        //添加大头针
        [_mapView addAnnotation:ann];
        
 
        //设置显示区域
        MKCoordinateRegion region=MKCoordinateRegionMakeWithDistance(location.coordinate,1000 ,1000 );
        [_mapView setRegion:region animated:TRUE];
        
        
    }];
}

//学校位置
- (void)getCompanyLocation:(UIButton *)sender {
    //创建公司位置
    CLLocationCoordinate2D coor = CLLocationCoordinate2DMake( 30.72569600, 103.94917100);
    //创建大头针
    MyAnnotation *ann = [[MyAnnotation alloc] init];
    //设置大头针的位置
    ann.coordinate = coor;
    //设置title
    ann.aTitle = @"四川大学锦城学院";
    ann.aSubTitle = @"四川省成都市 高新西区1号";


    
    //在地图上添加大头针
    [_mapView addAnnotation:ann];
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
