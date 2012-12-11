//
//  VGAssetStepDefinition.m
//  VGSAutoSample
//
//  Created by zhu lei on 12/11/12.
//  Copyright (c) 2012 OFQA. All rights reserved.
//

#import "VGAssetStepDefinition.h"

#import "GreeVirtualGoods.h"
#import "GreeVGAsset.h"

#import "QAAssert.h"

@implementation VGAssetStepDefinition

-(void) developer_uses_SDK_to_load_vgs_asset_with_filename_PARAM:(NSString*) fn{
    [[GreeVirtualGoods sharedInstance] observeFilenames:[NSArray arrayWithObject:fn]
                                                  block:^(NSError * error) {
                                                      if (!error) {
                                                          NSError* err;
                                                          [[GreeVirtualGoods sharedInstance] dataPathForFilename:fn
                                                                                                           error:&err];
                                                          if (!err) {
                                                              
                                                          }
                                                      }
                                                      [self inStepNotify];
    }];
    [self inStepWait];
//    [[GreeVirtualGoods sharedInstance] loadFilename:fn];
//    float prog = [[GreeVirtualGoods sharedInstance] downloadProgressForFilename:fn];
//    NSLog(@"%f", prog);
//    NSError* err;
//    NSString* path = [[GreeVirtualGoods sharedInstance] dataPathForFilename:fn error:&err];
//    NSLog(@"%@", path);
}

@end
