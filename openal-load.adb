with Interfaces.C;
with System;

package body OpenAL.Load is
  package C renames Interfaces.C;

  function Load_Subprogram (Name : in String) return Subprogram_Access_t is
    function Get_Proc_Address
      (Name : System.Address) return Subprogram_Access_t;
    pragma Import (C, Get_Proc_Address, "alGetProcAddress");

    C_Name : aliased C.char_array := C.To_C (Name);
  begin
    return Get_Proc_Address (C_Name (C_Name'First)'Address);
  end Load_Subprogram;

end OpenAL.Load;
