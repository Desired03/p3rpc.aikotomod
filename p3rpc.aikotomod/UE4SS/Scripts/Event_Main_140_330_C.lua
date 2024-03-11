-- Event_Main_140_330_C
-- 7/21 Evening - Aigis introduction to SEES
-- Changes: semi-restoration of Junpei and Akihiko's reactions to Aigis being a robot

local Frames = {}
Frames[345] = function(Sequencer)
    local junpei_AtlEvtActor = StaticFindObject("/Game/Xrd777/Events/Cinema/Event_Main_140_330_C/LV_Event_Main_140_330_C.LV_Event_Main_140_330_C:PersistentLevel.BP_Event_PC0003_C_0.BPAtlEvtActorComp")
    local akihiko_AtlEvtActor = StaticFindObject("/Game/Xrd777/Events/Cinema/Event_Main_140_330_C/LV_Event_Main_140_330_C.LV_Event_Main_140_330_C:PersistentLevel.BP_Event_PC0004_C_0.BPAtlEvtActorComp")

    -- "heartbroken icons" (ittitate is close enough)
    junpei_AtlEvtActor:SpawnHandwritingAttachedDefaultParam(13, true)
    akihiko_AtlEvtActor:SpawnHandwritingAttachedDefaultParam(13, true)
end

return Frames