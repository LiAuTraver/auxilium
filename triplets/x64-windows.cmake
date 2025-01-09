# ## Copyright (c) LiAuTraver, Licensed under MIT.
# ## ASAN enabled triplet for x64-windows (msvc) target fix (eg, scnlib)

# to enable AddressSanitizer(some issues with them when using default settings)
set(VCPKG_TARGET_ARCHITECTURE x64)
set(VCPKG_CRT_LINKAGE dynamic)
set(VCPKG_LIBRARY_LINKAGE dynamic)

set(VCPKG_C_FLAGS "")
set(VCPKG_CXX_FLAGS "")
set(VCPKG_C_FLAGS_DEBUG "")
set(VCPKG_CXX_FLAGS_DEBUG "")


string(APPEND VCPKG_C_FLAGS
  " /permissive-" # Strict Standards
  " /D_CRT_SECURE_NO_WARNINGS" # Disable CRT warnings
  " /utf-8" # UTF-8 source and execution
  " /Zc:wchar_t" # wchar_t is native type
)
# General C++ flags for all builds
string(APPEND VCPKG_CXX_FLAGS
  " /permissive-" # Strict Standards
  " /volatile:iso" # ISO-compliant volatile
  " /Zc:inline" # Remove unreferenced COMDAT
  " /Zc:preprocessor" # Standard-conforming preprocessor
  " /Zc:enumTypes" # Enum type compliance
  " /Zc:lambda" # Lambda compliance
  " /Zc:__cplusplus" # Correct __cplusplus macro
  " /Zc:externConstexpr" # External constexpr
  " /Zc:throwingNew" # Throwing new behavior
  " /EHsc" # Standard exception handling
  " /Zc:__STDC__" # Correct __STDC__ macro
  " /D_CRT_SECURE_NO_WARNINGS" # Disable CRT warnings
  " /utf-8" # UTF-8 source and execution
  " /Zc:wchar_t" # wchar_t is native type
  " /Zc:char8_t" # char8_t is native type
  " /openmp" # OpenMP support
  " /WX-" # No warnings as errors
  " /analyze-" # Disable code analysis
)
string(APPEND VCPKG_C_FLAGS_DEBUG
  " /Zi" # Debug information format
  " /Od" # Disable optimization
  " /fsanitize=address" # Address sanitizer
  " /fsanitize=fuzzer" # Fuzzer sanitizer
  " /guard:cf" # Control Flow Guard
  " /JMC" # Just My Code debuggin
  " /MP" # Multi-process compilation
  " /external:W0" # External headers warning level
  " /FC" # Full path in diagnostics
  " /Ob0" # Disable inlining
  " /D_DISABLE_VECTOR_ANNOTATION"
  " /D_DISABLE_STRING_ANNOTATION"
  " /W0" # Warning level
)
# Debug-specific flags
string(APPEND VCPKG_CXX_FLAGS_DEBUG
  " /Zi" # Debug information format
  " /Od" # Disable optimization
  " /EHa" # Enable C++ EH with SEH
  " /GR" # Enable RTTI
  " /fsanitize=address" # Address sanitizer
  " /fsanitize=fuzzer" # Fuzzer sanitizer
  " /guard:cf" # Control Flow Guard
  " /guard:ehcont" # EH Continuation metadata
  " /RTCsu" # Runtime checks
  " /sdl" # Security checks
  " /diagnostics:caret" # Enhanced diagnostics
  " /Qpar" # Auto-parallelizer
  " /JMC" # Just My Code debugging
  " /MP" # Multi-process compilation
  " /external:W0" # External headers warning level
  " /FC" # Full path in diagnostics
  " /Ob0" # Disable inlining
  " /D_DISABLE_VECTOR_ANNOTATION"
  " /D_DISABLE_STRING_ANNOTATION"
)

# Linker flags for all builds
set(CMAKE_EXE_LINKER_FLAGS "/INCREMENTAL")

# Debug-specific linker flags
string(APPEND CMAKE_EXE_LINKER_FLAGS_DEBUG
  " /DEBUG:FULL"
  " /SUBSYSTEM:CONSOLE"
  " /ASSEMBLYDEBUG"
  " /DEBUGTYPE:CV"
  " /GUARD:CF"
  " /GUARD:EHCONT"
  " /DYNAMICBASE"
  " /NXCOMPAT"
  " /MACHINE:X64"
)
