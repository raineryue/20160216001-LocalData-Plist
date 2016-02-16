//
//  ViewController.m
//  20160216001-LocalData-Plist
//
//  Created by Rainer on 16/2/16.
//  Copyright © 2016年 Rainer. All rights reserved.
//

#import "ViewController.h"

// 获取Document的路径
#define kDocumentPath NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0]
#define kDataPlistName @"data.plist"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

/**
 *  存储数据点击事件
 */
- (IBAction)saveClickAction:(id)sender {
    // 1.获取沙盒路径(第一种方法)
//    NSString *sandBoxPath = NSHomeDirectory();
//    
//    NSString *documentsPath = [sandBoxPath stringByAppendingPathComponent:@"/Documents"];
//    
//    NSString *dataPlistPath = [documentsPath stringByAppendingPathComponent:kDataPlistName];
//    
//    NSLog(@"--------->%@", dataPlistPath);
    
    // 2.获取沙盒路径(第二种方法)，拼接plist的路径
    NSString *dataPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0] stringByAppendingPathComponent:kDataPlistName];
    
    NSLog(@"--------->%@", dataPath);
    
    // 创建数据源数组
    NSArray *dataArray = @[@1, @2, @"123"];
    
    // 将数组写入plist中
    [dataArray writeToFile:dataPath atomically:YES];
}

/**
 *  读取数据点击事件
 */
- (IBAction)readClickAction:(id)sender {
    // 读取plist中缓存的数据
    NSArray *dataArray = [NSArray arrayWithContentsOfFile:[kDocumentPath stringByAppendingPathComponent:kDataPlistName]];
    
    NSLog(@"%@", dataArray);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
