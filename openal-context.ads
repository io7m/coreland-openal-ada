with OpenAL.ALC_Thin;
with OpenAL.List;
with OpenAL.Types;

package OpenAL.Context is

  --
  -- Types
  --

  type Device_t  is private;
  type Context_t is private;

  Invalid_Device  : constant Device_t;
  Invalid_Context : constant Context_t;
  Null_Context    : constant Context_t;

  type Format_t is (Mono_8, Stereo_8, Mono_16, Stereo_16);

  --
  -- API
  --

  -- proc_map : alcOpenDevice
  function Open_Device
    (Specifier : in String) return Device_t;

  -- proc_map : alcOpenDevice
  function Open_Default_Device return Device_t;

  -- proc_map : alcCloseDevice
  function Close_Device
    (Device : in Device_t) return Boolean;

  -- proc_map : alcCreateContext
  function Create_Context
    (Device : in Device_t) return Context_t;

  -- proc_map : alcMakeContextCurrent
  function Make_Context_Current
    (Context : in Context_t) return Boolean;

  -- proc_map : alcProcessContext
  procedure Process_Context
    (Context : in Context_t);

  -- proc_map : alcSuspendContext
  procedure Suspend_Context
    (Context : in Context_t);

  -- proc_map : alcDestroyContext
  procedure Destroy_Context
    (Context : in Context_t);

  -- proc_map : alcGetCurrentContext
  function Get_Current_Context return Context_t;

  -- proc_map : alcGetContextsDevice
  function Get_Context_Device (Context : in Context_t) return Device_t;

  -- proc_map : alcIsExtensionPresent
  function Is_Extension_Present
    (Device : in Device_t;
     Name   : in String) return Boolean;

  --
  -- String queries
  --

  -- proc_map : alcGetString
  function Get_Default_Device_Specifier return String;

  -- proc_map : alcGetString
  function Get_Device_Specifier
    (Device : in Device_t) return String;

  -- proc_map : alcGetString
  function Get_Extensions
    (Device : in Device_t) return String;

  -- proc_map : alcGetString
  function Get_Default_Capture_Device_Specifier return String;

  -- proc_map : alcGetString
  function Get_Available_Capture_Devices return OpenAL.List.String_Vector_t;

  --
  -- Integer queries
  --

  -- proc_map : alcGetIntegerv
  function Get_Major_Version
    (Device : in Device_t) return Natural;

  -- proc_map : alcGetIntegerv
  function Get_Minor_Version
    (Device : in Device_t) return Natural;

  -- proc_map : alcGetIntegerv
  function Get_Capture_Samples
    (Device : in Device_t) return Natural;

  -- proc_map : alcGetIntegerv
  function Get_Frequency
    (Device : in Device_t) return Types.Frequency_t;

  -- proc_map : alcGetIntegerv
  function Get_Refresh
    (Device : in Device_t) return Natural;

  -- proc_map : alcGetIntegerv
  function Get_Synchronous
    (Device : in Device_t) return Boolean;

  -- proc_map : alcGetIntegerv
  function Get_Mono_Sources
    (Device : in Device_t) return Natural;

  -- proc_map : alcGetIntegerv
  function Get_Stereo_Sources
    (Device : in Device_t) return Natural;

private

  type Device_t is record
    Device_Data    : ALC_Thin.Device_t := ALC_Thin.Invalid_Device;
    Capture_Format : Format_t          := Mono_8;
    Capture        : Boolean           := False;
  end record;

  type Context_t is new ALC_Thin.Context_t;

  Invalid_Device  : constant Device_t  := (others => <>);
  Invalid_Context : constant Context_t := Context_t (ALC_Thin.Invalid_Context);
  Null_Context    : constant Context_t := Invalid_Context;

end OpenAL.Context;
