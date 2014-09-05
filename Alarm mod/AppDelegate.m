//
//  AppDelegate.m
//  Alarm mod
//
//  Created by Jamie Walker on 5/5/14.
//  Copyright (c) 2014 Jamie Walker. All rights reserved.
//

#import "AppDelegate.h"
#import "SecondViewController.h"

@implementation AppDelegate{
    
    SecondViewController *secondViewController;
    
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    backgroundTime = [NSDate date]; //this is an "object" in the int and float category
    allSeconds = secondsTwo + minutes * 60 + hours * 3600;
    NSUserDefaults *timeLapsed = [NSUserDefaults standardUserDefaults];
    [timeLapsed setObject:backgroundTime forKey:@"time"];
    [timeLapsed setInteger:allSeconds forKey:@"allTime"];
    
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    
    NSUserDefaults *timeLapsed = [NSUserDefaults standardUserDefaults];
    backgroundTime = [timeLapsed objectForKey:@"time"];
    foregroundTIme = [NSDate date];
    difference = [foregroundTIme timeIntervalSinceDate:backgroundTime];
    allSeconds = [timeLapsed integerForKey:@"allTime"];
    
    UIStoryboard *storyboardOfAwesomeness;
    secondViewController = [storyboardOfAwesomeness instantiateViewControllerWithIdentifier:@"2VC"];
    
    if (allSeconds <= difference) {
        minutes = 0;
        secondsTwo = 0;
        hours = 0;
        secondViewController.minuteslabel.text = [NSString stringWithFormat:@"%d",minutes];
        secondViewController.hourslabel.text = [NSString stringWithFormat:@"%d",hours];
        secondViewController.secondslabel.text = [NSString stringWithFormat:@"%d",secondsTwo];
        
    }else{
        
        secondsTwo = (allSeconds - (int)difference) % 60;
        minutes = (allSeconds - (int)difference) / 60 % 60;
        hours = (allSeconds - (int)difference) / 60 / 60;
        
        
        secondViewController.minuteslabel.text = [NSString stringWithFormat:@"%d",minutes];
        secondViewController.hourslabel.text = [NSString stringWithFormat:@"%d",hours];
        secondViewController.secondslabel.text = [NSString stringWithFormat:@"%d",secondsTwo];
        
    }
    [UIApplication sharedApplication].applicationIconBadgeNumber = -1;
    
//    [secondViewController v];
    // 通知を作成する
    NSNotification *n = [NSNotification notificationWithName:@"Tuchi" object:self];
    
    // 通知実行！
    [[NSNotificationCenter defaultCenter] postNotification:n];
    

//    if (allSeconds != 0 ){
//        
//        buttonoff.frame = CGRectMake(-100, -100, buttonoff.frame.size.width, buttonoff.frame.size.height);
//        
//    }
//    
    
    
    
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}





@end