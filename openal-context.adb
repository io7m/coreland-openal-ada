with Ada.IO_Exceptions;
with Interfaces.C;
with Interfaces.C.Strings;
with System;

package body OpenAL.Context is
  package C         renames Interfaces.C;
  package C_Strings renames Interfaces.C.Strings;

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

  function Open_Default_Device return Device_t is
    Device : Device_t;
  begin
    Device.Device_Data := ALC_Thin.Open_Device
      (Specifier => System.Null_Address);
    return Device;
  end Open_Default_Device;

  function Close_Device
    (Device : in Device_t) return Boolean is
  begin
    return Boolean (ALC_Thin.Close_Device (Device.Device_Data));
  end Close_Device;

  function Create_Context
    (Device : in Device_t) return Context_t is
  begin
    return Context_t (ALC_Thin.Create_Context
      (Device         => Device.Device_Data,
       Attribute_List => System.Null_Address));
  end Create_Context;

  function Make_Context_Current
    (Context : in Context_t) return Boolean is
  begin
    return Boolean (ALC_Thin.Make_Context_Current (ALC_Thin.Context_t (Context)));
  end Make_Context_Current;

  procedure Process_Context
    (Context : in Context_t) is
  begin
    ALC_Thin.Process_Context (ALC_Thin.Context_t (Context));
  end Process_Context;

  procedure Suspend_Context
    (Context : in Context_t) is
  begin
    ALC_Thin.Suspend_Context (ALC_Thin.Context_t (Context));
  end Suspend_Context;

  procedure Destroy_Context
    (Context : in Context_t) is
  begin
    ALC_Thin.Destroy_Context (ALC_Thin.Context_t (Context));
  end Destroy_Context;

  function Get_Current_Context return Context_t is
  begin
    return Context_t (ALC_Thin.Get_Current_Context);
  end Get_Current_Context;

  function Get_Context_Device (Context : in Context_t) return Device_t is
    Device : Device_t;
  begin
    Device.Device_Data := ALC_Thin.Get_Contexts_Device (ALC_Thin.Context_t (Context));
    return Device;
  end Get_Context_Device;

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
  -- String queries
  --

  function Get_String
    (Device    : ALC_Thin.Device_t;
     Parameter : ALC_Thin.Enumeration_t) return C_Strings.chars_ptr;
  pragma Import (C, Get_String, "alcGetString");

  use type ALC_Thin.Device_t;

  Null_Device : constant ALC_Thin.Device_t := ALC_Thin.Device_t (System.Null_Address);

  function Default_Device_Specifier return String is
  begin
    return C_Strings.Value
      (Get_String
        (Device    => Null_Device,
         Parameter => ALC_Thin.ALC_DEFAULT_DEVICE_SPECIFIER));
  end Default_Device_Specifier;

  function Device_Specifier
    (Device : in Device_t) return String is
  begin
    if Device.Device_Data = Null_Device then
      raise Ada.IO_Exceptions.Device_Error with "invalid device";
    end if;

    return C_Strings.Value
      (Get_String
        (Device    => Device.Device_Data,
         Parameter => ALC_Thin.ALC_DEVICE_SPECIFIER));
  end Device_Specifier;

  function Extensions
    (Device : in Device_t) return String is
  begin
    if Device.Device_Data = Null_Device then
      raise Ada.IO_Exceptions.Device_Error with "invalid device";
    end if;

    return C_Strings.Value
      (Get_String
        (Device    => Device.Device_Data,
         Parameter => ALC_Thin.ALC_EXTENSIONS));
  end Extensions;

  function Default_Capture_Device_Specifier return String is
  begin
    return C_Strings.Value
      (Get_String
        (Device    => Null_Device,
         Parameter => ALC_Thin.ALC_CAPTURE_DEFAULT_DEVICE_SPECIFIER));
  end Default_Capture_Device_Specifier;

  function Available_Capture_Devices return OpenAL.List.String_Vector_t is
    Address : System.Address;
    List    : OpenAL.List.String_Vector_t;
  begin
    Address := ALC_Thin.Get_String
      (Device => ALC_Thin.Device_t (System.Null_Address),
       Token  => ALC_Thin.ALC_CAPTURE_DEVICE_SPECIFIER);
    OpenAL.List.Address_To_Vector
      (Address => Address,
       List    => List);
    return List;
  end Available_Capture_Devices;

end OpenAL.Context;
