//
//  HZXTopic.h
//  HZXNews
//
//  Created by 何紫璇 on 2017/3/13.
//  Copyright © 2017年 何紫璇. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HZXTopic : NSObject
@property (copy, nonatomic) NSString *templateStr;
@property (copy, nonatomic) NSString *topicid;
@property (readonly, nonatomic) BOOL hasCover;
@property (copy, nonatomic) NSString *alias;
@property (copy, nonatomic) NSString *subnum;
@property (readonly, nonatomic) long long recommendOrder;
@property (readonly, nonatomic) BOOL isNew;
@property (copy, nonatomic) NSString *img;
@property (readonly, nonatomic) BOOL isHot;
@property (readonly, nonatomic) BOOL hasIcon;
@property (copy, nonatomic) NSString *cid;
@property (copy, nonatomic) NSString *recommend;
@property (readonly, nonatomic) BOOL headLine;
@property (copy, nonatomic) NSString *color;
@property (readonly, nonatomic) int bannerOrder;
@property (copy, nonatomic) NSString *tname;
@property (copy, nonatomic) NSString *ename;
@property (copy, nonatomic) NSString *showType;
@property (readonly, nonatomic) int special;
@property (copy, nonatomic) NSString *tid;

@end
