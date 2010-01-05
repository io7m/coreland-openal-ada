with OpenAL.ALC_Thin;

package OpenAL.Context is

  --
  -- Types
  --

  type Device_t  is private;
  type Context_t is private;

  Invalid_Device  : constant Device_t;
  Invalid_Context : constant Context_t;
  Null_Context    : constant Context_t;

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

private

  type Device_t is new ALC_Thin.Device_t;
  type Context_t is new ALC_Thin.Context_t;

  Invalid_Device  : constant Device_t  := Device_t (ALC_Thin.Invalid_Device);
  Invalid_Context : constant Context_t := Context_t (ALC_Thin.Invalid_Context);
  Null_Context    : constant Context_t := Invalid_Context;

end OpenAL.Context;
