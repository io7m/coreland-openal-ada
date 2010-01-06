package body OpenAL.Source is

  use type Thin.Size_t;

  procedure Generate_Sources
    (Sources : in out Source_Array_t) is
  begin
    Thin.Gen_Sources
      (Size    => Sources'Length,
       Sources => Sources (Sources'First)'Address);
  end Generate_Sources;

  procedure Delete_Sources
    (Sources : in Source_Array_t) is
  begin
    Thin.Delete_Sources
      (Size    => Sources'Length,
       Sources => Sources (Sources'First)'Address);
  end Delete_Sources;

  function Is_Valid (Source : in Source_ID_t) return Boolean is
  begin
    return Boolean (Thin.Is_Source (Thin.Unsigned_Integer_t (Source)));
  end Is_Valid;

end OpenAL.Source;
