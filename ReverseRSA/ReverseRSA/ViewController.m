//
//  ViewController.m
//  ReverseRSA
//
//  Created by czera on 2020/2/3.
//  Copyright © 2020 czera. All rights reserved.
//

#import "ViewController.h"
#import "RSACryptor.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    // Do any additional setup after loading the view.
    
    
    //1、加载公钥
    [[RSACryptor sharedRSACryptor] loadPublicKey:[[NSBundle mainBundle] pathForResource:@"rsacert.der" ofType:nil]] ;
    
    //2、加载私钥
    [[RSACryptor sharedRSACryptor] loadPrivateKey:[[NSBundle mainBundle] pathForResource:@"p.p12" ofType:nil] password:@"123456"];
    
    
}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    //加密
    NSData * ret = [[RSACryptor sharedRSACryptor] encryptData:[@"hello" dataUsingEncoding:NSUTF8StringEncoding]];
    //编码
    NSString * base64 = [ret base64EncodedStringWithOptions:0];
    NSLog(@"%@",base64);
    
    //解密
    NSData * jiemi = [[RSACryptor sharedRSACryptor] decryptData:ret];
    NSLog(@"%@",[[NSString alloc] initWithData:jiemi encoding:NSUTF8StringEncoding]);
}

@end
