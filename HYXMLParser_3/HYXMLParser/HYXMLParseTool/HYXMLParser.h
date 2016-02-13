//
//  XMLParse.h
//  Network
//
//  Created by HEYANG on 15/12/27.
//  Copyright © 2015年 HEYANG. All rights reserved.
//

#import <Foundation/Foundation.h>

// 定义一个Block，用来存储字典转模型的过程
typedef void(^ModelFromDictionaryBlock)(NSDictionary<NSString *,NSString *>* dataDic,id model);

@interface HYXMLParser : NSObject

#pragma mark - Create a object
/**
 参数：
    1、模型对象的类名
    2、需要解析的XML节点名
    3、字典转模型的方式，例如：KVC或者是MJExtension
 */
/** 初始化方法，通过传入模型对象的类名，创建这个XML解析对象，字典转模型的方法 */
- (instancetype)initWithModelClassName:(NSString*)modelClassName withElementName:(NSString*)elementName  modelFromBlock:(ModelFromDictionaryBlock)modelFromDictionary;
/** 便利构造器类方法，通过传入模型对象的类名，创建这个XML解析对象，字典转模型的方法 */
+(instancetype)hyXMLParseWithModelClassName:(NSString*)modelClassName withElementName:(NSString*)elementName modelFromBlock:(ModelFromDictionaryBlock)modelFromDictionary;

#pragma mark - parser xml data
/** 通过NSData解析XML数据，返回模型数组 */
-(NSMutableArray*)modelsArrayFromData:(NSData*)data;

@end
