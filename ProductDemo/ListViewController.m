//
//  ListViewController.m
//  ProductDemo
//
//  Created by Mobility Bangalore on 10/10/16.
//  Copyright © 2016 Mobility Bangalore. All rights reserved.
//

#import "ListViewController.h"
#import "DetailViewController.h"
#import "JsonHelper.h"
#import "ProductList.h"
#import "MyCell.h"

@interface ListViewController ()
{
    NSMutableArray *listArray;
    DetailViewController *detailVC;
}

@end

@implementation ListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    detailVC = [[DetailViewController alloc]initWithNibName:@"DetailViewController" bundle:nil];
    
    listArray = [[NSMutableArray alloc]init];
    
    [listArray addObjectsFromArray:[JsonHelper getProductList]];
    [self.collectionView registerNib:[UINib nibWithNibName:@"MyCell" bundle:nil] forCellWithReuseIdentifier:@"CELL"];
    [self.collectionView reloadData];


    // Do any additional setup after loading the view from its nib.
}
-(void)viewWillAppear:(BOOL)animated
{

    
    self.title = @"Product List";
    UICollectionViewFlowLayout *flow = (UICollectionViewFlowLayout*) self.collectionView.collectionViewLayout;
    flow.sectionInset = UIEdgeInsetsMake(0, 0   , 0, 0);
    flow.minimumInteritemSpacing = 5;
    flow.minimumLineSpacing = 15;

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//---------------------------------------
#pragma mark UICollectionViewDataSource
//---------------------------------------
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return listArray.count;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (MyCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    MyCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CELL" forIndexPath:indexPath];
   // cell.backgroundColor = [UIColor colorWithPatternImage:[self.results objectAtIndex:indexPath.row]];
    
    
  //  UIImageView *chImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, cell.backgroundView.frame.size.width,cell.backgroundView.frame.size.height)];
    
    ProductList *produc = [listArray objectAtIndex:indexPath.row];
    
    
    NSURL *imageUrl = produc.url;
    UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:imageUrl]];
    cell.image.image = image;
    cell.cellLabel.text = produc.title;
  //  [cell.backgroundView addSubview:chImage];
    
    
    return cell;

}


//---------------------------------------
#pragma mark UICollectionViewDelegate
//---------------------------------------
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    [self.navigationController pushViewController:detailVC animated:YES];
   // ProductList *produc = [listArray objectAtIndex:indexPath.row];

}

@end
