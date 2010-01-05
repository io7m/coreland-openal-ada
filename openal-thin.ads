-- Automatically generated, do not edit.

with Interfaces.C;
with System;

package OpenAL.Thin is
  package C renames Interfaces.C;

  -- Constants

  AL_BITS                       : constant := 16#2002#;
  AL_BUFFER                     : constant := 16#1009#;
  AL_BUFFERS_PROCESSED          : constant := 16#1016#;
  AL_BUFFERS_QUEUED             : constant := 16#1015#;
  AL_BYTE_OFFSET                : constant := 16#1026#;
  AL_CHANNELS                   : constant := 16#2003#;
  AL_CONE_INNER_ANGLE           : constant := 16#1001#;
  AL_CONE_OUTER_ANGLE           : constant := 16#1002#;
  AL_CONE_OUTER_GAIN            : constant := 16#1022#;
  AL_DIRECTION                  : constant := 16#1005#;
  AL_DISTANCE_MODEL             : constant := 16#D000#;
  AL_DOPPLER_FACTOR             : constant := 16#C000#;
  AL_DOPPLER_VELOCITY           : constant := 16#C001#;
  AL_EXPONENT_DISTANCE          : constant := 16#D005#;
  AL_EXPONENT_DISTANCE_CLAMPED  : constant := 16#D006#;
  AL_EXTENSIONS                 : constant := 16#B004#;
  AL_FALSE                      : constant := 16#0#;
  AL_FORMAT_MONO16              : constant := 16#1101#;
  AL_FORMAT_MONO8               : constant := 16#1100#;
  AL_FORMAT_STEREO16            : constant := 16#1103#;
  AL_FORMAT_STEREO8             : constant := 16#1102#;
  AL_FREQUENCY                  : constant := 16#2001#;
  AL_GAIN                       : constant := 16#100A#;
  AL_ILLEGAL_COMMAND            : constant := 16#A004#;
  AL_ILLEGAL_ENUM               : constant := 16#A002#;
  AL_INITIAL                    : constant := 16#1011#;
  AL_INVALID                    : constant := -16#1#;
  AL_INVALID_ENUM               : constant := 16#A002#;
  AL_INVALID_NAME               : constant := 16#A001#;
  AL_INVALID_OPERATION          : constant := 16#A004#;
  AL_INVALID_VALUE              : constant := 16#A003#;
  AL_INVERSE_DISTANCE           : constant := 16#D001#;
  AL_INVERSE_DISTANCE_CLAMPED   : constant := 16#D002#;
  AL_LINEAR_DISTANCE            : constant := 16#D003#;
  AL_LINEAR_DISTANCE_CLAMPED    : constant := 16#D004#;
  AL_LOOPING                    : constant := 16#1007#;
  AL_MAX_DISTANCE               : constant := 16#1023#;
  AL_MAX_GAIN                   : constant := 16#100E#;
  AL_MIN_GAIN                   : constant := 16#100D#;
  AL_NONE                       : constant := 16#0#;
  AL_NO_ERROR                   : constant := 16#0#;
  AL_ORIENTATION                : constant := 16#100F#;
  AL_OUT_OF_MEMORY              : constant := 16#A005#;
  AL_PAUSED                     : constant := 16#1013#;
  AL_PENDING                    : constant := 16#2011#;
  AL_PITCH                      : constant := 16#1003#;
  AL_PLAYING                    : constant := 16#1012#;
  AL_POSITION                   : constant := 16#1004#;
  AL_PROCESSED                  : constant := 16#2012#;
  AL_REFERENCE_DISTANCE         : constant := 16#1020#;
  AL_RENDERER                   : constant := 16#B003#;
  AL_ROLLOFF_FACTOR             : constant := 16#1021#;
  AL_SAMPLE_OFFSET              : constant := 16#1025#;
  AL_SEC_OFFSET                 : constant := 16#1024#;
  AL_SIZE                       : constant := 16#2004#;
  AL_SOURCE_RELATIVE            : constant := 16#202#;
  AL_SOURCE_STATE               : constant := 16#1010#;
  AL_SOURCE_TYPE                : constant := 16#1027#;
  AL_SPEED_OF_SOUND             : constant := 16#C003#;
  AL_STATIC                     : constant := 16#1028#;
  AL_STOPPED                    : constant := 16#1014#;
  AL_STREAMING                  : constant := 16#1029#;
  AL_TRUE                       : constant := 16#1#;
  AL_UNDETERMINED               : constant := 16#1030#;
  AL_UNUSED                     : constant := 16#2010#;
  AL_VELOCITY                   : constant := 16#1006#;
  AL_VENDOR                     : constant := 16#B001#;
  AL_VERSION                    : constant := 16#B002#;

  --
  -- Types
  --

  type String_t is new System.Address;

  -- ALfloat
  type Float_t is new C.C_float;

  -- ALdouble
  type Double_t is new C.double;

  -- ALsizeiptr
  type Size_Pointer_t is mod 2 ** System.Word_Size;
  for Size_Pointer_t'Size use System.Word_Size;
  pragma Convention (C, Size_Pointer_t);

  -- ALintptr
  type Integer_Pointer_t is mod 2 ** System.Word_Size;
  for Integer_Pointer_t'Size use System.Word_Size;
  pragma Convention (C, Integer_Pointer_t);

  -- ALbitfield
  type Bitfield_t is mod 2 ** 32;
  for Bitfield_t'Size use 32;
  pragma Convention (C, Bitfield_t);

  -- ALboolean
  type Boolean_t is new Boolean;
  for Boolean_t'Size use 8;
  pragma Convention (C, Boolean_t);

  -- ALbyte
  type Byte_t is range -127 .. 127;
  for Byte_t'Size use 8;
  pragma Convention (C, Byte_t);

  -- ALclampd
  subtype Clamped_Double_t is Double_t range 0.0 .. 1.0;

  -- ALclampf
  subtype Clamped_Float_t is Float_t range 0.0 .. 1.0;

  -- ALenum
  type Enumeration_t is mod 2 ** 32;
  for Enumeration_t'Size use 32;
  pragma Convention (C, Enumeration_t);

  -- ALint
  type Integer_t is range -2147483647 .. 2147483647;
  for Integer_t'Size use 32;
  pragma Convention (C, Integer_t);

  -- ALshort
  type Short_t is range -32767 .. 32767;
  for Short_t'Size use 16;
  pragma Convention (C, Short_t);

  -- ALsizei
  type Size_t is range -2147483647 .. 2147483647;
  for Size_t'Size use 32;
  pragma Convention (C, Size_t);

  -- ALubyte
  type Unsigned_Byte_t is mod 2 ** 8;
  for Unsigned_Byte_t'Size use 8;
  pragma Convention (C, Unsigned_Byte_t);

  -- ALuint
  type Unsigned_Integer_t is mod 2 ** 32;
  for Unsigned_Integer_t'Size use 32;
  pragma Convention (C, Unsigned_Integer_t);

  -- ALushort
  type Unsigned_Short_t is mod 2 ** 16;
  for Unsigned_Short_t'Size use 16;
  pragma Convention (C, Unsigned_Short_t);

  -- ALvoid *
  subtype Void_Pointer_t is System.Address;

  -- ALvoid **
  type Void_Pointer_Access_t is access all Void_Pointer_t;
  pragma Convention (C, Void_Pointer_Access_t);

  -- const ALvoid **
  type Void_Pointer_Access_Constant_t is access constant System.Address;
  pragma Convention (C, Void_Pointer_Access_Constant_t);

  --
  -- OpenAL 1.1
  --

  procedure Buffer_3f
    (Buffer_ID : Unsigned_Integer_t;
     Parameter : Enumeration_t;
     Value_1   : Float_t;
     Value_2   : Float_t;
     Value_3   : Float_t);
  pragma Import (C, Buffer_3f, "alBuffer3f");

  procedure Buffer_3i
    (Buffer_ID : Unsigned_Integer_t;
     Parameter : Enumeration_t;
     Value_1   : Integer_t;
     Value_2   : Integer_t;
     Value_3   : Integer_t);
  pragma Import (C, Buffer_3i, "alBuffer3i");

  procedure Buffer_Data
    (Buffer_ID : Unsigned_Integer_t;
     Format    : Enumeration_t;
     Data      : System.Address;
     Size      : Size_t;
     Frequency : Size_t);
  pragma Import (C, Buffer_Data, "alBufferData");

  procedure Bufferf
    (Buffer_ID : Unsigned_Integer_t;
     Parameter : Enumeration_t;
     Value     : Float_t);
  pragma Import (C, Bufferf, "alBufferf");

  procedure Bufferfv
    (Buffer_ID : Unsigned_Integer_t;
     Parameter : Enumeration_t;
     Values    : System.Address);
  pragma Import (C, Bufferfv, "alBufferfv");

  procedure Bufferi
    (Buffer_ID : Unsigned_Integer_t;
     Parameter : Enumeration_t;
     Value     : Integer_t);
  pragma Import (C, Bufferi, "alBufferi");

  procedure Bufferiv
    (Buffer_ID : Unsigned_Integer_t;
     Parameter : Enumeration_t;
     Values    : System.Address);
  pragma Import (C, Bufferiv, "alBufferiv");

  procedure Delete_Buffers
    (Size    : Size_t;
     Sources : System.Address);
  pragma Import (C, Delete_Buffers, "alDeleteBuffers");

  procedure Delete_Sources
    (Size    : Size_t;
     Sources : System.Address);
  pragma Import (C, Delete_Sources, "alDeleteSources");

  procedure Disable
    (Capability : Enumeration_t);
  pragma Import (C, Disable, "alDisable");

  procedure Distance_Model
    (Distance_Model : Enumeration_t);
  pragma Import (C, Distance_Model, "alDistanceModel");

  procedure Doppler_Factor
    (Value : Float_t);
  pragma Import (C, Doppler_Factor, "alDopplerFactor");

  procedure Doppler_Velocity
    (Value : Float_t);
  pragma Import (C, Doppler_Velocity, "alDopplerVelocity");

  procedure Enable
    (Capability : Enumeration_t);
  pragma Import (C, Enable, "alEnable");

  procedure Gen_Buffers
    (Size    : Size_t;
     Buffers : System.Address);
  pragma Import (C, Gen_Buffers, "alGenBuffers");

  procedure Gen_Sources
    (Size    : Size_t;
     Sources : System.Address);
  pragma Import (C, Gen_Sources, "alGenSources");

  function Get_Boolean
    (Parameter : Enumeration_t) return Boolean_t;
  pragma Import (C, Get_Boolean, "alGetBoolean");

  procedure Get_Booleanv
    (Parameter : Enumeration_t;
     Data      : System.Address);
  pragma Import (C, Get_Booleanv, "alGetBooleanv");

  procedure Get_Buffer_3f
    (Buffer_ID : Unsigned_Integer_t;
     Parameter : Enumeration_t;
     Value_1   : System.Address;
     Value_2   : System.Address;
     Value_3   : System.Address);
  pragma Import (C, Get_Buffer_3f, "alGetBuffer3f");

  procedure Get_Buffer_3i
    (Buffer_ID : Unsigned_Integer_t;
     Parameter : Enumeration_t;
     Value_1   : System.Address;
     Value_2   : System.Address;
     Value_3   : System.Address);
  pragma Import (C, Get_Buffer_3i, "alGetBuffer3i");

  procedure Get_Bufferf
    (Buffer_ID : Unsigned_Integer_t;
     Parameter : Enumeration_t;
     Value     : System.Address);
  pragma Import (C, Get_Bufferf, "alGetBufferf");

  procedure Get_Bufferfv
    (Buffer_ID : Unsigned_Integer_t;
     Parameter : Enumeration_t;
     Values    : System.Address);
  pragma Import (C, Get_Bufferfv, "alGetBufferfv");

  procedure Get_Bufferi
    (Buffer_ID : Unsigned_Integer_t;
     Parameter : Enumeration_t;
     Value     : System.Address);
  pragma Import (C, Get_Bufferi, "alGetBufferi");

  procedure Get_Bufferiv
    (Buffer_ID : Unsigned_Integer_t;
     Parameter : Enumeration_t;
     Values    : System.Address);
  pragma Import (C, Get_Bufferiv, "alGetBufferiv");

  function Get_Double
    (Parameter : Enumeration_t) return Double_t;
  pragma Import (C, Get_Double, "alGetDouble");

  procedure Get_Doublev
    (Parameter : Enumeration_t;
     Values    : System.Address);
  pragma Import (C, Get_Doublev, "alGetDoublev");

  function Get_Enum_Value
    (Name : System.Address) return Enumeration_t;
  pragma Import (C, Get_Enum_Value, "alGetEnumValue");

  function Get_Error return Enumeration_t;
  pragma Import (C, Get_Error, "alGetError");

  function Get_Float
    (Parameter : Enumeration_t) return Float_t;
  pragma Import (C, Get_Float, "alGetFloat");

  procedure Get_Floatv
    (Parameter : Enumeration_t;
     Values    : System.Address);
  pragma Import (C, Get_Floatv, "alGetFloatv");

  function Get_Integer
    (Parameter : Enumeration_t) return Integer_t;
  pragma Import (C, Get_Integer, "alGetInteger");

  procedure Get_Integerv
    (Paremeter : Enumeration_t;
     Values    : System.Address);
  pragma Import (C, Get_Integerv, "alGetIntegerv");

  procedure Get_Listener_3f
    (Parameter : Enumeration_t;
     Value_1   : System.Address;
     Value_2   : System.Address;
     Value_3   : System.Address);
  pragma Import (C, Get_Listener_3f, "alGetListener3f");

  procedure Get_Listener_3i
    (Parameter : Enumeration_t;
     Value_1   : System.Address;
     Value_2   : System.Address;
     Value_3   : System.Address);
  pragma Import (C, Get_Listener_3i, "alGetListener3i");

  procedure Get_Listenerf
    (Parameter : Enumeration_t;
     Value     : System.Address);
  pragma Import (C, Get_Listenerf, "alGetListenerf");

  procedure Get_Listenerfv
    (Parameter : Enumeration_t;
     Values    : System.Address);
  pragma Import (C, Get_Listenerfv, "alGetListenerfv");

  procedure Get_Listeneri
    (Parameter : Enumeration_t;
     Value     : System.Address);
  pragma Import (C, Get_Listeneri, "alGetListeneri");

  procedure Get_Listeneriv
    (Parameter : Enumeration_t;
     Values    : System.Address);
  pragma Import (C, Get_Listeneriv, "alGetListeneriv");

  function Get_Proc_Address
    (Name : System.Address) return Void_Pointer_t;
  pragma Import (C, Get_Proc_Address, "alGetProcAddress");

  procedure Get_Source_3f
    (Source_ID : Unsigned_Integer_t;
     Parameter : Enumeration_t;
     Value_1   : System.Address;
     Value_2   : System.Address;
     Value_3   : System.Address);
  pragma Import (C, Get_Source_3f, "alGetSource3f");

  procedure Get_Source_3i
    (Source_ID : Unsigned_Integer_t;
     Parameter : Enumeration_t;
     Value_1   : System.Address;
     Value_2   : System.Address;
     Value_3   : System.Address);
  pragma Import (C, Get_Source_3i, "alGetSource3i");

  procedure Get_Sourcef
    (Source_ID : Unsigned_Integer_t;
     Parameter : Enumeration_t;
     Value     : System.Address);
  pragma Import (C, Get_Sourcef, "alGetSourcef");

  procedure Get_Sourcefv
    (Source_ID : Unsigned_Integer_t;
     Parameter : Enumeration_t;
     Values    : System.Address);
  pragma Import (C, Get_Sourcefv, "alGetSourcefv");

  procedure Get_Sourcei
    (Source_ID : Unsigned_Integer_t;
     Parameter : Enumeration_t;
     Value     : System.Address);
  pragma Import (C, Get_Sourcei, "alGetSourcei");

  procedure Get_Sourceiv
    (Source_ID : Unsigned_Integer_t;
     Parameter : Enumeration_t;
     Values    : System.Address);
  pragma Import (C, Get_Sourceiv, "alGetSourceiv");

  function Get_String
    (Parameter : Enumeration_t) return System.Address;
  pragma Import (C, Get_String, "alGetString");

  function Is_Buffer
    (Buffer_ID : Unsigned_Integer_t) return Boolean_t;
  pragma Import (C, Is_Buffer, "alIsBuffer");

  function Is_Enabled
    (Parameter : Enumeration_t) return Boolean_t;
  pragma Import (C, Is_Enabled, "alIsEnabled");

  function Is_Extension_Present
    (Name : System.Address) return Boolean_t;
  pragma Import (C, Is_Extension_Present, "alIsExtensionPresent");

  function Is_Source
    (Source_ID : Unsigned_Integer_t) return Boolean_t;
  pragma Import (C, Is_Source, "alIsSource");

  procedure Listener_3f
    (Parameter : Enumeration_t;
     Value_1   : Float_t;
     Value_2   : Float_t;
     Value_3   : Float_t);
  pragma Import (C, Listener_3f, "alListener3f");

  procedure Listener_3i
    (Parameter : Enumeration_t;
     Value_1   : Integer_t;
     Value_2   : Integer_t;
     Value_3   : Integer_t);
  pragma Import (C, Listener_3i, "alListener3i");

  procedure Listenerf
    (Parameter : Enumeration_t;
     Value     : Float_t);
  pragma Import (C, Listenerf, "alListenerf");

  procedure Listenerfv
    (Parameter : Enumeration_t;
     Values    : System.Address);
  pragma Import (C, Listenerfv, "alListenerfv");

  procedure Listeneri
    (Parameter : Enumeration_t;
     Value     : Integer_t);
  pragma Import (C, Listeneri, "alListeneri");

  procedure Listeneriv
    (Parameter : Enumeration_t;
     Values    : System.Address);
  pragma Import (C, Listeneriv, "alListeneriv");

  procedure Source_3f
    (Source_ID : Unsigned_Integer_t;
     ALenum    : Enumeration_t;
     Value_1   : Float_t;
     Value_2   : Float_t;
     Value_3   : Float_t);
  pragma Import (C, Source_3f, "alSource3f");

  procedure Source_3i
    (Source_ID : Unsigned_Integer_t;
     ALenum    : Enumeration_t;
     Value_1   : Integer_t;
     Value_2   : Integer_t;
     Value_3   : Integer_t);
  pragma Import (C, Source_3i, "alSource3i");

  procedure Source_Pause
    (Source_ID : Unsigned_Integer_t);
  pragma Import (C, Source_Pause, "alSourcePause");

  procedure Source_Pausev
    (Size       : Size_t;
     Source_IDs : System.Address);
  pragma Import (C, Source_Pausev, "alSourcePausev");

  procedure Source_Play
    (Source_ID : Unsigned_Integer_t);
  pragma Import (C, Source_Play, "alSourcePlay");

  procedure Source_Playv
    (Size       : Size_t;
     Source_IDs : System.Address);
  pragma Import (C, Source_Playv, "alSourcePlayv");

  procedure Source_Queue_Buffers
    (Source_ID  : Unsigned_Integer_t;
     Size       : Size_t;
     Buffer_IDs : System.Address);
  pragma Import (C, Source_Queue_Buffers, "alSourceQueueBuffers");

  procedure Source_Rewind
    (Source_ID : Unsigned_Integer_t);
  pragma Import (C, Source_Rewind, "alSourceRewind");

  procedure Source_Rewindv
    (Size       : Size_t;
     Source_IDs : System.Address);
  pragma Import (C, Source_Rewindv, "alSourceRewindv");

  procedure Source_Stop
    (Source_ID : Unsigned_Integer_t);
  pragma Import (C, Source_Stop, "alSourceStop");

  procedure Source_Stopv
    (Size       : Size_t;
     Source_IDs : System.Address);
  pragma Import (C, Source_Stopv, "alSourceStopv");

  procedure Source_Unqueue_Buffers
    (Source_ID  : Unsigned_Integer_t;
     Size       : Size_t;
     Buffer_IDs : System.Address);
  pragma Import (C, Source_Unqueue_Buffers, "alSourceUnqueueBuffers");

  procedure Sourcef
    (Source_ID : Unsigned_Integer_t;
     Parameter : Enumeration_t;
     Value     : Float_t);
  pragma Import (C, Sourcef, "alSourcef");

  procedure Sourcefv
    (Source_ID : Unsigned_Integer_t;
     Parameter : Enumeration_t;
     Values    : System.Address);
  pragma Import (C, Sourcefv, "alSourcefv");

  procedure Sourcei
    (Source_ID : Unsigned_Integer_t;
     Parameter : Enumeration_t;
     Value     : Integer_t);
  pragma Import (C, Sourcei, "alSourcei");

  procedure Sourceiv
    (Source_ID : Unsigned_Integer_t;
     Parameter : Enumeration_t;
     Values    : System.Address);
  pragma Import (C, Sourceiv, "alSourceiv");

  procedure Speed_Of_Sound
    (Value : Float_t);
  pragma Import (C, Speed_Of_Sound, "alSpeedOfSound");

end OpenAL.Thin;
