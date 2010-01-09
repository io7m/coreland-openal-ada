with Ada.Numerics.Generic_Real_Arrays;
with Interfaces.C;
with System;

package OpenAL.Types is
  package C renames Interfaces.C;

  -- ALfloat
  type Float_t is new C.C_float;

  -- ALdouble
  type Double_t is new C.double;

  -- ALsizeiptr
  type Size_Pointer_t is mod 2 ** System.Word_Size;
  for Size_Pointer_t'Size use System.Word_Size;
  pragma Convention (C, Size_Pointer_t);

  -- ALintptr
  type Integer_Pointer_t is mod 2 ** System.Word_Size;
  for Integer_Pointer_t'Size use System.Word_Size;
  pragma Convention (C, Integer_Pointer_t);

  -- ALbitfield
  type Bitfield_t is mod 2 ** 32;
  for Bitfield_t'Size use 32;
  pragma Convention (C, Bitfield_t);

  -- ALboolean
  type Boolean_t is new Boolean;
  for Boolean_t'Size use 8;
  pragma Convention (C, Boolean_t);

  -- ALbyte
  type Byte_t is range -127 .. 127;
  for Byte_t'Size use 8;
  pragma Convention (C, Byte_t);

  -- ALclampd
  subtype Clamped_Double_t is Double_t range 0.0 .. 1.0;

  -- ALclampf
  subtype Clamped_Float_t is Float_t range 0.0 .. 1.0;

  -- ALenum
  type Enumeration_t is mod 2 ** 32;
  for Enumeration_t'Size use 32;
  pragma Convention (C, Enumeration_t);

  -- ALint
  type Integer_t is range -2147483647 .. 2147483647;
  for Integer_t'Size use 32;
  pragma Convention (C, Integer_t);

  -- ALshort
  type Short_t is range -32767 .. 32767;
  for Short_t'Size use 16;
  pragma Convention (C, Short_t);

  -- ALsizei
  type Size_t is range -2147483647 .. 2147483647;
  for Size_t'Size use 32;
  pragma Convention (C, Size_t);

  -- ALubyte
  type Unsigned_Byte_t is mod 2 ** 8;
  for Unsigned_Byte_t'Size use 8;
  pragma Convention (C, Unsigned_Byte_t);

  -- ALuint
  type Unsigned_Integer_t is mod 2 ** 32;
  for Unsigned_Integer_t'Size use 32;
  pragma Convention (C, Unsigned_Integer_t);

  -- ALushort
  type Unsigned_Short_t is mod 2 ** 16;
  for Unsigned_Short_t'Size use 16;
  pragma Convention (C, Unsigned_Short_t);

  -- ALvoid *
  subtype Void_Pointer_t is System.Address;

  -- ALvoid **
  type Void_Pointer_Access_t is access all Void_Pointer_t;
  pragma Convention (C, Void_Pointer_Access_t);

  -- const ALvoid **
  type Void_Pointer_Access_Constant_t is access constant System.Address;
  pragma Convention (C, Void_Pointer_Access_Constant_t);

  type String_t is new System.Address;

  subtype Natural_Float_t  is Float_t range 0.0 .. Float_t'Last;
  subtype Positive_Float_t is Float_t range 1.0 .. Float_t'Last;

  package Float_Arrays  is new Ada.Numerics.Generic_Real_Arrays (Types.Float_t);
  package Double_Arrays is new Ada.Numerics.Generic_Real_Arrays (Types.Double_t);

  type Vector_i_t is array (Positive range <>) of aliased Integer_t;

  type Vector_2i_t is new Vector_i_t (1 .. 2);
  type Vector_3i_t is new Vector_i_t (1 .. 3);
  type Vector_4i_t is new Vector_i_t (1 .. 4);

  type Vector_2f_t is new Float_Arrays.Real_Vector (1 .. 2);
  type Vector_3f_t is new Float_Arrays.Real_Vector (1 .. 3);
  type Vector_4f_t is new Float_Arrays.Real_Vector (1 .. 4);

  --
  -- Frequency in hz.
  --

  type Frequency_t is new Size_t range 1 .. Size_t'Last;

end OpenAL.Types;
