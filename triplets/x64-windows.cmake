# ## Copyright (c) LiAuTraver, Licensed under MIT.
# ## ASAN enabled triplet for x64/windows (msvc) target fix (eg, scnlib)

# to enable AddressSanitizer(some issues with them when using default settings)
set(VCPKG_TARGET_ARCHITECTURE x64)
set(VCPKG_CRT_LINKAGE dynamic)
set(VCPKG_LIBRARY_LINKAGE dynamic)

string(APPEND VCPKG_C_FLAGS
  " /utf-8" # UTF-8 source and execution
  " /Zc:wchar_t" # wchar_t is native type
  " /WX-" # No warnings as errors
  " /permissive-" # Permissive mode
  " /W0"
  " /DWIN32"
  " /DUNICODE"
  " /D_CRT_NONSTDC_NO_DEPRECATE"
  " /D_CRT_NONSTDC_NO_WARNINGS"
  " /D_CRT_SECURE_NO_DEPRECATE"
  " /D_CRT_SECURE_NO_WARNINGS"
  " /D_SCL_SECURE_NO_DEPRECATE"
  " /D_SCL_SECURE_NO_WARNINGS"
  " /D_UNICODE"
  " /D__STDC_CONSTANT_MACROS"
  " /D__STDC_FORMAT_MACROS"
  " /D__STDC_LIMIT_MACROS"
)

# General C++ flags for all builds
string(APPEND VCPKG_CXX_FLAGS
  " /permissive-"
  " /DWIN32"
  " /DUNICODE"
  " /D_CRT_NONSTDC_NO_DEPRECATE"
  " /D_CRT_NONSTDC_NO_WARNINGS"
  " /D_CRT_SECURE_NO_DEPRECATE"
  " /D_CRT_SECURE_NO_WARNINGS"
  " /D_GLIBCXX_ASSERTIONS"
  " /D_SCL_SECURE_NO_DEPRECATE"
  " /D_SCL_SECURE_NO_WARNINGS"
  " /D_UNICODE"
  " /D__STDC_CONSTANT_MACROS"
  " /D__STDC_FORMAT_MACROS"
  " /D__STDC_LIMIT_MACROS"
  " /volatile:iso" # ISO/compliant volatile
  " /Zc:inline" # Inline conformance
  " /Zc:preprocessor" # Standard/conforming preprocessor
  " /Zc:enumTypes" # Enum type compliance
  " /Zc:lambda" # Lambda compliance
  " /Zc:__cplusplus" # Correct __cplusplus macro
  " /Zc:externConstexpr" # External constexpr
  " /Zc:throwingNew" # Throwing new behavior
  " /Zc:__STDC__" # Correct __STDC__ macro
  " /D_CRT_SECURE_NO_WARNINGS" # Disable CRT warnings
  " /utf-8" # UTF-8 source and execution
  " /Zc:wchar_t" # wchar_t is native type
  " /Zc:char8_t" # char8_t is native type
  " /openmp" # OpenMP support
  " /analyze-" # Disable code analysis
  " /WX-" # No warnings as errors
  " /EHsc" # Enable C++ EH with SEH exceptions
  " /W0"
)
string(APPEND VCPKG_C_FLAGS_DEBUG
  " /Zi" # Debug information format
  " /Od" # Disable optimization
  " /fsanitize=address" # Address sanitizer
  " /fsanitize=fuzzer" # Fuzzer sanitizer
  " /guard:cf" # Control Flow Guard
  " /MP" # Multi/process compilation
  " /external:W0" # External headers warning level
  " /FC" # Full path in diagnostics
  " /Ob0" # Disable inlining
  " /D_DISABLE_VECTOR_ANNOTATION"
  " /D_DISABLE_STRING_ANNOTATION"
  " /D_DEBUG"
  " /DDEBUG"
)

# Debug/specific flags
string(APPEND VCPKG_CXX_FLAGS_DEBUG
  " /Zi" # Debug information format
  " /Od" # Disable optimization
  " /GR" # Enable RTTI
  " /fsanitize=address" # Address sanitizer
  " /fsanitize=fuzzer" # Fuzzer sanitizer
  " /guard:cf" # Control Flow Guard
  " /guard:ehcont" # EH Continuation metadata
  " /RTCsu" # Runtime checks
  " /diagnostics:caret" # Enhanced diagnostics
  " /MP" # Multi/process compilation
  " /external:W0" # External headers warning level
  " /FC" # Full path in diagnostics
  " /Ob0" # Disable inlining
  " /D_DISABLE_VECTOR_ANNOTATION"
  " /D_DISABLE_STRING_ANNOTATION"
)

# Linker flags for all builds
set(CMAKE_EXE_LINKER_FLAGS "/INCREMENTAL")

# Debug/specific linker flags
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
