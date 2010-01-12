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
  Loaded  : Boolean;
  EFX     : AL_EFX.Extension_t;
  TC      : Test.Context_t;

  use type ALC.Device_t;
  use type ALC.Context_t;
  use type ALC_Error.Error_t;

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
     Program      => "efx_001",
     Test_DB      => "TEST_DB",
     Test_Results => "TEST_RESULTS");

  Init;

  Loaded := True;
  if AL_EFX.Is_Present (Device) then
    begin
      EFX := AL_EFX.Load_Extension;
      pragma Assert (EFX'Size > 0);
    exception
      when others => Loaded := False;
    end;
    Test.Check (TC, 55, Loaded, "Loaded");
  else
    Test.Satisfy (TC, 55, Test.Unsupported);
  end if;

  Finish;
end efx_001;
