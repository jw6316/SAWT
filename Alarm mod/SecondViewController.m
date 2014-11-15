//
//  SecondViewController.m
//  alarm for golden week and etc
//
//  Created by Jamie Walker on 5/3/14.
//  Copyright (c) 2014 Jamie Walker. All rights reserved.
//



//ஜஜஜஜஜஜஜஜஜஜஜஜஜஜஜஜஜஜஜஜஜஜஜஜஜஜஜஜஜஜஜஜஜஜஜஜஜஜT O  D O  L I S Tஜஜஜஜஜஜஜஜஜஜஜஜஜஜஜஜஜஜஜஜஜஜஜஜஜஜஜஜஜஜஜஜஜஜஜஜஜஜ
//-----------------------------------------------------------------------------------------------------------------
//-----------------------------------------------BE ABLE TO PLAY MUSC----------------------------------------------
//-----------------------------------------------------JIKKI-------------------------------------------------------
//-----------------------------------------------------------------------------------------------------------------
//ஜஜஜஜஜஜஜஜஜஜஜஜஜஜஜஜஜஜஜஜஜஜஜஜஜஜஜஜஜஜஜஜஜஜஜஜஜஜT O  D O  L I S Tஜஜஜஜஜஜஜஜஜஜஜஜஜஜஜஜஜஜஜஜஜஜஜஜஜஜஜஜஜஜஜஜஜஜஜஜஜஜ



















#import "SecondViewController.h"

@interface SecondViewController ()<UIAlertViewDelegate>
@property(weak, nonatomic)IBOutlet UIButton *btn;
@end

@implementation SecondViewController

@synthesize minuteslabel;
@synthesize secondslabel;
@synthesize hourslabel;



- (void)viewDidLoad
{
    a = 1;
    b = 140;
    c = 20;
    d = 1;
    e = 1;
    f = 1;
    g = 1;
    
    [super viewDidLoad];
    
    //===========
    isStarted = NO;
    //===========

    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"97744^ALARM" ofType:@"mp3"];
    url = [NSURL fileURLWithPath:path];
    audio = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
    
    [audio prepareToPlay];
    
//    alert = [[UIAlertView alloc] initWithTitle:@"XD"
//                                       message:@"WAKE UP!"
//                                      delegate:self
//                             cancelButtonTitle:@"Just a little more......."
//                             otherButtonTitles:@"Okay, okay, IM GETTING UP NOW",nil];
//
    
    
    
	// Do any additional setup after loading the view, typically from a nib.
    hrs = 0;
    mins = 0;
    seconds = 0;

    
    
    
    
    startnumber = 0;
    stopnumber = 0;

//    hoursTF.delegate = self;
//    minsTF.delegate = self;
    
    // デフォルトの通知センターを取得する
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    
    // 通知センターに通知要求を登録する
    // この例だと、通知センターに"Tszuchi"という名前の通知がされた時に、
    // hogeメソッドを呼び出すという通知要求の登録を行っている。
    [nc addObserver:self selector:@selector(hideButtonOff) name:@"Tsuchi" object:nil];
    
    

    
    hazukashiArray [0] = @"I weigh %d00 kg.";
    hazukashiArray [1] = @"Im only %dcm tall";
    hazukashiArray [2] = @"My foot length is %dcm";
    hazukashiArray [3] = @"I already changed my diapers %d times today!";
    hazukashiArray [4] = @"I listened to %d different Justin Bieber albums this week already!! <3 <3 <3 <3 <3 <3 <3 <3 ";
    hazukashiArray [5] = @"I slipped an hit my bum %d times today.. :( I think I gotta have my mommy check it for me again....";
    hazukashiArray [6] = @"I'called my mommy %d times today to record the spongebob episode, but she STILL hasnt recorded it!!!!!!!! COME ON!!!!!!";
    hazukashiArray [7] = @"hhhh 2%d";
    hazukashiArray [8] = @"iiii %d";
    hazukashiArray [9] = @"jjjj %d";
    //    i = 1;
    
    afterTimerSeconds = 121;
    
    
    
}

-(void)stopTimerTwitter{
    
    if ( timer2 || [timer2 isValid])
    {
        [timer2 invalidate];
        timer2 = nil;
        afterTimerSeconds = 121;
        
        
    }
    
}

- (IBAction)btn:(id)sender{
    [self whenZero];

    
}


- (void)hideButtonOff
{
    buttonoff.frame = CGRectMake(-100, -100, buttonoff.frame.size.width, buttonoff.frame.size.height);
//    [self.view setNeedsDisplay];
}

- (void)viewDidAppear:(BOOL)animated
{
    [self hideButtonOff];
    

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


-(void)startTimer{
    if (timer == nil){
        
        timer = [NSTimer scheduledTimerWithTimeInterval:0.05    // used for debug, fix to 1 time per sec later.
                                                 target:self
                                               selector:@selector(countdown)
                                               userInfo:nil
                                                repeats:YES];
    }
}

- (void) stopTimer {
    if ( timer || [timer isValid])
    {
        [timer invalidate];
        timer = nil;
        
        
    
    }
    
    buttonoff.frame = CGRectMake(77, 253, buttonoff.frame.size.width, buttonoff.frame.size.height);
    [audio play];

}




-(IBAction)start{
    
    

    
    if (startnumber == 0) {
        
        startButton.frame = CGRectMake(-100, -100, buttonoff.frame.size.width, buttonoff.frame.size.height);

        [self startTimer];
        

        
//        timer = [NSTimer scheduledTimerWithTimeInterval:1.0
//                                                 target:self
//                                               selector:@selector(countdown)
//                                               userInfo:nil
//                                                repeats:YES];

        
//        venzeerotimer = [NSTimer scheduledTimerWithTimeInterval:0.05    // used for debug, fix to 1 time per sec later.
//                                                 target:self
//                                               selector:@selector(venzeero)
//                                               userInfo:nil
//                                                repeats:YES];
        

        
        
        
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

//
//-(void)venzeero{
//    if (hours < 0){
//        [self whenZero];
//    }
//}
//






- (IBAction)twitterino{//change to void later
    //kk
    
    //    hazukashiArray [a] = @"I weigh %d00 kg.";
    //    hazukashiArray [b] = @"Im only %dcm tall";
    //    hazukashiArray [c] = @"My foot length is %dcm";
    //    hazukashiArray [d] = @"I already changed my diapers %d times today!";
    //    hazukashiArray [e] = @"I listened to %d different Justin Bieber albums this week already!! <3 <3 <3 <3 <3 <3 <3 <3 ";
    //    hazukashiArray [f] = @"I slipped an hit my bum %d times today.. :( I think I gotta have my mommy check it for me again....";
    //    hazukashiArray [g] = @"I'called my mommy %d times today to record the spongebob episode, but she STILL hasnt recorded it!!!!!!!! COME ONh!!!!!";
    //    hazukashiArray [h] = @"hhhh 2%d";
    //    hazukashiArray [i] = @"iiii %d";
    //    hazukashiArray [j] = @"jjjj %d";
    
//    a = 1;
//    b = 140;
//    c = 20;
//    d = 2;
//    e = 1;
//    f = 3;
//    g = 1;
//    h =
//    i =
//    j =
    
    
    
    int random_number = arc4random() %10;
    
    NSLog(@"random_number == %d", random_number);
    
    if (random_number == 0){
        a++;
        z = a;
    }else if (random_number == 1){
        b = b-arc4random() %20;
        z = b;
    }else if (random_number == 2){
        c--;
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
    
    afterTimerSeconds = 121;
}


-(void)allSecondsCountdown{
    afterTimerSeconds -= 1;
    if (afterTimerSeconds ==1) {
        [self twitterino];
        [timer2 invalidate];
        timer2 = nil;
        afterTimerSeconds = 121;
    }
}


-(void)afterTimerTimerMethod{

    if (timer2==nil){
    
timer2 = [NSTimer scheduledTimerWithTimeInterval:0.1    // used for debug, fix to 1 time per sec later.
                                          target:self
                                        selector:@selector(allSecondsCountdown)
                                        userInfo:nil
                                         repeats:YES];
    }
}
-(void)countdown{
    
    secondsTwo -= 1;

    if ( secondsTwo < 0){
        minutes -= 1;
        secondsTwo = 59;
        
    }if (minutes < 0) {
            hours -= 1;
            minutes = 59;
        }
        
        
    
    

    
    if (hours == 0 && minutes == 0 && secondsTwo == 1){
        
        
        [self afterTimerTimerMethod];
        

        
        
        
//        [self twitterino];
        
//        [self whenZero];
        NSLog(@"hello is this working");
        

        
//        [audio play];//これは呼び出されている
//        [timer invalidate];//多分呼び出されている
        [self stopTimer];


//        dispatch_async(dispatch_get_main_queue(), ^{
//            buttonoff.hidden = NO;
//        });
//        buttonoff.hidden = NO;
        hours = 0;
        minutes = 0;
        secondsTwo =0;
        minuteslabel.text = @"0";
        secondslabel.text = @"0";
        hourslabel.text = @"0";
        
        [self performSelectorOnMainThread:@selector(whenZero) withObject:nil waitUntilDone:NO];

//        while (stopnumber == 0) {
//            AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
//            AVCaptureSession *captureSession;
//            [captureSession startRunning];
//            NSError *error = nil;
//            AVCaptureDevice *captureDevice = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
//            [captureDevice lockForConfiguration:&error];
//            captureDevice.torchMode = AVCaptureTorchModeOn;
//            [captureDevice unlockForConfiguration];
//        }
        
        //[timer invalidate]; //it stops the timer
        //        if (AudioServicesPlaySystemSound(kSystemSoundID_Vibrate) isValid) {
        //        [ audioServicesPlaySystemSound(kSystemSoundID_Vibrate) invalidate];
        //        }
        
        
    }
    secondslabel.text = [NSString stringWithFormat:@"%d", secondsTwo];
    minuteslabel.text = [NSString stringWithFormat:@"%d", minutes];
    hourslabel.text = [NSString stringWithFormat:@"%d", hours];
}


-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSLog(@"alert-button");
    switch (buttonIndex) {
        case 0:
            [self stopTimerTwitter];
            break;
            
        default:
            
            break;
    }
}



- (void)whenZero //combined the alert with the showOffButton
{
    alert = nil;
    
    
    alert = [[UIAlertView alloc]
                          initWithTitle:@"Dis Title Doe"
                          message:@"WAKE UP SLEEPYHEAD"
                          delegate:self
                          cancelButtonTitle:@"Getting up now! "
                          otherButtonTitles:@"Lemme sleep.....", nil];
    
//    [alert performSelectorOnMainThread:@selector(show)
//                            withObject:nil
//                         waitUntilDone:NO];
    
    [alert show];
    
    // アラートビューを表示
    NSLog(@"im totally awesomely working");
    buttonoff.frame = CGRectMake(77, 253, buttonoff.frame.size.width, buttonoff.frame.size.height);

    
    
}



-(IBAction)resetion{
    // I NEED TO ADD STUFF HERE REMEMBER THAT.
    hours = 0;
    minutes = 0;
    secondsTwo =0;
    minuteslabel.text = @"0";
    secondslabel.text = @"0";
    hourslabel.text = @"0";
//    hoursTF = 0;x
//    minsTF = 0;
    if ( timer || [timer isValid])
    {
        [timer invalidate];
        [timer2 invalidate];
        timer = nil;
        
        
    }
    
    buttonoff.frame = CGRectMake(77, 253, buttonoff.frame.size.width, buttonoff.frame.size.height);    [self hideButtonOff];
    startButton.frame = CGRectMake(77, 253, buttonoff.frame.size.width, buttonoff.frame.size.height);
    startnumber = 0;// make it 0 so that you can press start again
    stopnumber = 0; // make it 0 so that you can play the wakeup sounds again

    minsTF.text=[NSString stringWithFormat:@"%d",mins];
    hoursTF.text=[NSString stringWithFormat:@"%d",hrs];
    
    for(UILocalNotification *localNotif in [[UIApplication sharedApplication] scheduledLocalNotifications]) {
        [[UIApplication sharedApplication] cancelLocalNotification:localNotif];
    }

}

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
        [self hideButtonOff];
        startButton.frame = CGRectMake(77, 253, buttonoff.frame.size.width, buttonoff.frame.size.height);
        

        
        

//        buttonoff.hidden = YES;
//        buttonoff.center = CGPointMake(-100, -100);
    }
    [self resetion];

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




@end