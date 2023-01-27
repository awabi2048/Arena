# Note部分表示
data modify storage arena:temp DisplayNote set value {"text":"0","bold":true,"color":"red"}

# アリーナ】名
#Memo: ストレージに設定してから代入など色々試したけど、結局これが一番簡単で良かった
execute if data entity @s {data:{Arena:{RankingDisplay:{Page:0}}}} run data modify entity @e[tag=Arena.RankingDisplay.Note-0,limit=1] CustomName set value '{"text":"【ゾンビアリーナ】","bold":true,"color":"red"}'
execute if data entity @s {data:{Arena:{RankingDisplay:{Page:1}}}} run data modify entity @e[tag=Arena.RankingDisplay.Note-0,limit=1] CustomName set value '{"text":"【スケルトンアリーナ】","bold":true,"color":"red"}'
execute if data entity @s {data:{Arena:{RankingDisplay:{Page:2}}}} run data modify entity @e[tag=Arena.RankingDisplay.Note-0,limit=1] CustomName set value '{"text":"【ブレイズアリーナ】","bold":true,"color":"red"}'
execute if data entity @s {data:{Arena:{RankingDisplay:{Page:3}}}} run data modify entity @e[tag=Arena.RankingDisplay.Note-0,limit=1] CustomName set value '{"text":"【スパイダーアリーナ】","bold":true,"color":"red"}'
execute if data entity @s {data:{Arena:{RankingDisplay:{Page:4}}}} run data modify entity @e[tag=Arena.RankingDisplay.Note-0,limit=1] CustomName set value '{"text":"【スライムアリーナ】","bold":true,"color":"red"}'
execute if data entity @s {data:{Arena:{RankingDisplay:{Page:5}}}} run data modify entity @e[tag=Arena.RankingDisplay.Note-0,limit=1] CustomName set value '{"text":"【クリーパーアリーナ】","bold":true,"color":"red"}'
execute if data entity @s {data:{Arena:{RankingDisplay:{Page:6}}}} run data modify entity @e[tag=Arena.RankingDisplay.Note-0,limit=1] CustomName set value '{"text":"【ガーディアンアリーナ】","bold":true,"color":"red"}'

execute if data entity @s {data:{Arena:{RankingDisplay:{Page:7}}}} run data modify entity @e[tag=Arena.RankingDisplay.Note-0,limit=1] CustomName set value '{"text":"【エンドレスアリーナ】","bold":true,"color":"red"}'

# 記録の種類
execute unless data entity @s {data:{Arena:{RankingDisplay:{Page:7}}}} run data modify entity @e[tag=Arena.RankingDisplay.Note-1,limit=1] CustomName set value '{"text":"クリアタイムランキング","bold":true,"color":"gold"}'
execute if data entity @s {data:{Arena:{RankingDisplay:{Page:7}}}} run data modify entity @e[tag=Arena.RankingDisplay.Note-1,limit=1] CustomName set value '{"text":"最高到達ウェーブランキング","bold":true,"color":"gold"}'
