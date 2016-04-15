//
//  ViewController.m
//  Chartboost_MoPub
//
//  Created by Sy Dao on 11/16/15.
//  Copyright (c) 2015 Sy Dao. All rights reserved.
//

#import "ViewController.h"
#import "MPRewardedVideo.h"
#import "MPInterstitialAdController.h"
#import "MoPub.h"
#import <Chartboost/Chartboost.h>
#import <Chartboost/CBInPlay.h>
@interface ViewController () <MPRewardedVideoDelegate,ChartboostDelegate>
{
    MPInterstitialAdController *interstitial;
}
@property (weak, nonatomic) IBOutlet UILabel *lblInPlay;
@property (weak, nonatomic) IBOutlet UIImageView *imgInPlay;

@end

@implementation ViewController
-(void)viewDidLoad
{
    self.lblInPlay.text=@"";
    self.imgInPlay.image=nil;
    interstitial = [MPInterstitialAdController interstitialAdControllerForAdUnitId:@"8d1d0b3feacf4a9aaaf0231fbfb73331"];
   
}
- (IBAction)cacheInterstitial {
    
     [interstitial loadAd];
    
}

- (IBAction)showInterstitial{
    
    [interstitial showFromViewController:self];
}
- (IBAction)cacheRewardedVideo {
    
    [[MoPub sharedInstance] initializeRewardedVideoWithGlobalMediationSettings:nil delegate:self ];
    [MPRewardedVideo loadRewardedVideoAdWithAdUnitID:@"f770f51487684b988524af29e2c79e27" withMediationSettings:nil];
}

- (IBAction)showRewardedVideo {
    
  [MPRewardedVideo presentRewardedVideoAdForAdUnitID:@"f770f51487684b988524af29e2c79e27" fromViewController:self];
    
}

//Delegate Methods for ViewController.  There is another instance of this in appDelegate.m

 
 - (void)rewardedVideoAdDidLoadForAdUnitID:(NSString *)adUnitID {
 NSLog(@"Did Load for AdUnitID");
 }
 - (void)rewardedVideoAdDidFailToPlayForAdUnitID:(NSString *)adUnitID error:(NSError *)error {
 NSLog(@"Did Fail To Play for AdUnitID");
 }
 - (void)rewardedVideoAdWillAppearForAdUnitID:(NSString *)adUnitID {
 NSLog(@"Ad Will Appear for AdUnitID");
 }
 - (void)rewardedVideoAdDidAppearForAdUnitID:(NSString *)adUnitID {
 NSLog(@"Ad Did Appear for AdUnitID");
 }
 - (void)rewardedVideoAdWillDisappearForAdUnitID:(NSString *)adUnitID {
 NSLog(@"Ad Will Disappear for AdUnitID");
 }
 - (void)rewardedVideoAdDidDisappearForAdUnitID:(NSString *)adUnitID {
 NSLog(@"Ad Did Disappear for AdUnitID");
 }
 - (void)rewardedVideoAdDidExpireForAdUnitID:(NSString *)adUnitID {
 NSLog(@"Ad Did Expire for AdUnitID");
 }
 - (void)rewardedVideoAdDidReceiveTapEventForAdUnitID:(NSString *)adUnitID {
 NSLog(@"Ad Did Receive Tap Event for AdUnitID");
 }
 - (void)rewardedVideoAdShouldRewardForAdUnitID:(NSString *)adUnitID reward:(MPRewardedVideoReward *)reward {
 NSLog(@"Ad Should Rewarded for AdUnitID");
 }
 - (void)rewardedVideoAdWillLeaveApplicationForAdUnitID:(NSString *)adUnitID {
 NSLog(@"Ad Will Leave App for AdUnitID");
 }
 

@end
