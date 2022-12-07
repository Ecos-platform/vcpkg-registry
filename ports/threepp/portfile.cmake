vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
	REPO markaren/threepp
	REF 0cd0b155f4c9b8270d39adbb9f3e2bf0ea6a40e1
	SHA512 735f5d26aad45fe4ec31a63b4dc0b4dad3b0b81d310af6cdcfd9b45e1ec35ff8c97eca4538cc0994c9d2cc3d4581874fee59cb67e2658f973fccae00069052b4
    HEAD_REF master
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS
        -DTHREEPP_BUILD_EXAMPLES=OFF
)

vcpkg_cmake_install()
vcpkg_cmake_config_fixup()

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")

file(
INSTALL "${SOURCE_PATH}/LICENSE" 
DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}" 
RENAME copyright)
