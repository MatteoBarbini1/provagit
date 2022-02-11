	module mdl_bin5
* ----------------------------------------------------------------------
      
	integer  i_sh_col(8), i_sh_row(8), i_eros, i_celle
	integer  N_ultimo, N_allagamenti, Nmax_step, Num_sorgenti, i_iniz
	integer  iiij
	integer  i_flag, N_file_output, no_rows, no_columns
	integer  max_celsorg, max_celstr, N_celle_contorno_DEM
	integer  N_stati, N_max_striscia, i_mini
	integer  N_step_entrain, j_finEntrain, i_coordQ, i_coordt
	integer  iiiiii, ii_iniz, i_file_out, i_check_massa_max, i_file77
      integer  N_CPUS, N_threads, NESTED, N_thre1, N_thre2, N_thre3
      integer  N_thre5,N_thre4, tot_Nsorg1
	integer  N_sezioni_interne, N_internal_output_file, N_internal_DT

       integer i_maxValle  ! 11/7/2017

	integer Num_celle_routing, Num_celle_bacino, Num_celle_routing_int
	
	integer j_entr, i_suoli, N_suoli, i_cont_suoli, i_DQ
	integer j_vel_max, j_vel_stramaz_max, i_celle2, i_rout
	
	integer j_TS, i_retint, i_retint2
	
	integer  N_strutture, N_celle_strutt_contigue   ! 23/9/2015

      integer N_Pile, j_pile   ! 25/12/2018

      integer  i_entrato  ! 1/8/2017

      integer  N_ponti  ! 5/12/2019
      integer  N_celle_ponti_max    ! 5/12/2019
	
      integer, allocatable :: N_celle_ponti(:)  ! 5/12/2019
      integer, allocatable :: ic_ponti(:,:) ! 5/12/2019
      integer, allocatable :: ir_ponti(:,:) ! 5/12/2019

	integer, allocatable ::  Nsorg1(:)
	integer, allocatable ::  Nstr1(:)
	integer, allocatable ::  ic_sorg1(:,:)
	integer, allocatable ::  ir_sorg1(:,:)
      integer, allocatable ::  ic_d(:,:,:)
	integer, allocatable ::  ir_d(:,:,:)
      integer, allocatable ::  ic_str1(:,:)
	integer, allocatable ::  ir_str1(:,:)
      integer, allocatable ::  ic_s(:,:,:)
	integer, allocatable ::  ir_s(:,:,:)
	integer, allocatable ::  k(:,:)
	integer, allocatable ::  kk(:,:)
	integer, allocatable ::  ic_eros(:)
	integer, allocatable ::  ir_eros(:)

	integer, allocatable ::  idf(:)
	integer, allocatable ::  j_fin(:)
	integer, allocatable ::  j_fine(:)
	integer, allocatable ::  N_step_input(:)
	integer, allocatable ::  ic_bc(:)
	integer, allocatable ::  ir_bc(:)
	integer, allocatable ::  ic_bc_f(:)
	integer, allocatable ::  ir_bc_f(:)
	integer, allocatable ::  Nsorg2(:)
	integer, allocatable ::  ic_sorg2(:,:)
	integer, allocatable ::  ir_sorg2(:,:)
	integer, allocatable ::  i_tmin(:)
	integer, allocatable ::  j_dir(:,:,:)
	integer, allocatable ::  j_vel(:,:,:)   ! 20 maggio 2015
	
	
	integer, allocatable :: N_celle_sez_intern(:)
      integer, allocatable ::  ic_intern(:,:)
	integer, allocatable ::  ir_intern(:,:)

	integer, allocatable ::  ic_routing(:)
	integer, allocatable ::  ir_routing(:)
	
	integer, allocatable ::  i_file_sforzoPlatea(:)
      
	
	integer, allocatable ::  ic_strutt(:)   ! 23/9/2015
	integer, allocatable ::  ir_strutt(:)   ! 23/9/2015


      integer, allocatable ::  N_celle_sez_internValle(:)  ! 11 lug 2017
      integer, allocatable ::  ic_internValle(:,:)         ! 11 lug 2017
	integer, allocatable ::  ir_internValle(:,:)         ! 11 lug 2017

      integer IC_celmax, IR_celmax   ! 7/9/2017

      integer i_file88  ! 25/10/2017

      integer  i_jj(8)  ! 29/4/2019
	

	real Vtot, UU(8), QQQQQ
	real V_dep_unif, V_dep_belang, V_eros_unif, V_eros_belang, V_DA, V_DB
	real U_stramaz_max
	real Limit_Angle, sin_Limit_Angle
	real Vol_inf, dh_inf, sin_max, dh_infBel, Vol_infBel
	real Coeff_Ang_Limit, PP, Sollecitazione_Verticale
      real QM_U(8), QM_U_TOT, QM_E(8), QM_E_TOT, QM_TOT, QM(8), dens(8)    !  29/4/2019
      real F_entrante(8), F_uscente(8), F_totale(8), h_entrante    !  29/4/2019
      real V_entrante, V_uscente, QM_entrante, QM_uscente     !  29/4/2019
      real control_ele_ponti, control_file_ponti ! 5/12/2019

	real, allocatable :: val_sorg(:,:)
	!real, allocatable :: val_contorno(:,:)
      real, allocatable :: val(:,:)
	real, allocatable :: val_tempi(:,:)
      real, allocatable :: val_flag(:,:)
	real, allocatable :: ele(:,:)
	real, allocatable :: ele_b(:,:)
	real, allocatable :: h_tot(:,:)
	real, allocatable :: h_tot2(:,:)
	real, allocatable :: sen_max(:,:)
	real, allocatable :: peso_max(:,:)
	!real, allocatable :: Q(:,:)
	real, allocatable :: h(:,:)
	real, allocatable :: dh(:,:)
      real, allocatable :: Ch(:,:)
	real, allocatable :: Erod(:,:)
	real, allocatable :: U_crit1(:,:)
	real, allocatable :: senteta_crit(:,:)
      real, allocatable :: dh_sed(:,:)
	real, allocatable :: Eros_tot(:,:)
	real, allocatable :: sen_teta(:,:,:)
	real, allocatable :: senteta(:,:,:)
	real, allocatable :: peso(:,:,:)
	real, allocatable :: peso_d(:,:,:)
	!real, allocatable :: h_affl_sorg(:)
	!real, allocatable :: h_defl_sorg(:)
	!real, allocatable :: h_defl_str(:)
	!real, allocatable :: h_affl_str(:)

	real, allocatable :: dh_entrata_unif(:,:)
	real, allocatable :: dh_entrata_Bel(:,:)

      !real, allocatable :: t(:)  15/01/2013
	real, allocatable :: t_fin(:)
	real, allocatable :: t_inizio(:)
      real, allocatable :: t_1d(:,:)
	real*8, allocatable :: Q_input(:,:)
	real, allocatable :: Q_input_tot(:,:)
	!real, allocatable :: Q_out(:,:)   ! 14/01/2013
	!real, allocatable :: V_fuori_uscito_DT(:)   ! 14/01/2013
	real, allocatable :: dh_contorno(:)
	real, allocatable :: Q_contorno(:)
	real, allocatable :: V_contorno(:,:)
	
	real, allocatable :: t_file(:)
	real, allocatable :: tempo_file(:)
	real, allocatable :: flag(:)

	real, allocatable :: h_finale(:,:)
	real, allocatable :: erosione_finale(:,:)
      real, allocatable :: ele_finale(:,:)
	real, allocatable :: Area_dep_eros_finale(:,:)
	real, allocatable :: Area_dep_eros_ultimo_step(:,:)
	real, allocatable :: velocit(:,:)
	real, allocatable :: direz_vel(:,:)
	real, allocatable :: t_out_minuti(:)
	real, allocatable :: flag_int(:)
	real, allocatable :: h_tot_finale(:,:)  ! 26/1/2015
	real, allocatable :: conc_finale(:,:)    ! 26/1/2015
	
	real, allocatable :: h_finale2(:,:)  ! 7/2/2016
	real, allocatable :: erosione_finale2(:,:)  ! 7/2/2016
      real, allocatable :: ele_finale2(:,:)   ! 7/2/2016
	real, allocatable :: Area_dep_eros_finale2(:,:)  ! 7/2/2016
	real, allocatable :: h_tot_finale2(:,:)  ! 7/2/2016
	real, allocatable :: conc_finale2(:,:)    ! 7/2/2016
	
      
   !   real, allocatable :: V_entrain(:)    ! 14/01/2013
	real, allocatable :: V_entrained_tot(:)
	real, allocatable :: V_entrained_step(:)
	real, allocatable :: t_step_entrain(:)
	real, allocatable :: attivata(:)
	real, allocatable :: V_input_iniziale(:)
	real, allocatable :: V_input(:)
	real, allocatable :: attivata_new(:)
	real, allocatable :: InternalOutput(:,:)
      real, allocatable :: InternalOutputValle(:,:)   ! 11 lug 2017
      real, allocatable :: InternalOutputValleAux(:,:)   ! 11 lug 2017
	real, allocatable :: tempi_output(:)
	real, allocatable :: Q_out_interne(:)
	real, allocatable :: FreeSurf_interne_medio(:) 
	real, allocatable :: Conc_sezioni_interne(:)
	real, allocatable :: ele_interno_medio(:)
      real, allocatable :: ele_iniz_interno_medio(:)   ! 21/7/2017
	real, allocatable :: InletOutlet(:,:)
      real, allocatable :: Erod_Aux(:,:)
      real, allocatable :: Suolo(:,:)
      real, allocatable :: uso_suolo(:)
      real, allocatable :: scabr(:)
      real, allocatable :: ang_eros(:)
      real, allocatable :: vel_eros(:)
      real, allocatable :: Mobile(:)
      real, allocatable :: dh_uscita_sez(:,:)
      real, allocatable :: dh_uscita_solido_sez(:,:)
      real, allocatable :: dh_uscita_tot(:,:)
      real, allocatable :: dh_uscita_solido_tot(:,:)
      real, allocatable :: Q_uscita_interne(:)
      real, allocatable :: Q_uscita_solido_interne(:)
      real, allocatable :: Q_uscita_sez_interne(:)
      real, allocatable :: Q_uscita_solido_sez_interne(:)
      real, allocatable :: flow_depth_interne_medio(:)  ! 21/7/2017
      real, allocatable :: spessore_interne_medio(:)  ! 21/9/2017


      real, allocatable :: Q_out_sez(:)   ! 15/11/2017
	real, allocatable :: FreeSurf_sez(:)    ! 15/11/2017
	real, allocatable :: Conc_sez(:)    ! 15/11/2017
      real, allocatable :: Flow_depth_sez(:)   ! 15/11/2017
	real, allocatable :: Spessore_sez(:)    ! 15/11/2017
	real, allocatable :: Q_uscita_sez(:)    ! 15/11/2017
      real, allocatable :: Q_uscita_solido_sez(:)    ! 15/11/2017
      real, allocatable :: Q_uscitatot_sez(:)    ! 15/11/2017
      real, allocatable :: Q_uscita_solidotot_sez(:)    ! 15/11/2017
      real, allocatable :: Averaged_conc(:)    ! 15/11/2017
      real, allocatable :: Averaged_FreeSurf(:)    ! 15/11/2017
      real, allocatable :: Averaged_Spessore(:)    ! 15/11/2017


      
      real, allocatable :: T_INIZIAL(:)
      
      real, allocatable :: Solid_tot(:,:)
      
      real, allocatable :: h_pre(:,:)
      real, allocatable :: h_post(:,:)
      
      
       real, allocatable :: Q_entrata(:,:)  
       real, allocatable :: dh_entrata_sorg(:,:) 
       
       !real, allocatable :: direz_vel_max(:,:)
       real, allocatable :: conc_max(:,:)
       real, allocatable :: h_tot_max(:,:)
       real, allocatable :: hh_max(:,:)
       real, allocatable :: vel_max(:,:)
       real, allocatable :: spessore_max(:,:)
       
        real, allocatable :: h_sol(:)
       real, allocatable :: htot_sol(:)
       real, allocatable :: eros_sol(:)
        real, allocatable :: vel_sol(:)
         real, allocatable :: direz_vel_sol(:)
         real, allocatable :: conc_sol(:)  ! 18/9/2017
       
          real, allocatable :: ele_iniz(:,:)
          real, allocatable :: magnitudo(:,:)
             real, allocatable :: Erosion_fin(:,:)
             
             real, allocatable :: direz_max(:,:)
          
            real, allocatable :: Conc_input(:,:)
            real, allocatable :: Conc_input_iniziale(:)
            
            real, allocatable :: V_solido_sorg(:)
            real, allocatable :: V_entrato_sorg(:)
            
               real, allocatable :: dh_entrata_solido_sorg(:,:)    
               real, allocatable :: Conc(:,:)  
               real, allocatable :: h_solido(:,:) 
               real, allocatable :: VS_input(:)
               real, allocatable :: dh_entrata_solido(:,:)  
               real, allocatable :: dh_solido(:,:) 
               real, allocatable :: dh_solido_contorno(:)  
               
               real, allocatable :: Q_int_medio(:)
               real, allocatable :: Q_uscita_medio(:)
               real, allocatable :: Q_uscita_solido_medio(:)
               real, allocatable :: Q_uscita_sez_medio(:)
               real, allocatable :: Q_uscita_solido_sez_medio(:)
               real, allocatable :: Ele_medio(:)
               real, allocatable :: ele_iniz_medio(:)  ! 21/7/2017
               real, allocatable :: FRSURF_medio(:)
               real, allocatable :: Flow_depth_medio(:)    ! 21/7/2017
               real, allocatable :: Spessore_medio(:)    ! 21/9/2017
               real, allocatable :: Conc_med(:)
               real, allocatable :: T_intervallo_calcolo(:)
               real, allocatable :: T_intervallo_calcoloELE(:)  ! 21/7/2017
               real, allocatable :: C_star(:)
               real, allocatable :: C_fondo(:,:)
               real, allocatable :: tauMax(:,:)
               real, allocatable :: tauMax_x(:,:)
               real, allocatable :: tauMax_y(:,:)
               real, allocatable :: energia(:,:)
               real, allocatable :: densita(:,:)
               
               real, allocatable :: Vx(:,:)
               real, allocatable :: Vy(:,:)
               real, allocatable :: Vx_max(:,:)
               real, allocatable :: Vy_max(:,:)
               real, allocatable :: Vel_Cella(:,:)
               real, allocatable :: vel_cella_max(:,:)
               real, allocatable :: vel_sol_x(:)
               real, allocatable :: vel_sol_y(:)
               real, allocatable :: Pmax(:,:)
               real, allocatable :: SVmax(:,:)
               real, allocatable :: no_erod(:,:) 
               real, allocatable :: h_noerod(:,:) 
               real, allocatable :: cond_noerod(:)
               real, allocatable :: struttura(:)
               real, allocatable :: codice_struttura(:)
               real, allocatable :: ponte(:)  ! 5/12/2019
               real, allocatable :: quota_critica_ponte(:,:)  ! 5/12/2019
               real, allocatable :: file_ponti(:,:)  ! 5/12/2019
               real, allocatable :: ele_ponti(:,:)  ! 5/12/2019
               real, allocatable :: diff_ponti(:,:)  ! 5/12/2019
               real, allocatable :: codice_ponte(:)  ! 5/12/2019
               real, allocatable :: soletta(:)  ! 5/12/2019
               real, allocatable :: franco(:)  ! 5/12/2019
               real, allocatable :: ponte_ostruito(:)  ! 5/12/2019
               real, allocatable :: volume_ostruzione(:)  ! 5/12/2019
               real, allocatable :: file_strutture(:,:)  ! aggiunta del 21/09/2015
               real, allocatable :: file_strutturecontigue(:,:) ! aggiunta del 23/09/2015


*************************************** PILE 25/12/2018 *********************************

       real, allocatable :: pile(:)  ! 25/12/2018
       real, allocatable :: codice_pile(:)  ! 25/12/2018
       integer, allocatable ::  i_file_sforzoPila(:)   ! 25/12/2018
       integer, allocatable ::  ic_Pile(:)  ! 25/12/2018
       integer, allocatable ::  ir_Pile(:)  ! 25/12/2018
       integer, allocatable ::  i_Pile(:)  ! 25/12/2018
        real, allocatable :: Vx_pre(:)   !  29/4/2019

*****************************************************************************************
               
               
               
      real, allocatable :: Tx(:)
	real, allocatable :: Ty(:)
	real, allocatable :: P(:)
	real, allocatable :: Tx_max(:)
	real, allocatable :: Ty_max(:)
	real, allocatable :: P_max(:)
      real, allocatable :: SV_max(:)
	real, allocatable :: Valore_massimo_T(:)
	real, allocatable :: Valore_massimo_P(:)
      real, allocatable :: Valore_massimo_SV(:)
      real, allocatable :: SOLLECIT_VERT(:)

       real, allocatable :: VolumeEntrato(:)   ! 1/8/2017
       real, allocatable :: VolumeSolidoEntrato(:)   ! 1/8/2017

        real, allocatable :: U_crit2(:,:)   ! 13/9/2017
        real, allocatable :: senteta_crit2(:,:)    ! 13/9/2017

      real, allocatable :: ang_dep(:)  ! aggiunta 13/9/2013
      real, allocatable :: vel_dep(:)  ! aggiunta 13/9/20133

      !real, allocatable :: spessore(:,:)  ! 21/9/2017

      real, allocatable :: Vol_uscita(:) ! 25/10/2017
      real, allocatable :: Vol_uscita_solido(:) ! 25/10/2017   
      real, allocatable :: volume_sez(:) ! 25/10/2017    
      real, allocatable :: Q_uscita(:) ! 25/10/2017    
      real, allocatable :: Q_uscita_solido(:) ! 25/10/2017       
      real, allocatable :: Averaged_flow_depth(:) ! 25/10/2017    
      
      
      
   !    real, allocatable :: dh_x(:,:)   ! 12/7/2018
   !    real, allocatable :: dh_y(:,:)   ! 12/7/2018   

    !   real, allocatable :: dh_xE(:,:)   ! 12/7/2018
    !   real, allocatable :: dh_yE(:,:)   ! 12/7/2018  
    !   real, allocatable :: vel_cella_maxE(:,:) 
   !     real, allocatable :: Vel_CellaE(:,:)

        real, allocatable :: Vel8(:,:,:)   !  29/4/2019
        real, allocatable :: Deltah8(:,:,:)   !  29/4/2019
       
   !     real, allocatable :: VXX(:,:)   !  29/4/2019
   !     real, allocatable :: VYY(:,:)   !  29/4/2019
   !     real, allocatable :: VV(:,:)   !  29/4/2019

    !    real, allocatable :: VXX_max(:,:)   !  29/4/2019
    !    real, allocatable :: VYY_max(:,:)   !  29/4/2019
   !     real, allocatable :: VV_max(:,:)   !  29/4/2019

        
          

               
               
                               	
	
	
      real pixsize, or_easting, or_northing, esterno, undefined
      real dh_eros_tot, dh_eros(8), eros, Egashira, U, dh_neg, rapp
	real control4, control5, control6, control7, lato_cella, sen_tetaj
	real sen_tetatot, ang_deposito, senteta_deposito 
    	real tempo_finale, control_eros, Vel_erosion, Ang_erosion
	real Courant, h_asciutto, control1, Chezy, Erosion, total_eros
	real h_erosione, Egash_eros, Egash_dep, DT1, a_DT, b_DT, c_DT, DT2
	real Area_alluvionata, Area_erosa, Area_inondata

	real h_routing, h_totale_routing, V_total_routing, h_totale2
	real Cmedio_input, celle_attive, T_intervallo
	
	real  V_solido_fuori_uscito_totale, V_solido_fuoriuscito_DT
	



c      erosione/deposito per differenze di altezza

      real D_ele, ang_tot(8), senteta_superf, dh_eros_Belangier, V_step
	real V_dep_step_A, V_eros_step_A, V_dep_step_B, V_eros_step_B


	real Q(8), somma_dh, diff_dh, coeff_dh, U_stramaz(8), Qmaxx
	real Q_CONTORNO_TOTALE, ttttt, Qmax_contorno, Qmax_input

	real  t_step_entrainDT, V_eros_prima, DT_entrain, tt_max
	real  t_minimo, Qseconda, h_defluit, sum_attivata
	real  VOLUME_ENTRATO_IDROGRAMMI
      real  VOLUME_ENTRATO_IDRO, VOLUME_ENTRATO_IDRO_1
      real  VOLSOL_ENTRATO_IDROGRAMMI
      real  VOLSOL_ENTRATO_IDRO, VOLSOL_ENTRATO_IDRO_1
      
	
	real Control_Output, Output_control, Output_massimo
	real Output, Intern_Output,  DT_Internal_Output, rapp_tempi 
	real Check_massa, Check_massa_max, t_minuti, control8
	real Control_InletOutlet1, Control_InletOutlet2, Inlet_massimo
	real h_previous
	real V_eroso_prima, V_depositato_prima, V_fuori_uscito_DT         ! 14/01/2013 
	real t, t1, t2, t_prima, t_dopo, t_check_massa_max, DT_OUTput_secondi
	real Suolo_diff, T_INIZ, DT_OUTPUT_MINUTI, SCRAUSA
	
	real Cmedio, Cstar, Cmax, Volume_solido_eroso, Volume_solido_depositato
	real Volume_solido, h_solid, Volume_solido_eroso_step
	real Volume_solido_depositato_step, C_limite_deposito
	real total_solid, V_solid, volume_solido_intrappolato
	real spessore
	real Check_VS_max, Check_VS, t_check_VS_max, C_input_routing
	real differenza_solido, differ, dh_neg1, dh_neg2, trapped_solid_depth
	real volume_solido_intrappolato_STEP, V_dep_step_C, tempo_scrittura
	real tempo_scrittura_interfaccia, SUOLO_BIS(500), SUOLO_TRIS(500)
	real differenza_liquido, deposito_solido, deposito_liquido
	real Volume_solido_depositato_prima, Volume_solido_eroso_prima
	real tempo_scrittura2   ! aggiunto il 2/3/2015
	real Conc_fuoriuscito   ! aggiunto il 13/6/2015
	
	real quota_finale, cond_eros, sumDT    ! 30/4/2015
	
	real rapp_no_erod, dh_neg_previous      ! 7/5/2015
	
	real densita_max 
	real PP_max, Eros_tot_previous, Solid_tot_previous
	real controllo_inerodibilita, differ2, dif_dif
	real avvertenza_erosione_quota_inerodibile, spessore_erodibile
	

	
	real celle_ele_variata  ! 21/07/2017

       real cel1, cel1max, h1max   ! 7/9/2017

       real Vel_dep_sup ! modifica 13/9/2017

       real celle_attive_sez ! 25/10/2017

          
          real cq  ! 7/10/2019
          
	




	character*5256 fileFormat, fileEle, fileCh, fileSorgente, fileBM
	character*5256 fileIdrogramma, fileErosione, fileVel_inf_eros
	character*5256 fileAng_inf_eros, fileTempi_Allag, fileControllo 
	character*5256 fileComandi, fileHeader, fileEleNuovo, fileBC, fileout
	character*5256 fileVC, fileLog, file_finale, fileERR
	character*5256 file_Internal_Outputs, file_Inlet_Outlet, file_hErod
        character*5256 fileLandChar, fileLandUse, fileSOL1, fileSOL2c 
	character*5256 fileSOL3
	character*5256 fileSOL4, fileSOL5,fileCstar, fileErodibilita 
	character*5256 fileSforzoPlatea
	character*5256 fileStrutture ! aggiunta del 21/09/2015
      character*5256 file_Internal_OutputsValle ! 11/7/2017
      character*5256 fileVel_sup_dep, fileAng_sup_dep   ! 13/9/2017
      character*5256 fileSOL6   ! 13/9/2017
      character*5256 fileElePonti, fileTxtPonti ! 5/12/2019

	character*5256, allocatable :: filename_flowdepth(:)
	character*5256, allocatable :: filename_freesurf(:)
	character*5256, allocatable :: filename_erosiondepth(:)
	character*5256, allocatable :: filename_velmax(:)
	character*5256, allocatable :: filename_veldir(:)
	character*5256, allocatable :: filename_DEM(:)
	character*5256, allocatable :: filename_conc(:)
	character*5256, allocatable :: filename_VelCella(:)
      character*5256, allocatable :: filename_velocit_uscente(:)
	character*5256, allocatable :: filename_direz_vel_uscente(:)
      character*5256, allocatable :: filename_Vx(:)
      character*5256, allocatable :: filename_Vy(:)
      
	
	
	character*120 intestazione_uso_suolo
      character*50 pippone

	character*256 text
      character*25  tipofile
      character*10  byteorder
      character*5   estensione

	character*12  asseq
      character*8  asset
	character*50 asse1

	character*16 pippo_char
	character*3 Sorgente




      
      data     undefined / -8888.0 /, esterno / -9999.0 /
* ----------------------------------------------------------------------
      end module 
