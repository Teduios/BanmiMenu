//
//  SecondFoodTableViewCell.h
//  RecipesOfGod
//
//  Created by 刘纪东 on 16/4/28.
//  Copyright © 2016年 Azrael. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SecondFoodTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *IconImageView;
@property (weak, nonatomic) IBOutlet UILabel *FoodNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *FoodDetailLabel;
@property (nonatomic , strong) NSString *itemTitle;
@property (nonatomic , strong) NSString *DetailLabel;
@property (nonatomic , strong) NSData *imageData;
@property (nonatomic , strong) NSString *Cooking;
@property (nonatomic , strong) NSString *message;
@end
