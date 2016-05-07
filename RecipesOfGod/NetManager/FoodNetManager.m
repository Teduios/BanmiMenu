//
//  FoodNetManager.m
//  RecipesOfGod
//
//  Created by 刘纪东 on 16/4/25.
//  Copyright © 2016年 Azrael. All rights reserved.
//

#import "FoodNetManager.h"

@implementation FoodNetManager
+(id)getFoodsWithID:(NSInteger)ID completionHandler:(void(^)(MenuOfRecipesModel *model,NSError *error))completionHandler
{
   
        NSString *path=[NSString stringWithFormat:@"http://www.tngou.net/api/cook/show?id=%ld",(long)ID];
        [self GET:path parameters:nil progress:nil completionHandler:^(id responseObj, NSError *error) {
            completionHandler([MenuOfRecipesModel parseFoodJSON:responseObj],error);
            
        }];
       return self;
}

@end
