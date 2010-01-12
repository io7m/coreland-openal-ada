with Ada.Text_IO;
with OpenAL.Context.Error;
with OpenAL.Error;
with OpenAL.Context;
with OpenAL.Global;
with Test;

procedure global_001 is
  package ALC       renames OpenAL.Context;
  package ALC_Error renames OpenAL.Context.Error;
  package AL_Error  renames OpenAL.Error;

  Device  : ALC.Device_t;
  Context : ALC.Context_t;
  OK      : Boolean;
  TC      : Test.Context_t;

  use type ALC.Device_t;
  use type ALC.Context_t;
  use type ALC_Error.Error_t;
  use type AL_Error.Error_t;

  procedure Finish is
  begin
    ALC.Destroy_Context (Context);
    ALC.Close_Device (Device);
  end Finish;

  procedure Init is
  begin
    Device := ALC.Open_Default_Device;
    pragma Assert (Device /= ALC.Invalid_Device);
    Context := ALC.Create_Context (Device);
    pragma Assert (Context /= ALC.Invalid_Context);
    OK := ALC.Make_Context_Current (Context);
    pragma Assert (OK);
  end Init;

begin
  Test.Initialize
    (Test_Context => TC,
     Program      => "global_001",
     Test_DB      => "TEST_DB",
     Test_Results => "TEST_RESULTS");

  Init;

  Ada.Text_IO.Put_Line ("VERSION    : " & OpenAL.Global.Version);
  Test.Check (TC, 51, AL_Error.Get_Error = AL_Error.No_Error,
    "AL_Error.Get_Error = AL_Error.No_Error");

  Ada.Text_IO.Put_Line ("RENDERER   : " & OpenAL.Global.Renderer);
  Test.Check (TC, 52, AL_Error.Get_Error = AL_Error.No_Error,
    "AL_Error.Get_Error = AL_Error.No_Error");

  Ada.Text_IO.Put_Line ("VENDOR     : " & OpenAL.Global.Vendor);
  Test.Check (TC, 53, AL_Error.Get_Error = AL_Error.No_Error,
    "AL_Error.Get_Error = AL_Error.No_Error");

  Ada.Text_IO.Put_Line ("EXTENSIONS : " & OpenAL.Global.Extensions);
  Test.Check (TC, 54, AL_Error.Get_Error = AL_Error.No_Error,
    "AL_Error.Get_Error = AL_Error.No_Error");

  Finish;
end global_001;
