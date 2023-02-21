vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
	REPO markaren/threepp
	REF 1e215030b201d3d2108c3efcd5bcaa02562a0a96
	SHA512 3af32b2f9d0eb9c22031f16cd1f9ce1de90ba268c65b91ff8a1ec9721dd1db2d859ee71206a2132ee4b66cf09d4ab56d95ef68acade09d37672df7e53ec2e6ec
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
