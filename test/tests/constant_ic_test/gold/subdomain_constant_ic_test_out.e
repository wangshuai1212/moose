CDF      
      
len_string     !   len_line   Q   four      	time_step          len_name   !   num_dim       	num_nodes         num_elem      
num_el_blk        num_node_sets         num_side_sets         num_el_in_blk1        num_nod_per_el1       num_el_in_blk2        num_nod_per_el2       num_side_ss1      num_side_ss2      num_side_ss3      num_side_ss4      num_nod_ns1       num_nod_ns2       num_nod_ns3       num_nod_ns4       num_nod_var       num_info  !         api_version       @��H   version       @��H   floating_point_word_size            	file_size               title         !subdomain_constant_ic_test_out.e       maximum_name_length                     
time_whole                            jp   	eb_status                             	8   eb_prop1               name      ID              	@   	ns_status         	                    	H   ns_prop1      	         name      ID              	X   	ss_status         
                    	h   ss_prop1      
         name      ID              	x   coordx                      �      	�   coordy                      �      
P   eb_names                       D         ns_names      	                 �      \   ss_names      
                 �      �   
coor_names                         D      d   connect1                  	elem_type         QUAD4         �      �   elem_num_map                    @      (   connect2                  	elem_type         QUAD4         �      h   elem_ss1                          �   side_ss1                          �   elem_ss2                             side_ss2                             elem_ss3                          (   side_ss3                          8   elem_ss4                          H   side_ss4                          X   node_ns1                          h   node_ns2                          |   node_ns3                          �   node_ns4                          �   vals_nod_var1                          �      jx   vals_nod_var2                          �      k@   name_nod_var                       D      �   info_records                      [t      �                                                            ?�                      ?�      ?�              ?�      ?�      ?�      ?�      ?�      ?�              ?�      ?�      ?�      ?�              ?�      ?�      ?�      ?�      ?�      ?�      ?�      ?�      ?�                      ?�      ?�      ?�              ?�      ?�      ?�      ?�      ?�              ?�      ?�      ?�      ?�      ?�      ?�      ?�              ?�      ?�      ?�                                                                                                                                                                                                                                                                                                                                                                                                                            
         
                                                                  
               
               	   
                                                                                 	                                                                                                                        	                                                            	               	      u                                u_aux                              ####################@E      @8      @E      @E      @E      @E      @8      @E   # Created by MOOSE #8      @8      @8      @8      @8      @#��G�{@      @    ####################      @#��G�{@#��G�{@#��G�{@      @      @#��G�{@     ### Command Line Arguments ###�{@      @#��G�{@#��G�{@#��G�{@#��G�{@#��G�{-i��G�{@#��G�{                                                                 subdomain_constant_ic_test.i                                                                                                                                      ### Input File ###                                                                                                                                                                                                                                 [Mesh]                                                                             action                         = setup_mesh                                      construct_side_list_from_node_list = 0                                           name                           = Mesh                                            parser_handle                  = 0x7fff67ac40e8                                  second_order                   = 0                                               unique_id                      = 1                                               file                           = sq-2blk.e                                       isObjectAction                 = 1                                               nemesis                        = 0                                               patch_size                     = 40                                              skip_partitioning              = 0                                               type                           = MooseMesh                                       _dimension                     = 1                                               uniform_refine                 = 1                                             []                                                                                                                                                                [Variables]                                                                        action                         = no_action                                       name                           = Variables                                       parser_handle                  = 0x7fff67ac40e8                                  unique_id                      = 22                                                                                                                               [./u]                                                                              action                       = copy_nodal_vars                                   initial_from_file_timestep   = 2                                                 name                         = Variables/u                                       parser_handle                = 0x7fff67ac40e8                                    unique_id                    = 11                                                family                       = LAGRANGE                                          initial_condition            = 0                                                 order                        = FIRST                                             scaling                      = 1                                               [../]                                                                          []                                                                                                                                                                [AuxVariables]                                                                     action                         = no_action                                       name                           = AuxVariables                                    parser_handle                  = 0x7fff67ac40e8                                  unique_id                      = 22                                                                                                                               [./u_aux]                                                                          action                       = copy_nodal_aux_vars                               initial_from_file_timestep   = 2                                                 name                         = AuxVariables/u_aux                                parser_handle                = 0x7fff67ac40e8                                    unique_id                    = 11                                                family                       = LAGRANGE                                          initial_condition            = 0                                                 order                        = FIRST                                             scaling                      = 1                                               [../]                                                                          []                                                                                                                                                                [Kernels]                                                                          [./diff]                                                                           action                       = add_kernel                                        isObjectAction               = 1                                                 name                         = Kernels/diff                                      parser_handle                = 0x7fff67ac40e8                                    type                         = Diffusion                                         unique_id                    = 16                                                built_by_action              = add_kernel                                        execute_on                   = residual                                          start_time                   = -1.79769e+308                                     stop_time                    = 1.79769e+308                                      use_displaced_mesh           = 0                                                 variable                     = u                                               [../]                                                                                                                                                           [Kernels]                                                                          action                         = no_action                                       name                           = Kernels                                         parser_handle                  = 0x7fff67ac40e8                                  unique_id                      = 22                                            []                                                                                                                                                                [BCs]                                                                              [./right]                                                                          action                       = add_bc                                            isObjectAction               = 1                                                 name                         = BCs/right                                         parser_handle                = 0x7fff67ac40e8                                    type                         = DirichletBC                                       unique_id                    = 21                                                boundary                     = 2                                                 built_by_action              = add_bc                                            execute_on                   = residual                                          use_displaced_mesh           = 0                                                 value                        = 1                                                 variable                     = u                                               [../]                                                                                                                                                             [./left]                                                                           action                       = add_bc                                            isObjectAction               = 1                                                 name                         = BCs/left                                          parser_handle                = 0x7fff67ac40e8                                    type                         = DirichletBC                                       unique_id                    = 21                                                boundary                     = 1                                                 built_by_action              = add_bc                                            execute_on                   = residual                                          use_displaced_mesh           = 0                                                 value                        = 0                                                 variable                     = u                                               [../]                                                                                                                                                           [BCs]                                                                              action                         = no_action                                       name                           = BCs                                             parser_handle                  = 0x7fff67ac40e8                                  unique_id                      = 22                                            []                                                                                                                                                                [Executioner]                                                                      action                         = setup_executioner                               isObjectAction                 = 1                                               l_abs_step_tol                 = -1                                              l_max_its                      = 10000                                           l_tol                          = 1e-05                                           name                           = Executioner                                     nl_abs_step_tol                = 1e-50                                           nl_abs_tol                     = 1e-50                                           nl_max_funcs                   = 10000                                           nl_max_its                     = 50                                              nl_rel_step_tol                = 1e-50                                           nl_rel_tol                     = 1e-10                                           no_fe_reinit                   = 0                                               parser_handle                  = 0x7fff67ac40e8                                  petsc_options                  = -snes_mf_operator                               scheme                         = backward-euler                                  type                           = Steady                                          unique_id                      = 4                                               _mesh                          = 0x7f8fbb4347e0                                  built_by_action                = setup_executioner                             []                                                                                                                                                                [Output]                                                                           action                         = setup_output                                    elemental_as_nodal             = 0                                               exodus                         = 1                                               exodus_inputfile_output        = 1                                               file_base                      = subdomain_constant_ic_test_out                  gmv                            = 0                                               gnuplot_format                 = ps                                              interval                       = 1                                               iteration_plot_start_time      = 1.79769e+308                                    max_pps_rows_screen            = 0                                               name                           = Output                                          nemesis                        = 0                                               output_displaced               = 0                                               output_initial                 = 1                                               output_solution_history        = 0                                               parser_handle                  = 0x7fff67ac40e8                                  perf_log                       = 1                                               postprocessor_csv              = 0                                               postprocessor_gnuplot          = 0                                               postprocessor_screen           = 1                                               print_linear_residuals         = 0                                               screen_interval                = 1                                               show_setup_log_early           = 0                                               tecplot                        = 0                                               tecplot_binary                 = 0                                               unique_id                      = 7                                               xda                            = 0                                             []                                                                                                                                                                [setup_subproblem]                                                                 action                         = setup_subproblem                                coord_type                     = XYZ                                             name                           = setup_subproblem                                parser_handle                  = 0x7fff67ac40e8                                  unique_id                      = 6                                             []                                                                                                                                                                [setup_quadrature]                                                                 action                         = setup_quadrature                                name                           = setup_quadrature                                order                          = AUTO                                            parser_handle                  = 0x7fff67ac40e8                                  type                           = GAUSS                                           unique_id                      = 32                                            []                                                                                                                                                                [setup_dampers]                                                                    action                         = setup_dampers                                   name                           = setup_dampers                                   parser_handle                  = 0x7fff67ac40e8                                  unique_id                      = 42                                            []                                                                                                                                                                [no_action]                                                                        action                         = no_action                                       name                           = no_action                                       parser_handle                  = 0x7fff67ac40e8                                  unique_id                      = 22                                            []                                                                                                                                                                [ICs]                                                                              action                         = no_action                                       name                           = ICs                                             parser_handle                  = 0x7fff67ac40e8                                  unique_id                      = 22                                                                                                                               [./ic_u_1]                                                                         action                       = add_ic                                            isObjectAction               = 1                                                 name                         = ICs/ic_u_1                                        parser_handle                = 0x7fff67ac40e8                                    type                         = ConstantIC                                        unique_id                    = 15                                                block                        = 1                                                 built_by_action              = add_ic                                            value                        = 42                                                variable                     = u                                               [../]                                                                                                                                                             [./ic_u_2]                                                                         action                       = add_ic                                            isObjectAction               = 1                                                 name                         = ICs/ic_u_2                                        parser_handle                = 0x7fff67ac40e8                                    type                         = ConstantIC                                        unique_id                    = 15                                                block                        = 2                                                 built_by_action              = add_ic                                            value                        = 24                                                variable                     = u                                               [../]                                                                          []                                                                                                                                                                [init_problem]                                                                     action                         = init_problem                                    name                           = init_problem                                    parser_handle                  = 0x7fff67ac40e8                                  unique_id                      = 44                                            []                                                                                                                                                                [ICs]                                                                              [./ic_u_aux_1]                                                                     action                       = add_ic                                            isObjectAction               = 1                                                 name                         = ICs/ic_u_aux_1                                    parser_handle                = 0x7fff67ac40e8                                    type                         = ConstantIC                                        unique_id                    = 15                                                block                        = 1                                                 built_by_action              = add_ic                                            value                        = 6.25                                              variable                     = u_aux                                           [../]                                                                                                                                                             [./ic_u_aux_2]                                                                     action                       = add_ic                                            isObjectAction               = 1                                                 name                         = ICs/ic_u_aux_2                                    parser_handle                = 0x7fff67ac40e8                                    type                         = ConstantIC                                        unique_id                    = 15                                                block                        = 2                                                 built_by_action              = add_ic                                            value                        = 9.99                                              variable                     = u_aux                                           [../]                                                                          []                                                                                                                                                                [check_integrity]                                                                  action                         = check_integrity                                 name                           = check_integrity                                 parser_handle                  = 0x7fff67ac40e8                                  unique_id                      = 45                                            []                                                                                                                                                                [no_action]                                                                        action                         = no_action                                       name                           = no_action                                       unique_id                      = 22                                                       @8      @E      @E      @8      @8      @E      @8      @8      @8      @E      @E      @8      @E      @E      @E      @E      @8      @E      @8      @8      @8      @8      @8      @8      @8      @#��G�{@      @      @#��G�{@#��G�{@      @#��G�{@#��G�{@#��G�{@      @      @#��G�{@      @      @      @      @#��G�{@      @#��G�{@#��G�{@#��G�{@#��G�{@#��G�{@#��G�{@#��G�{?�      ?���/�?ײ�Gݬ��¼�,  ���z�$  ?����IQ�?�a���V?�����h�?�����h�?�����h�?��m~ǚ?�����?ӈ�6��#?�@�Z�ɽ¼�,  ?���u�?�d(�`��?��n&��D?�x���,�?�5�Q�&�?�2��(,?�����h����z�$  ?��^�H>?�J&qG��?�����h�@#��G�{@      @      @#��G�{@#��G�{@      @#��G�{@#��G�{@#��G�{@      @      @#��G�{@      @      @      @      @#��G�{@      @#��G�{@#��G�{@#��G�{@#��G�{@#��G�{@#��G�{@#��G�{