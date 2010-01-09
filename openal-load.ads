package OpenAL.Load is

  Load_Error : exception;

  generic
    type Subprogram_Access_Type is private;

  function Load_Subprogram (Name : in String) return Subprogram_Access_Type;

end OpenAL.Load;
