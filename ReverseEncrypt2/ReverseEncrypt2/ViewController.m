//
//  ViewController.m
//  ReverseEncrypt2
//
//  Created by czera on 2020/2/11.
//  Copyright © 2020 czera. All rights reserved.
//

#import "ViewController.h"
#import "EncryptionTools.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    /** AES - ECB */
    NSString * key = @"abc";
    NSString * encStr = [[EncryptionTools sharedEncryptionTools] encryptString:@"hello" keyString:key iv:nil];

    NSLog(@"加密的结果是：%@",encStr);

    NSLog(@"解密的结果是：%@",[[EncryptionTools sharedEncryptionTools] decryptString:encStr keyString:key iv:nil]);

    /** AES - CBC 加密 */
    uint8_t iv[8] = {1,2,3,4,5,6,7,8};
    NSData *ivData = [NSData dataWithBytes:iv length:sizeof(iv)];

    NSLog(@"CBC加密：%@",[[EncryptionTools sharedEncryptionTools] encryptString:@"hello" keyString:@"abc" iv:ivData]);

    NSLog(@"解密：%@",[[EncryptionTools sharedEncryptionTools] decryptString:@"u3W/N816uzFpcg6pZ+kbdg==" keyString:key iv:ivData]);
}


@end
