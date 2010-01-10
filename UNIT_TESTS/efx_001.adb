with OpenAL.Context.Error;
with OpenAL.Context;
with OpenAL.Extension.EFX;
with Test;

procedure efx_001 is
  package ALC       renames OpenAL.Context;
  package ALC_Error renames OpenAL.Context.Error;
  package AL_EFX    renames OpenAL.Extension.EFX;

  Device  : ALC.Device_t;
  Context : ALC.Context_t;
  OK      : Boolean;
  EFX     : AL_EFX.Extension_t;

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
  Test.Initialize ("efx_001");

  Init;

  OK := True;
  if AL_EFX.Is_Present (Device) then
    begin
      EFX := AL_EFX.Load_Extension;
      pragma Assert (EFX'Size > 0);
    exception
      when others => OK := False;
    end;
    Test.Check_Test (68, "EFX loaded", OK);
  else
    Test.Check_Test (68, "EFX not supported", OK);
  end if;

  Finish;

  Test.Finish;
end efx_001;
