project "yaml-cpp"
    group "Dependencies"
    kind "StaticLib"
    language "C++"
	systemversion "latest"
	cppdialect "C++17"
	staticruntime "on"

    targetdir ("bin/%{cfg.buildcfg}")
    objdir ("bin-obj/%{cfg.buildcfg}")

	files
	{
		"src/**.h",
		"src/**.cpp",
		"include/**.h"
	}

	includedirs
	{
		"include"
	}

	defines
	{
		"YAML_CPP_STATIC_DEFINE"
	}

	filter "system:linux"
		pic "On"

    filter "configurations:Debug"
        symbols "On"
        optimize "Off"  -- Turn off optimization for debug builds
		staticruntime "on"
        runtime "Debug"

    filter "configurations:Release"
        symbols "Off"
        optimize "On"  -- Full optimization for release builds
		staticruntime "off"
        runtime "Release"