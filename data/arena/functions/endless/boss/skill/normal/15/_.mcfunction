# 小ボスを召喚
    # 召喚
    function arena:endless/mini_boss/summon

    # 演出
    execute at @e[tag=Arena.SummonPoint,sort=nearest,limit=4,distance=..32] run particle effect ~ ~ ~ 0.5 0 0.5 1 100 

    data modify storage arena:boss Skills set value []
