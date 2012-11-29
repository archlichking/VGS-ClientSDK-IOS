//
//  CIUtil.m
//  QAAutoSample
//
//  Created by zhu lei on 9/14/12.
//  Copyright (c) 2012 OFQA. All rights reserved.
//

#import "CIUtil.h"
#import "TcmCommunicator.h"
#import "SBJsonParser.h"

@implementation CIUtil

+ (NSDictionary*) getRunInfoFromUrl:(NSString*) url{
    NSData* resp = [[TcmCommunicator sharedInstance] doHttpGet:url
                                                        params:nil];
    NSString *rawConfigJson = [[[NSString alloc] initWithData:resp
                                                     encoding:NSUTF8StringEncoding] autorelease];
    SBJsonParser* jsonParser = [[SBJsonParser alloc] init];
    NSDictionary* configSettings = [[jsonParser objectWithString:rawConfigJson] valueForKey:@"auto_config"];
    // suite id 178 by default
    NSString* suiteId = [configSettings valueForKey:@"suite_id"]?[configSettings valueForKey:@"suite_id"]: @"369";
    
    // run id 402 by default
    NSString* runId = [configSettings valueForKey:@"run_id"]?[configSettings valueForKey:@"run_id"]: @"606";
    
//    [rawConfigJson release];
//    [jsonParser release];
    
    return [[NSDictionary alloc] initWithObjectsAndKeys:
                                suiteId, @"suite_id",
                                runId, @"run_id",
                                nil];
}

+ (void) generateReport:(NSString*) key
                fromUrl:(NSString*) url;{
    // result need to follow specific format
    NSMutableDictionary* paramDictionary = [[NSMutableDictionary alloc] init];
    
    [paramDictionary setObject:key
                        forKey:@"key"];
    [[TcmCommunicator sharedInstance] doHttpPost:url params:paramDictionary];
    
    [paramDictionary release];
}

@end
