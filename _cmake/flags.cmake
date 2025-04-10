
include(CheckCCompilerFlag)

macro(add_compiler_flag flag)
    string(REGEX REPLACE "^-" "" id "${flag}")
    string(REGEX REPLACE "^/" "" id "${id}")
    string(REPLACE "-" "_" id "${id}")
    string(REPLACE "=" "_" id "${id}")
    if("${ARGN}" STREQUAL "FORCE")
        set(HAVE_${id} TRUE)
    else()
        check_c_compiler_flag("${flag}" HAVE_${id})
    endif()
    if(HAVE_${id})
        add_definitions("${flag}")
    endif()
endmacro()

macro(add_compiler_flag_release flag)
    string(REGEX REPLACE "^-" "" id "${flag}")
    string(REGEX REPLACE "^/" "" id "${id}")
    string(REPLACE "-" "_" id "${id}")
    string(REPLACE "=" "_" id "${id}")
    if("${ARGN}" STREQUAL "FORCE")
        set(HAVE_${id} TRUE)
    else()
        check_c_compiler_flag("${flag}" HAVE_${id})
    endif()
    if(HAVE_${id})
        foreach(config RELEASE RELWITHDEBINFO MINSIZEREL)
            foreach(lang C CXX)
                set(CMAKE_${lang}_FLAGS_${config} "${CMAKE_${lang}_FLAGS_${config}} ${flag}")
            endforeach()
        endforeach()
    endif()
endmacro()

macro(add_linker_flag flag)
    foreach(target EXE SHARED)
        set(CMAKE_${target}_LINKER_FLAGS "${CMAKE_${target}_LINKER_FLAGS} ${flag}")
    endforeach()
endmacro()

macro(add_linker_flag_release flag)
    foreach(config RELEASE RELWITHDEBINFO MINSIZEREL)
        foreach(target EXE SHARED)
            set(CMAKE_${target}_LINKER_FLAGS_${config} "${CMAKE_${target}_LINKER_FLAGS_${config}} ${flag}")
        endforeach()
    endforeach()
endmacro()

macro(add_linker_flag_release_only flag)
    foreach(target EXE SHARED)
        set(CMAKE_${target}_LINKER_FLAGS_RELEASE "${CMAKE_${target}_LINKER_FLAGS_RELEASE} ${flag}")
    endforeach()
endmacro()

macro(remove_linker_flag flag)
    foreach(config "" _DEBUG _RELEASE _RELWITHDEBINFO _MINSIZEREL)
        foreach(target EXE SHARED)
            string(REGEX REPLACE "${flag}" ""
                CMAKE_${target}_LINKER_FLAGS${config} "${CMAKE_${target}_LINKER_FLAGS${config}}")
        endforeach()
    endforeach()
endmacro()
