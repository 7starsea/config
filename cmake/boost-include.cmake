

set(BOOST_ROOt "")
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

