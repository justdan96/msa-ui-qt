set(CPACK_PACKAGE_NAME "msa-ui-qt")
set(CPACK_PACKAGE_VENDOR "mcpelauncher")
set(CPACK_PACKAGE_VERSION "${MANIFEST_GIT_COMMIT_HASH}")
set(CPACK_PACKAGE_DESCRIPTION_SUMMARY "UI helper for the Microsoft Account login daemon")
set(CPACK_PACKAGE_CONTACT "https://github.com/minecraft-linux/msa-manifest/issues")
set(CPACK_GENERATOR "TGZ;DEB")
set(CPACK_INSTALL_CMAKE_PROJECTS "${CMAKE_CURRENT_BINARY_DIR};msa-ui-qt;msa-ui-qt;/")
set(CPACK_OUTPUT_CONFIG_FILE CPackConfig.cmake)
if (DEB_XENIAL_DEPENDENCIES)
    set(CPACK_DEBIAN_PACKAGE_DEPENDS "libc6 (>=2.14), qt59base")
else()
    set(CPACK_DEBIAN_PACKAGE_DEPENDS "libc6 (>=2.14), libqt5widgets5, libqt5webenginewidgets5")
endif()
set(CPACK_DEBIAN_PACKAGE_VERSION "${BUILD_TIMESTAMP}-${MANIFEST_GIT_COMMIT_HASH}")

include(CPack)
