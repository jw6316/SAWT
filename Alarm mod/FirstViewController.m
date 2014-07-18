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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
-(void)Post
{
    ACAccountStore *accountStore = [[ACAccountStore alloc] init];
    
    ACAccountType *facebookAccountType = [self.accountStore
                                          accountTypeWithAccountTypeIdentifier:ACAccountTypeIdentifierFacebook];
    
    // Specify App ID and permissions
    NSDictionary *options = @{
                              ACFacebookAppIdKey: @"my app id",
                              ACFacebookPermissionsKey: @[@"publish_stream", @"publish_actions"],
                              ACFacebookAudeinceKey: ACFacebookAudienceFriends
                              };
    
    [accountStore requestAccessToAccountsWithType:facebookAccountType
                                          options:options completion:^(BOOL granted, NSError *e) {
                                              if (granted) {
                                                  NSArray *accounts = [self.accountStore
                                                                       accountsWithAccountType:facebookAccountType];
                                                  facebookAccount = [accounts lastObject];
                                              }
                                              else
                                              {
                                                  // Handle Failure
                                              }
                                          }];


@end