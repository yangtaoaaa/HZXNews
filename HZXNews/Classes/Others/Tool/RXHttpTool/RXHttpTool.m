//
//  RXHttpTool.m
//  RenXing
//
//  Created by ycmedia_imac on 16/7/12.
//  Copyright © 2016年 ycmedia_imac. All rights reserved.
//

#import "RXHttpTool.h"
#import "AFNetworking.h"

@implementation RXHttpTool

+ (RXHttpTool *)shareInstance{
    static RXHttpTool *shareInstance = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        shareInstance = [[[self class]alloc]init];
    });
    return shareInstance;
}

// 测试用
- (void)postWithParams:(NSDictionary *)params success:(void (^)(id))success failure:(void (^)(NSError *))failure{
    // 创建请求管理对象
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html", nil]; //设置相应内容类型
    
    // 设置请求格式
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    // 设置返回格式
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    
    // 发送请求
    NSDictionary *dict = @{
                           @"id":@"idididid",
                           @"channel":@"channelstrstr",
                           @"childChannel":@"childChannel",
                           @"version":[NSBundle mainBundle].infoDictionary[@"CFBundleVersion"],
                           };
    NSMutableDictionary *tempDict = [NSMutableDictionary dictionaryWithDictionary:dict];
    [tempDict addEntriesFromDictionary:params];
    [manager POST:preAddress parameters:tempDict success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if(success){
            success(responseObject);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if(failure){
            failure(error);
            
            HZXLog(@"网络不好 - YZHttpTool：%@",[NSString stringWithFormat:@"cmd=%@,error=%@",params[@"cmd"],error]);
            
            NSNumber *cmd = tempDict[@"cmd"];
            NSNumber *cmd1 = @(8026);
            NSNumber *cmd2 = @(8027);
            NSNumber *cmd3 = @(8028);
            
            if( !([cmd isEqualToNumber:cmd1] || [cmd isEqualToNumber:cmd2] || [cmd isEqualToNumber:cmd3]))//这俩个接口，获取不到数据会每秒提醒一次，故不提醒
            {
                [MBProgressHUD showError:@"亲！网络不给力"];
                HZXLog(@"cmd = %@",tempDict[@"cmd"]);
            }
        }
    }];
}

- (void)postWithURL:(NSString *)url params:(NSDictionary *)params success:(void (^)(id))success failure:(void (^)(NSError *))failure{
    // 创建请求管理对象
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html", nil];
    
    // 发送请求
    [manager POST:url parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if(success){
            success(responseObject);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if(failure) {
            failure(error);
            HZXLog(@"请求失败----------%@", error);
        }
    }];
}

- (void)postWithURLAndStr:(NSString *)url params:(NSString *)params success:(void (^)(id))success failure:(void (^)(NSError *))failure{
    // 创建请求管理对象
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html", nil];
    
    // 设置请求格式
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    // 设置返回格式
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    
    // 发送请求
    [manager POST:url parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if(success){
            success(responseObject);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if(failure){
            failure(error);
        }
    }];
}

- (void)getWithURL:(NSString *)url params:(NSDictionary *)params success:(void (^)(id))success failure:(void (^)(NSError *))failure{
    // 创建请求管理对象
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html", nil];
    
    // 发送请求
    [manager GET:url parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if(success){
            success(responseObject);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if(failure){
            failure(error);
        }
    }];
}





@end




