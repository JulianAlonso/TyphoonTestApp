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

@interface ViewControllersAssembly : TyphoonAssembly

@property (nonatomic, strong) RoutersAssembly *routersAssembly;

- (ShowAllNotesViewController *)showAllNotesViewController;

@end
