//
//  SecondFoodViewController.m
//  RecipesOfGod
//
//  Created by 刘纪东 on 16/4/28.
//  Copyright © 2016年 Azrael. All rights reserved.
//

#import "SecondFoodViewController.h"
#import "ChooseFoodTableViewCell.h"
#import "SecondFoodTableViewCell.h"
#import "NSObject+NeWorking.h"
#import <YYKit.h>
#import "SecondFoodTableViewController.h"
#import "FoodNetManager.h"
#import "DetailTableViewController.h"
#import <UIImageView+WebCache.h>
#import "CricleScrollViewController.h"
@interface SecondFoodViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic , strong) NSString *itemTitle;
@property (nonatomic , strong) NSString *DetailLabel;
@property (nonatomic , strong) NSData *imageData;
@property (nonatomic , strong) NSString *Cooking;
@property (nonatomic , strong) NSString *message;
//@property (weak, nonatomic) IBOutlet UIImageView *headImageView;
@property (nonatomic , strong) DetailTableViewController *dvc;
//@property (weak, nonatomic) IBOutlet UIButton *nButton;
//@property (weak, nonatomic) IBOutlet UIButton *fireButton;


@end

@implementation SecondFoodViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.delegate=self;
    self.tableView.dataSource=self;
    UIImageView *headView=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 250)];
    /**
     *  初始化轮播图片数组
     */
    UIImageView *imageView0 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"5"]];
    imageView0.frame = CGRectMake(0, 0,  headView.bounds.size.width, headView.bounds.size.height);
    UIImageView *imageView1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"6"]];
    imageView1.frame = CGRectMake(0, 0, headView.bounds.size.width, headView.bounds.size.height);
    UIImageView *imageView2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"7"]];
    imageView2.frame = CGRectMake(0, 0,  headView.bounds.size.width, headView.bounds.size.height);
    UIImageView *imageView3 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"8"]];
    imageView3.frame = CGRectMake(0, 0,  headView.bounds.size.width, headView.bounds.size.height);
    
    NSArray *imageArray = [NSArray arrayWithObjects:imageView0, imageView1, imageView2,imageView3, nil];
    /**
     *  初始化轮播ScrollerView
     */
    CricleScrollViewController *cricleScrollerView = [[CricleScrollViewController alloc] initWithFrame:CGRectMake(0, 0, headView.bounds.size.width, headView.bounds.size.height) andImagesArray:imageArray];
    [headView addSubview:cricleScrollerView.view];
//    [self.headImageView addSubview:headView];
    self.tableView.tableHeaderView=headView;
}
-(void)viewWillLayoutSubviews
{
    self.tabBarController.tabBar.selectedImageTintColor=[UIColor lightGrayColor];
//    self.nButton.layer.masksToBounds=YES;
//    self.nButton.layer.cornerRadius=15;
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
    
   SecondFoodTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"SecondFoodTableViewCell" forIndexPath:indexPath];

    [FoodNetManager getFoodsWithID:(indexPath.row+15) completionHandler:^(MenuOfRecipesModel *model, NSError *error) {
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
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 345;
}
- (CGFloat )tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 45;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    SecondFoodTableViewCell *cell=[tableView  cellForRowAtIndexPath:indexPath];
    self.itemTitle=cell.itemTitle;
    self.imageData=cell.imageData;
    self.DetailLabel=cell.DetailLabel;
    self.Cooking=cell.Cooking;
    self.message=cell.message;
    [self performSegueWithIdentifier:@"goToSecond" sender:indexPath];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    SecondFoodTableViewController *sfvc=[segue destinationViewController];
    sfvc.itemTitleInDetialVC=self.itemTitle;
    sfvc.imageDataInDetialVC=self.imageData;
    sfvc.DetailLabelInDetialVC=self.DetailLabel;
    sfvc.CookingInDetialVC=self.Cooking;
    sfvc.messageInDetialVC=self.message;
}

//-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
//{
//    UIButton *newButton=[[UIButton alloc]initWithFrame:CGRectMake(20, 10, 100, 45)];
//    newButton.backgroundColor=[UIColor whiteColor];
//    UILabel *label=[[UILabel alloc]initWithFrame:CGRectMake(50, 0, newButton.bounds.size.width/2, newButton.bounds.size.height)];
//    label.text=@"最新";
//    UIImageView *imageView=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, newButton.bounds.size.width/2, newButton.bounds.size.height)];
//    imageView.image=[UIImage imageNamed:@"my_merchent"];
//    [newButton addSubview:label];
//    [newButton addSubview:imageView];
//        UIView *view=[[UIView alloc]initWithFrame:self.view.bounds];
//    [view addSubview:newButton];
//    view.backgroundColor=[UIColor clearColor];
//    view.layer.masksToBounds=YES;
//    view.layer.cornerRadius=15;
//    return view;
//    
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
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
