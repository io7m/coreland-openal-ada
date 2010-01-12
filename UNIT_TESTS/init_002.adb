with Test;
with OpenAL.Context;
with OpenAL.Context.Error;

procedure init_002 is
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
     Program      => "init_002",
     Test_DB      => "TEST_DB",
     Test_Results => "TEST_RESULTS");

  Device := ALC.Open_Default_Device;
  pragma Assert (Device /= ALC.Invalid_Device);
  pragma Assert (ALC_Error.Get_Error (Device) = ALC_Error.No_Error);

  Context := ALC.Create_Context (Device);
  pragma Assert (Context /= ALC.Invalid_Context);
  pragma Assert (ALC_Error.Get_Error (Device) = ALC_Error.No_Error);

  OK := ALC.Make_Context_Current (Context);
  pragma Assert (OK);
  pragma Assert (ALC_Error.Get_Error (Device) = ALC_Error.No_Error);

  OK := ALC.Make_Context_Current (ALC.Null_Context);
  pragma Assert (OK);
  pragma Assert (ALC_Error.Get_Error (Device) = ALC_Error.No_Error);

  --
  -- According to the 1.1 spec, this should return False.
  -- Unfortunately, no implementation actually does that...
  --

  ALC.Close_Device (Device);
  Test.Check (TC, 11, Device = ALC.Invalid_Device, "Device = ALC.Invalid_Device");
end init_002;
