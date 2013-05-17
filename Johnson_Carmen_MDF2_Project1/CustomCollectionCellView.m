//
//  CustomCellControllerCell.m
//  Johnson_Carmen_MDF2_Project1
//
//  Created by Carmen Johnson on 5/14/13.
//  Copyright (c) 2013 Carmen Johnson. All rights reserved.
//

#import "CustomCollectionCellView.h"

@implementation CustomCollectionCellView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
}
//{
    //self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    //if (self) {
        // Initialization code
  //  }
    return self;
}

-(void)refreshCellData:(UIImage*)image titleString:(NSString*)titleString
//- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    backgroundImageView.image = image;
    title.text = titleString;
}

@end
