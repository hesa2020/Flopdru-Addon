local FlopAddonName = select(1, ...)
local Flop = select(2, ...) ---@type ns @The addon namespace.

function Flop.OnEvent(self, event, ...)
    if event == "ADDON_LOADED" and select(1, ...) == FlopAddonName then
        --Hide Macros Binding
        for i = 1, 12 do if _G["MultiBarLeftButton"..i.."HotKey"] ~= nil then _G["MultiBarLeftButton"..i.."HotKey"]:SetAlpha(0) end end
        for i = 1, 12 do if _G["MultiBarRightButton"..i.."HotKey"] ~= nil then _G["MultiBarRightButton"..i.."HotKey"]:SetAlpha(0) end end
        for i = 1, 12 do if _G["ActionButton"..i.."HotKey"] ~= nil then _G["ActionButton"..i.."HotKey"]:SetAlpha(0) end end
        for i = 1, 12 do if _G["MultiBarBottomRightButton"..i.."HotKey"] ~= nil then _G["MultiBarBottomRightButton"..i.."HotKey"]:SetAlpha(0) end end
        for i = 1, 12 do if _G["BonusActionButton"..i.."HotKey"] ~= nil then _G["BonusActionButton"..i.."HotKey"]:SetAlpha(0) end end
        for i = 1, 12 do if _G["MultiBarBottomLeftButton"..i.."HotKey"] ~= nil then _G["MultiBarBottomLeftButton"..i.."HotKey"]:SetAlpha(0) end end
        --Enlarge Buff/Debuff,
        if BuffFrame ~= nil then
            BuffFrame:ClearAllPoints()
            BuffFrame:SetScale(1.2)
            BuffFrame:SetPoint("BOTTOMLEFT",PlayerFrame,"BOTTOMLEFT",800,175)
            BuffFrame.SetPoint = function() end
        end
        --Smaller friendly nameplates
        if C_NamePlate ~= nil then
            C_NamePlate.SetNamePlateFriendlySize(60, 30)
        end
    end
end

Flop_FRAME = CreateFrame("Frame", "FlopEventFrame")
Flop_FRAME:RegisterEvent("ADDON_LOADED")
Flop_FRAME:SetScript("OnEvent", Flop.OnEvent)