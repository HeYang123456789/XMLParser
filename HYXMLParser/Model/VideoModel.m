//
//  VideoModel.m
//  HYXMLParser
//
//  Created by HEYANG on 15/12/28.
//  Copyright © 2015年 HEYANG. All rights reserved.
//

#import "VideoModel.h"

#import "HYXMLParserProtocol.h"


@interface VideoModel ()<HYXMLParserProtocol>

@end
@implementation VideoModel


-(void)hy_setKeyValues:(NSDictionary*)dic{
    [self setValuesForKeysWithDictionary:dic];
}


@end
