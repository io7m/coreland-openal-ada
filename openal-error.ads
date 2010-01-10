with OpenAL.Types;

package OpenAL.Error is

  type Error_t is
    (No_Error,
     Invalid_Name,
     Invalid_Enumeration,
     Invalid_Value,
     Invalid_Operation,
     Out_Of_Memory);

  -- proc_map : alGetError
  function Get_Error return Error_t;

private

  function Map_Constant_To_Error (Error : in Types.Enumeration_t) return Error_t;

end OpenAL.Error;
