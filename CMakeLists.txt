# # OpenMP
OPTION (USE_OpenMP "Use OpenMP" ON)
IF(USE_OpenMP)
  FIND_PACKAGE(OpenMP)
  IF(OPENMP_FOUND)
    SET(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} ${OpenMP_C_FLAGS}")
    SET(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${OpenMP_CXX_FLAGS}")
  ENDIF()
ENDIF()

# # output directory
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/..)
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY_DEBUG ${CMAKE_BINARY_DIR}/..)
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY_RELEASE ${CMAKE_BINARY_DIR}/..)

set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/..)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY_DEBUG ${CMAKE_BINARY_DIR}/..)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY_RELEASE ${CMAKE_BINARY_DIR}/..)

set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/..)
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY_DEBUG ${CMAKE_BINARY_DIR}/..)
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY_RELEASE ${CMAKE_BINARY_DIR}/..)

# # python lib
set(PYTHON_INCLUDE_DIR "Path where python.h locates")

FIND_PACKAGE(PythonInterp)
FIND_PACKAGE(PythonLibs)

message(STATUS "PYTHON_INCLUDE_DIRS: " ${PYTHON_INCLUDE_DIRS})
message(STATUS "PYTHON_LIBRARIES: " ${PYTHON_LIBRARIES})
message(STATUS "PYTHON_LIB_VERSION: " ${PYTHONLIBS_VERSION_STRING})


# # boost libraries: python numpy (usually boost python should be linked dynamically)
set(Boost_USE_STATIC_LIBS        OFF)
set(Boost_USE_MULTITHREADED      ON)
set(Boost_USE_STATIC_RUNTIME     OFF)
find_package(Boost 1.65 COMPONENTS python3 numpy3 REQUIRED)
set(Boost_PY_LIBRARIES ${Boost_LIBRARIES})
message(status "** Boost_PY_Libraries: ${Boost_PY_LIBRARIES}")

# # other boost libraries 
set(Boost_USE_STATIC_LIBS        ON)
set(Boost_USE_MULTITHREADED      ON)
set(Boost_USE_STATIC_RUNTIME     OFF)
find_package(Boost 1.57 COMPONENTS thread system atomic date_time chrono REQUIRED)
message(status "**Boost_LIBRARIES: ${Boost_LIBRARIES}")



# # init_compiler_system
macro(init_compiler_system)
	if(WIN32)
		if(CMAKE_CONFIGURATION_TYPES)
			set(CMAKE_CONFIGURATION_TYPES Debug Release)
		 endif()
		add_definitions(-D_SCL_SECURE_NO_WARNINGS)
		add_definitions(-D_CRT_SECURE_NO_WARNINGS)
	endif(WIN32)

	if(UNIX)	
		add_definitions(-Wall)
		include(CheckCXXCompilerFlag)
		CHECK_CXX_COMPILER_FLAG(-std=c++11 HAVING_COMPILER_SUPPORTS_CXX11)
		if(HAVING_COMPILER_SUPPORTS_CXX11)
			add_definitions(-std=c++11)
		else(HAVING_COMPILER_SUPPORTS_CXX11)
			CHECK_CXX_COMPILER_FLAG(-std=c++0x HAVING_COMPILER_SUPPORTS_CXX0X)
			if(HAVING_COMPILER_SUPPORTS_CXX0X)
				add_definitions(-std=c++0x)
			else(HAVING_COMPILER_SUPPORTS_CXX0X)
				message(STATUS "The compiler ${CMAKE_CXX_COMPILER} has no C++11 support. Please use a different C++ compiler.")
			endif(HAVING_COMPILER_SUPPORTS_CXX0X)
		endif(HAVING_COMPILER_SUPPORTS_CXX11)
	endif(UNIX)
endmacro(init_compiler_system)
