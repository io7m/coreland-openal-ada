with OpenAL.ALC_Thin;
with OpenAL.List;
with OpenAL.Types;

package OpenAL.Context is

  --
  -- Types
  --

  type Device_t  is private;
  type Context_t is private;

  type Context_Attributes_t is private;

  Invalid_Device  : constant Device_t;
  Invalid_Context : constant Context_t;
  Null_Context    : constant Context_t;

  type    Format_t         is (Mono_8, Stereo_8, Mono_16, Stereo_16, Unknown);
  subtype Request_Format_t is Format_t range Mono_8 .. Stereo_16;

  --
  -- API
  --

  -- proc_map : alcOpenDevice
  function Open_Device
    (Specifier : in String) return Device_t;

  -- proc_map : alcOpenDevice
  function Open_Default_Device return Device_t;

  procedure Set_Frequency
    (Attributes : in out Context_Attributes_t;
     Frequency  : in     Types.Frequency_t);

  procedure Set_Refresh
    (Attributes : in out Context_Attributes_t;
     Refresh    : in     Positive);

  procedure Set_Synchronous
    (Attributes  : in out Context_Attributes_t;
     Synchronous : in     Boolean);

  procedure Set_Mono_Sources
    (Attributes : in out Context_Attributes_t;
     Sources    : in     Natural);

  procedure Set_Stereo_Sources
    (Attributes : in out Context_Attributes_t;
     Sources    : in     Natural);

  -- proc_map : alcCloseDevice
  procedure Close_Device
    (Device : in out Device_t);

  -- proc_map : alcCreateContext
  function Create_Context
    (Device : in Device_t) return Context_t;

  -- proc_map : alcCreateContext
  function Create_Context_With_Attributes
    (Device     : in Device_t;
     Attributes : in Context_Attributes_t) return Context_t;

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

  -- proc_map : alcGetString
  function Get_Available_Playback_Devices return OpenAL.List.String_Vector_t;

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

  --
  -- Private conveniences.
  --

  function Device_Data (Device : in Device_t) return ALC_Thin.Device_t;

private

  type Device_t is record
    Device_Data    : ALC_Thin.Device_t := ALC_Thin.Invalid_Device;
    Capture_Format : Format_t          := Unknown;
    Capture        : Boolean           := False;
  end record;

  type Context_t is new ALC_Thin.Context_t;

  Invalid_Device  : constant Device_t  := (others => <>);
  Invalid_Context : constant Context_t := Context_t (ALC_Thin.Invalid_Context);
  Null_Context    : constant Context_t := Invalid_Context;

  type Attribute_t is
    (Attribute_Frequency,
     Attribute_Refresh,
     Attribute_Synchronous,
     Attribute_Mono_Sources,
     Attribute_Stereo_Sources);

  type Attribute_Array_t     is array (Attribute_t) of Types.Integer_t;
  type Attribute_Specified_t is array (Attribute_t) of Boolean;

  type Context_Attributes_t is record
    Values    : Attribute_Array_t     := (others => 0);
    Specified : Attribute_Specified_t := (others => False);
  end record;

end OpenAL.Context;
