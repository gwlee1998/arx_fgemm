#include <stdarg.h>

#include "ervp_assert.h"
#include "ervp_platform_api.h"
#include "ervp_variable_allocation.h"

void assert_fail_rvx(const char *expr, const char *file, unsigned int line, const char *func)
{
  const char *file_name = file;
  while (*file_name++ != 0)
    ;
  while (1)
  {
    if (file_name == file)
      break;
    if (*file_name == '/')
    {
      file_name++;
      break;
    }
    if (*file_name == '\\')
    {
      file_name++;
      break;
    }
    file_name--;
  }
  printf_must("\nAssert Failed: %s\n[%s @%d] %s", expr, file_name, line, func);
  exit(ERROR_ASSERT);
}

int check_if_data_porinter_is_valid(void *p)
{
  int valid = 0;
  if (0)
    ;
#ifdef INCLUDE_SMALL_RAM
  else if ((p >= SMALL_RAM_BASEADDR) && (p <= SMALL_RAM_LASTADDR))
    valid = 1;
#endif
#ifdef INCLUDE_LARGE_RAM
#ifndef USE_LARGE_RAM_MANUALLY
  else if ((p >= LARGE_RAM_BASEADDR) && (p <= LARGE_RAM_LASTADDR))
    valid = 1;
#endif
#endif
  return valid;
}