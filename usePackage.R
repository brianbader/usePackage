## Function that checks if a package is installed and if not, installs it
## Then loads all requested packages using 'require' command
usePackage <- function(p) {
  newPackages <- p[!(p %in% installed.packages()[, "Package"])]
  if(length(newPackages))
    install.packages(newPackages, dependencies = TRUE)
  cat("Packages successfully loaded:\n")
  sapply(p, require, character.only = TRUE, quietly = TRUE)
}

## Example
packageList <- c("dplyr", "boot", "random")
!is.element(packageList, installed.packages()[, "Package"])
usePackage(packageList)
