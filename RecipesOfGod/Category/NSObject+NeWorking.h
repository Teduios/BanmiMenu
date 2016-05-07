//
//  NSObject+NeWorking.h
//  RecipesOfGod
//
//  Created by 刘纪东 on 16/4/25.
//  Copyright © 2016年 Azrael. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking.h>
@interface NSObject (NeWorking)
+(id)GET:(NSString *)path parameters:(NSDictionary *)parameters progress:(void(^)(NSProgress * downloadProgress))downloadProgress completionHandler:(void(^)(id responseObj,NSError *error))completionHandler;
+(id)POST:(NSString *)path parameters:(NSDictionary *)parameters progress:(void(^)(NSProgress * downloadProgress))downloadProgress completionHandler:(void(^)(id responseObj,NSError *error))completionHandler;

@end
