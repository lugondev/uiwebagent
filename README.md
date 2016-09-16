# uiwebagent
iOS Objective C UIWebView category to spoof user-defined UserAgent

## Usage
Clone the files into your project.
Import the header:

~~~~objc
#import "UIWebView+UserAgent.h"
~~~~

Then, any time you need an instance of UIWebView whose User Agent string you want to specify, invoke:

~~~~objc
UIWebView * webViewWithCustomUserAgent = [UIWebView webViewWithUserAgent: @"My Custom UserAgent String"];
~~~~

The obtained instance is _autoreleased_, so you may need to `retain` it according to your needs.

**Note**

The UserAgent string is defined once at creation time of the instance. You cannot change it on an existing instance.
If you need another UIWebView with a different UserAgent, you must obtain a new instance, using the above static method.
