with Test;
with OpenAL.Context;
with OpenAL.Context.Error;

procedure init_001 is
  package ALC       renames OpenAL.Context;
  package ALC_Error renames OpenAL.Context.Error;

  Device  : ALC.Device_t;
  Context : ALC.Context_t;
  OK      : Boolean;

  use type ALC.Device_t;
  use type ALC.Context_t;
  use type ALC_Error.Error_t;
begin
  Test.Initialize ("init_001");

  Device := ALC.Open_Default_Device;
  Test.Check_Test (1, "device opened", Device /= ALC.Invalid_Device);
  Test.Check_Test (2, "no device error", ALC_Error.Get_Error (Device) = ALC_Error.No_Error);

  Context := ALC.Create_Context (Device);
  Test.Check_Test (3, "context created", Context /= ALC.Invalid_Context);
  Test.Check_Test (4, "no context error", ALC_Error.Get_Error (Device) = ALC_Error.No_Error);

  OK := ALC.Make_Context_Current (Context);
  Test.Check_Test (5, "context made current", OK);
  Test.Check_Test (6, "no context error", ALC_Error.Get_Error (Device) = ALC_Error.No_Error);

  OK := ALC.Make_Context_Current (ALC.Null_Context);
  Test.Check_Test (7, "no context made current", OK);
  Test.Check_Test (8, "no context error", ALC_Error.Get_Error (Device) = ALC_Error.No_Error);

  ALC.Destroy_Context (Context);
  Test.Check_Test (9, "no context error", ALC_Error.Get_Error (Device) = ALC_Error.No_Error);

  OK := ALC.Close_Device (Device);
  Test.Check_Test (10, "device closed", OK);
  -- Test 11 removed.

  Test.Finish;
end init_001;
