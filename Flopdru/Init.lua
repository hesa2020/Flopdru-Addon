local FlopAddonName = select(1, ...)
local Flop = select(2, ...) ---@type ns @The addon namespace.

function Flop.OnEvent(self, event, ...)
    if event == "ADDON_LOADED" and select(1, ...) == FlopAddonName then
        --Hide Macros Binding
        for i = 1, 12 do _G["MultiBarLeftButton"..i.."HotKey"]:SetAlpha(0) end
        for i = 1, 12 do _G["MultiBarRightButton"..i.."HotKey"]:SetAlpha(0) end
        for i = 1, 12 do _G["ActionButton"..i.."HotKey"]:SetAlpha(0) end
        for i = 1, 12 do _G["MultiBarBottomRightButton"..i.."HotKey"]:SetAlpha(0) end
        for i = 1, 12 do _G["BonusActionButton"..i.."HotKey"]:SetAlpha(0) end
        for i = 1, 12 do _G["MultiBarBottomLeftButton"..i.."HotKey"]:SetAlpha(0) end
        --Enlarge Buff/Debuff,
        BuffFrame:ClearAllPoints()
        BuffFrame:SetScale(1.2)
        BuffFrame:SetPoint("BOTTOMLEFT",PlayerFrame,"BOTTOMLEFT",800,175)
        BuffFrame.SetPoint = function() end
        --Smaller friendly nameplates
        C_NamePlate.SetNamePlateFriendlySize(60, 30)
    end
end

Flop_FRAME = CreateFrame("Frame", "FlopEventFrame")
Flop_FRAME:RegisterEvent("ADDON_LOADED")
Flop_FRAME:SetScript("OnEvent", Flop.OnEvent)