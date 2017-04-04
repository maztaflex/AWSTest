//
//  ViewController.m
//  AWSTest
//
//  Created by DEV_TEAM1_IOS on 2017. 1. 11..
//  Copyright © 2017년 S.M Entertainment. All rights reserved.
//

#import "ViewController.h"

#import "AWSCognitoIdentityProvider.h"

#define APP_CLIENT_ID               @"1a9ch0ec0mh7s4hefsl3ptvuqv"
#define APP_CLIENT_SECRET           @"1jon9ok843ok7s5dj0e8lhg153eupticatgddfh99qpp7tsvcg12"
#define USER_POOL_ID                @"ap-northeast-2_0Gl3VR6a9"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //setup service config
    AWSServiceConfiguration *serviceConfiguration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionAPNortheast2 credentialsProvider:nil];
    
    //create a pool
    AWSCognitoIdentityUserPoolConfiguration *configuration = [[AWSCognitoIdentityUserPoolConfiguration alloc] initWithClientId:APP_CLIENT_ID
                                                                                                                  clientSecret:APP_CLIENT_SECRET
                                                                                                                        poolId:USER_POOL_ID];
    [AWSCognitoIdentityUserPool registerCognitoIdentityUserPoolWithConfiguration:serviceConfiguration userPoolConfiguration:configuration forKey:@"UserPool"];
    AWSCognitoIdentityUserPool *pool = [AWSCognitoIdentityUserPool CognitoIdentityUserPoolForKey:@"UserPool"];
    
    AWSCognitoIdentityUserAttributeType * phone = [AWSCognitoIdentityUserAttributeType new];
    phone.name = @"phone_number";
    //phone number must be prefixed by country code
    phone.value = @"+8201099928108";
    AWSCognitoIdentityUserAttributeType * email = [AWSCognitoIdentityUserAttributeType new];
    email.name = @"email";
    email.value = @"email@mydomain.com";
    
    //register the user
    [[pool signUp:@"user04" password:@"Apple1234%" userAttributes:@[email,phone] validationData:nil] continueWithBlock:^id _Nullable(AWSTask<AWSCognitoIdentityUserPoolSignUpResponse *> * _Nonnull task) {
        dispatch_async(dispatch_get_main_queue(), ^{
            if(task.error){
                [[[UIAlertView alloc] initWithTitle:task.error.userInfo[@"__type"]
                                            message:task.error.userInfo[@"message"]
                                           delegate:self
                                  cancelButtonTitle:@"Ok"
                                  otherButtonTitles:nil] show];
            }else {
                AWSCognitoIdentityUserPoolSignUpResponse * response = task.result;
                if(!response.userConfirmed){
                    //need to confirm user using user.confirmUser:
                }
            }});
        return nil;
    }];
    
}


@end
