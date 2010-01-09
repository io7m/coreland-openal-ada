with OpenAL.Context;

private with OpenAL.Extension.EFX_Thin;

package OpenAL.Extension.EFX is

  type Extension_t is private;

  function Is_Present (Device : in Context.Device_t) return Boolean;

  function Load_Extension return Extension_t;

private

  type Extension_t is record
    Loaded : Boolean := False;
    API    : EFX_Thin.API_t;
  end record;

end OpenAL.Extension.EFX;
