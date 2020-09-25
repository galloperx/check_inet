#import "CheckInetPlugin.h"
#if __has_include(<check_inet/check_inet-Swift.h>)
#import <check_inet/check_inet-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "check_inet-Swift.h"
#endif

@implementation CheckInetPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftCheckInetPlugin registerWithRegistrar:registrar];
}
@end
