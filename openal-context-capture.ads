with OpenAL.Buffer;
with OpenAL.Types;

package OpenAL.Context.Capture is

  --
  -- API
  --

  type Buffer_Size_t is range 2 .. 65536;

  -- proc_map : alcCaptureOpenDevice
  function Open_Device
    (Name        : in String;
     Frequency   : in Types.Frequency_t;
     Format      : in OpenAL.Context.Request_Format_t;
     Buffer_Size : in Buffer_Size_t) return Device_t;

  -- proc_map : alcCaptureOpenDevice
  function Open_Default_Device
    (Frequency   : in Types.Frequency_t;
     Format      : in OpenAL.Context.Request_Format_t;
     Buffer_Size : in Buffer_Size_t) return Device_t;

  -- proc_map : alcCaptureCloseDevice
  procedure Close_Device (Device : in out Device_t);

  -- proc_map : alcCaptureStart
  procedure Start (Device : in Device_t);

  -- proc_map : alcCaptureStop
  procedure Stop (Device : in Device_t);

  -- proc_map : alcCaptureSamples
  procedure Samples_Mono_8
    (Device  : in     Device_t;
     Samples :    out OpenAL.Buffer.Sample_Array_8_t);

  -- proc_map : alcCaptureSamples
  procedure Samples_Stereo_8
    (Device  : in     Device_t;
     Samples :    out OpenAL.Buffer.Sample_Array_8_t);

  -- proc_map : alcCaptureSamples
  procedure Samples_Mono_16
    (Device  : in     Device_t;
     Samples :    out OpenAL.Buffer.Sample_Array_16_t);

  -- proc_map : alcCaptureSamples
  procedure Samples_Stereo_16
    (Device  : in     Device_t;
     Samples :    out OpenAL.Buffer.Sample_Array_16_t);

end OpenAL.Context.Capture;
