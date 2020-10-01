include(vcpkg_common_functions)

vcpkg_from_gitlab(
    GITLAB_URL https://gitlab.com
    OUT_SOURCE_PATH SOURCE_PATH
    REPO conradsnicta/armadillo-code
    REF e41727b98c4211e125cd623074b76c6c7f7c03f4 
    SHA512 95759fe724a7388abcf42a75f6c531766f95173b38476fdc3cd7959b92a525d6f15ba40e84e743d79ccd4c808f7474291302464d79076b8801d2d4876b70035c
    HEAD_REF 9.900.x
#    PATCHES
#        remove_custom_modules.patch
#        fix-CMakePath.patch
#        add-disable-find-package.patch
)

file(REMOVE ${SOURCE_PATH}/cmake_aux/Modules/ARMA_FindBLAS.cmake)
file(REMOVE ${SOURCE_PATH}/cmake_aux/Modules/ARMA_FindLAPACK.cmake)
file(REMOVE ${SOURCE_PATH}/cmake_aux/Modules/ARMA_FindOpenBLAS.cmake)

vcpkg_check_features(OUT_FEATURE_OPTIONS FEATURE_OPTIONS
  FEATURES # <- Keyword FEATURES is required because INVERTED_FEATURES are being used
    wrapper   ARMA_USE_WRAPPER
)

vcpkg_configure_cmake(
    SOURCE_PATH ${SOURCE_PATH}
    DISABLE_PARALLEL_CONFIGURE
    PREFER_NINJA
    OPTIONS
        -DDETECT_HDF5=false
        ${FEATURE_OPTIONS}
        -DCMAKE_DISABLE_FIND_PACKAGE_SuperLU=ON
        -DCMAKE_DISABLE_FIND_PACKAGE_ACML=ON
        -DCMAKE_DISABLE_FIND_PACKAGE_ACMLMP=ON
        -DCMAKE_DISABLE_FIND_PACKAGE_ARPACK=ON
        -DCMAKE_DISABLE_FIND_PACKAGE_ATLAS=ON
        -DCMAKE_DISABLE_FIND_PACKAGE_MKL=ON
)

vcpkg_install_cmake()
vcpkg_fixup_cmake_targets(CONFIG_PATH share/Armadillo/CMake TARGET_PATH share/Armadillo)

vcpkg_copy_pdbs()

file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/debug/include)
file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/debug/share)

file(GLOB SHARE_CONTENT ${CURRENT_PACKAGES_DIR}/share/Armadillo)
list(LENGTH SHARE_CONTENT SHARE_LEN)
if(SHARE_LEN EQUAL 0)
    # On case sensitive file system there is an extra empty directory created that should be removed
    file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/share/Armadillo)
endif()

file(COPY ${CMAKE_CURRENT_LIST_DIR}/usage DESTINATION ${CURRENT_PACKAGES_DIR}/share/${PORT})
file(INSTALL ${SOURCE_PATH}/LICENSE.txt  DESTINATION ${CURRENT_PACKAGES_DIR}/share/${PORT} RENAME copyright)
