vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
	REPO markaren/threepp
	REF c93848b33003ead25f5eaea3cd77fbe90f47fedc
	SHA512 c0018be05b94dd6484fc7eacb027c4da2b0281e3b828ddbc204b097853908bbe2e7d6ab648ee559ef3fe638486ffccbb483e504218c32e208eec5ba155f2e008
    HEAD_REF master
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
