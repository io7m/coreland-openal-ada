with Ada.Command_Line;
with Ada.IO_Exceptions;

package body Test is
  package ID_IO   is new  Ada.Text_IO.Integer_IO (Test_ID_t);
  package Text_IO renames Ada.Text_IO;

  Initialized  : Boolean := False;
  Failed       : Boolean := False;

  Success_File  : Text_IO.File_Type;
  Failure_File  : Text_IO.File_Type;
  Expected_File : Text_IO.File_Type;
  Program_Name  : access String;

  Next_Test : Test_ID_t := Test_ID_t'First;

  --
  -- Private subprograms.
  --

  procedure Write_Results
   (File    : in Text_IO.File_Type;
    Kind    : in String;
    Test_ID : in Test_ID_t;
    Message : in String);

  --
  -- Check_Test
  --

  procedure Check_Test
   (Test_ID : in Test_ID_t;
    Message : in String := "check passed";
    Check   : in Boolean) is
  begin
    pragma Assert (Initialized);

    if Next_Test /= Test_ID_t'First then
      pragma Assert (Test_ID = Next_Test);
      null;
    end if;

    Next_Test := Test_ID + 1;

    if Check = False then
      Failed := True;
      Write_Results (Text_IO.Current_Error, "FAIL", Test_ID, Message);
      Write_Results (Failure_File,          "FAIL", Test_ID, Message);
    else
      Write_Results (Text_IO.Current_Error, "PASS", Test_ID, Message);
      Write_Results (Success_File,          "PASS", Test_ID, Message);
    end if;
  end Check_Test;

  --
  -- Finish
  --

  procedure Finish is
  begin
    pragma Assert (Initialized);

    if Failed then
      Ada.Command_Line.Set_Exit_Status (Ada.Command_Line.Failure);
    end if;
  end Finish;

  --
  -- Finish_And_Compare_Output
  --

  procedure Finish_And_Compare_Output
   (Test_ID : in Test_ID_t;
    Message : in String := "check passed")
  is
    Match : Boolean := True;
  begin
    pragma Assert (Initialized);

    Text_IO.Close (Output_File);
    Text_IO.Open
      (File => Output_File,
       Mode => Text_IO.In_File,
       Name => Program_Name.all & ".log_out");
    Text_IO.Open
      (File => Expected_File,
       Mode => Text_IO.In_File,
       Name => Program_Name.all & ".log_exp");

    declare
      Out_Lines : Long_Integer := 0;
      Exp_Lines : Long_Integer := 0;
      Done      : Boolean := False;
    begin
      loop exit when Done;
        declare
          Out_Line : constant String := Text_IO.Get_Line (Output_File);
          Exp_Line : constant String := Text_IO.Get_Line (Expected_File);
        begin
          Out_Lines := Out_Lines + 1;
          Exp_Lines := Exp_Lines + 1;
          if Out_Line /= Exp_Line then
            Match := False;
            Done  := True;
          end if;
        end;
      end loop;
    exception
      when Ada.IO_Exceptions.End_Error =>
        if Out_Lines /= Exp_Lines then
          Match := False;
          Done  := True;
        end if;
    end;

    Check_Test (Test_ID, Message, Match);

    Finish;
  end Finish_And_Compare_Output;

  --
  -- Initialize
  --

  procedure Initialize (Program : in String) is
  begin
    ID_IO.Default_Width := 8;
    ID_IO.Default_Base  := 10;

    Program_Name := new String'(Program);

    Text_IO.Create
      (File => Output_File,
       Mode => Text_IO.Out_File,
       Name => Program & ".log_out");

    Text_IO.Create
      (File => Error_File,
       Mode => Text_IO.Out_File,
       Name => Program & ".log_err");

    Text_IO.Create
      (File => Success_File,
       Mode => Text_IO.Out_File,
       Name => Program & ".log_succ");

    Text_IO.Create
      (File => Failure_File,
       Mode => Text_IO.Out_File,
       Name => Program & ".log_fail");

    Initialized := True;
  end Initialize;

  --
  -- Write_Results
  --

  procedure Write_Results
   (File    : in Text_IO.File_Type;
    Kind    : in String;
    Test_ID : in Test_ID_t;
    Message : in String) is
  begin
    Text_IO.Put      (File, Kind);
    Text_IO.Put      (File, ": ");
    ID_IO.Put        (File, Test_ID);
    Text_IO.Put      (File, ": ");
    Text_IO.Put      (File, Program_Name.all);
    Text_IO.Put      (File, ": ");
    Text_IO.Put      (File, Message);
    Text_IO.New_Line (File);
  end Write_Results;

end Test;
