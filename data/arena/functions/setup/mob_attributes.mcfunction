# 召喚するモブのAttributesの値設定(初期値)
data modify storage arena:core MobInfo.Zombie.SummonCount set value [12,16,20,24,28]
data modify storage arena:core MobInfo.Zombie.Health set value [12,16,20,24,28]
data modify storage arena:core MobInfo.Zombie.AttackDamage set value [2.0,2.5,3.0,3.5,4.0]
data modify storage arena:core MobInfo.Zombie.Speed set value [0.16,0.17,0.18,0.19,0.20]

data modify storage arena:core MobInfo.Skeleton set from storage arena:core MobInfo.Zombie
data modify storage arena:core MobInfo.Blaze set from storage arena:core MobInfo.Zombie
data modify storage arena:core MobInfo.Spider set from storage arena:core MobInfo.Zombie
data modify storage arena:core MobInfo.Slime set from storage arena:core MobInfo.Zombie
data modify storage arena:core MobInfo.Creeper set from storage arena:core MobInfo.Zombie
data modify storage arena:core MobInfo.Guardian set from storage arena:core MobInfo.Zombie

# 固有データの値設定(初期値)
data modify storage arena:core MobInfo.Creeper.ExplosionRadius set value [3,3,4,4,5]
