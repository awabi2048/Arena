# 再起動時処理 (近くに入ったときに実行)
# 演出が直近なら処理中断
execute store result score $TimeDifference ArenaBoss.Temp run time query gametime
execute store result score $LastActivatedTime ArenaBoss.Temp run data get storage arena-boss: Altar.LastActivatedTime 

scoreboard players operation $TimeDifference ArenaBoss.Temp -= $LastActivatedTime ArenaBoss.Temp


# 演出
execute if score $TimeDifference ArenaBoss.Temp matches 40.. run playsound block.beacon.activate master @a ~ ~ ~ 1 0.75
execute if score $TimeDifference ArenaBoss.Temp matches 40.. run playsound block.beacon.ambient master @a ~ ~ ~ 1 1.5

execute if score $TimeDifference ArenaBoss.Temp matches 40.. run particle enchant ~ ~3 ~ 2 2 2 0.5 300

# 最後に演出した時間を記録
execute if score $TimeDifference ArenaBoss.Temp matches 20.. run execute store result storage arena-boss: Altar.LastActivatedTime int 1 run time query gametime
