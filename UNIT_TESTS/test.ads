with Ada.Text_IO;

package Test is

  type Test_ID_t is range 1 .. 1_000_000;

  Output_File : Ada.Text_IO.File_Type;
  Error_File  : Ada.Text_IO.File_Type;

  procedure Initialize (Program : in String);

  procedure Check_Test
   (Test_ID : in Test_ID_t;
    Message : in String := "check passed";
    Check   : in Boolean);

  procedure Finish_And_Compare_Output
    (Test_ID : in Test_ID_t;
     Message : in String := "check passed");

  procedure Finish;

end Test;
