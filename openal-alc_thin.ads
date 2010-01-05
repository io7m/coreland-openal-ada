-- Automatically generated, do not edit.

with Interfaces.C;
with System;

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

  type String_t is new System.Address;

  -- ALCfloat
  type Float_t is new C.C_float;

  -- ALCdouble
  type Double_t is new C.double;

  -- ALCsizeiptr
  type Size_Pointer_t is mod 2 ** System.Word_Size;
  for Size_Pointer_t'Size use System.Word_Size;
  pragma Convention (C, Size_Pointer_t);

  -- ALCintptr
  type Integer_Pointer_t is mod 2 ** System.Word_Size;
  for Integer_Pointer_t'Size use System.Word_Size;
  pragma Convention (C, Integer_Pointer_t);

  -- ALCbitfield
  type Bitfield_t is mod 2 ** 32;
  for Bitfield_t'Size use 32;
  pragma Convention (C, Bitfield_t);

  -- ALCboolean
  type Boolean_t is new Boolean;
  for Boolean_t'Size use 8;
  pragma Convention (C, Boolean_t);

  -- ALCbyte
  type Byte_t is range -127 .. 127;
  for Byte_t'Size use 8;
  pragma Convention (C, Byte_t);

  -- ALCclampd
  subtype Clamped_Double_t is Double_t range 0.0 .. 1.0;

  -- ALCclampf
  subtype Clamped_Float_t is Float_t range 0.0 .. 1.0;

  -- ALCenum
  type Enumeration_t is mod 2 ** 32;
  for Enumeration_t'Size use 32;
  pragma Convention (C, Enumeration_t);

  -- ALCint
  type Integer_t is range -2147483647 .. 2147483647;
  for Integer_t'Size use 32;
  pragma Convention (C, Integer_t);

  -- ALCshort
  type Short_t is range -32767 .. 32767;
  for Short_t'Size use 16;
  pragma Convention (C, Short_t);

  -- ALCsizei
  type Size_t is range -2147483647 .. 2147483647;
  for Size_t'Size use 32;
  pragma Convention (C, Size_t);

  -- ALCubyte
  type Unsigned_Byte_t is mod 2 ** 8;
  for Unsigned_Byte_t'Size use 8;
  pragma Convention (C, Unsigned_Byte_t);

  -- ALCuint
  type Unsigned_Integer_t is mod 2 ** 32;
  for Unsigned_Integer_t'Size use 32;
  pragma Convention (C, Unsigned_Integer_t);

  -- ALCushort
  type Unsigned_Short_t is mod 2 ** 16;
  for Unsigned_Short_t'Size use 16;
  pragma Convention (C, Unsigned_Short_t);

  -- ALCvoid *
  subtype Void_Pointer_t is System.Address;

  -- ALCvoid **
  type Void_Pointer_Access_t is access all Void_Pointer_t;
  pragma Convention (C, Void_Pointer_Access_t);

  -- const ALCvoid **
  type Void_Pointer_Access_Constant_t is access constant System.Address;
  pragma Convention (C, Void_Pointer_Access_Constant_t);

  --
  -- OpenALC 1.1
  --

  function Create_Context
    (Device         : Device_t;
     Attribute_List : System.Address) return Context_t;
  pragma Import (C, Create_Context, "alcCreateContext");

  function Make_Context_Current
    (Context : Context_t) return Boolean_t;
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
    (Device : Device_t) return Boolean_t;
  pragma Import (C, Close_Device, "alcCloseDevice");

  function Get_Error
    (Device : Device_t) return Enumeration_t;
  pragma Import (C, Get_Error, "alcGetError");

  function Is_Extension_Present
    (Device         : Device_t;
     Extension_Name : System.Address) return Boolean_t;
  pragma Import (C, Is_Extension_Present, "alcIsExtensionPresent");

  function Get_Proc_Address
    (Device : Device_t;
     Name   : System.Address) return Void_Pointer_t;
  pragma Import (C, Get_Proc_Address, "alcGetProcAddress");

  function Get_Enum_Value
    (Device : Device_t;
     Name   : System.Address) return Enumeration_t;
  pragma Import (C, Get_Enum_Value, "alcGetEnumValue");

  function Get_String
    (Device : Device_t;
     Token  : Enumeration_t) return System.Address;
  pragma Import (C, Get_String, "alcGetString");

  procedure Get_Integerv
    (Device : Device_t;
     Token  : Enumeration_t;
     Size   : Size_t;
     Data   : System.Address);
  pragma Import (C, Get_Integerv, "alcGetIntegerv");

  function Capture_Open_Device
    (Name        : System.Address;
     Frequency   : Unsigned_Integer_t;
     Format      : Enumeration_t;
     Buffer_Size : Size_t) return Device_t;
  pragma Import (C, Capture_Open_Device, "alcCaptureOpenDevice");

  function Capture_Close_Device
    (Device : Device_t) return Boolean_t;
  pragma Import (C, Capture_Close_Device, "alcCaptureCloseDevice");

  procedure Capture_Start
    (Device : Device_t);
  pragma Import (C, Capture_Start, "alcCaptureStart");

  procedure Capture_Stop
    (Device : Device_t);
  pragma Import (C, Capture_Stop, "alcCaptureStop");

  procedure Capture_Samples
    (Device  : Device_t;
     Buffer  : Void_Pointer_t;
     Samples : Size_t);
  pragma Import (C, Capture_Samples, "alcCaptureSamples");

end OpenAL.ALC_Thin;
