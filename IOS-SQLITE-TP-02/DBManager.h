//
//  DBManager.h
//  IOS-SQLITE-TP-02
//
//  Created by local192 on 17/01/2018.
//  Copyright © 2018 local192. All rights reserved.
//

#import <sqlite3.h>
#import <Foundation/Foundation.h>

@interface DBManager : NSObject

// properties
@property (strong, nonatomic) NSString *databasePath;
@property (strong, nonatomic) NSString *databaseName;
@property (nonatomic) sqlite3 *contactDB;

@property (nonatomic, strong) NSMutableArray *arrResults;
@property (nonatomic, strong) NSMutableArray *arrColumnNames;
@property (nonatomic) int affectedRows;
@property (nonatomic) long long lastInsertedRowID;


// inits
- (instancetype) initWithDatabaseFilename:(NSString *) dbFilename;

// methods
- (void) copyDatabaseIntoDocumentDirectory;
- (void) runQuery:(const char *) query isQueryExecutable: (BOOL) queryExecutable;
- (NSArray *) loadDataFromDB: (NSString *) query;
- (void) executeQuery: (NSString *) query;

@end
