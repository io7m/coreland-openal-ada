with Ada.Containers;
with Ada.IO_Exceptions;
with Ada.Text_IO;
with OpenAL.Context.Error;
with OpenAL.Context;
with OpenAL.List;
with OpenAL.Types;
with Test;

procedure alc_001 is
  package ALC       renames OpenAL.Context;
  package ALC_Error renames OpenAL.Context.Error;
  package List      renames OpenAL.List;

  Device    : ALC.Device_t;
  No_Device : ALC.Device_t;
  Context   : ALC.Context_t;
  OK        : Boolean;
  Caught    : Boolean;
  Devices   : List.String_Vector_t;

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
  Test.Initialize ("alc_001");

  Init;

  Ada.Text_IO.Put_Line
    (File => Test.Output_File,
     Item => "DEFAULT_DEVICE_SPEC              : " & ALC.Get_Default_Device_Specifier);
  Ada.Text_IO.Put_Line
    (File => Test.Output_File,
     Item => "DEVICE_SPEC                      : " & ALC.Get_Device_Specifier (Device));

  begin
    Caught := False;
    Ada.Text_IO.Put_Line (Test.Output_File, ALC.Get_Device_Specifier (No_Device));
  exception
    when Ada.IO_Exceptions.Device_Error => Caught := True;
  end;
  Test.Check_Test (61, "caught device error for device spec with null device", Caught);

  Ada.Text_IO.Put_Line
    (File => Test.Output_File,
     Item => "EXTENSIONS                       : " & ALC.Get_Extensions (Device));

  begin
    Caught := False;
    Ada.Text_IO.Put_Line (Test.Output_File, ALC.Get_Extensions (No_Device));
  exception
    when Ada.IO_Exceptions.Device_Error => Caught := True;
  end;
  Test.Check_Test (62, "caught device error for extensions with null device", Caught);

  Ada.Text_IO.Put_Line
    (File => Test.Output_File,
     Item => "DEFAULT_CAPTURE_DEVICE_SPECIFIER : " & ALC.Get_Default_Capture_Device_Specifier);

  Devices := ALC.Get_Available_Capture_Devices;

  if List.String_Vectors.Is_Empty (Devices) = False then
    Ada.Text_IO.Put_Line
      (File => Test.Output_File,
       Item => "DEVICE COUNT: " & Ada.Containers.Count_Type'Image (List.String_Vectors.Length (Devices)));

    declare
      procedure Process_Element (Device : in String) is
      begin
        Ada.Text_IO.Put_Line
          (File => Test.Output_File,
           Item => "CAPTURE_DEVICE: " & Device);
      end Process_Element;
    begin
      for Index in
        List.String_Vectors.First_Index (Devices) ..
        List.String_Vectors.Last_Index (Devices)
      loop
        List.String_Vectors.Query_Element (Devices, Index, Process_Element'Access);
      end loop;
    end;
  end if;

  Test.Check_Test (63, "handled available capture devices", True);

  Ada.Text_IO.Put_Line
    (File => Test.Output_File,
     Item => "MAJOR_VERSION                    : " & Natural'Image (ALC.Get_Major_Version (Device)));
  Ada.Text_IO.Put_Line
    (File => Test.Output_File,
     Item => "MINOR_VERSION                    : " & Natural'Image (ALC.Get_Minor_Version (Device)));
  Ada.Text_IO.Put_Line
    (File => Test.Output_File,
     Item => "FREQUENCY                        : " & OpenAL.Types.Frequency_t'Image (ALC.Get_Frequency (Device)));
  Ada.Text_IO.Put_Line
    (File => Test.Output_File,
     Item => "REFRESH_RATE                     : " & Natural'Image (ALC.Get_Refresh (Device)));
  Ada.Text_IO.Put_Line
    (File => Test.Output_File,
     Item => "MONO_SOURCES                     : " & Natural'Image (ALC.Get_Mono_Sources (Device)));
  Ada.Text_IO.Put_Line
    (File => Test.Output_File,
     Item => "STEREO_SOURCES                   : " & Natural'Image (ALC.Get_Stereo_Sources (Device)));

  Finish;

  Test.Finish;
end alc_001;
