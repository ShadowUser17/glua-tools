concommand.Add("gm_sethealth", function(ply, cmd, args)
    if not ply:IsAdmin() then
        ply:PrintMessage(HUD_PRINTCONSOLE, "You must be an admin to use this command!")
        return
    end

    if not args[1] or not args[2] then
        ply:PrintMessage(HUD_PRINTCONSOLE, "Usage: " .. cmd .. " <#userid|name> <amount>")
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

    target:SetHealth(tonumber(args[2]))
    print("Health of " .. target:Nick() .. " is " .. ply:Health())
end)


concommand.Add("gm_setarmor", function(ply, cmd, args)
    if not ply:IsAdmin() then
        ply:PrintMessage(HUD_PRINTCONSOLE, "You must be an admin to use this command!")
        return
    end

    if not args[1] or not args[2] then
        ply:PrintMessage(HUD_PRINTCONSOLE, "Usage: " .. cmd .. " <#userid|name> <amount>")
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

    target:SetArmor(tonumber(args[2]))
    print("Armor of " .. target:Nick() .. " is " .. ply:Armor())
end)
