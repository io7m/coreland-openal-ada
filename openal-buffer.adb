with OpenAL.Thin;
with System;

package body OpenAL.Buffer is

  use type Types.Size_t;

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

  function Is_Valid (Buffer : in Buffer_t) return Boolean is
  begin
    return Boolean (Thin.Is_Buffer (Types.Unsigned_Integer_t (Buffer)));
  end Is_Valid;

  --
  -- Frequency
  --

  procedure Get_Frequency
    (Buffer    : in     Buffer_t;
     Frequency :    out Types.Frequency_t)
  is
    Value : aliased Types.Frequency_t;
  begin
    Thin.Get_Bufferi
      (Buffer_ID => Types.Unsigned_Integer_t (Buffer),
       Parameter => Thin.AL_FREQUENCY,
       Value     => Value'Address);
    Frequency := Value;
  end Get_Frequency;

  --
  -- Size
  --

  procedure Get_Size
    (Buffer : in     Buffer_t;
     Size   :    out Sample_Size_t)
  is
    Value : aliased Sample_Size_t;
  begin
    Thin.Get_Bufferi
      (Buffer_ID => Types.Unsigned_Integer_t (Buffer),
       Parameter => Thin.AL_SIZE,
       Value     => Value'Address);
    Size := Value;
  end Get_Size;

  --
  -- Bits
  --

  procedure Get_Bits
    (Buffer : in     Buffer_t;
     Bits   :    out Sample_Bits_t)
  is
    Value : aliased Sample_Bits_t;
  begin
    Thin.Get_Bufferi
      (Buffer_ID => Types.Unsigned_Integer_t (Buffer),
       Parameter => Thin.AL_BITS,
       Value     => Value'Address);
    Bits := Value;
  end Get_Bits;

  --
  -- Channels
  --

  procedure Get_Channels
    (Buffer   : in     Buffer_t;
     Channels :    out Sample_Channels_t)
  is
    Value : aliased Sample_Channels_t;
  begin
    Thin.Get_Bufferi
      (Buffer_ID => Types.Unsigned_Integer_t (Buffer),
       Parameter => Thin.AL_CHANNELS,
       Value     => Value'Address);
    Channels := Value;
  end Get_Channels;

  --
  -- Data
  --

  procedure Set_Data_Mono_8
    (Buffer    : in Buffer_t;
     Data      : in Sample_Array_8_t;
     Frequency : in Types.Frequency_t) is
  begin
    Thin.Buffer_Data
      (Buffer_ID => Types.Unsigned_Integer_t (Buffer),
       Format    => Thin.AL_FORMAT_MONO8,
       Data      => Data (Data'First)'Address,
       Size      => Data'Size / System.Storage_Unit,
       Frequency => Types.Size_t (Frequency));
  end Set_Data_Mono_8;

  procedure Set_Data_Stereo_8
    (Buffer    : in Buffer_t;
     Data      : in Sample_Array_8_t;
     Frequency : in Types.Frequency_t) is
  begin
    Thin.Buffer_Data
      (Buffer_ID => Types.Unsigned_Integer_t (Buffer),
       Format    => Thin.AL_FORMAT_STEREO8,
       Data      => Data (Data'First)'Address,
       Size      => Data'Size / System.Storage_Unit,
       Frequency => Types.Size_t (Frequency));
  end Set_Data_Stereo_8;

  procedure Set_Data_Mono_16
    (Buffer    : in Buffer_t;
     Data      : in Sample_Array_16_t;
     Frequency : in Types.Frequency_t) is
  begin
    Thin.Buffer_Data
      (Buffer_ID => Types.Unsigned_Integer_t (Buffer),
       Format    => Thin.AL_FORMAT_MONO16,
       Data      => Data (Data'First)'Address,
       Size      => Data'Size / System.Storage_Unit,
       Frequency => Types.Size_t (Frequency));
  end Set_Data_Mono_16;

  procedure Set_Data_Stereo_16
    (Buffer    : in Buffer_t;
     Data      : in Sample_Array_16_t;
     Frequency : in Types.Frequency_t) is
  begin
    Thin.Buffer_Data
      (Buffer_ID => Types.Unsigned_Integer_t (Buffer),
       Format    => Thin.AL_FORMAT_STEREO16,
       Data      => Data (Data'First)'Address,
       Size      => Data'Size / System.Storage_Unit,
       Frequency => Types.Size_t (Frequency));
  end Set_Data_Stereo_16;

  --
  --
  --

  function To_Integer (Buffer : Buffer_t) return Types.Unsigned_Integer_t is
  begin
    return Types.Unsigned_Integer_t (Buffer);
  end To_Integer;

  function From_Integer (Buffer : Types.Unsigned_Integer_t) return Buffer_t is
  begin
    return Buffer_t (Buffer);
  end From_Integer;

end OpenAL.Buffer;
