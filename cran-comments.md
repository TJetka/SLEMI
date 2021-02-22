## This is a new release.

## Test environments
* local R installation, R 4.0.3
* R-hub windows-x86_64-devel (r-devel)
* R-hub ubuntu-gcc-release (r-release)
* R-hub fedora-clang-devel (r-devel)
* win-builder (devel)
* GitHub CI (windows-latest (release),macOS-latest (release),ubuntu-20.04 (release), ubuntu-20.04 (devel))

## Main change
Repaired consistency with ggplot2.

## R CMD check results

### local R CMD check --as-cran
Status: OK

### win-builder devel
Installation time in seconds: 11
Check time in seconds: 183
Status: OK
R Under development (unstable) (2021-02-20 r80030)
log files: https://win-builder.r-project.org/eOay5h9U24C0

### R-hub check results
-- SLEMI 1.0.1: OK
  Build ID:   SLEMI_1.0.1.tar.gz-6daa0e1308ef4d9a94b04dd3020b4191
  Platform:   Windows Server 2008 R2 SP1, R-devel, 32/64 bit
  Submitted:  4h 25m 20s ago
  Build time: 3m 49.4s
0 errors | 0 warnings | 0 notes

-- SLEMI 1.0.1: OK
  Build ID:   SLEMI_1.0.1.tar.gz-0c62daa061ec4d408deee4ce87117e49
  Platform:   Ubuntu Linux 16.04 LTS, R-release, GCC
  Submitted:  4h 25m 20s ago
  Build time: 42m 43.5s
0 errors | 0 warnings ??? | 0 notes

-- SLEMI 1.0.1: OK
  Build ID:   SLEMI_1.0.1.tar.gz-9e64ad1bea1b40c188bb3d73f16331bb
  Platform:   Fedora Linux, R-devel, clang, gfortran
  Submitted:  4h 25m 20s ago
  Build time: 50m 1.6s
0 errors | 0 warnings | 0 notes
