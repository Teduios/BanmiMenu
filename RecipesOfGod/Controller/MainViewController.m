//
//  MainViewController.m
//  RecipesOfGod
//
//  Created by 刘纪东 on 16/4/25.
//  Copyright © 2016年 Azrael. All rights reserved.
//

#import "MainViewController.h"
#import "ChooseFoodTableViewCell.h"
#import "NSObject+NeWorking.h"
#import <YYKit.h>
#import "FoodNetManager.h"
#import "DetailTableViewController.h"
#import <UIImageView+WebCache.h>
#import "CricleScrollViewController.h"
@interface MainViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic , strong) NSString *itemTitle;
@property (nonatomic , strong) NSString *DetailLabel;
@property (nonatomic , strong) NSData *imageData;
@property (nonatomic , strong) NSString *Cooking;
@property (nonatomic , strong) NSString *message;
@property (nonatomic , strong) DetailTableViewController *dvc;
@end

@implementation MainViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.delegate=self;
    self.tableView.dataSource=self;
    UIImageView *headView=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 250)];
    /**
     *  初始化轮播图片数组
     */
    UIImageView *imageView0 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"1"]];
    imageView0.frame = CGRectMake(0, 0,  headView.bounds.size.width, headView.bounds.size.height);
    UIImageView *imageView1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"2"]];
    imageView1.frame = CGRectMake(0, 0, headView.bounds.size.width, headView.bounds.size.height);
    UIImageView *imageView2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"3"]];
    imageView2.frame = CGRectMake(0, 0,  headView.bounds.size.width, headView.bounds.size.height);
    UIImageView *imageView3 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"4"]];
    imageView3.frame = CGRectMake(0, 0,  headView.bounds.size.width, headView.bounds.size.height);
    
    NSArray *imageArray = [NSArray arrayWithObjects:imageView0, imageView1, imageView2,imageView3, nil];
    /**
     *  初始化轮播ScrollerView
     */
    CricleScrollViewController *cricleScrollerView = [[CricleScrollViewController alloc] initWithFrame:CGRectMake(0, 0, headView.bounds.size.width, headView.bounds.size.height) andImagesArray:imageArray];
    [headView addSubview:cricleScrollerView.view];
    
    self.tableView.tableHeaderView=headView;
    
    //    self.automaticallyAdjustsScrollViewInsets = NO;
    
}
-(void)viewWillLayoutSubviews
{
    self.tabBarController.tabBar.selectedImageTintColor=[UIColor lightGrayColor];
}
#pragma mark - UITableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 15;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    ChooseFoodTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"ChooseFoodTableViewCell" forIndexPath:indexPath];
//    __weak __typeof(self) weakSelf = self;
    [FoodNetManager getFoodsWithID:(indexPath.row+1) completionHandler:^(MenuOfRecipesModel *model, NSError *error) {
        cell.FoodNameLabel.text= model.name;
        cell.FoodDetailLabel.text=[NSString stringWithFormat:@"食材:%@",model.desc];
        cell.DetailLabel=model.desc;
        cell.itemTitle=model.name;
        cell.Cooking=model.food;
        cell.message=model.message;
        NSString *imageUrl=[NSString stringWithFormat:@"http://tnfs.tngou.net/img%@",model.imagesUrl];
        NSData *imageUrlData=[NSData dataWithContentsOfURL:[NSURL URLWithString:imageUrl]];
        cell.imageData=imageUrlData;
        
        NSURL *url=[NSURL URLWithString:imageUrl];
        cell.IconImageView.layer.masksToBounds=YES;
        cell.IconImageView.layer.cornerRadius=15;
        [cell.IconImageView sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"default2"]];
        
    }];
    return cell;
}

- (CGFloat )tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 45;
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ChooseFoodTableViewCell *cell=[tableView  cellForRowAtIndexPath:indexPath];
    self.itemTitle=cell.itemTitle;
    self.imageData=cell.imageData;
    self.DetailLabel=cell.DetailLabel;
    self.Cooking=cell.Cooking;
    self.message=cell.message;
    [self performSegueWithIdentifier:@"goToDetail" sender:indexPath];
    
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSLog(@"%@",sender);
    DetailTableViewController *dvc=[segue destinationViewController];
    dvc.itemTitleInDetialVC=self.itemTitle;
    dvc.imageDataInDetialVC=self.imageData;
    dvc.DetailLabelInDetialVC=self.DetailLabel;
    dvc.CookingInDetialVC=self.Cooking;
    dvc.messageInDetialVC=self.message;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
