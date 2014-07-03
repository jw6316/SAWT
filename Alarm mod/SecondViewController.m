//
//  SecondViewController.m
//  alarm for golden week and etc
//
//  Created by Jamie Walker on 5/3/14.
//  Copyright (c) 2014 Jamie Walker. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

@synthesize minuteslabel;
@synthesize secondslabel;
@synthesize hourslabel;


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"97744^ALARM" ofType:@"mp3"];
    url = [NSURL fileURLWithPath:path];
    audio = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
    [audio prepareToPlay];
    
    
	// Do any additional setup after loading the view, typically from a nib.
    hrs = 0;
    mins = 0;
    seconds = 0;
    
    hourslabel.text=[NSString stringWithFormat:@"%d", hrs];
    minuteslabel.text=[NSString stringWithFormat:@"%d", mins];
    secondslabel.text=[NSString stringWithFormat:@"%d", seconds];
    
    startnumber = 0;
    stopnumber = 0;
    

//    hoursTF.delegate = self;
//    minsTF.delegate = self;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(IBAction)settings{
    
    hrs = [hoursTF.text intValue];
    mins = [minsTF.text intValue];
    seconds = 0 ;
    
    
    
    hourslabel.text = hoursTF.text;
    minuteslabel.text = minsTF.text;
    secondslabel.text = @"0";
    
    
    
}





-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    //to close the keyboard thats in ur waaayyyyyyyyy ( IM NOT USING TEXT FIELDS SO......
    [textField resignFirstResponder];
    return YES;
}



-(IBAction)start{
    if (startnumber == 0) {
        timer = [NSTimer scheduledTimerWithTimeInterval:1.0
                                                 target:self
                                               selector:@selector(countdown)
                                               userInfo:nil
                                                repeats:YES];
        startnumber = 1;
    }
}

-(void)countdown{
    
    seconds -= 1;
    
    if (mins ==0 && seconds == 0 && hrs == 0) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"XD"
                                                        message:@"WAKE UP!"
                                                       delegate:nil
                                              cancelButtonTitle:nil
                                              otherButtonTitles:@"Okay, okay, IM GETTING UP NOW", nil
                              
                              ];
        [alert show];
        [audio play];
        
        while (stopnumber == 0) {
            AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
            AVCaptureSession *captureSession;
            [captureSession startRunning];
            NSError *error = nil;
            AVCaptureDevice *captureDevice = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
            [captureDevice lockForConfiguration:&error];
            captureDevice.torchMode = AVCaptureTorchModeOn;
            [captureDevice unlockForConfiguration];

        }
        
        
        
        
        
        
        
        
        
        [timer invalidate]; //it stops the timer
        //        if (AudioServicesPlaySystemSound(kSystemSoundID_Vibrate) isValid) {
        //        [ audioServicesPlaySystemSound(kSystemSoundID_Vibrate) invalidate];
        //        }
        
        
    }
    
    
    if ( seconds < 0){
        mins -= 1;
        seconds = 59;
        
        if (mins < 0) {
            hrs -= 1;
            mins = 59;
        }
        
    }
    
    
    secondslabel.text = [NSString stringWithFormat:@"%d", seconds];
    minuteslabel.text = [NSString stringWithFormat:@"%d", mins];
    hourslabel.text = [NSString stringWithFormat:@"%d", hrs];
    
    
    
}




-(IBAction)resetion{
    // I NEED TO ADD STUFF HERE REMEMBER THAT.
    hrs = 0;
    mins = 0;
    seconds =0;
    minuteslabel.text = @"0";
    secondslabel.text = @"0";
    hourslabel.text = @"0";
//    hoursTF = 0;
//    minsTF = 0;
    [timer invalidate];
    
    startnumber = 0;// make it 0 so that you can press start again
    stopnumber = 0; // make it 0 so that you can play the wakeup sounds again
}
//-(IBAction)crash{
//    crashing /= 0;
//    
//}


- (IBAction)hourstepper:(UIStepper *)sender {
    
    double value = [sender value];
    
    [hoursTF setText:[NSString stringWithFormat:@"%d", (int)value]];
}
- (IBAction)minutesstepper{
    
    mins = minutestepper.value;
    minsTF.text=[NSString stringWithFormat:@"%d",mins];

}
- (IBAction)hoursstepper{
    
    hrs = hourstepper.value;
    hoursTF.text=[NSString stringWithFormat:@"%d",hrs];
    
}
//
-(IBAction)off{
    
    if (stopnumber == 0) {
        stopnumber = 1;
        [audio stop];

    }
//    NSError *offerror = nil;
//    AVCaptureDevice *offcaptureDevice = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
//    
//    [offcaptureDevice lockForConfiguration:&offerror];
//    offcaptureDevice.torchMode = AVCaptureTorchModeOff;
//    [offcaptureDevice unlockForConfiguration];
//    
//    
//    [captureSession stopRunning];
    
}



//-(void)steppers{
//    hourstepper = hoursTF.text;
//    minutestepper = minsTF.text;
//}


@end