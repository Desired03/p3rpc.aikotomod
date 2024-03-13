-- Written by desvstvyy

local Sequencer = {}
Sequencer.InterceptState = 0

local Events = {
    ["LevelSequencePlayer /Game/Xrd777/Events/Cinema/Event_Cmmu_007_090_C/LV_Event_Cmmu_007_090_C.LV_Event_Cmmu_007_090_C:PersistentLevel.LS_Event_Cmmu_007_090_C.AnimationPlayer"] = require("Event_Cmmu_007_090_C"),
    ["LevelSequencePlayer /Game/Xrd777/Events/Cinema/Event_Main_140_310_C/LV_Event_Main_140_310_C.LV_Event_Main_140_310_C:PersistentLevel.LS_Event_Main_140_310_C.AnimationPlayer"] = require("Event_Main_140_310_C"),
    ["LevelSequencePlayer /Game/Xrd777/Events/Cinema/Event_Main_140_330_C/LV_Event_Main_140_330_C.LV_Event_Main_140_330_C:PersistentLevel.LS_Event_Main_140_330_C.AnimationPlayer"] = require("Event_Main_140_330_C"),
    ["LevelSequencePlayer /Game/Xrd777/Events/Cinema/Event_Main_200_150_C/LV_Event_Main_200_150_C.LV_Event_Main_200_150_C:PersistentLevel.LS_Event_Main_200_150_C.AnimationPlayer"] = require("Event_Main_200_150_C"),
}

local LSPlayer
local HOOKED_Sequence = false
local PlayPreId, PlayPostId
local FinishPreId, FinishPostId

function OnPlayEventSequencer(self)
    if not (LSPlayer and LSPlayer:IsValid()) then
        return
    end

    local frameNum = LSPlayer:GetCurrentTime().Time.FrameNumber.Value
    if Sequencer.InterceptState > 0 then
        print(string.format("[p3aikotomod] Currently intercepting! Current frame: %s (%.6f sec)\n", frameNum, frameNum / 30))
        if Sequencer.InterceptState == 1 then
            Sequencer.InterceptState = 0
        end
        return
    end

    local Frames = Events[LSPlayer:GetFullName()]
    if Frames and Frames[frameNum] then
        Frames[frameNum](Sequencer)
    end
end

function OnFinishedEventSequencer(self)
    if HOOKED_Sequence then
        HOOKED_Sequence = false
        -- Unregistering will mitigate hitching (game thread HATES Lua)
        UnregisterHook("/Script/xrd777.AtlEvtPlayObject:OnPlayEventSequencer", PlayPreId, PlayPostId)
        UnregisterHook("/Script/xrd777.AtlEvtPlayObject:OnFinishedEventSequencer", FinishPreId, FinishPostId)
    end
end


NotifyOnNewObject("/Script/LevelSequence.LevelSequencePlayer", function(object)
    if Events[object:GetFullName()] then
        LSPlayer = object
        if not HOOKED_Sequence then
            HOOKED_Sequence = true
            PlayPreId, PlayPostId = RegisterHook("/Script/xrd777.AtlEvtPlayObject:OnPlayEventSequencer", OnPlayEventSequencer)
            FinishPreId, FinishPostId = RegisterHook("/Script/xrd777.AtlEvtPlayObject:OnFinishedEventSequencer", OnFinishedEventSequencer)
        end
    end
end)

-- Console commands for extrapolating scene data
RegisterConsoleCommandHandler("GetCurrentTime", function(FullCommand, Parameters)
    local LSPlayer = FindFirstOf("LevelSequencePlayer")
    if not (LSPlayer and LSPlayer:IsValid()) then
        return true
    end

    for i, v in pairs(LSPlayer:GetCurrentTime()) do
        for k, o in pairs(v) do
            print(string.format("[%s:%s] %s\n", i, k, o))
        end
    end

    for i, v in pairs(LSPlayer:GetCurrentTime().Time.FrameNumber) do
        print(string.format("[Time:FrameNumber:%s] %s\n", i, v))
    end

    return true
end)

RegisterConsoleCommandHandler("GetComponentTransform", function(FullCommand, Parameters)
    -- currently set to Event_Main_140_310_C. too lazy to adapt automatically
    local CCamera = StaticFindObject("/Game/Xrd777/Events/Cinema/Event_Main_210_275_C/LV_Event_Main_210_275_C.LV_Event_Main_210_275_C:PersistentLevel.CineCameraActor_0.CameraComponent")
    local makoto_skelComp = StaticFindObject("/Game/Xrd777/Events/Cinema/Event_Main_210_275_C/LV_Event_Main_210_275_C.LV_Event_Main_210_275_C:PersistentLevel.BP_Event_PC0001_C_2.CharacterMesh0")

    --print(makoto_skelComp:GetAnimInstance():GetFullName()) -- nullptr

    local camLocation = CCamera:K2_GetComponentLocation()
    local camRotation = CCamera:K2_GetComponentRotation()
    
    local makotoLocation = makoto_skelComp:K2_GetComponentLocation()
    local makotoRotation = makoto_skelComp:K2_GetComponentRotation()

    print(string.format("CineCamera: (X=%.4f, Y=%.4f, Z=%.4f), (Pitch=%.4f, Yaw=%.4f, Roll=%.4f)\n", camLocation.X, camLocation.Y, camLocation.Z, camRotation.Pitch, camRotation.Yaw, camRotation.Roll))
    print(string.format("Makoto: (X=%.4f, Y=%.4f, Z=%.4f), (Pitch=%.4f, Yaw=%.4f, Roll=%.4f)\n", makotoLocation.X, makotoLocation.Y, makotoLocation.Z, makotoRotation.Pitch, makotoRotation.Yaw, makotoRotation.Roll))

    return true
end)