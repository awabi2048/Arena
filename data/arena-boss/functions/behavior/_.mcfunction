# モブの行動

# 再帰
schedule function arena-boss:behavior/_ 3s

# アニメーション中なら中断
execute unless data storage arena-boss: {Animation:{Name:"Regular"}} run function arena:stop_process

# ターゲット選定
tag @a[tag=ArenaBoss.Target] remove ArenaBoss.Target
execute at @e[tag=ArenaBoss.Core] run tag @p[tag=Arena.Player,distance=..32] add ArenaBoss.Target

# 乱数生成
function arena:rng

# 攻撃
execute if score $Random Arena matches 1..99 run function arena-boss:behavior/attack/_
    





