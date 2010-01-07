with OpenAL.Thin;
with Interfaces.C;
with Interfaces.C.Strings;

package body OpenAL.Global is
  package C         renames Interfaces.C;
  package C_Strings renames Interfaces.C.Strings;

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

  --
  -- Doppler_Factor
  --

  procedure Set_Doppler_Factor (Factor : in Types.Natural_Float_t) is
  begin
    Thin.Doppler_Factor (Factor);
  end Set_Doppler_Factor;

  function Get_Doppler_Factor return Types.Natural_Float_t is
  begin
    return Thin.Get_Float (Thin.AL_DOPPLER_FACTOR);
  end Get_Doppler_Factor;

  --
  -- Speed_Of_Sound
  --

  procedure Set_Speed_Of_Sound (Factor : in Types.Positive_Float_t) is
  begin
    Thin.Speed_Of_Sound (Factor);
  end Set_Speed_Of_Sound;

  function Get_Speed_Of_Sound return Types.Positive_Float_t is
  begin
    return Thin.Get_Float (Thin.AL_SPEED_OF_SOUND);
  end Get_Speed_Of_Sound;

  --
  -- String queries
  --

  function Get_String (Parameter : Thin.Enumeration_t) return C_Strings.chars_ptr;
  pragma Import (C, Get_String, "alGetString");

  function Version return String is
  begin
    return C_Strings.Value (Get_String (Thin.AL_VERSION));
  end Version;

  function Renderer return String is
  begin
    return C_Strings.Value (Get_String (Thin.AL_RENDERER));
  end Renderer;

  function Vendor return String is
  begin
    return C_Strings.Value (Get_String (Thin.AL_VENDOR));
  end Vendor;

  function Extensions return String is
  begin
    return C_Strings.Value (Get_String (Thin.AL_EXTENSIONS));
  end Extensions;

  --
  -- Is_Extension_Present
  --

  function Is_Extension_Present (Name : in String) return Boolean is
    C_Name : aliased C.char_array := C.To_C (Name);
  begin
    return Boolean (Thin.Is_Extension_Present (C_Name (C_Name'First)'Address));
  end Is_Extension_Present;

end OpenAL.Global;
