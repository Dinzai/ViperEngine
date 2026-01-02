import Viper

player = Viper.Spawn({
    "position": [400, 400],
    "radius": 15,
    "mass": 1,
    "red": 255,
    "green": 255,
    "blue": 255,
    "alpha": 255,
    "index": 0
})

player = Viper.AddComponent(player, {
    "controller": "controller"
})

player = Viper.AddCamera(player, {
    "camera": "camera"
})

Viper.Run()
