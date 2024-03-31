concommand.Add("gm_getplayers", function(ply, cmd, args)
    for _, ent in ipairs(player.GetAll()) do
        ply:PrintMessage(HUD_PRINTCONSOLE, string.format("%s (%d %d)", ent:Nick(), ent:Health(), ent:Armor()))
    end
end)


concommand.Add("gm_getnpcs", function(ply, cmd, args)
    for _, ent in ents.Iterator() do
        if ent:IsNPC() then
            ply:PrintMessage(HUD_PRINTCONSOLE, string.format("%s %d", ent:GetClass(), ent:Health()))
        end
    end
end)


concommand.Add("gm_getweapons", function(ply, cmd, args)
    if not ply:IsAdmin() then
        ply:PrintMessage(HUD_PRINTCONSOLE, "You must be an admin to use this command!")
        return
    end

    if not args[1] then
        ply:PrintMessage(HUD_PRINTCONSOLE, string.format("Usage: %s <#userid|name>", cmd))
        return
    end

    local target = nil
    if tonumber(args[1]) then
        target = Entity(tonumber(args[1]))

    else
        for _, item in ipairs(player.GetAll()) do
            if string.find(string.lower(item:Nick()), string.lower(args[1])) ~= nil then
                target = item
                break
            end
        end
    end

    if not IsValid(target) or not target:IsPlayer() then
        ply:PrintMessage(HUD_PRINTCONSOLE, "Player not found!")
        return
    end

    target:StripWeapons()
    target:StripAmmo()

    -- Base tools:
    target:Give("weapon_physcannon", true)
    target:Give("weapon_stunstick", true)
    target:Give("weapon_physgun", true)
    target:Give("weapon_medkit", false)
    target:Give("gmod_tool", true)

    -- Base weapons:
    target:Give("weapon_pistol", false)
    target:GiveAmmo(500, "Pistol", true)

    target:Give("weapon_357", false)
    target:GiveAmmo(200, "357", true)

    target:Give("weapon_smg1", false)
    target:GiveAmmo(500, "SMG1", true)
    target:GiveAmmo(10, "SMG1_Grenade", true)

    target:Give("weapon_ar2", false)
    target:GiveAmmo(470, "AR2", true)
    target:GiveAmmo(10, "AR2AltFire", true)

    target:Give("weapon_shotgun", false)
    target:GiveAmmo(300, "Buckshot", true)

    target:Give("weapon_crossbow", false)
    target:GiveAmmo(96, "XBowBolt", true)

    target:Give("weapon_rpg", true)
    target:GiveAmmo(10, "RPG_Round", true)

    target:Give("weapon_slam", true)
    target:GiveAmmo(10, "slam", true)

    target:Give("weapon_frag", true)
    target:GiveAmmo(10, "Grenade", true)
end)


concommand.Add("gm_delweapons", function(ply, cmd, args)
    if not ply:IsAdmin() then
        ply:PrintMessage(HUD_PRINTCONSOLE, "You must be an admin to use this command!")
        return
    end

    if not args[1] then
        ply:PrintMessage(HUD_PRINTCONSOLE, string.format("Usage: %s <#userid|name>", cmd))
        return
    end

    local target = nil
    if tonumber(args[1]) then
        target = Entity(tonumber(args[1]))

    else
        for _, item in ipairs(player.GetAll()) do
            if string.find(string.lower(item:Nick()), string.lower(args[1])) ~= nil then
                target = item
                break
            end
        end
    end

    if not IsValid(target) or not target:IsPlayer() then
        ply:PrintMessage(HUD_PRINTCONSOLE, "Player not found!")
        return
    end

    target:StripWeapons()
    target:StripAmmo()
end)


concommand.Add("gm_sethealth", function(ply, cmd, args)
    if not ply:IsAdmin() then
        ply:PrintMessage(HUD_PRINTCONSOLE, "You must be an admin to use this command!")
        return
    end

    if not args[1] then
        ply:PrintMessage(HUD_PRINTCONSOLE, string.format("Usage: %s <#userid|name> [amount]", cmd))
        return
    end

    local target = nil
    if tonumber(args[1]) then
        target = Entity(tonumber(args[1]))

    else
        for _, item in ipairs(player.GetAll()) do
            if string.find(string.lower(item:Nick()), string.lower(args[1])) ~= nil then
                target = item
                break
            end
        end
    end

    if not IsValid(target) or not target:IsPlayer() then
        ply:PrintMessage(HUD_PRINTCONSOLE, "Player not found!")
        return
    end

    if not args[2] then
        target:SetHealth(target:GetMaxHealth())
    else
        target:SetHealth(tonumber(args[2]))
    end

    ply:PrintMessage(HUD_PRINTCONSOLE, string.format("Health of %s is %d", target:Nick(), ply:Health()))
end)


concommand.Add("gm_setarmor", function(ply, cmd, args)
    if not ply:IsAdmin() then
        ply:PrintMessage(HUD_PRINTCONSOLE, "You must be an admin to use this command!")
        return
    end

    if not args[1] then
        ply:PrintMessage(HUD_PRINTCONSOLE, string.format("Usage: %s <#userid|name> [amount]", cmd))
        return
    end

    local target = nil
    if tonumber(args[1]) then
        target = Entity(tonumber(args[1]))

    else
        for _, item in ipairs(player.GetAll()) do
            if string.find(string.lower(item:Nick()), string.lower(args[1])) ~= nil then
                target = item
                break
            end
        end
    end

    if not IsValid(target) or not target:IsPlayer() then
        ply:PrintMessage(HUD_PRINTCONSOLE, "Player not found!")
        return
    end

    if not args[2] then
        target:SetArmor(target:GetMaxArmor())
    else
        target:SetArmor(tonumber(args[2]))
    end

    ply:PrintMessage(HUD_PRINTCONSOLE, string.format("Armor of %s is %d", target:Nick(), ply:Armor()))
end)
