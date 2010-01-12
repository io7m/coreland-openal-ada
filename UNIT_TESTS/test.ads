private with Ada.Strings.Unbounded;
private with Ada.Text_IO;

package Test is

  type Test_t is range 1 .. 1_000_000;

  type Context_t is limited private;

  type Result_t is (Not_Executed, Pass, Fail, Unsupported);
  subtype Valid_Result_t is Result_t range Pass .. Unsupported;

  procedure Initialize
    (Test_Context :    out Context_t;
     Program      : in     String;
     Test_DB      : in     String;
     Test_Results : in     String);

  procedure Satisfy
    (Test_Context : in Context_t;
     Test         : in Test_t;
     Result       : in Valid_Result_t;
     Statement    : in String := "");

  procedure Check
    (Test_Context : in Context_t;
     Test         : in Test_t;
     Condition    : in Boolean;
     Statement    : in String := "");

private
  package UB_Strings renames Ada.Strings.Unbounded;

  type Context_t is record
    Test_DB      : UB_Strings.Unbounded_String;
    Test_Results : UB_Strings.Unbounded_String;
    Program      : UB_Strings.Unbounded_String;
    Output_File  : Ada.Text_IO.File_Type;
    Error_File   : Ada.Text_IO.File_Type;
  end record;

end Test;
