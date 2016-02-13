//
//  ViewController.m
//  HYXMLParser
//
//  Created by HEYANG on 15/12/28.
//  Copyright © 2015年 HEYANG. All rights reserved.
//

#import "ViewController.h"

#import "HYXMLParser.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //xml -> NSData
    NSString* dataXmlPath = [[NSBundle mainBundle] pathForResource:@"data.xml" ofType:nil];
    NSData* data = [NSData dataWithContentsOfFile: dataXmlPath];
    
    
    //假设这个data是来自服务器端，那么我们就直接使用HYXMLParse解析这个data
    
    //1、创建HYXMLParse对象，需要传入Model Class Name 和 XML 需要解析的节点的名 video
    HYXMLParser* parser = [[HYXMLParser alloc] initWithModelClassName:@"VideoModel" withElementName:@"video"];
    
    //NSData -> NSMutableArray of models
    NSMutableArray* models = [parser modelsArrayFromData:data];
    
    NSLog(@"%@",models);
}



@end
