//
//  AppAssembly.m
//  PlayingWithTyphoon
//
//  Created by Julian Alonso on 27/5/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import "AppAssembly.h"
#import "AppDelegate.h"
#import "RoutersAssembly.h"
#import "Typhoon.h"

@implementation AppAssembly

- (id)config
{
//    TyphoonConfigPostProcessor *otherConfig = [TyphoonConfigPostProcessor forResourceNamed:@"OtherConfig.plist"];
//    [self attachPostProcessor:otherConfig];
//    
    return [TyphoonDefinition configDefinitionWithName:@"Configuration.plist"];
}

- (AppDelegate *)appDelegate
{
    return [TyphoonDefinition withClass:[AppDelegate class] configuration:^(TyphoonDefinition *definition)
    {
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
