
set(BORLAND TRUE)
set(OLD_BORLAND TRUE)

set(CMAKE_CROSSCOMPILING FALSE)

add_definitions(-DBORLAND -DOLD_BORLAND)

get_filename_component(here "${CMAKE_CURRENT_LIST_FILE}" PATH)
get_filename_component(bc45 "${here}" PATH)
get_filename_component(bc45 "${bc45}" PATH)
get_filename_component(bc45 "${bc45}" PATH)
set(bc45 "${bc45}/_tools/borland45")
set(bcc32 "${here}/bcc32.cmd")
set(tlib "${here}/tlib.cmd")

set(CMAKE_SYSTEM_NAME Windows)
set(CMAKE_SYSTEM_PROCESSOR i386)

set(CMAKE_C_COMPILER "${bcc32}")
set(CMAKE_CXX_COMPILER "${bcc32}")
set(CMAKE_C_COMPILER_ID_RUN TRUE)
set(CMAKE_CXX_COMPILER_ID_RUN TRUE)
set(CMAKE_C_ABI_COMPILED TRUE)
set(CMAKE_CXX_ABI_COMPILED TRUE)
set(CMAKE_C_COMPILER_ID BC45)
set(CMAKE_CXX_COMPILER_ID BC45)
set(CMAKE_C_COMPILER_VERSION "4.5")
set(CMAKE_CXX_COMPILER_VERSION "4.5")
set(CMAKE_C_COMPILER_WORKS TRUE)
set(CMAKE_CXX_COMPILER_WORKS TRUE)

set(CMAKE_FIND_ROOT_PATH "${bc45}")
set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ONLY)

set(CMAKE_C_FLAGS_INIT "-I${bc45}/include -d")
set(CMAKE_C_FLAGS_DEBUG_INIT "-N -Od -R -rd -v -y")
set(CMAKE_C_FLAGS_RELEASE_INIT "-DNDEBUG -O2 -Oa -Ob -Oc -Oe -Og -Oi -Ol -Om -Op -Ot -Ov -Ox -r -Z -G")
set(CMAKE_CXX_FLAGS_INIT "-I${bc45}/include -d -P")
set(CMAKE_CXX_FLAGS_DEBUG_INIT "-N -Od -R -rd -v -y")
set(CMAKE_CXX_FLAGS_RELEASE_INIT "-DNDEBUG -O2 -Oa -Ob -Oc -Oe -Og -Oi -Ol -Om -Op -Ot -Ov -Ox -r -Z -G")

set(CMAKE_EXE_LINKER_FLAGS_INIT "-L${bc45}/lib")

set(CMAKE_LIBRARY_PATH_FLAG "-L")
set(CMAKE_LINK_LIBRARY_FLAG "")

set(CMAKE_C_CREATE_WIN32_EXE "-tWE")
set(CMAKE_CREATE_WIN32_EXE "-tWE")
set(CMAKE_C_CREATE_CONSOLE_EXE "-tWC")
set(CMAKE_CREATE_CONSOLE_EXE "-tWC")

set(CMAKE_FIND_LIBRARY_SUFFIXES ".lib")

set(CMAKE_MANGLE_OBJECT_FILE_NAMES "ON")

set(CMAKE_C_USE_RESPONSE_FILE_FOR_INCLUDES 0)
set(CMAKE_CXX_USE_RESPONSE_FILE_FOR_INCLUDES 0)

set(CMAKE_C_COMPILE_OBJECT "<CMAKE_C_COMPILER> -D_WIN32 <DEFINES> <INCLUDES> <FLAGS> -o<OBJECT> -c <SOURCE>")
set(CMAKE_CXX_COMPILE_OBJECT "<CMAKE_CXX_COMPILER> -D_WIN32 <DEFINES> <INCLUDES> <FLAGS> -o<OBJECT> -c <SOURCE>")

set(CMAKE_C_LINK_EXECUTABLE "<CMAKE_C_COMPILER> -e<TARGET> <LINK_FLAGS> <FLAGS> <LINK_LIBRARIES> <OBJECTS>")
set(CMAKE_CXX_LINK_EXECUTABLE "<CMAKE_CXX_COMPILER> -e<TARGET> <LINK_FLAGS> <FLAGS> <LINK_LIBRARIES> <OBJECTS>")

set(CMAKE_C_CREATE_STATIC_LIBRARY "${tlib} <TARGET_QUOTED> <OBJECTS_QUOTED>")
set(CMAKE_CXX_CREATE_STATIC_LIBRARY "${tlib} <TARGET_QUOTED> <OBJECTS_QUOTED>")

set(CMAKE_C_CREATE_IMPORT_LIBRARY "implib -c -w <TARGET_IMPLIB> <TARGET>")
set(CMAKE_CXX_CREATE_IMPORT_LIBRARY "implib -c -w <TARGET_IMPLIB> <TARGET>")
