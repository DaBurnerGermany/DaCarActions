Config = {}

Config.notifications = {
    DefaultFiveM = true
    ,BtwLouis = false
    ,Custom = false
}
Config.progressBars = {
    TigerScripts = false
    ,MyScripts = false
    ,Custom = false
}

Config.Locale = 'en'

Config.Carwash = {
    Use = true
    ,usableItem = {
        {name = "car_towel", label = "Towel", removeAfterUse = false}
    }
    ,timeToExecute = 60 * 1000
    ,clientEvent = "DaCarActions:Car-Wash"
    ,animation = "WORLD_HUMAN_MAID_CLEAN"
}
Config.Hijack = {
    Use = true
    ,usableItem = {
        {name = "blowtorch", label = "Blowtorch", removeAfterUse = true},
        {name = "crowbar", label = "Crowbar", removeAfterUse = false}
    }
    ,timeToExecute = 30 * 1000
    ,clientEvent = "DaCarActions:Car-Hijack"
    ,animation = "WORLD_HUMAN_WELDING"
}



Translations={
    ["de"] = {
        ["not_available_in_car"] = "Sie können dies nicht aus einem Fahrzeug heraus tun!"
        ,["no_vehicle_nearby"] = "Kein Fahrzeug in der Nähe."
        ,["vehicle_washed"] = "Fahrzeug gewaschen."
        ,["vehicle_hijacked"] = "Fahrzeug aufgebrochen."
        ,["progress_wash"] = "Waschen"
        ,["progress_hijack"] = "Aufbrechen"
        ,["item_removed"] = "Gegenstand entfernt "
    }
    ,["en"] = {
        ["not_available_in_car"] = "You cannot do this from a vehicle!"
        ,["no_vehicle_nearby"] = "No vehicle nearby."
        ,["vehicle_washed"] = "Vehicle washed."
        ,["vehicle_hijacked"] = "Vehicle broken into."
        ,["progress_wash"] = "Wash"
        ,["progress_hijack"] = "Break open"
        ,["item_removed"] = "Item removed "
    }
}