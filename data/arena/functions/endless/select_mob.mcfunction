# 召喚モブの選択

# 乱数生成
function arena:rng
scoreboard players operation $Random Arena %= #6 Constant

# 直近の召喚と被っていたら再抽選
data modify storage arena:temp Endless.LastSummonedMob set from storage arena: Endless.LastSummonedMob
data modify storage arena:temp Endless.Duplication set value [{value: false},{value: false},{value: false}]

execute store result storage arena:temp Endless.GeneratedNumber int 1 run scoreboard players get $Random Arena

execute store success storage arena:temp Endless.Duplication[0].value byte 1 run data modify storage arena:temp Endless.LastSummonedMob[0] set from storage arena:temp Endless.GeneratedNumber
execute store success storage arena:temp Endless.Duplication[1].value byte 1 run data modify storage arena:temp Endless.LastSummonedMob[1] set from storage arena:temp Endless.GeneratedNumber
execute store success storage arena:temp Endless.Duplication[2].value byte 1 run data modify storage arena:temp Endless.LastSummonedMob[2] set from storage arena:temp Endless.GeneratedNumber

execute if data storage arena:temp Endless.Duplication[{value:false}] run function arena:endless/select_mob

# 被りなしならパス & データに追加
execute unless data storage arena:temp Endless.Duplication[{value:false}] run scoreboard players operation $MobType Arena.Temp = $Random Arena

execute unless data storage arena:temp Endless.Duplication[{value:false}] run data modify storage arena: Endless.LastSummonedMob append value -1

execute unless data storage arena:temp Endless.Duplication[{value:false}] store result storage arena: Endless.LastSummonedMob[-1] int 1 run scoreboard players get $MobType Arena.Temp
execute unless data storage arena:temp Endless.Duplication[{value:false}] run data remove storage arena: Endless.LastSummonedMob[0]
