#import "AppSettingsPlugin.h"
#if __has_include(<app_settings/app_settings-Swift.h>)
#import <app_settings/app_settings-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "app_settings-Swift.h"
#endif

@implementation AppSettingsPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
    if (registrar) {
        [SwiftAppSettingsPlugin registerWithRegistrar:registrar];
    }
}
@end
