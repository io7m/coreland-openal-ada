with OpenAL.Buffer;
with OpenAL.Context.Error;
with OpenAL.Context;
with Test;

procedure buffers_001 is
  package AL_Buffer renames OpenAL.Buffer;
  package ALC       renames OpenAL.Context;
  package ALC_Error renames OpenAL.Context.Error;

  Device  : ALC.Device_t;
  Context : ALC.Context_t;
  OK      : Boolean;
  Buffers : AL_Buffer.Buffer_Array_t (1 .. 5);

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
  Test.Initialize ("buffers_001");

  Init;

  AL_Buffer.Generate_Buffers (Buffers);
  Test.Check_Test (37, "buffers generated", ALC_Error.Get_Error (Device) = ALC_Error.No_Error);

  Test.Check_Test (38, "buffer (1) valid", AL_Buffer.Is_Valid (Buffers (1)));
  Test.Check_Test (39, "buffer (2) valid", AL_Buffer.Is_Valid (Buffers (2)));
  Test.Check_Test (40, "buffer (3) valid", AL_Buffer.Is_Valid (Buffers (3)));
  Test.Check_Test (41, "buffer (4) valid", AL_Buffer.Is_Valid (Buffers (4)));
  Test.Check_Test (42, "buffer (5) valid", AL_Buffer.Is_Valid (Buffers (5)));

  AL_Buffer.Delete_Buffers (Buffers);
  Test.Check_Test (43, "buffers deleted", ALC_Error.Get_Error (Device) = ALC_Error.No_Error);

  Test.Check_Test (44, "buffer (1) invalid", AL_Buffer.Is_Valid (Buffers (1)) = False);
  Test.Check_Test (45, "buffer (2) invalid", AL_Buffer.Is_Valid (Buffers (2)) = False);
  Test.Check_Test (46, "buffer (3) invalid", AL_Buffer.Is_Valid (Buffers (3)) = False);
  Test.Check_Test (47, "buffer (4) invalid", AL_Buffer.Is_Valid (Buffers (4)) = False);
  Test.Check_Test (48, "buffer (5) invalid", AL_Buffer.Is_Valid (Buffers (5)) = False);

  Finish;

  Test.Finish;
end buffers_001;
