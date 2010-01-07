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

  A : System.Address;
  V : List.String_Vector_t;

  use type Ada.Containers.Count_Type;

begin
  Test.Initialize ("list_001");

  V := List.String_Vectors.Empty_Vector;
  A := list_001c_element (0);
  List.Address_To_Vector (A, V);
  Test.Check_Test (61, "element count correct", List.String_Vectors.Length (V) = 0);

  V := List.String_Vectors.Empty_Vector;
  A := list_001c_element (1);
  List.Address_To_Vector (A, V);
  Test.Check_Test (62, "element count correct", List.String_Vectors.Length (V) = 1);

  V := List.String_Vectors.Empty_Vector;
  A := list_001c_element (2);
  List.Address_To_Vector (A, V);
  Test.Check_Test (63, "element count correct", List.String_Vectors.Length (V) = 2);

  V := List.String_Vectors.Empty_Vector;
  A := list_001c_element (3);
  List.Address_To_Vector (A, V);
  Test.Check_Test (64, "element count correct", List.String_Vectors.Length (V) = 3);

  Test.Finish;
end list_001;
