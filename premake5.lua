local BX_DIR = "%{wks.location}/bx"
local BIMG_DIR = "%{wks.location}/bimg"

project "bimg"
	kind "StaticLib"
	language "C++"
	cppdialect "C++14"
	exceptionhandling "Off"
	rtti "Off"
	files
	{
		BIMG_DIR .. "/include/bimg/*.h",
		BIMG_DIR .. "/src/image.cpp",
		BIMG_DIR .. "/src/image_gnf.cpp",
		BIMG_DIR .. "/src/*.h",
		BIMG_DIR .. "/3rdparty/astc-codec/src/decoder/*.cc",
	}
	includedirs
	{
		BX_DIR .. "/include",
		BIMG_DIR .. "/include",
		BIMG_DIR .. "/3rdparty/astc-codec",
		BIMG_DIR .. "/3rdparty/astc-codec/include",
	}
    filter "action:vs*"
        includedirs { BX_DIR .. "/include/compat/msvc" }

    filter { "system:windows", "action:gmake" }
        includedirs { BX_DIR .. "/include/compat/mingw" }

    filter { "system:macosx" }
        includedirs { BX_DIR .. "/include/compat/osx" }
        buildoptions { "-x objective-c++" }