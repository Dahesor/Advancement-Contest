#
#execute unless score on main matches 1.. unless entity @s[scores={team=1..}] run return fail

dialog show @s {type:"notice",title:"任务列表",\
    can_close_with_escape:true,pause:false,after_action:none,\
    body:[\
        {type:"plain_message",contents:{text:"><"},width:500},\
        {type:"plain_message",contents:[{text:">\uE778"},{translate:"ask.balanced_diet.1",font:"uniform"},"<"],width:500},\
        {type:"plain_message",contents:[{text:">\uE778"},{translate:"ask.stone_pickaxe.1",font:"uniform"},"<"],width:500},\
        {type:"plain_message",contents:[{text:">\uE778"},{translate:"ask.use_wind_charge",font:"uniform"},"<"],width:500},\
        {type:"plain_message",contents:[{text:">\uE778"},{translate:"ask.make_a_sign_glow",font:"uniform"},"<"],width:500},\
        {type:"plain_message",contents:[{text:">\uE778"},{translate:"ask.respawn_dragon",font:"uniform"},"<"],width:500},\
        {type:"plain_message",contents:[{text:">\uE778"},{translate:"ask.trial_chamber",font:"uniform"},"<"],width:500}\
    ]\
    ,action:{label:{translate:"gui.done"},action:{type:"run_command",command:"/trigger dialog set -999"}}\
}