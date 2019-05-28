//
//  Hasher.h
//  ectest
//
//  Created by XiaoQing Pan on 2018/5/8.
//  Copyright © 2018 XiaoQing Pan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SHAHash : NSObject

+ (NSData*)Sha2256:(NSData*)data;

@end
