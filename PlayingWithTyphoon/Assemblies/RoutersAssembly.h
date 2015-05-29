//
//  RoutersAssembly.h
//  PlayingWithTyphoon
//
//  Created by Julian Alonso on 27/5/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import "TyphoonAssembly.h"

@class MainRouter;
@class ShowAllNotesRouter;
@class ViewControllersAssembly;

@interface RoutersAssembly : TyphoonAssembly

@property (nonatomic, strong) ViewControllersAssembly *viewControllersAssembly;

- (MainRouter *)mainRouter;

- (ShowAllNotesRouter *)showAllNotesRouter;

@end
