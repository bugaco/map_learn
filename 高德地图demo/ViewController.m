//
//  ViewController.m
//  高德地图demo
//
//  Created by 李懿哲 on 08/12/2016.
//  Copyright © 2016 lyz. All rights reserved.
//

#import "ViewController.h"
#import <MAMapKit/MAMapKit.h>

@interface ViewController ()

@property (nonatomic, strong) MAMapView *mapView;
@property (nonatomic, strong) NSArray *sectionTitles;
@property (nonatomic, strong) NSArray *cities;
@property (nonatomic, strong) NSArray *provinces;
@property (nonatomic, strong) NSArray *municipalities;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _mapView = [[MAMapView alloc] initWithFrame:self.view.bounds];
    _mapView.mapType = MAMapTypeStandardNight;
    [self.view addSubview:_mapView];
    
    /*
        地图logo控件
     */
    _mapView.logoCenter = CGPointMake(CGRectGetWidth(self.view.bounds) / 2, CGRectGetHeight(self.view.bounds) / 2);
    
    /*
        指南针控件
     */
    _mapView.showsCompass = YES;
    _mapView.compassOrigin = CGPointMake(100, 200);
    
    /*
        比例尺控件
     */
    _mapView.showsScale = YES;
    _mapView.scaleOrigin = CGPointMake(30, 50);
    
    
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    _mapView.showTraffic = YES;
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    _mapView.showTraffic = NO;
}

- (void)setupCities{
    _sectionTitles = @[@"全国", @"直辖市", @"省份"];
    _cities = [MAOfflineMap sharedOfflineMap].cities;
    _provinces = [MAOfflineMap sharedOfflineMap].provinces;
    _municipalities = [MAOfflineMap sharedOfflineMap].municipalities;
}

@end
