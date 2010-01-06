with OpenAL.Buffer;
with OpenAL.Types;

package OpenAL.Source is

  --
  -- Types
  --

  type Source_t       is private;
  type Source_Array_t is array (Positive range <>) of Source_t;

  No_Source : constant Source_t;

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
  function Is_Valid (Source : in Source_t) return Boolean;

  --
  -- Position
  --

  -- proc_map : alSource3f
  procedure Set_Position_Float
    (Source    : in Source_t;
     X         : in Types.Float_t;
     Y         : in Types.Float_t;
     Z         : in Types.Float_t);

  -- proc_map : alSource3i
  procedure Set_Position_Discrete
    (Source    : in Source_t;
     X         : in Types.Integer_t;
     Y         : in Types.Integer_t;
     Z         : in Types.Integer_t);

  -- proc_map : alSourcefv
  procedure Set_Position_Float_List
    (Source    : in Source_t;
     Position  : in Types.Vector_3f_t);

  -- proc_map : alSourceiv
  procedure Set_Position_Discrete_List
    (Source    : in Source_t;
     Position  : in Types.Vector_3i_t);

  -- proc_map : alGetSource3f
  procedure Get_Position_Float
    (Source : in     Source_t;
     X      :    out Types.Float_t;
     Y      :    out Types.Float_t;
     Z      :    out Types.Float_t);

  -- proc_map : alGetSource3i
  procedure Get_Position_Discrete
    (Source : in     Source_t;
     X      :    out Types.Integer_t;
     Y      :    out Types.Integer_t;
     Z      :    out Types.Integer_t);

  -- proc_map : alGetSourcefv
  procedure Get_Position_Float_List
    (Source   : in     Source_t;
     Position :    out Types.Vector_3f_t);

  -- proc_map : alGetSourceiv
  procedure Get_Position_Discrete_List
    (Source   : in     Source_t;
     Position :    out Types.Vector_3i_t);

  --
  -- Velocity
  --

  -- proc_map : alSource3f
  procedure Set_Velocity_Float
    (Source    : in Source_t;
     X         : in Types.Float_t;
     Y         : in Types.Float_t;
     Z         : in Types.Float_t);

  -- proc_map : alSource3i
  procedure Set_Velocity_Discrete
    (Source    : in Source_t;
     X         : in Types.Integer_t;
     Y         : in Types.Integer_t;
     Z         : in Types.Integer_t);

  -- proc_map : alSourcefv
  procedure Set_Velocity_Float_List
    (Source    : in Source_t;
     Velocity  : in Types.Vector_3f_t);

  -- proc_map : alSourceiv
  procedure Set_Velocity_Discrete_List
    (Source    : in Source_t;
     Velocity  : in Types.Vector_3i_t);

  -- proc_map : alGetSource3f
  procedure Get_Velocity_Float
    (Source : in     Source_t;
     X      :    out Types.Float_t;
     Y      :    out Types.Float_t;
     Z      :    out Types.Float_t);

  -- proc_map : alGetSource3i
  procedure Get_Velocity_Discrete
    (Source : in     Source_t;
     X      :    out Types.Integer_t;
     Y      :    out Types.Integer_t;
     Z      :    out Types.Integer_t);

  -- proc_map : alGetSourcefv
  procedure Get_Velocity_Float_List
    (Source   : in     Source_t;
     Velocity :    out Types.Vector_3f_t);

  -- proc_map : alGetSourceiv
  procedure Get_Velocity_Discrete_List
    (Source   : in     Source_t;
     Velocity :    out Types.Vector_3i_t);

  --
  -- Gain
  --

  -- proc_map : alSource
  procedure Set_Gain
    (Source : in Source_t;
     Gain   : in Types.Float_t);

  -- proc_map : alGetSource
  procedure Get_Gain
    (Source : in     Source_t;
     Gain   :    out Types.Float_t);

  --
  -- Positioning
  --

  -- proc_map : alSource
  procedure Set_Positioning
    (Source   : in Source_t;
     Relative : in Boolean);

  -- proc_map : alGetSource
  procedure Get_Positioning
    (Source   : in     Source_t;
     Relative :    out Boolean);

  --
  -- Type
  --

  type Source_Type_t is (Undetermined, Static, Streaming);

  -- proc_map : alSource
  procedure Get_Type
    (Source      : in     Source_t;
     Source_Type :    out Source_Type_t);

  --
  -- Looping
  --

  -- proc_map : alSource
  procedure Set_Looping
    (Source   : in Source_t;
     Looping  : in Boolean);

  -- proc_map : alGetSource
  procedure Get_Looping
    (Source   : in     Source_t;
     Looping  :    out Boolean);

  --
  -- Current_Buffer
  --

  -- proc_map : alSource
  procedure Set_Current_Buffer
    (Source : in Source_t;
     Buffer : in OpenAL.Buffer.Buffer_t);

  -- proc_map : alGetSource
  procedure Get_Current_Buffer
    (Source : in     Source_t;
     Buffer :    out OpenAL.Buffer.Buffer_t);

  --
  -- Buffers_Queued
  --

  -- proc_map : alGetSource
  procedure Get_Buffers_Queued
    (Source  : in     Source_t;
     Buffers :    out Natural);

  --
  -- Buffers_Processed
  --

  -- proc_map : alGetSource
  procedure Get_Buffers_Processed
    (Source  : in     Source_t;
     Buffers :    out Natural);

  --
  -- Gain
  --

  subtype Gain_t is Types.Float_t range 0.0 .. 1.0;

  -- proc_map : alSource
  procedure Set_Minimum_Gain
    (Source : in Source_t;
     Gain   : in Gain_t);

  -- proc_map : alGetSource
  procedure Get_Minimum_Gain
    (Source : in     Source_t;
     Gain   :    out Gain_t);

  -- proc_map : alSource
  procedure Set_Maximum_Gain
    (Source : in Source_t;
     Gain   : in Gain_t);

  -- proc_map : alGetSource
  procedure Get_Maximum_Gain
    (Source : in     Source_t;
     Gain   :    out Gain_t);

  --
  -- Reference_Distance
  --

  -- proc_map : alSource
  procedure Set_Reference_Distance_Float
    (Source   : in Source_t;
     Distance : in Types.Float_t);

  -- proc_map : alSource
  procedure Set_Reference_Distance_Discrete
    (Source   : in Source_t;
     Distance : in Types.Integer_t);

  -- proc_map : alGetSource
  procedure Get_Reference_Distance_Float
    (Source   : in     Source_t;
     Distance :    out Types.Float_t);

  -- proc_map : alGetSource
  procedure Get_Reference_Distance_Discrete
    (Source   : in     Source_t;
     Distance :    out Types.Integer_t);

  --
  -- Rolloff_Factor
  --

  -- proc_map : alSource
  procedure Set_Rolloff_Factor_Float
    (Source   : in Source_t;
     Distance : in Types.Float_t);

  -- proc_map : alSource
  procedure Set_Rolloff_Factor_Discrete
    (Source   : in Source_t;
     Distance : in Types.Integer_t);

  -- proc_map : alGetSource
  procedure Get_Rolloff_Factor_Float
    (Source   : in     Source_t;
     Distance :    out Types.Float_t);

  -- proc_map : alGetSource
  procedure Get_Rolloff_Factor_Discrete
    (Source   : in     Source_t;
     Distance :    out Types.Integer_t);

  --
  -- Maximum_Distance
  --

  -- proc_map : alSource
  procedure Set_Maximum_Distance_Float
    (Source   : in Source_t;
     Distance : in Types.Float_t);

  -- proc_map : alSource
  procedure Set_Maximum_Distance_Discrete
    (Source   : in Source_t;
     Distance : in Types.Integer_t);

  -- proc_map : alGetSource
  procedure Get_Maximum_Distance_Float
    (Source   : in     Source_t;
     Distance :    out Types.Float_t);

  -- proc_map : alGetSource
  procedure Get_Maximum_Distance_Discrete
    (Source   : in     Source_t;
     Distance :    out Types.Integer_t);

  --
  -- Pitch
  --

  subtype Pitch_t is Types.Float_t range 0.00001 .. Types.Float_t'Last;

  -- proc_map : alSource
  procedure Set_Pitch
    (Source : in Source_t;
     Pitch  : in Pitch_t);

  -- proc_map : alGetSource
  procedure Get_Pitch
    (Source : in     Source_t;
     Pitch  :    out Pitch_t);

  --
  -- Direction
  --

  -- proc_map : alSource3f
  procedure Set_Direction_Float
    (Source : in Source_t;
     X      : in Types.Float_t;
     Y      : in Types.Float_t;
     Z      : in Types.Float_t);

  -- proc_map : alSource3i
  procedure Set_Direction_Discrete
    (Source : in Source_t;
     X      : in Types.Integer_t;
     Y      : in Types.Integer_t;
     Z      : in Types.Integer_t);

  -- proc_map : alSourcefv
  procedure Set_Direction_Float_List
    (Source    : in Source_t;
     Direction : in Types.Vector_3f_t);

  -- proc_map : alSourceiv
  procedure Set_Direction_Discrete_List
    (Source    : in Source_t;
     Direction : in Types.Vector_3i_t);

  -- proc_map : alGetSource3f
  procedure Get_Direction_Float
    (Source : in     Source_t;
     X      :    out Types.Float_t;
     Y      :    out Types.Float_t;
     Z      :    out Types.Float_t);

  -- proc_map : alGetSource3i
  procedure Get_Direction_Discrete
    (Source : in     Source_t;
     X      :    out Types.Integer_t;
     Y      :    out Types.Integer_t;
     Z      :    out Types.Integer_t);

  -- proc_map : alGetSourcefv
  procedure Get_Direction_Float_List
    (Source    : in     Source_t;
     Direction :    out Types.Vector_3f_t);

  -- proc_map : alGetSourceiv
  procedure Get_Direction_Discrete_List
    (Source    : in     Source_t;
     Direction :    out Types.Vector_3i_t);

  --
  -- Cone_Inner_Angle
  --

  -- proc_map : alSource
  procedure Set_Cone_Inner_Angle_Float
    (Source   : in Source_t;
     Distance : in Types.Float_t);

  -- proc_map : alSource
  procedure Set_Cone_Inner_Angle_Discrete
    (Source   : in Source_t;
     Distance : in Types.Integer_t);

  -- proc_map : alGetSource
  procedure Get_Cone_Inner_Angle_Float
    (Source   : in     Source_t;
     Distance :    out Types.Float_t);

  -- proc_map : alGetSource
  procedure Get_Cone_Inner_Angle_Discrete
    (Source   : in     Source_t;
     Distance :    out Types.Integer_t);

  --
  -- Cone_Outer_Angle
  --

  -- proc_map : alSource
  procedure Set_Cone_Outer_Angle_Float
    (Source   : in Source_t;
     Distance : in Types.Float_t);

  -- proc_map : alSource
  procedure Set_Cone_Outer_Angle_Discrete
    (Source   : in Source_t;
     Distance : in Types.Integer_t);

  -- proc_map : alGetSource
  procedure Get_Cone_Outer_Angle_Float
    (Source   : in     Source_t;
     Distance :    out Types.Float_t);

  -- proc_map : alGetSource
  procedure Get_Cone_Outer_Angle_Discrete
    (Source   : in     Source_t;
     Distance :    out Types.Integer_t);

  --
  -- Cone_Outer_Gain
  --

  -- proc_map : alSource
  procedure Set_Cone_Outer_Gain
    (Source : in Source_t;
     Gain   : in Types.Float_t);

  -- proc_map : alGetSource
  procedure Get_Cone_Outer_Gain
    (Source : in     Source_t;
     Gain   :    out Types.Float_t);

  --
  -- Seconds_Offset
  --

  -- proc_map : alSource
  procedure Set_Seconds_Offset_Float
    (Source   : in Source_t;
     Distance : in Types.Float_t);

  -- proc_map : alSource
  procedure Set_Seconds_Offset_Discrete
    (Source   : in Source_t;
     Distance : in Types.Integer_t);

  -- proc_map : alGetSource
  procedure Get_Seconds_Offset_Float
    (Source   : in     Source_t;
     Distance :    out Types.Float_t);

  -- proc_map : alGetSource
  procedure Get_Seconds_Offset_Discrete
    (Source   : in     Source_t;
     Distance :    out Types.Integer_t);

  --
  -- Sample_Offset
  --

  -- proc_map : alSource
  procedure Set_Sample_Offset_Float
    (Source   : in Source_t;
     Distance : in Types.Float_t);

  -- proc_map : alSource
  procedure Set_Sample_Offset_Discrete
    (Source   : in Source_t;
     Distance : in Types.Integer_t);

  -- proc_map : alGetSource
  procedure Get_Sample_Offset_Float
    (Source   : in     Source_t;
     Distance :    out Types.Float_t);

  -- proc_map : alGetSource
  procedure Get_Sample_Offset_Discrete
    (Source   : in     Source_t;
     Distance :    out Types.Integer_t);

  --
  -- Byte_Offset
  --

  -- proc_map : alSource
  procedure Set_Byte_Offset_Float
    (Source   : in Source_t;
     Distance : in Types.Float_t);

  -- proc_map : alSource
  procedure Set_Byte_Offset_Discrete
    (Source   : in Source_t;
     Distance : in Types.Integer_t);

  -- proc_map : alGetSource
  procedure Get_Byte_Offset_Float
    (Source   : in     Source_t;
     Distance :    out Types.Float_t);

  -- proc_map : alGetSource
  procedure Get_Byte_Offset_Discrete
    (Source   : in     Source_t;
     Distance :    out Types.Integer_t);

  --
  -- Queue_Buffers
  --

  -- proc_map : alSourceQueueBuffers
  procedure Queue_Buffers
    (Source  : in Source_t;
     Buffers : in OpenAL.Buffer.Buffer_Array_t);

  --
  -- Unqueue_Buffers
  --

  -- proc_map : alSourceUnqueueBuffers
  procedure Unqueue_Buffers
    (Source  : in Source_t;
     Buffers : in OpenAL.Buffer.Buffer_Array_t);

  --
  -- Play
  --

  -- proc_map : alSourcePlay
  procedure Play (Source : in Source_t);

  -- proc_map : alSourcePlayv
  procedure Play_List (Sources : in Source_Array_t);

  --
  -- Pause
  --

  -- proc_map : alSourcePause
  procedure Pause (Source : in Source_t);

  -- proc_map : alSourcePausev
  procedure Pause_List (Sources : in Source_Array_t);

  --
  -- Stop
  --

  -- proc_map : alSourceStop
  procedure Stop (Source : in Source_t);

  -- proc_map : alSourceStopv
  procedure Stop_List (Sources : in Source_Array_t);

  --
  -- Rewind
  --

  -- proc_map : alSourceRewind
  procedure Rewind (Source : in Source_t);

  -- proc_map : alSourceRewindv
  procedure Rewind_List (Sources : in Source_Array_t);

private

  type Source_t is new Types.Unsigned_Integer_t;

  No_Source : constant Source_t := 0;

end OpenAL.Source;
