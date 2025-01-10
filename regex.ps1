<#
.SYNOPSIS
    A custom regex script to replace specific lines in build.ninja files.
#>

# Back up the original file
Copy-Item build.ninja build.ninja.bak -Force

# Read the build.ninja file
$content = Get-Content build.ninja

# Define the replacements
$replacements = @(
    @{
        Pattern     = "^  DEFINES =.*"
        Replacement = "  TODO: Add your replacement here"
    }
    @{
        Pattern     = "^  FLAGS =.*"
        Replacement = "  TODO: Add your replacement here"
    }
    @{
        Pattern     = "^  LANGUAGE_COMPILE_FLAGS =.*"
        Replacement = "  TODO: Add your replacement here"
    }
    @{
        Pattern     = "^  LINK_FLAGS =.*"
        Replacement = "  TODO: Add your replacement here"
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