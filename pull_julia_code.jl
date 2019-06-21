function get_files(; chapter_regex::Regex = r"include\{chapter")
    retval = String[]
    for line in readlines("book.tex")
        if occursin(chapter_regex, line)
            m = match(r"chapter/\S*(?=\})", line)
            @assert isa(m, RegexMatch)
            push!(retval, m.match*".tex")
        end
    end
    return retval
end

function find_matching_paren(str::String, starting_index::Int=something(findfirst(isequal('('), str), 0))
    @assert str[starting_index] == '('
    nopen = 1
    i = starting_index
    n = lastindex(str)
    while nopen > 0 && i < n
        i = nextind(str,i)
        nopen += str[i] == '('
        nopen -= str[i] == ')'
    end
    return nopen == 0 ? i : -1
end

# Export all juliaconsole blocks
io = open("all_juliaconsole_blocks.jl", "w")
for filepath in get_files()

    println("reading ", splitdir(filepath)[2])

    lines = [replace(line, "\n"=>"") for line in open(readlines, filepath, "r")]

    counter = 0
    i = something(findfirst(str->startswith(str, "\\begin{juliaconsole}"), lines), 0) + 1
    while i != 1
        j = findnext(x->x == "\\end{juliaconsole}",  lines, i)

        # We want to insert a 'let' block if the juliaconsole block is scoped.
        # ie: \begin{juliaconsole}[thescope]
        needs_let = occursin(r"begin{juliaconsole}\[", lines[i-1])

        println(io, "#"^20, " console ", splitext(splitdir(filepath)[2])[1], " ", counter += 1)
        if needs_let
            # print out any lines that use packages, as we don't want them within the let block.
            while occursin(r"using", lines[i]) || occursin(r"import", lines[i])
                println(io, lines[i])
                i += 1
            end
            println(io, "let")
            # print everything else in a let block.
            for line in lines[i:j-1]
                println(io, "\t", line)
                i += 1
            end
            println(io, "end")
        else
            # No let block, as juliaconsole blocks will use data from one another.
            for line in lines[i:j-1]
                println(io, line)
            end
        end
        println(io, "#"^20, "\n")

        i = something(findnext(str->startswith(str, "\\begin{juliaconsole}"), lines, j),0) + 1
    end
end
close(io)

# Export all algorithm blocks
io = open("all_algorithm_blocks.jl", "w")
for filepath in get_files()

    println("reading ", splitdir(filepath)[2])

    lines = [replace(line, "\n"=>"") for line in open(readlines, filepath, "r")]

    counter = 0
    i = something(findfirst(isequal("\\begin{algorithm}"), lines), 0) + 1
    while i != 1

        replacements = Dict{String,String}()
        while startswith(lines[i], "%")
            line = lines[i]
            i += 1
            if occursin(r"REPLACE \(.*\) \(.*\)", line)
                m = match(r"REPLACE", line)
                start_paren_target = something(findnext(isequal('('), line, m.offset), 0)
                end_paren_target = find_matching_paren(line, start_paren_target)
                start_paren_replace = something(findnext(isequal('('), line, end_paren_target), 0)
                end_paren_replace = find_matching_paren(line, start_paren_replace)
                target = line[nextind(line, start_paren_target):prevind(line, end_paren_target)]
                replacements[target] = line[nextind(line, start_paren_replace):prevind(line, end_paren_replace)]
                @show replacements
            end
        end

        j = something(findnext(x-> x ∈ ["\\end{juliablock}", "\\end{juliaverbatim}"],  lines, i), 0)

        println(io, "#"^20, " ", splitext(splitdir(filepath)[2])[1], " ", counter += 1)
        for line in lines[i+1:j-1]
            for (target,subsitute) in replacements
                line = replace(line, target=>subsitute)
            end
            println(io, line)
        end
        println(io, "#"^20, "\n")

        i = something(findnext(isequal("\\begin{algorithm}"), lines, j), 0) + 1
    end
end
close(io)

# Export all test blocks
io = open("all_test_blocks.jl", "w")
for filepath in get_files(chapter_regex=r"^\\include\{chapter")

    println("reading for test: ", splitdir(filepath)[2])

    lines = [replace(line, "\n"=>"") for line in open(readlines, filepath, "r")]

    counter = 0
    i = something(findfirst(isequal("\\begin{juliatest}"), lines), 0)
    while i != 0

        j = something(findnext(x-> x == "\\end{juliatest}",  lines, i), 0)

        println(io, "#"^20, " ", splitext(splitdir(filepath)[2])[1], " ", counter += 1)
        for line in lines[i+1:j-1]
            println(io, line)
        end
        println(io, "#"^20, "\n")

        i = something(findnext(isequal("\\begin{juliatest}"), lines, j), 0)
    end
end
close(io)
