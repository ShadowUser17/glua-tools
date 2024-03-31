concommand.Add("gm_list_players", function(ply, cmd, args)
    for index, ent in ipairs(player.GetAll()) do
        ply:PrintMessage(HUD_PRINTCONSOLE, string.format("%d %s (%d %d)", index, ent:Nick(), ent:Health(), ent:Armor()))
    end
end)


concommand.Add("gm_list_npcs", function(ply, cmd, args)
    for index, ent in ents.Iterator() do
        if ent:IsNPC() then
            ply:PrintMessage(HUD_PRINTCONSOLE, string.format("%d %s %d", index, ent:GetClass(), ent:Health()))
        end
    end
end)


concommand.Add("gm_remove_npcs", function(ply, cmd, args)
    for index, ent in ents.Iterator() do
        if ent:IsNPC() then
            ent:Remove()
            ply:PrintMessage(HUD_PRINTCONSOLE, string.format("%d %s %d", index, ent:GetClass(), ent:Health()))
        end
    end
end)


concommand.Add("gm_ignite_player", function(ply, cmd, args)
    if not ply:IsAdmin() then
        ply:PrintMessage(HUD_PRINTCONSOLE, "You must be an admin to use this command!")
        return
    end

    if not args[1] then
        ply:PrintMessage(HUD_PRINTCONSOLE, string.format("Usage: %s <userid|name> [time]", cmd))
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
        target:Ignite(30, 0)
    else
        target:Ignite(tonumber(args[2]), 0)
    end
end)


concommand.Add("gm_ignite_npc", function(ply, cmd, args)
    if not args[1] then
        ply:PrintMessage(HUD_PRINTCONSOLE, string.format("Usage: %s <id> [time]", cmd))
        return
    end

    local items = ents.GetAll()
    local target = items[tonumber(args[1])]

    if not IsValid(target) or not target:IsNPC() then
        ply:PrintMessage(HUD_PRINTCONSOLE, "NPC not found!")
        return
    end

    if not args[2] then
        target:Ignite(30, 0)
    else
        target:Ignite(tonumber(args[2]), 0)
    end
end)


concommand.Add("gm_set_weapons", function(ply, cmd, args)
    if not ply:IsAdmin() then
        ply:PrintMessage(HUD_PRINTCONSOLE, "You must be an admin to use this command!")
        return
    end

    if not args[1] then
        ply:PrintMessage(HUD_PRINTCONSOLE, string.format("Usage: %s <userid|name> [add_extra]", cmd))
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

    -- Base weapons:
    target:Give("weapon_physcannon", true)
    target:Give("weapon_stunstick", true)
    target:Give("weapon_physgun", true)
    target:Give("gmod_tool", true)

    -- Extra weapons:
    if args[2] then
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
    end
end)


concommand.Add("gm_hls_weapons", function(ply, cmd, args)
    if not ply:IsAdmin() then
        ply:PrintMessage(HUD_PRINTCONSOLE, "You must be an admin to use this command!")
        return
    end

    if not args[1] then
        ply:PrintMessage(HUD_PRINTCONSOLE, string.format("Usage: %s <userid|name>", cmd))
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

    target:Give("weapon_crowbar_hl1", true)
    target:Give("weapon_hornetgun", false)

    target:Give("weapon_357_hl1", false)
    target:GiveAmmo(200, "357Round", true)

    target:Give("weapon_mp5_hl1", false)
    target:GiveAmmo(500, "9mmRound", true)
    target:GiveAmmo(10, "MP5_Grenade", true)

    target:Give("weapon_shotgun_hl1", false)
    target:GiveAmmo(296, "BuckshotHL1", true)

    target:Give("weapon_crossbow_hl1", false)
    target:GiveAmmo(100, "XBowBoltHL1", true)

    target:Give("weapon_rpg_hl1", false)
    target:GiveAmmo(11, "RPG_Rocket", true)

    target:Give("weapon_handgrenade", true)
    target:GiveAmmo(20, "GrenadeHL1", true)

    target:Give("weapon_tripmine", true)
    target:GiveAmmo(20, "TripMine", true)

    target:Give("weapon_satchel", true)
    target:GiveAmmo(20, "Satchel", true)

    target:Give("weapon_snark", true)
    target:GiveAmmo(20, "Snark", true)

    target:Give("weapon_gauss", true)
    target:Give("weapon_egon", true)
    target:GiveAmmo(700, "Uranium", true)
end)


concommand.Add("gm_remove_weapons", function(ply, cmd, args)
    if not ply:IsAdmin() then
        ply:PrintMessage(HUD_PRINTCONSOLE, "You must be an admin to use this command!")
        return
    end

    if not args[1] then
        ply:PrintMessage(HUD_PRINTCONSOLE, string.format("Usage: %s <userid|name>", cmd))
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


concommand.Add("gm_set_health", function(ply, cmd, args)
    if not ply:IsAdmin() then
        ply:PrintMessage(HUD_PRINTCONSOLE, "You must be an admin to use this command!")
        return
    end

    if not args[1] then
        ply:PrintMessage(HUD_PRINTCONSOLE, string.format("Usage: %s <userid|name> [amount]", cmd))
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


concommand.Add("gm_set_armor", function(ply, cmd, args)
    if not ply:IsAdmin() then
        ply:PrintMessage(HUD_PRINTCONSOLE, "You must be an admin to use this command!")
        return
    end

    if not args[1] then
        ply:PrintMessage(HUD_PRINTCONSOLE, string.format("Usage: %s <userid|name> [amount]", cmd))
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
