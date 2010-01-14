with Ada.IO_Exceptions;
with Interfaces.C.Strings;
with Interfaces.C;
with System;

package body OpenAL.Context is
  package C         renames Interfaces.C;
  package C_Strings renames Interfaces.C.Strings;

  --
  -- Close_Device
  --

  procedure Close_Device (Device : in out Device_t) is
    Return_Code : constant Boolean :=
      Boolean (ALC_Thin.Close_Device (Device.Device_Data));
  begin
    Device := Invalid_Device;

    pragma Assert (Return_Code'Size > 0);
  end Close_Device;

  --
  -- Create_Context
  --

  --
  -- Mapping between attribute selection and constants.
  --

  type Attribute_Map_t is array (Attribute_t) of Types.Integer_t;

  Attribute_Map : constant Attribute_Map_t :=
    (Attribute_Frequency      => ALC_Thin.ALC_FREQUENCY,
     Attribute_Refresh        => ALC_Thin.ALC_REFRESH,
     Attribute_Synchronous    => ALC_Thin.ALC_SYNC,
     Attribute_Mono_Sources   => ALC_Thin.ALC_MONO_SOURCES,
     Attribute_Stereo_Sources => ALC_Thin.ALC_STEREO_SOURCES);

  --
  -- The input to alcCreateContext is a list of 'integer pairs' terminated
  -- with zeroes:
  --
  -- [ALC_FREQUENCY][44100][AL_SYNC][1][0][0]
  --

  Input_Size : constant Natural := (Attribute_Array_t'Length + 1) * 2;

  type Input_Array_t is array (1 .. Input_Size) of aliased Types.Integer_t;

  function Create_Context
    (Device : in Device_t) return Context_t is
  begin
    return Context_t (ALC_Thin.Create_Context
      (Device         => Device.Device_Data,
       Attribute_List => System.Null_Address));
  end Create_Context;

  function Create_Context_With_Attributes
    (Device     : in Device_t;
     Attributes : in Context_Attributes_t) return Context_t
  is
    Input    : Input_Array_t := (others => 0);
    Position : Positive      := Input_Array_t'First;
  begin
    for Attribute in Attribute_t'Range loop
      if Attributes.Specified (Attribute) then
        Input (Position)     := Attribute_Map (Attribute);
        Input (Position + 1) := Attributes.Values (Attribute);
        Position             := Position + 2;
      end if;
    end loop;

    return Context_t (ALC_Thin.Create_Context
      (Device         => Device.Device_Data,
       Attribute_List => Input (Input'First)'Address));
  end Create_Context_With_Attributes;

  --
  -- Destroy_Context
  --

  procedure Destroy_Context
    (Context : in Context_t) is
  begin
    ALC_Thin.Destroy_Context (ALC_Thin.Context_t (Context));
  end Destroy_Context;

  --
  -- Device_Data
  --

  function Device_Data (Device : in Device_t) return ALC_Thin.Device_t is
  begin
    return Device.Device_Data;
  end Device_Data;

  --
  -- Get_*
  --

  function Get_String
    (Device    : ALC_Thin.Device_t;
     Parameter : Types.Enumeration_t) return C_Strings.chars_ptr;
  pragma Import (C, Get_String, "alcGetString");

  use type C_Strings.chars_ptr;
  use type ALC_Thin.Device_t;
  use type System.Address;

  Null_Device : constant ALC_Thin.Device_t := ALC_Thin.Device_t (System.Null_Address);

  function Get_Available_Capture_Devices return OpenAL.List.String_Vector_t is
    Address : System.Address;
    List    : OpenAL.List.String_Vector_t;
  begin
    Address := ALC_Thin.Get_String
      (Device => ALC_Thin.Device_t (System.Null_Address),
       Token  => ALC_Thin.ALC_CAPTURE_DEVICE_SPECIFIER);
    if Address /= System.Null_Address then
      OpenAL.List.Address_To_Vector
        (Address => Address,
         List    => List);
    end if;

    return List;
  end Get_Available_Capture_Devices;

  function Get_Available_Playback_Devices return OpenAL.List.String_Vector_t is
    Address : System.Address;
    List    : OpenAL.List.String_Vector_t;
  begin
    Address := ALC_Thin.Get_String
      (Device => ALC_Thin.Device_t (System.Null_Address),
       Token  => ALC_Thin.ALC_DEVICE_SPECIFIER);
    if Address /= System.Null_Address then
      OpenAL.List.Address_To_Vector
        (Address => Address,
         List    => List);
    end if;

    return List;
  end Get_Available_Playback_Devices;

  function Get_Capture_Samples
    (Device : in Device_t) return Natural
  is
    Value : aliased Types.Integer_t := 0;
  begin
    ALC_Thin.Get_Integerv
      (Device => Device.Device_Data,
       Token  => ALC_Thin.ALC_CAPTURE_SAMPLES,
       Size   => 1,
       Data   => Value'Address);
    return Natural (Value);
  end Get_Capture_Samples;

  function Get_Context_Device (Context : in Context_t) return Device_t is
    Device : Device_t;
  begin
    Device.Device_Data := ALC_Thin.Get_Contexts_Device (ALC_Thin.Context_t (Context));
    return Device;
  end Get_Context_Device;

  function Get_Current_Context return Context_t is
  begin
    return Context_t (ALC_Thin.Get_Current_Context);
  end Get_Current_Context;

  function Get_Default_Capture_Device_Specifier return String is
    CS : constant C_Strings.chars_ptr := Get_String
      (Device    => Null_Device,
       Parameter => ALC_Thin.ALC_CAPTURE_DEFAULT_DEVICE_SPECIFIER);
  begin
    if CS /= C_Strings.Null_Ptr then
      return C_Strings.Value (CS);
    else
      raise Ada.IO_Exceptions.Device_Error with "no capture device available";
    end if;
  end Get_Default_Capture_Device_Specifier;

  function Get_Default_Device_Specifier return String is
    CS : constant C_Strings.chars_ptr := Get_String
      (Device    => Null_Device,
       Parameter => ALC_Thin.ALC_DEFAULT_DEVICE_SPECIFIER);
  begin
    if CS /= C_Strings.Null_Ptr then
      return C_Strings.Value (CS);
    else
      raise Ada.IO_Exceptions.Device_Error with "no device available";
    end if;
  end Get_Default_Device_Specifier;

  function Get_Device_Specifier
    (Device : in Device_t) return String is
  begin
    if Device.Device_Data = Null_Device then
      raise Ada.IO_Exceptions.Device_Error with "invalid device";
    end if;

    return C_Strings.Value
      (Get_String
        (Device    => Device.Device_Data,
         Parameter => ALC_Thin.ALC_DEVICE_SPECIFIER));
  end Get_Device_Specifier;

  function Get_Extensions
    (Device : in Device_t) return String is
  begin
    if Device.Device_Data = Null_Device then
      raise Ada.IO_Exceptions.Device_Error with "invalid device";
    end if;

    return C_Strings.Value
      (Get_String
        (Device    => Device.Device_Data,
         Parameter => ALC_Thin.ALC_EXTENSIONS));
  end Get_Extensions;

  function Get_Frequency
    (Device : in Device_t) return Types.Frequency_t
  is
    Value : aliased Types.Integer_t := Types.Integer_t (Types.Frequency_t'First);
  begin
    ALC_Thin.Get_Integerv
      (Device => Device.Device_Data,
       Token  => ALC_Thin.ALC_FREQUENCY,
       Size   => 1,
       Data   => Value'Address);
    return Types.Frequency_t (Value);
  end Get_Frequency;

  function Get_Major_Version
    (Device : in Device_t) return Natural
  is
    Value : aliased Types.Integer_t := 0;
  begin
    ALC_Thin.Get_Integerv
      (Device => Device.Device_Data,
       Token  => ALC_Thin.ALC_MAJOR_VERSION,
       Size   => 1,
       Data   => Value'Address);
    return Natural (Value);
  end Get_Major_Version;

  function Get_Minor_Version
    (Device : in Device_t) return Natural
  is
    Value : aliased Types.Integer_t := 0;
  begin
    ALC_Thin.Get_Integerv
      (Device => Device.Device_Data,
       Token  => ALC_Thin.ALC_MINOR_VERSION,
       Size   => 1,
       Data   => Value'Address);
    return Natural (Value);
  end Get_Minor_Version;

  function Get_Mono_Sources
    (Device : in Device_t) return Natural
  is
    Value : aliased Types.Integer_t := 0;
  begin
    ALC_Thin.Get_Integerv
      (Device => Device.Device_Data,
       Token  => ALC_Thin.ALC_MONO_SOURCES,
       Size   => 1,
       Data   => Value'Address);
    return Natural (Value);
  end Get_Mono_Sources;

  function Get_Refresh
    (Device : in Device_t) return Natural
  is
    Value : aliased Types.Integer_t := 0;
  begin
    ALC_Thin.Get_Integerv
      (Device => Device.Device_Data,
       Token  => ALC_Thin.ALC_REFRESH,
       Size   => 1,
       Data   => Value'Address);
    return Natural (Value);
  end Get_Refresh;

  function Get_Stereo_Sources
    (Device : in Device_t) return Natural
  is
    Value : aliased Types.Integer_t := 0;
  begin
    ALC_Thin.Get_Integerv
      (Device => Device.Device_Data,
       Token  => ALC_Thin.ALC_STEREO_SOURCES,
       Size   => 1,
       Data   => Value'Address);
    return Natural (Value);
  end Get_Stereo_Sources;

  function Get_Synchronous
    (Device : in Device_t) return Boolean
  is
    Value : aliased Types.Integer_t := 0;
  begin
    ALC_Thin.Get_Integerv
      (Device => Device.Device_Data,
       Token  => ALC_Thin.ALC_SYNC,
       Size   => 1,
       Data   => Value'Address);
    return Boolean'Val (Value);
  end Get_Synchronous;

  --
  -- Is_Extension_Present
  --

  function Is_Extension_Present
    (Device : in Device_t;
     Name   : in String) return Boolean
  is
    C_Name : aliased C.char_array := C.To_C (Name);
  begin
    return Boolean (ALC_Thin.Is_Extension_Present
      (Device         => Device.Device_Data,
       Extension_Name => C_Name (C_Name'First)'Address));
  end Is_Extension_Present;

  --
  -- Make_Context_Current
  --

  function Make_Context_Current
    (Context : in Context_t) return Boolean is
  begin
    return Boolean (ALC_Thin.Make_Context_Current (ALC_Thin.Context_t (Context)));
  end Make_Context_Current;

  --
  -- Open_Device
  --

  function Open_Default_Device return Device_t is
    Device : Device_t;
  begin
    Device.Device_Data := ALC_Thin.Open_Device
      (Specifier => System.Null_Address);
    return Device;
  end Open_Default_Device;

  function Open_Device
    (Specifier : in String) return Device_t
  is
    C_Spec : aliased C.char_array := C.To_C (Specifier);
    Device : Device_t;
  begin
    Device.Device_Data := ALC_Thin.Open_Device
      (Specifier => C_Spec (C_Spec'First)'Address);
    return Device;
  end Open_Device;

  --
  -- Process_Context
  --

  procedure Process_Context
    (Context : in Context_t) is
  begin
    ALC_Thin.Process_Context (ALC_Thin.Context_t (Context));
  end Process_Context;

  --
  -- Set_*
  --

  procedure Set_Frequency
    (Attributes : in out Context_Attributes_t;
     Frequency  : in     Types.Frequency_t) is
  begin
    Attributes.Values    (Attribute_Frequency) := Types.Integer_t (Frequency);
    Attributes.Specified (Attribute_Frequency) := True;
  end Set_Frequency;

  procedure Set_Mono_Sources
    (Attributes : in out Context_Attributes_t;
     Sources    : in     Natural) is
  begin
    Attributes.Values    (Attribute_Mono_Sources) := Types.Integer_t (Sources);
    Attributes.Specified (Attribute_Mono_Sources) := True;
  end Set_Mono_Sources;

  procedure Set_Refresh
    (Attributes : in out Context_Attributes_t;
     Refresh    : in     Positive) is
  begin
    Attributes.Values    (Attribute_Refresh) := Types.Integer_t (Refresh);
    Attributes.Specified (Attribute_Refresh) := True;
  end Set_Refresh;

  procedure Set_Stereo_Sources
    (Attributes : in out Context_Attributes_t;
     Sources    : in     Natural) is
  begin
    Attributes.Values    (Attribute_Stereo_Sources) := Types.Integer_t (Sources);
    Attributes.Specified (Attribute_Stereo_Sources) := True;
  end Set_Stereo_Sources;

  procedure Set_Synchronous
    (Attributes  : in out Context_Attributes_t;
     Synchronous : in     Boolean) is
  begin
    Attributes.Values    (Attribute_Synchronous) := Types.Integer_t (Boolean'Pos (Synchronous));
    Attributes.Specified (Attribute_Synchronous) := True;
  end Set_Synchronous;

  --
  -- Suspend_Context
  --

  procedure Suspend_Context
    (Context : in Context_t) is
  begin
    ALC_Thin.Suspend_Context (ALC_Thin.Context_t (Context));
  end Suspend_Context;

end OpenAL.Context;
