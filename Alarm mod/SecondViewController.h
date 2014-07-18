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
int mins;
int seconds;
int hrs;
NSDate *backgroundTime; // counts the time it was in the background
NSDate *foregroundTIme; // counts "now" time and uses it to get the accurate time
int allSeconds; // adds the hours and seconds and minutes into seconds only
float difference; // the difference between backgroundTime and foregroundTime






@interface SecondViewController : UIViewController <UIAlertViewDelegate, UITextFieldDelegate>


{
    
    int startnumber;//TO MAKE THE START NOT WORK IF ITS ALREADY GOING
    int stopnumber; // THIS IS TO STOP THE LIGHTS AND SOUND AND VIB
    
    NSURL *url;
//    int crashing;
    
    
    
    IBOutlet UILabel *hourslabel;
    IBOutlet UILabel *minuteslabel;
    IBOutlet UILabel *secondslabel;
    
    
    IBOutlet UILabel *hoursTF;
    IBOutlet UILabel *minsTF;
    
    
    IBOutlet UIButton *buttonoff;
    
    
    
    NSTimer *timer;
    
    AVAudioPlayer *audio;
    
    IBOutlet UIStepper *hourstepper;
    IBOutlet UIStepper *minutestepper;
    
    
    
    
    
}

@property (nonatomic)IBOutlet UILabel *hourslabel;
@property (nonatomic)IBOutlet UILabel *minuteslabel;
@property (nonatomic)IBOutlet UILabel *secondslabel;






//-(IBAction)settings;
-(IBAction)resetion;
-(IBAction)start;
-(void)countdown;
//-(void)vibration;
//-(IBAction)crash;
-(IBAction)off;
-(IBAction)hoursstepper;
-(IBAction)minutesstepper;

-(IBAction)debugSeconds;












@end