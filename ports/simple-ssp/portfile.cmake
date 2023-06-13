vcpkg_check_linkage(ONLY_STATIC_LIBRARY)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
	REPO Ecos-platform/simple-ssp-parser
	REF b17602f79078a3d8280ce1fdcf62db3c78e0f303
	SHA512 71e7adedc7b901855b87e49e8b3302740d7974217e720c2ab0f0f3f2a1576d3bd64b633950c630124bc153cd555bd633a145270ff10aef1b8ec4c75aff14b2cc
    HEAD_REF vcpkg
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS
		-DSSP_BUILD_TESTS=OFF
)

vcpkg_cmake_install()
vcpkg_cmake_config_fixup()

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")

file(
	INSTALL "${SOURCE_PATH}/LICENSE" 
	DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}" 
	RENAME copyright)
