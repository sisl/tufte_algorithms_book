# Add and build Julia packages.
# 
# Usage:
#   julia install_pkgs.jl filename1 [filenames...]
#
# example of requirement
#
# Images
# IJulia  1.12+
# Flux  v"0.6+"
# Zygote  master

using Pkg
try
    using ProgressMeter
catch 
    Pkg.add("ProgressMeter")
    using ProgressMeter
end
try
    using Suppressor
catch 
    Pkg.add("Suppressor")
    using Suppressor
end

Base.VersionNumber(version::VersionNumber) = version

for filename in ARGS[1:end]
    @showprogress for require in readlines(filename)
        # skip comments
        require = strip(require)
        if startswith(require, "#") || isempty(require)
            continue
        end

        println("") 
        @info "add and build $require"

        # parse name and version
    	version_pos = findfirst(" ", require)
        name = version_pos isa Nothing ? require : require[1:version_pos[1]-1]
        name = strip(name) |> String
        lowercase(name) == "julia" && continue # compat to REQUIRE
        
        if version_pos isa Nothing
            version = nothing
        else
            version = strip(require[version_pos[2]+1:end])
            try
                version = VersionNumber(version)
            catch ArgumentError
                # url, `master`
                nothing
            end
        end

        # install package
        if version isa Nothing
            # Ijulia
            @suppress Pkg.add(name)
        elseif version isa VersionNumber
            # Ijulia 1.12+
            @suppress Pkg.add(PackageSpec(name = name, version = version))
        elseif startswith(version, "#")
            # IJulia #master
            version = version[2:end] |> String
            @suppress Pkg.add(PackageSpec(name = name, rev = version))
        elseif startswith(version, "http")
            # Ijulia https://github.com/JuliaLang/IJulia.jl
            @suppress Pkg.add(PackageSpec(url = String(version)))
        else
            error("unsupported package format: $require")
        end
    end
end
