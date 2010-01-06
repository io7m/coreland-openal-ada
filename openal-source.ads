with OpenAL.Buffer;
with OpenAL.Types;

package OpenAL.Source is

  --
  -- Types
  --

  type Source_ID_t    is private;
  type Source_Array_t is array (Positive range <>) of Source_ID_t;

  --
  -- API
  --

  -- proc_map : alGenSources
  procedure Generate_Sources
    (Sources : in out Source_Array_t);

  -- proc_map : alDeleteSources
  procedure Delete_Sources
    (Sources : in Source_Array_t);

  -- proc_map : alIsSource
  function Is_Valid (Source : in Source_ID_t) return Boolean;

  -- proc_map : alSource
  procedure Set_Positioning
    (Source   : in Source_ID_t;
     Relative : in Boolean);

  -- proc_map : alGetSource
  procedure Get_Positioning
    (Source   : in     Source_ID_t;
     Relative :    out Boolean);

  type Source_Type_t is (Undetermined, Static, Streaming);

  -- proc_map : alSource
  procedure Get_Type
    (Source      : in     Source_ID_t;
     Source_Type :    out Source_Type_t);

  -- proc_map : alSource
  procedure Set_Looping
    (Source   : in Source_ID_t;
     Looping  : in Boolean);

  -- proc_map : alGetSource
  procedure Get_Looping
    (Source   : in     Source_ID_t;
     Looping  :    out Boolean);

  -- proc_map : alSource
  procedure Set_Current_Buffer
    (Source : in Source_ID_t;
     Buffer : in OpenAL.Buffer.Buffer_ID_t);

  -- proc_map : alGetSource
  procedure Get_Current_Buffer
    (Source : in     Source_ID_t;
     Buffer :    out OpenAL.Buffer.Buffer_ID_t);

  -- proc_map : alGetSource
  procedure Get_Buffers_Queued
    (Source  : in     Source_ID_t;
     Buffers :    out Natural);

  -- proc_map : alGetSource
  procedure Get_Buffers_Processed
    (Source  : in     Source_ID_t;
     Buffers :    out Natural);

  subtype Gain_t is Types.Float_t range 0.0 .. 1.0;

  -- proc_map : alSource
  procedure Set_Minimum_Gain
    (Source : in Source_ID_t;
     Gain   : in Gain_t);

  -- proc_map : alGetSource
  procedure Get_Minimum_Gain
    (Source : in     Source_ID_t;
     Gain   :    out Gain_t);

  -- proc_map : alSource
  procedure Set_Maximum_Gain
    (Source : in Source_ID_t;
     Gain   : in Gain_t);

  -- proc_map : alGetSource
  procedure Get_Maximum_Gain
    (Source : in     Source_ID_t;
     Gain   :    out Gain_t);

  subtype Pitch_t is Types.Float_t range 0.00001 .. Types.Float_t'Last;

  -- proc_map : alSource
  procedure Set_Pitch
    (Source : in Source_ID_t;
     Pitch  : in Pitch_t);

  -- proc_map : alGetSource
  procedure Get_Pitch
    (Source : in     Source_ID_t;
     Pitch  :    out Pitch_t);

private

  type Source_ID_t is new Types.Unsigned_Integer_t;

end OpenAL.Source;
