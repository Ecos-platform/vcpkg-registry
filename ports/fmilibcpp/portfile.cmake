vcpkg_check_linkage(ONLY_STATIC_LIBRARY)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
	REPO Ecos-platform/fmilib-cpp
	REF d634de11d766227d435bbf22147f8040ffc5b6b6
	SHA512 d3b175a411681dd185d6e2617b4ecef2a26c35037b2b739321e5fc217d122540c60e134da40f02dd41bc494ea8b9cda60ef352b4edc647c68acc446e04c692e9
    HEAD_REF vcpkg
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS
		-DFMILIBCPP_BUILD_TESTS=OFF
        -DFMILIBCPP_BUILD_EXAMPLES=OFF
)

vcpkg_cmake_install()
vcpkg_cmake_config_fixup()

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")

file(
	INSTALL "${SOURCE_PATH}/LICENSE" 
	DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}" 
	RENAME copyright)
