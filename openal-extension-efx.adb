with OpenAL.Thin;
with OpenAL.ALC_Thin;

package body OpenAL.Extension.EFX is

  --
  -- Auxiliary_Effect_Slot_Is_Valid
  --

  function Auxiliary_Effect_Slot_Is_Valid
    (Extension : in Extension_t;
     Slot      : in Auxiliary_Effect_Slot_t) return Boolean is
  begin
    Check_Loaded (Extension);

    return Boolean
      (Extension.API.Is_Auxiliary_Effect_Slot (Types.Unsigned_Integer_t (Slot)));
  end Auxiliary_Effect_Slot_Is_Valid;

  --
  -- Check_Loaded
  --

  use type Context.Context_t;

  procedure Check_Loaded (Extension : in Extension_t) is
  begin
    if Extension.Loaded = False then
      raise Program_Error with "extension not loaded";
    end if;

    if Extension.Owner_Context /= Context.Get_Current_Context then
      raise Program_Error with "extension was not loaded in the current context";
    end if;
  end Check_Loaded;

  --
  -- Delete_*
  --

  procedure Delete_Auxiliary_Effect_Slots
    (Extension : in Extension_t;
     Slots     : in Auxiliary_Effect_Slot_Array_t) is
  begin
    Check_Loaded (Extension);

    Extension.API.Delete_Auxiliary_Effect_Slots
      (Size  => Slots'Length,
       Slots => Slots (Slots'First)'Address);
  end Delete_Auxiliary_Effect_Slots;

  procedure Delete_Effects
    (Extension : in Extension_t;
     Effects   : in Effect_Array_t) is
  begin
    Check_Loaded (Extension);

    Extension.API.Delete_Effects
      (Size    => Effects'Length,
       Effects => Effects (Effects'First)'Address);
  end Delete_Effects;

  procedure Delete_Filters
    (Extension : in Extension_t;
     Filters   : in Filter_Array_t) is
  begin
    Check_Loaded (Extension);

    Extension.API.Delete_Filters
      (Size    => Filters'Length,
       Filters => Filters (Filters'First)'Address);
  end Delete_Filters;

  --
  -- Effect_Is_Valid
  --

  function Effect_Is_Valid
    (Extension : in Extension_t;
     Effect    : in Effect_t) return Boolean is
  begin
    Check_Loaded (Extension);

    return Boolean (Extension.API.Is_Effect (Types.Unsigned_Integer_t (Effect)));
  end Effect_Is_Valid;

  --
  -- Filter_Is_Valid
  --

  function Filter_Is_Valid
    (Extension : in Extension_t;
     Filter    : in Filter_t) return Boolean is
  begin
    Check_Loaded (Extension);

    return Boolean (Extension.API.Is_Filter (Types.Unsigned_Integer_t (Filter)));
  end Filter_Is_Valid;

  --
  -- Generate_*
  --

  procedure Generate_Auxiliary_Effect_Slots
    (Extension : in     Extension_t;
     Slots     : in out Auxiliary_Effect_Slot_Array_t) is
  begin
    Check_Loaded (Extension);

    Extension.API.Gen_Auxiliary_Effect_Slots
      (Size  => Slots'Length,
       Slots => Slots (Slots'First)'Address);
  end Generate_Auxiliary_Effect_Slots;

  procedure Generate_Effects
    (Extension : in     Extension_t;
     Effects   : in out Effect_Array_t) is
  begin
    Check_Loaded (Extension);

    Extension.API.Gen_Effects
      (Size    => Effects'Length,
       Effects => Effects (Effects'First)'Address);
  end Generate_Effects;

  procedure Generate_Filters
    (Extension : in     Extension_t;
     Filters   : in out Filter_Array_t) is
  begin
    Check_Loaded (Extension);

    Extension.API.Gen_Filters
      (Size    => Filters'Length,
       Filters => Filters (Filters'First)'Address);
  end Generate_Filters;

  --
  -- Get_Effect_Type
  --

  function Get_Effect_Type
    (Extension   : in Extension_t;
     Effect      : in Effect_t) return Effect_Type_t
  is
    Effect_Type : aliased Types.Integer_t;
  begin
    Check_Loaded (Extension);

    Extension.API.Get_Effecti
      (Effect    => Types.Unsigned_Integer_t (Effect),
       Parameter => EFX_Thin.AL_EFFECT_TYPE,
       Value     => Effect_Type'Address);

    return Map_To_Effect_Type (Effect_Type);
  end Get_Effect_Type;

  --
  -- Get_Filter_Type
  --

  function Get_Filter_Type
    (Extension   : in Extension_t;
     Filter      : in Filter_t) return Filter_Type_t
  is
    Filter_Type : aliased Types.Integer_t;
  begin
    Check_Loaded (Extension);

    Extension.API.Get_Filteri
      (Filter    => Types.Unsigned_Integer_t (Filter),
       Parameter => EFX_Thin.AL_FILTER_TYPE,
       Value     => Filter_Type'Address);

    return Map_To_Filter_Type (Filter_Type);
  end Get_Filter_Type;

  --
  -- Get_Major_Version
  --

  function Get_Major_Version
    (Extension : in Extension_t) return Natural
  is
    Value : aliased Types.Integer_t := 0;
  begin
    Check_Loaded (Extension);

    ALC_Thin.Get_Integerv
      (Device => Context.Device_Data (Context.Get_Context_Device (Extension.Owner_Context)),
       Token  => EFX_Thin.ALC_EFX_MAJOR_VERSION,
       Size   => 1,
       Data   => Value'Address);

    return Natural (Value);
  end Get_Major_Version;

  --
  -- Get_Maximum_Auxiliary_Sends
  --

  function Get_Maximum_Auxiliary_Sends
    (Extension : in Extension_t) return Source_Auxiliary_Send_t
  is
    Value : aliased Types.Integer_t := 0;
  begin
    Check_Loaded (Extension);

    ALC_Thin.Get_Integerv
      (Device => Context.Device_Data (Context.Get_Context_Device (Extension.Owner_Context)),
       Token  => EFX_Thin.ALC_MAX_AUXILIARY_SENDS,
       Size   => 1,
       Data   => Value'Address);

    return Source_Auxiliary_Send_t (Value);
  end Get_Maximum_Auxiliary_Sends;

  --
  -- Get_Minor_Version
  --

  function Get_Minor_Version
    (Extension : in Extension_t) return Natural
  is
    Value : aliased Types.Integer_t := 0;
  begin
    Check_Loaded (Extension);

    ALC_Thin.Get_Integerv
      (Device => Context.Device_Data (Context.Get_Context_Device (Extension.Owner_Context)),
       Token  => EFX_Thin.ALC_EFX_MAJOR_VERSION,
       Size   => 1,
       Data   => Value'Address);

    return Natural (Value);
  end Get_Minor_Version;

  --
  -- Is_Present
  --

  function Is_Present (Device : in Context.Device_t) return Boolean is
  begin
    return Context.Is_Extension_Present
      (Device => Device,
       Name   => "ALC_EXT_EFX");
  end Is_Present;

  --
  -- Load_Extension
  --

  function Load_Extension return Extension_t is
    Current_Context : Context.Context_t;
  begin
    Current_Context := Context.Get_Current_Context;
    if Current_Context = Context.Invalid_Context then
      raise Program_Error with "no current context";
    end if;

    return Extension_t'
      (Owner_Context => Current_Context,
       API           => EFX_Thin.Load_API,
       Loaded        => True);
  end Load_Extension;

  --
  -- Map_To_Effect_Type
  --

  function Map_To_Effect_Type (Effect_Type : in Types.Integer_t) return Effect_Type_t is
    Value : Effect_Type_t;
  begin
    case Effect_Type is
      when EFX_Thin.AL_EFFECT_NULL              => Value := Null_Effect;
      when EFX_Thin.AL_EFFECT_REVERB            => Value := Reverb;
      when EFX_Thin.AL_EFFECT_CHORUS            => Value := Chorus;
      when EFX_Thin.AL_EFFECT_DISTORTION        => Value := Distortion;
      when EFX_Thin.AL_EFFECT_ECHO              => Value := Echo;
      when EFX_Thin.AL_EFFECT_FLANGER           => Value := Flanger;
      when EFX_Thin.AL_EFFECT_FREQUENCY_SHIFTER => Value := Frequency_Shifter;
      when EFX_Thin.AL_EFFECT_VOCAL_MORPHER     => Value := Vocal_Morpher;
      when EFX_Thin.AL_EFFECT_PITCH_SHIFTER     => Value := Pitch_Shifter;
      when EFX_Thin.AL_EFFECT_RING_MODULATOR    => Value := Ring_Modulator;
      when EFX_Thin.AL_EFFECT_AUTOWAH           => Value := Autowah;
      when EFX_Thin.AL_EFFECT_COMPRESSOR        => Value := Compressor;
      when EFX_Thin.AL_EFFECT_EQUALIZER         => Value := Equalizer;
      when EFX_Thin.AL_EFFECT_EAXREVERB         => Value := EAX_Reverb;
      when others                               => Value := Unknown_Effect;
    end case;

    return Value;
  end Map_To_Effect_Type;

  --
  -- Map_To_Filter_Type
  --

  function Map_To_Filter_Type (Filter_Type : in Types.Integer_t) return Filter_Type_t is
    Value : Filter_Type_t;
  begin
    case Filter_Type is
      when EFX_Thin.AL_FILTER_NULL     => Value := Null_Filter;
      when EFX_Thin.AL_FILTER_LOWPASS  => Value := Low_Pass_Filter;
      when EFX_Thin.AL_FILTER_HIGHPASS => Value := High_Pass_Filter;
      when EFX_Thin.AL_FILTER_BANDPASS => Value := Band_Pass_Filter;
      when others                      => Value := Unknown_Filter;
    end case;

    return Value;
  end Map_To_Filter_Type;

  --
  -- Set_Air_Absorption_Factor
  --

  procedure Set_Air_Absorption_Factor
    (Extension : in Extension_t;
     Source    : in OpenAL.Source.Source_t;
     Factor    : in Air_Absorption_Factor_t) is
  begin
    Check_Loaded (Extension);

    Thin.Sourcef
      (Source_ID => OpenAL.Source.To_Integer (Source),
       Parameter => EFX_Thin.AL_AIR_ABSORPTION_FACTOR,
       Value     => Types.Float_t (Factor));
  end Set_Air_Absorption_Factor;

  --
  -- Set_Auxiliary_Effect_Slot_Auto_Send
  --

  procedure Set_Auxiliary_Effect_Slot_Auto_Send
    (Extension : in Extension_t;
     Slot      : in Auxiliary_Effect_Slot_t;
     Enable    : in Boolean) is
  begin
    Check_Loaded (Extension);

    Extension.API.Auxiliary_Effect_Sloti
      (Slot      => Types.Unsigned_Integer_t (Slot),
       Parameter => EFX_Thin.AL_EFFECTSLOT_AUXILIARY_SEND_AUTO,
       Value     => Types.Integer_t (Boolean'Pos (Enable)));
  end Set_Auxiliary_Effect_Slot_Auto_Send;

  --
  -- Set_Auxiliary_Effect_Slot_Effect
  --

  procedure Set_Auxiliary_Effect_Slot_Effect
    (Extension : in Extension_t;
     Slot      : in Auxiliary_Effect_Slot_t;
     Effect    : in Effect_t) is
  begin
    Check_Loaded (Extension);

    Extension.API.Auxiliary_Effect_Sloti
      (Slot      => Types.Unsigned_Integer_t (Slot),
       Parameter => EFX_Thin.AL_EFFECTSLOT_EFFECT,
       Value     => Types.Integer_t (Effect));
  end Set_Auxiliary_Effect_Slot_Effect;

  --
  -- Set_Auxiliary_Effect_Slot_Gain
  --

  procedure Set_Auxiliary_Effect_Slot_Gain
    (Extension : in Extension_t;
     Slot      : in Auxiliary_Effect_Slot_t;
     Gain      : in Gain_t) is
  begin
    Check_Loaded (Extension);

    Extension.API.Auxiliary_Effect_Slotf
      (Slot      => Types.Unsigned_Integer_t (Slot),
       Parameter => EFX_Thin.AL_EFFECTSLOT_GAIN,
       Value     => Gain);
  end Set_Auxiliary_Effect_Slot_Gain;

  --
  -- Set_Auxiliary_Send_Filter
  --

  procedure Set_Auxiliary_Send_Filter
    (Extension   : in Extension_t;
     Source      : in OpenAL.Source.Source_t;
     Slot        : in Auxiliary_Effect_Slot_t;
     Source_Send : in Source_Auxiliary_Send_t := 0;
     Filter      : in Filter_t                := No_Filter) is
  begin
    Check_Loaded (Extension);

    Thin.Source_3i
      (Source_ID => OpenAL.Source.To_Integer (Source),
       Parameter => EFX_Thin.AL_AUXILIARY_SEND_FILTER,
       Value_1   => Types.Integer_t (Slot),
       Value_2   => Types.Integer_t (Source_Send),
       Value_3   => Types.Integer_t (Filter));
  end Set_Auxiliary_Send_Filter;

  --
  -- Set_Auxiliary_Send_Filter_Gain_Auto
  --

  procedure Set_Auxiliary_Send_Filter_Gain_Auto
    (Extension : in Extension_t;
     Source    : in OpenAL.Source.Source_t;
     Enable    : in Boolean) is
  begin
    Check_Loaded (Extension);

    Thin.Sourcei
      (Source_ID => OpenAL.Source.To_Integer (Source),
       Parameter => EFX_Thin.AL_AUXILIARY_SEND_FILTER_GAIN_AUTO,
       Value     => Types.Integer_t (Boolean'Pos (Enable)));
  end Set_Auxiliary_Send_Filter_Gain_Auto;

  --
  -- Set_Auxiliary_Send_Filter_Gain_HF_Auto
  --

  procedure Set_Auxiliary_Send_Filter_Gain_HF_Auto
    (Extension : in Extension_t;
     Source    : in OpenAL.Source.Source_t;
     Enable    : in Boolean) is
  begin
    Check_Loaded (Extension);

    Thin.Sourcei
      (Source_ID => OpenAL.Source.To_Integer (Source),
       Parameter => EFX_Thin.AL_AUXILIARY_SEND_FILTER_GAINHF_AUTO,
       Value     => Types.Integer_t (Boolean'Pos (Enable)));
  end Set_Auxiliary_Send_Filter_Gain_HF_Auto;

  --
  -- Set_Cone_Outer_Gain_HF
  --

  procedure Set_Cone_Outer_Gain_HF
    (Extension : in Extension_t;
     Source    : in OpenAL.Source.Source_t;
     Factor    : in Cone_Outer_Gain_HF_Factor_t) is
  begin
    Check_Loaded (Extension);

    Thin.Sourcef
      (Source_ID => OpenAL.Source.To_Integer (Source),
       Parameter => EFX_Thin.AL_CONE_OUTER_GAINHF,
       Value     => Types.Float_t (Factor));
  end Set_Cone_Outer_Gain_HF;

  --
  -- Set_Direct_Filter
  --

  procedure Set_Direct_Filter
    (Extension : in Extension_t;
     Source    : in OpenAL.Source.Source_t;
     Filter    : in Filter_t) is
  begin
    Check_Loaded (Extension);

    Thin.Sourcei
      (Source_ID => OpenAL.Source.To_Integer (Source),
       Parameter => EFX_Thin.AL_DIRECT_FILTER,
       Value     => Types.Integer_t (Filter));
  end Set_Direct_Filter;

  --
  -- Set_Direct_Filter_Gain_HF_Auto
  --

  procedure Set_Direct_Filter_Gain_HF_Auto
    (Extension : in Extension_t;
     Source    : in OpenAL.Source.Source_t;
     Enable    : in Boolean) is
  begin
    Check_Loaded (Extension);

    Thin.Sourcei
      (Source_ID => OpenAL.Source.To_Integer (Source),
       Parameter => EFX_Thin.AL_DIRECT_FILTER_GAINHF_AUTO,
       Value     => Types.Integer_t (Boolean'Pos (Enable)));
  end Set_Direct_Filter_Gain_HF_Auto;

  --
  -- Set_Effect_Parameter
  --

  type Map_Effect_Parameter_t is array (Effect_Parameter_t) of Types.Enumeration_t;

  Map_Effect_Parameter : constant Map_Effect_Parameter_t :=
   (Autowah_Attack_Time                   => EFX_Thin.AL_AUTOWAH_ATTACK_TIME,
    Autowah_Peak_Gain                     => EFX_Thin.AL_AUTOWAH_PEAK_GAIN,
    Autowah_Release_Time                  => EFX_Thin.AL_AUTOWAH_RELEASE_TIME,
    Autowah_Resonance                     => EFX_Thin.AL_AUTOWAH_RESONANCE,
    Chorus_Delay                          => EFX_Thin.AL_CHORUS_DELAY,
    Chorus_Depth                          => EFX_Thin.AL_CHORUS_DEPTH,
    Chorus_Feedback                       => EFX_Thin.AL_CHORUS_FEEDBACK,
    Chorus_Phase                          => EFX_Thin.AL_CHORUS_PHASE,
    Chorus_Rate                           => EFX_Thin.AL_CHORUS_RATE,
    Chorus_Waveform                       => EFX_Thin.AL_CHORUS_WAVEFORM,
    Distortion_Edge                       => EFX_Thin.AL_DISTORTION_EDGE,
    Distortion_EQ_Bandwidth               => EFX_Thin.AL_DISTORTION_EQBANDWIDTH,
    Distortion_EQ_Center                  => EFX_Thin.AL_DISTORTION_EQCENTER,
    Distortion_Gain                       => EFX_Thin.AL_DISTORTION_GAIN,
    Distortion_Lowpass_Cutoff             => EFX_Thin.AL_DISTORTION_LOWPASS_CUTOFF,
    EAX_Reverb_Air_Absorption_Gain_HF     => EFX_Thin.AL_EAXREVERB_AIR_ABSORPTION_GAINHF,
    EAX_Reverb_Decay_HF_Limit             => EFX_Thin.AL_EAXREVERB_DECAY_HFLIMIT,
    EAX_Reverb_Decay_HF_Ratio             => EFX_Thin.AL_EAXREVERB_DECAY_HFRATIO,
    EAX_Reverb_Decay_LF_Ratio             => EFX_Thin.AL_EAXREVERB_DECAY_LFRATIO,
    EAX_Reverb_Decay_Time                 => EFX_Thin.AL_EAXREVERB_DECAY_TIME,
    EAX_Reverb_Density                    => EFX_Thin.AL_EAXREVERB_DENSITY,
    EAX_Reverb_Diffusion                  => EFX_Thin.AL_EAXREVERB_DIFFUSION,
    EAX_Reverb_Echo_Depth                 => EFX_Thin.AL_EAXREVERB_ECHO_DEPTH,
    EAX_Reverb_Echo_Time                  => EFX_Thin.AL_EAXREVERB_ECHO_TIME,
    EAX_Reverb_Gain                       => EFX_Thin.AL_EAXREVERB_GAIN,
    EAX_Reverb_Gain_HF                    => EFX_Thin.AL_EAXREVERB_GAINHF,
    EAX_Reverb_Gain_LF                    => EFX_Thin.AL_EAXREVERB_GAINLF,
    EAX_Reverb_HF_Reference               => EFX_Thin.AL_EAXREVERB_HFREFERENCE,
    EAX_Reverb_Late_Reverb_Delay          => EFX_Thin.AL_EAXREVERB_LATE_REVERB_DELAY,
    EAX_Reverb_Late_Reverb_Gain           => EFX_Thin.AL_EAXREVERB_LATE_REVERB_GAIN,
    EAX_Reverb_Late_Reverb_Pan            => EFX_Thin.AL_EAXREVERB_LATE_REVERB_PAN,
    EAX_Reverb_LF_Reference               => EFX_Thin.AL_EAXREVERB_LFREFERENCE,
    EAX_Reverb_Modulation_Depth           => EFX_Thin.AL_EAXREVERB_MODULATION_DEPTH,
    EAX_Reverb_Modulation_Time            => EFX_Thin.AL_EAXREVERB_MODULATION_TIME,
    EAX_Reverb_Reflections_Delay          => EFX_Thin.AL_EAXREVERB_REFLECTIONS_DELAY,
    EAX_Reverb_Reflections_Gain           => EFX_Thin.AL_EAXREVERB_REFLECTIONS_GAIN,
    EAX_Reverb_Reflections_Pan            => EFX_Thin.AL_EAXREVERB_REFLECTIONS_PAN,
    EAX_Reverb_Room_Rolloff_Factor        => EFX_Thin.AL_EAXREVERB_ROOM_ROLLOFF_FACTOR,
    Echo_Damping                          => EFX_Thin.AL_ECHO_DAMPING,
    Echo_Delay                            => EFX_Thin.AL_ECHO_DELAY,
    Echo_Feedback                         => EFX_Thin.AL_ECHO_FEEDBACK,
    Echo_LR_Delay                         => EFX_Thin.AL_ECHO_LRDELAY,
    Echo_Spread                           => EFX_Thin.AL_ECHO_SPREAD,
    Equalizer_High_Cutoff                 => EFX_Thin.AL_EQUALIZER_HIGH_CUTOFF,
    Equalizer_High_Gain                   => EFX_Thin.AL_EQUALIZER_HIGH_GAIN,
    Equalizer_Low_Cutoff                  => EFX_Thin.AL_EQUALIZER_LOW_CUTOFF,
    Equalizer_Low_Gain                    => EFX_Thin.AL_EQUALIZER_LOW_GAIN,
    Equalizer_Mid1_Center                 => EFX_Thin.AL_EQUALIZER_MID1_CENTER,
    Equalizer_Mid1_Gain                   => EFX_Thin.AL_EQUALIZER_MID1_GAIN,
    Equalizer_Mid1_Width                  => EFX_Thin.AL_EQUALIZER_MID1_WIDTH,
    Equalizer_Mid2_Center                 => EFX_Thin.AL_EQUALIZER_MID2_CENTER,
    Equalizer_Mid2_Gain                   => EFX_Thin.AL_EQUALIZER_MID2_GAIN,
    Equalizer_Mid2_Width                  => EFX_Thin.AL_EQUALIZER_MID2_WIDTH,
    Flanger_Delay                         => EFX_Thin.AL_FLANGER_DELAY,
    Flanger_Depth                         => EFX_Thin.AL_FLANGER_DEPTH,
    Flanger_Feedback                      => EFX_Thin.AL_FLANGER_FEEDBACK,
    Flanger_Phase                         => EFX_Thin.AL_FLANGER_PHASE,
    Flanger_Rate                          => EFX_Thin.AL_FLANGER_RATE,
    Flanger_Waveform                      => EFX_Thin.AL_FLANGER_WAVEFORM,
    Frequency_Shifter_Frequency           => EFX_Thin.AL_FREQUENCY_SHIFTER_FREQUENCY,
    Frequency_Shifter_Left_Direction      => EFX_Thin.AL_FREQUENCY_SHIFTER_LEFT_DIRECTION,
    Frequency_Shifter_Right_Direction     => EFX_Thin.AL_FREQUENCY_SHIFTER_RIGHT_DIRECTION,
    Pitch_Shifter_Coarse_Tune             => EFX_Thin.AL_PITCH_SHIFTER_COARSE_TUNE,
    Pitch_Shifter_Fine_Tune               => EFX_Thin.AL_PITCH_SHIFTER_FINE_TUNE,
    Reverb_Air_Absorption_Gain_HF         => EFX_Thin.AL_REVERB_AIR_ABSORPTION_GAINHF,
    Reverb_Decay_HF_Limit                 => EFX_Thin.AL_REVERB_DECAY_HFLIMIT,
    Reverb_Decay_HF_Ratio                 => EFX_Thin.AL_REVERB_DECAY_HFRATIO,
    Reverb_Decay_Time                     => EFX_Thin.AL_REVERB_DECAY_TIME,
    Reverb_Density                        => EFX_Thin.AL_REVERB_DENSITY,
    Reverb_Diffusion                      => EFX_Thin.AL_REVERB_DIFFUSION,
    Reverb_Gain                           => EFX_Thin.AL_REVERB_GAIN,
    Reverb_Gain_HF                        => EFX_Thin.AL_REVERB_GAINHF,
    Reverb_Late_Reverb_Delay              => EFX_Thin.AL_REVERB_LATE_REVERB_DELAY,
    Reverb_Late_Reverb_Gain               => EFX_Thin.AL_REVERB_LATE_REVERB_GAIN,
    Reverb_Reflections_Delay              => EFX_Thin.AL_REVERB_REFLECTIONS_DELAY,
    Reverb_Reflections_Gain               => EFX_Thin.AL_REVERB_REFLECTIONS_GAIN,
    Reverb_Room_Rolloff_Factor            => EFX_Thin.AL_REVERB_ROOM_ROLLOFF_FACTOR,
    Ring_Modulator_Frequency              => EFX_Thin.AL_RING_MODULATOR_FREQUENCY,
    Ring_Modulator_Highpass_Cutoff        => EFX_Thin.AL_RING_MODULATOR_HIGHPASS_CUTOFF,
    Ring_Modulator_Waveform               => EFX_Thin.AL_RING_MODULATOR_WAVEFORM,
    Vocal_Morpher_Phoneme_A               => EFX_Thin.AL_VOCAL_MORPHER_PHONEMEA,
    Vocal_Morpher_Phoneme_A_Coarse_Tuning => EFX_Thin.AL_VOCAL_MORPHER_PHONEMEA_COARSE_TUNING,
    Vocal_Morpher_Phoneme_B               => EFX_Thin.AL_VOCAL_MORPHER_PHONEMEB,
    Vocal_Morpher_Phoneme_B_Coarse_Tuning => EFX_Thin.AL_VOCAL_MORPHER_PHONEMEB_COARSE_TUNING,
    Vocal_Morpher_Rate                    => EFX_Thin.AL_VOCAL_MORPHER_RATE,
    Vocal_Morpher_Waveform                => EFX_Thin.AL_VOCAL_MORPHER_WAVEFORM,
    Compressor_On_Off                     => EFX_Thin.AL_COMPRESSOR_ONOFF);

  procedure Set_Effect_Parameter
    (Extension   : in Extension_t;
     Effect      : in Effect_t;
     Parameter   : in Effect_Parameter_t;
     Value       : in Types.Float_t) is
  begin
    Check_Loaded (Extension);

    Extension.API.Effectf
      (Effect    => Types.Unsigned_Integer_t (Effect),
       Parameter => Map_Effect_Parameter (Parameter),
       Value     => Value);
  end Set_Effect_Parameter;

  --
  -- Set_Effect_Type
  --

  type Map_Effect_Type_t is array (Valid_Effect_Type_t) of Types.Integer_t;

  Map_Effect_Type : constant Map_Effect_Type_t :=
    (Reverb            => EFX_Thin.AL_EFFECT_REVERB,
     Chorus            => EFX_Thin.AL_EFFECT_CHORUS,
     Distortion        => EFX_Thin.AL_EFFECT_DISTORTION,
     Echo              => EFX_Thin.AL_EFFECT_ECHO,
     Flanger           => EFX_Thin.AL_EFFECT_FLANGER,
     Frequency_Shifter => EFX_Thin.AL_EFFECT_FREQUENCY_SHIFTER,
     Vocal_Morpher     => EFX_Thin.AL_EFFECT_VOCAL_MORPHER,
     Pitch_Shifter     => EFX_Thin.AL_EFFECT_PITCH_SHIFTER,
     Ring_Modulator    => EFX_Thin.AL_EFFECT_RING_MODULATOR,
     Autowah           => EFX_Thin.AL_EFFECT_AUTOWAH,
     Compressor        => EFX_Thin.AL_EFFECT_COMPRESSOR,
     Equalizer         => EFX_Thin.AL_EFFECT_EQUALIZER,
     EAX_Reverb        => EFX_Thin.AL_EFFECT_EAXREVERB);

  procedure Set_Effect_Type
    (Extension   : in Extension_t;
     Effect      : in Effect_t;
     Effect_Type : in Valid_Effect_Type_t) is
  begin
    Check_Loaded (Extension);

    Extension.API.Effecti
      (Effect    => Types.Unsigned_Integer_t (Effect),
       Parameter => EFX_Thin.AL_EFFECT_TYPE,
       Value     => Map_Effect_Type (Effect_Type));
  end Set_Effect_Type;

  --
  -- Set_Filter_Parameter
  --

  type Map_Filter_Parameter_t is array (Filter_Parameter_t) of Types.Enumeration_t;

  Map_Filter_Parameter : constant Map_Filter_Parameter_t :=
    (Low_Pass_Gain     => EFX_Thin.AL_LOWPASS_GAIN,
     Low_Pass_Gain_HF  => EFX_Thin.AL_LOWPASS_GAINHF,
     High_Pass_Gain    => EFX_Thin.AL_HIGHPASS_GAIN,
     High_Pass_Gain_LF => EFX_Thin.AL_HIGHPASS_GAINLF,
     Band_Pass_Gain    => EFX_Thin.AL_BANDPASS_GAIN,
     Band_Pass_Gain_LF => EFX_Thin.AL_BANDPASS_GAINLF,
     Band_Pass_Gain_HF => EFX_Thin.AL_BANDPASS_GAINHF);

  procedure Set_Filter_Parameter
    (Extension   : in Extension_t;
     Filter      : in Filter_t;
     Parameter   : in Filter_Parameter_t;
     Value       : in Types.Float_t) is
  begin
    Check_Loaded (Extension);

    Extension.API.Filterf
      (Filter    => Types.Unsigned_Integer_t (Filter),
       Parameter => Map_Filter_Parameter (Parameter),
       Value     => Value);
  end Set_Filter_Parameter;

  --
  -- Set_Filter_Type
  --

  type Map_Filter_Type_t is array (Valid_Filter_Type_t) of Types.Integer_t;

  Map_Filter_Type : constant Map_Filter_Type_t :=
    (Low_Pass_Filter  => EFX_Thin.AL_FILTER_LOWPASS,
     Band_Pass_Filter => EFX_Thin.AL_FILTER_BANDPASS,
     High_Pass_Filter => EFX_Thin.AL_FILTER_HIGHPASS);

  procedure Set_Filter_Type
    (Extension   : in Extension_t;
     Filter      : in Filter_t;
     Filter_Type : in Valid_Filter_Type_t) is
  begin
    Check_Loaded (Extension);

    Extension.API.Filteri
      (Filter    => Types.Unsigned_Integer_t (Filter),
       Parameter => EFX_Thin.AL_FILTER_TYPE,
       Value     => Map_Filter_Type (Filter_Type));
  end Set_Filter_Type;

  --
  -- Set_Meters_Per_Unit
  --

  procedure Set_Meters_Per_Unit
    (Extension : in Extension_t;
     Meters    : in Meters_t) is
  begin
    Check_Loaded (Extension);

    Thin.Listenerf
      (Parameter => EFX_Thin.AL_METERS_PER_UNIT,
       Value     => Types.Float_t (Meters));
  end Set_Meters_Per_Unit;

  --
  -- Set_Room_Rolloff_Factor
  --

  procedure Set_Room_Rolloff_Factor
    (Extension : in Extension_t;
     Source    : in OpenAL.Source.Source_t;
     Factor    : in Room_Rolloff_Factor_t) is
  begin
    Check_Loaded (Extension);

    Thin.Sourcef
      (Source_ID => OpenAL.Source.To_Integer (Source),
       Parameter => EFX_Thin.AL_ROOM_ROLLOFF_FACTOR,
       Value     => Types.Float_t (Factor));
  end Set_Room_Rolloff_Factor;

end OpenAL.Extension.EFX;
