-- Event_Main_140_310_C
-- 7/21 Daytime - Aigis on the pier
-- Changes: semi-restoration of the heart icons and Makoto's reaction to Aigis

local PATH_makoto_AppCharComp = "/Game/Xrd777/Events/Cinema/Event_Main_140_310_C/LV_Event_Main_140_310_C.LV_Event_Main_140_310_C:PersistentLevel.BP_Event_PC0001_C_0.AppCharacterComp"
local PATH_makoto_AtlEvtActor = "/Game/Xrd777/Events/Cinema/Event_Main_140_310_C/LV_Event_Main_140_310_C.LV_Event_Main_140_310_C:PersistentLevel.BP_Event_PC0001_C_0.BPAtlEvtActorComp"
local PATH_junpei_AtlEvtActor = "/Game/Xrd777/Events/Cinema/Event_Main_140_310_C/LV_Event_Main_140_310_C.LV_Event_Main_140_310_C:PersistentLevel.BP_Event_PC0003_C_0.BPAtlEvtActorComp"
local PATH_akihiko_AtlEvtActor = "/Game/Xrd777/Events/Cinema/Event_Main_140_310_C/LV_Event_Main_140_310_C.LV_Event_Main_140_310_C:PersistentLevel.BP_Event_PC0004_C_0.BPAtlEvtActorComp"

local PATH_LSPlayer = "/Game/Xrd777/Events/Cinema/Event_Main_140_310_C/LV_Event_Main_140_310_C.LV_Event_Main_140_310_C:PersistentLevel.LS_Event_Main_140_310_C.AnimationPlayer"

local Frames = {}
Frames[0] = function(Sequencer)
    ExecuteWithDelay(1000, function()
        ExecuteInGameThread(function()
            local makoto_AppCharComp = StaticFindObject(PATH_makoto_AppCharComp)
            local makoto_AtlEvtActor = StaticFindObject(PATH_makoto_AtlEvtActor)
            local junpei_AtlEvtActor = StaticFindObject(PATH_junpei_AtlEvtActor)
            local akihiko_AtlEvtActor = StaticFindObject(PATH_akihiko_AtlEvtActor)

            -- "heart icons" (double-exclamation is close enough)
            makoto_AtlEvtActor:SpawnHandwritingAttachedDefaultParam(6, true)
            junpei_AtlEvtActor:SpawnHandwritingAttachedDefaultParam(6, true)
            akihiko_AtlEvtActor:SpawnHandwritingAttachedDefaultParam(6, true)

            makoto_AppCharComp:PlayFaceAnimation(4, true, 0.8, 0.8, 1.0)
        end)
    end)
end

Frames[320] = function(Sequencer)
    local makoto_AppCharComp = StaticFindObject(PATH_makoto_AppCharComp)
    makoto_AppCharComp:PlayFaceAnimation(0, true, 0.8, 0.8, 1.0)
end

return Frames