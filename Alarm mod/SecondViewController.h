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
#import <AVFoundation/AVCaptureDevice.h>
#import <Social/Social.h>
#import <Accounts/Accounts.h>



int mins;
int seconds;
int hrs;
int minutes;
int secondsTwo;
int hours;
NSDate *backgroundTime; // counts the time it was in the background
NSDate *foregroundTIme; // counts "now" time and uses it to get the accurate time
int allSeconds; // adds the hours and seconds and minutes into seconds only
float difference; // the difference between backgroundTime and foregroundTime
//IBOutlet UIButton *buttonoff; //this button is hidden, unless called (he is shy). Makes all the audio/vib/lights turn off.
//int startnumber;//TO MAKE THE START NOT WORK IF ITS ALREADY GOING
//int stopnumber; // THIS IS TO STOP THE LIGHTS AND SOUND AND VIB





@interface SecondViewController : UIViewController <UIAlertViewDelegate, UITextFieldDelegate>


{
    
    IBOutlet UIButton *buttonoff; //this button is hidden, unless called (he is shy). Makes all the audio/vib/lights turn off.
    int startnumber;//TO MAKE THE START NOT WORK IF ITS ALREADY GOING
    int stopnumber; // THIS IS TO STOP THE LIGHTS AND SOUND AND VIB
    
    NSURL *url; // some kind of thing to make the song work
    
    
    
    IBOutlet UILabel *hourslabel; //the label showing "hours" on the bottom of the Second View Controller
    IBOutlet UILabel *minuteslabel; //the label showing "minutes" on the bottom of the Second View Controller
    IBOutlet UILabel *secondslabel; //the label showing "seconds" on the bottom of the Second View Controller
    
    
    IBOutlet UILabel *hoursTF; //a LABEL showing the stepper value.
    IBOutlet UILabel *minsTF; //a LABEL showing the stepper value.
    
    
    
    NSTimer *timer; //the timer called when "start" is pressed
//    NSTimer *venzeerotimer; //calls alert with the showOffButton every small amounts of times. 
    
    AVAudioPlayer *audio; //the audio which is the siren that comes when all the timer values are at 0.
    UIAlertView *alert; //the alert thats supposed to come up when called. DOES NOT COME UP IN COUNTDOWN. ;(
    
    IBOutlet UIStepper *hourstepper; //the stepper chaning the values of hoursTF.
    IBOutlet UIStepper *minutestepper; //the stepper chaning the values of hoursTF.
    
    
    IBOutlet UIImageView *bgImageView; //i have no idea.
    IBOutlet UIButton *startButton; //start button starting the countdown.

    
//-----------------------------------------------------------------------------------------------------------------------------
    
    
    
    
    NSTimer *tweetimer;
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
    
    
    NSTimer *timer2;
    
    NSString *hazukashiArray [10];
    
    BOOL isStarted;
    
}

@property (nonatomic)IBOutlet UILabel *hourslabel; //idek
@property (nonatomic)IBOutlet UILabel *minuteslabel; //idek
@property (nonatomic)IBOutlet UILabel *secondslabel; //idek






//-(IBAction)settings;
-(IBAction)resetion; //resets all integers and labels
-(IBAction)start; //starts the countdown
-(void)countdown; //this void minuses the label values every second
-(IBAction)off; //method turing all the audio/vib/lights off.
-(IBAction)hoursstepper; //the stepper button changing the vlue of "hours"
-(IBAction)minutesstepper; //the stepper button changing the vlue of "minutes"
-(IBAction)twitterino;
-(void)hideButtonOff; //hides the buttonOff button.
-(void)afterTimerVoid; //setting for twitter autoshare

//-(void)alert;











@end