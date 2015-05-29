//
//  MainRouter.h
//  PlayingWithTyphoon
//
//  Created by Julian Alonso on 27/5/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import <Foundation/Foundation.h>

@class RoutersAssembly;

@interface MainRouter : NSObject

@property (nonatomic, strong) RoutersAssembly *routersAssembly;

- (void)presentRootViewControllerAtWindow:(UIWindow *)window;

@end
