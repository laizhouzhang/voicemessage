//
//  AppDelegate.m
//  VoiceMessage
//
//  Created by Johan Karlsteen on 2011-10-28.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "AppDelegate.h"

#import "ViewController.h"

@implementation AppDelegate

@synthesize window = _window;
@synthesize viewController = _viewController;

- (void)dealloc
{
    [_window release];
    [_viewController release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    self.viewController = [[[ViewController alloc] initWithNibName:@"ViewController_iPhone" bundle:nil] autorelease];
    self.window.rootViewController = self.viewController;
    [self.window makeKeyAndVisible];
    return YES;
}

/*
 * Handles clicks on voicemessage://-links
 * if the url-host is exactly 21 characters long
 * the view will try to download that message
 */
- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url
{       
    if (!url) {
        // The URL is nil. There's nothing more to do.
        return NO;
    }
    
    NSString *voiceMessageCode = [url host];
    if (voiceMessageCode.length == kHashTagLength) {
        [[self.viewController codeTextField] setText:voiceMessageCode];
        [self.viewController downloadToVoiceMessageWithId:voiceMessageCode];
    } else {
        [[self.viewController statusLabel] setText:@"Invalid code"];
    }
    return NO;
}


- (void)applicationWillResignActive:(UIApplication *)application
{
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     */
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    /*
     Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
     */
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    /*
     Called when the application is about to terminate.
     Save data if appropriate.
     See also applicationDidEnterBackground:.
     */
}

@end
