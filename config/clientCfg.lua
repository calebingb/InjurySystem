Config = {}

local stabWeaponNames = {
    'WEAPON_KNIFE',
    'WEAPON_DAGGER',
    'WEAPON_HATCHET'
}
Config.stabWeaponHashes = {}

for _, weaponName in ipairs(stabWeaponNames) do
    table.insert(Config.stabWeaponHashes, GetHashKey(weaponName))
end