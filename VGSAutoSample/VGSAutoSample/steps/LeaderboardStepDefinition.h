//
//  LeaderboardStepDefinition.h
//  OFQAAPI
//
//  Created by lei zhu on 4/6/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "StepDefinition.h"

@interface LeaderboardStepDefinition : StepDefinition{
    
}

- (void) I_load_list_of_leaderboard;
- (void) I_set_leaderboard_enumerator_size_to_PARAMINT:(NSString*) size;
- (void) I_load_one_page_of_leaderboard_list_reversely;
//- (void) I_load_the_first_page_of_leaderboard_list_with_page_size_PARAMINT:(NSString*) size;

- (void) I_should_have_total_leaderboards_PARAMINT:(NSString*) amount;
- (void) I_should_have_leaderboard_of_name_PARAM:(NSString*) ld_name 
                     _with_allowWorseScore_PARAM:(NSString*) aws
                               _and_secret_PARAM:(NSString*) secret
                            _and_order_asc_PARAM:(NSString*) order;



- (void) I_make_sure_my_score_PARAM:(NSString*) exist
              _in_leaderboard_PARAM:(NSString*) ld_name;

- (void) I_add_score_to_leaderboard_PARAM:(NSString*) ld_name
                     _with_score_PARAMINT:(NSString*) score;

- (void) I_delete_my_score_in_leaderboard_PARAM:(NSString*) ld_name;

- (void) my_score_PARAMINT:(NSString*) score _should_be_updated_in_leaderboard_PARAM:(NSString*) ld_name;
- (void) my_score_PARAMINT:(NSString*) score _should_not_be_updated_in_leaderboard_PARAM:(NSString*) ld_name;

- (void) my_PARAM:(NSString*) period _score_ranking_of_leaderboard_PARAM:(NSString*) ld_name _should_be_PARAMINT:(NSString*) rank;

- (void) I_load_score_list_of_PARAM:(NSString*) range 
     _section_for_leaderboard_PARAM:(NSString*) ld_name 
                  _for_period_PARAM:(NSString*) period;

- (void) list_should_have_score_PARAMINT:(NSString*) score 
                        _of_player_PARAM:(NSString*) p_name 
                     _with_rank_PARAMINT:(NSString*) rank;

- (void) I_load_top_score_list_for_leaderboard_PARAM:(NSString*) ld_name _for_period_PARAM:(NSString*) period;

- (void) I_load_icon_of_leaderboard_PARAM:(NSString*) ld_name;

- (void) I_cancel_load_icon_of_leaderboard_PARAM:(NSString*) ld_name;

- (NSString*) leaderboard_icon_of_PARAM:(NSString*) ld_name 
                  _should_be_PARAM:(NSString*) status;

- (void) I_check_basic_info_of_leaderboard_PARAM:(NSString*) lb_name;

- (NSString*) info_PARAM:(NSString*) info 
   _of_leaderboard_PARAM:(NSString*) lb_name 
        _should_be_PARAM:(NSString*) res;

- (void) I_format_my_score_of_leaderboard_PARAM:(NSString*) lb_name;

- (NSString*) formatted_score_should_be_PARAM:(NSString*) score;

@end
