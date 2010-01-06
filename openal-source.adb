with OpenAL.Thin;

package body OpenAL.Source is

  use type Thin.Size_t;

  procedure Generate_Sources
    (Sources : in out Source_Array_t) is
  begin
    Thin.Gen_Sources
      (Size    => Sources'Length,
       Sources => Sources (Sources'First)'Address);
  end Generate_Sources;

  procedure Delete_Sources
    (Sources : in Source_Array_t) is
  begin
    Thin.Delete_Sources
      (Size    => Sources'Length,
       Sources => Sources (Sources'First)'Address);
  end Delete_Sources;

  function Is_Valid (Source : in Source_ID_t) return Boolean is
  begin
    return Boolean (Thin.Is_Source (Thin.Unsigned_Integer_t (Source)));
  end Is_Valid;

  --
  -- Position
  --

  procedure Set_Position_f
    (Source    : in Source_ID_t;
     X         : in Types.Float_t;
     Y         : in Types.Float_t;
     Z         : in Types.Float_t) is
  begin
    Thin.Source_3f
      (Source_ID => Thin.Unsigned_Integer_t (Source),
       Parameter => Thin.AL_POSITION,
       Value_1   => Thin.Float_t (X),
       Value_2   => Thin.Float_t (Y),
       Value_3   => Thin.Float_t (Z));
  end Set_Position_f;

  procedure Set_Position_i
    (Source    : in Source_ID_t;
     X         : in Types.Integer_t;
     Y         : in Types.Integer_t;
     Z         : in Types.Integer_t) is
  begin
    Thin.Source_3i
      (Source_ID => Thin.Unsigned_Integer_t (Source),
       Parameter => Thin.AL_POSITION,
       Value_1   => Thin.Integer_t (X),
       Value_2   => Thin.Integer_t (Y),
       Value_3   => Thin.Integer_t (Z));
  end Set_Position_i;

  procedure Set_Position_fv
    (Source    : in Source_ID_t;
     Position  : in Types.Vector_3f_t) is
  begin
    Thin.Sourcefv
      (Source_ID => Thin.Unsigned_Integer_t (Source),
       Parameter => Thin.AL_POSITION,
       Values    => Position (Position'First)'Address);
  end Set_Position_fv;

  procedure Set_Position_iv
    (Source    : in Source_ID_t;
     Position  : in Types.Vector_3i_t) is
  begin
    Thin.Sourceiv
      (Source_ID => Thin.Unsigned_Integer_t (Source),
       Parameter => Thin.AL_POSITION,
       Values    => Position (Position'First)'Address);
  end Set_Position_iv;

  procedure Get_Position_f
    (Source : in     Source_ID_t;
     X      :    out Types.Float_t;
     Y      :    out Types.Float_t;
     Z      :    out Types.Float_t)
  is
    V : aliased Types.Vector_3f_t;
  begin
    Get_Position_fv (Source, V);

    X := V (1);
    Y := V (2);
    Z := V (3);
  end Get_Position_f;

  procedure Get_Position_i
    (Source : in     Source_ID_t;
     X      :    out Types.Integer_t;
     Y      :    out Types.Integer_t;
     Z      :    out Types.Integer_t)
  is
    V : aliased Types.Vector_3i_t;
  begin
    Get_Position_iv (Source, V);

    X := V (1);
    Y := V (2);
    Z := V (3);
  end Get_Position_i;

  procedure Get_Position_fv
    (Source   : in     Source_ID_t;
     Position :    out Types.Vector_3f_t) is
  begin
    Thin.Get_Sourcefv
      (Source_ID => Thin.Unsigned_Integer_t (Source),
       Parameter => Thin.AL_POSITION,
       Values    => Position (Position'First)'Address);
  end Get_Position_fv;

  procedure Get_Position_iv
    (Source   : in     Source_ID_t;
     Position :    out Types.Vector_3i_t) is
  begin
    Thin.Get_Sourceiv
      (Source_ID => Thin.Unsigned_Integer_t (Source),
       Parameter => Thin.AL_POSITION,
       Values    => Position (Position'First)'Address);
  end Get_Position_iv;

  --
  -- Velocity
  --

  procedure Set_Velocity_f
    (Source    : in Source_ID_t;
     X         : in Types.Float_t;
     Y         : in Types.Float_t;
     Z         : in Types.Float_t) is
  begin
    Thin.Source_3f
      (Source_ID => Thin.Unsigned_Integer_t (Source),
       Parameter => Thin.AL_VELOCITY,
       Value_1   => Thin.Float_t (X),
       Value_2   => Thin.Float_t (Y),
       Value_3   => Thin.Float_t (Z));
  end Set_Velocity_f;

  procedure Set_Velocity_i
    (Source    : in Source_ID_t;
     X         : in Types.Integer_t;
     Y         : in Types.Integer_t;
     Z         : in Types.Integer_t) is
  begin
    Thin.Source_3i
      (Source_ID => Thin.Unsigned_Integer_t (Source),
       Parameter => Thin.AL_VELOCITY,
       Value_1   => Thin.Integer_t (X),
       Value_2   => Thin.Integer_t (Y),
       Value_3   => Thin.Integer_t (Z));
  end Set_Velocity_i;

  procedure Set_Velocity_fv
    (Source    : in Source_ID_t;
     Velocity  : in Types.Vector_3f_t) is
  begin
    Thin.Sourcefv
      (Source_ID => Thin.Unsigned_Integer_t (Source),
       Parameter => Thin.AL_VELOCITY,
       Values    => Velocity (Velocity'First)'Address);
  end Set_Velocity_fv;

  procedure Set_Velocity_iv
    (Source    : in Source_ID_t;
     Velocity  : in Types.Vector_3i_t) is
  begin
    Thin.Sourceiv
      (Source_ID => Thin.Unsigned_Integer_t (Source),
       Parameter => Thin.AL_VELOCITY,
       Values    => Velocity (Velocity'First)'Address);
  end Set_Velocity_iv;

  procedure Get_Velocity_f
    (Source : in     Source_ID_t;
     X      :    out Types.Float_t;
     Y      :    out Types.Float_t;
     Z      :    out Types.Float_t)
  is
    V : aliased Types.Vector_3f_t;
  begin
    Get_Velocity_fv (Source, V);

    X := V (1);
    Y := V (2);
    Z := V (3);
  end Get_Velocity_f;

  procedure Get_Velocity_i
    (Source : in     Source_ID_t;
     X      :    out Types.Integer_t;
     Y      :    out Types.Integer_t;
     Z      :    out Types.Integer_t)
  is
    V : aliased Types.Vector_3i_t;
  begin
    Get_Velocity_iv (Source, V);

    X := V (1);
    Y := V (2);
    Z := V (3);
  end Get_Velocity_i;

  procedure Get_Velocity_fv
    (Source   : in     Source_ID_t;
     Velocity :    out Types.Vector_3f_t) is
  begin
    Thin.Get_Sourcefv
      (Source_ID => Thin.Unsigned_Integer_t (Source),
       Parameter => Thin.AL_POSITION,
       Values    => Velocity (Velocity'First)'Address);
  end Get_Velocity_fv;

  procedure Get_Velocity_iv
    (Source   : in     Source_ID_t;
     Velocity :    out Types.Vector_3i_t) is
  begin
    Thin.Get_Sourceiv
      (Source_ID => Thin.Unsigned_Integer_t (Source),
       Parameter => Thin.AL_POSITION,
       Values    => Velocity (Velocity'First)'Address);
  end Get_Velocity_iv;

  --
  -- Gain
  --

  procedure Set_Gain
    (Source : in Source_ID_t;
     Gain   : in Types.Float_t) is
  begin
    Thin.Sourcef
      (Source_ID => Thin.Unsigned_Integer_t (Source),
       Parameter => Thin.AL_GAIN,
       Value     => Thin.Float_t (Gain));
  end Set_Gain;

  procedure Get_Gain
    (Source : in     Source_ID_t;
     Gain   :    out Types.Float_t)
  is
    Value : aliased Types.Float_t;
  begin
    Thin.Get_Sourcef
      (Source_ID => Thin.Unsigned_Integer_t (Source),
       Parameter => Thin.AL_GAIN,
       Value     => Value'Address);
    Gain := Value;
  end Get_Gain;

  --
  -- Positioning
  --

  procedure Set_Positioning
    (Source   : in Source_ID_t;
     Relative : in Boolean) is
  begin
    Thin.Sourcei
      (Source_ID => Thin.Unsigned_Integer_t (Source),
       Parameter => Thin.AL_SOURCE_RELATIVE,
       Value     => Thin.Integer_t (Boolean'Pos (Relative)));
  end Set_Positioning;

  procedure Get_Positioning
    (Source   : in     Source_ID_t;
     Relative :    out Boolean)
  is
    Value : aliased Thin.Integer_t;
  begin
    Thin.Get_Sourcei
      (Source_ID => Thin.Unsigned_Integer_t (Source),
       Parameter => Thin.AL_SOURCE_RELATIVE,
       Value     => Value'Address);
    Relative := Boolean'Val (Value);
  end Get_Positioning;

  --
  -- Type
  --

  procedure Get_Type
    (Source      : in     Source_ID_t;
     Source_Type :    out Source_Type_t)
  is
    Value : aliased Thin.Integer_t;
  begin
    Thin.Get_Sourcei
      (Source_ID => Thin.Unsigned_Integer_t (Source),
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
  -- Looping
  --

  procedure Set_Looping
    (Source  : in Source_ID_t;
     Looping : in Boolean) is
  begin
    Thin.Sourcei
      (Source_ID => Thin.Unsigned_Integer_t (Source),
       Parameter => Thin.AL_LOOPING,
       Value     => Thin.Integer_t (Boolean'Pos (Looping)));
  end Set_Looping;

  procedure Get_Looping
    (Source  : in     Source_ID_t;
     Looping :    out Boolean)
  is
    Value : aliased Thin.Integer_t;
  begin
    Thin.Get_Sourcei
      (Source_ID => Thin.Unsigned_Integer_t (Source),
       Parameter => Thin.AL_LOOPING,
       Value     => Value'Address);
    Looping := Boolean'Val (Value);
  end Get_Looping;

  --
  -- Current_Buffer
  --

  procedure Set_Current_Buffer
    (Source : in Source_ID_t;
     Buffer : in OpenAL.Buffer.Buffer_ID_t) is
  begin
    Thin.Sourcei
      (Source_ID => Thin.Unsigned_Integer_t (Source),
       Parameter => Thin.AL_BUFFER,
       Value     => Thin.Integer_t (OpenAL.Buffer.To_Integer (Buffer)));
  end Set_Current_Buffer;

  procedure Get_Current_Buffer
    (Source : in     Source_ID_t;
     Buffer :    out OpenAL.Buffer.Buffer_ID_t)
  is
    Value : aliased Thin.Unsigned_Integer_t;
  begin
    Thin.Get_Sourcei
      (Source_ID => Thin.Unsigned_Integer_t (Source),
       Parameter => Thin.AL_BUFFER,
       Value     => Value'Address);
    Buffer := OpenAL.Buffer.From_Integer (Value);
  end Get_Current_Buffer;

  --
  -- Buffers_Queued
  --

  procedure Get_Buffers_Queued
    (Source  : in     Source_ID_t;
     Buffers :    out Natural)
  is
    Value : aliased Thin.Unsigned_Integer_t;
  begin
    Thin.Get_Sourcei
      (Source_ID => Thin.Unsigned_Integer_t (Source),
       Parameter => Thin.AL_BUFFERS_QUEUED,
       Value     => Value'Address);
    Buffers := Natural (Value);
  end Get_Buffers_Queued;

  --
  -- Buffers_Processed
  --

  procedure Get_Buffers_Processed
    (Source  : in     Source_ID_t;
     Buffers :    out Natural)
  is
    Value : aliased Thin.Unsigned_Integer_t;
  begin
    Thin.Get_Sourcei
      (Source_ID => Thin.Unsigned_Integer_t (Source),
       Parameter => Thin.AL_BUFFERS_QUEUED,
       Value     => Value'Address);
    Buffers := Natural (Value);
  end Get_Buffers_Processed;

  --
  -- Gain
  --

  procedure Set_Minimum_Gain
    (Source : in Source_ID_t;
     Gain   : in Gain_t) is
  begin
    Thin.Sourcef
      (Source_ID => Thin.Unsigned_Integer_t (Source),
       Parameter => Thin.AL_MIN_GAIN,
       Value     => Thin.Float_t (Gain));
  end Set_Minimum_Gain;

  procedure Get_Minimum_Gain
    (Source : in     Source_ID_t;
     Gain   :    out Gain_t)
  is
    Value : aliased Gain_t;
  begin
    Thin.Get_Sourcef
      (Source_ID => Thin.Unsigned_Integer_t (Source),
       Parameter => Thin.AL_MIN_GAIN,
       Value     => Value'Address);
    Gain := Value;
  end Get_Minimum_Gain;

  procedure Set_Maximum_Gain
    (Source : in Source_ID_t;
     Gain   : in Gain_t) is
  begin
    Thin.Sourcef
      (Source_ID => Thin.Unsigned_Integer_t (Source),
       Parameter => Thin.AL_MIN_GAIN,
       Value     => Thin.Float_t (Gain));
  end Set_Maximum_Gain;

  procedure Get_Maximum_Gain
    (Source : in     Source_ID_t;
     Gain   :    out Gain_t)
  is
    Value : aliased Gain_t;
  begin
    Thin.Get_Sourcef
      (Source_ID => Thin.Unsigned_Integer_t (Source),
       Parameter => Thin.AL_MIN_GAIN,
       Value     => Value'Address);
    Gain := Value;
  end Get_Maximum_Gain;

  --
  -- Pitch
  --

  procedure Set_Pitch
    (Source : in Source_ID_t;
     Pitch  : in Pitch_t) is
  begin
    Thin.Sourcef
      (Source_ID => Thin.Unsigned_Integer_t (Source),
       Parameter => Thin.AL_PITCH,
       Value     => Thin.Float_t (Pitch));
  end Set_Pitch;

  procedure Get_Pitch
    (Source : in     Source_ID_t;
     Pitch  :    out Pitch_t)
  is
    Value : aliased Pitch_t;
  begin
    Thin.Get_Sourcef
      (Source_ID => Thin.Unsigned_Integer_t (Source),
       Parameter => Thin.AL_PITCH,
       Value     => Value'Address);
    Pitch := Value;
  end Get_Pitch;

  --
  -- Queue_Buffers
  --

  procedure Queue_Buffers
    (Source  : in Source_ID_t;
     Buffers : in OpenAL.Buffer.Buffer_Array_t) is
  begin
    Thin.Source_Queue_Buffers
      (Source_ID  => Thin.Unsigned_Integer_t (Source),
       Size       => Buffers'Length,
       Buffer_IDs => Buffers (Buffers'First)'Address);
  end Queue_Buffers;

  --
  -- Unqueue_Buffers
  --

  procedure Unqueue_Buffers
    (Source  : in Source_ID_t;
     Buffers : in OpenAL.Buffer.Buffer_Array_t) is
  begin
    Thin.Source_Unqueue_Buffers
      (Source_ID  => Thin.Unsigned_Integer_t (Source),
       Size       => Buffers'Length,
       Buffer_IDs => Buffers (Buffers'First)'Address);
  end Unqueue_Buffers;

  --
  -- Play
  --

  procedure Play (Source : in Source_ID_t) is
  begin
    Thin.Source_Play (Thin.Unsigned_Integer_t (Source));
  end Play;

  procedure Play_List (Sources : in Source_Array_t) is
  begin
    Thin.Source_Playv
      (Size       => Sources'Length,
       Source_IDs => Sources (Sources'First)'Address);
  end Play_List;

  --
  -- Pause
  --

  procedure Pause (Source : in Source_ID_t) is
  begin
    Thin.Source_Pause (Thin.Unsigned_Integer_t (Source));
  end Pause;

  procedure Pause_List (Sources : in Source_Array_t) is
  begin
    Thin.Source_Pausev
      (Size       => Sources'Length,
       Source_IDs => Sources (Sources'First)'Address);
  end Pause_List;

  --
  -- Stop
  --

  procedure Stop (Source : in Source_ID_t) is
  begin
    Thin.Source_Stop (Thin.Unsigned_Integer_t (Source));
  end Stop;

  procedure Stop_List (Sources : in Source_Array_t) is
  begin
    Thin.Source_Stopv
      (Size       => Sources'Length,
       Source_IDs => Sources (Sources'First)'Address);
  end Stop_List;

  --
  -- Rewind
  --

  procedure Rewind (Source : in Source_ID_t) is
  begin
    Thin.Source_Rewind (Thin.Unsigned_Integer_t (Source));
  end Rewind;

  procedure Rewind_List (Sources : in Source_Array_t) is
  begin
    Thin.Source_Rewindv
      (Size       => Sources'Length,
       Source_IDs => Sources (Sources'First)'Address);
  end Rewind_List;

end OpenAL.Source;
