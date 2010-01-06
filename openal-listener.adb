with OpenAL.Thin;

package body OpenAL.Listener is

  --
  -- Position
  --

  procedure Set_Position_3f
    (X : in Types.Float_t;
     Y : in Types.Float_t;
     Z : in Types.Float_t) is
  begin
    Set_Position_fv ((X, Y, Z));
  end Set_Position_3f;

  procedure Set_Position_3i
    (X : in Types.Integer_t;
     Y : in Types.Integer_t;
     Z : in Types.Integer_t) is
  begin
    Set_Position_iv ((X, Y, Z));
  end Set_Position_3i;

  procedure Set_Position_fv (Position : in Types.Vector_3f_t) is
  begin
    Thin.Listenerfv
      (Parameter => Thin.AL_POSITION,
       Values    => Position (Position'First)'Address);
  end Set_Position_fv;

  procedure Set_Position_iv (Position : in Types.Vector_3i_t) is
  begin
    Thin.Listeneriv
      (Parameter => Thin.AL_POSITION,
       Values    => Position (Position'First)'Address);
  end Set_Position_iv;

  procedure Get_Position_3f
    (X : out Types.Float_t;
     Y : out Types.Float_t;
     Z : out Types.Float_t)
  is
    V : aliased Types.Vector_3f_t;
  begin
    Get_Position_fv (V);

    X := V (1);
    Y := V (2);
    Z := V (3);
  end Get_Position_3f;

  procedure Get_Position_3i
    (X : out Types.Integer_t;
     Y : out Types.Integer_t;
     Z : out Types.Integer_t)
  is
    V : aliased Types.Vector_3i_t;
  begin
    Get_Position_iv (V);

    X := V (1);
    Y := V (2);
    Z := V (3);
  end Get_Position_3i;

  procedure Get_Position_fv (Position : out Types.Vector_3f_t) is
  begin
    Thin.Get_Listenerfv
      (Parameter => Thin.AL_POSITION,
       Values    => Position (Position'First)'Address);
  end Get_Position_fv;

  procedure Get_Position_iv (Position : out Types.Vector_3i_t) is
  begin
    Thin.Get_Listeneriv
      (Parameter => Thin.AL_POSITION,
       Values    => Position (Position'First)'Address);
  end Get_Position_iv;

  --
  -- Velocity
  --

  procedure Set_Velocity_3f
    (X : in Types.Float_t;
     Y : in Types.Float_t;
     Z : in Types.Float_t) is
  begin
    Set_Velocity_fv ((X, Y, Z));
  end Set_Velocity_3f;

  procedure Set_Velocity_3i
    (X : in Types.Integer_t;
     Y : in Types.Integer_t;
     Z : in Types.Integer_t) is
  begin
    Set_Velocity_iv ((X, Y, Z));
  end Set_Velocity_3i;

  procedure Set_Velocity_fv (Velocity : in Types.Vector_3f_t) is
  begin
    Thin.Listenerfv
      (Parameter => Thin.AL_POSITION,
       Values    => Velocity (Velocity'First)'Address);
  end Set_Velocity_fv;

  procedure Set_Velocity_iv (Velocity : in Types.Vector_3i_t) is
  begin
    Thin.Listeneriv
      (Parameter => Thin.AL_POSITION,
       Values    => Velocity (Velocity'First)'Address);
  end Set_Velocity_iv;

  procedure Get_Velocity_3f
    (X : out Types.Float_t;
     Y : out Types.Float_t;
     Z : out Types.Float_t)
  is
    V : aliased Types.Vector_3f_t;
  begin
    Get_Velocity_fv (V);

    X := V (1);
    Y := V (2);
    Z := V (3);
  end Get_Velocity_3f;

  procedure Get_Velocity_3i
    (X : out Types.Integer_t;
     Y : out Types.Integer_t;
     Z : out Types.Integer_t)
  is
    V : aliased Types.Vector_3i_t;
  begin
    Get_Velocity_iv (V);

    X := V (1);
    Y := V (2);
    Z := V (3);
  end Get_Velocity_3i;

  procedure Get_Velocity_fv (Velocity : out Types.Vector_3f_t) is
  begin
    Thin.Get_Listenerfv
      (Parameter => Thin.AL_POSITION,
       Values    => Velocity (Velocity'First)'Address);
  end Get_Velocity_fv;

  procedure Get_Velocity_iv (Velocity : out Types.Vector_3i_t) is
  begin
    Thin.Get_Listeneriv
      (Parameter => Thin.AL_POSITION,
       Values    => Velocity (Velocity'First)'Address);
  end Get_Velocity_iv;

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

  procedure Set_Orientation_f
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
  end Set_Orientation_f;

  procedure Set_Orientation_i
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
  end Set_Orientation_i;

  procedure Get_Orientation_f
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
  end Get_Orientation_f;

  procedure Get_Orientation_i
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
  end Get_Orientation_i;

end OpenAL.Listener;
