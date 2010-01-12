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
  Current_OK : Boolean;
  TC         : Test.Context_t;

  use type ALC.Device_t;
  use type ALC.Context_t;
  use type ALC_Error.Error_t;
  use type OpenAL.Types.Frequency_t;

begin
  Test.Initialize
    (Test_Context => TC,
     Program      => "init_004",
     Test_DB      => "TEST_DB",
     Test_Results => "TEST_RESULTS");

  Device := ALC.Open_Default_Device;
  pragma Assert (Device /= ALC.Invalid_Device);
  pragma Assert (ALC_Error.Get_Error (Device) = ALC_Error.No_Error);

  ALC.Set_Frequency (Attributes, 44100);
  ALC.Set_Mono_Sources (Attributes, 100);
  ALC.Set_Stereo_Sources (Attributes, 5);

  Context := ALC.Create_Context_With_Attributes (Device, Attributes);
  Test.Check (TC, 18, Context /= ALC.Invalid_Context, "Context /= ALC.Invalid_Context");
  Test.Check (TC, 19, ALC_Error.Get_Error (Device) = ALC_Error.No_Error,
    "ALC_Error.Get_Error (Device) = ALC_Error.No_Error");

  Current_OK := ALC.Make_Context_Current (Context);
  pragma Assert (Current_OK);
  pragma Assert (ALC_Error.Get_Error (Device) = ALC_Error.No_Error);

  ALC.Destroy_Context (Context);
  pragma Assert (ALC_Error.Get_Error (Device) = ALC_Error.No_Error);

  ALC.Close_Device (Device);
  pragma Assert (Device = ALC.Invalid_Device);
end init_004;
