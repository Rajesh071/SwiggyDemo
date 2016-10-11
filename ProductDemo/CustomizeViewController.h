//
//  CustomizeViewController.h
//  ProductDemo
//
//  Created by Mobility Bangalore on 10/10/16.
//  Copyright © 2016 Mobility Bangalore. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomizeViewController : UIViewController
@property (weak, nonatomic) IBOutlet UISegmentedControl *segCarat;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segDiamond;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segMetalColor;
@property (weak, nonatomic) IBOutlet UIPickerView *pickerRingSize;
@property (weak, nonatomic) IBOutlet UILabel *lblPrice;
- (IBAction)segmentSwitch:(UISegmentedControl *)sender;
@end
