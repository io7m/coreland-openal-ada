-- Automatically generated, do not edit.

with OpenAL.Load;

package body OpenAL.Extension.EFX_Thin is

  --
  -- Load function for API pointers
  --

  function Load_API return API_t is

    function Load_Function is new Load.Load_Subprogram
      (Subprogram_Access_Type => Auxiliary_Effect_Slotf_t);
    function Load_Function is new Load.Load_Subprogram
      (Subprogram_Access_Type => Auxiliary_Effect_Slotfv_t);
    function Load_Function is new Load.Load_Subprogram
      (Subprogram_Access_Type => Auxiliary_Effect_Sloti_t);
    function Load_Function is new Load.Load_Subprogram
      (Subprogram_Access_Type => Auxiliary_Effect_Slotiv_t);
    function Load_Function is new Load.Load_Subprogram
      (Subprogram_Access_Type => Delete_Auxiliary_Effect_Slots_t);
    function Load_Function is new Load.Load_Subprogram
      (Subprogram_Access_Type => Delete_Effects_t);
    function Load_Function is new Load.Load_Subprogram
      (Subprogram_Access_Type => Delete_Filters_t);
    function Load_Function is new Load.Load_Subprogram
      (Subprogram_Access_Type => Effectf_t);
    function Load_Function is new Load.Load_Subprogram
      (Subprogram_Access_Type => Effectfv_t);
    function Load_Function is new Load.Load_Subprogram
      (Subprogram_Access_Type => Effecti_t);
    function Load_Function is new Load.Load_Subprogram
      (Subprogram_Access_Type => Effectiv_t);
    function Load_Function is new Load.Load_Subprogram
      (Subprogram_Access_Type => Filterf_t);
    function Load_Function is new Load.Load_Subprogram
      (Subprogram_Access_Type => Filterfv_t);
    function Load_Function is new Load.Load_Subprogram
      (Subprogram_Access_Type => Filteri_t);
    function Load_Function is new Load.Load_Subprogram
      (Subprogram_Access_Type => Filteriv_t);
    function Load_Function is new Load.Load_Subprogram
      (Subprogram_Access_Type => Gen_Auxiliary_Effect_Slots_t);
    function Load_Function is new Load.Load_Subprogram
      (Subprogram_Access_Type => Gen_Effects_t);
    function Load_Function is new Load.Load_Subprogram
      (Subprogram_Access_Type => Gen_Filters_t);
    function Load_Function is new Load.Load_Subprogram
      (Subprogram_Access_Type => Get_Auxiliary_Effect_Slotf_t);
    function Load_Function is new Load.Load_Subprogram
      (Subprogram_Access_Type => Get_Auxiliary_Effect_Slotfv_t);
    function Load_Function is new Load.Load_Subprogram
      (Subprogram_Access_Type => Get_Auxiliary_Effect_Sloti_t);
    function Load_Function is new Load.Load_Subprogram
      (Subprogram_Access_Type => Get_Auxiliary_Effect_Slotiv_t);
    function Load_Function is new Load.Load_Subprogram
      (Subprogram_Access_Type => Get_Effectf_t);
    function Load_Function is new Load.Load_Subprogram
      (Subprogram_Access_Type => Get_Effectfv_t);
    function Load_Function is new Load.Load_Subprogram
      (Subprogram_Access_Type => Get_Effecti_t);
    function Load_Function is new Load.Load_Subprogram
      (Subprogram_Access_Type => Get_Effectiv_t);
    function Load_Function is new Load.Load_Subprogram
      (Subprogram_Access_Type => Get_Filterf_t);
    function Load_Function is new Load.Load_Subprogram
      (Subprogram_Access_Type => Get_Filterfv_t);
    function Load_Function is new Load.Load_Subprogram
      (Subprogram_Access_Type => Get_Filteri_t);
    function Load_Function is new Load.Load_Subprogram
      (Subprogram_Access_Type => Get_Filteriv_t);
    function Load_Function is new Load.Load_Subprogram
      (Subprogram_Access_Type => Is_Auxiliary_Effect_Slot_t);
    function Load_Function is new Load.Load_Subprogram
      (Subprogram_Access_Type => Is_Effect_t);
    function Load_Function is new Load.Load_Subprogram
      (Subprogram_Access_Type => Is_Filter_t);

  begin
    return API_t'
      (Auxiliary_Effect_Slotf         => Load_Function ("alAuxiliaryEffectSlotf"),
       Auxiliary_Effect_Slotfv        => Load_Function ("alAuxiliaryEffectSlotfv"),
       Auxiliary_Effect_Sloti         => Load_Function ("alAuxiliaryEffectSloti"),
       Auxiliary_Effect_Slotiv        => Load_Function ("alAuxiliaryEffectSlotiv"),
       Delete_Auxiliary_Effect_Slots  => Load_Function ("alDeleteAuxiliaryEffectSlots"),
       Delete_Effects                 => Load_Function ("alDeleteEffects"),
       Delete_Filters                 => Load_Function ("alDeleteFilters"),
       Effectf                        => Load_Function ("alEffectf"),
       Effectfv                       => Load_Function ("alEffectfv"),
       Effecti                        => Load_Function ("alEffecti"),
       Effectiv                       => Load_Function ("alEffectiv"),
       Filterf                        => Load_Function ("alFilterf"),
       Filterfv                       => Load_Function ("alFilterfv"),
       Filteri                        => Load_Function ("alFilteri"),
       Filteriv                       => Load_Function ("alFilteriv"),
       Gen_Auxiliary_Effect_Slots     => Load_Function ("alGenAuxiliaryEffectSlots"),
       Gen_Effects                    => Load_Function ("alGenEffects"),
       Gen_Filters                    => Load_Function ("alGenFilters"),
       Get_Auxiliary_Effect_Slotf     => Load_Function ("alGetAuxiliaryEffectSlotf"),
       Get_Auxiliary_Effect_Slotfv    => Load_Function ("alGetAuxiliaryEffectSlotfv"),
       Get_Auxiliary_Effect_Sloti     => Load_Function ("alGetAuxiliaryEffectSloti"),
       Get_Auxiliary_Effect_Slotiv    => Load_Function ("alGetAuxiliaryEffectSlotiv"),
       Get_Effectf                    => Load_Function ("alGetEffectf"),
       Get_Effectfv                   => Load_Function ("alGetEffectfv"),
       Get_Effecti                    => Load_Function ("alGetEffecti"),
       Get_Effectiv                   => Load_Function ("alGetEffectiv"),
       Get_Filterf                    => Load_Function ("alGetFilterf"),
       Get_Filterfv                   => Load_Function ("alGetFilterfv"),
       Get_Filteri                    => Load_Function ("alGetFilteri"),
       Get_Filteriv                   => Load_Function ("alGetFilteriv"),
       Is_Auxiliary_Effect_Slot       => Load_Function ("alIsAuxiliaryEffectSlot"),
       Is_Effect                      => Load_Function ("alIsEffect"),
       Is_Filter                      => Load_Function ("alIsFilter"));
  end Load_API;

end OpenAL.Extension.EFX_Thin;
