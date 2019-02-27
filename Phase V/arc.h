# if defined (__linux__) && (defined(__i386__) || defined(__x86_64__))

# define STACK_ALIGNMENT 4

# elif defined (__APPLE__) && (defined(__i386__) || defined(__x86_64__))

# define STACK_ALIGNMENT 16

# else

# error Unsupport architecture
# endif
