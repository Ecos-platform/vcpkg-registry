vcpkg_check_linkage(ONLY_STATIC_LIBRARY)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
	REPO Ecos-platform/proxy-fmu
	REF 1fdeadc1e9f4dabf31986ea2e51ec06d5afe27f6
	SHA512 e65a7145bf7397015c771799d8744648fb9378a99ddae88c354853f2ac7eb0b1b4225a36d3c316c07d642f501f925cb6d5f59907782a83c553d55d666fab000c
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
