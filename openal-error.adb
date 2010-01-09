with OpenAL.Thin;
with OpenAL.Types;

package body OpenAL.Error is

  function Map_Constant_To_Error (Error : in Types.Enumeration_t) return Error_t is
    Value : Error_t;
  begin
    case Error is
      when Thin.AL_NO_ERROR          => Value := No_Error;
      when Thin.AL_INVALID_NAME      => Value := Invalid_Name;
      when Thin.AL_INVALID_ENUM      => Value := Invalid_Enumeration;
      when Thin.AL_INVALID_VALUE     => Value := Invalid_Value;
      when Thin.AL_INVALID_OPERATION => Value := Invalid_Operation;
      when Thin.AL_OUT_OF_MEMORY     => Value := Out_Of_Memory;
      when others =>
        raise Constraint_Error with "invalid enumeration value";
    end case;

    return Value;
  end Map_Constant_To_Error;

  function Get_Error return Error_t is
  begin
    return Map_Constant_To_Error (Thin.Get_Error);
  end Get_Error;

end OpenAL.Error;
