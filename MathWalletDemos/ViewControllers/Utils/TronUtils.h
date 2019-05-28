//
//  TronUtils.h
//  MathWalletDemos
//
//  Created by Yuzhiyou on 2019/5/28.
//  Copyright © 2019 Math Wallet. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TronUtils : NSObject

+(NSString *)encodeAddress:(NSString *)hexAddress;
+(NSString *)decodeAddress:(NSString *)base58Address;

@end

NS_ASSUME_NONNULL_END
