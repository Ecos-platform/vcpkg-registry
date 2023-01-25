vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
	REPO markaren/threepp
	REF 82562cdd25a877c334d87914cb6cb58427504b59
	SHA512 3bea6fc06366e0c4d15c903d5cc3163c319e3a7d61a10d0b3e8c7c2552574c3dca7684fc9ef093a448a57ee8b33b35109a4b6c716bfbe1174be9e819a9aa926f
    HEAD_REF vcpkg_test
)

vcpkg_from_github(
    OUT_SOURCE_PATH GLTEXT_SOURCE_DIR
    REPO https://github.com/vallentin/glText.git
    REF 8200fa70e32acec0a3cd777d404f41ee0c203ca4
    SHA512 f611326d75d6e87e58cb05e91f9506b1d83e6fd3b214fe311c4c15604feabfb7a18bbf9c4b4c389a39d615eb468b1f4b15802ab9f44f334a12310cb183fa77a7
    HEAD_REF master
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS
		-DTHREEPP_BUILD_TESTS=OFF
        -DTHREEPP_BUILD_EXAMPLES=OFF
		-Dgltext_SOURCE_DIR=${GLTEXT_SOURCE_DIR}
)

vcpkg_cmake_install()
vcpkg_fixup_cmake_targets()

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")

file(
	INSTALL "${SOURCE_PATH}/LICENSE" 
	DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}" 
	RENAME copyright)
