vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
	REPO markaren/threepp
	REF 81a520f26adfffa1c2185d5f9240f6eda007cf29
	SHA512 bc15559cf280d4842c8eefe3d9961907081a25af6f68414d7336664436bee55126340a50bb1acf6f2cac5cba7cdc4d4402a3ccff7863ba4934bf76a8f19d7528
    HEAD_REF prepare_package
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
