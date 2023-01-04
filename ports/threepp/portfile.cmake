vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
	REPO markaren/threepp
	REF e43b4b63701a313b4732789fedff9b3564ea07aa
	SHA512 9ca1a968b6c9bd9c6048f8b0829aee00dbeef0f907de6e674e79baf9b4ab80c73eb99a7b7579196cec6911b0265acb70ff0833db7e4c149e58454eaa4535d67b
    HEAD_REF master
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS
		-DTHREEPP_BUILD_TESTS=OFF
        -DTHREEPP_BUILD_EXAMPLES=OFF
)

vcpkg_cmake_install()

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")

file(
	INSTALL "${SOURCE_PATH}/LICENSE" 
	DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}" 
	RENAME copyright)
