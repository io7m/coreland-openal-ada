with Interfaces.C;
with System;

package body OpenAL.Context is
  package C renames Interfaces.C;

  function Open_Device
    (Specifier : in String) return Device_t
  is
    C_Spec : aliased C.char_array := C.To_C (Specifier);
  begin
    return Device_t
      (ALC_Thin.Open_Device (Specifier => C_Spec (C_Spec'First)'Address));
  end Open_Device;

  function Close_Device
    (Device : in Device_t) return Boolean is
  begin
    return Boolean (ALC_Thin.Close_Device (ALC_Thin.Device_t (Device)));
  end Close_Device;

  function Create_Context
    (Device : in Device_t) return Context_t is
  begin
    return Context_t (ALC_Thin.Create_Context
      (Device         => ALC_Thin.Device_t (Device),
       Attribute_List => System.Null_Address));
  end Create_Context;

end OpenAL.Context;
