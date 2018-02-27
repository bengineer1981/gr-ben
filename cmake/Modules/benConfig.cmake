INCLUDE(FindPkgConfig)
PKG_CHECK_MODULES(PC_BEN ben)

FIND_PATH(
    BEN_INCLUDE_DIRS
    NAMES ben/api.h
    HINTS $ENV{BEN_DIR}/include
        ${PC_BEN_INCLUDEDIR}
    PATHS ${CMAKE_INSTALL_PREFIX}/include
          /usr/local/include
          /usr/include
)

FIND_LIBRARY(
    BEN_LIBRARIES
    NAMES gnuradio-ben
    HINTS $ENV{BEN_DIR}/lib
        ${PC_BEN_LIBDIR}
    PATHS ${CMAKE_INSTALL_PREFIX}/lib
          ${CMAKE_INSTALL_PREFIX}/lib64
          /usr/local/lib
          /usr/local/lib64
          /usr/lib
          /usr/lib64
)

INCLUDE(FindPackageHandleStandardArgs)
FIND_PACKAGE_HANDLE_STANDARD_ARGS(BEN DEFAULT_MSG BEN_LIBRARIES BEN_INCLUDE_DIRS)
MARK_AS_ADVANCED(BEN_LIBRARIES BEN_INCLUDE_DIRS)

