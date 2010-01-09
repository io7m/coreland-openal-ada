-- Automatically generated, do not edit.

with System;
with OpenAL.Types;

package OpenAL.Extension.EFX_Thin is

  AL_EFFECTSLOT_EFFECT                        : constant := 16#0001#;
  AL_EFFECTSLOT_GAIN                          : constant := 16#0002#;
  AL_EFFECTSLOT_AUXILIARY_SEND_AUTO           : constant := 16#0003#;
  AL_EFFECTSLOT_NULL                          : constant := 16#0000#;
  AL_EFFECT_TYPE                              : constant := 16#8001#;
  AL_EFFECT_NULL                              : constant := 16#0000#;
  AL_EFFECT_REVERB                            : constant := 16#0001#;
  AL_EFFECT_CHORUS                            : constant := 16#0002#;
  AL_EFFECT_DISTORTION                        : constant := 16#0003#;
  AL_EFFECT_ECHO                              : constant := 16#0004#;
  AL_EFFECT_FLANGER                           : constant := 16#0005#;
  AL_EFFECT_FREQUENCY_SHIFTER                 : constant := 16#0006#;
  AL_EFFECT_VOCAL_MORPHER                     : constant := 16#0007#;
  AL_EFFECT_PITCH_SHIFTER                     : constant := 16#0008#;
  AL_EFFECT_RING_MODULATOR                    : constant := 16#0009#;
  AL_EFFECT_AUTOWAH                           : constant := 16#000A#;
  AL_EFFECT_COMPRESSOR                        : constant := 16#000B#;
  AL_EFFECT_EQUALIZER                         : constant := 16#000C#;
  AL_EFFECT_EAXREVERB                         : constant := 16#8000#;
  AL_REVERB_DENSITY                           : constant := 16#0001#;
  AL_REVERB_DIFFUSION                         : constant := 16#0002#;
  AL_REVERB_GAIN                              : constant := 16#0003#;
  AL_REVERB_GAINHF                            : constant := 16#0004#;
  AL_REVERB_DECAY_TIME                        : constant := 16#0005#;
  AL_REVERB_DECAY_HFRATIO                     : constant := 16#0006#;
  AL_REVERB_REFLECTIONS_GAIN                  : constant := 16#0007#;
  AL_REVERB_REFLECTIONS_DELAY                 : constant := 16#0008#;
  AL_REVERB_LATE_REVERB_GAIN                  : constant := 16#0009#;
  AL_REVERB_LATE_REVERB_DELAY                 : constant := 16#000A#;
  AL_REVERB_AIR_ABSORPTION_GAINHF             : constant := 16#000B#;
  AL_REVERB_ROOM_ROLLOFF_FACTOR               : constant := 16#000C#;
  AL_REVERB_DECAY_HFLIMIT                     : constant := 16#000D#;
  AL_REVERB_MIN_DENSITY                       : constant := 0.0;
  AL_REVERB_MAX_DENSITY                       : constant := 1.0;
  AL_REVERB_DEFAULT_DENSITY                   : constant := 1.0;
  AL_REVERB_MIN_DIFFUSION                     : constant := 0.0;
  AL_REVERB_MAX_DIFFUSION                     : constant := 1.0;
  AL_REVERB_DEFAULT_DIFFUSION                 : constant := 1.0;
  AL_REVERB_MIN_GAIN                          : constant := 0.0;
  AL_REVERB_MAX_GAIN                          : constant := 1.0;
  AL_REVERB_DEFAULT_GAIN                      : constant := 0.32;
  AL_REVERB_MIN_GAINHF                        : constant := 0.0;
  AL_REVERB_MAX_GAINHF                        : constant := 1.0;
  AL_REVERB_DEFAULT_GAINHF                    : constant := 0.89;
  AL_REVERB_MIN_DECAY_TIME                    : constant := 0.1;
  AL_REVERB_MAX_DECAY_TIME                    : constant := 20.0;
  AL_REVERB_DEFAULT_DECAY_TIME                : constant := 1.49;
  AL_REVERB_MIN_DECAY_HFRATIO                 : constant := 0.1;
  AL_REVERB_MAX_DECAY_HFRATIO                 : constant := 2.0;
  AL_REVERB_DEFAULT_DECAY_HFRATIO             : constant := 0.83;
  AL_REVERB_MIN_REFLECTIONS_GAIN              : constant := 0.0;
  AL_REVERB_MAX_REFLECTIONS_GAIN              : constant := 3.16;
  AL_REVERB_DEFAULT_REFLECTIONS_GAIN          : constant := 0.05;
  AL_REVERB_MIN_REFLECTIONS_DELAY             : constant := 0.0;
  AL_REVERB_MAX_REFLECTIONS_DELAY             : constant := 0.3;
  AL_REVERB_DEFAULT_REFLECTIONS_DELAY         : constant := 0.007;
  AL_REVERB_MIN_LATE_REVERB_GAIN              : constant := 0.0;
  AL_REVERB_MAX_LATE_REVERB_GAIN              : constant := 10.0;
  AL_REVERB_DEFAULT_LATE_REVERB_GAIN          : constant := 1.26;
  AL_REVERB_MIN_LATE_REVERB_DELAY             : constant := 0.0;
  AL_REVERB_MAX_LATE_REVERB_DELAY             : constant := 0.1;
  AL_REVERB_DEFAULT_LATE_REVERB_DELAY         : constant := 0.011;
  AL_REVERB_MIN_AIR_ABSORPTION_GAINHF         : constant := 0.892;
  AL_REVERB_MAX_AIR_ABSORPTION_GAINHF         : constant := 1.0;
  AL_REVERB_DEFAULT_AIR_ABSORPTION_GAINHF     : constant := 0.994;
  AL_REVERB_MIN_ROOM_ROLLOFF_FACTOR           : constant := 0.0;
  AL_REVERB_MAX_ROOM_ROLLOFF_FACTOR           : constant := 10.0;
  AL_REVERB_DEFAULT_ROOM_ROLLOFF_FACTOR       : constant := 0.0;
  AL_REVERB_MIN_DECAY_HFLIMIT                 : constant := 16#0#;
  AL_REVERB_MAX_DECAY_HFLIMIT                 : constant := 16#1#;
  AL_REVERB_DEFAULT_DECAY_HFLIMIT             : constant := 16#1#;
  AL_ECHO_DELAY                               : constant := 16#0001#;
  AL_ECHO_LRDELAY                             : constant := 16#0002#;
  AL_ECHO_DAMPING                             : constant := 16#0003#;
  AL_ECHO_FEEDBACK                            : constant := 16#0004#;
  AL_ECHO_SPREAD                              : constant := 16#0005#;
  AL_ECHO_MIN_DELAY                           : constant := 0.0;
  AL_ECHO_MAX_DELAY                           : constant := 0.207;
  AL_ECHO_DEFAULT_DELAY                       : constant := 0.1;
  AL_ECHO_MIN_LRDELAY                         : constant := 0.0;
  AL_ECHO_MAX_LRDELAY                         : constant := 0.404;
  AL_ECHO_DEFAULT_LRDELAY                     : constant := 0.1;
  AL_ECHO_MIN_DAMPING                         : constant := 0.0;
  AL_ECHO_MAX_DAMPING                         : constant := 0.99;
  AL_ECHO_DEFAULT_DAMPING                     : constant := 0.5;
  AL_ECHO_MIN_FEEDBACK                        : constant := 0.0;
  AL_ECHO_MAX_FEEDBACK                        : constant := 1.0;
  AL_ECHO_DEFAULT_FEEDBACK                    : constant := 0.5;
  AL_ECHO_MIN_SPREAD                          : constant := -1.0;
  AL_ECHO_MAX_SPREAD                          : constant := 1.0;
  AL_ECHO_DEFAULT_SPREAD                      : constant := -1.0;
  AL_EAXREVERB_DENSITY                        : constant := 16#0001#;
  AL_EAXREVERB_DIFFUSION                      : constant := 16#0002#;
  AL_EAXREVERB_GAIN                           : constant := 16#0003#;
  AL_EAXREVERB_GAINHF                         : constant := 16#0004#;
  AL_EAXREVERB_GAINLF                         : constant := 16#0005#;
  AL_EAXREVERB_DECAY_TIME                     : constant := 16#0006#;
  AL_EAXREVERB_DECAY_HFRATIO                  : constant := 16#0007#;
  AL_EAXREVERB_DECAY_LFRATIO                  : constant := 16#0008#;
  AL_EAXREVERB_REFLECTIONS_GAIN               : constant := 16#0009#;
  AL_EAXREVERB_REFLECTIONS_DELAY              : constant := 16#000A#;
  AL_EAXREVERB_REFLECTIONS_PAN                : constant := 16#000B#;
  AL_EAXREVERB_LATE_REVERB_GAIN               : constant := 16#000C#;
  AL_EAXREVERB_LATE_REVERB_DELAY              : constant := 16#000D#;
  AL_EAXREVERB_LATE_REVERB_PAN                : constant := 16#000E#;
  AL_EAXREVERB_ECHO_TIME                      : constant := 16#000F#;
  AL_EAXREVERB_ECHO_DEPTH                     : constant := 16#0010#;
  AL_EAXREVERB_MODULATION_TIME                : constant := 16#0011#;
  AL_EAXREVERB_MODULATION_DEPTH               : constant := 16#0012#;
  AL_EAXREVERB_AIR_ABSORPTION_GAINHF          : constant := 16#0013#;
  AL_EAXREVERB_HFREFERENCE                    : constant := 16#0014#;
  AL_EAXREVERB_LFREFERENCE                    : constant := 16#0015#;
  AL_EAXREVERB_ROOM_ROLLOFF_FACTOR            : constant := 16#0016#;
  AL_EAXREVERB_DECAY_HFLIMIT                  : constant := 16#0017#;
  AL_EAXREVERB_MIN_DENSITY                    : constant := 0.0;
  AL_EAXREVERB_MAX_DENSITY                    : constant := 1.0;
  AL_EAXREVERB_DEFAULT_DENSITY                : constant := 1.0;
  AL_EAXREVERB_MIN_DIFFUSION                  : constant := 0.0;
  AL_EAXREVERB_MAX_DIFFUSION                  : constant := 1.0;
  AL_EAXREVERB_DEFAULT_DIFFUSION              : constant := 1.0;
  AL_EAXREVERB_MIN_GAIN                       : constant := 0.0;
  AL_EAXREVERB_MAX_GAIN                       : constant := 1.0;
  AL_EAXREVERB_DEFAULT_GAIN                   : constant := 0.32;
  AL_EAXREVERB_MIN_GAINHF                     : constant := 0.0;
  AL_EAXREVERB_MAX_GAINHF                     : constant := 1.0;
  AL_EAXREVERB_DEFAULT_GAINHF                 : constant := 0.89;
  AL_EAXREVERB_MIN_GAINLF                     : constant := 0.0;
  AL_EAXREVERB_MAX_GAINLF                     : constant := 1.0;
  AL_EAXREVERB_DEFAULT_GAINLF                 : constant := 1.0;
  AL_EAXREVERB_MIN_DECAY_TIME                 : constant := 0.1;
  AL_EAXREVERB_MAX_DECAY_TIME                 : constant := 20.0;
  AL_EAXREVERB_DEFAULT_DECAY_TIME             : constant := 1.49;
  AL_EAXREVERB_MIN_DECAY_HFRATIO              : constant := 0.1;
  AL_EAXREVERB_MAX_DECAY_HFRATIO              : constant := 2.0;
  AL_EAXREVERB_DEFAULT_DECAY_HFRATIO          : constant := 0.83;
  AL_EAXREVERB_MIN_DECAY_LFRATIO              : constant := 0.1;
  AL_EAXREVERB_MAX_DECAY_LFRATIO              : constant := 2.0;
  AL_EAXREVERB_DEFAULT_DECAY_LFRATIO          : constant := 1.0;
  AL_EAXREVERB_MIN_REFLECTIONS_GAIN           : constant := 0.0;
  AL_EAXREVERB_MAX_REFLECTIONS_GAIN           : constant := 3.16;
  AL_EAXREVERB_DEFAULT_REFLECTIONS_GAIN       : constant := 0.05;
  AL_EAXREVERB_MIN_REFLECTIONS_DELAY          : constant := 0.0;
  AL_EAXREVERB_MAX_REFLECTIONS_DELAY          : constant := 0.3;
  AL_EAXREVERB_DEFAULT_REFLECTIONS_DELAY      : constant := 0.007;
  AL_EAXREVERB_DEFAULT_REFLECTIONS_PAN_XYZ    : constant := 0.0;
  AL_EAXREVERB_MIN_LATE_REVERB_GAIN           : constant := 0.0;
  AL_EAXREVERB_MAX_LATE_REVERB_GAIN           : constant := 10.0;
  AL_EAXREVERB_DEFAULT_LATE_REVERB_GAIN       : constant := 1.26;
  AL_EAXREVERB_MIN_LATE_REVERB_DELAY          : constant := 0.0;
  AL_EAXREVERB_MAX_LATE_REVERB_DELAY          : constant := 0.1;
  AL_EAXREVERB_DEFAULT_LATE_REVERB_DELAY      : constant := 0.011;
  AL_EAXREVERB_DEFAULT_LATE_REVERB_PAN_XYZ    : constant := 0.0;
  AL_EAXREVERB_MIN_ECHO_TIME                  : constant := 0.075;
  AL_EAXREVERB_MAX_ECHO_TIME                  : constant := 0.25;
  AL_EAXREVERB_DEFAULT_ECHO_TIME              : constant := 0.25;
  AL_EAXREVERB_MIN_ECHO_DEPTH                 : constant := 0.0;
  AL_EAXREVERB_MAX_ECHO_DEPTH                 : constant := 1.0;
  AL_EAXREVERB_DEFAULT_ECHO_DEPTH             : constant := 0.0;
  AL_EAXREVERB_MIN_MODULATION_TIME            : constant := 0.04;
  AL_EAXREVERB_MAX_MODULATION_TIME            : constant := 4.0;
  AL_EAXREVERB_DEFAULT_MODULATION_TIME        : constant := 0.25;
  AL_EAXREVERB_MIN_MODULATION_DEPTH           : constant := 0.0;
  AL_EAXREVERB_MAX_MODULATION_DEPTH           : constant := 1.0;
  AL_EAXREVERB_DEFAULT_MODULATION_DEPTH       : constant := 0.0;
  AL_EAXREVERB_MIN_AIR_ABSORPTION_GAINHF      : constant := 0.892;
  AL_EAXREVERB_MAX_AIR_ABSORPTION_GAINHF      : constant := 1.0;
  AL_EAXREVERB_DEFAULT_AIR_ABSORPTION_GAINHF  : constant := 0.994;
  AL_EAXREVERB_MIN_HFREFERENCE                : constant := 1000.0;
  AL_EAXREVERB_MAX_HFREFERENCE                : constant := 20000.0;
  AL_EAXREVERB_DEFAULT_HFREFERENCE            : constant := 5000.0;
  AL_EAXREVERB_MIN_LFREFERENCE                : constant := 20.0;
  AL_EAXREVERB_MAX_LFREFERENCE                : constant := 1000.0;
  AL_EAXREVERB_DEFAULT_LFREFERENCE            : constant := 250.0;
  AL_EAXREVERB_MIN_ROOM_ROLLOFF_FACTOR        : constant := 0.0;
  AL_EAXREVERB_MAX_ROOM_ROLLOFF_FACTOR        : constant := 10.0;
  AL_EAXREVERB_DEFAULT_ROOM_ROLLOFF_FACTOR    : constant := 0.0;
  AL_EAXREVERB_MIN_DECAY_HFLIMIT              : constant := 16#0#;
  AL_EAXREVERB_MAX_DECAY_HFLIMIT              : constant := 16#1#;
  AL_EAXREVERB_DEFAULT_DECAY_HFLIMIT          : constant := 16#1#;
  AL_FILTER_TYPE                              : constant := 16#8001#;
  AL_FILTER_NULL                              : constant := 16#0000#;
  AL_FILTER_LOWPASS                           : constant := 16#0001#;
  AL_FILTER_HIGHPASS                          : constant := 16#0002#;
  AL_FILTER_BANDPASS                          : constant := 16#0003#;
  AL_LOWPASS_GAIN                             : constant := 16#0001#;
  AL_LOWPASS_GAINHF                           : constant := 16#0002#;

  --
  -- OpenAL EFX
  --

  -- alAuxiliaryEffectSlotf
  type Auxiliary_Effect_Slotf_t is access procedure
    (Slot      : Types.Unsigned_Integer_t;
     Parameter : Types.Enumeration_t;
     Value     : Types.Float_t);
  pragma Convention (C, Auxiliary_Effect_Slotf_t);

  -- alAuxiliaryEffectSlotfv
  type Auxiliary_Effect_Slotfv_t is access procedure
    (Slot      : Types.Unsigned_Integer_t;
     Parameter : Types.Enumeration_t;
     Values    : System.Address);
  pragma Convention (C, Auxiliary_Effect_Slotfv_t);

  -- alAuxiliaryEffectSloti
  type Auxiliary_Effect_Sloti_t is access procedure
    (Slot      : Types.Unsigned_Integer_t;
     Parameter : Types.Enumeration_t;
     Value     : Types.Integer_t);
  pragma Convention (C, Auxiliary_Effect_Sloti_t);

  -- alAuxiliaryEffectSlotiv
  type Auxiliary_Effect_Slotiv_t is access procedure
    (Slot      : Types.Unsigned_Integer_t;
     Parameter : Types.Enumeration_t;
     Values    : System.Address);
  pragma Convention (C, Auxiliary_Effect_Slotiv_t);

  -- alDeleteAuxiliaryEffectSlots
  type Delete_Auxiliary_Effect_Slots_t is access procedure
    (Size  : Types.Size_t;
     Slots : System.Address);
  pragma Convention (C, Delete_Auxiliary_Effect_Slots_t);

  -- alDeleteEffects
  type Delete_Effects_t is access procedure
    (Size    : Types.Size_t;
     Effects : System.Address);
  pragma Convention (C, Delete_Effects_t);

  -- alDeleteFilters
  type Delete_Filters_t is access procedure
    (Size    : Types.Size_t;
     Filters : System.Address);
  pragma Convention (C, Delete_Filters_t);

  -- alEffectf
  type Effectf_t is access procedure
    (Effect    : Types.Unsigned_Integer_t;
     Parameter : Types.Enumeration_t;
     Value     : Types.Float_t);
  pragma Convention (C, Effectf_t);

  -- alEffectfv
  type Effectfv_t is access procedure
    (Effect    : Types.Unsigned_Integer_t;
     Parameter : Types.Enumeration_t;
     Values    : System.Address);
  pragma Convention (C, Effectfv_t);

  -- alEffecti
  type Effecti_t is access procedure
    (Effect    : Types.Unsigned_Integer_t;
     Parameter : Types.Enumeration_t;
     Value     : Types.Integer_t);
  pragma Convention (C, Effecti_t);

  -- alEffectiv
  type Effectiv_t is access procedure
    (Effect    : Types.Unsigned_Integer_t;
     Parameter : Types.Enumeration_t;
     Values    : System.Address);
  pragma Convention (C, Effectiv_t);

  -- alFilterf
  type Filterf_t is access procedure
    (Filter    : Types.Unsigned_Integer_t;
     Parameter : Types.Enumeration_t;
     Value     : Types.Float_t);
  pragma Convention (C, Filterf_t);

  -- alFilterfv
  type Filterfv_t is access procedure
    (Filter    : Types.Unsigned_Integer_t;
     Parameter : Types.Enumeration_t;
     Values    : System.Address);
  pragma Convention (C, Filterfv_t);

  -- alFilteri
  type Filteri_t is access procedure
    (Filter    : Types.Unsigned_Integer_t;
     Parameter : Types.Enumeration_t;
     Value     : Types.Integer_t);
  pragma Convention (C, Filteri_t);

  -- alFilteriv
  type Filteriv_t is access procedure
    (Filter    : Types.Unsigned_Integer_t;
     Parameter : Types.Enumeration_t;
     Values    : System.Address);
  pragma Convention (C, Filteriv_t);

  -- alGenAuxiliaryEffectSlots
  type Gen_Auxiliary_Effect_Slots_t is access procedure
    (Size  : Types.Size_t;
     Slots : System.Address);
  pragma Convention (C, Gen_Auxiliary_Effect_Slots_t);

  -- alGenEffects
  type Gen_Effects_t is access procedure
    (Size    : Types.Size_t;
     Effects : System.Address);
  pragma Convention (C, Gen_Effects_t);

  -- alGenFilters
  type Gen_Filters_t is access procedure
    (Size    : Types.Size_t;
     Filters : System.Address);
  pragma Convention (C, Gen_Filters_t);

  -- alGetAuxiliaryEffectSlotf
  type Get_Auxiliary_Effect_Slotf_t is access procedure
    (Slot      : Types.Unsigned_Integer_t;
     Parameter : Types.Enumeration_t;
     Values    : System.Address);
  pragma Convention (C, Get_Auxiliary_Effect_Slotf_t);

  -- alGetAuxiliaryEffectSlotfv
  type Get_Auxiliary_Effect_Slotfv_t is access procedure
    (Slot      : Types.Unsigned_Integer_t;
     Parameter : Types.Enumeration_t;
     Values    : System.Address);
  pragma Convention (C, Get_Auxiliary_Effect_Slotfv_t);

  -- alGetAuxiliaryEffectSloti
  type Get_Auxiliary_Effect_Sloti_t is access procedure
    (Slot      : Types.Unsigned_Integer_t;
     Parameter : Types.Enumeration_t;
     Values    : System.Address);
  pragma Convention (C, Get_Auxiliary_Effect_Sloti_t);

  -- alGetAuxiliaryEffectSlotiv
  type Get_Auxiliary_Effect_Slotiv_t is access procedure
    (Slot      : Types.Unsigned_Integer_t;
     Parameter : Types.Enumeration_t;
     Values    : System.Address);
  pragma Convention (C, Get_Auxiliary_Effect_Slotiv_t);

  -- alGetEffectf
  type Get_Effectf_t is access procedure
    (Effect    : Types.Unsigned_Integer_t;
     Parameter : Types.Enumeration_t;
     Values    : System.Address);
  pragma Convention (C, Get_Effectf_t);

  -- alGetEffectfv
  type Get_Effectfv_t is access procedure
    (Effect    : Types.Unsigned_Integer_t;
     Parameter : Types.Enumeration_t;
     Values    : System.Address);
  pragma Convention (C, Get_Effectfv_t);

  -- alGetEffecti
  type Get_Effecti_t is access procedure
    (Effect    : Types.Unsigned_Integer_t;
     Parameter : Types.Enumeration_t;
     Values    : System.Address);
  pragma Convention (C, Get_Effecti_t);

  -- alGetEffectiv
  type Get_Effectiv_t is access procedure
    (Effect    : Types.Unsigned_Integer_t;
     Parameter : Types.Enumeration_t;
     Values    : System.Address);
  pragma Convention (C, Get_Effectiv_t);

  -- alGetFilterf
  type Get_Filterf_t is access procedure
    (Filter    : Types.Unsigned_Integer_t;
     Parameter : Types.Enumeration_t;
     Values    : System.Address);
  pragma Convention (C, Get_Filterf_t);

  -- alGetFilterfv
  type Get_Filterfv_t is access procedure
    (Filter    : Types.Unsigned_Integer_t;
     Parameter : Types.Enumeration_t;
     Values    : System.Address);
  pragma Convention (C, Get_Filterfv_t);

  -- alGetFilteri
  type Get_Filteri_t is access procedure
    (Filter    : Types.Unsigned_Integer_t;
     Parameter : Types.Enumeration_t;
     Values    : System.Address);
  pragma Convention (C, Get_Filteri_t);

  -- alGetFilteriv
  type Get_Filteriv_t is access procedure
    (Filter    : Types.Unsigned_Integer_t;
     Parameter : Types.Enumeration_t;
     Values    : System.Address);
  pragma Convention (C, Get_Filteriv_t);

  -- alIsAuxiliaryEffectSlot
  type Is_Auxiliary_Effect_Slot_t is access function
    (Slot : Types.Unsigned_Integer_t) return Types.Boolean_t;
  pragma Convention (C, Is_Auxiliary_Effect_Slot_t);

  -- alIsEffect
  type Is_Effect_t is access function
    (Effect : Types.Unsigned_Integer_t) return Types.Boolean_t;
  pragma Convention (C, Is_Effect_t);

  -- alIsFilter
  type Is_Filter_t is access function
    (Filter : Types.Unsigned_Integer_t) return Types.Boolean_t;
  pragma Convention (C, Is_Filter_t);

  --
  -- Record type for API pointers
  --

  type API_t is record
    Auxiliary_Effect_Slotf         : Auxiliary_Effect_Slotf_t;
    Auxiliary_Effect_Slotfv        : Auxiliary_Effect_Slotfv_t;
    Auxiliary_Effect_Sloti         : Auxiliary_Effect_Sloti_t;
    Auxiliary_Effect_Slotiv        : Auxiliary_Effect_Slotiv_t;
    Delete_Auxiliary_Effect_Slots  : Delete_Auxiliary_Effect_Slots_t;
    Delete_Effects                 : Delete_Effects_t;
    Delete_Filters                 : Delete_Filters_t;
    Effectf                        : Effectf_t;
    Effectfv                       : Effectfv_t;
    Effecti                        : Effecti_t;
    Effectiv                       : Effectiv_t;
    Filterf                        : Filterf_t;
    Filterfv                       : Filterfv_t;
    Filteri                        : Filteri_t;
    Filteriv                       : Filteriv_t;
    Gen_Auxiliary_Effect_Slots     : Gen_Auxiliary_Effect_Slots_t;
    Gen_Effects                    : Gen_Effects_t;
    Gen_Filters                    : Gen_Filters_t;
    Get_Auxiliary_Effect_Slotf     : Get_Auxiliary_Effect_Slotf_t;
    Get_Auxiliary_Effect_Slotfv    : Get_Auxiliary_Effect_Slotfv_t;
    Get_Auxiliary_Effect_Sloti     : Get_Auxiliary_Effect_Sloti_t;
    Get_Auxiliary_Effect_Slotiv    : Get_Auxiliary_Effect_Slotiv_t;
    Get_Effectf                    : Get_Effectf_t;
    Get_Effectfv                   : Get_Effectfv_t;
    Get_Effecti                    : Get_Effecti_t;
    Get_Effectiv                   : Get_Effectiv_t;
    Get_Filterf                    : Get_Filterf_t;
    Get_Filterfv                   : Get_Filterfv_t;
    Get_Filteri                    : Get_Filteri_t;
    Get_Filteriv                   : Get_Filteriv_t;
    Is_Auxiliary_Effect_Slot       : Is_Auxiliary_Effect_Slot_t;
    Is_Effect                      : Is_Effect_t;
    Is_Filter                      : Is_Filter_t;
  end record;

end OpenAL.Extension.EFX_Thin;
