//
//  JsonHelper.m
//  ProductDemo
//
//  Created by Mobility Bangalore on 10/10/16.
//  Copyright © 2016 Mobility Bangalore. All rights reserved.
//

#import "JsonHelper.h"
#import "ProductList.h"
#import "ProductDetail.h"
#import "CustomizeProduct.h";
@implementation JsonHelper
+(NSArray *)getProductList
{
    NSString * filePath =[[NSBundle mainBundle] pathForResource:@"Product Listing" ofType:@"json"];
    
    NSError * error;
    NSString* fileContents =[NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:&error];
    
    
    if(error)
    {
        NSLog(@"Error reading file: %@",error.localizedDescription);
    }
    
    
    NSMutableArray *listArry = [NSMutableArray arrayWithArray:[[NSJSONSerialization
                                JSONObjectWithData:[fileContents dataUsingEncoding:NSUTF8StringEncoding]
                                options:0 error:NULL]valueForKey:@"products"]];
    
    
    for (int i=0;i<listArry.count;i++)
    {
        id obj = [listArry objectAtIndex:i];
        ProductList *product = [[ProductList alloc]init];
        product.product_id = [obj valueForKey:@"product_id"];
        product.product_code = [obj valueForKey:@"product_code"];
        product.price = [[obj valueForKey:@"price"]floatValue];
        product.title = [obj valueForKey:@"title"];
        product.discount = [[obj valueForKey:@"discount"] floatValue];
        product.wishlist_status = [[obj valueForKey:@"wishlist_status"]boolValue];
        product.url = [NSURL URLWithString:[obj valueForKey:@"url"]];
        [listArry replaceObjectAtIndex:i withObject:product];

    }
    
    return listArry;
}
+(NSArray *)getProductDetail
{
    NSString * filePath =[[NSBundle mainBundle] pathForResource:@"Product Detail" ofType:@"json"];
    
    NSError * error;
    NSString* fileContents =[NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:&error];
    
    
    if(error)
    {
        NSLog(@"Error reading file: %@",error.localizedDescription);
    }
    
    id data =[NSJSONSerialization JSONObjectWithData:[fileContents dataUsingEncoding:NSUTF8StringEncoding] options:0 error:NULL];
    NSMutableArray *listArry =  [NSMutableArray arrayWithArray:[[data valueForKey:@"productdetail"]valueForKey:@"assets" ]];
    
    NSString *descTest = [[data valueForKey:@"productdetail"]valueForKey:@"shortDesc" ];

    NSString *title = [[data valueForKey:@"productdetail"]valueForKey:@"title" ];

    
    for (int i=0;i<listArry.count;i++)
    {
        id obj = [listArry objectAtIndex:i];
        ProductDetail *product = [[ProductDetail alloc]init];
        product.url = [NSURL URLWithString:[obj valueForKey:@"imgUri"]];
        product.shortDesc = descTest   ;
        product.title = title;
        [listArry replaceObjectAtIndex:i withObject:product];
        
    }
    
    return listArry;

}
+(NSArray *)getCustomizedProductDetils
{
    NSString * filePath =[[NSBundle mainBundle] pathForResource:@"Product Detail" ofType:@"json"];
    
    NSError * error;
    NSString* fileContents =[NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:&error];
    
    
    if(error)
    {
        NSLog(@"Error reading file: %@",error.localizedDescription);
    }
    
    id data =[NSJSONSerialization JSONObjectWithData:[fileContents dataUsingEncoding:NSUTF8StringEncoding] options:0 error:NULL];
    NSMutableArray *listArry =  [NSMutableArray arrayWithArray:[[data valueForKey:@"productdetail"]valueForKey:@"Variants" ]];
    for (int i=0;i<listArry.count;i++)
    {
//        {
//            "size": "12",
//            "totalPrice": "88700",
//            "discount": "0",
//            "productCode": "685313",
//            "totalPriceAfterDiscount": "88700",
//            "priceBreakup": {
//                "GOLD": "6254.00",
//                "DIAMOND": "79630.00",
//                "MAKING CHARGES": "1938",
//                "VAT (1%)": "878"
//            },
//            "selectedCustomization": {
//                "metalColor": "Yellow",
//                "metalPurity": "14",
//                "diamondQuality": "VS GH"
//            }
        
        
        id obj = [listArry objectAtIndex:i];
        CustomizeProduct *product = [[CustomizeProduct alloc]init];
        product.totalPrice = [[obj valueForKey:@"totalPrice"]floatValue ];
        product.sizeP = [obj valueForKey:@"size"];
        product.metalColor = [[obj valueForKey:@"selectedCustomization"]valueForKey:@"metalColor" ];
        product.metalPurity = [[obj valueForKey:@"selectedCustomization"]valueForKey:@"metalPurity" ];
        product.diamondQuality = [[obj valueForKey:@"selectedCustomization"]valueForKey:@"diamondQuality" ];

        [listArry replaceObjectAtIndex:i withObject:product];
        
    }
    NSArray *array = [NSArray arrayWithArray:listArry];

    return array;


}

@end
