with OpenAL.Thin;

package body OpenAL.Listener is

  --
  -- Position
  --

  procedure Set_Position_Float
    (X : in Types.Float_t;
     Y : in Types.Float_t;
     Z : in Types.Float_t) is
  begin
    Set_Position_Float_List ((X, Y, Z));
  end Set_Position_Float;

  procedure Set_Position_Discrete
    (X : in Types.Integer_t;
     Y : in Types.Integer_t;
     Z : in Types.Integer_t) is
  begin
    Set_Position_Discrete_List ((X, Y, Z));
  end Set_Position_Discrete;

  procedure Set_Position_Float_List (Position : in Types.Vector_3f_t) is
  begin
    Thin.Listenerfv
      (Parameter => Thin.AL_POSITION,
       Values    => Position (Position'First)'Address);
  end Set_Position_Float_List;

  procedure Set_Position_Discrete_List (Position : in Types.Vector_3i_t) is
  begin
    Thin.Listeneriv
      (Parameter => Thin.AL_POSITION,
       Values    => Position (Position'First)'Address);
  end Set_Position_Discrete_List;

  procedure Get_Position_Float
    (X : out Types.Float_t;
     Y : out Types.Float_t;
     Z : out Types.Float_t)
  is
    V : aliased Types.Vector_3f_t;
  begin
    Get_Position_Float_List (V);

    X := V (1);
    Y := V (2);
    Z := V (3);
  end Get_Position_Float;

  procedure Get_Position_Discrete
    (X : out Types.Integer_t;
     Y : out Types.Integer_t;
     Z : out Types.Integer_t)
  is
    V : aliased Types.Vector_3i_t;
  begin
    Get_Position_Discrete_List (V);

    X := V (1);
    Y := V (2);
    Z := V (3);
  end Get_Position_Discrete;

  procedure Get_Position_Float_List (Position : out Types.Vector_3f_t) is
  begin
    Thin.Get_Listenerfv
      (Parameter => Thin.AL_POSITION,
       Values    => Position (Position'First)'Address);
  end Get_Position_Float_List;

  procedure Get_Position_Discrete_List (Position : out Types.Vector_3i_t) is
  begin
    Thin.Get_Listeneriv
      (Parameter => Thin.AL_POSITION,
       Values    => Position (Position'First)'Address);
  end Get_Position_Discrete_List;

  --
  -- Velocity
  --

  procedure Set_Velocity_Float
    (X : in Types.Float_t;
     Y : in Types.Float_t;
     Z : in Types.Float_t) is
  begin
    Set_Velocity_Float_List ((X, Y, Z));
  end Set_Velocity_Float;

  procedure Set_Velocity_Discrete
    (X : in Types.Integer_t;
     Y : in Types.Integer_t;
     Z : in Types.Integer_t) is
  begin
    Set_Velocity_Discrete_List ((X, Y, Z));
  end Set_Velocity_Discrete;

  procedure Set_Velocity_Float_List (Velocity : in Types.Vector_3f_t) is
  begin
    Thin.Listenerfv
      (Parameter => Thin.AL_POSITION,
       Values    => Velocity (Velocity'First)'Address);
  end Set_Velocity_Float_List;

  procedure Set_Velocity_Discrete_List (Velocity : in Types.Vector_3i_t) is
  begin
    Thin.Listeneriv
      (Parameter => Thin.AL_POSITION,
       Values    => Velocity (Velocity'First)'Address);
  end Set_Velocity_Discrete_List;

  procedure Get_Velocity_Float
    (X : out Types.Float_t;
     Y : out Types.Float_t;
     Z : out Types.Float_t)
  is
    V : aliased Types.Vector_3f_t;
  begin
    Get_Velocity_Float_List (V);

    X := V (1);
    Y := V (2);
    Z := V (3);
  end Get_Velocity_Float;

  procedure Get_Velocity_Discrete
    (X : out Types.Integer_t;
     Y : out Types.Integer_t;
     Z : out Types.Integer_t)
  is
    V : aliased Types.Vector_3i_t;
  begin
    Get_Velocity_Discrete_List (V);

    X := V (1);
    Y := V (2);
    Z := V (3);
  end Get_Velocity_Discrete;

  procedure Get_Velocity_Float_List (Velocity : out Types.Vector_3f_t) is
  begin
    Thin.Get_Listenerfv
      (Parameter => Thin.AL_POSITION,
       Values    => Velocity (Velocity'First)'Address);
  end Get_Velocity_Float_List;

  procedure Get_Velocity_Discrete_List (Velocity : out Types.Vector_3i_t) is
  begin
    Thin.Get_Listeneriv
      (Parameter => Thin.AL_POSITION,
       Values    => Velocity (Velocity'First)'Address);
  end Get_Velocity_Discrete_List;

  --
  -- Gain
  --

  procedure Set_Gain (Gain : in Types.Float_t) is
  begin
    Thin.Listenerf
      (Parameter => Thin.AL_GAIN,
       Value     => Thin.Float_t (Gain));
  end Set_Gain;

  procedure Get_Gain (Gain : out Types.Float_t) is
    Value : aliased Types.Float_t;
  begin
    Thin.Get_Listenerf
      (Parameter => Thin.AL_GAIN,
       Value     => Value'Address);
    Gain := Value;
  end Get_Gain;

  --
  -- Orientation
  --

  procedure Set_Orientation_Float
    (Forward : in Types.Vector_3f_t;
     Up      : in Types.Vector_3f_t)
  is
    type Orient_Vectors_t is new Types.Float_Arrays.Real_Vector (1 .. 6);

    Vectors : constant Orient_Vectors_t :=
      (1 => Forward (1),
       2 => Forward (2),
       3 => Forward (3),
       4 => Up (1),
       5 => Up (2),
       6 => Up (3));
  begin
    Thin.Listenerfv
      (Parameter => Thin.AL_ORIENTATION,
       Values    => Vectors (Vectors'First)'Address);
  end Set_Orientation_Float;

  procedure Set_Orientation_Discrete
    (Forward : in Types.Vector_3i_t;
     Up      : in Types.Vector_3i_t)
  is
    type Orient_Vectors_t is new Types.Vector_i_t (1 .. 6);

    Vectors : constant Orient_Vectors_t :=
      (1 => Forward (1),
       2 => Forward (2),
       3 => Forward (3),
       4 => Up (1),
       5 => Up (2),
       6 => Up (3));
  begin
    Thin.Listeneriv
      (Parameter => Thin.AL_ORIENTATION,
       Values    => Vectors (Vectors'First)'Address);
  end Set_Orientation_Discrete;

  procedure Get_Orientation_Float
    (Forward : out Types.Vector_3f_t;
     Up      : out Types.Vector_3f_t)
  is
    type Orient_Vectors_t is new Types.Float_Arrays.Real_Vector (1 .. 6);

    Vectors : Orient_Vectors_t;
  begin
    Thin.Get_Listenerfv
      (Parameter => Thin.AL_ORIENTATION,
       Values    => Vectors (Vectors'First)'Address);

    Forward := Types.Vector_3f_t'
      (1 => Vectors (1),
       2 => Vectors (2),
       3 => Vectors (3));

    Up := Types.Vector_3f_t'
      (1 => Vectors (4),
       2 => Vectors (5),
       3 => Vectors (6));
  end Get_Orientation_Float;

  procedure Get_Orientation_Discrete
    (Forward : out Types.Vector_3i_t;
     Up      : out Types.Vector_3i_t)
  is
    type Orient_Vectors_t is new Types.Vector_i_t (1 .. 6);

    Vectors : Orient_Vectors_t;
  begin
    Thin.Get_Listeneriv
      (Parameter => Thin.AL_ORIENTATION,
       Values    => Vectors (Vectors'First)'Address);

    Forward := Types.Vector_3i_t'
      (1 => Vectors (1),
       2 => Vectors (2),
       3 => Vectors (3));

    Up := Types.Vector_3i_t'
      (1 => Vectors (4),
       2 => Vectors (5),
       3 => Vectors (6));
  end Get_Orientation_Discrete;

end OpenAL.Listener;
