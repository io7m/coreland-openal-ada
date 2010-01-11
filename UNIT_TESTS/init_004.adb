with Test;
with OpenAL.Context;
with OpenAL.Context.Error;
with OpenAL.Types;

procedure init_004 is
  package ALC       renames OpenAL.Context;
  package ALC_Error renames OpenAL.Context.Error;

  Device     : ALC.Device_t;
  Context    : ALC.Context_t;
  Attributes : ALC.Context_Attributes_t;
  OK         : Boolean;

  use type ALC.Device_t;
  use type ALC.Context_t;
  use type ALC_Error.Error_t;
  use type OpenAL.Types.Frequency_t;

begin
  Test.Initialize ("init_004");

  Device := ALC.Open_Default_Device;
  Test.Check_Test (77, "device opened", Device /= ALC.Invalid_Device);
  Test.Check_Test (78, "no device error", ALC_Error.Get_Error (Device) = ALC_Error.No_Error);

  ALC.Set_Frequency (Attributes, 44100);
  ALC.Set_Mono_Sources (Attributes, 100);
  ALC.Set_Stereo_Sources (Attributes, 5);

  Context := ALC.Create_Context_With_Attributes (Device, Attributes);
  Test.Check_Test (79, "context created", Context /= ALC.Invalid_Context);
  Test.Check_Test (80, "no context error", ALC_Error.Get_Error (Device) = ALC_Error.No_Error);

  OK := ALC.Make_Context_Current (Context);
  pragma Assert (OK);

  ALC.Destroy_Context (Context);
  ALC.Close_Device (Device);

  pragma Assert (Device = ALC.Invalid_Device);

  Test.Finish;
end init_004;
