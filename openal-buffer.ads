with OpenAL.Types;

package OpenAL.Buffer is

  --
  -- Types
  --

  type Buffer_t       is private;
  type Buffer_Array_t is array (Positive range <>) of Buffer_t;

  No_Buffer : constant Buffer_t;

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
  function Is_Valid (Buffer : in Buffer_t) return Boolean;

  --
  -- Frequency
  --

  -- proc_map : alGetBuffer
  procedure Get_Frequency
    (Buffer    : in     Buffer_t;
     Frequency :    out Types.Frequency_t);

  --
  -- Size
  --

  type Sample_Size_t is range 1 .. Types.Size_t'Last;

  -- proc_map : alGetBuffer
  procedure Get_Size
    (Buffer : in     Buffer_t;
     Size   :    out Sample_Size_t);

  --
  -- Bits
  --

  type Sample_Bits_t is range 8 .. 16;

  -- proc_map : alGetBuffer
  procedure Get_Bits
    (Buffer : in     Buffer_t;
     Bits   :    out Sample_Bits_t);

  --
  -- Channels
  --

  type Sample_Channels_t is range 1 .. 2;

  -- proc_map : alGetBuffer
  procedure Get_Channels
    (Buffer   : in     Buffer_t;
     Channels :    out Sample_Channels_t);

  --
  -- Data
  --

  type Sample_16_t is range -32768 .. 32767;
  for Sample_16_t'Size use 16;

  type Sample_8_t is range 0 .. 255;
  for Sample_8_t'Size use 8;

  type Sample_Array_16_t is array (Sample_Size_t range <>) of aliased Sample_16_t;
  type Sample_Array_8_t  is array (Sample_Size_t range <>) of aliased Sample_8_t;

  -- proc_map : alBufferData
  procedure Set_Data_Mono_8
    (Buffer    : in Buffer_t;
     Data      : in Sample_Array_8_t;
     Frequency : in Types.Frequency_t);

  -- proc_map : alBufferData
  procedure Set_Data_Stereo_8
    (Buffer    : in Buffer_t;
     Data      : in Sample_Array_8_t;
     Frequency : in Types.Frequency_t);

  -- proc_map : alBufferData
  procedure Set_Data_Mono_16
    (Buffer    : in Buffer_t;
     Data      : in Sample_Array_16_t;
     Frequency : in Types.Frequency_t);

  -- proc_map : alBufferData
  procedure Set_Data_Stereo_16
    (Buffer    : in Buffer_t;
     Data      : in Sample_Array_16_t;
     Frequency : in Types.Frequency_t);

  --
  --
  --

  function To_Integer (Buffer : Buffer_t) return Types.Unsigned_Integer_t;
  function From_Integer (Buffer : Types.Unsigned_Integer_t) return Buffer_t;

private

  type Buffer_t is new Types.Unsigned_Integer_t;

  No_Buffer : constant Buffer_t := 0;

end OpenAL.Buffer;
