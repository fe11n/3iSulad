# build which type of lcr library
option(USESHARED "set type of libs, default is shared" ON)
if (USESHARED STREQUAL "ON")
    set(LIBTYPE "SHARED")
    message("--  Build shared library")
else ()
    set(LIBTYPE "STATIC")
    message("--  Build static library")
endif()

option(ENABLE_GRPC "use grpc as connector" ON)
if (ENABLE_GRPC STREQUAL "ON")
    add_definitions(-DGRPC_CONNECTOR)
    set(GRPC_CONNECTOR 1)
endif()

option(ENABLE_SYSTEMD_NOTIFY "enable systemd notify" ON)
if (ENABLE_SYSTEMD_NOTIFY STREQUAL "ON")
    add_definitions(-DSYSTEMD_NOTIFY)
    set(SYSTEMD_NOTIFY 1)
endif()

option(ENABLE_OPENSSL_VERIFY "use ssl with connector" ON)
if (ENABLE_OPENSSL_VERIFY STREQUAL "ON")
    add_definitions(-DOPENSSL_VERIFY)
    set(OPENSSL_VERIFY 1)
endif()

option(PACKAGE "set isulad package" ON)
if (PACKAGE STREQUAL "ON")
    set(ISULAD_PACKAGE "iSulad")
endif()

option(VERSION "set isulad version" ON)
if (VERSION STREQUAL "ON")
    set(ISULAD_VERSION "2.0.8")
endif()

option(DEBUG "set isulad gcc option" ON)
if (DEBUG STREQUAL "ON")
    add_definitions("-g -O2")
endif()

option(GCOV "set isulad gcov option" OFF)
if (GCOV STREQUAL "ON")
    set(ISULAD_GCOV "ON")
endif()

# set OCI image server type
option(DISABLE_OCI "disable oci image" OFF)
if (DISABLE_OCI STREQUAL "ON")
    message("Disable OCI image")
else()
    add_definitions(-DENABLE_OCI_IMAGE=1)
    set(ENABLE_OCI_IMAGE 2)
endif()

option(ENABLE_EMBEDDED "enable embedded image" OFF)
if (ENABLE_EMBEDDED STREQUAL "ON")
    add_definitions(-DENABLE_EMBEDDED_IMAGE=1)
    set(ENABLE_EMBEDDED_IMAGE 1)
endif()

option(ENABLE_SELINUX "enable isulad daemon selinux option" ON)
if (ENABLE_SELINUX STREQUAL "ON")
    add_definitions(-DENABLE_SELINUX=1)
    set(ENABLE_SELINUX 1)
endif()

option(ENABLE_SHIM_V2 "enable shim v2 runtime" OFF)
if (ENABLE_SHIM_V2 STREQUAL "ON")
	add_definitions(-DENABLE_SHIM_V2=1)
	set(ENABLE_SHIM_V2 1)
endif()

option(ENABLE_METRICS "enable metrics" ON)
if (ENABLE_METRICS STREQUAL "ON")
    add_definitions(-DENABLE_METRICS)
    set(ENABLE_METRICS 1)
endif()

option(ENABLE_NATIVE_NETWORK "enable native network" OFF)
if (ENABLE_NATIVE_NETWORK STREQUAL "ON")
    add_definitions(-DENABLE_NATIVE_NETWORK)
    set(ENABLE_NATIVE_NETWORK 1)
endif()

if (ENABLE_NATIVE_NETWORK OR ENABLE_GRPC)
    add_definitions(-DENABLE_NETWORK)
    set(ENABLE_NETWORK 1)
endif()