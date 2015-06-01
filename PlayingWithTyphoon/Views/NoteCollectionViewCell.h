//
//  NoteCollectionViewCell.h
//  PlayingWithTyphoon
//
//  Created by Julian Alonso on 31/5/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol NoteCollectionViewCellDelegate <NSObject>

- (void)didTapAtCell:(UICollectionViewCell *)collectionViewCell;

@end

@interface NoteCollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UILabel *noteTextLabel;
@property (nonatomic, weak) id<NoteCollectionViewCellDelegate> delegate;

@end
