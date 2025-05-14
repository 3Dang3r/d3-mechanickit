# 🚗 Mechanic Upgrades Script (d3-mechanickit)

A **QBCore-based** FiveM resource that provides a full-featured **vehicle upgrade system** for mechanics. Players can use a mechanic kit to open a customization menu that supports modifying visual and performance components of vehicles using an intuitive UI powered by `qb-menu`.

---

## 🔧 Features

- 🎨 **Paint Color**: Change primary and secondary paint colors.
- 🪟 **Window Tint**: Apply various window tints.
- 🎨 **Liveries**: Browse and apply available liveries.
- 🛞 **Wheels**: Modify wheels with different styles.
- 🎛 **Spoilers, Bumpers, Grills, Lips**: Upgrade body parts.
- 🚨 **Neon Lights**: Toggle neons and change their colors.
- 🔊 **Horn**: Change vehicle horn sound.
- 🛋 **Interior**: Customize the vehicle’s interior.
- ✨ **Xenon Headlights**:
  - Toggle Xenons on or off.
  - Change Xenon color (white, blue, purple, etc.)
- 💨 **Tire Smoke**: Change tire smoke color (e.g. red, blue, purple).
- ⚙️ **Extras**: Toggle vehicle extras like light bars or accessories.



## New Features

 - ✨Added Aftermarket Kit With After Market Upgrade (Bulletproof Wheels)
 - 🚨 Added Repairkit Usable Item With Animation 

---

## 📦 Dependencies

- [QBCore Framework](https://github.com/qbcore-framework/qb-core)
- [`qb-menu`](https://github.com/qbcore-framework/qb-menu)

---

## 🛠️ Installation

1. Place the script inside your `resources/` folder (e.g. `resources/d3-mechanickit`)
2. Add the following to your `server.cfg`:


## 🛠 Usage
- Add The Usable Item In Your items.lua (QBCore Folder)

`["mechanickit"] = {
    name = "mechanickit",
    label = "Mechanic Kit",
    weight = 100,
    type = "item",
    image = "mechanickit.png",
    unique = true,
    useable = true,
    shouldClose = true,
    combinable = nil,
    description = "Tool kit for customizing vehicles."
}`



`["aftermarketkit"] = {
    name = "aftermarketkit",
    label = "Aftermarket Kit",
    weight = 100,
    type = "item",
    image = "aftermarketkit.png",
    unique = true,
    useable = true,
    shouldClose = true,
    combinable = nil,
    description = "Shhhhh."
}`


`["repairkit"] = {
    name = "repairkit",
    label = "Repairkit",
    weight = 100,
    type = "item",
    image = "repairkit.png",
    unique = true,
    useable = true,
    shouldClose = true,
    combinable = nil,
    description = "Repairkit"
}`

Use the item in-game to open the mechanic menu.

Navigate through categories and apply the modifications you want.


