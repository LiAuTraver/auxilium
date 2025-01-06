### Copyright (c) LiAuTraver, Licensed under MIT.
### ASAN enabled triplet for x64-windows (msvc) target fix (eg, scnlib)

#   to enable AddressSanitizer(some issues with them when using default settings)
set(VCPKG_TARGET_ARCHITECTURE x64)
set(VCPKG_CRT_LINKAGE dynamic)
set(VCPKG_LIBRARY_LINKAGE dynamic)

set(VCPKG_C_FLAGS "/guard:ehcont /D_DISABLE_VECTOR_ANNOTATION /D_DISABLE_STRING_ANNOTATION")
set(VCPKG_CXX_FLAGS "/guard:ehcont /D_DISABLE_VECTOR_ANNOTATION /D_DISABLE_STRING_ANNOTATION")