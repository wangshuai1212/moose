# Using CappedMohrCoulomb with compressive failure only
# A single unit element is stretched in a complicated way
# that the trial stress is
#
#  -1.2 -2.0 -0.8
#  -2.0  4.4   0
#  -0.8   0   2.8
#
# This has eigenvalues
# la = {-1.963, 2.89478, 5.06822}
# and eigenvectors
# {0.94197, 0.296077, 0.158214}
# {-0.116245, -0.154456, 0.981137},
# {-0.314929, 0.942593, 0.111075},
#
# The compressive strength is 0.5 and Young=1 and Poisson=0.25.
# The return-map algorithm should return to stress_min = -0.5
# This is an increment of 1.463, so stress_mid and stress_max
# should both increase by 1.463 v/(1-v) = 0.488, giving
# stress_mid = 3.382
# stress_max = 5.556
#
# E_22 = E(1-v)/(1+v)/(1-2v)=1.2 and E_02 = E_22 v/(1-v)
# gamma_shear = ((smax-smin)^trial - (smax-smin)) / (E_22 - E_02)
# = ((2v-1)/(1-v)) * (smin^trial - smin) / (E_22(1 - 2v)/(1-v))
# = -(smin^trial - smin) / E_22
# Using psi = 30deg, sin(psi) = 1/2
# the shear correction to the tensile internal parameter is
# gamma_shear (E_22 + E_20) sin(psi) = gamma_shear E_22 sin(psi) / (1 - v)
# = -(smin^trial - smin) / (1 - v) / 2
# Then the tensile internal parameter is
# (1 - v) * (reduction_of_(max+min)_principal - gamma_shear * E_22 / (1-v) / 2) / E_22
# = -1.829
#
# The final stress is
#
# {0.15, -1.7, -0.65},
# {-1.7, 4.97, 0.046},
# {-0.65, 0.046, 3.3}

[Mesh]
  type = GeneratedMesh
  dim = 3
  nx = 1
  ny = 1
  nz = 1
  xmin = -0.5
  xmax = 0.5
  ymin = -0.5
  ymax = 0.5
  zmin = -0.5
  zmax = 0.5
[]


[Variables]
  [./disp_x]
  [../]
  [./disp_y]
  [../]
  [./disp_z]
  [../]
[]

[Kernels]
  [./TensorMechanics]
    displacements = 'disp_x disp_y disp_z'
  [../]
[]


[BCs]
  [./x]
    type = FunctionPresetBC
    variable = disp_x
    boundary = 'front back'
    function = '-(3*x+2*y+z)'
  [../]
  [./y]
    type = FunctionPresetBC
    variable = disp_y
    boundary = 'front back'
    function = '-(3*x-4*y)'
  [../]
  [./z]
    type = FunctionPresetBC
    variable = disp_z
    boundary = 'front back'
    function = '-(x-2*z)'
  [../]
[]

[AuxVariables]
  [./stress_I]
    order = CONSTANT
    family = MONOMIAL
  [../]
  [./stress_II]
    order = CONSTANT
    family = MONOMIAL
  [../]
  [./stress_III]
    order = CONSTANT
    family = MONOMIAL
  [../]
  [./stress_xx]
    order = CONSTANT
    family = MONOMIAL
  [../]
  [./stress_xy]
    order = CONSTANT
    family = MONOMIAL
  [../]
  [./stress_xz]
    order = CONSTANT
    family = MONOMIAL
  [../]
  [./stress_yy]
    order = CONSTANT
    family = MONOMIAL
  [../]
  [./stress_yz]
    order = CONSTANT
    family = MONOMIAL
  [../]
  [./stress_zz]
    order = CONSTANT
    family = MONOMIAL
  [../]
  [./f0]
    order = CONSTANT
    family = MONOMIAL
  [../]
  [./f1]
    order = CONSTANT
    family = MONOMIAL
  [../]
  [./f2]
    order = CONSTANT
    family = MONOMIAL
  [../]
  [./iter]
    order = CONSTANT
    family = MONOMIAL
  [../]
  [./intnl]
    order = CONSTANT
    family = MONOMIAL
  [../]
[]

[AuxKernels]
  [./stress_I]
    type = RankTwoScalarAux
    rank_two_tensor = stress
    variable = stress_I
    scalar_type = MaxPrincipal
  [../]
  [./stress_II]
    type = RankTwoScalarAux
    rank_two_tensor = stress
    scalar_type = MidPrincipal
    variable = stress_II
  [../]
  [./stress_III]
    type = RankTwoScalarAux
    rank_two_tensor = stress
    scalar_type = MinPrincipal
    variable = stress_III
  [../]
  [./stress_xx]
    type = RankTwoAux
    rank_two_tensor = stress
    variable = stress_xx
    index_i = 0
    index_j = 0
  [../]
  [./stress_xy]
    type = RankTwoAux
    rank_two_tensor = stress
    variable = stress_xy
    index_i = 0
    index_j = 1
  [../]
  [./stress_xz]
    type = RankTwoAux
    rank_two_tensor = stress
    variable = stress_xz
    index_i = 0
    index_j = 2
  [../]
  [./stress_yy]
    type = RankTwoAux
    rank_two_tensor = stress
    variable = stress_yy
    index_i = 1
    index_j = 1
  [../]
  [./stress_yz]
    type = RankTwoAux
    rank_two_tensor = stress
    variable = stress_yz
    index_i = 1
    index_j = 2
  [../]
  [./stress_zz]
    type = RankTwoAux
    rank_two_tensor = stress
    variable = stress_zz
    index_i = 2
    index_j = 2
  [../]
  [./f0_auxk]
    type = MaterialStdVectorAux
    property = plastic_yield_function
    index = 0
    variable = f0
  [../]
  [./f1_auxk]
    type = MaterialStdVectorAux
    property = plastic_yield_function
    index = 1
    variable = f1
  [../]
  [./f2_auxk]
    type = MaterialStdVectorAux
    property = plastic_yield_function
    index = 2
    variable = f2
  [../]
  [./iter]
    type = MaterialRealAux
    property = plastic_NR_iterations
    variable = iter
  [../]
  [./intnl_auxk]
    type = MaterialStdVectorAux
    property = plastic_internal_parameter
    index = 1
    variable = intnl
  [../]
[]

[Postprocessors]
  [./s_I]
    type = PointValue
    point = '0 0 0'
    variable = stress_I
  [../]
  [./s_II]
    type = PointValue
    point = '0 0 0'
    variable = stress_II
  [../]
  [./s_III]
    type = PointValue
    point = '0 0 0'
    variable = stress_III
  [../]
  [./s_xx]
    type = PointValue
    point = '0 0 0'
    variable = stress_xx
  [../]
  [./s_xy]
    type = PointValue
    point = '0 0 0'
    variable = stress_xy
  [../]
  [./s_xz]
    type = PointValue
    point = '0 0 0'
    variable = stress_xz
  [../]
  [./s_yy]
    type = PointValue
    point = '0 0 0'
    variable = stress_yy
  [../]
  [./s_yz]
    type = PointValue
    point = '0 0 0'
    variable = stress_yz
  [../]
  [./s_zz]
    type = PointValue
    point = '0 0 0'
    variable = stress_zz
  [../]
  [./f0]
    type = PointValue
    point = '0 0 0'
    variable = f0
  [../]
  [./f1]
    type = PointValue
    point = '0 0 0'
    variable = f1
  [../]
  [./f2]
    type = PointValue
    point = '0 0 0'
    variable = f2
  [../]
  [./iter]
    type = PointValue
    point = '0 0 0'
    variable = iter
  [../]
  [./intnl]
    type = PointValue
    point = '0 0 0'
    variable = intnl
  [../]
[]

[UserObjects]
  [./ts]
    type = TensorMechanicsHardeningConstant
    value = 1E6
  [../]
  [./cs]
    type = TensorMechanicsHardeningConstant
    value = 0.5
  [../]
  [./coh]
    type = TensorMechanicsHardeningConstant
    value = 1E6
  [../]
  [./ang]
    type = TensorMechanicsHardeningConstant
    value = 30
    convert_to_radians = true
  [../]
[]

[Materials]
  [./elasticity_tensor]
    type = ComputeIsotropicElasticityTensor
    youngs_modulus = 1
    poissons_ratio = 0.25
  [../]
  [./strain]
    type = ComputeIncrementalSmallStrain
    displacements = 'disp_x disp_y disp_z'
  [../]
  [./tensile]
    type = CappedMohrCoulombStressUpdate
    tensile_strength = ts
    compressive_strength = cs
    cohesion = coh
    friction_angle = ang
    dilation_angle = ang
    smoothing_tol = 0.001
    yield_function_tol = 1.0E-12
  [../]
  [./stress]
    type = ComputeMultipleInelasticStress
    inelastic_models = tensile
    perform_finite_strain_rotations = false
  [../]
[]


[Executioner]
  end_time = 1
  dt = 1
  type = Transient
[]


[Outputs]
  file_base = small_deform19
  csv = true
[]
