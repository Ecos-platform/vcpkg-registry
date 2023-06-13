vcpkg_check_linkage(ONLY_STATIC_LIBRARY)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
	REPO Ecos-platform/simple-ssp-parser
	REF 22ec3461d55c8b65a33c89ea11a20bf692176e27
	SHA512 e4f7c1e169b44914e30e11b770eaa2d62bef9306dbfc330296faa266d24ab84ce2e3fbf29d4febdc430fabb61df1600130206354d4366eccc6e4ee0cc961f1d0
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
