with Ada.Numerics.Generic_Real_Arrays;
with OpenAL.Thin;

package OpenAL.Types is

  subtype Integer_t          is Thin.Integer_t;
  subtype Unsigned_Integer_t is Thin.Unsigned_Integer_t;
  subtype Float_t            is Thin.Float_t;
  subtype Double_t           is Thin.Double_t;

  subtype Clamped_Double_t is Double_t range 0.0 .. 1.0;
  subtype Clamped_Float_t  is Float_t range 0.0 .. 1.0;

  subtype Natural_Float_t is Thin.Float_t range 0.0 .. Thin.Float_t'Last;

  package Float_Arrays  is new Ada.Numerics.Generic_Real_Arrays (Types.Float_t);
  package Double_Arrays is new Ada.Numerics.Generic_Real_Arrays (Types.Double_t);

  type Vector_i_t is array (Positive range <>) of aliased Integer_t;

  type Vector_2i_t is new Vector_i_t (1 .. 2);
  type Vector_3i_t is new Vector_i_t (1 .. 3);
  type Vector_4i_t is new Vector_i_t (1 .. 4);

  type Vector_2f_t is new Float_Arrays.Real_Vector (1 .. 2);
  type Vector_3f_t is new Float_Arrays.Real_Vector (1 .. 3);
  type Vector_4f_t is new Float_Arrays.Real_Vector (1 .. 4);

end OpenAL.Types;
