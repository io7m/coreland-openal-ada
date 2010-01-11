with Test;
with OpenAL.Context;
with OpenAL.Context.Error;

procedure init_001 is
  package ALC       renames OpenAL.Context;
  package ALC_Error renames OpenAL.Context.Error;

  Device  : ALC.Device_t;
  Context : ALC.Context_t;
  OK      : Boolean;
  TC      : Test.Context_t;

  use type ALC.Device_t;
  use type ALC.Context_t;
  use type ALC_Error.Error_t;
begin
  Test.Initialize
    (Test_Context => TC,
     Program      => "init_001",
     Test_DB      => "TEST_DB",
     Test_Results => "TEST_RESULTS");

  Device := ALC.Open_Default_Device;
  Test.Check (TC, 1, Device /= ALC.Invalid_Device);
  Test.Check (TC, 2, ALC_Error.Get_Error (Device) = ALC_Error.No_Error);

  Context := ALC.Create_Context (Device);
  Test.Check (TC, 3, Context /= ALC.Invalid_Context);
  Test.Check (TC, 4, ALC_Error.Get_Error (Device) = ALC_Error.No_Error);

  OK := ALC.Make_Context_Current (Context);
  Test.Check (TC, 5, OK);
  Test.Check (TC, 6, ALC_Error.Get_Error (Device) = ALC_Error.No_Error);

  OK := ALC.Make_Context_Current (ALC.Null_Context);
  Test.Check (TC, 7, OK);
  Test.Check (TC, 8, ALC_Error.Get_Error (Device) = ALC_Error.No_Error);

  ALC.Destroy_Context (Context);
  Test.Check (TC, 9, ALC_Error.Get_Error (Device) = ALC_Error.No_Error);

  ALC.Close_Device (Device);
  Test.Check (TC, 10, Device = ALC.Invalid_Device);
end init_001;
