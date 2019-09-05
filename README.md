# MathWalletSDK-iOS

#### 基于SimpleWallet协议的iOS SDK
#### 支持公链 ETH,EOS,EOSFORCE 等

[English Readme](https://github.com/MediShares/MathWalletSDK-iOS/blob/master/README_EN.md)

[Korean Readme](https://github.com/MediShares/MathWalletSDK-iOS/blob/master/README_KO.md)


## 如何使用？

### 1、配置URL Schemes
#### Xcode工程info.plist-> URL types -> URL Schemes
![URL Schemes](https://github.com/MathWallet/MathWalletSDK-iOS/blob/master/urlschemes.jpeg "URL Schemes")

#### iOS9以上需要在info.plist进行如下设置：
![URL Schemes](https://github.com/MathWallet/MathWalletSDK-iOS/blob/master/plist.jpeg "URL Schemes")


### 2、注册URL Schemes和处理URL

```Objective C
#import <MathWalletSDK/MathWalletSDK.h>
  
  
@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [MathWalletAPI registerAppURLSchemes:@"mathwalletdemos"];
    return YES;
}


-(BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options{
    BOOL handle = [MathWalletAPI handleURL:url];
    return handle;
}

@end
```

### 3、使用MathWallet进行登录操作

```Objective C
  MathWalletLoginReq *loginReq = [[MathWalletLoginReq alloc] init];
  // 公链标识
  loginReq.blockchain = @"eosio";   // eosio、eosforce、ethereum
  // DApp信息
  loginReq.dappIcon = @"http://www.mathwallet.org/images/download/wallet_cn.png";
  loginReq.dappName = @"Demos";
  // DApp Server
  loginReq.uuID = @"本次登录uid";
  loginReq.loginUrl = @"登录回调";
  loginReq.expired = [NSNumber numberWithLong:([NSDate date].timeIntervalSince1970 + 60)];
  loginReq.loginMemo = @"Memo";

  [MathWalletAPI sendReq:loginReq response:^(MathWalletResp *resq) {
        NSLog(@"%@",resq.data);
    }];
```

### 4、使用MathWallet进行转账操作

```Objective C
  MathWalletTransferReq *transferReq = [[MathWalletTransferReq alloc] init];
  // 公链标识
  transferReq.blockchain = @"eosio";  // eosio、eosforce、ethereum
  // DApp信息
  transferReq.dappIcon = @"http://www.mathwallet.org/images/download/wallet_cn.png";
  transferReq.dappName = @"Demos";
  // 转账信息
  transferReq.from = @"eosioaccount";
  transferReq.to = @"eosioaccount";
  transferReq.amount = @"1.0000";
  transferReq.precision = @(4);
  transferReq.symbol = @"EOS";
  transferReq.contract = @"eosio.token";
  transferReq.dappData = @"备注";

  transferReq.desc = @"这是展示在钱包中的描述";
  transferReq.expired = [NSNumber numberWithLong:([NSDate date].timeIntervalSince1970 + 60)];
  
  [MathWalletAPI sendReq:transferReq response:^(MathWalletResp *resq) {
        NSLog(@"%@",resq.data);
    }];
```
 ### 5、使用MathWallet进行自定义交易操作（执行合约）

```Objective C
  MathWalletTransactionReq *transactionReq = [[MathWalletTransactionReq alloc] init];
  // 公链标识
  transactionReq.blockchain = @"eosio";
  // DApp信息
  transactionReq.dappIcon = @"http://www.mathwallet.org/images/download/wallet_cn.png";
  transactionReq.dappName = @"Demos";
  // 转账信息
  transactionReq.from = @"testaccount1";
  transactionReq.actions = @[
                          @{
                              @"code":@"eosio.token",
                              @"action":@"transfer",
                              @"binargs":@"4086089a7ad7bef6c0a6eb6c1acda891010000000000000004454f530000000006e5a487e6b3a8"
                              }
                          ];

  transactionReq.desc = @"这是展示在钱包中的描述";
  transactionReq.expired = [NSNumber numberWithLong:[NSDate date].timeIntervalSince1970];
  [MathWalletAPI sendReq:transactionReq response:^(MathWalletResp *resq) {
        NSLog(@"%@",resq.data);
    }];
```
 ### 6、使用MathWallet 签名消息

```Objective C
    MathWalletSignMessageReq *signMessageReq = [[MathWalletSignMessageReq alloc] init];
    // 公链标识
    signMessageReq.blockchain = @"eosio";
    // DApp信息
    signMessageReq.dappIcon = @"http://www.mathwallet.org/images/download/wallet_cn.png";
    signMessageReq.dappName = @"MathWalletSDK-Demos";
    // 签名信息
    signMessageReq.from = @"testaccount1";
    signMessageReq.message = @"我是要签名的信息";
    signMessageReq.isHex = @(NO);
    signMessageReq.desc = @"这是展示在钱包中的描述";
    
    [MathWalletAPI sendReq:signMessageReq response:^(MathWalletResp *resq) {
        NSLog(@"%@",resq.data);
    }];
```
 ### 7、使用MathWallet 打开DApp

```Objective C
    MathWalletOpenURLReq *openURLReq = [[MathWalletOpenURLReq alloc] init];
    // 公链标识
    openURLReq.blockchain = @"eosio";
    // DApp信息
    openURLReq.dappIcon = @"http://www.mathwallet.org/images/download/wallet_cn.png";
    openURLReq.dappName = @"Demos";
    // 转账信息
    openURLReq.dappUrl = @"http://www.redpacketeos.com";
    openURLReq.desc = @"这是展示在钱包中的描述";
    [MathWalletAPI sendReq:openURLReq response:^(MathWalletResp *resq) {
        NSLog(@"%@",resq.data);
    }];
```
