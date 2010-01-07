with OpenAL.Types;

package OpenAL.Global is

  --
  -- Distance_Model
  --

  type Distance_Model_t is
    (None,
     Inverse_Distance,
     Inverse_Distance_Clamped,
     Linear_Distance,
     Linear_Distance_Clamped,
     Exponent_Distance,
     Exponent_Distance_Clamped);

  -- proc_map : alDistanceModel
  procedure Set_Distance_Model (Model : in Distance_Model_t);

  -- proc_map : alGetInteger
  function Get_Distance_Model return Distance_Model_t;

  --
  -- Doppler_Factor
  --

  -- proc_map : alDopplerFactor
  procedure Set_Doppler_Factor (Factor : in Types.Natural_Float_t);

  -- proc_map : alGetFloat
  function Get_Doppler_Factor return Types.Natural_Float_t;

end OpenAL.Global;
