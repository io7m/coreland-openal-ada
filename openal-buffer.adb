with System;

package body OpenAL.Buffer is

  use type Thin.Size_t;

  type Attribute_Constant_Map_t is array (Buffer_Attribute_t) of Thin.Enumeration_t;

  Attribute_Constant_Map : constant Attribute_Constant_Map_t :=
    (Frequency => Thin.AL_FREQUENCY,
     Size      => Thin.AL_SIZE,
     Bits      => Thin.AL_BITS,
     Channels  => Thin.AL_CHANNELS);

  procedure Generate_Buffers
    (Buffers : in out Buffer_Array_t) is
  begin
    Thin.Gen_Buffers
      (Size    => Buffers'Length,
       Buffers => Buffers (Buffers'First)'Address);
  end Generate_Buffers;

  procedure Delete_Buffers
    (Buffers : in Buffer_Array_t) is
  begin
    Thin.Delete_Buffers
      (Size    => Buffers'Length,
       Sources => Buffers (Buffers'First)'Address);
  end Delete_Buffers;

  function Is_Valid (Buffer : in Buffer_ID_t) return Boolean is
  begin
    return Boolean (Thin.Is_Buffer (Thin.Unsigned_Integer_t (Buffer)));
  end Is_Valid;

  procedure Set_Attribute_3f
    (Buffer    : in Buffer_ID_t;
     Attribute : in Buffer_Attribute_t;
     Value_1   : in Types.Float_t;
     Value_2   : in Types.Float_t;
     Value_3   : in Types.Float_t) is
  begin
    Thin.Buffer_3f
      (Buffer_ID => Thin.Unsigned_Integer_t (Buffer),
       Parameter => Attribute_Constant_Map (Attribute),
       Value_1   => Thin.Float_t (Value_1),
       Value_2   => Thin.Float_t (Value_2),
       Value_3   => Thin.Float_t (Value_3));
  end Set_Attribute_3f;

  procedure Set_Attribute_3i
    (Buffer    : in Buffer_ID_t;
     Attribute : in Buffer_Attribute_t;
     Value_1   : in Types.Integer_t;
     Value_2   : in Types.Integer_t;
     Value_3   : in Types.Integer_t) is
  begin
    Thin.Buffer_3i
      (Buffer_ID => Thin.Unsigned_Integer_t (Buffer),
       Parameter => Attribute_Constant_Map (Attribute),
       Value_1   => Thin.Integer_t (Value_1),
       Value_2   => Thin.Integer_t (Value_2),
       Value_3   => Thin.Integer_t (Value_3));
  end Set_Attribute_3i;

  procedure Set_Attribute_f
    (Buffer    : in Buffer_ID_t;
     Attribute : in Buffer_Attribute_t;
     Value     : in Types.Float_t) is
  begin
    Thin.Bufferf
      (Buffer_ID => Thin.Unsigned_Integer_t (Buffer),
       Parameter => Attribute_Constant_Map (Attribute),
       Value     => Thin.Float_t (Value));
  end Set_Attribute_f;

  procedure Set_Attribute_i
    (Buffer    : in Buffer_ID_t;
     Attribute : in Buffer_Attribute_t;
     Value     : in Types.Integer_t) is
  begin
    Thin.Bufferi
      (Buffer_ID => Thin.Unsigned_Integer_t (Buffer),
       Parameter => Attribute_Constant_Map (Attribute),
       Value     => Thin.Integer_t (Value));
  end Set_Attribute_i;

  procedure Set_Attribute_fv
    (Buffer    : in Buffer_ID_t;
     Attribute : in Buffer_Attribute_t;
     Values    : in Types.Vector_3f_t) is
  begin
    Thin.Bufferfv
      (Buffer_ID => Thin.Unsigned_Integer_t (Buffer),
       Parameter => Attribute_Constant_Map (Attribute),
       Values    => Values (Values'First)'Address);
  end Set_Attribute_fv;

  procedure Set_Attribute_iv
    (Buffer    : in Buffer_ID_t;
     Attribute : in Buffer_Attribute_t;
     Values    : in Types.Vector_3i_t) is
  begin
    Thin.Bufferiv
      (Buffer_ID => Thin.Unsigned_Integer_t (Buffer),
       Parameter => Attribute_Constant_Map (Attribute),
       Values    => Values (Values'First)'Address);
  end Set_Attribute_iv;

  procedure Set_Data_Mono_8
    (Buffer    : in Buffer_ID_t;
     Data      : in Sample_Array_8_t;
     Frequency : in Frequency_t) is
  begin
    Thin.Buffer_Data
      (Buffer_ID => Thin.Unsigned_Integer_t (Buffer),
       Format    => Thin.AL_FORMAT_MONO8,
       Data      => Data (Data'First)'Address,
       Size      => Data'Size / System.Storage_Unit,
       Frequency => Thin.Size_t (Frequency));
  end Set_Data_Mono_8;

  procedure Set_Data_Stereo_8
    (Buffer    : in Buffer_ID_t;
     Data      : in Sample_Array_8_t;
     Frequency : in Frequency_t) is
  begin
    Thin.Buffer_Data
      (Buffer_ID => Thin.Unsigned_Integer_t (Buffer),
       Format    => Thin.AL_FORMAT_STEREO8,
       Data      => Data (Data'First)'Address,
       Size      => Data'Size / System.Storage_Unit,
       Frequency => Thin.Size_t (Frequency));
  end Set_Data_Stereo_8;

  procedure Set_Data_Mono_16
    (Buffer    : in Buffer_ID_t;
     Data      : in Sample_Array_16_t;
     Frequency : in Frequency_t) is
  begin
    Thin.Buffer_Data
      (Buffer_ID => Thin.Unsigned_Integer_t (Buffer),
       Format    => Thin.AL_FORMAT_MONO16,
       Data      => Data (Data'First)'Address,
       Size      => Data'Size / System.Storage_Unit,
       Frequency => Thin.Size_t (Frequency));
  end Set_Data_Mono_16;

  procedure Set_Data_Stereo_16
    (Buffer    : in Buffer_ID_t;
     Data      : in Sample_Array_16_t;
     Frequency : in Frequency_t) is
  begin
    Thin.Buffer_Data
      (Buffer_ID => Thin.Unsigned_Integer_t (Buffer),
       Format    => Thin.AL_FORMAT_STEREO16,
       Data      => Data (Data'First)'Address,
       Size      => Data'Size / System.Storage_Unit,
       Frequency => Thin.Size_t (Frequency));
  end Set_Data_Stereo_16;

end OpenAL.Buffer;
