## ランキングディスプレイ 再設定
# 表示をリセット
# kill
kill @e[tag=Arena.RankingDisplay-Note]
kill @e[tag=Arena.RankingDisplay]

# 各種表示用エンティティ召喚
execute at @e[tag=Arena.RankingDisplay.Core] run summon armor_stand ~ ~2.75 ~ {Tags:["Arena.RankingDisplay-Note"],Marker:1b,Small:1b,Invisible:1b,CustomName:'{"text":" ","color": "red","bold": true}',CustomNameVisible:true}
execute at @e[tag=Arena.RankingDisplay.Core] run summon armor_stand ~ ~2.5 ~ {Tags:["Arena.RankingDisplay-Note"],Marker:1b,Small:1b,Invisible:1b,CustomName:'{"text":" ","color": "gold","bold": true}',CustomNameVisible:true}

execute at @e[tag=Arena.RankingDisplay.Core] run summon armor_stand ~ ~2.1 ~ {Tags:["Arena.RankingDisplay-0","Arena.RankingDisplay"],Marker:1b,Small:1b,Invisible:1b,CustomName:'',CustomNameVisible:true,Silent:true}
execute at @e[tag=Arena.RankingDisplay.Core] run summon armor_stand ~ ~1.65 ~ {Tags:["Arena.RankingDisplay-1","Arena.RankingDisplay"],Marker:1b,Small:1b,Invisible:1b,CustomName:'',CustomNameVisible:true,Silent:true}
execute at @e[tag=Arena.RankingDisplay.Core] run summon armor_stand ~ ~1.2 ~ {Tags:["Arena.RankingDisplay-2","Arena.RankingDisplay"],Marker:1b,Small:1b,Invisible:1b,CustomName:'',CustomNameVisible:true,Silent:true}
execute at @e[tag=Arena.RankingDisplay.Core] run summon armor_stand ~ ~0.75 ~ {Tags:["Arena.RankingDisplay-3","Arena.RankingDisplay"],Marker:1b,Small:1b,Invisible:1b,CustomName:'',CustomNameVisible:true,Silent:true}
execute at @e[tag=Arena.RankingDisplay.Core] run summon armor_stand ~ ~0.3 ~ {Tags:["Arena.RankingDisplay-4","Arena.RankingDisplay"],Marker:1b,Small:1b,Invisible:1b,CustomName:'',CustomNameVisible:true,Silent:true}

# ページ変更
execute at @e[tag=Arena.RankingDisplay.Core] run summon slime ^1 ^ ^ {Tags:["Arena.RankingDisplay.PagePrev"],NoAI:true,NoGravity:true,Invulnerable:true,ActiveEffects:[{Id:14,ShowParticles:false,Duration:2147483647}],AbsorptionAmount:1000,DeathLootTable:"empty"}
execute at @e[tag=Arena.RankingDisplay.Core] run summon slime ^-1 ^ ^ {Tags:["Arena.RankingDisplay.PageNext"],NoAI:true,NoGravity:true,Invulnerable:true,ActiveEffects:[{Id:14,ShowParticles:false,Duration:2147483647}],AbsorptionAmount:1000,DeathLootTable:"empty"}

execute at @e[tag=Arena.RankingDisplay.Core] run summon armor_stand ^1 ^0.25 ^ {Tags:["Arena.RankingDisplay-Note"],Marker:1b,Small:1b,Invisible:1b,CustomName:'{"text":"","color": "white","bold": true}',CustomNameVisible:true}
execute at @e[tag=Arena.RankingDisplay.Core] run summon armor_stand ^-1 ^0.25 ^ {Tags:["Arena.RankingDisplay-Note"],Marker:1b,Small:1b,Invisible:1b,CustomName:'{"text":"","color": "white","bold": true}',CustomNameVisible:true}

# データがなければ表示削除
execute unless data storage arena: PlayerData[4] run kill @e[tag=Arena.RankingDisplay-4]
execute unless data storage arena: PlayerData[3] run kill @e[tag=Arena.RankingDisplay-3]
execute unless data storage arena: PlayerData[2] run kill @e[tag=Arena.RankingDisplay-2]
execute unless data storage arena: PlayerData[0] run kill @e[tag=Arena.RankingDisplay-0]

execute unless data storage arena: PlayerData[1] if data storage arena: PlayerData[0] run kill @e[tag=Arena.RankingDisplay-1]
execute unless data storage arena: PlayerData[0] run data modify entity @e[tag=Arena.RankingDisplay-1,limit=1] CustomName set value '{"text":"記録なし","color": "gray","bold": true}'

# 表示データを取得
