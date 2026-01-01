execute if function dsc:core/auth/check run return run function dsc:menu/admin/main
dialog show @s {type:"confirmation",title:"权限认证",body:[\
        {"type":"item",item:{id:"repeating_command_block"},show_tooltip:false,show_decorations:false,description:["",{text:"使用管理员面板需要您有至少2级权限",color:"red"},"\n","请点击下方按钮验证，验证成功后现实时间三十分钟内有效。"]}\
    ],\
    yes:{label:"认证",action:{type:"run_command",command:"/function dsc:core/auth/self_redirect"}},\
    no:{label:"取消"}\
}