# Read the build.ninja file
$content = Get-Content build.ninja

# Define the replacements
$replacements = @(
    @{
        Pattern     = "^  DEFINES =.*"
        Replacement = "  DEFINES = -D_CRT_SECURE_NO_WARNINGS -DWIN32 -DUNICODE -D_CRT_NONSTDC_NO_DEPRECATE -D_CRT_NONSTDC_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_SECURE_NO_WARNINGS -D_GLIBCXX_ASSERTIONS -D_SCL_SECURE_NO_DEPRECATE -D_SCL_SECURE_NO_WARNINGS -D_UNICODE -D__STDC_CONSTANT_MACROS -D__STDC_FORMAT_MACROS -D__STDC_LIMIT_MACROS -D_DISABLE_VECTOR_ANNOTATION -D_DISABLE_STRING_ANNOTATION -D_DEBUG -D_DEBUG -D_DISABLE_VECTOR_ANNOTATION -D_DISABLE_STRING_ANNOTATION"
    }
    @{
        Pattern     = "^  FLAGS =.*"
        Replacement = "  FLAGS = /std:c++17 /Zi /permissive- /W0 /wd4141 /wd4146 /wd4244 /wd4267 /wd4291 /wd4351 /wd4456 /wd4457 /wd4458 /wd4459 /wd4503 /wd4624 /wd4722 /wd4100 /wd4127 /wd4512 /wd4505 /wd4610 /wd4510 /wd4702 /wd4245 /wd4706 /wd4310 /wd4701 /wd4703 /wd4389 /wd4611 /wd4805 /wd4204 /wd4577 /wd4091 /wd4592 /wd4319 /wd4709 /wd5105 /wd4324 /w14062 /we4238 /volatile:iso /Zc:inline /Zc:preprocessor /Zc:enumTypes /Zc:lambda /Zc:__cplusplus /Zc:externConstexpr /Zc:throwingNew /Zc:__STDC__ /utf-8 /Zc:wchar_t /Zc:char8_t /openmp /analyze- /WX- /EHsc /MP /FC /Ob0 /RTCsu /diagnostics:caret /external:W0 /FC /MP /Ob0 /fsanitize=address /fsanitize=fuzzer"
    }
    @{
        Pattern     = "^  LANGUAGE_COMPILE_FLAGS =.*"
        Replacement = "  LANGUAGE_COMPILE_FLAGS = /std:c++17 /Zi /permissive- /W0 /wd4141 /wd4146 /wd4244 /wd4267 /wd4291 /wd4351 /wd4456 /wd4457 /wd4458 /wd4459 /wd4503 /wd4624 /wd4722 /wd4100 /wd4127 /wd4512 /wd4505 /wd4610 /wd4510 /wd4702 /wd4245 /wd4706 /wd4310 /wd4701 /wd4703 /wd4389 /wd4611 /wd4805 /wd4204 /wd4577 /wd4091 /wd4592 /wd4319 /wd4709 /wd5105 /wd4324 /w14062 /we4238 /volatile:iso /Zc:inline /Zc:preprocessor /Zc:enumTypes /Zc:lambda /Zc:__cplusplus /Zc:externConstexpr /Zc:throwingNew /Zc:__STDC__ /utf-8 /Zc:wchar_t /Zc:char8_t /openmp /analyze- /WX- /EHsc /MP /FC /Ob0 /RTCsu /diagnostics:caret /external:W0 /FC /MP /Ob0"
    }
    @{
        Pattern     = "^  LINK_FLAGS =.*"
        Replacement = "  LINK_FLAGS = /INCREMENTAL /DEBUG:FULL /SUBSYSTEM:CONSOLE /ASSEMBLYDEBUG /DEBUGTYPE:CV /GUARD:CF /GUARD:EHCONT /DYNAMICBASE /NXCOMPAT /MACHINE:X64 /fsanitize=address /fsanitize=fuzzer /guard:cf /MP /external:W0 /FC /Ob0 /RTCsu /diagnostics:caret /FC /MP /Ob0"
    }
)

# Perform the replacements
$newContent = foreach ($line in $content) {
    $replaced = $false
    foreach ($replacement in $replacements) {
        if ($line -match $replacement.Pattern) {
            $line = $replacement.Replacement
            $replaced = $true
            break # Important: Exit inner loop after replacement
        }
    }
    $line # Output the (potentially modified) line
}

# Write the updated content back to the file (or a new file)
$newContent | Out-File -Encoding UTF8 build.ninja -Force