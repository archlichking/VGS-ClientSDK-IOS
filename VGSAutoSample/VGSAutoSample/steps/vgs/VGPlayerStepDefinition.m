//
//  VGPlayerStepDefinition.m
//  VGSAutoSample
//
//  Created by zhu lei on 12/5/12.
//  Copyright (c) 2012 OFQA. All rights reserved.
//

#import "VGPlayerStepDefinition.h"

#import "GreeVirtualGoods.h"
#import "GreeVirtualGoods+ReadPlayer.h"
#import "GreeVGPlayer.h"

#import "QAAssert.h"

@implementation VGPlayerStepDefinition

-(void) developer_uses_SDK_to_load_vgs_player_with_id_PARAM:(NSString*) pid{
    [[self getBlockRepo] removeObjectForKey:@"vgplayer"];
    [[GreeVirtualGoods sharedInstance] loadPlayerWithId:pid
                                                  block:^(GreeVGPlayer * player, NSError *error) {
                                                      if (!error) {
                                                          [[self getBlockRepo] setObject:player forKey:@"vgplayer"];
                                                      }
                                                      [self inStepNotify];
    }];
    [self inStepWait];
    
}


-(void) amount_of_currency_with_identifier_PARAM:(NSString*) idn
               _of_vgs_player_should_be_PARAMINT:(NSString*) content{
    GreeVGPlayer* player = [[self getBlockRepo] objectForKey:@"vgplayer"];
    [QAAssert assertEqualsExpected:[NSString stringWithFormat:@"%i", [player amountOfCurrency:idn]]
                            Actual:content];
}

-(void) amount_of_item_with_identifer_PARAM:(NSString*) idn
          _of_vgs_player_should_be_PARAMINT:(NSString*) content{
    GreeVGPlayer* player = [[self getBlockRepo] objectForKey:@"vgplayer"];
    [QAAssert assertEqualsExpected:[NSString stringWithFormat:@"%i", [player amountOfItem:idn]]
                            Actual:content];

}

-(void) amount_of_items_should_be_PARAMINT:(NSString*) num{
    GreeVGPlayer* player = [[self getBlockRepo] objectForKey:@"vgplayer"];
    [QAAssert assertEqualsExpected:[NSString stringWithFormat:@"%i", [[player allItemsInInventory] count]]
                            Actual:num];
}

@end
