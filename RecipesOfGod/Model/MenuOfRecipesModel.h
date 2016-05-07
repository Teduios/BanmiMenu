//
//  MenuOfRecipesModel.h
//  RecipesOfGod
//
//  Created by 刘纪东 on 16/4/25.
//  Copyright © 2016年 Azrael. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MenuOfRecipesModel : NSObject

@property (nonatomic, copy) NSString *desc;

@property (nonatomic, assign) NSInteger fcount;

@property (nonatomic, assign) NSInteger ID;

@property (nonatomic, copy) NSString *message;

@property (nonatomic, assign) BOOL status;

@property (nonatomic, assign) NSInteger count;

@property (nonatomic, copy) NSString *food;

@property (nonatomic, copy) NSString *url;

@property (nonatomic, copy) NSString *img;

@property (nonatomic, copy) NSString *keyWords;

@property (nonatomic, copy) NSString *imagesUrl;

@property (nonatomic, copy) NSString *name;

@property (nonatomic, assign) NSInteger rcount;
+(instancetype)parseFoodJSON:(NSDictionary *)dict;
@end
