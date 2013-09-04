#import <Foundation/Foundation.h>

%group AssistantBundle

%hook ACAssistantUserUtteranceController

- (BOOL)isCorrectable
{
	return YES;
}

%end

%end

%hook NSBundle

- (BOOL)loadAndReturnError:(NSError **)error
{
    BOOL result = %orig;
    static bool loaded;
    if (!loaded) {
        if ([[self bundleIdentifier] isEqualToString:@"com.apple.assistant.Assistant"]) {
            loaded = true;
            %init(AssistantBundle, ACAssistantUserUtteranceController = objc_getClass("ACAssistantUserUtteranceController"));
        }
    }
    return result;
}

%end

%ctor
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    %init;
    [pool drain];
}