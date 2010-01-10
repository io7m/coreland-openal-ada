with Ada.Text_IO;
with OpenAL.Context.Error;
with OpenAL.Context;
with OpenAL.Global;
with Test;

procedure global_001 is
  package ALC       renames OpenAL.Context;
  package ALC_Error renames OpenAL.Context.Error;

  Device  : ALC.Device_t;
  Context : ALC.Context_t;
  OK      : Boolean;

  use type ALC.Device_t;
  use type ALC.Context_t;
  use type ALC_Error.Error_t;

  procedure Finish is
  begin
    ALC.Destroy_Context (Context);
    OK := ALC.Close_Device (Device);
    pragma Assert (OK);
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
  Test.Initialize ("global_001");

  Init;

  Ada.Text_IO.Put_Line (Test.Output_File, "VERSION    : " & OpenAL.Global.Version);
  Ada.Text_IO.Put_Line (Test.Output_File, "RENDERER   : " & OpenAL.Global.Renderer);
  Ada.Text_IO.Put_Line (Test.Output_File, "VENDOR     : " & OpenAL.Global.Vendor);
  Ada.Text_IO.Put_Line (Test.Output_File, "EXTENSIONS : " & OpenAL.Global.Extensions);

  Finish;

  Test.Finish;
end global_001;
