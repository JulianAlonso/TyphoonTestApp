//
//  PresentersAssembly.h
//  PlayingWithTyphoon
//
//  Created by Julian Alonso on 31/5/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TyphoonAssembly.h"

@class ShowAllNotesPresenter;
@class InteractorsAssembly;
@class ViewControllersAssembly;
@class EditNotePresenter;

@interface PresentersAssembly : TyphoonAssembly

@property (nonatomic, strong, readonly) InteractorsAssembly *interactorAssembly;
@property (nonatomic, strong, readonly) ViewControllersAssembly *viewControllerAssembly;

- (ShowAllNotesPresenter *)showAllNotesPresenter;

- (EditNotePresenter *)editNotePresenter;

@end
