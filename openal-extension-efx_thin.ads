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

  procedure Auxiliary_Effect_Slotf
    (Slot      : Types.Unsigned_Integer_t;
     Parameter : Types.Enumeration_t;
     Value     : Types.Float_t);
  pragma Import (C, Auxiliary_Effect_Slotf, "alAuxiliaryEffectSlotf");

  procedure Auxiliary_Effect_Slotfv
    (Slot      : Types.Unsigned_Integer_t;
     Parameter : Types.Enumeration_t;
     Values    : System.Address);
  pragma Import (C, Auxiliary_Effect_Slotfv, "alAuxiliaryEffectSlotfv");

  procedure Auxiliary_Effect_Sloti
    (Slot      : Types.Unsigned_Integer_t;
     Parameter : Types.Enumeration_t;
     Value     : Types.Integer_t);
  pragma Import (C, Auxiliary_Effect_Sloti, "alAuxiliaryEffectSloti");

  procedure Auxiliary_Effect_Slotiv
    (Slot      : Types.Unsigned_Integer_t;
     Parameter : Types.Enumeration_t;
     Values    : System.Address);
  pragma Import (C, Auxiliary_Effect_Slotiv, "alAuxiliaryEffectSlotiv");

  procedure Delete_Auxiliary_Effect_Slots
    (Size  : Types.Size_t;
     Slots : System.Address);
  pragma Import (C, Delete_Auxiliary_Effect_Slots, "alDeleteAuxiliaryEffectSlots");

  procedure Delete_Effects
    (Size    : Types.Size_t;
     Effects : System.Address);
  pragma Import (C, Delete_Effects, "alDeleteEffects");

  procedure Delete_Filters
    (Size    : Types.Size_t;
     Filters : System.Address);
  pragma Import (C, Delete_Filters, "alDeleteFilters");

  procedure Effectf
    (Effect    : Types.Unsigned_Integer_t;
     Parameter : Types.Enumeration_t;
     Value     : Types.Float_t);
  pragma Import (C, Effectf, "alEffectf");

  procedure Effectfv
    (Effect    : Types.Unsigned_Integer_t;
     Parameter : Types.Enumeration_t;
     Values    : System.Address);
  pragma Import (C, Effectfv, "alEffectfv");

  procedure Effecti
    (Effect    : Types.Unsigned_Integer_t;
     Parameter : Types.Enumeration_t;
     Value     : Types.Integer_t);
  pragma Import (C, Effecti, "alEffecti");

  procedure Effectiv
    (Effect    : Types.Unsigned_Integer_t;
     Parameter : Types.Enumeration_t;
     Values    : System.Address);
  pragma Import (C, Effectiv, "alEffectiv");

  procedure Filterf
    (Filter    : Types.Unsigned_Integer_t;
     Parameter : Types.Enumeration_t;
     Value     : Types.Float_t);
  pragma Import (C, Filterf, "alFilterf");

  procedure Filterfv
    (Filter    : Types.Unsigned_Integer_t;
     Parameter : Types.Enumeration_t;
     Values    : System.Address);
  pragma Import (C, Filterfv, "alFilterfv");

  procedure Filteri
    (Filter    : Types.Unsigned_Integer_t;
     Parameter : Types.Enumeration_t;
     Value     : Types.Integer_t);
  pragma Import (C, Filteri, "alFilteri");

  procedure Filteriv
    (Filter    : Types.Unsigned_Integer_t;
     Parameter : Types.Enumeration_t;
     Values    : System.Address);
  pragma Import (C, Filteriv, "alFilteriv");

  procedure Gen_Auxiliary_Effect_Slots
    (Size  : Types.Size_t;
     Slots : System.Address);
  pragma Import (C, Gen_Auxiliary_Effect_Slots, "alGenAuxiliaryEffectSlots");

  procedure Gen_Effects
    (Size    : Types.Size_t;
     Effects : System.Address);
  pragma Import (C, Gen_Effects, "alGenEffects");

  procedure Gen_Filters
    (Size    : Types.Size_t;
     Filters : System.Address);
  pragma Import (C, Gen_Filters, "alGenFilters");

  procedure Get_Auxiliary_Effect_Slotf
    (Slot      : Types.Unsigned_Integer_t;
     Parameter : Types.Enumeration_t;
     Values    : System.Address);
  pragma Import (C, Get_Auxiliary_Effect_Slotf, "alGetAuxiliaryEffectSlotf");

  procedure Get_Auxiliary_Effect_Slotfv
    (Slot      : Types.Unsigned_Integer_t;
     Parameter : Types.Enumeration_t;
     Values    : System.Address);
  pragma Import (C, Get_Auxiliary_Effect_Slotfv, "alGetAuxiliaryEffectSlotfv");

  procedure Get_Auxiliary_Effect_Sloti
    (Slot      : Types.Unsigned_Integer_t;
     Parameter : Types.Enumeration_t;
     Values    : System.Address);
  pragma Import (C, Get_Auxiliary_Effect_Sloti, "alGetAuxiliaryEffectSloti");

  procedure Get_Auxiliary_Effect_Slotiv
    (Slot      : Types.Unsigned_Integer_t;
     Parameter : Types.Enumeration_t;
     Values    : System.Address);
  pragma Import (C, Get_Auxiliary_Effect_Slotiv, "alGetAuxiliaryEffectSlotiv");

  procedure Get_Effectf
    (Effect    : Types.Unsigned_Integer_t;
     Parameter : Types.Enumeration_t;
     Values    : System.Address);
  pragma Import (C, Get_Effectf, "alGetEffectf");

  procedure Get_Effectfv
    (Effect    : Types.Unsigned_Integer_t;
     Parameter : Types.Enumeration_t;
     Values    : System.Address);
  pragma Import (C, Get_Effectfv, "alGetEffectfv");

  procedure Get_Effecti
    (Effect    : Types.Unsigned_Integer_t;
     Parameter : Types.Enumeration_t;
     Values    : System.Address);
  pragma Import (C, Get_Effecti, "alGetEffecti");

  procedure Get_Effectiv
    (Effect    : Types.Unsigned_Integer_t;
     Parameter : Types.Enumeration_t;
     Values    : System.Address);
  pragma Import (C, Get_Effectiv, "alGetEffectiv");

  procedure Get_Filterf
    (Filter    : Types.Unsigned_Integer_t;
     Parameter : Types.Enumeration_t;
     Values    : System.Address);
  pragma Import (C, Get_Filterf, "alGetFilterf");

  procedure Get_Filterfv
    (Filter    : Types.Unsigned_Integer_t;
     Parameter : Types.Enumeration_t;
     Values    : System.Address);
  pragma Import (C, Get_Filterfv, "alGetFilterfv");

  procedure Get_Filteri
    (Filter    : Types.Unsigned_Integer_t;
     Parameter : Types.Enumeration_t;
     Values    : System.Address);
  pragma Import (C, Get_Filteri, "alGetFilteri");

  procedure Get_Filteriv
    (Filter    : Types.Unsigned_Integer_t;
     Parameter : Types.Enumeration_t;
     Values    : System.Address);
  pragma Import (C, Get_Filteriv, "alGetFilteriv");

  function Is_Auxiliary_Effect_Slot
    (Slot : Types.Unsigned_Integer_t) return Types.Boolean_t;
  pragma Import (C, Is_Auxiliary_Effect_Slot, "alIsAuxiliaryEffectSlot");

  function Is_Effect
    (Effect : Types.Unsigned_Integer_t) return Types.Boolean_t;
  pragma Import (C, Is_Effect, "alIsEffect");

  function Is_Filter
    (Filter : Types.Unsigned_Integer_t) return Types.Boolean_t;
  pragma Import (C, Is_Filter, "alIsFilter");

end OpenAL.Extension.EFX_Thin;
