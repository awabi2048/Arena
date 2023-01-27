# ランキング表示ディスプレイ設置
# マーカー設置
summon marker ~ ~ ~ {Tags:["Arena.RankingDisplay.Core"]}

# ページ変更ボタン
execute at @e[tag=Arena.RankingDisplay.Core,sort=nearest,limit=1] run summon slime ^1 ^ ^ {Tags:["Arena.RankingDisplay.PagePrev"],NoAI:true,Silent:true,NoGravity:true,ActiveEffects:[{Id:14,ShowParticles:false,Duration:2147483647}],AbsorptionAmount:1000,DeathLootTable:"empty"}
execute at @e[tag=Arena.RankingDisplay.Core,sort=nearest,limit=1] run summon slime ^-1 ^ ^ {Tags:["Arena.RankingDisplay.PageNext"],NoAI:true,Silent:true,NoGravity:true,ActiveEffects:[{Id:14,ShowParticles:false,Duration:2147483647}],AbsorptionAmount:1000,DeathLootTable:"empty"}

execute at @e[tag=Arena.RankingDisplay.Core,sort=nearest,limit=1] run summon armor_stand ^1 ^ ^ {Tags:["Arena.RankingDisplay.PageNote"],Marker:1b,Small:1b,Invisible:1b,CustomName:'{"text":"<<","color": "white","bold": true}',CustomNameVisible:true}
execute at @e[tag=Arena.RankingDisplay.Core,sort=nearest,limit=1] run summon armor_stand ^-1 ^ ^ {Tags:["Arena.RankingDisplay.PageNote"],Marker:1b,Small:1b,Invisible:1b,CustomName:'{"text":">>","color": "white","bold": true}',CustomNameVisible:true}

# データ読み込み
execute as @e[tag=Arena.RankingDisplay.Core,sort=nearest,limit=1] at @s run function arena:record/display/reflesh

