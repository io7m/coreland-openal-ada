with Test;
with OpenAL.Context;
with OpenAL.Context.Error;

procedure init_003 is
  package ALC       renames OpenAL.Context;
  package ALC_Error renames OpenAL.Context.Error;

  Device  : ALC.Device_t;
  Context : ALC.Context_t;
  Current_OK      : Boolean;
  TC      : Test.Context_t;

  use type ALC.Device_t;
  use type ALC.Context_t;
  use type ALC_Error.Error_t;
begin
  Test.Initialize
    (Test_Context => TC,
     Program      => "init_003",
     Test_DB      => "TEST_DB",
     Test_Results => "TEST_RESULTS");

  Device := ALC.Open_Default_Device;
  pragma Assert (Device /= ALC.Invalid_Device);
  pragma Assert (ALC_Error.Get_Error (Device) = ALC_Error.No_Error);

  Context := ALC.Create_Context (Device);
  pragma Assert (Context /= ALC.Invalid_Context);
  pragma Assert (ALC_Error.Get_Error (Device) = ALC_Error.No_Error);

  Current_OK := ALC.Get_Current_Context = ALC.Null_Context;
  Test.Check (TC, 12, Current_OK, "Current_OK");
  Test.Check (TC, 13, ALC_Error.Get_Error (Device) = ALC_Error.No_Error,
    "ALC_Error.Get_Error (Device) = ALC_Error.No_Error");

  Current_OK := ALC.Make_Context_Current (Context);
  pragma Assert (Current_OK);
  pragma Assert (ALC_Error.Get_Error (Device) = ALC_Error.No_Error);

  Current_OK := ALC.Get_Current_Context = Context;
  Test.Check (TC, 14, Current_OK, "Current_OK");
  Test.Check (TC, 15, ALC_Error.Get_Error (Device) = ALC_Error.No_Error,
    "ALC_Error.Get_Error (Device) = ALC_Error.No_Error");

  Current_OK := ALC.Get_Context_Device (Context) = Device;
  Test.Check (TC, 16, Current_OK, "Current_OK");
  Test.Check (TC, 17, ALC_Error.Get_Error (Device) = ALC_Error.No_Error,
    "ALC_Error.Get_Error (Device) = ALC_Error.No_Error");

  ALC.Destroy_Context (Context);
  pragma Assert (ALC_Error.Get_Error (Device) = ALC_Error.No_Error);

  ALC.Close_Device (Device);
  pragma Assert (Device = ALC.Invalid_Device);
end init_003;
