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

  Device          : ALC.Device_t;
  No_Device       : ALC.Device_t;
  Context         : ALC.Context_t;
  OK              : Boolean;
  Caught_Error    : Boolean;
  Handled_Capture : constant Boolean := True;
  Devices         : List.String_Vector_t;
  TC              : Test.Context_t;

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
     Program      => "alc_001",
     Test_DB      => "TEST_DB",
     Test_Results => "TEST_RESULTS");

  Init;

  Ada.Text_IO.Put_Line
    ("DEFAULT_DEVICE_SPEC              : " & ALC.Get_Default_Device_Specifier);
  Ada.Text_IO.Put_Line
    ("DEVICE_SPEC                      : " & ALC.Get_Device_Specifier (Device));

  begin
    Caught_Error := False;
    Ada.Text_IO.Put_Line (ALC.Get_Device_Specifier (No_Device));
  exception
    when Ada.IO_Exceptions.Device_Error => Caught_Error := True;
  end;
  Test.Check (TC, 20, Caught_Error, "Caught_Error");

  Ada.Text_IO.Put_Line
    ("EXTENSIONS                       : " & ALC.Get_Extensions (Device));

  begin
    Caught_Error := False;
    Ada.Text_IO.Put_Line (ALC.Get_Extensions (No_Device));
  exception
    when Ada.IO_Exceptions.Device_Error => Caught_Error := True;
  end;
  Test.Check (TC, 21, Caught_Error, "Caught_Error");

  Ada.Text_IO.Put_Line
    ("DEFAULT_CAPTURE_DEVICE_SPECIFIER : " & ALC.Get_Default_Capture_Device_Specifier);

  Devices := ALC.Get_Available_Capture_Devices;

  if List.String_Vectors.Is_Empty (Devices) = False then
    Ada.Text_IO.Put_Line
      ("DEVICE COUNT: " & Ada.Containers.Count_Type'Image (List.String_Vectors.Length (Devices)));

    declare
      procedure Process_Element (Device : in String) is
      begin
        Ada.Text_IO.Put_Line ("CAPTURE_DEVICE: " & Device);
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

  Test.Check (TC, 22, Handled_Capture, "Handled_Capture");

  Ada.Text_IO.Put_Line
    ("MAJOR_VERSION                    : " & Natural'Image (ALC.Get_Major_Version (Device)));
  Ada.Text_IO.Put_Line
    ("MINOR_VERSION                    : " & Natural'Image (ALC.Get_Minor_Version (Device)));
  Ada.Text_IO.Put_Line
    ("FREQUENCY                        : " & OpenAL.Types.Frequency_t'Image (ALC.Get_Frequency (Device)));
  Ada.Text_IO.Put_Line
    ("REFRESH_RATE                     : " & Natural'Image (ALC.Get_Refresh (Device)));
  Ada.Text_IO.Put_Line
    ("MONO_SOURCES                     : " & Natural'Image (ALC.Get_Mono_Sources (Device)));
  Ada.Text_IO.Put_Line
    ("STEREO_SOURCES                   : " & Natural'Image (ALC.Get_Stereo_Sources (Device)));

  Finish;
end alc_001;
