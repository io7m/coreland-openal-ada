with OpenAL.Types;

package OpenAL.Listener is

  --
  -- API
  --

  --
  -- Position
  --

  -- proc_map : alListener3f
  procedure Set_Position_f
    (X : in Types.Float_t;
     Y : in Types.Float_t;
     Z : in Types.Float_t);

  -- proc_map : alListener3i
  procedure Set_Position_i
    (X : in Types.Integer_t;
     Y : in Types.Integer_t;
     Z : in Types.Integer_t);

  -- proc_map : alListenerfv
  procedure Set_Position_fv
    (Position : in Types.Vector_3f_t);

  -- proc_map : alListeneriv
  procedure Set_Position_iv
    (Position : in Types.Vector_3i_t);

  -- proc_map : alGetListener3f
  procedure Get_Position_f
    (X : out Types.Float_t;
     Y : out Types.Float_t;
     Z : out Types.Float_t);

  -- proc_map : alGetListener3i
  procedure Get_Position_i
    (X : out Types.Integer_t;
     Y : out Types.Integer_t;
     Z : out Types.Integer_t);

  -- proc_map : alGetListenerfv
  procedure Get_Position_fv
    (Position : out Types.Vector_3f_t);

  -- proc_map : alGetListeneriv
  procedure Get_Position_iv
    (Position : out Types.Vector_3i_t);

  --
  -- Velocity
  --

  -- proc_map : alListener3f
  procedure Set_Velocity_f
    (X : in Types.Float_t;
     Y : in Types.Float_t;
     Z : in Types.Float_t);

  -- proc_map : alListener3i
  procedure Set_Velocity_i
    (X : in Types.Integer_t;
     Y : in Types.Integer_t;
     Z : in Types.Integer_t);

  -- proc_map : alListenerfv
  procedure Set_Velocity_fv (Velocity : in Types.Vector_3f_t);

  -- proc_map : alListeneriv
  procedure Set_Velocity_iv (Velocity : in Types.Vector_3i_t);

  -- proc_map : alGetListener3f
  procedure Get_Velocity_f
    (X : out Types.Float_t;
     Y : out Types.Float_t;
     Z : out Types.Float_t);

  -- proc_map : alGetListener3i
  procedure Get_Velocity_i
    (X : out Types.Integer_t;
     Y : out Types.Integer_t;
     Z : out Types.Integer_t);

  -- proc_map : alGetListenerfv
  procedure Get_Velocity_fv (Velocity : out Types.Vector_3f_t);

  -- proc_map : alGetListeneriv
  procedure Get_Velocity_iv (Velocity : out Types.Vector_3i_t);

  --
  -- Gain
  --

  -- proc_map : alListener
  procedure Set_Gain (Gain : in Types.Float_t);

  -- proc_map : alGetListener
  procedure Get_Gain (Gain : out Types.Float_t);

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

end OpenAL.Listener;
