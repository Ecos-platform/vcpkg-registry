vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
	REPO markaren/threepp
	REF 91b4d1bdca56cbf47d35759c51b8df9b048d7fcd
	SHA512 8f9d1b3614132491ee0ea80334a75f7880ee42d5e5b37dce18a0df4a25f7c84977112117721ace7a095dc094288725a52da67f8b3fb049cf90a1411c28d64fc9
    HEAD_REF dev
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS 
	-DTHREEPP_BUILD_TESTS=OFF 
	-DTHREEPP_BUILD_EXAMPLES=OFF
)

vcpkg_cmake_install()
vcpkg_fixup_cmake_targets()

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")

file(
	INSTALL "${SOURCE_PATH}/LICENSE" 
	DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}" 
	RENAME copyright)
	
file(INSTALL "${CMAKE_CURRENT_LIST_DIR}/usage" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}")
