--with OpenAL.Load;

package body OpenAL.Extension.EFX is

--  procedure Check_Loaded (Extension : in Extension_t) is
--  begin
--    if Extension.Loaded = False then
--      raise Load.Load_Error with "extension not loaded";
--    end if;
--  end Check_Loaded;

  function Is_Present (Device : in Context.Device_t) return Boolean is
  begin
    return Context.Is_Extension_Present
      (Device => Device,
       Name   => "ALC_EXT_EFX");
  end Is_Present;

  function Load_Extension return Extension_t is
  begin
    return Extension_t'
      (API    => EFX_Thin.Load_API,
       Loaded => True);
  end Load_Extension;

end OpenAL.Extension.EFX;
