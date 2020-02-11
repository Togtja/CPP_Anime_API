# Set some FETCH CONTENT variables to ensure we don't over-download content

include(FetchContent)
set(FETCHCONTENT_QUIET OFF)

include(libcurl.cmake)
include(curlpp.cmake)

# Set FC to be disconnected so we stop downloading
set(FETCHCONTENT_FULLY_DISCONNECTED ON CACHE BOOL "This has been reset to ON (set to OFF to download again)" FORCE)