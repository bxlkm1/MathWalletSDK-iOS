//
//  Hasher.m
//  ectest
//
//  Created by XiaoQing Pan on 2018/5/8.
//  Copyright © 2018 XiaoQing Pan. All rights reserved.
//

#import "SHAHash.h"
#import "options.h"
#import "sha2.h"
#import <CommonCrypto/CommonCrypto.h>

@implementation SHAHash

+ (NSData *)Sha2256:(NSData*)data {
    NSMutableData *d = [NSMutableData dataWithLength:CC_SHA256_DIGEST_LENGTH];
    CC_SHA256(data.bytes, data.length, d.mutableBytes);
    return d;
}

@end
