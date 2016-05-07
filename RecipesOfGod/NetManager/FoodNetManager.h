//
//  FoodNetManager.h
//  RecipesOfGod
//
//  Created by 刘纪东 on 16/4/25.
//  Copyright © 2016年 Azrael. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MenuOfRecipesModel.h"
#import "DPRequest.h"
#import "NSObject+NeWorking.h"
@interface FoodNetManager : NSObject

+(id)getFoodsWithID:(NSInteger)ID completionHandler:(void(^)(MenuOfRecipesModel *model,NSError *error))completionHandler;
@end
