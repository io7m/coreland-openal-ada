with Ada.IO_Exceptions;
with Interfaces.C;
with OpenAL.ALC_Thin;
with OpenAL.Thin;
with System;

package body OpenAL.Context.Capture is
  package C renames Interfaces.C;

  --
  -- Close_Device
  --

  procedure Close_Device (Device : in out Device_t) is
    Return_Code : constant Boolean := Boolean
      (ALC_Thin.Capture_Close_Device (Device.Device_Data));
  begin
    Device := Invalid_Device;

    pragma Assert (Return_Code'Size > 0);
  end Close_Device;

  --
  -- Invalid_Format
  --

  procedure Invalid_Format
    (Device : in Device_t) is
  begin
    raise Ada.IO_Exceptions.Data_Error with
      "requested format does not match device format (" &
        Format_t'Image (Device.Capture_Format) & ")";
  end Invalid_Format;

  --
  -- Open_Device
  --

  type Map_Format_t is array (Format_t) of Types.Enumeration_t;

  Map_Format : constant Map_Format_t :=
    (Mono_8    => Thin.AL_FORMAT_MONO8,
     Stereo_8  => Thin.AL_FORMAT_STEREO8,
     Mono_16   => Thin.AL_FORMAT_MONO16,
     Stereo_16 => Thin.AL_FORMAT_STEREO16,
     Unknown   => 0);

  function Open_Default_Device
    (Frequency   : in Types.Frequency_t;
     Format      : in Request_Format_t;
     Buffer_Size : in Buffer_Size_t) return Device_t
  is
    Device : Device_t;
  begin
    Device.Device_Data := ALC_Thin.Capture_Open_Device
      (Name        => System.Null_Address,
       Frequency   => Types.Unsigned_Integer_t (Frequency),
       Format      => Map_Format (Format),
       Buffer_Size => Types.Size_t (Buffer_Size));
    return Device;
  end Open_Default_Device;

  function Open_Device
    (Name        : in String;
     Frequency   : in Types.Frequency_t;
     Format      : in Request_Format_t;
     Buffer_Size : in Buffer_Size_t) return Device_t
  is
    C_Name : aliased C.char_array := C.To_C (Name);
    Device : Device_t;
  begin
    Device.Device_Data := ALC_Thin.Capture_Open_Device
      (Name        => C_Name (C_Name'First)'Address,
       Frequency   => Types.Unsigned_Integer_t (Frequency),
       Format      => Map_Format (Format),
       Buffer_Size => Types.Size_t (Buffer_Size));
    return Device;
  end Open_Device;

  --
  -- Samples_*
  --

  procedure Samples_Mono_8
    (Device  : in     Device_t;
     Samples :    out OpenAL.Buffer.Sample_Array_8_t) is
  begin
    if Device.Capture and Device.Capture_Format = Mono_8 then
      ALC_Thin.Capture_Samples
        (Device  => Device.Device_Data,
         Buffer  => Samples (Samples'First)'Address,
         Samples => Samples'Length);
    else
      Invalid_Format (Device);
    end if;
  end Samples_Mono_8;

  procedure Samples_Mono_16
    (Device  : in     Device_t;
     Samples :    out OpenAL.Buffer.Sample_Array_16_t) is
  begin
    if Device.Capture and Device.Capture_Format = Mono_16 then
      ALC_Thin.Capture_Samples
        (Device  => Device.Device_Data,
         Buffer  => Samples (Samples'First)'Address,
         Samples => Samples'Length);
    else
      Invalid_Format (Device);
    end if;
  end Samples_Mono_16;

  procedure Samples_Stereo_8
    (Device  : in     Device_t;
     Samples :    out OpenAL.Buffer.Sample_Array_8_t) is
  begin
    if Device.Capture and Device.Capture_Format = Stereo_8 then
      ALC_Thin.Capture_Samples
        (Device  => Device.Device_Data,
         Buffer  => Samples (Samples'First)'Address,
         Samples => Samples'Length);
    else
      Invalid_Format (Device);
    end if;
  end Samples_Stereo_8;

  procedure Samples_Stereo_16
    (Device  : in     Device_t;
     Samples :    out OpenAL.Buffer.Sample_Array_16_t) is
  begin
    if Device.Capture and Device.Capture_Format = Stereo_16 then
      ALC_Thin.Capture_Samples
        (Device  => Device.Device_Data,
         Buffer  => Samples (Samples'First)'Address,
         Samples => Samples'Length);
    else
      Invalid_Format (Device);
    end if;
  end Samples_Stereo_16;

  --
  -- Start
  --

  procedure Start (Device : in Device_t) is
  begin
    ALC_Thin.Capture_Start (Device.Device_Data);
  end Start;

  --
  -- Stop
  --

  procedure Stop (Device : in Device_t) is
  begin
    ALC_Thin.Capture_Stop (Device.Device_Data);
  end Stop;

end OpenAL.Context.Capture;
