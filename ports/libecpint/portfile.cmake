vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO peterbygrave/libecpint
    REF v0.0.0
    SHA512 e3f30c4a31987af179db419e796bca4297348c9b446b4282c6b96ec51ff5f86f1a02103de283e58da0913eca0f51db47876fd2e1c81e509792841ba2fb712057
    HEAD_REF master
    PATCHES
	remove-shared.patch
)

vcpkg_configure_cmake(
    SOURCE_PATH ${SOURCE_PATH}
    PREFER_NINJA
)
vcpkg_install_cmake()
file(INSTALL ${SOURCE_PATH}/LICENSE DESTINATION ${CURRENT_PACKAGES_DIR}/share/libecpint RENAME copyright)
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")

