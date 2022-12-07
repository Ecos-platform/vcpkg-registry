vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
	REPO markaren/threepp
	REF e210b3b15700bfb6f4b4c65337d3c9f800bd00b5
	SHA512 ccd7a8ebf24bb8afcbc02a7fd913ca242c464392b068f83dbc1779c472bc27004a464b2167bb9c1b5f48a04183d751a890c11c304a0612021750acf7bd0a716a
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
