//
//  MenuOfRecipesModel.m
//  RecipesOfGod
//
//  Created by 刘纪东 on 16/4/25.
//  Copyright © 2016年 Azrael. All rights reserved.
//

#import "MenuOfRecipesModel.h"

@implementation MenuOfRecipesModel
+(NSDictionary *)modelCustomPropertyMapper
{
    return @{@"desc":@"description",
             @"ID":@"id",
             @"keyWords":@"keywords",
             @"imagesUrl":@"images"
             };
}
+(instancetype)parseFoodJSON:(NSDictionary *)dict
{
    MenuOfRecipesModel *model=[[self alloc]init];
    model.name=dict[@"name"];
    model.desc=dict[@"food"];
    model.imagesUrl=dict[@"img"];
    model.food=dict[@"description"];
    model.message=dict[@"keywords"];

    return model;
}
@end
