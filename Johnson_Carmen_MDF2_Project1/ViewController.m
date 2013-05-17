//
//  ViewController.m
//  Johnson_Carmen_MDF2_Project1
//
//  Created by Carmen Johnson on 5/10/13.
//  Copyright (c) 2013 Carmen Johnson. All rights reserved.
//

#import "ViewController.h"
#import <Accounts/Accounts.h>
#import <Social/Social.h>
#import <Twitter/Twitter.h>
#import "CustomCollectionCellView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    ACAccountStore *accountStore = [[ACAccountStore alloc] init];
    if (accountStore !=nil)
    {
        //Connecting to Twitter
        ACAccountType *accountType = [accountStore accountTypeWithAccountTypeIdentifier:
            ACAccountTypeIdentifierTwitter];
        if (accountType !=nil)
        {
            //Requesting permission to access twitter account
            [accountStore requestAccessToAccountsWithType:accountType withCompletionHandler:^(BOOL granted, NSError *error)
             {
             if (granted)
                {
                    //Array holding accounts on the device
                    NSArray *twitterAccounts = [accountStore accountsWithAccountType:accountType];
                    if (twitterAccounts != nil)
                    {
                        //Accessing a single account on the twitter account
                        ACAccount *currentAccount = [twitterAccounts objectAtIndex:0];
                        if (currentAccount != nil)
                        {
                            //Accessing twitter account
                             NSString *friendListString = @"https://api.twitter.com/1.1/friends/list.json?cursor=-1&skip_status=true&include_user_entities=false";
                            
                             SLRequest *request = [SLRequest requestForServiceType:SLServiceTypeTwitter requestMethod:SLRequestMethodGET URL:[NSURL URLWithString:userFriends] parameters:nil];
                            if (request !=nil)
                            {
                                //1.1 api requires a user to be loggied in
                                [request setAccount:currentAccount];
                                
                                [request performRequestWithHandler:^(NSData *responseData, NSHTTPURLResponse *urlResponse, NSError *error)
                                 {
                                
                                    NSInteger responseCode = [urlResponse statusCode];
                                    if (responseCode == 200)
                                    {
                                       
                                       {
                                           
                                            
                                            friends =[NSJSONSerialization JSONObjectWithData:responseData
                                                                            options:0 error:nil];
                                                                            if (friends !=nil)
                                                                                                     [theCollectionView reloadData];
                                              
                                                      }
                                                
                                                      
                                                    }
                                                      
                                            }];
                                           
                                        }
                                        
                                 
                                             
                                 }
                                 else
                                 {
                {
                    NSLog(@"User did not grant access");
                    
                }
                        
                    }];
             }
          
        }
        [super viewDidLoad];
                    
    
                 
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
                 
    {
        
        return 20;
        
    }
                 
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
                 
    {
        
        CustomCollectionCellView *cell = [theCollectionView dequeueReusableCellWithReuseIdentifier:@"customCell" forIndexPath:indexPath];
        
        if (cell !=nil)
            
    {
        //Access to users
        theUsers = [friends objectForKey:@"users"];
        
        //Create an array for the usernames
        userNames = [theUsers valueForKey:@"screen_name"];
        
        //Array for user image
        thePics = [theUsers valueForKey:@"profile_image_url"];
        
        //Get image from URL
        picurl =[NSURL URLWithString:[NSString stringWithFormat:@"%@", [thePics objectAtIndex:indexPath.row]]];
        
        // Add url image to array
        picdata = [NSData dataWithContentOfURL:picurl];
        
        if (userNames !=nil)
    {
        //Twitter friends displayed
        cell.title.text = [userNames objectAtIndex:indexPath];
        cell.backgroundImageView.image = [UIImage imageWithData:picdata];
        
    }
        
    }
        return cell;
        
    }
             
-(void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath
             
 {
     DetailViewController *detailView =[[DetailViewCotroller alloc] init];
     [self presentedViewController:detailView animated:true completion:nil];
     
     detailView.detailPic.image =[UIImage imageWithdate:picdate];
     detailView.datailName.text =[userNames objectAtIndex:indexPath.row];
     

        
 }
  
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
   {
    return 1;
        //Do any additional setup after loading the view, typically from a nib.
        
    }
      -(void)didReceiveMemoryWarning       
            {
{
    [super didReceiveMemoryWarning];
    
        [super viewDidUnload];

                    

                                       

      interfaceOrientation
                                       

    

    
}
                    
             
@end