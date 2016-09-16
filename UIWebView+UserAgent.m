// UIWebView+UserAgent
//
// Copyright (c) 2016, Gabriel Zerbib
// https://github.com/zzgab/uiwebagent
//
// License: MIT



#import "UIWebView+UserAgent.h"

@implementation  UIWebView(UIWebVieW_userAgent)

NSString * _defaultUserAgent = @"";

// The load function is called by the system very early on in the program lifecycle,
// when the system prepares the dependencies that the program needs,
// before creating the instance of the app.
// We run the following code as soon as the UIWebView class is loaded into the
// program's memory space, in hope that no one had a chance to register
// a UserAgent default setting earlier.
+ (void) load
{
    UIWebView * webViewDefaultUserAgent = [[UIWebView alloc] init];
    _defaultUserAgent = [[webViewDefaultUserAgent stringByEvaluatingJavaScriptFromString: @"navigator.userAgent"] retain];
    [webViewDefaultUserAgent release];
}

+ (NSString *) defaultUserAgent
{
    return _defaultUserAgent;
}

// Create a dummy UIWebView (with currently registered UserAgent), provoke its evaluation
// so as to capture it for later reuser. Then register the specified UserAgent,
// and create the UIWebView to be returned. Provoke right away the evaluation of its UserAgent,
// to make sure that the object will use the one specified.
// The result is autoreleased.
// Before the end, we must restore the previously captured UserAgent, so as not to leave
// any footprint in the registered user defaults.
+ (instancetype) webViewWithUserAgent: (NSString *) userAgent
{
    // Capture the currently registered user agent
    UIWebView * wv = [[UIWebView alloc] init];
    NSString * previousUserAgent = [wv stringByEvaluatingJavaScriptFromString: @"navigator.userAgent"];
    [wv release];
    
    // Register a new one
    [[NSUserDefaults standardUserDefaults] registerDefaults: @{ @"UserAgent": userAgent } ];
    
    // Create an instance of WebView
    // (in fact we use [self class] to determine the actual subclass of UIWebView we're invoking this static upon.
    // (yes, self is weird here...)
    UIWebView * wvInstance = [[[self class] alloc] init];
    
    // Force it to consider the registered user agent
    [wvInstance stringByEvaluatingJavaScriptFromString: @"navigator.userAgent"];
    [wvInstance autorelease];
    
    
    // And now, restore the previous registered user agent
    [[NSUserDefaults standardUserDefaults] registerDefaults: @{ @"UserAgent": previousUserAgent } ];
    
    return wvInstance;
    
}

@end
