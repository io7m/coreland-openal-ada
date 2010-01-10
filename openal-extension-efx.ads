with OpenAL.Context;
with OpenAL.Types;

private with OpenAL.Extension.EFX_Thin;

package OpenAL.Extension.EFX is

  type Extension_t is private;

  function Is_Present (Device : in Context.Device_t) return Boolean;

  function Load_Extension return Extension_t;

  --
  -- Effects.
  --

  type Effect_t       is private;
  type Effect_Array_t is array (Positive range <>) of Effect_t;

  No_Effect : constant Effect_t;

  -- proc_map : alGenEffects
  procedure Generate_Effects
    (Extension : in     Extension_t;
     Effects   : in out Effect_Array_t);

  -- proc_map : alDeleteEffects
  procedure Delete_Effects
    (Extension : in Extension_t;
     Effects   : in Effect_Array_t);

  -- proc_map : alIsEffect
  function Effect_Is_Valid
    (Extension : in Extension_t;
     Effect    : in Effect_t) return Boolean;

  --
  -- Filters.
  --

  type Filter_t       is private;
  type Filter_Array_t is array (Positive range <>) of Filter_t;

  No_Filter : constant Filter_t;

  -- proc_map : alGenFilters
  procedure Generate_Filters
    (Extension : in     Extension_t;
     Filters   : in out Filter_Array_t);

  -- proc_map : alDeleteFilters
  procedure Delete_Filters
    (Extension : in Extension_t;
     Filters   : in Filter_Array_t);

  -- proc_map : alIsFilter
  function Filter_Is_Valid
    (Extension : in Extension_t;
     Filter    : in Filter_t) return Boolean;

  --
  -- Auxiliary_Effect_Slots.
  --

  type Auxiliary_Effect_Slot_t       is private;
  type Auxiliary_Effect_Slot_Array_t is array (Positive range <>) of Auxiliary_Effect_Slot_t;

  No_Auxiliary_Effect_Slot : constant Auxiliary_Effect_Slot_t;

  -- proc_map : alGenAuxiliaryEffectSlots
  procedure Generate_Auxiliary_Effect_Slots
    (Extension : in     Extension_t;
     Slots     : in out Auxiliary_Effect_Slot_Array_t);

  -- proc_map : alDeleteAuxiliaryEffectSlots
  procedure Delete_Auxiliary_Effect_Slots
    (Extension : in Extension_t;
     Slots     : in Auxiliary_Effect_Slot_Array_t);

  -- proc_map : alIsAuxiliaryEffectSlot
  function Auxiliary_Effect_Slot_Is_Valid
    (Extension : in Extension_t;
     Slot      : in Auxiliary_Effect_Slot_t) return Boolean;

private

  type Effect_t is new Types.Unsigned_Integer_t;

  No_Effect : constant Effect_t := 0;

  type Filter_t is new Types.Unsigned_Integer_t;

  No_Filter : constant Filter_t := 0;

  type Auxiliary_Effect_Slot_t is new Types.Unsigned_Integer_t;

  No_Auxiliary_Effect_Slot : constant Auxiliary_Effect_Slot_t := 0;

  type Extension_t is record
    Loaded : Boolean := False;
    API    : EFX_Thin.API_t;
  end record;

end OpenAL.Extension.EFX;
