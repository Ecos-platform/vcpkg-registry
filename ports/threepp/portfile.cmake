vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
	REPO markaren/threepp
	REF e2d57607eebd931ab3cf422f092b36781e2fb6fe
	SHA512 a10db60f2b5e4e93d02eef79b7f0752eb7724a7152fe0f365620ad7017034d1d116b89dadcdd7c7b743e0dfaa2dcb79e9c13f9259b772bd8df77ad8d30a37169
    HEAD_REF dev
)

vcpkg_from_github(
    OUT_SOURCE_PATH GLTEXT_SOURCE_DIR
    REPO vallentin/glText
    REF 8200fa70e32acec0a3cd777d404f41ee0c203ca4
    SHA512 1c17516f4a7d26448a61d96d0b9e6d005fff291e66c46947530be4838d5219112efab8d8c6b01e5e7d8ba88c7a0dacda7cafc324d4e78f5ae0bdf33edf21b29d
    HEAD_REF master
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS
		-DTHREEPP_BUILD_TESTS=OFF
        -DTHREEPP_BUILD_EXAMPLES=OFF
		-DTHREEPP_BUILD_EXAMPLE_PROJECTS=OFF
		-DFETCHCONTENT_SOURCE_DIR_GLTEXT=${GLTEXT_SOURCE_DIR}
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
