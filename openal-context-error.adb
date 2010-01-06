with OpenAL.ALC_Thin;

package body OpenAL.Context.Error is

  function Map_Constant_To_Error (Error : in ALC_Thin.Enumeration_t) return Error_t is
    Value : Error_t;
  begin
    case Error is
      when ALC_Thin.ALC_NO_ERROR        => Value := No_Error;
      when ALC_Thin.ALC_INVALID_DEVICE  => Value := Invalid_Device;
      when ALC_Thin.ALC_INVALID_CONTEXT => Value := Invalid_Context;
      when ALC_Thin.ALC_INVALID_ENUM    => Value := Invalid_Enumeration;
      when ALC_Thin.ALC_INVALID_VALUE   => Value := Invalid_Value;
      when ALC_Thin.ALC_OUT_OF_MEMORY   => Value := Out_Of_Memory;
      when others =>
        raise Constraint_Error with "invalid enumeration value";
    end case;

    return Value;
  end Map_Constant_To_Error;

  function Get_Error (Device : in Device_t) return Error_t is
  begin
    return Map_Constant_To_Error (ALC_Thin.Get_Error (Device.Device_Data));
  end Get_Error;

end OpenAL.Context.Error;
