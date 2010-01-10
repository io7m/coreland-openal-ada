with OpenAL.Extension.Float32_Thin;
with OpenAL.Global;
with OpenAL.Thin;
with System;

package body OpenAL.Extension.Float32 is

  use type Types.Size_t;

  function Is_Present return Boolean is
  begin
    return Global.Is_Extension_Present ("AL_EXT_FLOAT32");
  end Is_Present;

  procedure Set_Data_Mono_Float_32
    (Buffer    : in OpenAL.Buffer.Buffer_t;
     Data      : in Sample_Array_Float_32_t;
     Frequency : in Types.Frequency_t) is
  begin
    Thin.Buffer_Data
      (Buffer_ID => OpenAL.Buffer.To_Integer (Buffer),
       Format    => Float32_Thin.AL_FORMAT_MONO_FLOAT32,
       Data      => Data (Data'First)'Address,
       Size      => Data'Size / System.Storage_Unit,
       Frequency => Types.Size_t (Frequency));
  end Set_Data_Mono_Float_32;

  procedure Set_Data_Stereo_Float_32
    (Buffer    : in OpenAL.Buffer.Buffer_t;
     Data      : in Sample_Array_Float_32_t;
     Frequency : in Types.Frequency_t) is
  begin
    Thin.Buffer_Data
      (Buffer_ID => OpenAL.Buffer.To_Integer (Buffer),
       Format    => Float32_Thin.AL_FORMAT_STEREO_FLOAT32,
       Data      => Data (Data'First)'Address,
       Size      => Data'Size / System.Storage_Unit,
       Frequency => Types.Size_t (Frequency));
  end Set_Data_Stereo_Float_32;

end OpenAL.Extension.Float32;
