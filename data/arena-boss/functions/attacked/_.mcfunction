# トリガー
advancement revoke @s only arena-boss:attacked

# 被攻撃時処理
execute if data entity @e[tag=ArenaBoss.Core,limit=1] {data:{ArenaBoss:{Name:"Fire"}}} run function arena-boss:attacked/fire
