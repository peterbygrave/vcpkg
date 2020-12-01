# Automatically generated by boost-vcpkg-helpers/generate-ports.ps1

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO boostorg/thread
    REF boost-1.74.0
    SHA512 2b5c4ade98dfa0cefeb0571f931952b317c94ec5cc07d0539efc6e36976da0108f165802d2f732857485f0ec3d352707e8be4f335ce1a2cb692bdb3d8746176a
    HEAD_REF master
)

include(${CURRENT_INSTALLED_DIR}/share/boost-build/boost-modular-build.cmake)
boost_modular_build(
    SOURCE_PATH ${SOURCE_PATH}
    BOOST_CMAKE_FRAGMENT "${CMAKE_CURRENT_LIST_DIR}/b2-options.cmake"
)
include(${CURRENT_INSTALLED_DIR}/share/boost-vcpkg-helpers/boost-modular-headers.cmake)
boost_modular_headers(SOURCE_PATH ${SOURCE_PATH})
