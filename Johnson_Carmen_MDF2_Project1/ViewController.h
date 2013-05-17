//
//  ViewController.h
//  Johnson_Carmen_MDF2_Project1
//
//  Created by Carmen Johnson on 5/10/13.
//  Copyright (c) 2013 Carmen Johnson. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

{
    IBOutlet UICollectionView *theCollectionView;
}

//Code Below is from Project1
/*@interface ViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>


{
NSArray *twitterfeed;
    IBOutlet UITableView *twitterTableView;
}*/

@end
