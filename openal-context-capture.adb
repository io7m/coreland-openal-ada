with Interfaces.C;
with OpenAL.ALC_Thin;
with OpenAL.Thin;
with System;

package body OpenAL.Context.Capture is
  package C renames Interfaces.C;

  type Map_Format_t is array (Format_t) of ALC_Thin.Enumeration_t;

  Map_Format : constant Map_Format_t :=
    (Mono_8    => Thin.AL_FORMAT_MONO8,
     Stereo_8  => Thin.AL_FORMAT_STEREO8,
     Mono_16   => Thin.AL_FORMAT_MONO16,
     Stereo_16 => Thin.AL_FORMAT_STEREO16);

  function Open_Device
    (Name        : in String;
     Frequency   : in Frequency_t;
     Format      : in Format_t;
     Buffer_Size : in Buffer_Size_t) return Device_t
  is
    C_Name : aliased C.char_array := C.To_C (Name);
  begin
    return Device_t
      (ALC_Thin.Capture_Open_Device
        (Name        => C_Name (C_Name'First)'Address,
         Frequency   => ALC_Thin.Unsigned_Integer_t (Frequency),
         Format      => Map_Format (Format),
         Buffer_Size => ALC_Thin.Size_t (Buffer_Size)));
  end Open_Device;

  function Open_Default_Device
    (Frequency   : in Frequency_t;
     Format      : in Format_t;
     Buffer_Size : in Buffer_Size_t) return Device_t is
  begin
    return Device_t
      (ALC_Thin.Capture_Open_Device
        (Name        => System.Null_Address,
         Frequency   => ALC_Thin.Unsigned_Integer_t (Frequency),
         Format      => Map_Format (Format),
         Buffer_Size => ALC_Thin.Size_t (Buffer_Size)));
  end Open_Default_Device;

  function Close_Device (Device : in Device_t) return Boolean is
  begin
    return Boolean (ALC_Thin.Capture_Close_Device (ALC_Thin.Device_t (Device)));
  end Close_Device;

  procedure Start (Device : in Device_t) is
  begin
    ALC_Thin.Capture_Start (ALC_Thin.Device_t (Device));
  end Start;

  procedure Stop (Device : in Device_t) is
  begin
    ALC_Thin.Capture_Stop (ALC_Thin.Device_t (Device));
  end Stop;

end OpenAL.Context.Capture;
