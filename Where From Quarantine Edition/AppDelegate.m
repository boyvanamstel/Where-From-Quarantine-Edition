//
//  AppDelegate.m
//  Where From Quarantine Edition
//
//  Created by Boy van Amstel on 03/05/16.
//  Copyright © 2016 Danger Cove. All rights reserved.
//

#import "AppDelegate.h"

#import <sqlite3.h>

@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
  // Insert code here to initialize your application
  
  NSString *sqlitePath = [@"~/Library/Preferences/com.apple.LaunchServices.QuarantineEventsV2" stringByExpandingTildeInPath];
  
  sqlite3 *db;
  if(sqlite3_open(sqlitePath.UTF8String, &(db)) != SQLITE_OK) {
    sqlite3_close(db);
  }
  
  NSString *query = @"SELECT LSQuarantineDataURLString,LSQuarantineOriginURLString FROM LSQuarantineEvent";
//  NSString *query = @"SELECT LSQuarantineDataURLString,LSQuarantineOriginURLString FROM LSQuarantineEvent WHERE LSQuarantineDataURLString LIKE '%%Chrome%%'";
  sqlite3_stmt * statement;
  
  if(sqlite3_prepare_v2(db, query.UTF8String, -1, &statement, nil) == SQLITE_OK) {
    while(sqlite3_step(statement) == SQLITE_ROW) {
      char *field1 = (char *) sqlite3_column_text(statement, 0);
      if (field1 == NULL) {
        continue;
      }
      NSString *dataURLStr = [[NSString alloc] initWithUTF8String:field1];
      char *field2 = (char *) sqlite3_column_text(statement, 1);
      NSString *originURLStr;
      if (field2 != NULL) {
         originURLStr = [[NSString alloc] initWithUTF8String:field2];
      }
      NSLog(@"\nData: %@\nOrigin: %@\n", dataURLStr, originURLStr);
    }
  }
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
  // Insert code here to tear down your application
}

@end
