vcpkg_check_linkage(ONLY_STATIC_LIBRARY)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
	REPO Ecos-platform/fmilib-cpp
	REF 41f92dadb5dc7980b4025ab3028b457f25044bdb
	SHA512 8f28ce3120d7bd277360adea593c8048b69cb069cf44774d207f0b312710e0120399fa10d56edb088b53d0ebe4dafaff9b36065a129e63307cb17bf1cd5b6cf9
    HEAD_REF vcpkg
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS
		-DFMILIBCPP_BUILD_TESTS=OFF
        -DFMILIBCPP_BUILD_EXAMPLES=OFF
)

vcpkg_cmake_install()
vcpkg_cmake_config_fixup()

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")

file(
	INSTALL "${SOURCE_PATH}/LICENSE" 
	DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}" 
	RENAME copyright)
