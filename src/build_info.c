#include "stdio.h"

#define SOFT_VERSION    "5.1.0.1"
#define PLATFORM_NAME   "Linux"
#define MACHINE_ARC     "i686"
#define BUILD_TIME      "2016-05-03 16:42:22"

char *get_version(void)
{
  return (SOFT_VERSION);
}

char *get_platform(void)
{
  return (PLATFORM_NAME);
}

char *get_machine_arc(void)
{
  return (MACHINE_ARC);
}

char *get_build_time(void)
{
  return (BUILD_TIME);
}
