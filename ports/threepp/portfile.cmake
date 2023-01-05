vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
	REPO markaren/threepp
	REF 63524ffdfe06a103ed3d10e5d1c4f36759f57869
	SHA512 2d5722b62d52a845eed9c0cb6ebbe6c200677138d1448be8ae653e48eb9c1cba44041603f365be499c5abec6a94dbad2d83edf9fd1f113fcb14edb3f0f7ebda0
    HEAD_REF vcpkg_test
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
