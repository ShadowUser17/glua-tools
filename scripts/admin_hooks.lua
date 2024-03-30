hook.Add("PlayerHurt", "restore_damage", function(victim, attacker, health, damage)
    if victim:IsAdmin() then
        if victim:Health() < victim:GetMaxHealth() then
            victim:SetHealth(victim:Health() + damage)
        end

        if victim:Armor() < victim:GetMaxArmor() then
            victim:SetArmor(victim:Armor() + damage)
        end
    end
end)
