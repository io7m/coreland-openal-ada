#include <assert.h>

const char *
list_001c_element (unsigned int element)
{
  static const char *table[] = {
    "\x00\x00",
    "one\x00\x00",
    "one\x00two\x00\x00",
    "one\x00two\x00three\x00\x00",
  };

  assert (element < (sizeof (table) / sizeof (table [0])));
  return table [element];
}
