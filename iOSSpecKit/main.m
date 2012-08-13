//
//  main.m
//  iOSSpecKit
//
//  Created by Eric Meyer on 8/13/12.
//
//

#import <UIKit/UIKit.h>

#import <SpecKit/SpecKit.h>

@interface SpecKitEntryPoint : NSObject
@end

@implementation SpecKitEntryPoint

- (void) applicationDidFinishLaunching:(UIApplication*)app {
  exit(SpecKitRunAllTests());
}

@end
int main(int argc, char *argv[])
{
    @autoreleasepool {
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([SpecKitEntryPoint self]));
    }
}
