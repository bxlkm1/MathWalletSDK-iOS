//
//  BlockchainTableViewController.m
//  MathWalletDemos
//
//  Created by Yuzhiyou on 2018/12/4.
//  Copyright © 2018 Math Wallet. All rights reserved.
//

#import "BlockchainTableViewController.h"
#import "MathWalletAPI.h"

@interface BlockchainTableViewController ()

@end

@implementation BlockchainTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"MathWalletSDK-Demos";
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    switch (section) {
        case 0:             // Ethereum
            return 3;
        case 1:             // EOSIO
            return 5;
        case 2:             // EOSForce
            return 4;
        case 3:             // TRON
            return 3;
        default:
            return 0;
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 36.f;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.section) {
        case 0:{             // Ethereum
            switch (indexPath.row) {
                case 0:
                    [self ethereum_login];
                    break;
                case 1:
                    [self ethereum_transfer];
                    break;
                    
                default:
                    [self ethereum_openURL];
                    break;
            }
            break;
        }
        case 1:{             // EOSIO
            switch (indexPath.row) {
                case 0:
                    [self eosio_login];
                    break;
                case 1:
                    [self eosio_transfer];
                    break;
                case 2:
                    [self eosio_signMessage];
                    break;
                case 3:
                    [self eosio_custom_transaction];
                    break;
                default:
                    [self eosio_openURL];
                    break;
            }
            break;
        }
        case 2:{             // EOSForce
            switch (indexPath.row) {
                case 0:
                    [self eosforce_login];
                    break;
                case 1:
                    [self eosforce_transfer];
                    break;
                case 2:
                    [self eosforce_custom_transaction];
                    break;
                    
                default:
                    [self eosforce_openURL];
                    break;
            }
            break;
        }
        case 3:{             // TRON
            switch (indexPath.row) {
                case 0:
                    [self tron_login];
                    break;
                case 1:
                    [self tron_custom_transaction];
                    break;
                    
                default:
                    [self tron_openURL];
                    break;
            }
            break;
        }
        default:
            break;
    }
}

#pragma mark -  Ethereum
-(void)ethereum_openURL{
    MathWalletOpenURLReq *openURLReq = [[MathWalletOpenURLReq alloc] init];
    // 公链标识
    openURLReq.blockchain = @"ethereum";
    // DApp信息
    openURLReq.dappIcon = @"http://www.mathwallet.org/images/download/wallet_cn.png";
    openURLReq.dappName = @"MathWalletSDK-Demos";
    // 转账信息
    openURLReq.dappUrl = @"http://www.mathwallet.org/cn/";
    openURLReq.desc = @"这是展示在钱包中的描述";
    [MathWalletAPI sendReq:openURLReq];
}
-(void)ethereum_login{
    MathWalletLoginReq *loginReq = [[MathWalletLoginReq alloc] init];
    // 公链标识
    loginReq.blockchain = @"ethereum";
    // DApp信息
    loginReq.dappIcon = @"http://www.mathwallet.org/images/download/wallet_cn.png";
    loginReq.dappName = @"MathWalletSDK-Demos";
    // DApp Server
    loginReq.uuID = @"D079184AACD246CE82FC66FEB63A5999";
    loginReq.loginUrl = @"";
    loginReq.expired = [NSNumber numberWithLong:[NSDate date].timeIntervalSince1970+60];
    loginReq.loginMemo = @"Memo";
    
    
    [MathWalletAPI sendReq:loginReq];
}
-(void)ethereum_transfer{
    MathWalletTransferReq *transferReq = [[MathWalletTransferReq alloc] init];
    // 公链标识
    transferReq.blockchain = @"ethereum";
    // DApp信息
    transferReq.dappIcon = @"http://www.mathwallet.org/images/download/wallet_cn.png";
    transferReq.dappName = @"MathWalletSDK-Demos";
    // 转账信息
    transferReq.to = @"0xace753d27a7c73253c6c05e7b1c3716171f02745";
    transferReq.amount = @"0";
    transferReq.precision = @(18);
    transferReq.symbol = @"ETH";
    transferReq.contract = @"";
    transferReq.dappData = @"f2c298be0000000000000000000000000000000000000000000000000000000000000020000000000000000000000000000000000000000000000000000000000000002e516d6451654247525a67325377664a7941733156763569775a484172317164575652414e50436841546736656148000000000000000000000000000000000000";
    
    transferReq.desc = @"这是展示在钱包中的描述";
    transferReq.expired = [NSNumber numberWithLong:[NSDate date].timeIntervalSince1970+60];
    [MathWalletAPI sendReq:transferReq];
}

#pragma mark -  EOSIO
-(void)eosio_openURL{
    MathWalletOpenURLReq *openURLReq = [[MathWalletOpenURLReq alloc] init];
    // 公链标识
    openURLReq.blockchain = @"eosio";
    // DApp信息
    openURLReq.dappIcon = @"http://www.mathwallet.org/images/download/wallet_cn.png";
    openURLReq.dappName = @"MathWalletSDK-Demos";
    // 链接信息
    openURLReq.dappUrl = @"http://www.mathwallet.org/cn/";
    openURLReq.desc = @"这是展示在钱包中的描述";
    [MathWalletAPI sendReq:openURLReq];
}
-(void)eosio_signMessage{
    MathWalletSignMessageReq *signMessageReq = [[MathWalletSignMessageReq alloc] init];
    // 公链标识
    signMessageReq.blockchain = @"eosio";
    // DApp信息
    signMessageReq.dappIcon = @"http://www.mathwallet.org/images/download/wallet_cn.png";
    signMessageReq.dappName = @"MathWalletSDK-Demos";
    // 签名信息
    signMessageReq.message = @"我是要签名的信息";
    signMessageReq.isHash = @(NO);
    signMessageReq.desc = @"这是展示在钱包中的描述";
    
    [MathWalletAPI sendReq:signMessageReq];
}
-(void)eosio_login{
    MathWalletLoginReq *loginReq = [[MathWalletLoginReq alloc] init];
    // 公链标识
    loginReq.blockchain = @"eosio";
    // DApp信息
    loginReq.dappIcon = @"http://www.mathwallet.org/images/download/wallet_cn.png";
    loginReq.dappName = @"MathWalletSDK-Demos";
    // DApp Server
    loginReq.uuID = @"ios-D079184AACD246CE82FC66FEB63A5999";
    loginReq.loginUrl = @"";
    loginReq.expired = [NSNumber numberWithLong:[NSDate date].timeIntervalSince1970+60];
    loginReq.loginMemo = @"Memo";
    
    [MathWalletAPI sendReq:loginReq];
}
-(void)eosio_transfer{
    MathWalletTransferReq *transferReq = [[MathWalletTransferReq alloc] init];
    // 公链标识
    transferReq.blockchain = @"eosio";
    // DApp信息
    transferReq.dappIcon = @"http://www.mathwallet.org/images/download/wallet_cn.png";
    transferReq.dappName = @"MathWalletSDK-Demos";
    // 转账信息
    transferReq.from = @"yuzhiyou1234";
    transferReq.to = @"testaccount2";
    transferReq.amount = @"0.2500";
    transferReq.precision = @(4);
    transferReq.symbol = @"EOS";
    transferReq.contract = @"eosio.token";
    transferReq.dappData = @"memo";
    
    transferReq.desc = @"这是展示在钱包中的描述";
    transferReq.expired = [NSNumber numberWithLong:[NSDate date].timeIntervalSince1970+60];
    [MathWalletAPI sendReq:transferReq];
}
-(void)eosio_custom_transaction{
    MathWalletTransactionReq *transactionReq = [[MathWalletTransactionReq alloc] init];
    // 公链标识
    transactionReq.blockchain = @"eosio";
    // DApp信息
    transactionReq.dappIcon = @"https://www.btex.org/btex_website/static/btex.png";
    transactionReq.dappName = @"BTEX";
    // 转账信息
    transactionReq.from = @"yuzhiyou1234";
    transactionReq.actions = @[
                               @{
                                   @"code":@"eosbtexbonus",
                                   @"action":@"redeembt",
                                   @"binargs":@"200a9ba67d5fab69030000000000000060070b01000000000442540000000000"
                                   }
                               ];
    
    transactionReq.desc = @"这是展示在钱包中的描述";
    transactionReq.expired = [NSNumber numberWithLong:[NSDate date].timeIntervalSince1970+60];
    [MathWalletAPI sendReq:transactionReq];
}
#pragma mark -  EOSForce
-(void)eosforce_openURL{
    MathWalletOpenURLReq *openURLReq = [[MathWalletOpenURLReq alloc] init];
    // 公链标识
    openURLReq.blockchain = @"eosforce";
    // DApp信息
    openURLReq.dappIcon = @"http://www.mathwallet.org/images/download/wallet_cn.png";
    openURLReq.dappName = @"MathWalletSDK-Demos";
    // 转账信息
    openURLReq.dappUrl = @"http://www.mathwallet.org/cn/";
    openURLReq.desc = @"这是展示在钱包中的描述";
    [MathWalletAPI sendReq:openURLReq];
}
-(void)eosforce_login{
    MathWalletLoginReq *loginReq = [[MathWalletLoginReq alloc] init];
    // 公链标识
    loginReq.blockchain = @"eosforce";
    // DApp信息
    loginReq.dappIcon = @"http://www.mathwallet.org/images/download/wallet_cn.png";
    loginReq.dappName = @"MathWalletSDK-Demos";
    // DApp Server
    loginReq.uuID = @"ios-D079184AACD246CE82FC66FEB63A5999";
    loginReq.loginUrl = @"";
    loginReq.expired = [NSNumber numberWithLong:[NSDate date].timeIntervalSince1970+60];
    loginReq.loginMemo = @"Memo";
    
    
    [MathWalletAPI sendReq:loginReq];
}
-(void)eosforce_transfer{
    MathWalletTransferReq *transferReq = [[MathWalletTransferReq alloc] init];
    // 公链标识
    transferReq.blockchain = @"eosforce";
    // DApp信息
    transferReq.dappIcon = @"http://www.mathwallet.org/images/download/wallet_cn.png";
    transferReq.dappName = @"MathWalletSDK-Demos";
    // 转账信息
    transferReq.from = @"message";
    transferReq.to = @"testaccount2";
    transferReq.amount = @"1.0000";
    transferReq.precision = @(4);
    transferReq.symbol = @"EOS";
    transferReq.contract = @"eosio";
    transferReq.dappData = @"memo";
    
    transferReq.desc = @"这是展示在钱包中的描述";
    transferReq.expired = [NSNumber numberWithLong:[NSDate date].timeIntervalSince1970+60];
    [MathWalletAPI sendReq:transferReq];
}
-(void)eosforce_custom_transaction{
    MathWalletTransactionReq *transactionReq = [[MathWalletTransactionReq alloc] init];
    // 公链标识
    transactionReq.blockchain = @"eosforce";
    // DApp信息
    transactionReq.dappIcon = @"http://www.mathwallet.org/images/download/wallet_cn.png";
    transactionReq.dappName = @"MathWalletSDK-Demos";
    // 转账信息
    transactionReq.from = @"message";
    transactionReq.actions = @[
                               @{
                                   @"code":@"eosio",
                                   @"action":@"transfer",
                                   @"binargs":@"4086089a7ad7bef6c0a6eb6c1acda891010000000000000004454f530000000006e5a487e6b3a8"
                                   }
                               ];
    
    transactionReq.desc = @"这是展示在钱包中的描述";
    transactionReq.expired = [NSNumber numberWithLong:[NSDate date].timeIntervalSince1970+60];
    [MathWalletAPI sendReq:transactionReq];
}
#pragma mark -  TRON
-(void)tron_openURL{
    MathWalletOpenURLReq *openURLReq = [[MathWalletOpenURLReq alloc] init];
    // 公链标识
    openURLReq.blockchain = @"tron";
    // DApp信息
    openURLReq.dappIcon = @"http://www.mathwallet.org/images/download/wallet_cn.png";
    openURLReq.dappName = @"MathWalletSDK-Demos";
    // 转账信息
    openURLReq.dappUrl = @"http://www.mathwallet.org/cn/";
    openURLReq.desc = @"这是展示在钱包中的描述";
    [MathWalletAPI sendReq:openURLReq];
}
-(void)tron_login{
    MathWalletLoginReq *loginReq = [[MathWalletLoginReq alloc] init];
    // 公链标识
    loginReq.blockchain = @"tron";
    // DApp信息
    loginReq.dappIcon = @"http://www.mathwallet.org/images/download/wallet_cn.png";
    loginReq.dappName = @"MathWalletSDK-Demos";
    // DApp Server
    loginReq.uuID = @"ios-D079184AACD246CE82FC66FEB63A5999";
    loginReq.loginUrl = @"";
    loginReq.expired = [NSNumber numberWithLong:[NSDate date].timeIntervalSince1970+60];
    loginReq.loginMemo = @"Memo";
    
    
    [MathWalletAPI sendReq:loginReq];
}
-(void)tron_custom_transaction{
    MathWalletTransactionReq *transactionReq = [[MathWalletTransactionReq alloc] init];
    // 公链标识
    transactionReq.blockchain = @"tron";
    // DApp信息
    transactionReq.dappIcon = @"http://www.mathwallet.org/images/download/wallet_cn.png";
    transactionReq.dappName = @"MathWalletSDK-Demos";
    // 转账信息
    transactionReq.from = @"";
    /*
    transactionReq.contract = @[@{
                                    @"parameter": @{
                                        @"value": @{
                                            @"data": @"7365870b0000000000000000000000000000000000000000000000000000000000000060",
                                            @"owner_address": @"TAyzPC7CGD49f3zYzeaTXgfKJENwcfBxTL",
                                            @"contract_address": @"TLPs73VZBWgB2LcVXjH1ywRuVcLZK4bLjP",
                                            @"call_value": @(10000000)
                                        },
                                        @"type_url": @"type.googleapis.com/protocol.TriggerSmartContract"
                                    },
                                    @"type": @"TriggerSmartContract"
                                }];
     */
    transactionReq.contract = @[@{
                                    @"parameter": @{
                                            @"value": @{
                                                    @"amount": @(1),
                                                    @"owner_address": @"TAyzPC7CGD49f3zYzeaTXgfKJENwcfBxTL",
                                                    @"to_address": @"TLPs73VZBWgB2LcVXjH1ywRuVcLZK4bLjP"
                                                    },
                                            @"type_url": @"type.googleapis.com/protocol.TransferContract"
                                            },
                                    @"type": @"TransferContract"
                                    }];
    
    transactionReq.desc = @"这是展示在钱包中的描述";
    transactionReq.expired = [NSNumber numberWithLong:[NSDate date].timeIntervalSince1970+60];
    [MathWalletAPI sendReq:transactionReq];
}
@end
