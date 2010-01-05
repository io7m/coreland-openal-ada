with OpenAL.Thin;

package body OpenAL.Listener is

  type Attribute_Constant_Map_t is array (Listener_Attribute_t) of Thin.Enumeration_t;

  Attribute_Constant_Map : constant Attribute_Constant_Map_t :=
    (Position => Thin.AL_POSITION,
     Velocity => Thin.AL_VELOCITY,
     Gain     => Thin.AL_GAIN);

  --
  -- Set
  --

  procedure Set_Attribute_3f
    (Attribute : in Listener_Attribute_t;
     Value_1   : in Types.Float_t;
     Value_2   : in Types.Float_t;
     Value_3   : in Types.Float_t) is
  begin
    Thin.Listener_3f
      (Parameter => Attribute_Constant_Map (Attribute),
       Value_1   => Value_1,
       Value_2   => Value_2,
       Value_3   => Value_3);
  end Set_Attribute_3f;

  procedure Set_Attribute_3i
    (Attribute : in Listener_Attribute_t;
     Value_1   : in Types.Integer_t;
     Value_2   : in Types.Integer_t;
     Value_3   : in Types.Integer_t) is
  begin
    Thin.Listener_3i
      (Parameter => Attribute_Constant_Map (Attribute),
       Value_1   => Value_1,
       Value_2   => Value_2,
       Value_3   => Value_3);
  end Set_Attribute_3i;

  procedure Set_Attribute_f
    (Attribute : in Listener_Attribute_t;
     Value     : in Types.Float_t) is
  begin
    Thin.Listenerf
      (Parameter => Attribute_Constant_Map (Attribute),
       Value     => Value);
  end Set_Attribute_f;

  procedure Set_Attribute_i
    (Attribute : in Listener_Attribute_t;
     Value     : in Types.Integer_t) is
  begin
    Thin.Listeneri
      (Parameter => Attribute_Constant_Map (Attribute),
       Value     => Value);
  end Set_Attribute_i;

  procedure Set_Attribute_fv
    (Attribute : in Listener_Attribute_t;
     Values    : in Types.Vector_3f_t) is
  begin
    Thin.Listenerfv
      (Parameter => Attribute_Constant_Map (Attribute),
       Values    => Values (Values'First)'Address);
  end Set_Attribute_fv;

  procedure Set_Attribute_iv
    (Attribute : in Listener_Attribute_t;
     Values    : in Types.Vector_3i_t) is
  begin
    Thin.Listeneriv
      (Parameter => Attribute_Constant_Map (Attribute),
       Values    => Values (Values'First)'Address);
  end Set_Attribute_iv;

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

  --
  -- Get
  --

  procedure Get_Attribute_3f
    (Attribute : in     Listener_Attribute_t;
     Value_1   :    out Types.Float_t;
     Value_2   :    out Types.Float_t;
     Value_3   :    out Types.Float_t) is
  begin
    Thin.Get_Listener_3f
      (Parameter => Attribute_Constant_Map (Attribute),
       Value_1   => Value_1'Address,
       Value_2   => Value_2'Address,
       Value_3   => Value_3'Address);
  end Get_Attribute_3f;

  procedure Get_Attribute_3i
    (Attribute : in     Listener_Attribute_t;
     Value_1   :    out Types.Integer_t;
     Value_2   :    out Types.Integer_t;
     Value_3   :    out Types.Integer_t) is
  begin
    Thin.Get_Listener_3i
      (Parameter => Attribute_Constant_Map (Attribute),
       Value_1   => Value_1'Address,
       Value_2   => Value_2'Address,
       Value_3   => Value_3'Address);
  end Get_Attribute_3i;

  procedure Get_Attribute_f
    (Attribute : in     Listener_Attribute_t;
     Value     :    out Types.Float_t) is
  begin
    Thin.Get_Listenerf
      (Parameter => Attribute_Constant_Map (Attribute),
       Value     => Value'Address);
  end Get_Attribute_f;

  procedure Get_Attribute_i
    (Attribute : in     Listener_Attribute_t;
     Value     :    out Types.Integer_t) is
  begin
    Thin.Get_Listeneri
      (Parameter => Attribute_Constant_Map (Attribute),
       Value     => Value'Address);
  end Get_Attribute_i;

  procedure Get_Attribute_fv
    (Attribute : in     Listener_Attribute_t;
     Values    :    out Types.Vector_3f_t) is
  begin
    Thin.Get_Listenerfv
      (Parameter => Attribute_Constant_Map (Attribute),
       Values    => Values (Values'First)'Address);
  end Get_Attribute_fv;

  procedure Get_Attribute_iv
    (Attribute : in     Listener_Attribute_t;
     Values    :    out Types.Vector_3i_t) is
  begin
    Thin.Get_Listeneriv
      (Parameter => Attribute_Constant_Map (Attribute),
       Values    => Values (Values'First)'Address);
  end Get_Attribute_iv;

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
