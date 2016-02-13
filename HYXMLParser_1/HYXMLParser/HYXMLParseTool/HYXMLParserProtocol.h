//
//  HYXMLParseProtocol.h
//  Network
//
//  Created by HEYANG on 15/12/27.
//  Copyright © 2015年 HEYANG. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol HYXMLParserProtocol <NSObject>

//
//要求模型必须实现字典转self模型的方法
@required
-(void)hy_setKeyValues:(NSDictionary*)dic;

@end
