with OpenAL.Thin;

package body OpenAL.Source is

  use type Types.Size_t;

  --
  -- Delete_Sources
  --

  procedure Delete_Sources
    (Sources : in Source_Array_t) is
  begin
    Thin.Delete_Sources
      (Size    => Sources'Length,
       Sources => Sources (Sources'First)'Address);
  end Delete_Sources;

  --
  -- Generate_Sources
  --

  procedure Generate_Sources
    (Sources : in out Source_Array_t) is
  begin
    Thin.Gen_Sources
      (Size    => Sources'Length,
       Sources => Sources (Sources'First)'Address);
  end Generate_Sources;

  --
  -- Get_Buffers_*
  --

  procedure Get_Buffers_Processed
    (Source  : in     Source_t;
     Buffers :    out Natural)
  is
    Value : aliased Types.Unsigned_Integer_t;
  begin
    Thin.Get_Sourcei
      (Source_ID => Types.Unsigned_Integer_t (Source),
       Parameter => Thin.AL_BUFFERS_PROCESSED,
       Value     => Value'Address);
    Buffers := Natural (Value);
  end Get_Buffers_Processed;

  procedure Get_Buffers_Queued
    (Source  : in     Source_t;
     Buffers :    out Natural)
  is
    Value : aliased Types.Unsigned_Integer_t;
  begin
    Thin.Get_Sourcei
      (Source_ID => Types.Unsigned_Integer_t (Source),
       Parameter => Thin.AL_BUFFERS_QUEUED,
       Value     => Value'Address);
    Buffers := Natural (Value);
  end Get_Buffers_Queued;

  --
  -- Get_Byte_Offset_*
  --

  procedure Get_Byte_Offset_Discrete
    (Source   : in     Source_t;
     Distance :    out Types.Integer_t)
  is
    Value : Types.Integer_t;
  begin
    Thin.Get_Sourcei
      (Source_ID => Types.Unsigned_Integer_t (Source),
       Parameter => Thin.AL_BYTE_OFFSET,
       Value     => Value'Address);
    Distance := Value;
  end Get_Byte_Offset_Discrete;

  procedure Get_Byte_Offset_Float
    (Source   : in     Source_t;
     Distance :    out Types.Float_t)
  is
    Value : Types.Float_t;
  begin
    Thin.Get_Sourcef
      (Source_ID => Types.Unsigned_Integer_t (Source),
       Parameter => Thin.AL_BYTE_OFFSET,
       Value     => Value'Address);
    Distance := Value;
  end Get_Byte_Offset_Float;

  --
  -- Get_Cone_Inner_Angle_*
  --

  procedure Get_Cone_Inner_Angle_Discrete
    (Source   : in     Source_t;
     Distance :    out Types.Integer_t)
  is
    Value : Types.Integer_t;
  begin
    Thin.Get_Sourcei
      (Source_ID => Types.Unsigned_Integer_t (Source),
       Parameter => Thin.AL_CONE_INNER_ANGLE,
       Value     => Value'Address);
    Distance := Value;
  end Get_Cone_Inner_Angle_Discrete;

  procedure Get_Cone_Inner_Angle_Float
    (Source   : in     Source_t;
     Distance :    out Types.Float_t)
  is
    Value : Types.Float_t;
  begin
    Thin.Get_Sourcef
      (Source_ID => Types.Unsigned_Integer_t (Source),
       Parameter => Thin.AL_CONE_INNER_ANGLE,
       Value     => Value'Address);
    Distance := Value;
  end Get_Cone_Inner_Angle_Float;

  --
  -- Get_Cone_Outer_Angle_*
  --

  procedure Get_Cone_Outer_Angle_Discrete
    (Source   : in     Source_t;
     Distance :    out Types.Integer_t)
  is
    Value : Types.Integer_t;
  begin
    Thin.Get_Sourcei
      (Source_ID => Types.Unsigned_Integer_t (Source),
       Parameter => Thin.AL_CONE_OUTER_ANGLE,
       Value     => Value'Address);
    Distance := Value;
  end Get_Cone_Outer_Angle_Discrete;

  procedure Get_Cone_Outer_Angle_Float
    (Source   : in     Source_t;
     Distance :    out Types.Float_t)
  is
    Value : Types.Float_t;
  begin
    Thin.Get_Sourcef
      (Source_ID => Types.Unsigned_Integer_t (Source),
       Parameter => Thin.AL_CONE_OUTER_ANGLE,
       Value     => Value'Address);
    Distance := Value;
  end Get_Cone_Outer_Angle_Float;

  --
  -- Get_Cone_Outer_Gain
  --

  procedure Get_Cone_Outer_Gain
    (Source : in     Source_t;
     Gain   :    out Types.Float_t)
  is
    Value : aliased Types.Float_t;
  begin
    Thin.Get_Sourcef
      (Source_ID => Types.Unsigned_Integer_t (Source),
       Parameter => Thin.AL_CONE_OUTER_GAIN,
       Value     => Value'Address);
    Gain := Value;
  end Get_Cone_Outer_Gain;

  --
  -- Get_Current_Buffer
  --

  procedure Get_Current_Buffer
    (Source : in     Source_t;
     Buffer :    out OpenAL.Buffer.Buffer_t)
  is
    Value : aliased Types.Unsigned_Integer_t;
  begin
    Thin.Get_Sourcei
      (Source_ID => Types.Unsigned_Integer_t (Source),
       Parameter => Thin.AL_BUFFER,
       Value     => Value'Address);
    Buffer := OpenAL.Buffer.From_Integer (Value);
  end Get_Current_Buffer;

  --
  -- Get_Direction_*
  --

  procedure Get_Direction_Discrete
    (Source : in     Source_t;
     X      :    out Types.Integer_t;
     Y      :    out Types.Integer_t;
     Z      :    out Types.Integer_t)
  is
    V : aliased Types.Vector_3i_t;
  begin
    Get_Direction_Discrete_List (Source, V);

    X := V (1);
    Y := V (2);
    Z := V (3);
  end Get_Direction_Discrete;

  procedure Get_Direction_Discrete_List
    (Source    : in     Source_t;
     Direction :    out Types.Vector_3i_t) is
  begin
    Thin.Get_Sourceiv
      (Source_ID => Types.Unsigned_Integer_t (Source),
       Parameter => Thin.AL_DIRECTION,
       Values    => Direction (Direction'First)'Address);
  end Get_Direction_Discrete_List;

  procedure Get_Direction_Float
    (Source : in     Source_t;
     X      :    out Types.Float_t;
     Y      :    out Types.Float_t;
     Z      :    out Types.Float_t)
  is
    V : aliased Types.Vector_3f_t;
  begin
    Get_Direction_Float_List (Source, V);

    X := V (1);
    Y := V (2);
    Z := V (3);
  end Get_Direction_Float;

  procedure Get_Direction_Float_List
    (Source    : in     Source_t;
     Direction :    out Types.Vector_3f_t) is
  begin
    Thin.Get_Sourcefv
      (Source_ID => Types.Unsigned_Integer_t (Source),
       Parameter => Thin.AL_DIRECTION,
       Values    => Direction (Direction'First)'Address);
  end Get_Direction_Float_List;

  --
  -- Get_Gain
  --

  procedure Get_Gain
    (Source : in     Source_t;
     Gain   :    out Types.Float_t)
  is
    Value : aliased Types.Float_t;
  begin
    Thin.Get_Sourcef
      (Source_ID => Types.Unsigned_Integer_t (Source),
       Parameter => Thin.AL_GAIN,
       Value     => Value'Address);
    Gain := Value;
  end Get_Gain;

  --
  -- Get_Looping
  --

  procedure Get_Looping
    (Source  : in     Source_t;
     Looping :    out Boolean)
  is
    Value : aliased Types.Integer_t;
  begin
    Thin.Get_Sourcei
      (Source_ID => Types.Unsigned_Integer_t (Source),
       Parameter => Thin.AL_LOOPING,
       Value     => Value'Address);
    Looping := Boolean'Val (Value);
  end Get_Looping;

  --
  -- Get_Maximum_Distance_*
  --

  procedure Get_Maximum_Distance_Discrete
    (Source   : in     Source_t;
     Distance :    out Types.Integer_t)
  is
    Value : Types.Integer_t;
  begin
    Thin.Get_Sourcei
      (Source_ID => Types.Unsigned_Integer_t (Source),
       Parameter => Thin.AL_MAX_DISTANCE,
       Value     => Value'Address);
    Distance := Value;
  end Get_Maximum_Distance_Discrete;

  procedure Get_Maximum_Distance_Float
    (Source   : in     Source_t;
     Distance :    out Types.Float_t)
  is
    Value : Types.Float_t;
  begin
    Thin.Get_Sourcef
      (Source_ID => Types.Unsigned_Integer_t (Source),
       Parameter => Thin.AL_MAX_DISTANCE,
       Value     => Value'Address);
    Distance := Value;
  end Get_Maximum_Distance_Float;

  --
  -- Get_Maximum_Gain
  --

  procedure Get_Maximum_Gain
    (Source : in     Source_t;
     Gain   :    out Gain_t)
  is
    Value : aliased Gain_t;
  begin
    Thin.Get_Sourcef
      (Source_ID => Types.Unsigned_Integer_t (Source),
       Parameter => Thin.AL_MAX_GAIN,
       Value     => Value'Address);
    Gain := Value;
  end Get_Maximum_Gain;

  --
  -- Get_Minimum_Gain
  --

  procedure Get_Minimum_Gain
    (Source : in     Source_t;
     Gain   :    out Gain_t)
  is
    Value : aliased Gain_t;
  begin
    Thin.Get_Sourcef
      (Source_ID => Types.Unsigned_Integer_t (Source),
       Parameter => Thin.AL_MIN_GAIN,
       Value     => Value'Address);
    Gain := Value;
  end Get_Minimum_Gain;

  --
  -- Get_Pitch
  --

  procedure Get_Pitch
    (Source : in     Source_t;
     Pitch  :    out Pitch_t)
  is
    Value : aliased Pitch_t;
  begin
    Thin.Get_Sourcef
      (Source_ID => Types.Unsigned_Integer_t (Source),
       Parameter => Thin.AL_PITCH,
       Value     => Value'Address);
    Pitch := Value;
  end Get_Pitch;

  --
  -- Get_Position_*
  --

  procedure Get_Position_Discrete
    (Source : in     Source_t;
     X      :    out Types.Integer_t;
     Y      :    out Types.Integer_t;
     Z      :    out Types.Integer_t)
  is
    V : aliased Types.Vector_3i_t;
  begin
    Get_Position_Discrete_List (Source, V);

    X := V (1);
    Y := V (2);
    Z := V (3);
  end Get_Position_Discrete;

  procedure Get_Position_Discrete_List
    (Source   : in     Source_t;
     Position :    out Types.Vector_3i_t) is
  begin
    Thin.Get_Sourceiv
      (Source_ID => Types.Unsigned_Integer_t (Source),
       Parameter => Thin.AL_POSITION,
       Values    => Position (Position'First)'Address);
  end Get_Position_Discrete_List;

  procedure Get_Position_Float
    (Source : in     Source_t;
     X      :    out Types.Float_t;
     Y      :    out Types.Float_t;
     Z      :    out Types.Float_t)
  is
    V : aliased Types.Vector_3f_t;
  begin
    Get_Position_Float_List (Source, V);

    X := V (1);
    Y := V (2);
    Z := V (3);
  end Get_Position_Float;

  procedure Get_Position_Float_List
    (Source   : in     Source_t;
     Position :    out Types.Vector_3f_t) is
  begin
    Thin.Get_Sourcefv
      (Source_ID => Types.Unsigned_Integer_t (Source),
       Parameter => Thin.AL_POSITION,
       Values    => Position (Position'First)'Address);
  end Get_Position_Float_List;

  procedure Get_Positioning
    (Source   : in     Source_t;
     Relative :    out Boolean)
  is
    Value : aliased Types.Integer_t;
  begin
    Thin.Get_Sourcei
      (Source_ID => Types.Unsigned_Integer_t (Source),
       Parameter => Thin.AL_SOURCE_RELATIVE,
       Value     => Value'Address);
    Relative := Boolean'Val (Value);
  end Get_Positioning;

  --
  -- Get_Reference_Distance_*
  --

  procedure Get_Reference_Distance_Discrete
    (Source   : in     Source_t;
     Distance :    out Types.Integer_t)
  is
    Value : Types.Integer_t;
  begin
    Thin.Get_Sourcei
      (Source_ID => Types.Unsigned_Integer_t (Source),
       Parameter => Thin.AL_REFERENCE_DISTANCE,
       Value     => Value'Address);
    Distance := Value;
  end Get_Reference_Distance_Discrete;

  procedure Get_Reference_Distance_Float
    (Source   : in     Source_t;
     Distance :    out Types.Float_t)
  is
    Value : Types.Float_t;
  begin
    Thin.Get_Sourcef
      (Source_ID => Types.Unsigned_Integer_t (Source),
       Parameter => Thin.AL_REFERENCE_DISTANCE,
       Value     => Value'Address);
    Distance := Value;
  end Get_Reference_Distance_Float;

  --
  -- Get_Rolloff_Factor_*
  --

  procedure Get_Rolloff_Factor_Discrete
    (Source   : in     Source_t;
     Distance :    out Types.Integer_t)
  is
    Value : Types.Integer_t;
  begin
    Thin.Get_Sourcei
      (Source_ID => Types.Unsigned_Integer_t (Source),
       Parameter => Thin.AL_ROLLOFF_FACTOR,
       Value     => Value'Address);
    Distance := Value;
  end Get_Rolloff_Factor_Discrete;

  procedure Get_Rolloff_Factor_Float
    (Source   : in     Source_t;
     Distance :    out Types.Float_t)
  is
    Value : Types.Float_t;
  begin
    Thin.Get_Sourcef
      (Source_ID => Types.Unsigned_Integer_t (Source),
       Parameter => Thin.AL_ROLLOFF_FACTOR,
       Value     => Value'Address);
    Distance := Value;
  end Get_Rolloff_Factor_Float;

  --
  -- Get_Sample_Offset_*
  --

  procedure Get_Sample_Offset_Discrete
    (Source   : in     Source_t;
     Distance :    out Types.Integer_t)
  is
    Value : Types.Integer_t;
  begin
    Thin.Get_Sourcei
      (Source_ID => Types.Unsigned_Integer_t (Source),
       Parameter => Thin.AL_SAMPLE_OFFSET,
       Value     => Value'Address);
    Distance := Value;
  end Get_Sample_Offset_Discrete;

  procedure Get_Sample_Offset_Float
    (Source   : in     Source_t;
     Distance :    out Types.Float_t)
  is
    Value : Types.Float_t;
  begin
    Thin.Get_Sourcef
      (Source_ID => Types.Unsigned_Integer_t (Source),
       Parameter => Thin.AL_SAMPLE_OFFSET,
       Value     => Value'Address);
    Distance := Value;
  end Get_Sample_Offset_Float;

  --
  -- Get_Seconds_Offset_*
  --

  procedure Get_Seconds_Offset_Discrete
    (Source   : in     Source_t;
     Distance :    out Types.Integer_t)
  is
    Value : Types.Integer_t;
  begin
    Thin.Get_Sourcei
      (Source_ID => Types.Unsigned_Integer_t (Source),
       Parameter => Thin.AL_SEC_OFFSET,
       Value     => Value'Address);
    Distance := Value;
  end Get_Seconds_Offset_Discrete;

  procedure Get_Seconds_Offset_Float
    (Source   : in     Source_t;
     Distance :    out Types.Float_t)
  is
    Value : Types.Float_t;
  begin
    Thin.Get_Sourcef
      (Source_ID => Types.Unsigned_Integer_t (Source),
       Parameter => Thin.AL_SEC_OFFSET,
       Value     => Value'Address);
    Distance := Value;
  end Get_Seconds_Offset_Float;

  --
  -- Get_Type
  --

  procedure Get_Type
    (Source      : in     Source_t;
     Source_Type :    out Source_Type_t)
  is
    Value : aliased Types.Integer_t;
  begin
    Thin.Get_Sourcei
      (Source_ID => Types.Unsigned_Integer_t (Source),
       Parameter => Thin.AL_SOURCE_TYPE,
       Value     => Value'Address);

    case Value is
      when Thin.AL_UNDETERMINED => Source_Type := Undetermined;
      when Thin.AL_STATIC       => Source_Type := Static;
      when Thin.AL_STREAMING    => Source_Type := Streaming;
      when others =>
        raise Constraint_Error with "invalid value returned from alGetSourcei";
    end case;
  end Get_Type;

  --
  -- Get_Velocity_*
  --

  procedure Get_Velocity_Discrete
    (Source : in     Source_t;
     X      :    out Types.Integer_t;
     Y      :    out Types.Integer_t;
     Z      :    out Types.Integer_t)
  is
    V : aliased Types.Vector_3i_t;
  begin
    Get_Velocity_Discrete_List (Source, V);

    X := V (1);
    Y := V (2);
    Z := V (3);
  end Get_Velocity_Discrete;

  procedure Get_Velocity_Discrete_List
    (Source   : in     Source_t;
     Velocity :    out Types.Vector_3i_t) is
  begin
    Thin.Get_Sourceiv
      (Source_ID => Types.Unsigned_Integer_t (Source),
       Parameter => Thin.AL_VELOCITY,
       Values    => Velocity (Velocity'First)'Address);
  end Get_Velocity_Discrete_List;

  procedure Get_Velocity_Float
    (Source : in     Source_t;
     X      :    out Types.Float_t;
     Y      :    out Types.Float_t;
     Z      :    out Types.Float_t)
  is
    V : aliased Types.Vector_3f_t;
  begin
    Get_Velocity_Float_List (Source, V);

    X := V (1);
    Y := V (2);
    Z := V (3);
  end Get_Velocity_Float;

  procedure Get_Velocity_Float_List
    (Source   : in     Source_t;
     Velocity :    out Types.Vector_3f_t) is
  begin
    Thin.Get_Sourcefv
      (Source_ID => Types.Unsigned_Integer_t (Source),
       Parameter => Thin.AL_VELOCITY,
       Values    => Velocity (Velocity'First)'Address);
  end Get_Velocity_Float_List;

  --
  -- Is_Valid
  --

  function Is_Valid (Source : in Source_t) return Boolean is
  begin
    return Boolean (Thin.Is_Source (Types.Unsigned_Integer_t (Source)));
  end Is_Valid;

  --
  -- Pause
  --

  procedure Pause (Source : in Source_t) is
  begin
    Thin.Source_Pause (Types.Unsigned_Integer_t (Source));
  end Pause;

  procedure Pause_List (Sources : in Source_Array_t) is
  begin
    Thin.Source_Pausev
      (Size       => Sources'Length,
       Source_IDs => Sources (Sources'First)'Address);
  end Pause_List;

  --
  -- Play
  --

  procedure Play (Source : in Source_t) is
  begin
    Thin.Source_Play (Types.Unsigned_Integer_t (Source));
  end Play;

  procedure Play_List (Sources : in Source_Array_t) is
  begin
    Thin.Source_Playv
      (Size       => Sources'Length,
       Source_IDs => Sources (Sources'First)'Address);
  end Play_List;

  --
  -- Queue_Buffers
  --

  procedure Queue_Buffers
    (Source  : in Source_t;
     Buffers : in OpenAL.Buffer.Buffer_Array_t) is
  begin
    Thin.Source_Queue_Buffers
      (Source_ID  => Types.Unsigned_Integer_t (Source),
       Size       => Buffers'Length,
       Buffer_IDs => Buffers (Buffers'First)'Address);
  end Queue_Buffers;

  --
  -- Rewind
  --

  procedure Rewind (Source : in Source_t) is
  begin
    Thin.Source_Rewind (Types.Unsigned_Integer_t (Source));
  end Rewind;

  procedure Rewind_List (Sources : in Source_Array_t) is
  begin
    Thin.Source_Rewindv
      (Size       => Sources'Length,
       Source_IDs => Sources (Sources'First)'Address);
  end Rewind_List;

  --
  -- Set_Byte_Offset_*
  --

  procedure Set_Byte_Offset_Discrete
    (Source   : in Source_t;
     Distance : in Types.Integer_t) is
  begin
    Thin.Sourcei
      (Source_ID => Types.Unsigned_Integer_t (Source),
       Parameter => Thin.AL_BYTE_OFFSET,
       Value     => Distance);
  end Set_Byte_Offset_Discrete;

  procedure Set_Byte_Offset_Float
    (Source   : in Source_t;
     Distance : in Types.Float_t) is
  begin
    Thin.Sourcef
      (Source_ID => Types.Unsigned_Integer_t (Source),
       Parameter => Thin.AL_BYTE_OFFSET,
       Value     => Distance);
  end Set_Byte_Offset_Float;

  --
  -- Set_Cone_Inner_Angle_*
  --

  procedure Set_Cone_Inner_Angle_Discrete
    (Source   : in Source_t;
     Distance : in Types.Integer_t) is
  begin
    Thin.Sourcei
      (Source_ID => Types.Unsigned_Integer_t (Source),
       Parameter => Thin.AL_CONE_INNER_ANGLE,
       Value     => Distance);
  end Set_Cone_Inner_Angle_Discrete;

  procedure Set_Cone_Inner_Angle_Float
    (Source   : in Source_t;
     Distance : in Types.Float_t) is
  begin
    Thin.Sourcef
      (Source_ID => Types.Unsigned_Integer_t (Source),
       Parameter => Thin.AL_CONE_INNER_ANGLE,
       Value     => Distance);
  end Set_Cone_Inner_Angle_Float;

  --
  -- Set_Cone_Outer_Angle_*
  --

  procedure Set_Cone_Outer_Angle_Discrete
    (Source   : in Source_t;
     Distance : in Types.Integer_t) is
  begin
    Thin.Sourcei
      (Source_ID => Types.Unsigned_Integer_t (Source),
       Parameter => Thin.AL_CONE_OUTER_ANGLE,
       Value     => Distance);
  end Set_Cone_Outer_Angle_Discrete;

  procedure Set_Cone_Outer_Angle_Float
    (Source   : in Source_t;
     Distance : in Types.Float_t) is
  begin
    Thin.Sourcef
      (Source_ID => Types.Unsigned_Integer_t (Source),
       Parameter => Thin.AL_CONE_OUTER_ANGLE,
       Value     => Distance);
  end Set_Cone_Outer_Angle_Float;

  --
  -- Set_Cone_Outer_Gain
  --

  procedure Set_Cone_Outer_Gain
    (Source : in Source_t;
     Gain   : in Types.Float_t) is
  begin
    Thin.Sourcef
      (Source_ID => Types.Unsigned_Integer_t (Source),
       Parameter => Thin.AL_CONE_OUTER_GAIN,
       Value     => Gain);
  end Set_Cone_Outer_Gain;

  --
  -- Set_Current_Buffer
  --

  procedure Set_Current_Buffer
    (Source : in Source_t;
     Buffer : in OpenAL.Buffer.Buffer_t) is
  begin
    Thin.Sourcei
      (Source_ID => Types.Unsigned_Integer_t (Source),
       Parameter => Thin.AL_BUFFER,
       Value     => Types.Integer_t (OpenAL.Buffer.To_Integer (Buffer)));
  end Set_Current_Buffer;

  --
  -- Set_Direction_*
  --

  procedure Set_Direction_Discrete
    (Source : in Source_t;
     X      : in Types.Integer_t;
     Y      : in Types.Integer_t;
     Z      : in Types.Integer_t) is
  begin
    Thin.Source_3i
      (Source_ID => Types.Unsigned_Integer_t (Source),
       Parameter => Thin.AL_DIRECTION,
       Value_1   => X,
       Value_2   => Y,
       Value_3   => Z);
  end Set_Direction_Discrete;

  procedure Set_Direction_Discrete_List
    (Source    : in Source_t;
     Direction : in Types.Vector_3i_t) is
  begin
    Thin.Sourceiv
      (Source_ID => Types.Unsigned_Integer_t (Source),
       Parameter => Thin.AL_DIRECTION,
       Values    => Direction (Direction'First)'Address);
  end Set_Direction_Discrete_List;

  procedure Set_Direction_Float
    (Source : in Source_t;
     X      : in Types.Float_t;
     Y      : in Types.Float_t;
     Z      : in Types.Float_t) is
  begin
    Thin.Source_3f
      (Source_ID => Types.Unsigned_Integer_t (Source),
       Parameter => Thin.AL_DIRECTION,
       Value_1   => X,
       Value_2   => Y,
       Value_3   => Z);
  end Set_Direction_Float;

  procedure Set_Direction_Float_List
    (Source    : in Source_t;
     Direction : in Types.Vector_3f_t) is
  begin
    Thin.Sourcefv
      (Source_ID => Types.Unsigned_Integer_t (Source),
       Parameter => Thin.AL_DIRECTION,
       Values    => Direction (Direction'First)'Address);
  end Set_Direction_Float_List;

  --
  -- Set_Gain
  --

  procedure Set_Gain
    (Source : in Source_t;
     Gain   : in Types.Float_t) is
  begin
    Thin.Sourcef
      (Source_ID => Types.Unsigned_Integer_t (Source),
       Parameter => Thin.AL_GAIN,
       Value     => Gain);
  end Set_Gain;

  --
  -- Set_Looping
  --

  procedure Set_Looping
    (Source  : in Source_t;
     Looping : in Boolean) is
  begin
    Thin.Sourcei
      (Source_ID => Types.Unsigned_Integer_t (Source),
       Parameter => Thin.AL_LOOPING,
       Value     => Boolean'Pos (Looping));
  end Set_Looping;

  --
  -- Set_Maximum_Distance_*
  --

  procedure Set_Maximum_Distance_Discrete
    (Source   : in Source_t;
     Distance : in Types.Integer_t) is
  begin
    Thin.Sourcei
      (Source_ID => Types.Unsigned_Integer_t (Source),
       Parameter => Thin.AL_MAX_DISTANCE,
       Value     => Distance);
  end Set_Maximum_Distance_Discrete;

  procedure Set_Maximum_Distance_Float
    (Source   : in Source_t;
     Distance : in Types.Float_t) is
  begin
    Thin.Sourcef
      (Source_ID => Types.Unsigned_Integer_t (Source),
       Parameter => Thin.AL_MAX_DISTANCE,
       Value     => Distance);
  end Set_Maximum_Distance_Float;

  --
  -- Set_Maximum_Gain
  --

  procedure Set_Maximum_Gain
    (Source : in Source_t;
     Gain   : in Gain_t) is
  begin
    Thin.Sourcef
      (Source_ID => Types.Unsigned_Integer_t (Source),
       Parameter => Thin.AL_MAX_GAIN,
       Value     => Gain);
  end Set_Maximum_Gain;

  --
  -- Set_Minimum_Gain
  --

  procedure Set_Minimum_Gain
    (Source : in Source_t;
     Gain   : in Gain_t) is
  begin
    Thin.Sourcef
      (Source_ID => Types.Unsigned_Integer_t (Source),
       Parameter => Thin.AL_MIN_GAIN,
       Value     => Gain);
  end Set_Minimum_Gain;

  --
  -- Set_Pitch
  --

  procedure Set_Pitch
    (Source : in Source_t;
     Pitch  : in Pitch_t) is
  begin
    Thin.Sourcef
      (Source_ID => Types.Unsigned_Integer_t (Source),
       Parameter => Thin.AL_PITCH,
       Value     => Pitch);
  end Set_Pitch;

  --
  -- Set_Position_*
  --

  procedure Set_Position_Discrete
    (Source    : in Source_t;
     X         : in Types.Integer_t;
     Y         : in Types.Integer_t;
     Z         : in Types.Integer_t) is
  begin
    Thin.Source_3i
      (Source_ID => Types.Unsigned_Integer_t (Source),
       Parameter => Thin.AL_POSITION,
       Value_1   => X,
       Value_2   => Y,
       Value_3   => Z);
  end Set_Position_Discrete;

  procedure Set_Position_Discrete_List
    (Source    : in Source_t;
     Position  : in Types.Vector_3i_t) is
  begin
    Thin.Sourceiv
      (Source_ID => Types.Unsigned_Integer_t (Source),
       Parameter => Thin.AL_POSITION,
       Values    => Position (Position'First)'Address);
  end Set_Position_Discrete_List;

  procedure Set_Position_Float
    (Source    : in Source_t;
     X         : in Types.Float_t;
     Y         : in Types.Float_t;
     Z         : in Types.Float_t) is
  begin
    Thin.Source_3f
      (Source_ID => Types.Unsigned_Integer_t (Source),
       Parameter => Thin.AL_POSITION,
       Value_1   => X,
       Value_2   => Y,
       Value_3   => Z);
  end Set_Position_Float;

  procedure Set_Position_Float_List
    (Source    : in Source_t;
     Position  : in Types.Vector_3f_t) is
  begin
    Thin.Sourcefv
      (Source_ID => Types.Unsigned_Integer_t (Source),
       Parameter => Thin.AL_POSITION,
       Values    => Position (Position'First)'Address);
  end Set_Position_Float_List;

  procedure Set_Positioning
    (Source   : in Source_t;
     Relative : in Boolean) is
  begin
    Thin.Sourcei
      (Source_ID => Types.Unsigned_Integer_t (Source),
       Parameter => Thin.AL_SOURCE_RELATIVE,
       Value     => Boolean'Pos (Relative));
  end Set_Positioning;

  --
  -- Set_Reference_Distance_*
  --

  procedure Set_Reference_Distance_Discrete
    (Source   : in Source_t;
     Distance : in Types.Integer_t) is
  begin
    Thin.Sourcei
      (Source_ID => Types.Unsigned_Integer_t (Source),
       Parameter => Thin.AL_REFERENCE_DISTANCE,
       Value     => Distance);
  end Set_Reference_Distance_Discrete;

  procedure Set_Reference_Distance_Float
    (Source   : in Source_t;
     Distance : in Types.Float_t) is
  begin
    Thin.Sourcef
      (Source_ID => Types.Unsigned_Integer_t (Source),
       Parameter => Thin.AL_REFERENCE_DISTANCE,
       Value     => Distance);
  end Set_Reference_Distance_Float;

  --
  -- Set_Rolloff_Factor_*
  --

  procedure Set_Rolloff_Factor_Discrete
    (Source   : in Source_t;
     Distance : in Types.Integer_t) is
  begin
    Thin.Sourcei
      (Source_ID => Types.Unsigned_Integer_t (Source),
       Parameter => Thin.AL_ROLLOFF_FACTOR,
       Value     => Distance);
  end Set_Rolloff_Factor_Discrete;

  procedure Set_Rolloff_Factor_Float
    (Source   : in Source_t;
     Distance : in Types.Float_t) is
  begin
    Thin.Sourcef
      (Source_ID => Types.Unsigned_Integer_t (Source),
       Parameter => Thin.AL_ROLLOFF_FACTOR,
       Value     => Distance);
  end Set_Rolloff_Factor_Float;

  --
  -- Set_Sample_Offset_*
  --

  procedure Set_Sample_Offset_Discrete
    (Source   : in Source_t;
     Distance : in Types.Integer_t) is
  begin
    Thin.Sourcei
      (Source_ID => Types.Unsigned_Integer_t (Source),
       Parameter => Thin.AL_SAMPLE_OFFSET,
       Value     => Distance);
  end Set_Sample_Offset_Discrete;

  procedure Set_Sample_Offset_Float
    (Source   : in Source_t;
     Distance : in Types.Float_t) is
  begin
    Thin.Sourcef
      (Source_ID => Types.Unsigned_Integer_t (Source),
       Parameter => Thin.AL_SAMPLE_OFFSET,
       Value     => Distance);
  end Set_Sample_Offset_Float;

  --
  -- Set_Seconds_Offset_*
  --

  procedure Set_Seconds_Offset_Discrete
    (Source   : in Source_t;
     Distance : in Types.Integer_t) is
  begin
    Thin.Sourcei
      (Source_ID => Types.Unsigned_Integer_t (Source),
       Parameter => Thin.AL_SEC_OFFSET,
       Value     => Distance);
  end Set_Seconds_Offset_Discrete;

  procedure Set_Seconds_Offset_Float
    (Source   : in Source_t;
     Distance : in Types.Float_t) is
  begin
    Thin.Sourcef
      (Source_ID => Types.Unsigned_Integer_t (Source),
       Parameter => Thin.AL_SEC_OFFSET,
       Value     => Distance);
  end Set_Seconds_Offset_Float;

  --
  -- Set_Velocity_*
  --

  procedure Set_Velocity_Discrete
    (Source    : in Source_t;
     X         : in Types.Integer_t;
     Y         : in Types.Integer_t;
     Z         : in Types.Integer_t) is
  begin
    Thin.Source_3i
      (Source_ID => Types.Unsigned_Integer_t (Source),
       Parameter => Thin.AL_VELOCITY,
       Value_1   => X,
       Value_2   => Y,
       Value_3   => Z);
  end Set_Velocity_Discrete;

  procedure Set_Velocity_Discrete_List
    (Source    : in Source_t;
     Velocity  : in Types.Vector_3i_t) is
  begin
    Thin.Sourceiv
      (Source_ID => Types.Unsigned_Integer_t (Source),
       Parameter => Thin.AL_VELOCITY,
       Values    => Velocity (Velocity'First)'Address);
  end Set_Velocity_Discrete_List;

  procedure Set_Velocity_Float
    (Source    : in Source_t;
     X         : in Types.Float_t;
     Y         : in Types.Float_t;
     Z         : in Types.Float_t) is
  begin
    Thin.Source_3f
      (Source_ID => Types.Unsigned_Integer_t (Source),
       Parameter => Thin.AL_VELOCITY,
       Value_1   => X,
       Value_2   => Y,
       Value_3   => Z);
  end Set_Velocity_Float;

  procedure Set_Velocity_Float_List
    (Source    : in Source_t;
     Velocity  : in Types.Vector_3f_t) is
  begin
    Thin.Sourcefv
      (Source_ID => Types.Unsigned_Integer_t (Source),
       Parameter => Thin.AL_VELOCITY,
       Values    => Velocity (Velocity'First)'Address);
  end Set_Velocity_Float_List;

  --
  -- Stop
  --

  procedure Stop (Source : in Source_t) is
  begin
    Thin.Source_Stop (Types.Unsigned_Integer_t (Source));
  end Stop;

  procedure Stop_List (Sources : in Source_Array_t) is
  begin
    Thin.Source_Stopv
      (Size       => Sources'Length,
       Source_IDs => Sources (Sources'First)'Address);
  end Stop_List;

  --
  -- Unqueue_Buffers
  --

  procedure Unqueue_Buffers
    (Source  : in Source_t;
     Buffers : in OpenAL.Buffer.Buffer_Array_t) is
  begin
    Thin.Source_Unqueue_Buffers
      (Source_ID  => Types.Unsigned_Integer_t (Source),
       Size       => Buffers'Length,
       Buffer_IDs => Buffers (Buffers'First)'Address);
  end Unqueue_Buffers;

end OpenAL.Source;
