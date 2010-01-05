with OpenAL.ALC_Thin;

package OpenAL.Context is

  --
  -- Types
  --

  type Device_t  is private;
  type Context_t is private;

  Invalid_Device  : constant Device_t;
  Invalid_Context : constant Context_t;

  --
  -- API
  --

  function Open_Device
    (Specifier : in String) return Device_t;

  function Close_Device
    (Device : in Device_t) return Boolean;

  function Create_Context
    (Device : in Device_t) return Context_t;

private

  type Device_t is new ALC_Thin.Device_t;
  type Context_t is new ALC_Thin.Context_t;

  Invalid_Device  : constant Device_t  := Device_t (ALC_Thin.Invalid_Device);
  Invalid_Context : constant Context_t := Context_t (ALC_Thin.Invalid_Context);

end OpenAL.Context;
