//
//  AppDelegate.h
//  PlayingWithTyphoon
//
//  Created by Julian Alonso on 27/5/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@class CoreDataStack;
@class MainRouter;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
//@property (nonatomic, strong) CoreDataStack *coreDataStack;
@property (nonatomic, strong) MainRouter *mainRouter;

@end

