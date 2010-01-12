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

  Effects : AL_EFX.Effect_Array_t (1 .. 2);
  Filters : AL_EFX.Filter_Array_t (1 .. 2);

begin
  Test.Initialize
    (Test_Context => TC,
     Program      => "efx_002",
     Test_DB      => "TEST_DB",
     Test_Results => "TEST_RESULTS");

  Init;

  OK := True;
  if AL_EFX.Is_Present (Device) then
    EFX := AL_EFX.Load_Extension;

    AL_EFX.Generate_Effects (EFX, Effects);

    Test.Check (TC, 56, AL_EFX.Effect_Is_Valid (EFX, Effects (1)),
      "AL_EFX.Effect_Is_Valid (EFX, Effects (1))");
    Test.Check (TC, 57, AL_EFX.Effect_Is_Valid (EFX, Effects (2)),
      "AL_EFX.Effect_Is_Valid (EFX, Effects (2))");

    AL_EFX.Delete_Effects (EFX, Effects);

    Test.Check (TC, 58, not AL_EFX.Effect_Is_Valid (EFX, Effects (1)),
      "not AL_EFX.Effect_Is_Valid (EFX, Effects (1))");
    Test.Check (TC, 59, not AL_EFX.Effect_Is_Valid (EFX, Effects (2)),
      "not AL_EFX.Effect_Is_Valid (EFX, Effects (2))");

    AL_EFX.Generate_Filters (EFX, Filters);

    Test.Check (TC, 60, AL_EFX.Filter_Is_Valid (EFX, Filters (1)),
      "AL_EFX.Filter_Is_Valid (EFX, Filters (1))");
    Test.Check (TC, 61, AL_EFX.Filter_Is_Valid (EFX, Filters (2)),
      "AL_EFX.Filter_Is_Valid (EFX, Filters (2))");

    AL_EFX.Delete_Filters (EFX, Filters);

    Test.Check (TC, 62, not AL_EFX.Filter_Is_Valid (EFX, Filters (1)),
      "not AL_EFX.Filter_Is_Valid (EFX, Filters (1))");
    Test.Check (TC, 63, not AL_EFX.Filter_Is_Valid (EFX, Filters (2)),
      "not AL_EFX.Filter_Is_Valid (EFX, Filters (2))");
  else
    Test.Satisfy (TC, 56, Test.Unsupported);
    Test.Satisfy (TC, 57, Test.Unsupported);
    Test.Satisfy (TC, 58, Test.Unsupported);
    Test.Satisfy (TC, 59, Test.Unsupported);
    Test.Satisfy (TC, 60, Test.Unsupported);
    Test.Satisfy (TC, 61, Test.Unsupported);
    Test.Satisfy (TC, 62, Test.Unsupported);
    Test.Satisfy (TC, 63, Test.Unsupported);
  end if;

  Finish;
end efx_002;
