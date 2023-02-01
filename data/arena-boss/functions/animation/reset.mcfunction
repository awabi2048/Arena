# アニメーション稼働状態をリセット
data modify storage arena-boss: Animation.Name set value "Regular"
scoreboard players set $AnimationTimer ArenaBoss 0

tag @a[tag=ArenaBoss.SkillTarget] remove ArenaBoss.SkillTarget

data modify storage arena-boss: Animation.Flag.NoMove set value false
