//
//  DetailViewController.m
//  ProductDemo
//
//  Created by Mobility Bangalore on 10/10/16.
//  Copyright © 2016 Mobility Bangalore. All rights reserved.
//

#import "DetailViewController.h"
#import "ProductDetail.h"
#import "JsonHelper.h"
#import "CustomizeViewController.h"
@interface DetailViewController ()
{
    NSMutableArray *listArray;
    CustomizeViewController *customVC;
}

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Product Detail";
    customVC = [[CustomizeViewController alloc]initWithNibName:@"CustomizeViewController" bundle:nil];
    // Do any additional setup after loading the view from its nib.
}

-(void)viewDidAppear:(BOOL)animated
{
    listArray = [[NSMutableArray alloc]init];
    
    [listArray addObjectsFromArray:[JsonHelper getProductDetail]];
    [self setupScrollView];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void) setupScrollView {
    self.scrollView.pagingEnabled = YES;
    [self.scrollView setAlwaysBounceVertical:NO];
    for (int i = 0; i < listArray.count; i++) {
        
        ProductDetail *produc = [listArray objectAtIndex:i];
        if (i==0) {//only one title and description
            
            self.lblDesc.text = [NSString stringWithFormat:@"Description: %@",produc.shortDesc];;
            self.lblTitle.text = [NSString stringWithFormat:@"Product Title: %@",produc.title];;
        }
        
        NSURL *imageUrl = produc.url;
        
        CGFloat xOrigin = i * (self.scrollView.frame.size.width);
        UIImageView *image = [[UIImageView alloc] initWithFrame:
                              CGRectMake(xOrigin, 0,
                                         self.scrollView.frame.size.width,
                                         self.scrollView.frame.size.height)];
        image.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:imageUrl]];;
        image.contentMode = UIViewContentModeScaleAspectFit;
        [self.scrollView addSubview:image];
        
    }
    //set the scroll view content size
    self.scrollView.contentSize = CGSizeMake((self.scrollView.frame.size.width) *
                                             listArray.count,
                                              self.scrollView.frame.size.height);
    
    
    
}
-(IBAction)onClickCustomize:(id)sender
{
    [self.navigationController pushViewController:customVC animated:YES];
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
