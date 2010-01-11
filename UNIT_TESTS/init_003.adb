with Test;
with OpenAL.Context;
with OpenAL.Context.Error;

procedure init_003 is
  package ALC       renames OpenAL.Context;
  package ALC_Error renames OpenAL.Context.Error;

  Device  : ALC.Device_t;
  Context : ALC.Context_t;
  OK      : Boolean;

  use type ALC.Device_t;
  use type ALC.Context_t;
  use type ALC_Error.Error_t;
begin
  Test.Initialize ("init_003");

  Device := ALC.Open_Default_Device;
  Test.Check_Test (22, "device opened", Device /= ALC.Invalid_Device);
  Test.Check_Test (23, "no device error", ALC_Error.Get_Error (Device) = ALC_Error.No_Error);

  Context := ALC.Create_Context (Device);
  Test.Check_Test (24, "context created", Context /= ALC.Invalid_Context);
  Test.Check_Test (25, "no context error", ALC_Error.Get_Error (Device) = ALC_Error.No_Error);

  OK := ALC.Get_Current_Context = ALC.Null_Context;
  Test.Check_Test (26, "current context is correct", OK);
  Test.Check_Test (27, "no context error", ALC_Error.Get_Error (Device) = ALC_Error.No_Error);

  OK := ALC.Make_Context_Current (Context);
  Test.Check_Test (28, "context made current", OK);
  Test.Check_Test (29, "no context error", ALC_Error.Get_Error (Device) = ALC_Error.No_Error);

  OK := ALC.Get_Current_Context = Context;
  Test.Check_Test (30, "current context is correct", OK);
  Test.Check_Test (31, "no context error", ALC_Error.Get_Error (Device) = ALC_Error.No_Error);

  OK := ALC.Get_Context_Device (Context) = Device;
  Test.Check_Test (32, "context device is correct", OK);
  Test.Check_Test (33, "no context error", ALC_Error.Get_Error (Device) = ALC_Error.No_Error);

  ALC.Destroy_Context (Context);
  Test.Check_Test (34, "no context error", ALC_Error.Get_Error (Device) = ALC_Error.No_Error);

  OK := ALC.Close_Device (Device);
  Test.Check_Test (35, "device closed", OK);
  -- Test 36 removed.

  Test.Finish;
end init_003;
