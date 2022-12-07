vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
	REPO markaren/threepp
	REF e210b3b15700bfb6f4b4c65337d3c9f800bd00b5
	SHA512 bdce7f0f2c8d7669cce679e02e912c898266751933aefebfc1913422a88ef53992cd46de46cddbda962c89f7bd68892680b44e3a091d8e7f4f444d7bcefe7055
    HEAD_REF dev
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
