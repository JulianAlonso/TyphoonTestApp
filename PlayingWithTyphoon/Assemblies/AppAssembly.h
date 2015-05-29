//
//  AppAssembly.h
//  PlayingWithTyphoon
//
//  Created by Julian Alonso on 27/5/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import "TyphoonAssembly.h"

@class AppDelegate;
@class RoutersAssembly;
@class CoreDataAssembly;

@interface AppAssembly : TyphoonAssembly

@property (nonatomic, strong, readonly) CoreDataAssembly *coreDataAssembly;
@property (nonatomic, strong, readonly) RoutersAssembly *routerAssembly;

- (AppDelegate *)appDelegate;

- (UIWindow *)mainWindow;

@end
