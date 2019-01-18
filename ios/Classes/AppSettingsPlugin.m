#import "AppSettingsPlugin.h"
#import <app_settings/app_settings-Swift.h>

@implementation AppSettingsPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftAppSettingsPlugin registerWithRegistrar:registrar];
}
@end
