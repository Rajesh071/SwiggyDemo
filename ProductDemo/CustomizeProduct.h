//
//  CustomizeProduct.h
//  ProductDemo
//
//  Created by Mobility Bangalore on 10/10/16.
//  Copyright © 2016 Mobility Bangalore. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CustomizeProduct : NSObject

//{
//    "size": "15",
//    "totalPrice": "63642",
//    "discount": "0",
//    "productCode": "1049399",
//    "totalPriceAfterDiscount": "63642",
//    "priceBreakup": {
//        "GOLD": "10054.00",
//        "DIAMOND": "49842.00",
//        "MAKING CHARGES": "3116",
//        "VAT (1%)": "630"
//    },
//    "selectedCustomization": {
//        "metalColor": "Yellow",
//        "metalPurity": "18",
//        "diamondQuality": "SI IJ"
//    }
//}
@property(nonatomic) float totalPrice;

@property(nonatomic) NSString *sizeP;
@property(nonatomic) NSString *metalColor;
@property(nonatomic) NSString *metalPurity;
@property(nonatomic) NSString *diamondQuality;



@end
