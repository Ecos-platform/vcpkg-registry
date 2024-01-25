vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
	REPO markaren/threepp
	REF f4089e95338d7cea30eee1706003a4ca53c9b491
	SHA512 a91d61c0fb5cf30fd590e5e5b43f368be4ac1c4f50ff80efe3aebaff837d8f98c9fbe67321fd1672260ba9d60edcd78f654aaca88515cdd3edf7b7d247920484
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
