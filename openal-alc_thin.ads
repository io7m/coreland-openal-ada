-- Automatically generated, do not edit.

with Interfaces.C;
with System;
with OpenAL.Types;

package OpenAL.ALC_Thin is
  package C renames Interfaces.C;

  -- Constants

  ALC_INVALID                           : constant := 16#0#;
  ALC_FALSE                             : constant := 16#0#;
  ALC_TRUE                              : constant := 16#1#;
  ALC_FREQUENCY                         : constant := 16#1007#;
  ALC_REFRESH                           : constant := 16#1008#;
  ALC_SYNC                              : constant := 16#1009#;
  ALC_MONO_SOURCES                      : constant := 16#1010#;
  ALC_STEREO_SOURCES                    : constant := 16#1011#;
  ALC_NO_ERROR                          : constant := 16#0#;
  ALC_INVALID_DEVICE                    : constant := 16#A001#;
  ALC_INVALID_CONTEXT                   : constant := 16#A002#;
  ALC_INVALID_ENUM                      : constant := 16#A003#;
  ALC_INVALID_VALUE                     : constant := 16#A004#;
  ALC_OUT_OF_MEMORY                     : constant := 16#A005#;
  ALC_DEFAULT_DEVICE_SPECIFIER          : constant := 16#1004#;
  ALC_DEVICE_SPECIFIER                  : constant := 16#1005#;
  ALC_EXTENSIONS                        : constant := 16#1006#;
  ALC_MAJOR_VERSION                     : constant := 16#1000#;
  ALC_MINOR_VERSION                     : constant := 16#1001#;
  ALC_ATTRIBUTES_SIZE                   : constant := 16#1002#;
  ALC_ALL_ATTRIBUTES                    : constant := 16#1003#;
  ALC_CAPTURE_DEVICE_SPECIFIER          : constant := 16#310#;
  ALC_CAPTURE_DEFAULT_DEVICE_SPECIFIER  : constant := 16#311#;
  ALC_CAPTURE_SAMPLES                   : constant := 16#312#;

  --
  -- Types
  --

  type Device_t is new System.Address;

  type Context_t is new System.Address;

  Invalid_Device  : constant Device_t  := Device_t (System.Null_Address);
  Invalid_Context : constant Context_t := Context_t (System.Null_Address);

  --
  -- OpenALC 1.1
  --

  function Create_Context
    (Device         : Device_t;
     Attribute_List : System.Address) return Context_t;
  pragma Import (C, Create_Context, "alcCreateContext");

  function Make_Context_Current
    (Context : Context_t) return Types.Boolean_t;
  pragma Import (C, Make_Context_Current, "alcMakeContextCurrent");

  procedure Process_Context
    (Context : Context_t);
  pragma Import (C, Process_Context, "alcProcessContext");

  procedure Suspend_Context
    (Context : Context_t);
  pragma Import (C, Suspend_Context, "alcSuspendContext");

  procedure Destroy_Context
    (Context : Context_t);
  pragma Import (C, Destroy_Context, "alcDestroyContext");

  function Get_Current_Context return Context_t;
  pragma Import (C, Get_Current_Context, "alcGetCurrentContext");

  function Get_Contexts_Device
    (Context : Context_t) return Device_t;
  pragma Import (C, Get_Contexts_Device, "alcGetContextsDevice");

  function Open_Device
    (Specifier : System.Address) return Device_t;
  pragma Import (C, Open_Device, "alcOpenDevice");

  function Close_Device
    (Device : Device_t) return Types.Boolean_t;
  pragma Import (C, Close_Device, "alcCloseDevice");

  function Get_Error
    (Device : Device_t) return Types.Enumeration_t;
  pragma Import (C, Get_Error, "alcGetError");

  function Is_Extension_Present
    (Device         : Device_t;
     Extension_Name : System.Address) return Types.Boolean_t;
  pragma Import (C, Is_Extension_Present, "alcIsExtensionPresent");

  function Get_Proc_Address
    (Device : Device_t;
     Name   : System.Address) return Types.Void_Pointer_t;
  pragma Import (C, Get_Proc_Address, "alcGetProcAddress");

  function Get_Enum_Value
    (Device : Device_t;
     Name   : System.Address) return Types.Enumeration_t;
  pragma Import (C, Get_Enum_Value, "alcGetEnumValue");

  function Get_String
    (Device : Device_t;
     Token  : Types.Enumeration_t) return System.Address;
  pragma Import (C, Get_String, "alcGetString");

  procedure Get_Integerv
    (Device : Device_t;
     Token  : Types.Enumeration_t;
     Size   : Types.Size_t;
     Data   : System.Address);
  pragma Import (C, Get_Integerv, "alcGetIntegerv");

  function Capture_Open_Device
    (Name        : System.Address;
     Frequency   : Types.Unsigned_Integer_t;
     Format      : Types.Enumeration_t;
     Buffer_Size : Types.Size_t) return Device_t;
  pragma Import (C, Capture_Open_Device, "alcCaptureOpenDevice");

  function Capture_Close_Device
    (Device : Device_t) return Types.Boolean_t;
  pragma Import (C, Capture_Close_Device, "alcCaptureCloseDevice");

  procedure Capture_Start
    (Device : Device_t);
  pragma Import (C, Capture_Start, "alcCaptureStart");

  procedure Capture_Stop
    (Device : Device_t);
  pragma Import (C, Capture_Stop, "alcCaptureStop");

  procedure Capture_Samples
    (Device  : Device_t;
     Buffer  : Types.Void_Pointer_t;
     Samples : Types.Size_t);
  pragma Import (C, Capture_Samples, "alcCaptureSamples");

end OpenAL.ALC_Thin;
