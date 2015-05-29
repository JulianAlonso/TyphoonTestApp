//
//  AppAssembly.m
//  PlayingWithTyphoon
//
//  Created by Julian Alonso on 27/5/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import "AppAssembly.h"
#import "AppDelegate.h"
#import "CoreDataAssembly.h"
#import "RoutersAssembly.h"

@implementation AppAssembly

- (AppDelegate *)appDelegate
{
    return [TyphoonDefinition withClass:[AppDelegate class] configuration:^(TyphoonDefinition *definition)
    {
//        [definition injectProperty:@selector(coreDataStack) with:[_coreDataAssembly coreDataStack]];
        [definition injectProperty:@selector(window) with:[self mainWindow]];
        [definition injectProperty:@selector(mainRouter) with:[_routerAssembly mainRouter]];
    }];
}

- (UIWindow *)mainWindow
{
	return [TyphoonDefinition withClass:[UIWindow class] configuration:^(TyphoonDefinition *definition)
    {
        [definition useInitializer:@selector(initWithFrame:) parameters:^(TyphoonMethod *initializer)
        {
            [initializer injectParameterWith:[NSValue valueWithCGRect:[UIScreen mainScreen].bounds]];
        }];
    }];
}

@end
