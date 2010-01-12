with Ada.Strings.Fixed;
with Ada.Directories;

package body Test is
  package Text_IO       renames Ada.Text_IO;
  package Result_IO     is new  Ada.Text_IO.Enumeration_IO (Result_t);
  package Fixed_Strings renames Ada.Strings.Fixed;
  package Strings       renames Ada.Strings;
  package Directories   renames Ada.Directories;

  use type UB_Strings.Unbounded_String;

  --
  -- Check
  --

  procedure Check
    (Test_Context : in Context_t;
     Test         : in Test_t;
     Condition    : in Boolean;
     Statement    : in String := "")
  is
    Result : Valid_Result_t;
  begin
    if Condition then
      Result := Pass;
    else
      Result := Fail;
    end if;

    Satisfy
      (Test_Context => Test_Context,
       Test         => Test,
       Result       => Result,
       Statement    => Statement);
  end Check;

  --
  -- Check_Program
  --

  procedure Check_Program
    (Test_Context : in Context_t;
     Base         : in UB_Strings.Unbounded_String)
  is
    Want_Program : UB_Strings.Unbounded_String;
    Path         : UB_Strings.Unbounded_String;
    File         : Text_IO.File_Type;
  begin
    UB_Strings.Append (Path, Test_Context.Test_DB);
    UB_Strings.Append (Path, Base);
    UB_Strings.Append (Path, "/program");

    Text_IO.Open
      (File => File,
       Mode => Text_IO.In_File,
       Name => UB_Strings.To_String (Path));

    Want_Program := UB_Strings.To_Unbounded_String (Text_IO.Get_Line (File));

    if Want_Program /= Test_Context.Program then
      raise Program_Error with "program does not match test database";
    end if;
  end Check_Program;

  --
  -- Initialize
  --

  procedure Initialize
    (Test_Context :    out Context_t;
     Program      : in     String;
     Test_DB      : in     String;
     Test_Results : in     String) is
  begin
    Test_Context.Program      := UB_Strings.To_Unbounded_String (Program);
    Test_Context.Test_DB      := UB_Strings.To_Unbounded_String (Test_DB);
    Test_Context.Test_Results := UB_Strings.To_Unbounded_String (Test_Results);

    Text_IO.Create
      (File => Test_Context.Output_File,
       Name => Program & ".log_out",
       Mode => Text_IO.Out_File);
    Text_IO.Create
      (File => Test_Context.Error_File,
       Name => Program & ".log_error",
       Mode => Text_IO.Out_File);

    Text_IO.Set_Output (Test_Context.Output_File);
    Text_IO.Set_Error  (Test_Context.Error_File);
  end Initialize;

  --
  -- Satisfy
  --

  procedure Satisfy
    (Test_Context : in Context_t;
     Test         : in Test_t;
     Result       : in Valid_Result_t;
     Statement    : in String := "")
  is
    File : Text_IO.File_Type;
    Base : UB_Strings.Unbounded_String;
    Path : UB_Strings.Unbounded_String;
  begin
    -- Build path to test entry.
    UB_Strings.Set_Unbounded_String (Base, "");
    UB_Strings.Append (Base, "/tests/");
    UB_Strings.Append (Base, Fixed_Strings.Trim (Test_t'Image (Test), Strings.Left));

    -- Check database entry exists.
    UB_Strings.Set_Unbounded_String (Path, "");
    UB_Strings.Append (Path, Test_Context.Test_DB);
    UB_Strings.Append (Path, Base);

    if Directories.Exists (UB_Strings.To_String (Path)) = False then
      raise Program_Error with
        "test " & Fixed_Strings.Trim (Test_t'Image (Test), Strings.Left) & " not defined";
    end if;

    -- Check the current program is the one that should be satisfying the test.
    Check_Program (Test_Context, Base);

    -- Build path to state file.
    UB_Strings.Set_Unbounded_String (Path, "");
    UB_Strings.Append (Path, Test_Context.Test_Results);
    UB_Strings.Append (Path, Base);
    UB_Strings.Append (Path, "/statement");

    -- Yes, Ada has race conditions built in!
    Text_IO.Create   (File, Name => UB_Strings.To_String (Path));
    Text_IO.Put      (File, Statement);
    Text_IO.New_Line (File);
    Text_IO.Close    (File);

    -- Build path to state file.
    UB_Strings.Set_Unbounded_String (Path, "");
    UB_Strings.Append (Path, Test_Context.Test_Results);
    UB_Strings.Append (Path, Base);
    UB_Strings.Append (Path, "/state");

    -- Yes, Ada has race conditions built in!
    Text_IO.Create   (File, Name => UB_Strings.To_String (Path));
    Result_IO.Put    (File, Result);
    Text_IO.New_Line (File);
  end Satisfy;

end Test;
