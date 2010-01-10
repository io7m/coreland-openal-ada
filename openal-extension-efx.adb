package body OpenAL.Extension.EFX is

  --
  -- Auxiliary_Effect_Slot_Is_Valid
  --

  function Auxiliary_Effect_Slot_Is_Valid
    (Extension : in Extension_t;
     Slot      : in Auxiliary_Effect_Slot_t) return Boolean is
  begin
    Check_Loaded (Extension);

    return Boolean
      (Extension.API.Is_Auxiliary_Effect_Slot (Types.Unsigned_Integer_t (Slot)));
  end Auxiliary_Effect_Slot_Is_Valid;

  --
  -- Check_Loaded
  --

  procedure Check_Loaded (Extension : in Extension_t) is
  begin
    if Extension.Loaded = False then
      raise Program_Error with "extension not loaded";
    end if;
  end Check_Loaded;

  --
  -- Delete_*
  --

  procedure Delete_Auxiliary_Effect_Slots
    (Extension : in Extension_t;
     Slots     : in Auxiliary_Effect_Slot_Array_t) is
  begin
    Check_Loaded (Extension);

    Extension.API.Delete_Auxiliary_Effect_Slots
      (Size  => Slots'Length,
       Slots => Slots (Slots'First)'Address);
  end Delete_Auxiliary_Effect_Slots;

  procedure Delete_Effects
    (Extension : in Extension_t;
     Effects   : in Effect_Array_t) is
  begin
    Check_Loaded (Extension);

    Extension.API.Delete_Effects
      (Size    => Effects'Length,
       Effects => Effects (Effects'First)'Address);
  end Delete_Effects;

  procedure Delete_Filters
    (Extension : in Extension_t;
     Filters   : in Filter_Array_t) is
  begin
    Check_Loaded (Extension);

    Extension.API.Delete_Filters
      (Size    => Filters'Length,
       Filters => Filters (Filters'First)'Address);
  end Delete_Filters;

  --
  -- Effect_Is_Valid
  --

  function Effect_Is_Valid
    (Extension : in Extension_t;
     Effect    : in Effect_t) return Boolean is
  begin
    Check_Loaded (Extension);

    return Boolean (Extension.API.Is_Effect (Types.Unsigned_Integer_t (Effect)));
  end Effect_Is_Valid;

  --
  -- Filter_Is_Valid
  --

  function Filter_Is_Valid
    (Extension : in Extension_t;
     Filter    : in Filter_t) return Boolean is
  begin
    Check_Loaded (Extension);

    return Boolean (Extension.API.Is_Filter (Types.Unsigned_Integer_t (Filter)));
  end Filter_Is_Valid;

  --
  -- Generate_*
  --

  procedure Generate_Auxiliary_Effect_Slots
    (Extension : in     Extension_t;
     Slots     : in out Auxiliary_Effect_Slot_Array_t) is
  begin
    Check_Loaded (Extension);

    Extension.API.Gen_Auxiliary_Effect_Slots
      (Size  => Slots'Length,
       Slots => Slots (Slots'First)'Address);
  end Generate_Auxiliary_Effect_Slots;

  procedure Generate_Effects
    (Extension : in     Extension_t;
     Effects   : in out Effect_Array_t) is
  begin
    Check_Loaded (Extension);

    Extension.API.Gen_Effects
      (Size    => Effects'Length,
       Effects => Effects (Effects'First)'Address);
  end Generate_Effects;

  procedure Generate_Filters
    (Extension : in     Extension_t;
     Filters   : in out Filter_Array_t) is
  begin
    Check_Loaded (Extension);

    Extension.API.Gen_Filters
      (Size    => Filters'Length,
       Filters => Filters (Filters'First)'Address);
  end Generate_Filters;

  --
  -- Is_Present
  --

  function Is_Present (Device : in Context.Device_t) return Boolean is
  begin
    return Context.Is_Extension_Present
      (Device => Device,
       Name   => "ALC_EXT_EFX");
  end Is_Present;

  --
  -- Load_Extension
  --

  function Load_Extension return Extension_t is
  begin
    return Extension_t'
      (API    => EFX_Thin.Load_API,
       Loaded => True);
  end Load_Extension;

end OpenAL.Extension.EFX;
