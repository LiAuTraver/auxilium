#[===[===[
# ===------------------------------------------------------------------===#
#    Copyright (c) LiAuTraver, Licensed under Apache License 2.0          #
# ===------------------------------------------------------------------===#
#      ASAN enabled triplet for x64/windows (msvc) target                 #
#                  (eg, scnlib, llvm, etc)                                #
#      (some issues with them when using default settings)                #
# ===------------------------------------------------------------------===#
# NOTE: incompatible if using lld-link,  use link.exe instead             #
#        clang has limited support for asan debug build on windows        #
# ===------------------------------------------------------------------===#
# IMPORTANT:                                                              #
#            Only use this triplet for 64-bit windows target              #
# ===------------------------------------------------------------------===#
#===]===]

set(VCPKG_TARGET_ARCHITECTURE x64)
set(VCPKG_CRT_LINKAGE dynamic)
set(VCPKG_LIBRARY_LINKAGE dynamic)

message(STATUS "Using ASAN overlay triplet for x64-windows target...")

# Common flags for both C and C++ builds
set(COMMON_FLAGS
  " /nologo" # No logo
  " /utf-8" # UTF-8 source and execution
  " /Zc:wchar_t" # wchar_t is native type
  " /WX-" # No warnings as errors
  " /W0" # No warnings
  " /external:W0" # External headers no warnings
  " /permissive-" # Permissive mode
  " /analyze-" # Disable code analysis
  " /Qpar" # Parallel code generation
  " /DWIN32"
  " /DUNICODE"
  " /D_UNICODE"
  " /D_CRT_NONSTDC_NO_DEPRECATE"
  " /D_CRT_NONSTDC_NO_WARNINGS"
  " /D_CRT_SECURE_NO_DEPRECATE"
  " /D_CRT_SECURE_NO_WARNINGS"
  " /D__STDC_CONSTANT_MACROS"
  " /D__STDC_FORMAT_MACROS"
  " /D__STDC_LIMIT_MACROS"
  " /Zc:__STDC__" # Correct __STDC__ macro
  " /Zc:preprocessor" # Standard/conforming preprocessor
  " /volatile:iso" # ISO/compliant volatile
  " /Zc:inline" # Inline conformance
  " /Zc:enumTypes" # Enum type compliance
  " /diagnostics:caret" # Enhanced diagnostics if has error
)

foreach(flag ${COMMON_FLAGS})
  string(APPEND VCPKG_C_FLAGS ${flag})
  string(APPEND VCPKG_CXX_FLAGS ${flag})
endforeach()

# C++ specific flags
string(APPEND VCPKG_CXX_FLAGS
  " /D_ALLOW_ITERATOR_DEBUG_LEVEL_MISMATCH" # just in case when linking error happens
  " /Zc:lambda" # Lambda compliance
  " /Zc:__cplusplus" # Correct __cplusplus macro
  " /Zc:externConstexpr" # External constexpr
  " /Zc:throwingNew" # Throwing new behavior
  " /D_CRT_SECURE_NO_WARNINGS" # Disable CRT warnings
  " /Zc:char8_t" # char8_t is native type
  " /openmp" # OpenMP support
  " /EHsc" # Enable C++ EH with SEH exceptions
)

set(COMMON_DEBUG_FLAGS
  " /Zi" # Debug information format
  " /Od" # Disable optimization
  " /guard:cf" # Control Flow Guard
  " /MP" # Multi/process compilation(for big packages)
  " /Ob0" # Disable inlining
  " /D_DEBUG"
  " /DDEBUG"
  " /RTCsu" # Runtime checks
  " /fsanitize=address" # Address sanitizer

  # " /fsanitize=fuzzer" # Fuzzer sanitizer # llvm fails to link. :(
)

foreach(flag ${COMMON_DEBUG_FLAGS})
  string(APPEND VCPKG_C_FLAGS_DEBUG ${flag})
  string(APPEND VCPKG_CXX_FLAGS_DEBUG ${flag})
endforeach()

# Debug specific flags
string(APPEND VCPKG_CXX_FLAGS_DEBUG
  " /GR" # Enable RTTI
  " /guard:ehcont" # EH Continuation metadata
  " /D_DISABLE_VECTOR_ANNOTATION"
  " /D_DISABLE_STRING_ANNOTATION"
)

# Linker flags for all builds
string(APPEND VCPKG_LINKER_FLAGS
  " /NOLOGO" # No logo
  " /ERRORREPORT:PROMPT" # Error report prompt
  " /MACHINE:X64" # x64 target
)

# Debug specific linker flags
string(APPEND VCPKG_LINKER_FLAGS_DEBUG

  " /DEBUG:FULL" # Full debug information
  " /ASSEMBLYDEBUG" # Assembly debug information
  " /DEBUGTYPE:CV" # Debug information for symbols and line numbers
  " /GUARD:CF" # Control Flow Guard
  " /GUARD:EHCONT" # EH Continuation metadata
  " /DYNAMICBASE" # Dynamic base address
  " /NXCOMPAT" # NX compatibility
  " /INCREMENTAL" # Incremental linking(seems not needed)

  # " /SUBSYSTEM:CONSOLE" # Console subsystem, (not needed maybe)
  # no need to pass /fsanitize=..., in msvc just pass them to compiler
)
