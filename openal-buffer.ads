with OpenAL.Thin;
with OpenAL.Types;

package OpenAL.Buffer is

  --
  -- Types
  --

  type Buffer_ID_t          is new Thin.Unsigned_Integer_t;
  type Buffer_Array_Index_t is range 1 .. Buffer_ID_t'Last;
  type Buffer_Array_t       is array (Buffer_Array_Index_t range <>) of Buffer_ID_t;

  type Buffer_Attribute_t is (Frequency, Size, Bits, Channels);

  type Frequency_t is new Thin.Size_t range 1 .. Thin.Size_t'Last;

  type Sample_16_t is range -32768 .. 32767;
  for Sample_16_t'Size use 16;

  type Sample_8_t is range 0 .. 255;
  for Sample_8_t'Size use 8;

  type Sample_Array_16_t is array (Natural range <>) of aliased Sample_16_t;
  type Sample_Array_8_t is array (Natural range <>) of aliased Sample_8_t;

  --
  -- API
  --

  -- proc_map : alGenBuffers
  procedure Generate_Buffers
    (Buffers : in out Buffer_Array_t);

  -- proc_map : alDeleteBuffers
  procedure Delete_Buffers
    (Buffers : in Buffer_Array_t);

  -- proc_map : alIsBuffer
  function Is_Valid (Buffer : in Buffer_ID_t) return Boolean;

  -- proc_map : alBuffer3f
  procedure Set_Attribute_3f
    (Buffer    : in Buffer_ID_t;
     Attribute : in Buffer_Attribute_t;
     Value_1   : in Types.Float_t;
     Value_2   : in Types.Float_t;
     Value_3   : in Types.Float_t);

  -- proc_map : alBuffer3i
  procedure Set_Attribute_3i
    (Buffer    : in Buffer_ID_t;
     Attribute : in Buffer_Attribute_t;
     Value_1   : in Types.Integer_t;
     Value_2   : in Types.Integer_t;
     Value_3   : in Types.Integer_t);

  -- proc_map : alBufferf
  procedure Set_Attribute_f
    (Buffer    : in Buffer_ID_t;
     Attribute : in Buffer_Attribute_t;
     Value     : in Types.Float_t);

  -- proc_map : alBufferi
  procedure Set_Attribute_i
    (Buffer    : in Buffer_ID_t;
     Attribute : in Buffer_Attribute_t;
     Value     : in Types.Integer_t);

  -- proc_map : alBufferfv
  procedure Set_Attribute_fv
    (Buffer    : in Buffer_ID_t;
     Attribute : in Buffer_Attribute_t;
     Values    : in Types.Vector_3f_t);

  -- proc_map : alBufferiv
  procedure Set_Attribute_iv
    (Buffer    : in Buffer_ID_t;
     Attribute : in Buffer_Attribute_t;
     Values    : in Types.Vector_3i_t);

  -- proc_map : alBufferData
  procedure Set_Data_Mono_8
    (Buffer    : in Buffer_ID_t;
     Data      : in Sample_Array_8_t;
     Frequency : in Frequency_t);

  -- proc_map : alBufferData
  procedure Set_Data_Stereo_8
    (Buffer    : in Buffer_ID_t;
     Data      : in Sample_Array_8_t;
     Frequency : in Frequency_t);

  -- proc_map : alBufferData
  procedure Set_Data_Mono_16
    (Buffer    : in Buffer_ID_t;
     Data      : in Sample_Array_16_t;
     Frequency : in Frequency_t);

  -- proc_map : alBufferData
  procedure Set_Data_Stereo_16
    (Buffer    : in Buffer_ID_t;
     Data      : in Sample_Array_16_t;
     Frequency : in Frequency_t);

end OpenAL.Buffer;
