//
//  AppDelegate.m
//  Menubar popup browser
//
//  Created by Luke Hefson on 25/02/2015.
//  Copyright (c) 2015 Luke Hefson. All rights reserved.
//

#import "AppDelegate.h"
#import <WebKit/WebKit.h>

@interface AppDelegate ()
@property (strong) NSStatusItem *statusItem;
@property (strong) IBOutlet NSPopover *popover;
@property (strong) IBOutlet WebView *webview;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    self.statusItem = [[NSStatusBar systemStatusBar] statusItemWithLength:NSSquareStatusItemLength];
    self.statusItem.target = self;
    self.statusItem.action = @selector(showPopover:);
    self.statusItem.image = [NSImage imageNamed:NSImageNameQuickLookTemplate];
    
    self.webview.customUserAgent = @"Mozilla/5.0(iPhone;U;CPUiPhoneOS4_0likeMacOSX;en-us)AppleWebKit/532.9(KHTML,likeGecko)Version/4.0.5Mobile/8A293Safari/6531.22.7";
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

- (void)applicationDidResignActive:(NSNotification *)notification {
    [self.popover close];
}


- (void)showPopover:(id)reciever {
    if (self.popover.shown) {
        [self.popover close];
        return;
    }
    [self.popover showRelativeToRect:self.statusItem.button.bounds ofView:self.statusItem.button preferredEdge:NSMinYEdge];
    [self.webview.mainFrame loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://instagram.com"]]];
}

@end
