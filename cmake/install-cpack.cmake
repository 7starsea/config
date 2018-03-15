

if(WIN32)
    
    # set(CMAKE_INSTALL_SYSTEM_RUNTIME_LIBS_SKIP TRUE)
    INCLUDE(InstallRequiredSystemLibraries)
    # install(FILES ${CMAKE_INSTALL_SYSTEM_RUNTIME_LIBS} DESTINATION .)
    
    SET(CPACK_PACKAGE_DESCRIPTION_SUMMARY "Description this is my project")
    SET(CPACK_PACKAGE_VENDOR "me, I")
    #SET(CPACK_PACKAGE_DESCRIPTION_FILE "${CMAKE_CURRENT_SOURCE_DIR}/ReadMe.txt")
    #SET(CPACK_RESOURCE_FILE_LICENSE "${CMAKE_CURRENT_SOURCE_DIR}/Copyright.txt")
    SET(CPACK_PACKAGE_VERSION_MAJOR "1")
    SET(CPACK_PACKAGE_VERSION_MINOR "0")
    SET(CPACK_PACKAGE_VERSION_PATCH "0")
    # SET(CPACK_PACKAGE_INSTALL_DIRECTORY "${PROJECT_NAME}")
 
    
    # set(CPACK_PACKAGE_FILE_NAME "${CPACK_PACKAGE_NAME}-installer")
    
    # SET(CPACK_NSIS_EXTRA_INSTALL_COMMANDS "
     # CreateShortCut \\\"$DESKTOP\\\\${CMAKE_PROJECT_NAME}.lnk\\\" \\\"$INSTDIR\\\\${TARGET_NAME}.exe\\\"
    # ")
    # SET(CPACK_NSIS_EXTRA_UNINSTALL_COMMANDS "
     # Delete \\\"$DESKTOP\\\\${CMAKE_PROJECT_NAME}.lnk\\\"
    # ")
    
    # There is a bug in NSI that does not handle full unix paths properly. Make
    # sure there is at least one set of four (4) backlasshes.
    SET(CPACK_NSIS_MUI_ICON "project.ico")
    SET(CPACK_NSIS_INSTALLED_ICON_NAME "project.ico.ico")
    set(CPACK_NSIS_INSTALL_ROOT "C:\\\\Program Files")
    SET(CPACK_NSIS_DISPLAY_NAME "MyProject")
    # SET(CPACK_NSIS_HELP_LINK "http:\\\\\\\\www.my-project-home-page.org")
    # SET(CPACK_NSIS_URL_INFO_ABOUT "http:\\\\\\\\www.my-personal-home-page.com")
    SET(CPACK_NSIS_CONTACT "example@my-project.com")
    SET(CPACK_NSIS_MODIFY_PATH OFF)

    # # 
    INSTALL(TARGETS my_target DESTINATION .)
    
    # # Install Related Qt dll
    get_target_property(QtCore_LOCATION Qt5::Core LOCATION)
    get_filename_component(QT_DLL_DIR ${QtCore_LOCATION} PATH)
    # message(STATUS "QT_DLL_DIR:" ${QT_DLL_DIR})
    install(FILES
      ${QT_DLL_DIR}/icudt54.dll
      ${QT_DLL_DIR}/icuin54.dll
      ${QT_DLL_DIR}/icuuc54.dll
      ${QT_DLL_DIR}/libEGL.dll
      ${QT_DLL_DIR}/libGLESv2.dll
      
      ${QT_DLL_DIR}/Qt5Multimedia.dll
      ${QT_DLL_DIR}/Qt5Network.dll
      ${QT_DLL_DIR}/Qt5Nfcd.dll
      
      ${QT_DLL_DIR}/Qt5Core.dll
      ${QT_DLL_DIR}/Qt5Gui.dll
      ${QT_DLL_DIR}/Qt5Widgets.dll
      DESTINATION .
    )
    # Qt Platform Plugin
    install(FILES
      ${QT_DLL_DIR}/../plugins/platforms/qwindows.dll
      DESTINATION platforms
    )

    INCLUDE(CPack)
endif()