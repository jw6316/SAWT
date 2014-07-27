//
//  FirstViewController.h
//  Alarm mod
//
//  Created by Jamie Walker on 5/5/14.
//  Copyright (c) 2014 Jamie Walker. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Accounts/Accounts.h>

@interface FirstViewController : UIViewController <UITextFieldDelegate>{
    
    ACAccountStore *account;
    ACAccountType *accountType;
    IBOutlet UITextField *textField;
    IBOutlet UITextField *textField2;

    
    
}

-(IBAction)twitterino;

//added some buttons (just for adding the commit/push)


@end