with OpenAL.Types;

package OpenAL.Listener is

  --
  -- API
  --

  --
  -- Position
  --

  -- proc_map : alListener3f
  procedure Set_Position_3f
    (X : in Types.Float_t;
     Y : in Types.Float_t;
     Z : in Types.Float_t);

  -- proc_map : alListener3i
  procedure Set_Position_3i
    (X : in Types.Integer_t;
     Y : in Types.Integer_t;
     Z : in Types.Integer_t);

  -- proc_map : alListenerfv
  procedure Set_Position_fv
    (Position : in Types.Vector_3f_t);

  -- proc_map : alListeneriv
  procedure Set_Position_iv
    (Position : in Types.Vector_3i_t);

  --
  -- Velocity
  --

  -- proc_map : alListener3f
  procedure Set_Velocity_3f
    (X : in Types.Float_t;
     Y : in Types.Float_t;
     Z : in Types.Float_t);

  -- proc_map : alListener3i
  procedure Set_Velocity_3i
    (X : in Types.Integer_t;
     Y : in Types.Integer_t;
     Z : in Types.Integer_t);

  -- proc_map : alListenerfv
  procedure Set_Velocity_fv (Velocity : in Types.Vector_3f_t);

  -- proc_map : alListeneriv
  procedure Set_Velocity_iv (Velocity : in Types.Vector_3i_t);

  --
  -- Gain
  --

  -- proc_map : alListener
  procedure Set_Gain (Gain : in Types.Float_t);

  --
  -- Orientation
  --

  -- proc_map : alListener
  procedure Set_Orientation_f
    (Forward : in Types.Vector_3f_t;
     Up      : in Types.Vector_3f_t);

  -- proc_map : alListener
  procedure Set_Orientation_i
    (Forward : in Types.Vector_3i_t;
     Up      : in Types.Vector_3i_t);

  -- proc_map : alGetListener
  procedure Get_Orientation_f
    (Forward : out Types.Vector_3f_t;
     Up      : out Types.Vector_3f_t);

  -- proc_map : alGetListener
  procedure Get_Orientation_i
    (Forward : out Types.Vector_3i_t;
     Up      : out Types.Vector_3i_t);

--  -- proc_map : alGetListener3f
--  procedure Get_Attribute_3f
--    (Attribute : in     Listener_Attribute_t;
--     Value_1   :    out Types.Float_t;
--     Value_2   :    out Types.Float_t;
--     Value_3   :    out Types.Float_t);
--
--  -- proc_map : alGetListener3i
--  procedure Get_Attribute_3i
--    (Attribute : in     Listener_Attribute_t;
--     Value_1   :    out Types.Integer_t;
--     Value_2   :    out Types.Integer_t;
--     Value_3   :    out Types.Integer_t);
--
--  -- proc_map : alGetListenerf
--  procedure Get_Attribute_f
--    (Attribute : in     Listener_Attribute_t;
--     Value     :    out Types.Float_t);
--
--  -- proc_map : alGetListeneri
--  procedure Get_Attribute_i
--    (Attribute : in     Listener_Attribute_t;
--     Value     :    out Types.Integer_t);
--
--  -- proc_map : alGetListenerfv
--  procedure Get_Attribute_fv
--    (Attribute : in     Listener_Attribute_t;
--     Values    :    out Types.Vector_3f_t);
--
--  -- proc_map : alGetListeneriv
--  procedure Get_Attribute_iv
--    (Attribute : in     Listener_Attribute_t;
--     Values    :    out Types.Vector_3i_t);

end OpenAL.Listener;
