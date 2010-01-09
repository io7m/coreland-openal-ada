with Ada.Unchecked_Conversion;
with Interfaces.C;
with System;

package body OpenAL.Load is
  package C renames Interfaces.C;

  function Load_Subprogram (Name : in String) return Subprogram_Access_Type is
    pragma Assert (Subprogram_Access_Type'Size = System.Address'Size);

    function Get_Proc_Address
      (Name : System.Address) return System.Address;
    pragma Import (C, Get_Proc_Address, "alGetProcAddress");

    function Convert is new Ada.Unchecked_Conversion
      (Source => System.Address,
       Target => Subprogram_Access_Type);

    use type System.Address;

    C_Name  : aliased C.char_array := C.To_C (Name);
    Address : constant System.Address :=
      Get_Proc_Address (C_Name (C_Name'First)'Address);
  begin
    if Address = System.Null_Address then
      raise Load_Error with "subprogram " & Name & " not found";
    end if;

    return Convert (Address);
  end Load_Subprogram;

end OpenAL.Load;
