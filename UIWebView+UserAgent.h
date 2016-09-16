// UIWebView+UserAgent
//
// Copyright (c) 2016, Gabriel Zerbib
// https://github.com/zzgab/uiwebagent
//
// License: MIT

#import <Foundation/Foundation.h>

@interface UIWebView(UIWebVieW_userAgent)

// Utility method to know at any time what the real factory setting is
// for UIWebView UserAgent on the running platform.
+ (NSString *) defaultUserAgent;

// Use this method to obtain an autoreleased UIWebView with specified UserAgent.
// The instancetype return type makes it possible to actually invoke this static
// on any derived class of UIWebView. The autoreleased created instance will be of
// the real late static binding type.
+ (instancetype) webViewWithUserAgent: (NSString *) userAgent;

@end
