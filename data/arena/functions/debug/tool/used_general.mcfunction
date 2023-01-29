# デバッグツール使用時に実行

function arena:debug/tool/used_kill
#execute if predicate arena:is_sneaking run function arena:debug/tool/used_skip

item replace entity @s weapon.mainhand with lingering_potion{Arena:{Item:DebugTool},HideFlags:127,display:{Name:'{"text":"アリーナ デバッグツール","color": "light_purple","italic": false,"bold": true}',Lore:['[{"keybind":"key.sneak","color": "yellow","italic": false},{"text": " + ","color": "yellow","italic": false},{"keybind":"key.use","color": "yellow","italic": false},{"text":": アリーナ内の敵を一掃します。","color": "white","italic": false}]','[{"keybind":"key.use","color": "yellow","italic": false},{"text":": (エンドレス限定) ウェーブを既定値までスキップします。","color": "white","italic": false}]']},CustomPotionColor:0}
