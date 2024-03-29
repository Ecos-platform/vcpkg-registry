vcpkg_check_linkage(ONLY_STATIC_LIBRARY)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
	REPO markaren/serial
	REF d011f55e23acbd5b13c4f7ad5fbe4071f7372fe0
	SHA512 1d3b1575883b69523bc9b0ae415ae58c41b56aa911ac08f4ea72fef5c0961437a68738e09d2b4ad55c0e55bf48837189447ca80772f08e4e37f2d27d87552437
    HEAD_REF main
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS
		-DSERIAL_BUILD_EXAMPLES=OFF
)

vcpkg_cmake_install()
vcpkg_cmake_config_fixup()

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")

file(
	INSTALL "${SOURCE_PATH}/LICENSE" 
	DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}" 
	RENAME copyright)
