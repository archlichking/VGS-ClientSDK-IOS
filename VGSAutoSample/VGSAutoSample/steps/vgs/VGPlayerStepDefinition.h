//
//  VGPlayerStepDefinition.h
//  VGSAutoSample
//
//  Created by zhu lei on 12/5/12.
//  Copyright (c) 2012 OFQA. All rights reserved.
//

#import "StepDefinition.h"

@interface VGPlayerStepDefinition : StepDefinition

-(void) developer_uses_SDK_to_load_vgs_player_with_id_PARAM:(NSString*) pid;

-(void) amount_of_currency_with_identifier_PARAM:(NSString*) idn
                  _of_vgs_player_should_be_PARAMINT:(NSString*) content;
-(void) amount_of_item_with_identifer_PARAM:(NSString*) idn
          _of_vgs_player_should_be_PARAMINT:(NSString*) content;

-(void) amount_of_items_should_be_PARAMINT:(NSString*) num;

@end
