//
//  XMLParse.h
//  Network
//
//  Created by HEYANG on 15/12/27.
//  Copyright © 2015年 HEYANG. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HYXMLParser : NSObject

#pragma mark - Create a object
/** 初始化方法，通过传入模型对象的类名，创建这个XML解析对象 */
- (instancetype)initWithModelClassName:(NSString*)modelClassName withElementName:(NSString*)elementName;
/** 便利构造器类方法，通过传入模型对象的类名，创建这个XML解析对象 */
+(instancetype)hyXMLParseWithModelClassName:(NSString*)modelClassName withElementName:(NSString*)elementName;

#pragma mark - parser xml data
/** 通过NSData解析XML数据，返回模型数组 */
-(NSMutableArray*)modelsArrayFromData:(NSData*)data;

@end
