# デバッグツールの付与
give @s lingering_potion{Arena:{Item:DebugTool},HideFlags:127,display:{Name:'{"text":"アリーナ デバッグツール","color": "light_purple","italic": false,"bold": true}',Lore:['[{"keybind":"key.sneak","color": "yellow","italic": false},{"text": " + ","color": "yellow","italic": false},{"keybind":"key.use","color": "yellow","italic": false},{"text":": アリーナ内の敵を一掃します。","color": "white","italic": false}]','[{"keybind":"key.use","color": "yellow","italic": false},{"text":": (エンドレス限定) ウェーブを既定値までスキップします。","color": "white","italic": false}]']},CustomPotionColor:0}

tellraw @s [{"text":"［アリーナデバッグ］: ","color": "light_purple","bold": true},{"text":"デバッグ用ツールを付与しました。","color": "white","bold": false}]

playsound block.note_block.harp master @s ~ ~ ~ 1 2
playsound block.sculk_sensor.clicking master @s ~ ~ ~ 1 1.6
