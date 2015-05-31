//
//  NoteCollectionViewCellController.h
//  PlayingWithTyphoon
//
//  Created by Julian Alonso on 31/5/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import <Foundation/Foundation.h>

@class NoteCollectionViewCell;
@class Note;

@interface NoteCollectionViewCellController : NSObject

@property (nonatomic, weak) NoteCollectionViewCell *cell;
@property (nonatomic, strong) Note *note;

- (UICollectionViewCell *)configuredCell;

@end
