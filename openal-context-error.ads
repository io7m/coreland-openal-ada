package OpenAL.Context.Error is

  type Error_t is
    (No_Error,
     Invalid_Device,
     Invalid_Context,
     Invalid_Enumeration,
     Invalid_Value,
     Out_Of_Memory);

  -- proc_map : alcGetError
  function Get_Error (Device : in Device_t) return Error_t;

private

  function Map_Constant_To_Error (Error : in Types.Enumeration_t) return Error_t;

end OpenAL.Context.Error;
