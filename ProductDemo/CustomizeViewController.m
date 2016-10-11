//
//  CustomizeViewController.m
//  ProductDemo
//
//  Created by Mobility Bangalore on 10/10/16.
//  Copyright © 2016 Mobility Bangalore. All rights reserved.
//

#import "CustomizeViewController.h"
#import "JsonHelper.h"
#import "CustomizeProduct.h"

@interface CustomizeViewController ()
{
    NSArray *ringSizeArray;
    NSArray *prodVariantArra;
    NSPredicate  *fiterPredicate;
    NSString *ringSiz;
    NSString *metalColor    ; NSString *carat;
    NSString *diamond ;
}

@end

@implementation CustomizeViewController

- (void)viewDidLoad {
    self.title = @"Customize Screen";
    ringSizeArray = @[ @"10",
                       @"11",
                       @"12",
                       @"13",
                       @"14",
                       @"15",
                       @"16",
                       @"17",
                       @"18",
                       @"19",
                       @"20",
                       @"21",
                       @"22",
                       @"23",
                       @"24",
                       @"25",
                       @"26",
                       @"27",
                       @"28",
                       @"29",
                       @"30",
                       @"6",
                       @"7",
                       @"8",
                       @"9"
                       
                       
                       
];

    
    
    
    prodVariantArra =[JsonHelper getCustomizedProductDetils];
    [self getPriceWithShowAlert:NO];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewDidAppear:(BOOL)animated
{

    
}
- (IBAction)segmentSwitch:(UISegmentedControl *)sender
{
    [self getPriceWithShowAlert:YES];
}


- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return ringSizeArray.count;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    
    return [ringSizeArray objectAtIndex:row];
}
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    [self getPriceWithShowAlert:YES];
}

-(void)getPriceWithShowAlert:(BOOL)isAlert
{
    ringSiz = [ringSizeArray objectAtIndex:[self.pickerRingSize selectedRowInComponent:0]];
    metalColor = [self.segMetalColor titleForSegmentAtIndex:self.segMetalColor.selectedSegmentIndex];
    carat = [self.segCarat titleForSegmentAtIndex:self.segCarat.selectedSegmentIndex];
    diamond = [self.segDiamond titleForSegmentAtIndex:self.segDiamond.selectedSegmentIndex];
    
    NSPredicate *sizePred = [NSPredicate predicateWithFormat:@"sizeP == %@",ringSiz];
    NSPredicate *colorPred = [NSPredicate predicateWithFormat:@"metalColor == %@",metalColor];
    NSPredicate *caratPred = [NSPredicate predicateWithFormat:@"metalPurity == %@",carat];
    NSPredicate *diamondPred = [NSPredicate predicateWithFormat:@"diamondQuality == %@",diamond];
    NSPredicate * andPredicate = [NSCompoundPredicate andPredicateWithSubpredicates:[NSArray arrayWithObjects:sizePred,colorPred,caratPred,diamondPred,nil]];

    CustomizeProduct *product =  nil;;

    
    id subArray = [prodVariantArra filteredArrayUsingPredicate:andPredicate];
    if ([subArray count]==0) {
        self.lblPrice.text = @"";
        if (isAlert == YES)
        {
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Not Found !" message:@"Combination is not allowed" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert show];    }
    }
    else
    {
        product = [subArray objectAtIndex:0];
     self.lblPrice.text = [NSString stringWithFormat:@"Price: %.f",product.totalPrice];
    }
    
   
    

}
@end
