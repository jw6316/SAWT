//
//  SecondViewController.h
//  alarm for golden week and etc
//
//  Created by Jamie Walker on 5/3/14.
//  Copyright (c) 2014 Jamie Walker. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import <AudioToolbox/AudioServices.h>
#import <AudioToolbox/AudioServices.h>
#import <AVFoundation/AVCaptureDevice.h>




@interface SecondViewController : UIViewController <UIAlertViewDelegate, UITextFieldDelegate>


{
    int mins;
    int seconds;
    int hrs;
    
    NSURL *url;
//    int crashing;
    
    
    
    IBOutlet UILabel *hourslabel;
    IBOutlet UILabel *minuteslabel;
    IBOutlet UILabel *secondslabel;
    
    
    IBOutlet UILabel *hoursTF;
    IBOutlet UILabel *minsTF;
    
    
    
    NSTimer *timer;
    
    AVAudioPlayer *audio;
    
    IBOutlet UIStepper *hourstepper;
    IBOutlet UIStepper *minutestepper;
    
    
    
    
    
}





-(IBAction)settings;
-(IBAction)resetion;
-(IBAction)start;
-(void)countdown;
//-(void)vibration;
//-(IBAction)crash;
-(IBAction)off;
-(IBAction)hoursstepper;
-(IBAction)minutesstepper;







@end
