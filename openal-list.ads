with Ada.Containers.Indefinite_Vectors;
with System;

package OpenAL.List is

  package String_Vectors is new Ada.Containers.Indefinite_Vectors
    (Index_Type   => Positive,
     Element_Type => String);

  subtype String_Vector_t is String_Vectors.Vector;

  procedure Address_To_Vector
    (Address : in     System.Address;
     List    :    out String_Vector_t);

end OpenAL.List;
