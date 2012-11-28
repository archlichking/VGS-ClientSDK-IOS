//
//  TestCaseWrapper.m
//  OFQAAPI
//
//  Created by lei zhu on 3/6/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "TestCaseWrapper.h"
#import "TestCase.h"
#import "Constant.h"

@implementation TestCaseWrapper

@synthesize isSelected;
@synthesize result;
@synthesize cId;
@synthesize tc;

- (id)initWithTestCase:(TestCase*) testCase{
    [self setCId:[[testCase caseId] intValue]];
    [self setIsSelected:false];
    [self setResult:[Constant getReadableResult:CaseResultUntested]];
    [self setTc:testCase];
    return self;
}

- (id)initWithTestCase:(TestCase*) testCase 
              selected:(BOOL) select 
                result:(int) r{
    [self setCId:[[testCase caseId] intValue]];
    [self setIsSelected:select];
    [self setResult:[Constant getReadableResult:r]];
    [self setTc:testCase];
    return self;
}

- (void)dealloc{
    [tc release];
    [result release];
    [super dealloc];
}

+ (int) All{
    return 1;
}

+ (int) Failed{
    return 2;
}

+ (int) UnAll{
    return 10;
}

@end
