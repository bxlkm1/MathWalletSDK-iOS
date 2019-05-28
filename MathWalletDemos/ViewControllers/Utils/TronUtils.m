//
//  TronUtils.m
//  MathWalletDemos
//
//  Created by Yuzhiyou on 2019/5/28.
//  Copyright © 2019 Math Wallet. All rights reserved.
//

#import "TronUtils.h"
#import "NSString+Base58.h"
#import "NSData+Hash.h"


@implementation TronUtils

+(NSString *)encodeAddress:(NSString *)hexAddress{
    return [NSString base58checkWithData:hexAddress.hexToData];
}
+(NSString *)decodeAddress:(NSString *)base58Address{
    return [base58Address base58checkToData].hexString;
}
@end
