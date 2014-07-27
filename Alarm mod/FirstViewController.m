//
//  FirstViewController.m
//  Alarm mod
//
//  Created by Jamie Walker on 5/5/14.
//  Copyright (c) 2014 Jamie Walker. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    textField.delegate = self;
    textField2.delegate = self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    //to close the keyboard thats in ur waaayyyyyyyyy ( IM NOT USING TEXT FIELDS SO......
    [textField resignFirstResponder];
    return YES;
}

-(BOOL)textFieldShouldReturn2:(UITextField *)textField
{
    //to close the keyboard thats in ur waaayyyyyyyyy ( IM NOT USING TEXT FIELDS SO......
    [textField2 resignFirstResponder];
    return YES;
}





-(IBAction)twitterino{
//    account = [[ACAccountStore alloc] init];
//    accountType = [account accountTypeWithAccountTypeIdentifier:
//                                  ACAccountTypeIdentifierTwitter];
//    [account requestAccessToAccountsWithType:accountType
//                                          options:nil completion:^(BOOL granted, NSError *e) {
//                                              if (granted) {
//                                                  NSArray *accounts = [account
//                                                                       accountsWithAccountType:accountType];
//                                                  accountType = [accounts lastObject];
//                                              }
//                                              else
//                                              {
//                                                  // Handle Failure
//                                              }
//                                          }];

}
//-(void)Post
//{
//    ACAccountStore *accountStore = [[ACAccountStore alloc] init];
//    
//    ACAccountType *facebookAccountType = [self.accountStore
//                                          accountTypeWithAccountTypeIdentifier:ACAccountTypeIdentifierFacebook];
//    
//    // Specify App ID and permissions
//    NSDictionary *options = @{
//                              ACFacebookAppIdKey: @"my app id",
//                              ACFacebookPermissionsKey: @[@"publish_stream", @"publish_actions"],
//                              ACFacebookAudeinceKey: ACFacebookAudienceFriends
//                              };
//
//    [accountStore requestAccessToAccountsWithType:facebookAccountType
//                                          options:options completion:^(BOOL granted, NSError *e) {
//                                              if (granted) {
//                                                  NSArray *accounts = [self.accountStore
//                                                                       accountsWithAccountType:facebookAccountType];
//                                                  facebookAccount = [accounts lastObject];
//                                              }
//                                              else
//                                              {
//                                                  // Handle Failure
//                                              }
//                                          }];
    



@end