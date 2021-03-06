with Interfaces.C;
with OpenAL.List;
with Ada.Containers;
with System;
with Test;

procedure list_001 is
  package List renames OpenAL.List;
  package C    renames Interfaces.C;

  function list_001c_element (Element : C.unsigned) return System.Address;
  pragma Import (C, list_001c_element, "list_001c_element");

  A  : System.Address;
  V  : List.String_Vector_t;
  TC : Test.Context_t;

  use type Ada.Containers.Count_Type;

begin
  Test.Initialize
    (Test_Context => TC,
     Program      => "list_001",
     Test_DB      => "TEST_DB",
     Test_Results => "TEST_RESULTS");

  V := List.String_Vectors.Empty_Vector;
  A := list_001c_element (0);
  List.Address_To_Vector (A, V);
  Test.Check (TC, 23, List.String_Vectors.Length (V) = 0, "List.String_Vectors.Length (V) = 0");

  V := List.String_Vectors.Empty_Vector;
  A := list_001c_element (1);
  List.Address_To_Vector (A, V);
  Test.Check (TC, 24, List.String_Vectors.Length (V) = 1, "List.String_Vectors.Length (V) = 1");

  V := List.String_Vectors.Empty_Vector;
  A := list_001c_element (2);
  List.Address_To_Vector (A, V);
  Test.Check (TC, 25, List.String_Vectors.Length (V) = 2, "List.String_Vectors.Length (V) = 2");

  V := List.String_Vectors.Empty_Vector;
  A := list_001c_element (3);
  List.Address_To_Vector (A, V);
  Test.Check (TC, 26, List.String_Vectors.Length (V) = 3, "List.String_Vectors.Length (V) = 3");

end list_001;
