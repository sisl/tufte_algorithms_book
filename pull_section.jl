# run(`lualatex optimization-chapter.tex`)

# compile a specific section of the book
# jl compile.jl sec:bisection

function get_files()
    retval = String[]
    for line in readlines("optimization.tex")
        if ismatch(r"include\{chapter", line)
            m = match(r"chapter/\S*(?=\})", line)
            @assert isa(m, RegexMatch)
            push!(retval, m.match*".tex")
        end
    end
    return retval
end

function find_matching_paren(str::String; open_char='(', close_char=')', starting_index::Int=findfirst(str, open_char))
    @assert str[starting_index] == open_char
    nopen = 1
    i = starting_index
    n = endof(str)
    while nopen > 0 && i < n
        i = nextind(str,i)
        nopen += str[i] == open_char
        nopen -= str[i] == close_char
    end
    return nopen == 0 ? i : -1
end

const TARGET_LABEL = ARGS[1]

for file in get_files()
    lines = readlines(file)
    for (k,line) in enumerate(lines)
        line = strip(line)
        if ismatch(r"\\label", line)
            # @show
            m = match(r"\\label\{", line)
            i = m.offset + 6
            j = find_matching_paren(line, open_char='{', close_char='}', starting_index=i)
            label = line[i+1:j-1]
            if label == TARGET_LABEL

                lo = k-1 # include previous line index
                hi = findnext(line->ismatch(r"\\section\{", line), lines, k)
                if hi == 0
                    hi = length(lines)
                else
                    hi -= 1
                end

                open("optimization-section.tex", "w") do io
                    println(io, "\\documentclass{optimization-book}")
                    println(io, "\\begin{document}")
                    println(io, "\\mainmatter")

                    for l in lines[lo:hi]
                        println(io, l)
                    end

                    println(io, "\\end{document}")
                end

                exit()
            end
        end
    end
end

warn("DID NOT FIND TARGET LABEL: ", TARGET_LABEL)