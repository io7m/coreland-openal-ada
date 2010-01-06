with OpenAL.Types;

package OpenAL.Listener is

  --
  -- API
  --

  --
  -- Position
  --

  -- proc_map : alListener3f
  procedure Set_Position_Float
    (X : in Types.Float_t;
     Y : in Types.Float_t;
     Z : in Types.Float_t);

  -- proc_map : alListener3i
  procedure Set_Position_Discrete
    (X : in Types.Integer_t;
     Y : in Types.Integer_t;
     Z : in Types.Integer_t);

  -- proc_map : alListenerfv
  procedure Set_Position_Float_List
    (Position : in Types.Vector_3f_t);

  -- proc_map : alListeneriv
  procedure Set_Position_Discrete_List
    (Position : in Types.Vector_3i_t);

  -- proc_map : alGetListener3f
  procedure Get_Position_Float
    (X : out Types.Float_t;
     Y : out Types.Float_t;
     Z : out Types.Float_t);

  -- proc_map : alGetListener3i
  procedure Get_Position_Discrete
    (X : out Types.Integer_t;
     Y : out Types.Integer_t;
     Z : out Types.Integer_t);

  -- proc_map : alGetListenerfv
  procedure Get_Position_Float_List
    (Position : out Types.Vector_3f_t);

  -- proc_map : alGetListeneriv
  procedure Get_Position_Discrete_List
    (Position : out Types.Vector_3i_t);

  --
  -- Velocity
  --

  -- proc_map : alListener3f
  procedure Set_Velocity_Float
    (X : in Types.Float_t;
     Y : in Types.Float_t;
     Z : in Types.Float_t);

  -- proc_map : alListener3i
  procedure Set_Velocity_Discrete
    (X : in Types.Integer_t;
     Y : in Types.Integer_t;
     Z : in Types.Integer_t);

  -- proc_map : alListenerfv
  procedure Set_Velocity_Float_List (Velocity : in Types.Vector_3f_t);

  -- proc_map : alListeneriv
  procedure Set_Velocity_Discrete_List (Velocity : in Types.Vector_3i_t);

  -- proc_map : alGetListener3f
  procedure Get_Velocity_Float
    (X : out Types.Float_t;
     Y : out Types.Float_t;
     Z : out Types.Float_t);

  -- proc_map : alGetListener3i
  procedure Get_Velocity_Discrete
    (X : out Types.Integer_t;
     Y : out Types.Integer_t;
     Z : out Types.Integer_t);

  -- proc_map : alGetListenerfv
  procedure Get_Velocity_Float_List (Velocity : out Types.Vector_3f_t);

  -- proc_map : alGetListeneriv
  procedure Get_Velocity_Discrete_List (Velocity : out Types.Vector_3i_t);

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
  procedure Set_Orientation_Float
    (Forward : in Types.Vector_3f_t;
     Up      : in Types.Vector_3f_t);

  -- proc_map : alListener
  procedure Set_Orientation_Discrete
    (Forward : in Types.Vector_3i_t;
     Up      : in Types.Vector_3i_t);

  -- proc_map : alGetListener
  procedure Get_Orientation_Float
    (Forward : out Types.Vector_3f_t;
     Up      : out Types.Vector_3f_t);

  -- proc_map : alGetListener
  procedure Get_Orientation_Discrete
    (Forward : out Types.Vector_3i_t;
     Up      : out Types.Vector_3i_t);

end OpenAL.Listener;
