advancement revoke @a only arena:boss/skill/01

# 通常
execute unless data storage arena: {Boss:{Skill:{01:{Killed:[1]}}}} unless entity @e[tag=Arena.Boss.Skill01.01] if data entity @e[tag=Arena.Core,sort=nearest,limit=1] {data:{Arena:{StageType:Endless}}} run function arena:endless/boss/skill/normal/01/01
execute unless data storage arena: {Boss:{Skill:{01:{Killed:[2]}}}} unless entity @e[tag=Arena.Boss.Skill01.02] if data entity @e[tag=Arena.Core,sort=nearest,limit=1] {data:{Arena:{StageType:Endless}}} run function arena:endless/boss/skill/normal/01/02
execute unless data storage arena: {Boss:{Skill:{01:{Killed:[3]}}}} unless entity @e[tag=Arena.Boss.Skill01.03] if data entity @e[tag=Arena.Core,sort=nearest,limit=1] {data:{Arena:{StageType:Endless}}} run function arena:endless/boss/skill/normal/01/03
execute unless data storage arena: {Boss:{Skill:{01:{Killed:[4]}}}} unless entity @e[tag=Arena.Boss.Skill01.04] if data entity @e[tag=Arena.Core,sort=nearest,limit=1] {data:{Arena:{StageType:Endless}}} run function arena:endless/boss/skill/normal/01/04
execute unless data storage arena: {Boss:{Skill:{01:{Killed:[5]}}}} unless entity @e[tag=Arena.Boss.Skill01.05] if data entity @e[tag=Arena.Core,sort=nearest,limit=1] {data:{Arena:{StageType:Endless}}} run function arena:endless/boss/skill/normal/01/05
execute unless data storage arena: {Boss:{Skill:{01:{Killed:[6]}}}} unless entity @e[tag=Arena.Boss.Skill01.06] if data entity @e[tag=Arena.Core,sort=nearest,limit=1] {data:{Arena:{StageType:Endless}}} run function arena:endless/boss/skill/normal/01/06
execute unless data storage arena: {Boss:{Skill:{01:{Killed:[7]}}}} unless entity @e[tag=Arena.Boss.Skill01.07] if data entity @e[tag=Arena.Core,sort=nearest,limit=1] {data:{Arena:{StageType:Endless}}} run function arena:endless/boss/skill/normal/01/07
execute unless data storage arena: {Boss:{Skill:{01:{Killed:[8]}}}} unless entity @e[tag=Arena.Boss.Skill01.08] if data entity @e[tag=Arena.Core,sort=nearest,limit=1] {data:{Arena:{StageType:Endless}}} run function arena:endless/boss/skill/normal/01/08

# 隠し
execute unless data storage arena: {Boss:{Skill:{01:{Killed:[1]}}}} unless entity @e[tag=Arena.Boss.Skill01.01] if data entity @e[tag=Arena.Core,sort=nearest,limit=1] {data:{Arena:{StageType:HiddenEndless}}} run function arena:endless/boss/skill/hidden/01/01
execute unless data storage arena: {Boss:{Skill:{01:{Killed:[2]}}}} unless entity @e[tag=Arena.Boss.Skill01.02] if data entity @e[tag=Arena.Core,sort=nearest,limit=1] {data:{Arena:{StageType:HiddenEndless}}} run function arena:endless/boss/skill/hidden/01/02
execute unless data storage arena: {Boss:{Skill:{01:{Killed:[3]}}}} unless entity @e[tag=Arena.Boss.Skill01.03] if data entity @e[tag=Arena.Core,sort=nearest,limit=1] {data:{Arena:{StageType:HiddenEndless}}} run function arena:endless/boss/skill/hidden/01/03
execute unless data storage arena: {Boss:{Skill:{01:{Killed:[4]}}}} unless entity @e[tag=Arena.Boss.Skill01.04] if data entity @e[tag=Arena.Core,sort=nearest,limit=1] {data:{Arena:{StageType:HiddenEndless}}} run function arena:endless/boss/skill/hidden/01/04
execute unless data storage arena: {Boss:{Skill:{01:{Killed:[5]}}}} unless entity @e[tag=Arena.Boss.Skill01.05] if data entity @e[tag=Arena.Core,sort=nearest,limit=1] {data:{Arena:{StageType:HiddenEndless}}} run function arena:endless/boss/skill/hidden/01/05
execute unless data storage arena: {Boss:{Skill:{01:{Killed:[6]}}}} unless entity @e[tag=Arena.Boss.Skill01.06] if data entity @e[tag=Arena.Core,sort=nearest,limit=1] {data:{Arena:{StageType:HiddenEndless}}} run function arena:endless/boss/skill/hidden/01/06
execute unless data storage arena: {Boss:{Skill:{01:{Killed:[7]}}}} unless entity @e[tag=Arena.Boss.Skill01.07] if data entity @e[tag=Arena.Core,sort=nearest,limit=1] {data:{Arena:{StageType:HiddenEndless}}} run function arena:endless/boss/skill/hidden/01/07
execute unless data storage arena: {Boss:{Skill:{01:{Killed:[8]}}}} unless entity @e[tag=Arena.Boss.Skill01.08] if data entity @e[tag=Arena.Core,sort=nearest,limit=1] {data:{Arena:{StageType:HiddenEndless}}} run function arena:endless/boss/skill/hidden/01/08
