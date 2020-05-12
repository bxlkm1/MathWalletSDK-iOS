//
//  MathWalletAPI.m
//  MathWalletSDK
//
//  Created by Yuzhiyou on 2018/9/26.
//  Copyright © 2018年 Math Wallet. All rights reserved.
//

#import "MathWalletAPI.h"
#import <UIKit/UIKit.h>


static const NSString *kParamKey  = @"param";
static const NSString *kCallbackKey  = @"callback";
static const NSString *kQuerySDK  = @"mathwalletsdk";

static NSString *app_url_schemes;
static NSMutableDictionary *callbacks;

@implementation MathWalletAPI
/*!
 * @brief 注册URL Schemes
 * @param urlSchemes 在Xcode工程info.plist-> URL types -> URL Schemes里添加
 */
+ (void)registerAppURLSchemes:(NSString *)urlSchemes{
    app_url_schemes = urlSchemes;
    callbacks = [NSMutableDictionary new];
}
/*!
 * @brief 向 MathWallet 发起请求
 * @param req 登录/转账
 * @param responseBlock block回调
 * @return YES/NO
 */
+ (BOOL)sendReq:(MathWalletReq *)req response:(ResponseBlock)responseBlock{
    if (app_url_schemes) {
        // Append callback
        NSMutableDictionary *params = req.toParams.mutableCopy;
        [params setObject:[NSString stringWithFormat:@"%@://%@?action=%@",app_url_schemes,kQuerySDK,req.action] forKey:kCallbackKey];
        if(responseBlock){
            [callbacks setObject:responseBlock forKey:app_url_schemes];
        }
        // To string
        NSString *paramsString = [MathWalletAPI toJSONString:params];
        if (!paramsString) {
            return NO;
        }
        // Send
        NSString *urlString = [NSString stringWithFormat:@"mathwallet://mathwallet.org?param=%@",paramsString];
        NSLog(@"%@",urlString);
        urlString = [urlString stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
        
        return [MathWalletAPI openURL:[NSURL URLWithString:urlString]];
    }
    return NO;
}
/*!
 * @brief   处理MathWallet的回调
 * @discuss 在AppDelegate -(application:openURL:options:)方法里调用
 */
+ (BOOL)handleURL:(NSURL *)url{
    if ([url.scheme isEqualToString:app_url_schemes]) {
        MathWalletResp *resp = [MathWalletAPI respWithURL:url];
        if (resp) {
            if([callbacks objectForKey:app_url_schemes]){
                ResponseBlock responseBlock = [callbacks objectForKey:app_url_schemes];
                responseBlock(resp);
            }
            return YES;
        }
    }
    return NO;
}
/**  解析回调url */
+ (MathWalletResp *)respWithURL:(NSURL *)url {
    NSString *query = [url.query stringByRemovingPercentEncoding] ?: @"";
    NSDictionary *paramDict = [MathWalletAPI getURLParameters:query];
    if(paramDict && paramDict[@"action"] && paramDict[@"result"]){
        MathWalletResp *resp = [[MathWalletResp alloc] init];
        resp.action = paramDict[@"action"];
        resp.result = [paramDict[@"result"] intValue];
        resp.data = paramDict;
        return resp;
    }
    return nil;
}
/**!
 * @brief obj->JSON String
 */
+(NSString *)toJSONString:(id)obj {
    NSError *error = nil;
    NSData *data = [NSJSONSerialization dataWithJSONObject:obj options:kNilOptions error:&error];
    if (!error){
        return [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    }
    return nil;
}
/**!
 * @brief Open URL
 */
+(BOOL)openURL:(NSURL *)url {
    if([[UIApplication sharedApplication] canOpenURL:url]){
        if (@available(iOS 10.0, *)) {
            [[UIApplication sharedApplication] openURL:url options:@{} completionHandler:nil];
        } else {
            [[UIApplication sharedApplication] openURL:url];
        }
        return YES;
    }
    return NO;
}
/**
 * @brief Open URL截取URL中的参数
 */
+ (NSMutableDictionary *)getURLParameters:(NSString *)parameterString {
    // 以字典形式将参数返回
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    // 判断参数是单个参数还是多个参数
    if ([parameterString containsString:@"&"]) {
        NSArray *urlComponents = [parameterString componentsSeparatedByString:@"&"];
        for (NSString *keyValuePair in urlComponents) {
            NSArray *pairComponents = [keyValuePair componentsSeparatedByString:@"="];
            NSString *key = [pairComponents.firstObject stringByRemovingPercentEncoding];
            NSString *value = [pairComponents.lastObject stringByRemovingPercentEncoding];

            if (key == nil || value == nil) {
                continue;
            }
            [params setValue:value forKey:key];
        }
        
    } else {            // 单个参数
        NSArray *pairComponents = [parameterString componentsSeparatedByString:@"="];
        if (pairComponents.count == 1) {
            return nil;
        }
        NSString *key = [pairComponents.firstObject stringByRemovingPercentEncoding];
        NSString *value = [pairComponents.lastObject stringByRemovingPercentEncoding];
        if (key == nil || value == nil) {
            return nil;
        }
        [params setValue:value forKey:key];
        
    }
    return params;
    
}
@end
