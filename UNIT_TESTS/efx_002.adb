with OpenAL.Context.Error;
with OpenAL.Context;
with OpenAL.Extension.EFX;
with Test;

procedure efx_002 is
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

  Effects : AL_EFX.Effect_Array_t (1 .. 2);
  Filters : AL_EFX.Filter_Array_t (1 .. 2);

begin
  Test.Initialize ("efx_002");

  Init;

  OK := True;
  if AL_EFX.Is_Present (Device) then
    EFX := AL_EFX.Load_Extension;

    AL_EFX.Generate_Effects (EFX, Effects);

    Test.Check_Test (69, "effects (1) valid", AL_EFX.Effect_Is_Valid (EFX, Effects (1)));
    Test.Check_Test (70, "effects (2) valid", AL_EFX.Effect_Is_Valid (EFX, Effects (2)));

    AL_EFX.Delete_Effects (EFX, Effects);

    Test.Check_Test (71, "effects (1) invalid", not AL_EFX.Effect_Is_Valid (EFX, Effects (1)));
    Test.Check_Test (72, "effects (2) invalid", not AL_EFX.Effect_Is_Valid (EFX, Effects (2)));

    AL_EFX.Generate_Filters (EFX, Filters);

    Test.Check_Test (73, "filters (1) valid", AL_EFX.Filter_Is_Valid (EFX, Filters (1)));
    Test.Check_Test (74, "filters (2) valid", AL_EFX.Filter_Is_Valid (EFX, Filters (2)));

    AL_EFX.Delete_Filters (EFX, Filters);

    Test.Check_Test (75, "filters (1) invalid", not AL_EFX.Filter_Is_Valid (EFX, Filters (1)));
    Test.Check_Test (76, "filters (2) invalid", not AL_EFX.Filter_Is_Valid (EFX, Filters (2)));
  end if;

  Finish;

  Test.Finish;
end efx_002;
