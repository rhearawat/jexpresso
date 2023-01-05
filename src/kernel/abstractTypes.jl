#
# General abstract not tied to any specific problem
#

#
# Quadrature rules 
#
abstract type AbstractIntegrationType end
struct Exact <: AbstractIntegrationType end
struct Inexact <: AbstractIntegrationType end
#
# Monolithic/tensor-product
#
abstract type AbstractMatrixType end
struct Monolithic <: AbstractMatrixType end
struct TensorProduct <: AbstractMatrixType end

#
# Space dimensions
#
abstract type AbstractSpaceDimensions end
struct NSD_1D <: AbstractSpaceDimensions end
struct NSD_2D <: AbstractSpaceDimensions end
struct NSD_3D <: AbstractSpaceDimensions end

#
# Space discretization
#
abstract type AbstractDiscretization end
struct CG <:  AbstractDiscretization end


#
# Time discretization
#
abstract type AbstractTime end
struct RK <: AbstractTime end
struct RK3 <: AbstractTime end
struct RK5 <: AbstractTime end


#
# Boundary flags/conditions
#
abstract type AbstractBC end
struct PERIODIC1D_CG <: AbstractBC end