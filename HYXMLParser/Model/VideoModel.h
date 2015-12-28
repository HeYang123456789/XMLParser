//
//  VideoModel.h
//  HYXMLParser
//
//  Created by HEYANG on 15/12/28.
//  Copyright © 2015年 HEYANG. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VideoModel : NSObject

/** image */
@property (nonatomic,strong)NSString *image;
/** name */
@property (nonatomic,strong)NSString *name;
/** url */
@property (nonatomic,strong)NSString *url;
/** length */
@property (nonatomic,strong)NSNumber *length;
/** id */
@property (nonatomic,strong)NSNumber *id;

@end
