with Test;
with OpenAL.Context;
with OpenAL.Context.Error;

procedure init_002 is
  package ALC       renames OpenAL.Context;
  package ALC_Error renames OpenAL.Context.Error;

  Device  : ALC.Device_t;
  Context : ALC.Context_t;
  OK      : Boolean;

  use type ALC.Device_t;
  use type ALC.Context_t;
  use type ALC_Error.Error_t;
begin
  Test.Initialize ("init_002");

  Device := ALC.Open_Default_Device;
  Test.Check_Test (12, "device opened", Device /= ALC.Invalid_Device);
  Test.Check_Test (13, "no device error", ALC_Error.Get_Error (Device) = ALC_Error.No_Error);

  Context := ALC.Create_Context (Device);
  Test.Check_Test (14, "context created", Context /= ALC.Invalid_Context);
  Test.Check_Test (15, "no context error", ALC_Error.Get_Error (Device) = ALC_Error.No_Error);

  OK := ALC.Make_Context_Current (Context);
  Test.Check_Test (16, "context made current", OK);
  Test.Check_Test (17, "no context error", ALC_Error.Get_Error (Device) = ALC_Error.No_Error);

  OK := ALC.Make_Context_Current (ALC.Null_Context);
  Test.Check_Test (18, "no context made current", OK);
  Test.Check_Test (19, "no context error", ALC_Error.Get_Error (Device) = ALC_Error.No_Error);

  --
  -- According to the 1.1 spec, this should return False.
  -- Unfortunately, no implementation actually does that...
  --

  ALC.Close_Device (Device);
  Test.Check_Test (20, "device closed", Device = ALC.Invalid_Device);
  -- Test 21 removed.

  Test.Finish;
end init_002;
