with Interfaces.C;
with System;

package body OpenAL.Context is
  package C renames Interfaces.C;

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

end OpenAL.Context;
