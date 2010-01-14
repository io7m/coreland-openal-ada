-- Automatically generated, do not edit.

with System;
with OpenAL.Types;

package OpenAL.Extension.EFX_Thin is

  AL_AUTOWAH_ATTACK_TIME                           : constant := 16#0001#;
  AL_AUTOWAH_DEFAULT_ATTACK_TIME                   : constant := 0.06;
  AL_AUTOWAH_DEFAULT_PEAK_GAIN                     : constant := 11.22;
  AL_AUTOWAH_DEFAULT_RELEASE_TIME                  : constant := 0.06;
  AL_AUTOWAH_DEFAULT_RESONANCE                     : constant := 1000.0;
  AL_AUTOWAH_MAX_ATTACK_TIME                       : constant := 1.0;
  AL_AUTOWAH_MAX_PEAK_GAIN                         : constant := 31621.0;
  AL_AUTOWAH_MAX_RELEASE_TIME                      : constant := 1.0;
  AL_AUTOWAH_MAX_RESONANCE                         : constant := 1000.0;
  AL_AUTOWAH_MIN_ATTACK_TIME                       : constant := 0.0001;
  AL_AUTOWAH_MIN_PEAK_GAIN                         : constant := 0.00003;
  AL_AUTOWAH_MIN_RELEASE_TIME                      : constant := 0.0001;
  AL_AUTOWAH_MIN_RESONANCE                         : constant := 2.0;
  AL_AUTOWAH_PEAK_GAIN                             : constant := 16#0004#;
  AL_AUTOWAH_RELEASE_TIME                          : constant := 16#0002#;
  AL_AUTOWAH_RESONANCE                             : constant := 16#0003#;
  AL_BANDPASS_GAIN                                 : constant := 16#0001#;
  AL_BANDPASS_GAINHF                               : constant := 16#0003#;
  AL_BANDPASS_GAINLF                               : constant := 16#0002#;
  AL_CHORUS_DEFAULT_DELAY                          : constant := 0.016;
  AL_CHORUS_DEFAULT_DEPTH                          : constant := 0.1;
  AL_CHORUS_DEFAULT_FEEDBACK                       : constant := 0.25;
  AL_CHORUS_DEFAULT_PHASE                          : constant := 16#90#;
  AL_CHORUS_DEFAULT_RATE                           : constant := 1.1;
  AL_CHORUS_DEFAULT_WAVEFORM                       : constant := 16#1#;
  AL_CHORUS_DELAY                                  : constant := 16#0006#;
  AL_CHORUS_DEPTH                                  : constant := 16#0004#;
  AL_CHORUS_FEEDBACK                               : constant := 16#0005#;
  AL_CHORUS_MAX_DELAY                              : constant := 0.016;
  AL_CHORUS_MAX_DEPTH                              : constant := 1.0;
  AL_CHORUS_MAX_FEEDBACK                           : constant := 1.0;
  AL_CHORUS_MAX_PHASE                              : constant := 16#180#;
  AL_CHORUS_MAX_RATE                               : constant := 10.0;
  AL_CHORUS_MAX_WAVEFORM                           : constant := 16#1#;
  AL_CHORUS_MIN_DELAY                              : constant := 0.0;
  AL_CHORUS_MIN_DEPTH                              : constant := 0.0;
  AL_CHORUS_MIN_FEEDBACK                           : constant := -1.0;
  AL_CHORUS_MIN_PHASE                              : constant := -16#180#;
  AL_CHORUS_MIN_RATE                               : constant := 0.0;
  AL_CHORUS_MIN_WAVEFORM                           : constant := 16#0#;
  AL_CHORUS_PHASE                                  : constant := 16#0002#;
  AL_CHORUS_RATE                                   : constant := 16#0003#;
  AL_CHORUS_WAVEFORM                               : constant := 16#0001#;
  AL_CHORUS_WAVEFORM_SINUSOID                      : constant := 16#0#;
  AL_CHORUS_WAVEFORM_TRIANGLE                      : constant := 16#1#;
  AL_COMPRESSOR_DEFAULT_ONOFF                      : constant := 16#1#;
  AL_COMPRESSOR_MAX_ONOFF                          : constant := 16#1#;
  AL_COMPRESSOR_MIN_ONOFF                          : constant := 16#0#;
  AL_COMPRESSOR_ONOFF                              : constant := 16#0001#;
  AL_DISTORTION_DEFAULT_EDGE                       : constant := 0.2;
  AL_DISTORTION_DEFAULT_EQBANDWIDTH                : constant := 3600.0;
  AL_DISTORTION_DEFAULT_EQCENTER                   : constant := 3600.0;
  AL_DISTORTION_DEFAULT_GAIN                       : constant := 0.05;
  AL_DISTORTION_DEFAULT_LOWPASS_CUTOFF             : constant := 8000.0;
  AL_DISTORTION_EDGE                               : constant := 16#0001#;
  AL_DISTORTION_EQBANDWIDTH                        : constant := 16#0005#;
  AL_DISTORTION_EQCENTER                           : constant := 16#0004#;
  AL_DISTORTION_GAIN                               : constant := 16#0002#;
  AL_DISTORTION_LOWPASS_CUTOFF                     : constant := 16#0003#;
  AL_DISTORTION_MAX_EDGE                           : constant := 1.0;
  AL_DISTORTION_MAX_EQBANDWIDTH                    : constant := 24000.0;
  AL_DISTORTION_MAX_EQCENTER                       : constant := 24000.0;
  AL_DISTORTION_MAX_GAIN                           : constant := 1.0;
  AL_DISTORTION_MAX_LOWPASS_CUTOFF                 : constant := 24000.0;
  AL_DISTORTION_MIN_EDGE                           : constant := 0.0;
  AL_DISTORTION_MIN_EQBANDWIDTH                    : constant := 80.0;
  AL_DISTORTION_MIN_EQCENTER                       : constant := 80.0;
  AL_DISTORTION_MIN_GAIN                           : constant := 0.01;
  AL_DISTORTION_MIN_LOWPASS_CUTOFF                 : constant := 80.0;
  AL_EAXREVERB_AIR_ABSORPTION_GAINHF               : constant := 16#0013#;
  AL_EAXREVERB_DECAY_HFLIMIT                       : constant := 16#0017#;
  AL_EAXREVERB_DECAY_HFRATIO                       : constant := 16#0007#;
  AL_EAXREVERB_DECAY_LFRATIO                       : constant := 16#0008#;
  AL_EAXREVERB_DECAY_TIME                          : constant := 16#0006#;
  AL_EAXREVERB_DEFAULT_AIR_ABSORPTION_GAINHF       : constant := 0.994;
  AL_EAXREVERB_DEFAULT_DECAY_HFLIMIT               : constant := 16#1#;
  AL_EAXREVERB_DEFAULT_DECAY_HFRATIO               : constant := 0.83;
  AL_EAXREVERB_DEFAULT_DECAY_LFRATIO               : constant := 1.0;
  AL_EAXREVERB_DEFAULT_DECAY_TIME                  : constant := 1.49;
  AL_EAXREVERB_DEFAULT_DENSITY                     : constant := 1.0;
  AL_EAXREVERB_DEFAULT_DIFFUSION                   : constant := 1.0;
  AL_EAXREVERB_DEFAULT_ECHO_DEPTH                  : constant := 0.0;
  AL_EAXREVERB_DEFAULT_ECHO_TIME                   : constant := 0.25;
  AL_EAXREVERB_DEFAULT_GAIN                        : constant := 0.32;
  AL_EAXREVERB_DEFAULT_GAINHF                      : constant := 0.89;
  AL_EAXREVERB_DEFAULT_GAINLF                      : constant := 1.0;
  AL_EAXREVERB_DEFAULT_HFREFERENCE                 : constant := 5000.0;
  AL_EAXREVERB_DEFAULT_LATE_REVERB_DELAY           : constant := 0.011;
  AL_EAXREVERB_DEFAULT_LATE_REVERB_GAIN            : constant := 1.26;
  AL_EAXREVERB_DEFAULT_LATE_REVERB_PAN_XYZ         : constant := 0.0;
  AL_EAXREVERB_DEFAULT_LFREFERENCE                 : constant := 250.0;
  AL_EAXREVERB_DEFAULT_MODULATION_DEPTH            : constant := 0.0;
  AL_EAXREVERB_DEFAULT_MODULATION_TIME             : constant := 0.25;
  AL_EAXREVERB_DEFAULT_REFLECTIONS_DELAY           : constant := 0.007;
  AL_EAXREVERB_DEFAULT_REFLECTIONS_GAIN            : constant := 0.05;
  AL_EAXREVERB_DEFAULT_REFLECTIONS_PAN_XYZ         : constant := 0.0;
  AL_EAXREVERB_DEFAULT_ROOM_ROLLOFF_FACTOR         : constant := 0.0;
  AL_EAXREVERB_DENSITY                             : constant := 16#0001#;
  AL_EAXREVERB_DIFFUSION                           : constant := 16#0002#;
  AL_EAXREVERB_ECHO_DEPTH                          : constant := 16#0010#;
  AL_EAXREVERB_ECHO_TIME                           : constant := 16#000F#;
  AL_EAXREVERB_GAIN                                : constant := 16#0003#;
  AL_EAXREVERB_GAINHF                              : constant := 16#0004#;
  AL_EAXREVERB_GAINLF                              : constant := 16#0005#;
  AL_EAXREVERB_HFREFERENCE                         : constant := 16#0014#;
  AL_EAXREVERB_LATE_REVERB_DELAY                   : constant := 16#000D#;
  AL_EAXREVERB_LATE_REVERB_GAIN                    : constant := 16#000C#;
  AL_EAXREVERB_LATE_REVERB_PAN                     : constant := 16#000E#;
  AL_EAXREVERB_LFREFERENCE                         : constant := 16#0015#;
  AL_EAXREVERB_MAX_AIR_ABSORPTION_GAINHF           : constant := 1.0;
  AL_EAXREVERB_MAX_DECAY_HFLIMIT                   : constant := 16#1#;
  AL_EAXREVERB_MAX_DECAY_HFRATIO                   : constant := 2.0;
  AL_EAXREVERB_MAX_DECAY_LFRATIO                   : constant := 2.0;
  AL_EAXREVERB_MAX_DECAY_TIME                      : constant := 20.0;
  AL_EAXREVERB_MAX_DENSITY                         : constant := 1.0;
  AL_EAXREVERB_MAX_DIFFUSION                       : constant := 1.0;
  AL_EAXREVERB_MAX_ECHO_DEPTH                      : constant := 1.0;
  AL_EAXREVERB_MAX_ECHO_TIME                       : constant := 0.25;
  AL_EAXREVERB_MAX_GAIN                            : constant := 1.0;
  AL_EAXREVERB_MAX_GAINHF                          : constant := 1.0;
  AL_EAXREVERB_MAX_GAINLF                          : constant := 1.0;
  AL_EAXREVERB_MAX_HFREFERENCE                     : constant := 20000.0;
  AL_EAXREVERB_MAX_LATE_REVERB_DELAY               : constant := 0.1;
  AL_EAXREVERB_MAX_LATE_REVERB_GAIN                : constant := 10.0;
  AL_EAXREVERB_MAX_LFREFERENCE                     : constant := 1000.0;
  AL_EAXREVERB_MAX_MODULATION_DEPTH                : constant := 1.0;
  AL_EAXREVERB_MAX_MODULATION_TIME                 : constant := 4.0;
  AL_EAXREVERB_MAX_REFLECTIONS_DELAY               : constant := 0.3;
  AL_EAXREVERB_MAX_REFLECTIONS_GAIN                : constant := 3.16;
  AL_EAXREVERB_MAX_ROOM_ROLLOFF_FACTOR             : constant := 10.0;
  AL_EAXREVERB_MIN_AIR_ABSORPTION_GAINHF           : constant := 0.892;
  AL_EAXREVERB_MIN_DECAY_HFLIMIT                   : constant := 16#0#;
  AL_EAXREVERB_MIN_DECAY_HFRATIO                   : constant := 0.1;
  AL_EAXREVERB_MIN_DECAY_LFRATIO                   : constant := 0.1;
  AL_EAXREVERB_MIN_DECAY_TIME                      : constant := 0.1;
  AL_EAXREVERB_MIN_DENSITY                         : constant := 0.0;
  AL_EAXREVERB_MIN_DIFFUSION                       : constant := 0.0;
  AL_EAXREVERB_MIN_ECHO_DEPTH                      : constant := 0.0;
  AL_EAXREVERB_MIN_ECHO_TIME                       : constant := 0.075;
  AL_EAXREVERB_MIN_GAIN                            : constant := 0.0;
  AL_EAXREVERB_MIN_GAINHF                          : constant := 0.0;
  AL_EAXREVERB_MIN_GAINLF                          : constant := 0.0;
  AL_EAXREVERB_MIN_HFREFERENCE                     : constant := 1000.0;
  AL_EAXREVERB_MIN_LATE_REVERB_DELAY               : constant := 0.0;
  AL_EAXREVERB_MIN_LATE_REVERB_GAIN                : constant := 0.0;
  AL_EAXREVERB_MIN_LFREFERENCE                     : constant := 20.0;
  AL_EAXREVERB_MIN_MODULATION_DEPTH                : constant := 0.0;
  AL_EAXREVERB_MIN_MODULATION_TIME                 : constant := 0.04;
  AL_EAXREVERB_MIN_REFLECTIONS_DELAY               : constant := 0.0;
  AL_EAXREVERB_MIN_REFLECTIONS_GAIN                : constant := 0.0;
  AL_EAXREVERB_MIN_ROOM_ROLLOFF_FACTOR             : constant := 0.0;
  AL_EAXREVERB_MODULATION_DEPTH                    : constant := 16#0012#;
  AL_EAXREVERB_MODULATION_TIME                     : constant := 16#0011#;
  AL_EAXREVERB_REFLECTIONS_DELAY                   : constant := 16#000A#;
  AL_EAXREVERB_REFLECTIONS_GAIN                    : constant := 16#0009#;
  AL_EAXREVERB_REFLECTIONS_PAN                     : constant := 16#000B#;
  AL_EAXREVERB_ROOM_ROLLOFF_FACTOR                 : constant := 16#0016#;
  AL_ECHO_DAMPING                                  : constant := 16#0003#;
  AL_ECHO_DEFAULT_DAMPING                          : constant := 0.5;
  AL_ECHO_DEFAULT_DELAY                            : constant := 0.1;
  AL_ECHO_DEFAULT_FEEDBACK                         : constant := 0.5;
  AL_ECHO_DEFAULT_LRDELAY                          : constant := 0.1;
  AL_ECHO_DEFAULT_SPREAD                           : constant := -1.0;
  AL_ECHO_DELAY                                    : constant := 16#0001#;
  AL_ECHO_FEEDBACK                                 : constant := 16#0004#;
  AL_ECHO_LRDELAY                                  : constant := 16#0002#;
  AL_ECHO_MAX_DAMPING                              : constant := 0.99;
  AL_ECHO_MAX_DELAY                                : constant := 0.207;
  AL_ECHO_MAX_FEEDBACK                             : constant := 1.0;
  AL_ECHO_MAX_LRDELAY                              : constant := 0.404;
  AL_ECHO_MAX_SPREAD                               : constant := 1.0;
  AL_ECHO_MIN_DAMPING                              : constant := 0.0;
  AL_ECHO_MIN_DELAY                                : constant := 0.0;
  AL_ECHO_MIN_FEEDBACK                             : constant := 0.0;
  AL_ECHO_MIN_LRDELAY                              : constant := 0.0;
  AL_ECHO_MIN_SPREAD                               : constant := -1.0;
  AL_ECHO_SPREAD                                   : constant := 16#0005#;
  AL_EFFECTSLOT_AUXILIARY_SEND_AUTO                : constant := 16#0003#;
  AL_EFFECTSLOT_EFFECT                             : constant := 16#0001#;
  AL_EFFECTSLOT_GAIN                               : constant := 16#0002#;
  AL_EFFECTSLOT_NULL                               : constant := 16#0000#;
  AL_EFFECT_AUTOWAH                                : constant := 16#000A#;
  AL_EFFECT_CHORUS                                 : constant := 16#0002#;
  AL_EFFECT_COMPRESSOR                             : constant := 16#000B#;
  AL_EFFECT_DISTORTION                             : constant := 16#0003#;
  AL_EFFECT_EAXREVERB                              : constant := 16#8000#;
  AL_EFFECT_ECHO                                   : constant := 16#0004#;
  AL_EFFECT_EQUALIZER                              : constant := 16#000C#;
  AL_EFFECT_FLANGER                                : constant := 16#0005#;
  AL_EFFECT_FREQUENCY_SHIFTER                      : constant := 16#0006#;
  AL_EFFECT_NULL                                   : constant := 16#0000#;
  AL_EFFECT_PITCH_SHIFTER                          : constant := 16#0008#;
  AL_EFFECT_REVERB                                 : constant := 16#0001#;
  AL_EFFECT_RING_MODULATOR                         : constant := 16#0009#;
  AL_EFFECT_TYPE                                   : constant := 16#8001#;
  AL_EFFECT_VOCAL_MORPHER                          : constant := 16#0007#;
  AL_EQUALIZER_DEFAULT_HIGH_CUTOFF                 : constant := 6000.0;
  AL_EQUALIZER_DEFAULT_HIGH_GAIN                   : constant := 1.0;
  AL_EQUALIZER_DEFAULT_LOW_CUTOFF                  : constant := 200.0;
  AL_EQUALIZER_DEFAULT_LOW_GAIN                    : constant := 1.0;
  AL_EQUALIZER_DEFAULT_MID1_CENTER                 : constant := 500.0;
  AL_EQUALIZER_DEFAULT_MID1_GAIN                   : constant := 1.0;
  AL_EQUALIZER_DEFAULT_MID1_WIDTH                  : constant := 1.0;
  AL_EQUALIZER_DEFAULT_MID2_CENTER                 : constant := 3000.0;
  AL_EQUALIZER_DEFAULT_MID2_GAIN                   : constant := 1.0;
  AL_EQUALIZER_DEFAULT_MID2_WIDTH                  : constant := 1.0;
  AL_EQUALIZER_HIGH_CUTOFF                         : constant := 16#000A#;
  AL_EQUALIZER_HIGH_GAIN                           : constant := 16#0009#;
  AL_EQUALIZER_LOW_CUTOFF                          : constant := 16#0002#;
  AL_EQUALIZER_LOW_GAIN                            : constant := 16#0001#;
  AL_EQUALIZER_MAX_HIGH_CUTOFF                     : constant := 16000.0;
  AL_EQUALIZER_MAX_HIGH_GAIN                       : constant := 7.943;
  AL_EQUALIZER_MAX_LOW_CUTOFF                      : constant := 800.0;
  AL_EQUALIZER_MAX_LOW_GAIN                        : constant := 7.943;
  AL_EQUALIZER_MAX_MID1_CENTER                     : constant := 3000.0;
  AL_EQUALIZER_MAX_MID1_GAIN                       : constant := 7.943;
  AL_EQUALIZER_MAX_MID1_WIDTH                      : constant := 1.0;
  AL_EQUALIZER_MAX_MID2_CENTER                     : constant := 8000.0;
  AL_EQUALIZER_MAX_MID2_GAIN                       : constant := 7.943;
  AL_EQUALIZER_MAX_MID2_WIDTH                      : constant := 1.0;
  AL_EQUALIZER_MID1_CENTER                         : constant := 16#0004#;
  AL_EQUALIZER_MID1_GAIN                           : constant := 16#0003#;
  AL_EQUALIZER_MID1_WIDTH                          : constant := 16#0005#;
  AL_EQUALIZER_MID2_CENTER                         : constant := 16#0007#;
  AL_EQUALIZER_MID2_GAIN                           : constant := 16#0006#;
  AL_EQUALIZER_MID2_WIDTH                          : constant := 16#0008#;
  AL_EQUALIZER_MIN_HIGH_CUTOFF                     : constant := 4000.0;
  AL_EQUALIZER_MIN_HIGH_GAIN                       : constant := 0.126;
  AL_EQUALIZER_MIN_LOW_CUTOFF                      : constant := 50.0;
  AL_EQUALIZER_MIN_LOW_GAIN                        : constant := 0.126;
  AL_EQUALIZER_MIN_MID1_CENTER                     : constant := 200.0;
  AL_EQUALIZER_MIN_MID1_GAIN                       : constant := 0.126;
  AL_EQUALIZER_MIN_MID1_WIDTH                      : constant := 0.01;
  AL_EQUALIZER_MIN_MID2_CENTER                     : constant := 1000.0;
  AL_EQUALIZER_MIN_MID2_GAIN                       : constant := 0.126;
  AL_EQUALIZER_MIN_MID2_WIDTH                      : constant := 0.01;
  AL_FILTER_BANDPASS                               : constant := 16#0003#;
  AL_FILTER_HIGHPASS                               : constant := 16#0002#;
  AL_FILTER_LOWPASS                                : constant := 16#0001#;
  AL_FILTER_NULL                                   : constant := 16#0000#;
  AL_FILTER_TYPE                                   : constant := 16#8001#;
  AL_FLANGER_DEFAULT_DELAY                         : constant := 0.002;
  AL_FLANGER_DEFAULT_DEPTH                         : constant := 1.0;
  AL_FLANGER_DEFAULT_FEEDBACK                      : constant := -0.5;
  AL_FLANGER_DEFAULT_PHASE                         : constant := 16#0#;
  AL_FLANGER_DEFAULT_RATE                          : constant := 0.27;
  AL_FLANGER_DEFAULT_WAVEFORM                      : constant := 16#1#;
  AL_FLANGER_DELAY                                 : constant := 16#0006#;
  AL_FLANGER_DEPTH                                 : constant := 16#0004#;
  AL_FLANGER_FEEDBACK                              : constant := 16#0005#;
  AL_FLANGER_MAX_DELAY                             : constant := 0.004;
  AL_FLANGER_MAX_DEPTH                             : constant := 1.0;
  AL_FLANGER_MAX_FEEDBACK                          : constant := 1.0;
  AL_FLANGER_MAX_PHASE                             : constant := 16#180#;
  AL_FLANGER_MAX_RATE                              : constant := 10.0;
  AL_FLANGER_MAX_WAVEFORM                          : constant := 16#1#;
  AL_FLANGER_MIN_DELAY                             : constant := 0.0;
  AL_FLANGER_MIN_DEPTH                             : constant := 0.0;
  AL_FLANGER_MIN_FEEDBACK                          : constant := -1.0;
  AL_FLANGER_MIN_PHASE                             : constant := -16#180#;
  AL_FLANGER_MIN_RATE                              : constant := 0.0;
  AL_FLANGER_MIN_WAVEFORM                          : constant := 16#0#;
  AL_FLANGER_PHASE                                 : constant := 16#0002#;
  AL_FLANGER_RATE                                  : constant := 16#0003#;
  AL_FLANGER_WAVEFORM                              : constant := 16#0001#;
  AL_FLANGER_WAVEFORM_SINUSOID                     : constant := 16#0#;
  AL_FLANGER_WAVEFORM_TRIANGLE                     : constant := 16#1#;
  AL_FREQUENCY_SHIFTER_DEFAULT_FREQUENCY           : constant := 0.0;
  AL_FREQUENCY_SHIFTER_DEFAULT_LEFT_DIRECTION      : constant := 16#0#;
  AL_FREQUENCY_SHIFTER_DEFAULT_RIGHT_DIRECTION     : constant := 16#0#;
  AL_FREQUENCY_SHIFTER_DIRECTION_DOWN              : constant := 16#0#;
  AL_FREQUENCY_SHIFTER_DIRECTION_OFF               : constant := 16#2#;
  AL_FREQUENCY_SHIFTER_DIRECTION_UP                : constant := 16#1#;
  AL_FREQUENCY_SHIFTER_FREQUENCY                   : constant := 16#0001#;
  AL_FREQUENCY_SHIFTER_LEFT_DIRECTION              : constant := 16#0002#;
  AL_FREQUENCY_SHIFTER_MAX_FREQUENCY               : constant := 24000.0;
  AL_FREQUENCY_SHIFTER_MAX_LEFT_DIRECTION          : constant := 16#2#;
  AL_FREQUENCY_SHIFTER_MAX_RIGHT_DIRECTION         : constant := 16#2#;
  AL_FREQUENCY_SHIFTER_MIN_FREQUENCY               : constant := 0.0;
  AL_FREQUENCY_SHIFTER_MIN_LEFT_DIRECTION          : constant := 16#0#;
  AL_FREQUENCY_SHIFTER_MIN_RIGHT_DIRECTION         : constant := 16#0#;
  AL_FREQUENCY_SHIFTER_RIGHT_DIRECTION             : constant := 16#0003#;
  AL_HIGHPASS_GAIN                                 : constant := 16#0001#;
  AL_HIGHPASS_GAINLF                               : constant := 16#0002#;
  AL_LOWPASS_GAIN                                  : constant := 16#0001#;
  AL_LOWPASS_GAINHF                                : constant := 16#0002#;
  AL_PITCH_SHIFTER_COARSE_TUNE                     : constant := 16#0001#;
  AL_PITCH_SHIFTER_DEFAULT_COARSE_TUNE             : constant := 16#12#;
  AL_PITCH_SHIFTER_DEFAULT_FINE_TUNE               : constant := 16#0#;
  AL_PITCH_SHIFTER_FINE_TUNE                       : constant := 16#0002#;
  AL_PITCH_SHIFTER_MAX_COARSE_TUNE                 : constant := 16#12#;
  AL_PITCH_SHIFTER_MAX_FINE_TUNE                   : constant := 16#50#;
  AL_PITCH_SHIFTER_MIN_COARSE_TUNE                 : constant := -16#12#;
  AL_PITCH_SHIFTER_MIN_FINE_TUNE                   : constant := -16#50#;
  AL_REVERB_AIR_ABSORPTION_GAINHF                  : constant := 16#000B#;
  AL_REVERB_DECAY_HFLIMIT                          : constant := 16#000D#;
  AL_REVERB_DECAY_HFRATIO                          : constant := 16#0006#;
  AL_REVERB_DECAY_TIME                             : constant := 16#0005#;
  AL_REVERB_DEFAULT_AIR_ABSORPTION_GAINHF          : constant := 0.994;
  AL_REVERB_DEFAULT_DECAY_HFLIMIT                  : constant := 16#1#;
  AL_REVERB_DEFAULT_DECAY_HFRATIO                  : constant := 0.83;
  AL_REVERB_DEFAULT_DECAY_TIME                     : constant := 1.49;
  AL_REVERB_DEFAULT_DENSITY                        : constant := 1.0;
  AL_REVERB_DEFAULT_DIFFUSION                      : constant := 1.0;
  AL_REVERB_DEFAULT_GAIN                           : constant := 0.32;
  AL_REVERB_DEFAULT_GAINHF                         : constant := 0.89;
  AL_REVERB_DEFAULT_LATE_REVERB_DELAY              : constant := 0.011;
  AL_REVERB_DEFAULT_LATE_REVERB_GAIN               : constant := 1.26;
  AL_REVERB_DEFAULT_REFLECTIONS_DELAY              : constant := 0.007;
  AL_REVERB_DEFAULT_REFLECTIONS_GAIN               : constant := 0.05;
  AL_REVERB_DEFAULT_ROOM_ROLLOFF_FACTOR            : constant := 0.0;
  AL_REVERB_DENSITY                                : constant := 16#0001#;
  AL_REVERB_DIFFUSION                              : constant := 16#0002#;
  AL_REVERB_GAIN                                   : constant := 16#0003#;
  AL_REVERB_GAINHF                                 : constant := 16#0004#;
  AL_REVERB_LATE_REVERB_DELAY                      : constant := 16#000A#;
  AL_REVERB_LATE_REVERB_GAIN                       : constant := 16#0009#;
  AL_REVERB_MAX_AIR_ABSORPTION_GAINHF              : constant := 1.0;
  AL_REVERB_MAX_DECAY_HFLIMIT                      : constant := 16#1#;
  AL_REVERB_MAX_DECAY_HFRATIO                      : constant := 2.0;
  AL_REVERB_MAX_DECAY_TIME                         : constant := 20.0;
  AL_REVERB_MAX_DENSITY                            : constant := 1.0;
  AL_REVERB_MAX_DIFFUSION                          : constant := 1.0;
  AL_REVERB_MAX_GAIN                               : constant := 1.0;
  AL_REVERB_MAX_GAINHF                             : constant := 1.0;
  AL_REVERB_MAX_LATE_REVERB_DELAY                  : constant := 0.1;
  AL_REVERB_MAX_LATE_REVERB_GAIN                   : constant := 10.0;
  AL_REVERB_MAX_REFLECTIONS_DELAY                  : constant := 0.3;
  AL_REVERB_MAX_REFLECTIONS_GAIN                   : constant := 3.16;
  AL_REVERB_MAX_ROOM_ROLLOFF_FACTOR                : constant := 10.0;
  AL_REVERB_MIN_AIR_ABSORPTION_GAINHF              : constant := 0.892;
  AL_REVERB_MIN_DECAY_HFLIMIT                      : constant := 16#0#;
  AL_REVERB_MIN_DECAY_HFRATIO                      : constant := 0.1;
  AL_REVERB_MIN_DECAY_TIME                         : constant := 0.1;
  AL_REVERB_MIN_DENSITY                            : constant := 0.0;
  AL_REVERB_MIN_DIFFUSION                          : constant := 0.0;
  AL_REVERB_MIN_GAIN                               : constant := 0.0;
  AL_REVERB_MIN_GAINHF                             : constant := 0.0;
  AL_REVERB_MIN_LATE_REVERB_DELAY                  : constant := 0.0;
  AL_REVERB_MIN_LATE_REVERB_GAIN                   : constant := 0.0;
  AL_REVERB_MIN_REFLECTIONS_DELAY                  : constant := 0.0;
  AL_REVERB_MIN_REFLECTIONS_GAIN                   : constant := 0.0;
  AL_REVERB_MIN_ROOM_ROLLOFF_FACTOR                : constant := 0.0;
  AL_REVERB_REFLECTIONS_DELAY                      : constant := 16#0008#;
  AL_REVERB_REFLECTIONS_GAIN                       : constant := 16#0007#;
  AL_REVERB_ROOM_ROLLOFF_FACTOR                    : constant := 16#000C#;
  AL_RING_MODULATOR_DEFAULT_FREQUENCY              : constant := 440.0;
  AL_RING_MODULATOR_DEFAULT_HIGHPASS_CUTOFF        : constant := 800.0;
  AL_RING_MODULATOR_DEFAULT_WAVEFORM               : constant := 16#0#;
  AL_RING_MODULATOR_FREQUENCY                      : constant := 16#0001#;
  AL_RING_MODULATOR_HIGHPASS_CUTOFF                : constant := 16#0002#;
  AL_RING_MODULATOR_MAX_FREQUENCY                  : constant := 8000.0;
  AL_RING_MODULATOR_MAX_HIGHPASS_CUTOFF            : constant := 24000.0;
  AL_RING_MODULATOR_MAX_WAVEFORM                   : constant := 16#2#;
  AL_RING_MODULATOR_MIN_FREQUENCY                  : constant := 0.0;
  AL_RING_MODULATOR_MIN_HIGHPASS_CUTOFF            : constant := 0.0;
  AL_RING_MODULATOR_MIN_WAVEFORM                   : constant := 16#0#;
  AL_RING_MODULATOR_SAWTOOTH                       : constant := 16#1#;
  AL_RING_MODULATOR_SINUSOID                       : constant := 16#0#;
  AL_RING_MODULATOR_SQUARE                         : constant := 16#2#;
  AL_RING_MODULATOR_WAVEFORM                       : constant := 16#0003#;
  AL_VOCAL_MORPHER_DEFAULT_PHONEMEA                : constant := 16#0#;
  AL_VOCAL_MORPHER_DEFAULT_PHONEMEA_COARSE_TUNING  : constant := 16#0#;
  AL_VOCAL_MORPHER_DEFAULT_PHONEMEB                : constant := 16#10#;
  AL_VOCAL_MORPHER_DEFAULT_PHONEMEB_COARSE_TUNING  : constant := 16#0#;
  AL_VOCAL_MORPHER_DEFAULT_RATE                    : constant := 1.41;
  AL_VOCAL_MORPHER_DEFAULT_WAVEFORM                : constant := 16#0#;
  AL_VOCAL_MORPHER_MAX_PHONEMEA                    : constant := 16#29#;
  AL_VOCAL_MORPHER_MAX_PHONEMEA_COARSE_TUNING      : constant := 16#24#;
  AL_VOCAL_MORPHER_MAX_PHONEMEB                    : constant := 16#29#;
  AL_VOCAL_MORPHER_MAX_PHONEMEB_COARSE_TUNING      : constant := 16#24#;
  AL_VOCAL_MORPHER_MAX_RATE                        : constant := 10.0;
  AL_VOCAL_MORPHER_MAX_WAVEFORM                    : constant := 16#2#;
  AL_VOCAL_MORPHER_MIN_PHONEMEA                    : constant := 16#0#;
  AL_VOCAL_MORPHER_MIN_PHONEMEA_COARSE_TUNING      : constant := -16#24#;
  AL_VOCAL_MORPHER_MIN_PHONEMEB                    : constant := 16#0#;
  AL_VOCAL_MORPHER_MIN_PHONEMEB_COARSE_TUNING      : constant := -16#24#;
  AL_VOCAL_MORPHER_MIN_RATE                        : constant := 0.0;
  AL_VOCAL_MORPHER_MIN_WAVEFORM                    : constant := 16#0#;
  AL_VOCAL_MORPHER_PHONEMEA                        : constant := 16#0001#;
  AL_VOCAL_MORPHER_PHONEMEA_COARSE_TUNING          : constant := 16#0002#;
  AL_VOCAL_MORPHER_PHONEMEB                        : constant := 16#0003#;
  AL_VOCAL_MORPHER_PHONEMEB_COARSE_TUNING          : constant := 16#0004#;
  AL_VOCAL_MORPHER_PHONEME_A                       : constant := 16#0#;
  AL_VOCAL_MORPHER_PHONEME_AA                      : constant := 16#5#;
  AL_VOCAL_MORPHER_PHONEME_AE                      : constant := 16#6#;
  AL_VOCAL_MORPHER_PHONEME_AH                      : constant := 16#7#;
  AL_VOCAL_MORPHER_PHONEME_AO                      : constant := 16#8#;
  AL_VOCAL_MORPHER_PHONEME_B                       : constant := 16#15#;
  AL_VOCAL_MORPHER_PHONEME_D                       : constant := 16#16#;
  AL_VOCAL_MORPHER_PHONEME_E                       : constant := 16#1#;
  AL_VOCAL_MORPHER_PHONEME_EH                      : constant := 16#9#;
  AL_VOCAL_MORPHER_PHONEME_ER                      : constant := 16#10#;
  AL_VOCAL_MORPHER_PHONEME_F                       : constant := 16#17#;
  AL_VOCAL_MORPHER_PHONEME_G                       : constant := 16#18#;
  AL_VOCAL_MORPHER_PHONEME_I                       : constant := 16#2#;
  AL_VOCAL_MORPHER_PHONEME_IH                      : constant := 16#11#;
  AL_VOCAL_MORPHER_PHONEME_IY                      : constant := 16#12#;
  AL_VOCAL_MORPHER_PHONEME_J                       : constant := 16#19#;
  AL_VOCAL_MORPHER_PHONEME_K                       : constant := 16#20#;
  AL_VOCAL_MORPHER_PHONEME_L                       : constant := 16#21#;
  AL_VOCAL_MORPHER_PHONEME_M                       : constant := 16#22#;
  AL_VOCAL_MORPHER_PHONEME_N                       : constant := 16#23#;
  AL_VOCAL_MORPHER_PHONEME_O                       : constant := 16#3#;
  AL_VOCAL_MORPHER_PHONEME_P                       : constant := 16#24#;
  AL_VOCAL_MORPHER_PHONEME_R                       : constant := 16#25#;
  AL_VOCAL_MORPHER_PHONEME_S                       : constant := 16#26#;
  AL_VOCAL_MORPHER_PHONEME_T                       : constant := 16#27#;
  AL_VOCAL_MORPHER_PHONEME_U                       : constant := 16#4#;
  AL_VOCAL_MORPHER_PHONEME_UH                      : constant := 16#13#;
  AL_VOCAL_MORPHER_PHONEME_UW                      : constant := 16#14#;
  AL_VOCAL_MORPHER_PHONEME_V                       : constant := 16#28#;
  AL_VOCAL_MORPHER_PHONEME_Z                       : constant := 16#29#;
  AL_VOCAL_MORPHER_RATE                            : constant := 16#0006#;
  AL_VOCAL_MORPHER_WAVEFORM                        : constant := 16#0005#;
  AL_VOCAL_MORPHER_WAVEFORM_SAWTOOTH               : constant := 16#2#;
  AL_VOCAL_MORPHER_WAVEFORM_SINUSOID               : constant := 16#0#;
  AL_VOCAL_MORPHER_WAVEFORM_TRIANGLE               : constant := 16#1#;

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
     Value     : System.Address);
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
     Value     : System.Address);
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
     Value     : System.Address);
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
     Value     : System.Address);
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

  function Load_API return API_t;

end OpenAL.Extension.EFX_Thin;
