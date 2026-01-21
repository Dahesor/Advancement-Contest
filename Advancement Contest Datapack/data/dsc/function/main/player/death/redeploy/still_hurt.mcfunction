scoreboard players operation #time calc.DSC = @s hurt_penalty
scoreboard players operation #time calc.DSC -= $gametime calc.DSC
scoreboard players operation #time calc.DSC /= #20 calc.DSC
scoreboard players add #time calc.DSC 1

tellraw @s [{translate:"head.game",color:"red"},{text:"您在",color:"red"},{text:"最近",color:"yellow",underlined:true,hover_event:{action:"show_text",value:"使用重新部署需要：\n - 三十秒内未受过伤\n - 两分钟内未被其他玩家伤害"}},"受到过伤害，无法重新部署！(",{score:{name:"#time",objective:"calc.DSC"},color:"light_purple"},{text:"s)",color:"red"}]