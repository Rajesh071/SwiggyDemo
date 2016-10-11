//
//  ProductList.h
//  ProductDemo
//
//  Created by Mobility Bangalore on 10/10/16.
//  Copyright © 2016 Mobility Bangalore. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ProductList : NSObject

@property(nonatomic) NSString *product_id;
@property(nonatomic) NSString *product_code;
@property(nonatomic) NSString *title;
@property(nonatomic) float price;
@property(nonatomic) BOOL wishlist_status;
@property(nonatomic) float discount;
@property(nonatomic) NSURL *url;

@end
