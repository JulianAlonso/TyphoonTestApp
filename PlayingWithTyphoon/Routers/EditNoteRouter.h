//
//  EditNoteRouter.h
//  PlayingWithTyphoon
//
//  Created by Julian Alonso on 31/5/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import <Foundation/Foundation.h>

@class EditNoteViewController;
@class Note;

@interface EditNoteRouter : NSObject

@property (nonatomic, weak) EditNoteViewController *editNoteViewController;

- (void)pushFromNavigationController:(UINavigationController *)navigationController withNote:(Note *)note;

@end
