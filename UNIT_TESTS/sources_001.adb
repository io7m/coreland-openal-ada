with OpenAL.Buffer;
with OpenAL.Context.Error;
with OpenAL.Context;
with Test;

procedure sources_001 is
  package AL_Buffer renames OpenAL.Buffer;
  package ALC       renames OpenAL.Context;
  package ALC_Error renames OpenAL.Context.Error;

  Device  : ALC.Device_t;
  Context : ALC.Context_t;
  OK      : Boolean;
  Buffers : AL_Buffer.Buffer_Array_t (1 .. 5);
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
     Program      => "sources_001",
     Test_DB      => "TEST_DB",
     Test_Results => "TEST_RESULTS");

  Init;

  AL_Buffer.Generate_Buffers (Buffers);
  Test.Check (TC, 27, ALC_Error.Get_Error (Device) = ALC_Error.No_Error,
    "ALC_Error.Get_Error (Device) = ALC_Error.No_Error");

  Test.Check (TC, 28, AL_Buffer.Is_Valid (Buffers (1)), "AL_Buffer.Is_Valid (Buffers (1))");
  Test.Check (TC, 29, AL_Buffer.Is_Valid (Buffers (2)), "AL_Buffer.Is_Valid (Buffers (2))");
  Test.Check (TC, 30, AL_Buffer.Is_Valid (Buffers (3)), "AL_Buffer.Is_Valid (Buffers (3))");
  Test.Check (TC, 31, AL_Buffer.Is_Valid (Buffers (4)), "AL_Buffer.Is_Valid (Buffers (4))");
  Test.Check (TC, 32, AL_Buffer.Is_Valid (Buffers (5)), "AL_Buffer.Is_Valid (Buffers (5))");

  AL_Buffer.Delete_Buffers (Buffers);
  Test.Check (TC, 33, ALC_Error.Get_Error (Device) = ALC_Error.No_Error,
    "ALC_Error.Get_Error (Device) = ALC_Error.No_Error");

  Test.Check (TC, 34, AL_Buffer.Is_Valid (Buffers (1)) = False, "AL_Buffer.Is_Valid (Buffers (1)) = False");
  Test.Check (TC, 35, AL_Buffer.Is_Valid (Buffers (2)) = False, "AL_Buffer.Is_Valid (Buffers (2)) = False");
  Test.Check (TC, 36, AL_Buffer.Is_Valid (Buffers (3)) = False, "AL_Buffer.Is_Valid (Buffers (3)) = False");
  Test.Check (TC, 37, AL_Buffer.Is_Valid (Buffers (4)) = False, "AL_Buffer.Is_Valid (Buffers (4)) = False");
  Test.Check (TC, 38, AL_Buffer.Is_Valid (Buffers (5)) = False, "AL_Buffer.Is_Valid (Buffers (5)) = False");

  Finish;
end sources_001;
