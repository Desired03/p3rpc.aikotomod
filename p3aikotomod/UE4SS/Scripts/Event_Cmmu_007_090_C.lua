-- Event_Cmmu_007_090_C
-- Aeon Social Link: Rank 9
-- Changes: restoration of the hug from the original game

local PATH_aegis_skelComp_Cmmu_007_090_C = "/Game/Xrd777/Events/Cinema/Event_Cmmu_007_090_C/LV_Event_Cmmu_007_090_C.LV_Event_Cmmu_007_090_C:PersistentLevel.BP_Event_PC0007_C_0.CharacterMesh0"
local PATH_makoto_skelComp_Cmmu_007_090_C = "/Game/Xrd777/Events/Cinema/Event_Cmmu_007_090_C/LV_Event_Cmmu_007_090_C.LV_Event_Cmmu_007_090_C:PersistentLevel.BP_Event_PC0001_C_0.CharacterMesh0"

local PATH_aegis_AppCharComp_Cmmu_007_090_C = "/Game/Xrd777/Events/Cinema/Event_Cmmu_007_090_C/LV_Event_Cmmu_007_090_C.LV_Event_Cmmu_007_090_C:PersistentLevel.BP_Event_PC0007_C_0.AppCharacterComp"
local PATH_makoto_AppCharComp_Cmmu_007_090_C = "/Game/Xrd777/Events/Cinema/Event_Cmmu_007_090_C/LV_Event_Cmmu_007_090_C.LV_Event_Cmmu_007_090_C:PersistentLevel.BP_Event_PC0001_C_0.AppCharacterComp"

local PATH_cineCamera_Cmmu_007_090_C = "/Game/Xrd777/Events/Cinema/Event_Cmmu_007_090_C/LV_Event_Cmmu_007_090_C.LV_Event_Cmmu_007_090_C:PersistentLevel.CineCameraActor_0.CameraComponent"

local PATH_LSPlayer_Cmmu_007_090_C = "/Game/Xrd777/Events/Cinema/Event_Cmmu_007_090_C/LV_Event_Cmmu_007_090_C.LV_Event_Cmmu_007_090_C:PersistentLevel.LS_Event_Cmmu_007_090_C.AnimationPlayer"

local PATH_aegis_rank9hugIntro = "/Game/Xrd777/Characters/Player/PC0007/AnmEventsBC/A_PC0007_EVC0879_BASE_Cmmu_007_090.A_PC0007_EVC0879_BASE_Cmmu_007_090"
local PATH_makoto_rank9hugIntro = "/Game/Xrd777/Characters/Player/PC0001/AnmEventsBC/A_PC0001_EVC0882_BASE_Cmmu_007_090.A_PC0001_EVC0882_BASE_Cmmu_007_090"
local PATH_aegis_rank9hugExit = "/Game/Xrd777/Characters/Player/PC0007/AnmEventsBC/A_PC0007_EVC0881_BASE_Cmmu_007_090.A_PC0007_EVC0881_BASE_Cmmu_007_090"
local PATH_makoto_rank9hugExit = "/Game/Xrd777/Characters/Player/PC0001/AnmEventsBC/A_PC0001_EVC0884_BASE_Cmmu_007_090.A_PC0001_EVC0884_BASE_Cmmu_007_090"

local Frames = {}
Frames[660] = function(Sequencer)
    Sequencer.InterceptState = 1

    local LSPlayer = StaticFindObject(PATH_LSPlayer_Cmmu_007_090_C)
    LSPlayer:Pause()

    local CCamera = StaticFindObject(PATH_cineCamera_Cmmu_007_090_C)

    local aegis_AppCharComp = StaticFindObject(PATH_aegis_AppCharComp_Cmmu_007_090_C)
    local makoto_AppCharComp = StaticFindObject(PATH_makoto_AppCharComp_Cmmu_007_090_C)

    local aegis_AtlEvtActor = StaticFindObject("/Game/Xrd777/Events/Cinema/Event_Cmmu_007_090_C/LV_Event_Cmmu_007_090_C.LV_Event_Cmmu_007_090_C:PersistentLevel.BP_Event_PC0007_C_0.BPAtlEvtActorComp")

    local makoto_skelComp = StaticFindObject(PATH_makoto_skelComp_Cmmu_007_090_C)
    makoto_skelComp:K2_SetWorldLocationAndRotation(
        {X = -500.7302, Y = -798.6555, Z = 2.0000},
        {Pitch = 0.0000, Yaw = -112.3, Roll = 0.0000},
        false,
        {},
        true
    )

    CCamera:K2_SetWorldLocation(
        {X = -561.3331, Y = -573.5823, Z = 151.5346},
        false,
        {},
        true
    )

    local aegis_hug_montage = aegis_AppCharComp:PlayAnim_DefaultSlot(LoadAsset(PATH_aegis_rank9hugIntro), false, 0.1, 0.1, 1.0)
    local makoto_hug_montage = makoto_AppCharComp:PlayAnim_DefaultSlot(LoadAsset(PATH_makoto_rank9hugIntro), false, 0.1, 0.1, 1.0)

    aegis_AppCharComp:PlayFaceAnimation(0, true, 0.4, 0.4, 1.0)
    makoto_AppCharComp:PlayFaceAnimation(1, true, 0.4, 0.4, 1.0)

    aegis_AtlEvtActor:SpawnHandwritingAttachedDefaultParam(6, true)

    ExecuteWithDelay(2500, function()
        ExecuteInGameThread(function()
            makoto_AppCharComp:PlayFaceAnimation(15, true, 0.8, 0.8, 1.0)
            CCamera:K2_SetWorldLocationAndRotation(
                {X = -249.0454, Y = -731.2013, Z = 158.9580},
                {Pitch = -5.6804, Yaw = -157.6924, Roll = 0.0000},
                false,
                {},
                true
            )
        end)
    end)

    ExecuteWithDelay(3800, function()
        ExecuteInGameThread(function()
            -- currently blended with default anims, but that's ok for now
            aegis_AppCharComp:PauseAnim(true, aegis_hug_montage)
            makoto_AppCharComp:PauseAnim(true, makoto_hug_montage)
            LSPlayer:JumpToSeconds(24.66) -- Frame 739
            LSPlayer:Play()
        end)
    end)
end

Frames[760] = function(Sequencer)
    Sequencer.InterceptState = 1

    local LSPlayer = StaticFindObject(PATH_LSPlayer_Cmmu_007_090_C)
    LSPlayer:Pause()

    local CCamera = StaticFindObject(PATH_cineCamera_Cmmu_007_090_C)

    local aegis_AppCharComp = StaticFindObject(PATH_aegis_AppCharComp_Cmmu_007_090_C)
    local makoto_AppCharComp = StaticFindObject(PATH_makoto_AppCharComp_Cmmu_007_090_C)
    
    local aegis_hug_exit_montage = aegis_AppCharComp:PlayAnim_DefaultSlot(LoadAsset(PATH_aegis_rank9hugExit), false, 0.1, 1.0, 1.0)
    local makoto_hug_exit_montage = makoto_AppCharComp:PlayAnim_DefaultSlot(LoadAsset(PATH_makoto_rank9hugExit), false, 0.1, 1.0, 1.0)

    makoto_AppCharComp:PlayFaceAnimation(1, true, 1.0, 1.0, 1.0)

    ExecuteWithDelay(2500, function()
        ExecuteInGameThread(function()
            LSPlayer:JumpToSeconds(25.97) -- Frame 779
            LSPlayer:Play()
            -- return to our original camera angle
            CCamera:K2_SetWorldLocationAndRotation(
                {X = -561.3331, Y = -573.5823, Z = 151.5346},
                {Pitch = -5.6804, Yaw = -67.6924, Roll = 0.0000},
                false,
                {},
                true
            )
        end)
    end)
end

return Frames