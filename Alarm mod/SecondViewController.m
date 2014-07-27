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
    
    alert = [[UIAlertView alloc] initWithTitle:@"XD"
                                       message:@"WAKE UP!"
                                      delegate:nil
                             cancelButtonTitle:@"Just a little more......."
                             otherButtonTitles:@"Okay, okay, IM GETTING UP NOW", nil];
    
    
    
    
	// Do any additional setup after loading the view, typically from a nib.
    hrs = 0;
    mins = 0;
    seconds = 0;
//------------------------------------------------------------------------------------------------------------------
//------------------------------------------------------------------------------------------------------------------
//------------------------------------------------------------------------------------------------------------------
//----------------------REMEMBER TO EXPLAIN------------------------
// I MADE IT SO THAT YOU CANT CHANGE THE NUMBER BY JUST CLICKING THE STEPPER, EVEN WHEN THE TIMER IS GOING. DID THAT
// BY MAKING A CONVERION FROM THE STEPPER INT TO THE TIMER INT, OOONNNNLLYYY WHEN THE "STARTNUMBER" IS 0. 
// DONT worry I made the new ints global too
    
    startnumber = 0;
    stopnumber = 0;

//    hoursTF.delegate = self;
//    minsTF.delegate = self;
    
    // デフォルトの通知センターを取得する
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    
    // 通知センターに通知要求を登録する
    // この例だと、通知センターに"Tuchi"という名前の通知がされた時に、
    // hogeメソッドを呼び出すという通知要求の登録を行っている。
    [nc addObserver:self selector:@selector(v) name:@"Tuchi" object:nil];
    
}
-(void)alert
{


    [alert show];

}

- (void)v
{
    buttonoff.frame = CGRectMake(-100, -100, buttonoff.frame.size.width, buttonoff.frame.size.height);
    [self.view setNeedsDisplay];
}

- (void)viewDidAppear:(BOOL)animated
{
    [self v];

}


-(void)aaa
{
    buttonoff.frame = CGRectMake(160, 346, buttonoff.frame.size.width, buttonoff.frame.size.height);
    NSLog(@"yo wasup");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//-(IBAction)settings{
//    
//    hrs = [hoursTF.text intValue];
//    mins = [minsTF.text intValue];
//    seconds = 0 ;
//    
//    
//    
//    hourslabel.text = hoursTF.text;
//    minuteslabel.text = minsTF.text;
//    secondslabel.text = @"0";
//    
//    
//    
//}
// // unused now because its in the "start" method





//-(BOOL)textFieldShouldReturn:(UITextField *)textField
//{
//    //to close the keyboard thats in ur waaayyyyyyyyy ( IM NOT USING TEXT FIELDS SO......
//    [textField resignFirstResponder];
//    return YES;
//}



-(IBAction)start{
    

    
    if (startnumber == 0) {
        
        startButton.frame = CGRectMake(-100, -100, buttonoff.frame.size.width, buttonoff.frame.size.height);

        
        

        
        timer = [NSTimer scheduledTimerWithTimeInterval:1.0
                                                 target:self
                                               selector:@selector(countdown)
                                               userInfo:nil
                                                repeats:YES];
        
        
        

        
        
        
        //バックグラウンド通知
        //https://sites.google.com/site/propicaudio/sample-code/notification-test
        //http://crunchtimer.jp/blog/ios/ios-localnotification.html
        //UILocalNotificationクラスのインスタンスを作成します。
        UILocalNotification *localNotif = [[UILocalNotification alloc] init];
        if (localNotif == nil)
            return;
        
        //通知を受け取る時刻を指定します。
        localNotif.fireDate = [[NSDate date] dateByAddingTimeInterval:seconds + mins * 60 + hrs * 3600];
        localNotif.timeZone = [NSTimeZone defaultTimeZone];
        
        //通知メッセージの本文を指定します。
        localNotif.alertBody = [NSString stringWithFormat:@"The timer has gone off. If you do not wake up, bad things might happen to you. No seriously."];
        
        //通知メッセージアラートのボタンに表示される文字を指定します。
        localNotif.alertAction = @"Open";
        
        //通知されたときの音を指定します。
        localNotif.soundName = UILocalNotificationDefaultSoundName;
        
        
        //通知されたときのアイコンバッジの右肩に表示する数字を指定します。
        localNotif.applicationIconBadgeNumber = 1;
        
        //通知を受け取るときに送付される NSDictionary を作成します。
        NSDictionary *infoDict = [NSDictionary dictionaryWithObject:@"It is time that you set"    forKey:@"EventKey"];
        localNotif.userInfo = infoDict;
        
        //作成した通知イベント情報をアプリケーションに登録します。
        [[UIApplication sharedApplication] scheduleLocalNotification:localNotif];
        
        startnumber = 1;
        stopnumber = 0;
        
        hrs = [hoursTF.text intValue];
        mins = [minsTF.text intValue];
        seconds = 0;
        
        
        

        
        if (seconds + mins * 60 + hrs * 3600<=0) {
            hrs = 0;
            mins = 0;
            seconds =0;
            minuteslabel.text = @"0";
            secondslabel.text = @"0";
            hourslabel.text = @"0";
            [timer invalidate];
//            secondslabel.text = [NSString stringWithFormat:@"%d", seconds];
//            minuteslabel.text = [NSString stringWithFormat:@"%d", mins];
//            hourslabel.text = [NSString stringWithFormat:@"%d", hrs];
            

            
        }
        
        hours = hrs;
        minutes = mins;
        secondsTwo = seconds;

    }
}

-(void)countdown{

    
    
    secondsTwo -= 1;
    
    
    
    if ( secondsTwo < 0){
        minutes -= 1;
        secondsTwo = 59;
        
        if (minutes < 0) {
            hours -= 1;
            minutes = 59;
        }
        
    }
    
    
    
//    seconds -= 1;
//
//    
//    
//    if ( seconds < 0){
//        mins -= 1;
//        seconds = 59;
//        
//        if (mins < 0) {
//            hrs -= 1;
//            mins = 59;
//        }
//        
//    }
//    
    
    if (hours < 0){
        NSLog(@"hello");//呼び出される

        [self aaa];
        [self alert];

        
        [audio play];//これは呼び出されている
        [timer invalidate];//多分呼び出されている
        
        
        

        //buttonoff.frame = CGRectMake(160, 346, buttonoff.frame.size.width, buttonoff.frame.size.height);//よびだされない

    
        
        
//        dispatch_async(dispatch_get_main_queue(), ^{
//            buttonoff.hidden = NO;
//        });
//        buttonoff.hidden = NO;
        
        [self performSelectorOnMainThread:@selector(aaa) withObject:nil waitUntilDone:NO];
        

        NSLog(@"%f",buttonoff.alpha);//erase this later
        
        
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

        
        
        
        
        
        
        
        
        
        
        
        
        //[timer invalidate]; //it stops the timer
        //        if (AudioServicesPlaySystemSound(kSystemSoundID_Vibrate) isValid) {
        //        [ audioServicesPlaySystemSound(kSystemSoundID_Vibrate) invalidate];
        //        }
        
        
    }
    
    
    secondslabel.text = [NSString stringWithFormat:@"%d", secondsTwo];
    minuteslabel.text = [NSString stringWithFormat:@"%d", minutes];
    hourslabel.text = [NSString stringWithFormat:@"%d", hours];
    
    
}



-(IBAction)resetion{
    // I NEED TO ADD STUFF HERE REMEMBER THAT.
    hrs = 0;
    mins = 0;
    seconds =0;
    minuteslabel.text = @"0";
    secondslabel.text = @"0";
    hourslabel.text = @"0";
//    hoursTF = 0;x
//    minsTF = 0;
    [timer invalidate];
    [self v];
    startButton.frame = CGRectMake(121, 241, buttonoff.frame.size.width, buttonoff.frame.size.height);

    
    startnumber = 0;// make it 0 so that you can press start again
    stopnumber = 0; // make it 0 so that you can play the wakeup sounds again
    
    for(UILocalNotification *localNotif in [[UIApplication sharedApplication] scheduledLocalNotifications]) {
        [[UIApplication sharedApplication] cancelLocalNotification:localNotif];
    }

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

-(IBAction)off{
    
    if (stopnumber == 0) {
        stopnumber = 1;
        [audio stop];
        [self v];

//        buttonoff.hidden = YES;
//        buttonoff.center = CGPointMake(-100, -100);
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

-(IBAction)debugSeconds{
    
    secondsTwo = secondsTwo + 5;
    secondslabel.text = [NSString stringWithFormat:(@"%d"), secondsTwo];
    timer = [NSTimer scheduledTimerWithTimeInterval:1.0
                                             target:self
                                           selector:@selector(countdown)
                                           userInfo:nil
                                            repeats:YES];
}

@end
//---------------------------------------------------------------------------------------------------------------------------------
//---------------------------------------------------------------------------------------------------------------------------------
//---------------------------------------------------------------------------------------------------------------------------------
//---------------------------------------------------------------------------------------------------------------------------------
//---------------------------------------------------------------------------------------------------------------------------------
//---------------------------------------------------------------------------------------------------------------------------------
//---------------------------------------------------------------------------------------------------------------------------------
//---------------------------------------------------------------------------------------------------------------------------------
//---------------------------------------------------------------------------------------------------------------------------------
//---------------------------------------------------------------------------------------------------------------------------------
//---------------------------------------------------------------------------------------------------------------------------------
//---------------------------------------------------------------------------------------------------------------------------------
////
////  SecondViewController.m
////  alarm for golden week and etc
////
////  Created by Jamie Walker on 5/3/14.
////  Copyright (c) 2014 Jamie Walker. All rights reserved.
////
//
//#import "SecondViewController.h"
//
//@interface SecondViewController ()
//
//@end
//
//@implementation SecondViewController
//
//@synthesize minuteslabel;
//@synthesize secondslabel;
//@synthesize hourslabel;
//
//
//- (void)viewDidLoad
//{
//    [super viewDidLoad];
//    
//    NSString *path = [[NSBundle mainBundle] pathForResource:@"97744^ALARM" ofType:@"mp3"];
//    url = [NSURL fileURLWithPath:path];
//    audio = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
//    [audio prepareToPlay];
//    
//    
//	// Do any additional setup after loading the view, typically from a nib.
//    hrs = 0;
//    mins = 0;
//    seconds = 0;
//    
//    hourslabel.text=[NSString stringWithFormat:@"%d", hrs];
//    minuteslabel.text=[NSString stringWithFormat:@"%d", mins];
//    secondslabel.text=[NSString stringWithFormat:@"%d", seconds];
//    
//    startnumber = 0;
//    stopnumber = 0;
//    
//    buttonoff.hidden = YES;
//    
//    
//    
//    //    hoursTF.delegate = self;
//    //    minsTF.delegate = self;
//    
//}
//
//- (void)didReceiveMemoryWarning
//{
//    [super didReceiveMemoryWarning];
//    // Dispose of any resources that can be recreated.
//}
//
//
////-(IBAction)settings{
////
////    hrs = [hoursTF.text intValue];
////    mins = [minsTF.text intValue];
////    seconds = 0 ;
////
////
////
////    hourslabel.text = hoursTF.text;
////    minuteslabel.text = minsTF.text;
////    secondslabel.text = @"0";
////
////
////
////}
//// // unused now because its in the "start" method
//
//
//
//
//
//-(BOOL)textFieldShouldReturn:(UITextField *)textField
//{
//    //to close the keyboard thats in ur waaayyyyyyyyy ( IM NOT USING TEXT FIELDS SO......
//    [textField resignFirstResponder];
//    return YES;
//}
//
//
//
//-(IBAction)start{
//    if (startnumber == 0) {
//        stopnumber = 1;
//        timer = [NSTimer scheduledTimerWithTimeInterval:1.0
//                                                 target:self
//                                               selector:@selector(countdown)
//                                               userInfo:nil
//                                                repeats:YES];
//        
//        //バックグラウンド通知
//        //https://sites.google.com/site/propicaudio/sample-code/notification-test
//        //http://crunchtimer.jp/blog/ios/ios-localnotification.html
//        //UILocalNotificationクラスのインスタンスを作成します。
//        UILocalNotification *localNotif = [[UILocalNotification alloc] init];
//        if (localNotif == nil)
//            return;
//        
//        //通知を受け取る時刻を指定します。
//        localNotif.fireDate = [[NSDate date] dateByAddingTimeInterval:seconds + mins * 60 + hrs * 3600];
//        localNotif.timeZone = [NSTimeZone defaultTimeZone];
//        
//        //通知メッセージの本文を指定します。
//        localNotif.alertBody = [NSString stringWithFormat:@"The timer has gone off. If you do not wake up, bad things might happen to you. No seriously."];
//        
//        //通知メッセージアラートのボタンに表示される文字を指定します。
//        localNotif.alertAction = @"Open";
//        
//        //通知されたときの音を指定します。
//        localNotif.soundName = UILocalNotificationDefaultSoundName;
//        
//        
//        //通知されたときのアイコンバッジの右肩に表示する数字を指定します。
//        localNotif.applicationIconBadgeNumber = 1;
//        
//        //通知を受け取るときに送付される NSDictionary を作成します。
//        NSDictionary *infoDict = [NSDictionary dictionaryWithObject:@"It is time that you set"    forKey:@"EventKey"];
//        localNotif.userInfo = infoDict;
//        
//        //作成した通知イベント情報をアプリケーションに登録します。
//        [[UIApplication sharedApplication] scheduleLocalNotification:localNotif];
//        
//        startnumber = 1;
//        
//        hrs = [hoursTF.text intValue];
//        mins = [minsTF.text intValue];
//        seconds = 0 ;
//        
//        
//        
//        hourslabel.text = hoursTF.text;
//        minuteslabel.text = minsTF.text;
//        secondslabel.text = @"0";
//        
//        if (seconds + mins * 60 + hrs * 3600<=0) {
//            hrs = 0;
//            mins = 0;
//            seconds =0;
//            minuteslabel.text = @"0";
//            secondslabel.text = @"0";
//            hourslabel.text = @"0";
//            [timer invalidate];
//            secondslabel.text = [NSString stringWithFormat:@"%d", seconds];
//            minuteslabel.text = [NSString stringWithFormat:@"%d", mins];
//            hourslabel.text = [NSString stringWithFormat:@"%d", hrs];
//            
//            
//            
//        }
//        
//        
//        
//    }
//}
//
//-(void)countdown{
//    
//    seconds -= 1;
//    if ( seconds < 0){
//        mins -= 1;
//        seconds = 59;
//        
//        if (mins < 0) {
//            hrs -= 1;
//            mins = 59;
//        }
//        
//        
//        if (mins ==0 && seconds == 0 && hrs == 0) {
//            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"XD"
//                                                            message:@"WAKE UP!"
//                                                           delegate:nil
//                                                  cancelButtonTitle:nil
//                                                  otherButtonTitles:@"Okay, okay, IM GETTING UP NOW", nil
//                                  
//                                  ];
//            [alert show];
//            [audio play];
//            
//            //        while (stopnumber == 0) {
//            AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
//            AVCaptureSession *captureSession;
//            [captureSession startRunning];
//            NSError *error = nil;
//            AVCaptureDevice *captureDevice = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
//            [captureDevice lockForConfiguration:&error];
//            captureDevice.torchMode = AVCaptureTorchModeOn;
//            [captureDevice unlockForConfiguration];
//            buttonoff.hidden = NO;
//            
//            //        }
//            
//            mins =0;
//            seconds = 0;
//            hrs = 0;
//            
//            [timer invalidate]; //it stops the timer
//            //        if (AudioServicesPlaySystemSound(kSystemSoundID_Vibrate) isValid) {
//            //        [ audioServicesPlaySystemSound(kSystemSoundID_Vibrate) invalidate];
//            //        }
//            
//            
//        }
//    }
//    
//    
//    secondslabel.text = [NSString stringWithFormat:@"%d", seconds];
//    minuteslabel.text = [NSString stringWithFormat:@"%d", mins];
//    hourslabel.text = [NSString stringWithFormat:@"%d", hrs];
//    
//    
//    
//    
//}
//
//
//
//
//-(IBAction)resetion{
//    // I NEED TO ADD STUFF HERE REMEMBER THAT.
//    hrs = 0;
//    mins = 0;
//    seconds =0;
//    minuteslabel.text = @"0";
//    secondslabel.text = @"0";
//    hourslabel.text = @"0";
//    //    hoursTF = 0;
//    //    minsTF = 0;
//    [timer invalidate];
//    
//    startnumber = 0;// make it 0 so that you can press start again
//    stopnumber = 0; // make it 0 so that you can play the wakeup sounds again
//    
//    for(UILocalNotification *localNotif in [[UIApplication sharedApplication] scheduledLocalNotifications]) {
//        [[UIApplication sharedApplication] cancelLocalNotification:localNotif];
//    }
//    
//}
////-(IBAction)crash{
////    crashing /= 0;
////
////}
//
//
//
//- (IBAction)hourstepper:(UIStepper *)sender {
//    
//    double value = [sender value];
//    
//    [hoursTF setText:[NSString stringWithFormat:@"%d", (int)value]];
//}
//- (IBAction)minutesstepper{
//    
//    mins = minutestepper.value;
//    minsTF.text=[NSString stringWithFormat:@"%d",mins];
//    
//}
//- (IBAction)hoursstepper{
//    
//    hrs = hourstepper.value;
//    hoursTF.text=[NSString stringWithFormat:@"%d",hrs];
//    
//}
////
//-(IBAction)off{
//    
//    if (stopnumber == 1) {
//        stopnumber = 0;
//        [audio stop];
//        buttonoff.hidden = YES;
//        
//    }
//    //    NSError *offerror = nil;
//    //    AVCaptureDevice *offcaptureDevice = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
//    //
//    //    [offcaptureDevice lockForConfiguration:&offerror];
//    //    offcaptureDevice.torchMode = AVCaptureTorchModeOff;
//    //    [offcaptureDevice unlockForConfiguration];
//    //    
//    //    
//    //    [captureSession stopRunning];
//    
//}
//
//
//
////-(void)steppers{
////    hourstepper = hoursTF.text;
////    minutestepper = minsTF.text;
////}

//@end