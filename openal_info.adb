with Ada.Text_IO;
with Ada.Command_Line;
with OpenAL.Context;
with OpenAL.Global;
with OpenAL.List;

package body OpenAL_Info is
  package AL_Context        renames OpenAL.Context;
  package AL_Global         renames OpenAL.Global;
  package AL_String_Vectors renames OpenAL.List.String_Vectors;
  package Command_Line      renames Ada.Command_Line;
  package Natural_IO        is new  Ada.Text_IO.Integer_IO (Natural);
  package Text_IO           renames Ada.Text_IO;

  Device  : AL_Context.Device_t;
  Context : AL_Context.Context_t;
  Error   : exception;

  use type AL_Context.Device_t;
  use type AL_Context.Context_t;

  --
  -- Init.
  --

  procedure Init is
  begin
    Natural_IO.Default_Width := 0;
  end Init;

  --
  -- Playback devices.
  --

  procedure List_Playback_Devices is
    Devices : AL_String_Vectors.Vector;

    procedure Process_Element (Device : in String) is
    begin
      Text_IO.Put_Line ("  " & Device);
    end Process_Element;
  begin
    Text_IO.Put_Line ("Playback devices :");

    Devices := AL_Context.Get_Available_Playback_Devices;

    for Index in AL_String_Vectors.First_Index (Devices) .. AL_String_Vectors.Last_Index (Devices) loop
      AL_String_Vectors.Query_Element (Devices, Index, Process_Element'Access);
    end loop;
  end List_Playback_Devices;

  --
  -- Capture devices.
  --

  procedure List_Capture_Devices is
    Devices : AL_String_Vectors.Vector;

    procedure Process_Element (Device : in String) is
    begin
      Text_IO.Put_Line ("  " & Device);
    end Process_Element;
  begin
    Text_IO.Put_Line ("Capture devices  :");

    Devices := AL_Context.Get_Available_Capture_Devices;

    for Index in AL_String_Vectors.First_Index (Devices) .. AL_String_Vectors.Last_Index (Devices) loop
      AL_String_Vectors.Query_Element (Devices, Index, Process_Element'Access);
    end loop;
  end List_Capture_Devices;

  --
  -- Defaults.
  --

  procedure Defaults is
  begin
    Text_IO.Put ("Default playback  : ");
    Text_IO.Put (AL_Context.Get_Default_Device_Specifier);
    Text_IO.New_Line;

    Text_IO.Put ("Default capture   : ");
    Text_IO.Put (AL_Context.Get_Default_Capture_Device_Specifier);
    Text_IO.New_Line;
  end Defaults;

  --
  -- Open_Device.
  --

  procedure Open_Device is
  begin
    Command_Line.Set_Exit_Status (Command_Line.Failure);

    Device := AL_Context.Open_Default_Device;
    if Device /= AL_Context.Invalid_Device then
      Context := AL_Context.Create_Context (Device);
      if Context /= AL_Context.Invalid_Context then
        if AL_Context.Make_Context_Current (Context) = False then
          raise Error with "error making context current";
        else
          Command_Line.Set_Exit_Status (Command_Line.Success);
        end if;
      else
        raise Error with "error creating context";
      end if;
    else
      raise Error with "error opening device";
    end if;
  end Open_Device;

  --
  -- Versions.
  --

  procedure Versions is
  begin
    Text_IO.Put ("ALC major version : ");
    Natural_IO.Put (AL_Context.Get_Major_Version (Device));
    Text_IO.New_Line;

    Text_IO.Put ("ALC minor version : ");
    Natural_IO.Put (AL_Context.Get_Minor_Version (Device));
    Text_IO.New_Line;

    Text_IO.Put ("ALC extensions    : ");
    Text_IO.Put (AL_Context.Get_Extensions (Device));
    Text_IO.New_Line;

    Text_IO.Put ("AL vendor         : ");
    Text_IO.Put (AL_Global.Vendor);
    Text_IO.New_Line;

    Text_IO.Put ("AL renderer       : ");
    Text_IO.Put (AL_Global.Renderer);
    Text_IO.New_Line;

    Text_IO.Put ("AL version        : ");
    Text_IO.Put (AL_Global.Version);
    Text_IO.New_Line;

    Text_IO.Put ("AL extensions     : ");
    Text_IO.Put (AL_Global.Extensions);
    Text_IO.New_Line;
  end Versions;

  --
  -- Finish.
  --

  procedure Finish is
  begin
    AL_Context.Destroy_Context (Context);
    if AL_Context.Close_Device (Device) = False then
      raise Error with "error closing device";
    end if;
  end Finish;

  --
  -- Entry point.
  --

  procedure Run is
  begin
    Init;
    List_Playback_Devices;
    List_Capture_Devices;
    Defaults;
    Open_Device;
    Versions;
    Finish;
  exception
    when Error => null;
  end Run;

end OpenAL_Info;
