//
//  FirstViewController.h
//  Alarm mod
//
//  Created by Jamie Walker on 5/5/14.
//  Copyright (c) 2014 Jamie Walker. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Accounts/Accounts.h>
#import <Social/Social.h>

@interface FirstViewController : UIViewController <UITextFieldDelegate>{
    
    IBOutlet UITextField *textField;
    IBOutlet UITextField *textField2;
    SLRequest *postRequest;
    int randomisation;
    
    int a;
    int b;
    int c;
    int d;
    int e;
    int f;
    int g;
    int h;
    int i;
    int j;
    
    int z;
    
    
    int afterTimerSeconds;

    
    
    NSString *hazukashiArray [10];
    
    IBOutlet UILabel *labelForA;
    IBOutlet UILabel *labelForB;
    IBOutlet UILabel *labelForC;
    IBOutlet UILabel *labelForD;
    IBOutlet UILabel *labelForE;
    IBOutlet UILabel *labelForF;
    IBOutlet UILabel *labelForG;
    IBOutlet UILabel *labelForH;
    IBOutlet UILabel *labelForI;
    IBOutlet UILabel *labelForJ;

    
    NSTimer *tweetimer;

    
    
    
}

-(IBAction)twitterino;
-(IBAction)afterAllSeconds;
-(IBAction)instructions;





//Debugged almost nothing compared to how many bugs there still are.


@end