workspace "TcpListener"
	configurations { "Debug", "Release" }
	platforms { "Win64" , "Win32" }

outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

project "TcpListener"
	kind "StaticLib"
	language "C++" -- "C", "C++", "C#"
	staticruntime "on" -- off for dll
	cppdialect "C++latest"
	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")
    files { "src/TcpListener.h", "src/TcpListener.cpp" }

	filter "configurations:Debug"
		runtime "Debug"
		symbols "on"
		defines { "DEBUG" }

	filter "configurations:Release"
		runtime "Release"
		optimize "on" -- "on", "off", "Debug", "Size", "Speed", "Full"
		defines { "NDEBUG" }

	filter "configurations:*32"
		architecture "x86"

	filter "configurations:*64"
		architecture "x86_64"