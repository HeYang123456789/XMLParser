//
//  ViewController.m
//  HYXMLParser
//
//  Created by HEYANG on 15/12/28.
//  Copyright © 2015年 HEYANG. All rights reserved.
//

#import "ViewController.h"
#import "MJExtension.h"

#import "HYXMLParser.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //xml -> NSData 这里我自己创建XML格式的NSData模拟网络返回的数据
    NSString* dataXmlPath = [[NSBundle mainBundle] pathForResource:@"data.xml" ofType:nil];
    NSData* data = [NSData dataWithContentsOfFile: dataXmlPath];
    //假设这个data是来自服务器端，那么我们就直接使用HYXMLParse解析这个data
    
    //1、创建HYXMLParse对象
    //参数：1、Model Class Name
    //     2、XML 需要解析的节点的名 video
    //     3、通过block传递字典转模型的方法 ---> 根据实际需求，可以用KVC也可以用MJExtension
    
    HYXMLParser* parser = [[HYXMLParser alloc] initWithModelClassName:@"VideoModel" withElementName:@"video" modelFromBlock:^(NSDictionary<NSString *,NSString *> *dataDic, id model) {
        // 第一种字典转模型：KVC
        // [model setValuesForKeysWithDictionary:dataDic];
        // 第二种字典转模型：MJExtension
        [model mj_setKeyValues:dataDic];
    }];
    
    //NSData -> NSMutableArray of models
    NSMutableArray* models = [parser modelsArrayFromData:data];
    NSLog(@"%@",models);
}
@end
