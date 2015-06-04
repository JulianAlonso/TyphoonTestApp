//
//  CustomFlowLayout.m
//  PlayingWithTyphoon
//
//  Created by Julian Alonso on 5/6/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import "CustomFlowLayout.h"

@implementation CustomFlowLayout

- (UICollectionViewLayoutAttributes *)finalLayoutAttributesForDisappearingItemAtIndexPath:(NSIndexPath *)itemIndexPath
{
    UICollectionViewLayoutAttributes *attributes = [super finalLayoutAttributesForDisappearingItemAtIndexPath:itemIndexPath];
    
    attributes.transform = CGAffineTransformMakeScale(0.0f, 0.0f);
    attributes.alpha = 0.2f;
    
    return attributes;
}

@end
