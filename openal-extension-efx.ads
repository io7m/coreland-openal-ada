with OpenAL.Context;
with OpenAL.Types;

private with OpenAL.Extension.EFX_Thin;

package OpenAL.Extension.EFX is

  type Extension_t is private;

  function Is_Present (Device : in Context.Device_t) return Boolean;

  function Load_Extension return Extension_t;

  --
  -- Effects.
  --

  type Effect_t       is private;
  type Effect_Array_t is array (Positive range <>) of Effect_t;

  No_Effect : constant Effect_t;

  type Effect_Type_t is
    (Unknown_Effect,
     Null_Effect,
     Reverb,
     Chorus,
     Distortion,
     Echo,
     Flanger,
     Frequency_Shifter,
     Vocal_Morpher,
     Pitch_Shifter,
     Ring_Modulator,
     Autowah,
     Compressor,
     Equalizer,
     EAX_Reverb);

  subtype Valid_Effect_Type_t is Effect_Type_t range Reverb .. Effect_Type_t'Last;

  -- proc_map : alGenEffects
  procedure Generate_Effects
    (Extension : in     Extension_t;
     Effects   : in out Effect_Array_t);

  -- proc_map : alDeleteEffects
  procedure Delete_Effects
    (Extension : in Extension_t;
     Effects   : in Effect_Array_t);

  -- proc_map : alIsEffect
  function Effect_Is_Valid
    (Extension : in Extension_t;
     Effect    : in Effect_t) return Boolean;

  -- proc_map : alEffecti
  procedure Set_Effect_Type
    (Extension   : in Extension_t;
     Effect      : in Effect_t;
     Effect_Type : in Valid_Effect_Type_t);

  -- proc_map : alEffecti
  function Get_Effect_Type
    (Extension   : in Extension_t;
     Effect      : in Effect_t) return Effect_Type_t;

  type Effect_Parameter_t is
   (Autowah_Attack_Time,
    Autowah_Peak_Gain,
    Autowah_Release_Time,
    Autowah_Resonance,
    Chorus_Delay,
    Chorus_Depth,
    Chorus_Feedback,
    Chorus_Phase,
    Chorus_Rate,
    Chorus_Waveform,
    Distortion_Edge,
    Distortion_EQ_Bandwidth,
    Distortion_EQ_Center,
    Distortion_Gain,
    Distortion_Lowpass_Cutoff,
    EAX_Reverb_Air_Absorption_Gain_HF,
    EAX_Reverb_Decay_HF_Limit,
    EAX_Reverb_Decay_HF_Ratio,
    EAX_Reverb_Decay_LF_Ratio,
    EAX_Reverb_Decay_Time,
    EAX_Reverb_Density,
    EAX_Reverb_Diffusion,
    EAX_Reverb_Echo_Depth,
    EAX_Reverb_Echo_Time,
    EAX_Reverb_Gain,
    EAX_Reverb_Gain_HF,
    EAX_Reverb_Gain_LF,
    EAX_Reverb_HF_Reference,
    EAX_Reverb_Late_Reverb_Delay,
    EAX_Reverb_Late_Reverb_Gain,
    EAX_Reverb_Late_Reverb_Pan,
    EAX_Reverb_LF_Reference,
    EAX_Reverb_Modulation_Depth,
    EAX_Reverb_Modulation_Time,
    EAX_Reverb_Reflections_Delay,
    EAX_Reverb_Reflections_Gain,
    EAX_Reverb_Reflections_Pan,
    EAX_Reverb_Room_Rolloff_Factor,
    Echo_Damping,
    Echo_Delay,
    Echo_Feedback,
    Echo_LR_Delay,
    Echo_Spread,
    Equalizer_High_Cutoff,
    Equalizer_High_Gain,
    Equalizer_Low_Cutoff,
    Equalizer_Low_Gain,
    Equalizer_Mid1_Center,
    Equalizer_Mid1_Gain,
    Equalizer_Mid1_Width,
    Equalizer_Mid2_Center,
    Equalizer_Mid2_Gain,
    Equalizer_Mid2_Width,
    Flanger_Delay,
    Flanger_Depth,
    Flanger_Feedback,
    Flanger_Phase,
    Flanger_Rate,
    Flanger_Waveform,
    Frequency_Shifter_Frequency,
    Frequency_Shifter_Left_Direction,
    Frequency_Shifter_Right_Direction,
    Pitch_Shifter_Coarse_Tune,
    Pitch_Shifter_Fine_Tune,
    Reverb_Air_Absorption_Gain_HF,
    Reverb_Decay_HF_Limit,
    Reverb_Decay_HF_Ratio,
    Reverb_Decay_Time,
    Reverb_Density,
    Reverb_Diffusion,
    Reverb_Gain,
    Reverb_Gainhf,
    Reverb_Late_Reverb_Delay,
    Reverb_Late_Reverb_Gain,
    Reverb_Reflections_Delay,
    Reverb_Reflections_Gain,
    Reverb_Room_Rolloff_Factor,
    Ring_Modulator_Frequency,
    Ring_Modulator_Highpass_Cutoff,
    Ring_Modulator_Waveform,
    Vocal_Morpher_Phoneme_A,
    Vocal_Morpher_Phoneme_A_Coarse_Tuning,
    Vocal_Morpher_Phoneme_B,
    Vocal_Morpher_Phoneme_B_Coarse_Tuning,
    Vocal_Morpher_Rate,
    Vocal_Morpher_Waveform,
    Compressor_On_Off);

  -- proc_map : alEffectf
  procedure Set_Effect_Parameter
    (Extension   : in Extension_t;
     Effect      : in Effect_t;
     Parameter   : in Effect_Parameter_t;
     Value       : in Types.Float_t);

  --
  -- Filters.
  --

  type Filter_t       is private;
  type Filter_Array_t is array (Positive range <>) of Filter_t;

  No_Filter : constant Filter_t;

  -- proc_map : alGenFilters
  procedure Generate_Filters
    (Extension : in     Extension_t;
     Filters   : in out Filter_Array_t);

  -- proc_map : alDeleteFilters
  procedure Delete_Filters
    (Extension : in Extension_t;
     Filters   : in Filter_Array_t);

  -- proc_map : alIsFilter
  function Filter_Is_Valid
    (Extension : in Extension_t;
     Filter    : in Filter_t) return Boolean;

  type Filter_Type_t is
    (Unknown_Filter,
     Null_Filter,
     Low_Pass_Filter,
     Band_Pass_Filter,
     High_Pass_Filter);

  subtype Valid_Filter_Type_t is Filter_Type_t range Low_Pass_Filter .. Filter_Type_t'Last;

  -- proc_map : alFilteri
  procedure Set_Filter_Type
    (Extension   : in Extension_t;
     Filter      : in Filter_t;
     Filter_Type : in Valid_Filter_Type_t);

  -- proc_map : alFilteri
  function Get_Filter_Type
    (Extension   : in Extension_t;
     Filter      : in Filter_t) return Filter_Type_t;

  type Filter_Parameter_t is
    (Low_Pass_Gain,
     Low_Pass_Gain_HF,
     High_Pass_Gain,
     High_Pass_Gain_LF,
     Band_Pass_Gain,
     Band_Pass_Gain_LF,
     Band_Pass_Gain_HF);

  -- proc_map : alFilterf
  procedure Set_Filter_Parameter
    (Extension   : in Extension_t;
     Filter      : in Filter_t;
     Parameter   : in Filter_Parameter_t;
     Value       : in Types.Float_t);

  --
  -- Auxiliary_Effect_Slots.
  --

  type Auxiliary_Effect_Slot_t       is private;
  type Auxiliary_Effect_Slot_Array_t is array (Positive range <>) of Auxiliary_Effect_Slot_t;

  No_Auxiliary_Effect_Slot : constant Auxiliary_Effect_Slot_t;

  -- proc_map : alGenAuxiliaryEffectSlots
  procedure Generate_Auxiliary_Effect_Slots
    (Extension : in     Extension_t;
     Slots     : in out Auxiliary_Effect_Slot_Array_t);

  -- proc_map : alDeleteAuxiliaryEffectSlots
  procedure Delete_Auxiliary_Effect_Slots
    (Extension : in Extension_t;
     Slots     : in Auxiliary_Effect_Slot_Array_t);

  -- proc_map : alIsAuxiliaryEffectSlot
  function Auxiliary_Effect_Slot_Is_Valid
    (Extension : in Extension_t;
     Slot      : in Auxiliary_Effect_Slot_t) return Boolean;

private

  type Effect_t is new Types.Unsigned_Integer_t;

  No_Effect : constant Effect_t := 0;

  type Filter_t is new Types.Unsigned_Integer_t;

  No_Filter : constant Filter_t := 0;

  type Auxiliary_Effect_Slot_t is new Types.Unsigned_Integer_t;

  No_Auxiliary_Effect_Slot : constant Auxiliary_Effect_Slot_t := 0;

  type Extension_t is record
    Owner_Context : Context.Context_t := Context.Invalid_Context;
    Loaded        : Boolean           := False;
    API           : EFX_Thin.API_t;
  end record;

  procedure Check_Loaded (Extension : in Extension_t);

end OpenAL.Extension.EFX;
