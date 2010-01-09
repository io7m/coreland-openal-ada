generic
  type Subprogram_Access_t is private;

package OpenAL.Load is

  function Load_Subprogram (Name : in String) return Subprogram_Access_t;

end OpenAL.Load;
