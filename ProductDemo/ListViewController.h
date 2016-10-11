//
//  ListViewController.h
//  ProductDemo
//
//  Created by Mobility Bangalore on 10/10/16.
//  Copyright © 2016 Mobility Bangalore. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ListViewController : UIViewController<UICollectionViewDataSource,UICollectionViewDelegate>
{
    
}
@property(nonatomic)IBOutlet UICollectionView *collectionView;
@end
