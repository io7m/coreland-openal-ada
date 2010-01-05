package OpenAL.Error is

  type Error_t is
    (No_Error,
     Invalid_Name,
     Invalid_Enumeration,
     Invalid_Value,
     Invalid_Operation,
     Out_Of_Memory);

  function Get_Error return Error_t;

end OpenAL.Error;
