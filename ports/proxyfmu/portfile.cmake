vcpkg_check_linkage(ONLY_STATIC_LIBRARY)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
	REPO Ecos-platform/proxy-fmu
	REF 1fdeadc1e9f4dabf31986ea2e51ec06d5afe27f6
	SHA512 c61aa1e60e410269e227e3305570f1a3f9f0da2f3ef60c72786f6cfdbee897d3b4b857d4faccecb29b153083ecb04e234318ea6eaba4cc59976bdfdf208f9c0e
    HEAD_REF vcpkg
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS
		-DPROXYFMU_BUILD_TESTS=OFF
		-DPROXYFMU_BUILD_EXAMPLES=OFF
)

vcpkg_cmake_install()
vcpkg_cmake_config_fixup()

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")

file(
	INSTALL "${SOURCE_PATH}/LICENSE" 
	DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}" 
	RENAME copyright)
