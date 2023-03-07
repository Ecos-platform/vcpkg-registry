vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
	REPO markaren/threepp
	REF fa8bf05d07411a1ee045e87073d289851aa674f7
	SHA512 4e462e9db9e6beda2c16cd38a6409ab91f5219bf2b8d00c2a9900664f7451288e5dc4be0e74a45237ea3301f23a0b59b7bb69805c8a6fa3d4bc597218aed8218
    HEAD_REF master
)

vcpkg_from_github(
    OUT_SOURCE_PATH GLTEXT_SOURCE_DIR
    REPO vallentin/glText
    REF 8200fa70e32acec0a3cd777d404f41ee0c203ca4
    SHA512 1c17516f4a7d26448a61d96d0b9e6d005fff291e66c46947530be4838d5219112efab8d8c6b01e5e7d8ba88c7a0dacda7cafc324d4e78f5ae0bdf33edf21b29d
    HEAD_REF dev
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
