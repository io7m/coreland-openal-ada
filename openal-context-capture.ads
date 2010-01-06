package OpenAL.Context.Capture is

  --
  -- API
  --

  type Frequency_t   is range 1 .. 1_944_810_000;
  type Buffer_Size_t is range 2 .. 65536;
  type Format_t      is (Mono_8, Stereo_8, Mono_16, Stereo_16);

  -- proc_map : alcCaptureOpenDevice
  function Open_Device
    (Name        : in String;
     Frequency   : in Frequency_t;
     Format      : in Format_t;
     Buffer_Size : in Buffer_Size_t) return Device_t;

  -- proc_map : alcCaptureOpenDevice
  function Open_Default_Device
    (Frequency   : in Frequency_t;
     Format      : in Format_t;
     Buffer_Size : in Buffer_Size_t) return Device_t;

  -- proc_map : alcCaptureCloseDevice
  function Close_Device (Device : in Device_t) return Boolean;

  -- proc_map : alcCaptureStart
  procedure Start (Device : in Device_t);

  -- proc_map : alcCaptureStop
  procedure Stop (Device : in Device_t);

end OpenAL.Context.Capture;
