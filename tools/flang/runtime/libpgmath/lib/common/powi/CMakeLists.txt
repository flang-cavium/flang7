#
# Copyright (c) 2018, NVIDIA CORPORATION.  All rights reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Set compiler flags and definitions
get_property(DEFINITIONS GLOBAL PROPERTY "DEFINITIONS_L1")
get_property(FLAGS GLOBAL PROPERTY "FLAGS_L1")

# Set source files, compiler flags and definitions
if(${CMAKE_SYSTEM_PROCESSOR} MATCHES "x86_64")
  if(${CMAKE_SYSTEM_NAME} MATCHES "Linux")
    # Set source files
    set(CORE2_SRCS fxpowi.c pxpowi.c)
    set_property(SOURCE ${CORE2_SRCS} APPEND_STRING PROPERTY COMPILE_FLAGS "-march=core2 ")
    set(SANDYBRIDGE_SRCS fypowi.c pypowi.c)
    set_property(SOURCE ${SANDYBRIDGE_SRCS} APPEND_STRING PROPERTY COMPILE_FLAGS "-march=sandybridge ")
    set(KNL_SRCS pzpowi.c)
    set_property(SOURCE ${KNL_SRCS} APPEND_STRING PROPERTY COMPILE_FLAGS "-mtune=knl -march=knl ")
    set(SRCS
      ${CORE2_SRCS}
      ${SANDYBRIDGE_SRCS}
      ${KNL_SRCS})
elseif(${CMAKE_SYSTEM_NAME} MATCHES "Darwin")
    # Set source files
    set(CORE2_SRCS fxpowi.c pxpowi.c)
    set_property(SOURCE ${CORE2_SRCS} APPEND_STRING PROPERTY COMPILE_FLAGS "-msse2 ")
    set(SANDYBRIDGE_SRCS fypowi.c pypowi.c)
    set_property(SOURCE ${SANDYBRIDGE_SRCS} APPEND_STRING PROPERTY COMPILE_FLAGS "-mavx ")
    set(KNL_SRCS pzpowi.c)
    set_property(SOURCE ${KNL_SRCS} APPEND_STRING PROPERTY COMPILE_FLAGS "-mavx512f -mfma ")
    set(SRCS
      ${CORE2_SRCS}
      ${SANDYBRIDGE_SRCS}
      ${KNL_SRCS})
  endif()
elseif(${CMAKE_SYSTEM_PROCESSOR} MATCHES "ppc64le")
  set(SRCS fxpowi.c pxpowi.c)
  set_property(SOURCE ${SRCS} APPEND_STRING PROPERTY COMPILE_FLAGS "-mcpu=power8 ")
elseif(${CMAKE_SYSTEM_PROCESSOR} MATCHES "aarch64")
  set(SRCS fxpowi.c gspowi4.c gdpowi2.c pxpowi.c)
  set_property(SOURCE ${SRCS} APPEND_STRING PROPERTY COMPILE_FLAGS "-mcpu=${LLVM_FLANG_CPU_TARGET} ")
else()
  set(SRCS fxpowi.c pxpowi.c)  
endif()

libmath_add_object_library("${SRCS}" "${FLAGS}" "${DEFINITIONS}" "")
