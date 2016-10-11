//
//  DetailViewController.h
//  ProductDemo
//
//  Created by Mobility Bangalore on 10/10/16.
//  Copyright © 2016 Mobility Bangalore. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface DetailViewController : UIViewController
@property(nonatomic)IBOutlet UIScrollView *scrollView;
@property(nonatomic)IBOutlet UILabel *lblTitle;
@property(nonatomic)IBOutlet UILabel *lblDesc;
-(IBAction)onClickCustomize:(id)sender;
@end
