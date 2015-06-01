//
//  ViewControllersAssembly.h
//  PlayingWithTyphoon
//
//  Created by Julian Alonso on 29/5/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import "TyphoonAssembly.h"

@class ShowAllNotesViewController;
@class RoutersAssembly;
@class PresentersAssembly;
@class EditNoteViewController;

@interface ViewControllersAssembly : TyphoonAssembly

@property (nonatomic, strong, readonly) RoutersAssembly *routersAssembly;
@property (nonatomic, strong, readonly) PresentersAssembly *presentersAssembly;

- (ShowAllNotesViewController *)showAllNotesViewController;

- (EditNoteViewController *)editNoteViewController;

@end
