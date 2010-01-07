with OpenAL.ALC_Thin;
with OpenAL.List;

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
  function Default_Device_Specifier return String;

  -- proc_map : alcGetString
  function Device_Specifier
    (Device : in Device_t) return String;

  -- proc_map : alcGetString
  function Extensions
    (Device : in Device_t) return String;

  -- proc_map : alcGetString
  function Default_Capture_Device_Specifier return String;

  -- proc_map : alcGetString
  function Available_Capture_Devices return OpenAL.List.String_Vector_t;

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
