include("../AbstractProblems.jl")
include("../../kernel/globalStructs.jl")
include("../../kernel/mesh/mesh.jl")
include("../../io/plotting/jeplots.jl")

function initialize(SD::NSD_1D, ET::Elliptic, mesh::St_mesh, inputs::Dict, OUTPUT_DIR::String, TFloat)
    nothing
end


function initialize(SD::NSD_2D, ET::Elliptic, mesh::St_mesh, inputs::Dict, OUTPUT_DIR::String, TFloat)

    println(" # Initialize fields for ∇²(q) = f........................")
        
    ngl  = mesh.nop + 1
    nsd  = mesh.nsd
    neqs = 1    
    q    = define_q(SD, mesh.nelem, mesh.npoin, mesh.ngl, neqs)
    
    test_case = "giraldo.12.14"
    if (test_case == "giraldo.12.14")

        c = 2.0
        xc, yc = (maximum(mesh.x) + minimum(mesh.x))/2, (maximum(mesh.y) + minimum(mesh.y))/2
        
        for iel_g = 1:mesh.nelem
            for i=1:ngl
                for j=1:ngl

                    ip = mesh.connijk[i,j,iel_g];
                    x, y = mesh.x[ip], mesh.y[ip];
                    
                    q.qn[ip,1] = sinpi(c*(x - xc))*sinpi(c*(y - yc))

                end
            end
        end
    end
        
    #------------------------------------------
    # Plot initial condition:
    # Notice that I scatter the points to
    # avoid sorting the x and q which would be
    # becessary for a smooth curve plot.
    #------------------------------------------
    title = string( "Initial condition")
    plot_results(SD, mesh.x, mesh.y, q.qn[:,1], title, string(OUTPUT_DIR, "/INIT.png"))
    
    println(" # Initialize fields for ∇²(q) = f........................ DONE")
    
    return q
end
