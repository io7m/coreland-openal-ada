with OpenAL.Thin;

package OpenAL.Source is

  --
  -- Types
  --

  type Source_ID_t    is private;
  type Source_Array_t is array (Positive range <>) of Source_ID_t;

  --
  -- API
  --

  -- proc_map : alGenSources
  procedure Generate_Sources
    (Sources : in out Source_Array_t);

  -- proc_map : alDeleteSources
  procedure Delete_Sources
    (Sources : in Source_Array_t);

  -- proc_map : alIsSource
  function Is_Valid (Source : in Source_ID_t) return Boolean;

private

  type Source_ID_t is new Thin.Unsigned_Integer_t;

end OpenAL.Source;
