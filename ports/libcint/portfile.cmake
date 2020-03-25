vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO peterbygrave/libcint
    REF v3.0.19
#    SHA512 8709290324c0556ccfbd5d09dc3b71a2057b3748eed94e52704450c0e97532532b03fb0a8dc7c7deadf1ddcba6cff486f9f5cdcf0aa76a406c317a9348a6c850
    SHA512 cb45b4aae9b56f5b8715004457beeacc197a6e2dfaba7a5a4c5e70e8fffa704e1327f45da5fa8be6c646aa87e489cb57987bd9aa00e30053822babc98d2fe94d
    HEAD_REF master
)

vcpkg_configure_cmake(
    SOURCE_PATH ${SOURCE_PATH}
    PREFER_NINJA
)

vcpkg_install_cmake()
file(INSTALL ${SOURCE_PATH}/LICENSE DESTINATION ${CURRENT_PACKAGES_DIR}/share/libcint RENAME copyright)
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")

