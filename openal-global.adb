with OpenAL.Thin;

package body OpenAL.Global is

  --
  -- Distance_Model
  --

  type Map_From_Distance_Model_t is array (Distance_Model_t) of Thin.Enumeration_t;

  Map_From_Distance_Model : constant Map_From_Distance_Model_t :=
    (None                      => Thin.AL_NONE,
     Inverse_Distance          => Thin.AL_INVERSE_DISTANCE,
     Inverse_Distance_Clamped  => Thin.AL_INVERSE_DISTANCE_CLAMPED,
     Linear_Distance           => Thin.AL_LINEAR_DISTANCE,
     Linear_Distance_Clamped   => Thin.AL_LINEAR_DISTANCE_CLAMPED,
     Exponent_Distance         => Thin.AL_EXPONENT_DISTANCE,
     Exponent_Distance_Clamped => Thin.AL_EXPONENT_DISTANCE_CLAMPED);

  procedure Set_Distance_Model (Model : in Distance_Model_t) is
  begin
    Thin.Distance_Model (Map_From_Distance_Model (Model));
  end Set_Distance_Model;

  function Get_Distance_Model return Distance_Model_t is
    Value        : Thin.Integer_t;
    Return_Value : Distance_Model_t;
  begin
    Value := Thin.Get_Integer (Thin.AL_DISTANCE_MODEL);

    case Value is
      when Thin.AL_NONE                      => Return_Value := None;
      when Thin.AL_INVERSE_DISTANCE          => Return_Value := Inverse_Distance;
      when Thin.AL_INVERSE_DISTANCE_CLAMPED  => Return_Value := Inverse_Distance_Clamped;
      when Thin.AL_LINEAR_DISTANCE           => Return_Value := Linear_Distance;
      when Thin.AL_LINEAR_DISTANCE_CLAMPED   => Return_Value := Linear_Distance_Clamped;
      when Thin.AL_EXPONENT_DISTANCE         => Return_Value := Exponent_Distance;
      when Thin.AL_EXPONENT_DISTANCE_CLAMPED => Return_Value := Exponent_Distance_Clamped;
      when others =>
        raise Constraint_Error with "invalid value returned for distance model";
    end case;

    return Return_Value;
  end Get_Distance_Model;

end OpenAL.Global;
