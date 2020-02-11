# Set up EnTT, either by finding the package directly, or by fetching it from GitHub
message(STATUS "Could not find CurlCpp package so we are getting it from GitHub instead.")

# Declare where to find EnTT and what version to use
FetchContent_Declare(
    curlpp_external
    GIT_REPOSITORY https://github.com/jpbarrette/curlpp.git
    GIT_TAG v0.8.1
    GIT_PROGRESS TRUE
)

# Populate it for building
FetchContent_MakeAvailable(curlpp_external)
