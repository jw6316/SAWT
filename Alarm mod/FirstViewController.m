//
//  FirstViewController.m
//  Alarm mod
//
//  Created by Jamie Walker on 5/5/14.
//  Copyright (c) 2014 Jamie Walker. All rights reserved.
//

#import "FirstViewController.h"
#import "SecondViewController.h"
#import "AppDelegate.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

SecondViewController *secondViewController;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    textField.delegate = self;
    textField2.delegate = self;
    
    
    //    hazukashiArray [0] = [NSString stringWithFormat:@"I wiegh %d 00 kg.", i];
    //    hazukashiArray [1] = [NSString stringWithFormat:@"bbbb %d", i];
    //    hazukashiArray [2] = [NSString stringWithFormat:@"cccc %d", i];
    //    hazukashiArray [3] = [NSString stringWithFormat:@"dddd %d", i];
    //    hazukashiArray [4] = [NSString stringWithFormat:@"eeee %d", i];
    //    hazukashiArray [5] = [NSString stringWithFormat:@"ffff %d", i];
    //    hazukashiArray [6] = [NSString stringWithFormat:@"gggg %d", i];
    //    hazukashiArray [7] = [NSString stringWithFormat:@"hhhh %d", i];
    //    hazukashiArray [8] = [NSString stringWithFormat:@"iiii %d", i];
    //    hazukashiArray [9] = [NSString stringWithFormat:@"jjjj %d", i];
    hazukashiArray [0] = @"I wiegh %d 00 kg.";
    hazukashiArray [1] = @"Im only 16%d";
    hazukashiArray [2] = @"cccc %d";
    hazukashiArray [3] = @"dddd %d";
    hazukashiArray [4] = @"eeee %d";
    hazukashiArray [5] = @"ffff %d";
    hazukashiArray [6] = @"gggg %d";
    hazukashiArray [7] = @"hhhh %d";
    hazukashiArray [8] = @"iiii %d";
    hazukashiArray [9] = @"jjjj %d";
    //    i = 1;
    
    afterTimerSeconds = 120;
    
}




-(IBAction)twitterButton{
    twitterAlert = [[UIAlertView alloc]
                    initWithTitle:@"Twitter"
                    message:@"Go to Twitter?"
                    delegate:self
                    cancelButtonTitle:@"Yes."
                    otherButtonTitles:@"No thanks.",nil];
    
    [twitterAlert performSelectorOnMainThread:@selector(show)
                                   withObject:nil
                                waitUntilDone:NO];
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    
    if(twitterAlert == alertView){
        
        NSString *url;
        NSURL *twitterUrl;
        switch (buttonIndex) {
            case 0:
                url = @"twitter://";
                // for testing purposes use               url = @"cp-twitter://";
                twitterUrl = [NSURL URLWithString:url];
                if ([[UIApplication sharedApplication] canOpenURL:twitterUrl]) {
                    [[UIApplication sharedApplication] openURL:twitterUrl];
                    NSLog(@"is this coming through");
                }else {
                    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.twitter.com"]];
                }
                break;
            case 1:
                break;
            default:
                break;
        }
    } else if(WARNINGalert == alertView){
        switch (buttonIndex) {
            case 0:
                break;
                
        }
    }
    else if(alertt== alertView){
        switch (buttonIndex) {
            case 0:
                break;
                //            case 1:
                //                break;
        }
    }
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    //Dispose of any resources that can be recreated.
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    //to close the keyboard thats in ur waaayyyyyyyyy ( IM NOT USING TEXT FIELDS SO......
    [textField resignFirstResponder];
    return YES;
}

-(BOOL)textFieldShouldReturn2:(UITextField *)textField2
{
    //to close the keyboard thats in ur waaayyyyyyyyy ( IM NOT USING TEXT FIELDS SO......
    [textField2 resignFirstResponder];
    return YES;
}

- (IBAction)twitterino{//change to void later
    labelForA.text = [NSString stringWithFormat:@"%d", a];
    labelForB.text = [NSString stringWithFormat:@"%d", b];
    labelForC.text = [NSString stringWithFormat:@"%d", c];
    labelForD.text = [NSString stringWithFormat:@"%d", d];
    labelForE.text = [NSString stringWithFormat:@"%d", e];
    labelForF.text = [NSString stringWithFormat:@"%d", f];
    labelForG.text = [NSString stringWithFormat:@"%d", g];
    labelForH.text = [NSString stringWithFormat:@"%d", h];
    labelForI.text = [NSString stringWithFormat:@"%d", i];
    labelForJ.text = [NSString stringWithFormat:@"%d", j];
    
    int random_number = arc4random() %10;
    
    if (random_number == 0){
        a++;
        z = a;
    }else if (random_number == 1){
        b--;
        z = b;
    }else if (random_number == 2){
        c++;
        z = c;
    }else if (random_number == 3){
        d++;
        z = d;
    }else if (random_number == 4){
        e++;
        z = e;
    }else if (random_number == 5){
        f++;
        z = f;
    }else if (random_number == 6){
        g++;
        z = g;
    }else if (random_number == 7){
        h++;
        z = h;
    }else if (random_number == 8){
        i++;
        z = i;
    }else if (random_number == 9){
        j++;
        z = j;
    }
    if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeTwitter]) {
        ACAccountStore *accountStore = [[ACAccountStore alloc] init];
        ACAccountType *accountType = [accountStore accountTypeWithAccountTypeIdentifier:ACAccountTypeIdentifierTwitter];
        [accountStore
         requestAccessToAccountsWithType:accountType
         options:nil
         completion:^(BOOL granted, NSError *error) {
             if (granted) {
                 NSArray *accountArray = [accountStore accountsWithAccountType:accountType];
                 if (accountArray.count > 0) {
                     NSURL *url = [NSURL URLWithString:@"https://api.twitter.com/1.1/statuses/update.json"];
                     //                    i++;
                     NSString *str = [NSString stringWithFormat:hazukashiArray[random_number],z];
                     NSString * randStr = [NSString stringWithFormat:str,random_number];
                     NSDictionary *params = [NSDictionary dictionaryWithObject:randStr forKey:@"status"];//
                     
                     SLRequest *request = [SLRequest requestForServiceType:SLServiceTypeTwitter
                                                             requestMethod:SLRequestMethodPOST
                                                                       URL:url
                                                                parameters:params];
                     [request setAccount:[accountArray objectAtIndex:0]];
                     [request performRequestWithHandler:^(NSData *responseData, NSHTTPURLResponse *urlResponse, NSError *error) {
                         NSLog(@"responseData=%@", [[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding]);
                     }];
                 }
             }
         }];
    }
}


-(void)yayaya{
    
    afterTimerSeconds -= 1;
    
    
    
    if (afterTimerSeconds == 0){
        [self twitterino];
    }
    
    
    
}





-(IBAction)instructions{
    alertt = [[UIAlertView alloc]
              initWithTitle:@"Instructions"
              message:@"1). Add the amount of time you wish to sleep, and press start. 2). This will wake you up, trying every way possible (even using auto-sharing on twitter; don't worry we'll only post sort-of-embarrasing things, nothing serious)."
              delegate:self
              cancelButtonTitle:@"Got it."
              otherButtonTitles:nil];
    
    [alertt performSelectorOnMainThread:@selector(show)
                             withObject:nil
                          waitUntilDone:NO];
    NSLog(@"this is working");
}




-(IBAction)WARNING{
    WARNINGalert = [[UIAlertView alloc]
                    initWithTitle:@"WARNING"
                    message:@" As with the instructions, half-embarrasing things MIGHT get posted.....(hint hint) USE AT YOUR OWN RISK, so I recommend that people who don't like having fun or getting slightly teased might not want to use this app. Just sayin' ya know. Good luck ;) "
                    delegate:self
                    cancelButtonTitle:@"I understand."
                    otherButtonTitles:nil];
    
    [WARNINGalert performSelectorOnMainThread:@selector(show)
                                   withObject:nil
                                waitUntilDone:NO];
}


//-(void)twoMinutesAfterZero{
//    //change to void later
//    labelForA.text = [NSString stringWithFormat:@"%d", a];
//    labelForB.text = [NSString stringWithFormat:@"%d", b];
//    labelForC.text = [NSString stringWithFormat:@"%d", c];
//    labelForD.text = [NSString stringWithFormat:@"%d", d];
//    labelForE.text = [NSString stringWithFormat:@"%d", e];
//    labelForF.text = [NSString stringWithFormat:@"%d", f];
//    labelForG.text = [NSString stringWithFormat:@"%d", g];
//    labelForH.text = [NSString stringWithFormat:@"%d", h];
//    labelForI.text = [NSString stringWithFormat:@"%d", i];
//    labelForJ.text = [NSString stringWithFormat:@"%d", j];
//
//    int random_number = arc4random() %10;
//
//    if (random_number == 0){
//        a++;
//        z = a;
//    }else if (random_number == 1){
//        b++;
//        z = b;
//    }else if (random_number == 2){
//        c++;
//        z = c;
//    }else if (random_number == 3){
//        d++;
//        z = d;
//    }else if (random_number == 4){
//        e++;
//        z = e;
//    }else if (random_number == 5){
//        f++;
//        z = f;
//    }else if (random_number == 6){
//        g++;
//        z = g;
//    }else if (random_number == 7){
//        h++;
//        z = h;
//    }else if (random_number == 8){
//        i++;
//        z = i;
//    }else if (random_number == 9){
//        j++;
//        z = j;
//    }
//    if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeTwitter]) {
//        ACAccountStore *accountStore = [[ACAccountStore alloc] init];
//        ACAccountType *accountType = [accountStore accountTypeWithAccountTypeIdentifier:ACAccountTypeIdentifierTwitter];
//        [accountStore
//         requestAccessToAccountsWithType:accountType
//         options:nil
//         completion:^(BOOL granted, NSError *error) {
//             if (granted) {
//                 NSArray *accountArray = [accountStore accountsWithAccountType:accountType];
//                 if (accountArray.count > 0) {
//                     NSURL *url = [NSURL URLWithString:@"https://api.twitter.com/1.1/statuses/update.json"];
//                     //                    i++;
//                     NSString *str = [NSString stringWithFormat:hazukashiArray[random_number],z];
//                     NSString * randStr = [NSString stringWithFormat:str,random_number];
//                     NSDictionary *params = [NSDictionary dictionaryWithObject:randStr forKey:@"status"];//
//
//                     SLRequest *request = [SLRequest requestForServiceType:SLServiceTypeTwitter
//                                                             requestMethod:SLRequestMethodPOST
//                                                                       URL:url
//                                                                parameters:params];
//                     [request setAccount:[accountArray objectAtIndex:0]];
//                     [request performRequestWithHandler:^(NSData *responseData, NSHTTPURLResponse *urlResponse, NSError *error) {
//                         NSLog(@"responseData=%@", [[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding]);
//                     }];
//                 }
//             }
//         }];
//    }
//}
//
//








//{
//
//    ACAccountStore *account = [[ACAccountStore alloc] init];
//    ACAccountType *accountType = [account accountTypeWithAccountTypeIdentifier:
//                                  ACAccountTypeIdentifierTwitter];
//
//    [account requestAccessToAccountsWithType:accountType options:nil
//                                  completion:^(BOOL granted, NSError *error)
//     {
//         if (granted == YES)
//         {
//             NSArray *arrayOfAccounts = [account
//                                         accountsWithAccountType:accountType];
//
//             if ([arrayOfAccounts count] > 0)
//             {
//                 ACAccount *twitterAccount = [arrayOfAccounts lastObject];
//
//                 NSDictionary *message = @{@"status": @"Test Twitter post from iOS 6"};
//
//                 NSURL *requestURL = [NSURL
//                                      URLWithString:@"http://api.twitter.com/1/statuses/update.json"];
//
//                 postRequest = [SLRequest
//                                requestForServiceType:SLServiceTypeTwitter
//                                requestMethod:SLRequestMethodPOST
//                                URL:requestURL parameters:message];
//             }
//         }
//
//     }
//     ];}

@end

//---------------------------------------------------------------------------------------------------------------------------------
//---------------------------------------------------------------------------------------------------------------------------------
//----------------------------------|--|-----------------------------------------------|---|---------------------------------------
//---------------------------------|-----|-------------------------------------------|-------|-------------------------------------
//------------------------------------0--------------------------------------------------0-----------------------------------------
//---------------------------------|-----|--------------------------------------------|------|-------------------------------------
//-----------------------------------|-|------------------------------------------------|--|---------------------------------------
//-----------------------------------------------------------|---------------------------------------------------------------------
//-----------------------------------------------------------|---------------------------------------------------------------------
//-----------------------------------------------------------|---------------------------------------------------------------------
//----------------------------------------------------------|----------------------------------------------------------------------
//---------------------------------------------------------|-----------------------------------------------------------------------
//--------------------------------------------------------|------------------------------------------------------------------------
//----------------------------------|----------------------|----|------------------------------------------------------------------
//----------------------------------------------------------|-|-------------------------------|------------------------------------
//-----------------------------------|--------------------------------------------------------|------------------------------------
//-------------------------------------------------------------------------------------------|-------------------------------------
//------------------------------------|------------------------------------------------------|-------------------------------------
//---------------------------------------|--------------------------------------------------|--------------------------------------
//---------------------------------------|------------------------------------------------|----------------------------------------
//--------------------------------------------|--------------------------------------|--|------------------------------------------
//-----------------------------------------------|------|------|-----|------|-------|----------------------------------------------








