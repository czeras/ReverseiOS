//
//  ViewController.m
//  ReverseEncrypt1
//
//  Created by czera on 2020/2/4.
//  Copyright © 2020 czera. All rights reserved.
//

#import "ViewController.h"
#import "NSString+Hash.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

//足够复杂！
static NSString * salt = @"(*(*(DS*YFHIUYF(*&DSFHUS(*AD&";

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    //密码
    NSString * pwd = @"123456";

    //MD5 直接加密 e10adc3949ba59abbe56e057f20f883e
    //不足：不够安全了。可以反查询！
//    pwd = pwd.md5String;
//    NSLog(@"%@",pwd);
    
    //MD5 加盐
    //弊端： 盐是固定的，写死在程序里面，一旦泄露就不安全了！
//    pwd = [pwd stringByAppendingString:salt].md5String;
    
    /** HMAC
     *  使用一个密钥加密，并且做两次散列！
     *  在实际开发中，密钥（KEY）来自于服务器（动态的）！
     *  一个账号，对应一个KEY，而且还可以更新！
     */
    pwd = [pwd hmacMD5StringWithKey:@"czera"];
    // pwd = [pwd stringByAppendingString:@"data"].md5String;
    NSLog(@"%@",pwd);
}
@end
