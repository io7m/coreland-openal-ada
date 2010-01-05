with OpenAL.Types;

package OpenAL.Listener is

  --
  -- Types
  --

  type Listener_Attribute_t is (Position, Velocity, Gain);

  --
  -- API
  --

  -- proc_map : alListener3f
  procedure Set_Attribute_3f
    (Attribute : in Listener_Attribute_t;
     Value_1   : in Types.Float_t;
     Value_2   : in Types.Float_t;
     Value_3   : in Types.Float_t);

  -- proc_map : alListener3i
  procedure Set_Attribute_3i
    (Attribute : in Listener_Attribute_t;
     Value_1   : in Types.Integer_t;
     Value_2   : in Types.Integer_t;
     Value_3   : in Types.Integer_t);

  -- proc_map : alListenerf
  procedure Set_Attribute_f
    (Attribute : in Listener_Attribute_t;
     Value     : in Types.Float_t);

  -- proc_map : alListeneri
  procedure Set_Attribute_i
    (Attribute : in Listener_Attribute_t;
     Value     : in Types.Integer_t);

  -- proc_map : alListenerfv
  procedure Set_Attribute_fv
    (Attribute : in Listener_Attribute_t;
     Values    : in Types.Vector_3f_t);

  -- proc_map : alListeneriv
  procedure Set_Attribute_iv
    (Attribute : in Listener_Attribute_t;
     Values    : in Types.Vector_3i_t);

  procedure Set_Orientation_f
    (Forward : in Types.Vector_3f_t;
     Up      : in Types.Vector_3f_t);

  procedure Set_Orientation_i
    (Forward : in Types.Vector_3i_t;
     Up      : in Types.Vector_3i_t);

  -- proc_map : alGetListener3f
  procedure Get_Attribute_3f
    (Attribute : in     Listener_Attribute_t;
     Value_1   :    out Types.Float_t;
     Value_2   :    out Types.Float_t;
     Value_3   :    out Types.Float_t);

  -- proc_map : alGetListener3i
  procedure Get_Attribute_3i
    (Attribute : in     Listener_Attribute_t;
     Value_1   :    out Types.Integer_t;
     Value_2   :    out Types.Integer_t;
     Value_3   :    out Types.Integer_t);

  -- proc_map : alGetListenerf
  procedure Get_Attribute_f
    (Attribute : in     Listener_Attribute_t;
     Value     :    out Types.Float_t);

  -- proc_map : alGetListeneri
  procedure Get_Attribute_i
    (Attribute : in     Listener_Attribute_t;
     Value     :    out Types.Integer_t);

  -- proc_map : alGetListenerfv
  procedure Get_Attribute_fv
    (Attribute : in     Listener_Attribute_t;
     Values    :    out Types.Vector_3f_t);

  -- proc_map : alGetListeneriv
  procedure Get_Attribute_iv
    (Attribute : in     Listener_Attribute_t;
     Values    :    out Types.Vector_3i_t);

  procedure Get_Orientation_f
    (Forward : out Types.Vector_3f_t;
     Up      : out Types.Vector_3f_t);

  procedure Get_Orientation_i
    (Forward : out Types.Vector_3i_t;
     Up      : out Types.Vector_3i_t);

end OpenAL.Listener;
