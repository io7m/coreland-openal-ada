with Interfaces.C;
with System.Address_To_Access_Conversions;
with System.Storage_Elements;
with Ada.Strings.Unbounded;

package body OpenAL.List is
  package C          renames Interfaces.C;
  package UB_Strings renames Ada.Strings.Unbounded;

  package Bytes is new System.Address_To_Access_Conversions (Object => C.char);

  use System.Storage_Elements;
  use type C.char;
  use type UB_Strings.Unbounded_String;

  procedure Address_To_Vector
    (Address : in     System.Address;
     List    :    out String_Vector_t)
  is
    Current_Address : System.Address := Address;
    Char_Pointer    : Bytes.Object_Pointer;
    Next_Pointer    : Bytes.Object_Pointer;
    Buffer          : UB_Strings.Unbounded_String;
  begin
    Main_Loop : loop
      Char_Pointer := Bytes.To_Pointer (Current_Address);
      if Char_Pointer.all /= C.nul then
        UB_Strings.Append (Buffer, C.To_Ada (Char_Pointer.all));
      else
        if Buffer /= UB_Strings.Null_Unbounded_String then
          String_Vectors.Append (List, UB_Strings.To_String (Buffer));
          Buffer := UB_Strings.Null_Unbounded_String;
        end if;
        Next_Pointer := Bytes.To_Pointer (Current_Address + 1);
        if Next_Pointer.all = C.nul then
          exit Main_Loop;
        end if;
      end if;
      Current_Address := Current_Address + 1;
    end loop Main_Loop;
  end Address_To_Vector;

end OpenAL.List;
