//
//  FirstViewController.h
//  Alarm mod
//
//  Created by Jamie Walker on 5/5/14.
//  Copyright (c) 2014 Jamie Walker. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Accounts/Accounts.h>

@interface FirstViewController : UIViewController{
    
    ACAccountStore *account;
    ACAccountType *accountType;
    
    
}

-(IBAction)twitterino;

//hi


@end