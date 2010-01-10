with OpenAL.Buffer;
with OpenAL.Types;

package OpenAL.Extension.Float32 is

  function Is_Present return Boolean;

  --
  -- This will most likely result in an IEEE single precision float
  -- on the majority of platforms.
  --

  type Sample_Float_32_t is digits 6;
  for Sample_Float_32_t'Size use 32;

  type Sample_Array_Float_32_t is
    array (Buffer.Sample_Size_t range <>) of aliased Sample_Float_32_t;

  -- proc_map : alBufferData
  procedure Set_Data_Mono_Float_32
    (Buffer    : in OpenAL.Buffer.Buffer_t;
     Data      : in Sample_Array_Float_32_t;
     Frequency : in Types.Frequency_t);

  -- proc_map : alBufferData
  procedure Set_Data_Stereo_Float_32
    (Buffer    : in OpenAL.Buffer.Buffer_t;
     Data      : in Sample_Array_Float_32_t;
     Frequency : in Types.Frequency_t);

end OpenAL.Extension.Float32;
