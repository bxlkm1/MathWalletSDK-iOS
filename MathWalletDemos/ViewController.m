//
//  ViewController.m
//  MathWalletDemos
//
//  Created by Yuzhiyou on 2018/9/26.
//  Copyright © 2018年 Math Wallet. All rights reserved.
//

#import "ViewController.h"
#import "MathWalletAPI.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)loginAction:(id)sender {
    MathWalletLoginReq *loginReq = [[MathWalletLoginReq alloc] init];
    // 公链标识
    loginReq.blockchain = @"ethereum";
    // DApp信息
    loginReq.dappIcon = @"http://www.mathwallet.org/images/download/wallet_cn.png";
    loginReq.dappName = @"Newdex";
    // DApp Server
    loginReq.uuID = @"ios-D079184AACD246CE82FC66FEB63A5999";
    loginReq.loginUrl = @"";
    loginReq.expired = [NSNumber numberWithLong:[NSDate date].timeIntervalSince1970];
    loginReq.loginMemo = @"Memo";
    
    
    [MathWalletAPI sendReq:loginReq];
}
- (IBAction)transferAction:(id)sender {
    MathWalletTransferReq *transferReq = [[MathWalletTransferReq alloc] init];
    // 公链标识
    transferReq.blockchain = @"ethereum";
    // DApp信息
    transferReq.dappIcon = @"http://www.mathwallet.org/images/download/wallet_cn.png";
    transferReq.dappName = @"Newdex";
    // 转账信息
    transferReq.from = @"0xEF3E0B3744Dfb8099c2a800211b7e19B8459a218";
    transferReq.to = @"0xCd2B61614DBC0c3e2E910A8100FAfBAB0E46Ae3e";
    transferReq.amount = @"0.0001";
    transferReq.precision = @(18);
    transferReq.symbol = @"ETH";
    transferReq.contract = @"";
    transferReq.dappData = @"";
    
    transferReq.desc = @"这是展示在钱包中的描述";
    transferReq.expired = [NSNumber numberWithLong:[NSDate date].timeIntervalSince1970];
    [MathWalletAPI sendReq:transferReq];
}
- (IBAction)transactionAction:(id)sender {
    MathWalletTransactionReq *transactionReq = [[MathWalletTransactionReq alloc] init];
    // 公链标识
    transactionReq.blockchain = @"eosio";
    // DApp信息
    transactionReq.dappIcon = @"http://www.mathwallet.org/images/download/wallet_cn.png";
    transactionReq.dappName = @"Demos";
    // 转账信息
    transactionReq.from = @"yuzhiyou1234";
    transactionReq.actions = @[
                            @{
                                @"code":@"eosio.token",
                                @"action":@"transfer",
                                @"binargs":@"4086089a7ad7bef6c0a6eb6c1acda891010000000000000004454f530000000006e5a487e6b3a8"
                                }
                            ];
    
    transactionReq.desc = @"这是展示在钱包中的描述";
    transactionReq.expired = [NSNumber numberWithLong:[NSDate date].timeIntervalSince1970];
    [MathWalletAPI sendReq:transactionReq];
}
- (IBAction)openURLAction:(id)sender {
    MathWalletOpenURLReq *openURLReq = [[MathWalletOpenURLReq alloc] init];
    // 公链标识
    openURLReq.blockchain = @"eosio";
    // DApp信息
    openURLReq.dappIcon = @"http://www.mathwallet.org/images/download/wallet_cn.png";
    openURLReq.dappName = @"Demos";
    // 转账信息
    openURLReq.dappUrl = @"http://www.redpacketeos.com";
    openURLReq.desc = @"这是展示在钱包中的描述";
    [MathWalletAPI sendReq:openURLReq];
}
@end
