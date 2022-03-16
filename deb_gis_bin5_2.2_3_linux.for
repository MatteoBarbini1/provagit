      program deb_gis_bin5_mod7_3v166103
* -------------------------- Linux version
* -------------------------- ProvaDeb155_completo_par
* -------------------------- Versione deb_gis_bin5_mod_2.2_3.for
* -------------------------- New versione more efficent 
c       inserimento file velocità
      
      use mdl_bin5	
      use OMP_lib !BARBINI
    
      integer i, j, icj, irj, m, otto, nerc, kx, ky, N_iji, jij, ijij
	
	integer icol, irow, iz, ij, index_timing
	integer ii, jj, iii, jjj, iiii, jjjj, mm
	
	integer N_sugg

	integer i_file, i_file2, i_file3, i_file4, i_file5, i_file6

	integer  N_DT, ic1, ir1, iij
      integer  ic, ir, iijj
	integer  i_max, i_cont, i_cont_file

**************************************************** MARZO 09 Boundary condition **************
	integer  N_righe_mezzo, N_colonne_mezzo, N_lati_contorno, i1 , i2
	integer  N_celle_contorno, N_colonne, N_righe, diff_i1, diff_i2
	integer  ic_iniz_sx, ir_iniz_sx, ic_iniz_dx, ir_iniz_dx 
      integer  ic_fin_sx, ir_fin_sx, ic_fin_dx, ir_fin_dx 
	integer  i_shh_col(5), i_shh_row(5), attivazione, indMB1 indMB2 !BERNARD
	integer  i_qhh_col(4), i_qhh_row(4)
	integer  ic_bc_1(10), ic_bc_2(10), ir_bc_1(10), ir_bc_2(10)
***********************************************************************************************
      
	integer*2    get_status


	integer, allocatable ::  i_flag2(:)  !Boundary condition *****
	integer, allocatable ::  i_cont2(:)  !Boundary condition *****
      
      
      integer, allocatable ::  contaCelleSezInt(:) 
	logical controlla_attivazione !BERNARD
	
      real segno, pes, sumpes, pesk
	real sumpesk, h_totale, V_totale,ValoreEsterno

	
	real dh_cost(8), h_affluito, h_defluito, DHH(8), DHH_tot
	real peso_e(8), alfa(40), DDH(8), ddh_tot, peso_s(8)

	real control2, control3


      real zero, coeff, cel, cel_max
	real DT, h_vol, h_vol_str, Qtot, beta, betamin
	real h_fin_destinaz_max, h_fin_origine, h_fin(8), vero, dh_cost_tot
	real h_iniz_destinaz_max, allarme2, h_fine, hh, tempo_iniziale
	real DT_medio, t_simulaz_finale, t_sugg

	real r_ic, r_ir, volume_entrato(100)

**************************************************** MARZO 09 Boundary condition
	real mezzo_riga, mezzo_colonna, lato_bc(8), V_total, V_eros
	real V_fuori_uscito_totale, colonne_dispari, righe_dispari
	real V_entrato, V_netto, V_eroso, V_depositato, urca 
	real dh_cost_max, diff_max, h_origine, diff_elevaz, h_finn
	real DHH_max, V_dep_step, V_eros_step, h_sorgente, h_striscia
****************************************************


      real h_vol_str25, ddh_tot25, h_vol_str28, ddh_tot28, dh25, dh28
	real dh25fing, dh28fing, dh25_26g, dh28_27g, dh25_26s, dh28_27s
	real dh25fins, dh28fins
	real h_solido_pre, pippo1, con_prima
	
      real maxSezInt
      
      real Vaffluito, Vaffluito_striscia1_tot, V_intrappolato
      real V_celle_tot, V_solido_eroso, V_solido_eroso_step
      real V_solido_input_DT_1, V_solido_depositato_step
      real V_solido_depositato, V_solido, V_celle, V_entrato_dt_1
      real  V_affluito, Volume_intrappolato
      real V_solid_input_DT_1,VOLUME_ENTRATO_IDRO,VOLSOL_ENTRATO_IDRO
      real VOLUME_ENTRATO_IDRO_1,VOLSOL_ENTRATO_IDRO_1
      real flag_int_tempo_finale 
      
      
      character*5256 file_name, file_name2, fileElebis, buffer !BERNARD
	character*120  dat, ris
      character*70    allarme, ttt, tempo1
	character*70   tempo2, pippok1, pippok2, pippok3, pippok4, pippok5
	character*70   pippok3b, pippok4b, pippok5b, dat1, dat2, dat3
	character*70    avvert, su4
	character*70   sugg1, sugg2, sugg3, sugg4, warn1, warn2, warn3
      character*70   warn4, warn5, warn6, warn7, warn8
	character*70   warn11, warn12, warn13, warn14, warn15, warn16
	character*70   warn17, warn18, warn19, warn20, domanda1, domanda2
	character*70    string, contorno, num_lati_contorno
	character*8     orario

      real  tt1,tt2,tt3,tt4,tt5,tt6,tt7,tt8,tt9,tt10,tt11,tt12
       
    
      
	i_sh_col = (/  0, -1, -1, -1,  0,  1,  1,  1/) 
	i_sh_row  =(/ -1, -1,  0,  1,  1,  1,  0, -1/)

	i_shh_col = (/ -1, -1, 0,  1,  1/) 
	i_shh_row  =(/  0,  1, 1,  1,  0/)

	i_qhh_col = (/ -1,  0, 1,  0/) 
	i_qhh_row = (/  0,  1, 0, -1/) 

      i_jj = (/  5, 6, 7, 8,  1, 2, 3,  4/) 
	
* ----------------------------------------------------------------------
       TotalCPUS = OMP_get_num_procs()
      CPUs = TotalCPUS
	
      call getarg(1,fileComandi)
      fileLog = fileComandi

                retint = scan (fileLog,'.')
      if (retint > 1) then

      fileLog = fileLog(1:retint-1)//'_out1.txt'
      endif
      open ( 0,file=fileLog,mode='write')


      fileLog = fileComandi

                retint = scan (fileLog,'.')
      if (retint > 1) then

      fileLog = fileLog(1:retint-1)//'_out2.txt'
      endif

      open (20,file=fileLog,mode='write')

      fileLog = fileComandi

                retint = scan (fileLog,'.')
      if (retint > 1) then

      fileLog = fileLog(1:retint-1)//'_out3.txt'
      endif

      open (30,file=fileLog,mode='write')
	      
      fileFormat       =      REPEAT(' ', 256)
      fileCh           =      REPEAT(' ', 256)
      file_Internal_Outputs = REPEAT(' ', 256)
      fileIdrogramma   =      REPEAT(' ', 256)
      fileLandUse      =      REPEAT(' ', 256)
       	fileLandChar     =      REPEAT(' ', 256)
      fileElePonti     =      REPEAT(' ', 256)
      fileTxtPonti     =      REPEAT(' ', 256)

	write(*,*) ' start DFRM model'
	write(*,*) 'insert the name of the input file comand'

      write(*,'("filecomandi = ",a100)') filecomandi
      Write(*,'("Reading the imput comnad")')

	write(*,*) 'open'
          call readinput
	Write(*,*) "decode input"
          call decodeinput (20)
	Write(*,*) "hdr preparing"

          call hdrprepare
      
      call time(orario)
	write (0,'('' data and control acquisition begins at '',a8)')
	1 orario
	write (10,'('' data and control acquisition begins at '',a8)')
	1 orario
	write (0,*)
	
! .............................................................


 
  ! if (Intern_Output.eq.1.0) then
   !   file_Inlet_Outlet = "newinletsoutlets.flt"

       
      ! open ( 1501,file=file_Inlet_Outlet,form='BINARY')
      
  ! !   endif
  
************************  APERTURA FILE ELE 23/01/2013

       fileEle = fileFormat
     
         	retint = scan (fileEle,'.')
      if (retint > 1) then
	
      fileEle = fileEle(1:retint-1)//'.flt'
      endif

		
	open ( 11,file=fileEle,mode='read',form='binary', err=115)
    
************************  APERTURA FILE LOG Novembre 2010

      fileLog = fileComandi
     
        	retint = scan (fileLog,'.')
      if (retint > 1) then
	
      fileLog = fileLog(1:retint-1)//'.log'
      endif

		
	open ( 10,file=fileLog)

************************  APERTURA FILE LOG Novembre 2010 
      
      write(10,'(a1000)') fileLog

            
      fileSOL1 = fileLog
     
         	retint = scan (fileSOL1,'.')
      if (retint > 1) then
	
      fileSOL1 = fileSOL1(1:retint-1)//'_h.soltxt'
      endif

		
	open ( 1000001,file=fileSOL1)
	
	 fileSOL2 = fileLog
     
         	retint = scan (fileSOL2,'.')
      if (retint > 1) then
	
      fileSOL2 = fileSOL2(1:retint-1)//'_htot.soltxt'
      endif

		
	open ( 1000002,file=fileSOL2)

    !  18/9/2017
      fileSOL6 = fileLog
     
         	retint = scan (fileSOL6,'.')
      if (retint > 1) then
	
      fileSOL6 = fileSOL6(1:retint-1)//'_conc.soltxt'
      endif

		
	open ( 1000006,file=fileSOL6)
	
	
	if (control_eros.eq.1.0) then
	
	 fileSOL3 = fileLog
     
         	retint = scan (fileSOL3,'.')
      if (retint > 1) then
	
      fileSOL3 = fileSOL3(1:retint-1)//'_eros.soltxt'
      endif

	
	open ( 1000003,file=fileSOL3)
	endif
	
	
	fileSOL4 = fileLog
     
         	retint = scan (fileSOL4,'.')
      if (retint > 1) then
	
      fileSOL4 = fileSOL4(1:retint-1)//'_vel.sol'
      endif
      
      
      fileSOL5 = fileLog
     
         	retint = scan (fileSOL5,'.')
      if (retint > 1) then
	
      fileSOL5 = fileSOL5(1:retint-1)//'_velCel.sol'
      endif
	
	open ( 1000005,file=fileSOL5)
	
	
	
	

************************  APERTURA BOUNDARY MASK FILE Aprile 2011

   !   fileBM = fileBC
     
    !     	retint = scan (fileBC,'.')
   !  ! if (retint > 1) then
	
    !  fileBM = fileBC(1:retint-1)//'.flt'
   !   endif

		
	!open ( 212,file=fileBM,form='BINARY')

************************  APERTURA BOUNDARY MASK FILE Aprile 2011 

************************  APERTURA ERROR FILE Agosto 2011
 
           
      if(boolFileERR) then !BERNARD writing ERR file    
         	retint = scan (fileLog,'.')
          if (retint > 1) then
	
           fileERR = fileLog(1:retint-1)//'.err'
          endif

		
	    open (19,file=fileERR)
          write(19,'("Error file :",a100)') fileComandi
          write(19,'('' data and control acquisition begins at '',a8)')
	1 orario
      else
          
      endif

************************  APERTURA APERTURA ERROR FILE Agosto 2011
 


************************  APERTURA FILES FINAL_ELEVATION, FLOODED TIMES AND OUTFLOW Aprile 2011
      

      fileEleNuovo = fileComandi
     
         	retint = scan (fileEleNuovo,'.')
      if (retint > 1) then
	
      fileEleNuovo = fileEleNuovo(1:retint-1)//'_last_step_elevation'
	1//'.flt'
      endif

      retint = scan (fileEleNuovo,'.')
	if (retint > 1) then
      fileHeader = fileEleNuovo(1:retint-1)//'.hdr'
      if (fileHeader /= fileFormat) call HdrWrite (fileHeader)
      endif

		
	open (4,file=fileEleNuovo,form='BINARY')



      fileTempi_Allag = fileComandi
     
         	retint = scan (fileTempi_Allag,'.')
      if (retint > 1) then
	
      fileTempi_Allag = fileTempi_Allag(1:retint-1)//'_flooding_times'
	1//'.flt'
      endif

	 	retint = scan (fileTempi_Allag,'.')
	if (retint > 1) then
      fileHeader = fileTempi_Allag(1:retint-1)//'.hdr'
      if (fileHeader /= fileFormat) call HdrWrite (fileHeader)
      endif


	open (50,file=fileTempi_Allag,form='BINARY')


	fileVC = fileComandi
     
         	retint = scan (fileVC,'.')
      if (retint > 1) then
	
      fileVC = fileVC(1:retint-1)//'_outflow'//'.flt'
      endif


	
		 	retint = scan (fileVC,'.')
	if (retint > 1) then
      fileHeader = fileVC(1:retint-1)//'.hdr'
      if (fileHeader /= fileFormat) call HdrWrite (fileHeader)
      endif


	open ( 21,file=fileVC,form='BINARY')

      
************************  APERTURA FILES FINAL_ELEVATION, FLOODED TIMES AND OUTFLOW Aprile 2011       	

      otto = 8
	
      allarme = "allarme continuita' non rispettata"


      dat1 = "nome file dati1"
	dat2 = "nome file dati2"
	dat3 = "nome file dati3"
	ris = "control file name"

	sugg1 = "write again the column and row index of the cell"
	sugg2 = "write again the time value"
	sugg3 = "write again the discharge value"
	warn1 = "Warning the cell is out of DEM: the simulation "
	warn2 = "could give wrong results" 
	warn3 = "Warning: a time value is negative: the simulation"
	warn4 = "Warning: a discharge value is negative: the simulation"
	warn5 = "Warning: mass conservation not respected in source cell"
	warn6 = "source area n°    column and row index     time"
      warn7 = "Warning: mass conservation not respected in stripe cell"
	warn8 = "stripe n°    column and row index     time"
	warn11 = "Warning: the DEM binary raster file and the no"
	warn12 = "dimensional Chezy coefficiente binary raster file"
	warn13 = "do not match"  
	warn14 = "the simulation could give wrong results"
	warn15 = "uniform flow mass transfer"
	warn16 = "broad creasted weir mass transfer"
	warn17 = "Warning: output files number exceeds the allowed value"
	warn18 = "time step number"
      warn19 = "Warning: boundary cells have not no data value"
	warn20 = "the simulation could fail"
      
      
	V_celle_tot = 0.0
	Vaffluito_striscia1_tot = 0.0
	Vaffluito = 0.0
	Vdefluito = 0.0

	N_max_striscia = 0
	Vol_inf = 0.0
	Vol_infBel = 0.0
		
      write(10,'("Limit Angle ",f10.2)') Limit_Angle
      volume_intrappolato = 0.0
        allocate (error_map(no_columns,no_rows))
        allocate (ic_d(no_columns,no_rows,otto))
	  allocate (ir_d(no_columns,no_rows,otto))
	  allocate (ic_s(no_columns,no_rows,otto))
        allocate (ir_s(no_columns,no_rows,otto))
	  allocate (k(no_columns,no_rows))
	  allocate (kk(no_columns,no_rows))
	  allocate (h_tot(no_columns,no_rows))
	  allocate (ele(0:no_columns+1,0:no_rows+1)) !CORRETTO BERNARD 16/07/2021
	  allocate (ele_b(no_columns,no_rows))
	  allocate (val(no_columns,no_rows))
	  allocate (val_sorg(no_columns,no_rows))
	  allocate (val_tempi(no_columns,no_rows))
	  allocate (val_flag(no_columns,no_rows))
	  allocate (sen_max(no_columns,no_rows))
	  allocate (peso_max(no_columns,no_rows))
	  allocate (h(no_columns,no_rows))
	  allocate (dh(no_columns,no_rows))
	  allocate (Ch(no_columns,no_rows))
	  allocate (peso(no_columns,no_rows,otto))
	  allocate (peso_d(no_columns,no_rows,otto))
	  allocate (Erod(no_columns,no_rows))
	  allocate (U_crit1(no_columns,no_rows))
        allocate (U_crit2(no_columns,no_rows))  ! AGGIUNTA 13/9/2017
	  allocate (C_fondo(no_columns,no_rows))
	  allocate (senteta_crit(no_columns,no_rows))
        allocate (senteta_crit2(no_columns,no_rows))    ! AGGIUNTA 13/9/2017
        allocate (dh_sed(no_columns,no_rows))
	  allocate (Eros_tot(no_columns,no_rows))
	  allocate (sen_teta(no_columns,no_rows,otto))
	  allocate (senteta(no_columns,no_rows,otto))
        allocate (dh_entrata_unif(no_columns,no_rows))
	  allocate (dh_entrata_Bel(no_columns,no_rows)) 
        allocate (velocit(no_columns,no_rows))
  	  allocate (dh_entrata_sorg(no_columns,no_rows))
	  allocate (dh_entrata_solido_sorg(no_columns,no_rows))
	  allocate (h_solido(no_columns,no_rows))
	  allocate (Conc(no_columns,no_rows))
	  allocate (dh_entrata_solido(no_columns,no_rows))
	  allocate (dh_solido(no_columns,no_rows))
	  allocate (h_finale(no_columns,no_rows)) 
	  allocate (erosione_finale(no_columns,no_rows))
	  allocate (ele_finale(no_columns,no_rows))
	  allocate (Area_dep_eros_finale(no_columns,no_rows))
	  allocate (Area_dep_eros_ultimo_step(no_columns,no_rows))
	  allocate (Erod_Aux(no_columns,no_rows))  !  19/01/2013
	  allocate (Suolo(no_columns,no_rows))    !  19/01/2013
	  allocate (Solid_tot(no_columns,no_rows))  ! 30 Marzo 2013
	  allocate (h_pre(no_columns,no_rows))  ! 3 Maggio 2013
	  allocate (h_post(no_columns,no_rows)) ! 3 Maggio 2013
	  allocate (Q_entrata(no_columns,no_rows))    !   14/05/2013
	  allocate (h_tot_max(no_columns,no_rows))    !   30/1/2015
	  allocate (conc_max(no_columns,no_rows))    !   30/1/2015
	  allocate (hh_max(no_columns,no_rows))    !   31/05/2013
        allocate (vel_max(no_columns,no_rows))  !   31/05/2013
        allocate (direz_max(no_columns,no_rows))  !   36/11/2013
        allocate (h_tot_finale(no_columns,no_rows))    !   30/1/2015
        allocate (conc_finale(no_columns,no_rows))    !   30/1/2015
	  allocate (j_dir(no_columns,no_rows,otto))
	  allocate (j_vel(no_columns,no_rows,otto))   ! 20 maggio 2015
	  allocate (direz_vel(no_columns,no_rows))
        allocate (ele_iniz(no_columns,no_rows))    !     6/06/2013
        allocate (spessore_max(no_columns,no_rows))  !   6/06/2013      
        allocate (tauMax(no_columns,no_rows))    !    27/04/2015
        allocate (tauMax_x(no_columns,no_rows))  !   27/04/2015
        allocate (tauMax_y(no_columns,no_rows))  !   27/04/2015
        allocate (energia(no_columns,no_rows))   !   27/04/2015
        allocate (densita(no_columns,no_rows))   !   27/04/2015
        allocate (Vx(no_columns,no_rows))   !   29/04/2015
        allocate (Vy(no_columns,no_rows))   !   29/04/2015
        allocate (Vel_Cella(no_columns,no_rows)) !   29/04/2015
        allocate (Vel_Cella_max(no_columns,no_rows)) !   29/04/2015
        allocate (Vx_max(no_columns,no_rows)) !   29/04/2015
        allocate (Vy_max(no_columns,no_rows)) !   29/04/2015
        allocate (Pmax(no_columns,no_rows)) !   7/05/2015
        allocate (SVmax(no_columns,no_rows)) !   25/07/2018
        allocate (no_erod(no_columns,no_rows)) !   30/04/2015
        allocate (Vel8(no_columns,no_rows,8)) !  29/4/2019
        allocate (Deltah8(no_columns,no_rows,8)) !  29/4/2019
        allocate (file_ponti(no_columns,no_rows))  !  5/12/2019
        allocate (ele_ponti(no_columns,no_rows))  !  5/12/2019
        allocate (quota_critica_ponte(no_columns,no_rows))  !  5/12/2019
        allocate (cell_eros(no_columns,no_rows))
      
      j_dir = 0
      j_vel = 0  ! 20 maggio 2015
     


	Nmax_step = 0
	i_cont_file = 0
	
	
	
****************************************************************************************
*             SCRITTURA FILE DATI INIZIALE
****************************************************************************************

      	if (control1.eq.1.0) then
      WRITE(10,*) 
	WRITE(10,'("DISTRIBUTED PARAMETERS VALUES")')
	WRITE(10,*)
	WRITE(10,*)
	else
	WRITE(10,*) 
	WRITE(10,'("CONSTANT PARAMETERS VALUES")')
	WRITE(10,*)
	WRITE(10,*)
      WRITE(10,'("CHEZY coefficient",2x,f10.3)') Chezy
	endif

	WRITE(10,'("simulation time (sec) = "f15.2)') tempo_finale
    !  WRITE(10,'("time step number = ",I10)') N_stati
!	WRITE(10,'("max number of input cells for hydrograph = ",I10)') 
!	1max_celsorg
	!WRITE(10,'("max number of routing cells in a stripe = ",I10)')
	!1 max_celstr
	write(10,'("Inferior Limit Angle for debris flow routing ",f10.2)')
	1 Limit_Angle
  !    WRITE(10,'("number of input hydrograph = ",I10)') Num_sorgenti
      WRITE(10,'("Courant number = ",f10.3)') Courant
      WRITE(10,'("minimum flow depth (m) for routing = ",f10.5)') 
	1h_routing

*********************  AGGIUNTO 7/10/2019 *******************************  TOLTO 8/10/2019
  !    cq = 1.0
 !     write(10,*)
 !     write(10,'("discharge coefficient",2x,f10.3)') cq
 !    write(10,*)
************************************************************************

	if (control_eros.eq.1.0) then

       	if (control1.eq.2.0) then

	   write (10,'(''Erosion inferior velocity (m/s)   :'',f10.3)') 
	1Vel_erosion
	   write (10,'(''Erosion inferior angle (deg)      :'',f10.3)') 
	1Ang_erosion

      write  (10,'(''Superior deposit velocity (m/s)   :'',f10.4)')    ! modifica 13/9/2017
	1 Vel_dep_sup    
	write  (10,'(''Superior deposit angle (°)        :'',f10.5)')     ! modifica 13/9/2017
	1 ang_deposito  


	    endif

	write  (10,'(''Egashira erosion coefficient     :'',f10.2)')  
	1Egash_eros  
      write  (10,'(''Egashira deposition coefficient  :'',f10.2)')  
	1Egash_dep      
 !     write  (10,'(''Superior deposit velocity (m/s)   :'',f10.4)')    ! modifica 13/9/2017
!	1 Vel_dep_sup    
!	write  (10,'(''Superior deposit angle (°)        :'',f10.5)')    ! modifica 13/9/2017
!	1 ang_deposito  
	write  (10,'(''Minimum Flow Depth for Eros/Dep(m):'',f10.5)') 
	1 h_erosione 
	write  (10,'(''Inferior Limit Angle (°) for debris flow routing:'',
	1f10.2)') Limit_Angle 

	endif

		if (CPUs.gt.TotalCPUS) CPUs = TotalCPUS
      write  (10,'(''Number of setted threads:'',
	1i4,'' / '',i4,'' Threads'')') CPUS, int(TotalCPUS)      

		!  file volumi e portate nel tempo



		file_name2 = "_IN_OUT_Discharges.m"
	retint = scan (fileLog,'.')
      if (retint > 1) then
	     file_finale = fileLog(1:retint-1)//'_'//file_name2
      endif


		open (22,file=file_finale)


	write(22,'(" clear all")')
	write(22,*)
	write(22,*)



		file_name2 = "_IN_OUT_Volumes.m"
	retint = scan (fileLog,'.')
      if (retint > 1) then
	     file_finale = fileLog(1:retint-1)//'_'//file_name2
      endif



		open (24,file=file_finale)


		write(24,'(" clear all")')
	write(24,*)
	write(24,*)


	write(24,'(" data = [  % time(hrs)  input (m^3)  output (m^3)   
	1IN (m^3) deposited (m^3)  eroded (m^3)")')
	
	file_name2 = "_sedvolconc.m"
	retint = scan (fileLog,'.')
      if (retint > 1) then
	     file_finale = fileLog(1:retint-1)//'_'//file_name2
      endif



		open (210001,file=file_finale)
		
			write(210001,'(" clear all")')
	write(210001,*)
	write(210001,*)
	
	
	write(210001,'("sedvolconc = [")')




****************************************************************************************
*                     CONTROLLO FILE RASTER DI INPUT
****************************************************************************************
      
	
	
	if (control_eros.eq.1.0) then    ! aggiunto il 20 Dicembre 2010

       if (h_erosione.lt.h_routing) then

      write(0,'(" WARNING: minimum erosion flow depth is less than")')
	write(0,'("minimum flow depth for routing: the simulation")') 
	write(0,'("could give wrong results")')
	WRITE(0,*)

	write(10,'("Warning: minimum erosion flow depth is less than")')
	write(10,'("minimum flow depth for routing: the simulation")') 
	write(10,'("could give wrong results")')

	   endif

      endif


		
	write(10,*)
      
      ele=esterno
      do irow = 1, no_rows
	    do icol = 1, no_columns
           
            Ch(icol,irow) = esterno
	      Erod(icol,irow) = esterno
	      No_erod(icol,irow) = esterno
	        	      
	  enddo
      enddo
      
      do ir = 1,no_rows
        do ic=1,no_columns
            read (11) (ele(ic,ir))  ! raster elevazioni
            if (isnan(ele(ic,ir))) ele(ic,ir)=esterno
            if (abs(ele(ic,ir))>10**9) ele(ic,ir)=esterno
        enddo
      enddo


      close(11)


****************************************************************************
*           Calcolo numero di celle del bacino  10/12/2012
****************************************************************************


       
         do irow = 1, no_rows
	    do icol = 1, no_columns
           
       if(ele(icol,irow).ne.esterno) Num_celle_bacino = 
	1Num_celle_bacino + 1    
	           	      
	    enddo
	   enddo
	   
	  




	allocate (ic_routing(Num_celle_bacino))
	allocate (ir_routing(Num_celle_bacino))
	
	allocate (ic_sol(Num_celle_bacino)) !BARBINI
	allocate (ir_sol(Num_celle_bacino)) !BARBINI
	allocate (h_sol(Num_celle_bacino))
	allocate (htot_sol(Num_celle_bacino))
	allocate (eros_sol(Num_celle_bacino))
	!allocate (vel_sol(Num_celle_bacino))
	!allocate (direz_vel_sol(Num_celle_bacino))
	
	allocate (vel_sol_x(Num_celle_bacino))  ! 29/4/2015
	allocate (vel_sol_y(Num_celle_bacino))   ! 29/4/2015

      allocate (conc_sol(Num_celle_bacino))    ! 18/9/2017


c      controllo che il DEM non abbia celle sul contorno

 !     control3 = 0.0
 !
	!
	!do irow = 1, no_rows
 !     
	!if (ele(1,irow).ne.esterno.or.ele(no_columns,irow).ne.esterno)
	!1 then
 !    
 !     control3 = 1.0
 !
 !
 !
	!endif
 !
	!enddo

	!
	!do icol = 1, no_columns
	!
	!	
 !     if (ele(icol,1).ne.esterno.and.ele(icol,no_rows).ne.esterno)
	!1 then
 !
 !     control3 = 1.0
 !
	!
 !
	!
	!endif
 !
	!enddo
 !
	!
	!  if (control3.eq.1) then
 !
 !     write(0,'(" WARNING: some DEM file raster boundary cells are")')
	!write(0,'("not external cell: the simulation could fail or give")') 
	!write(0,'("wrong results")')
	!WRITE(0,*)
 !
	!write(10,'("Warning: some DEM file raster boundary cells are")')
	!write(10,'("not external cells: the simulation could fail or give")') 
	!write(10,'("wrong results")')
 !
	!  endif
	  
	  fileCh = fileComandi
     
         	retint = scan (fileCh,'.')
      if (retint > 1) then
	
      fileCh = fileCh(1:retint-1)//'_Chezy'//'.flt'
      endif


	
		 	retint = scan (fileCh,'.')
	if (retint > 1) then
      fileHeader = fileCh(1:retint-1)//'.hdr'
      if (fileHeader /= fileFormat) call HdrWrite (fileHeader)
      endif
      
       fileErosione = fileComandi
     
         	retint = scan (fileErosione,'.')
      if (retint > 1) then
	
      fileErosione = fileErosione(1:retint-1)//'_mobilebed'//'.flt'
      endif


	
		 	retint = scan (fileErosione,'.')
	if (retint > 1) then
      fileHeader = fileErosione(1:retint-1)//'.hdr'
      if (fileHeader /= fileFormat) call HdrWrite (fileHeader)
      endif
            fileCstar = fileComandi
     
         	retint = scan (fileCstar,'.')
      if (retint > 1) then
	
      fileCstar = fileCstar(1:retint-1)//'_rest_concentration'//'.flt'
      endif


	
		 	retint = scan (fileCstar,'.')
	if (retint > 1) then
      fileHeader = fileCstar(1:retint-1)//'.hdr'
      if (fileHeader /= fileFormat) call HdrWrite (fileHeader)
      endif
	 

        
	  
      
      fileErodibilita = fileComandi
     
         	retint = scan (fileErodibilita,'.')
      if (retint > 1) then
	
      fileErodibilita = fileErodibilita(1:retint-1)//'_control_erosion'
     1//'.flt'
      endif
      	
		 	retint = scan (fileErodibilita,'.')
	if (retint > 1) then
      fileHeader = fileErodibilita(1:retint-1)//'.hdr'
      if (fileHeader /= fileFormat) call HdrWrite (fileHeader)
      endif
       
	  	  
	open ( 12,file=fileCh,form='binary', err=140)
	open ( 13,file=fileErosione,form='binary', err=152)
	open ( 133,file=fileErodibilita,form='binary', err=153)
	open ( 131213,file=fileCstar,form='binary', err=1515)
	
	if (control_eros.eq.1.0) then
	

       fileVel_inf_eros = fileComandi
     
         	retint = scan (fileVel_inf_eros,'.')
      if (retint > 1) then
	
      fileVel_inf_eros = fileVel_inf_eros(1:retint-1)//'_Vel_inf_eros'
     1//'.flt'
      endif


	
		 	retint = scan (fileVel_inf_eros,'.')
	if (retint > 1) then
      fileHeader = fileVel_inf_eros(1:retint-1)//'.hdr'
      if (fileHeader /= fileFormat) call HdrWrite (fileHeader)
      endif
      
      
       fileAng_inf_eros = fileComandi
     
         	retint = scan (fileAng_inf_eros,'.')
      if (retint > 1) then
	
      fileAng_inf_eros = fileAng_inf_eros(1:retint-1)//'_Ang_inf_eros'
     1//'.flt'
      endif
      
      ! write(*,*) fileVel_inf_eros,  fileAng_inf_eros


	
		 	retint = scan (fileAng_inf_eros,'.')
	if (retint > 1) then
      fileHeader = fileAng_inf_eros(1:retint-1)//'.hdr'
      if (fileHeader /= fileFormat) call HdrWrite (fileHeader)
      endif


      ! INIZIO AGGIUNTA   13/9/2017

       fileVel_sup_dep = fileComandi
     
         	retint = scan (fileVel_sup_dep,'.')
      if (retint > 1) then
	
      fileVel_sup_dep = fileVel_sup_dep(1:retint-1)//'_Vel_sup_dep'
     1//'.flt'
      endif


	
		 	retint = scan (fileVel_sup_dep,'.')
	if (retint > 1) then
      fileHeader = fileVel_sup_dep(1:retint-1)//'.hdr'
      if (fileHeader /= fileFormat) call HdrWrite (fileHeader)
      endif
      
      
       fileAng_sup_dep = fileComandi
     
         	retint = scan (fileAng_sup_dep,'.')
      if (retint > 1) then
	
      fileAng_sup_dep = fileAng_sup_dep(1:retint-1)//'_Ang_sup_dep'
     1//'.flt'
      endif
      
      ! write(*,*) fileVel_inf_eros,  fileAng_inf_eros


	
		 	retint = scan (fileAng_sup_dep,'.')
	if (retint > 1) then
      fileHeader = fileAng_sup_dep(1:retint-1)//'.hdr' 
      if (fileHeader /= fileFormat) call HdrWrite (fileHeader)
      endif

         ! FINE AGGIUNTA   13/9/2017



      
      open ( 14,file=fileVel_inf_eros,form='binary',err=160)
      open ( 15,file=fileAng_inf_eros,form='binary',err=170)
      open ( 131214,file=fileVel_sup_dep,form='binary',err=161)    ! modifica 13/9/2017
      open ( 131215,file=fileAng_sup_dep,form='binary',err=171)      ! modifica 13/9/2017
      
      
      do irow = 1, no_rows
		do icol = 1, no_columns

	      U_crit1(icol,irow) = esterno
	      senteta_crit(icol,irow) = esterno
	      C_fondo(icol,irow) = esterno
            U_crit2(icol,irow) = esterno  ! modifica 13/9/2017
            senteta_crit2(icol,irow) = esterno    ! modifica 13/9/2017
	      error_map(icol,irow) = esterno
            
			         enddo
	         enddo
        
     
      
      endif
      
      
      if (control1.eq.2.0) then
      cell_eros = esterno
       do irow = 1, no_rows
					do icol = 1, no_columns

	     If(ele(icol,irow).ne.esterno) then

         if (control_eros.eq.1.0) then
         
	   Erod(icol,irow) = 1.0
	   !No_erod(icol,irow) = 1.0    !  aggiunta del 17/12/2015
	   cell_eros(icol,irow) = 0
	   else
	   
	   Erod(icol,irow) = 0.0
	   No_erod(icol,irow) = 0.0
	     
	   endif
	     endif

			         enddo
	         enddo
	         
	   endif
	  
	  
      !  lettura file uso suolo
	     

	if (control1.eq.1.0) then

      ValoreEsterno=externalValue(fileLandUse)

      do ir = 1,no_rows

        do ic=1,no_columns 
            read (69) (Suolo(ic,ir) )  ! raster suolo
            
            if (Suolo(ic,ir).eq.ValoreEsterno
     1.and.esterno.ne.ValoreEsterno)   then
                Suolo(ic,ir)=esterno
            endif
            if (abs(Suolo(ic,ir))>10**9) then
                Suolo(ic,ir)=esterno
            endif
            if (isnan(Suolo(ic,ir))) Suolo(ic,ir)=esterno
        
        enddo
      enddo  ! raster suolo

      

       
     
      close(69)
    

c      controllo che il DEM file e il file raster di uso suolo si sovrappongano esattamente

      control4 = 0.0

	do irow = 1, no_rows
      do icol = 1, no_columns

	if (ele(icol,irow).eq.esterno.and.Suolo(icol,irow).ne.esterno) 
	1then

	control4 = 1.0

	endif
	
		
      if (ele(icol,irow).ne.esterno.and.Suolo(icol,irow).eq.esterno)
	1 then

      control4 = 1.0

	endif

	enddo
	enddo


      if (control4.eq.1.0) then

	write(0,'(" WARNING: the DEM raster file and the land use raster")')
	write(0,'("file do not overlap:")')
	write(0,'("the simulation could fail or give wrong results")') 
	WRITE(0,*)

	write(10,'("Warning:the DEM raster file and the land use raster")')
	write(10,'("file do not overlap:")')
	write(10,'("the simulation could fail or give wrong results")') 

	endif


!       Determinazione del numero dei suoli
      
	Suolo_diff = 100.0
	i_suoli = 0

	Erod_Aux = Suolo

      do while (Suolo_diff.gt.0.0)

      Suolo_diff = 0.0

      do irow = 1, no_rows
      do icol = 1, no_columns

	if (Erod_Aux(icol,irow).gt.0.0) Suolo_diff = Erod_Aux(icol,irow)

	enddo
	enddo

	if (Suolo_diff.gt.0.0) then
	
	i_suoli = i_suoli + 1
	
	Suolo_tris(i_suoli) = Suolo_diff
	
	
	
	
	!write(*,'("i_suoli",2x,I5)') i_suoli
      !write(*,*) suolo_diff
      !write(10,*) i_suoli, suolo_diff
	  do irow = 1, no_rows
      do icol = 1, no_columns

	if (Erod_Aux(icol,irow).eq.Suolo_diff) Erod_Aux(icol,irow) = 0.0

	enddo
	enddo

	endif

	enddo  ! fine ciclo while
	
	N_suoli = i_suoli
	
	!  controllo che i file suoli .flt e .txt si sovrappongano esattamente
	
	  read(70,*)
	  
	  j = 1
	  
	  do while (j > 0)
	  
       read (70,*,err=136, end=101) Suolo_bis(j)
       j = j + 1
     
   
       enddo
101   continue  

        j = j - 1

        if (N_suoli.ne.j) then
        
        write(10,'(" WARNING NUMBER OF LAND TYPES IN LAND USE RASTER AND 
     1 TXT FILES DOES NOT COINCIDE: SIMULATION COULD FAIL OR GIVE WRONG 
     1RESULTS")')
     
      write(30,'(" WARNING NUMBER OF LAND TYPES IN LAND USE RASTER AND 
     1 TXT FILES DOES NOT COINCIDE: SIMULATION COULD FAIL OR GIVE WRONG 
     1RESULTS")')
     
       write(0,'(" WARNING NUMBER OF LAND TYPES IN LAND USE RASTER AND 
     1 TXT FILES DOES NOT COINCIDE: SIMULATION COULD FAIL OR GIVE WRONG 
     1RESULTS")')
     
      WRITE(0,*)
      WRITE(30,*)
      
      write(10,*)
      
      Write(10,'("soils of the raster file")')
      write(10,*)
      do i = 1, N_Suoli
      
      write(10,*) i, Suolo_tris(i)
      
      enddo
      
       write(10,*)
      
      Write(10,'("soils of the txt file")')
      write(10,*)
      
      
      do i = 1, j
      
     
       write(10,*) i, Suolo_bis(i)
        enddo
        
        else
        
        !  controllo che gli identificativi dell'uso suolo corrispondano
        
          i_cont_suoli = 0
        
           DO I = 1, N_suoli
           
              do ij = 1, N_suoli
           
        if (Suolo_bis(i).eq.Suolo_tris(ij)) then
        
        i_cont_suoli = i_cont_suoli + 1
        Suolo_tris(ij) = 0.0
           
        endif   
           
             enddo
           
           
           enddo
           
           if (i_cont_suoli.lt.N_suoli) then
           
         write(10,'(" WARNING LAND TYPES OF LAND USE RASTER AND TXT
     1 FILES DOES NOT OVERLAP: SIMULATION COULD FAIL OR GIVE WRONG 
     1RESULTS")')
     
      write(30,'(" WARNING LAND TYPES OF LAND USE RASTER AND TXT
     1 FILES DOES NOT OVERLAP: SIMULATION COULD FAIL OR GIVE WRONG 
     1RESULTS")')
     
       write(0,'(" WARNING LAND TYPES OF LAND USE RASTER AND TXT
     1 FILES DOES NOT OVERLAP: SIMULATION COULD FAIL OR GIVE WRONG 
     1RESULTS")')
     
       WRITE(0,*)
       WRITE(30,*)
        
           
           
           endif
        
        
        
        endif


	close(70)
	
	open ( 70,file=fileLandChar)
	
	
	
      allocate (uso_suolo(N_suoli))
      allocate (scabr(N_suoli)) 
       allocate (struttura(N_suoli))  ! modifica 20/7/2015
        allocate (codice_struttura(N_suoli))  ! modifica 20/7/2015
         allocate (codice_ponte(N_suoli))  !  modifica 5/12/2019
         allocate (ponte(N_suoli))  !  modifica 5/12/2019
         
    
************************** PILE 25/12/2018 ***********************
 !        allocate (pile(N_suoli))  ! modifica 25/12/2015
 !       allocate (codice_pile(N_suoli))  ! modifica 25/12/2015
******************************************************************
      
      if (control_eros.eq.1.0) then
      allocate (Mobile(N_suoli))
      allocate (ang_eros(N_suoli))
      allocate (vel_eros(N_suoli))
       allocate (ang_dep(N_suoli))  ! aggiunta 13/9/2013
      allocate (vel_dep(N_suoli))   ! aggiunta 13/9/2013
      allocate (C_star(N_suoli))
      allocate (cond_noerod(N_suoli))
       endif
	
	write(10,*)
	write(10,'("Number of soils ",3x,I5)') N_suoli
	write(10,*)
	write(10,*)
	
	!write(*,'("Cstar =",2x,f20.10)') Cstar
	
	read(70,'(a120)') intestazione_uso_suolo
	
	write(10,'(a120)') intestazione_uso_suolo
	write(10,*)
	
	if (control_eros.eq.1.0) then 
	
	   if (Cstar.gt.0.0) then
***************************************** PILE 25/12/2018 ******************************************
!	do i = 1, N_suoli
!	  read(70,*) uso_suolo(i), scabr(i), Mobile(i), ang_eros(i),
!     1 vel_eros(i), ang_dep(i), vel_dep(i), cond_noerod(i), struttura(i)
!     1, pile(i)   ! modifica 20/7/2015 e 13/9/2017 e 25/12/2018
!	  write(10,'(9f12.1)') uso_suolo(i), scabr(i), Mobile(i), ang_eros(i), 
!	1vel_eros(i), ang_dep(i), vel_dep(i), cond_noerod(i), struttura(i)
!     1, pile(i)   ! modifica 20/7/2015 e 13/9/2017 e 25/12/2018  ! modifica 20/7/2015  e 13/9/2017
*******************************************************************************************************

      do i = 1, N_suoli
	  read(70,*) uso_suolo(i), scabr(i), Mobile(i), ang_eros(i),
     1 vel_eros(i), ang_dep(i), vel_dep(i), cond_noerod(i), struttura(i)
     1, ponte(i)   ! modifica 20/7/2015 e 13/9/2017 e 5/12/2019
	  write(10,'(9f12.1)') uso_suolo(i), scabr(i), Mobile(i), ang_eros(i), 
	1vel_eros(i), ang_dep(i), vel_dep(i), cond_noerod(i), struttura(i)
     1 , ponte(i) ! modifica 20/7/2015  e 13/9/2017 e 5/12/2019
	
	
		!  AGGIUNTA 28/9/2016
	
	IF (ang_eros(i).le.ang_dep(i)) THEN   ! modifica 13/9/2017
	
	 write(0,'("Warning: the inferior erosion angle of soil",I5)') i 
	 write(0,'("is lower than the deposition angle:")')  
	 write(0,'("results could be not reliable")')  
       write(10,'("Warning: the inferior erosion angle of soil",I5)') i 
       write(10,'("is lower than the deposition angle:")')  
	 write(10,'("results could be not reliable")') 
	
	
	ENDIF
	
	
	enddo
	
	
	
	  		    write(10,*)
          write(10,*)
          
          else
          
          do i = 1, N_suoli
********************************** PILE 25/12/2018 ********************************          
 !        read(70,*) uso_suolo(i), scabr(i), Mobile(i), ang_eros(i),
 !    1 vel_eros(i), ang_dep(i), vel_dep(i), C_star(i), cond_noerod(i), 
 !    1struttura(i), pile(i)   ! modifica 20/7/2015 e 13/9/2017 e 25/12/2018
 !	  write(10,'(10f12.2)') uso_suolo(i), scabr(i), Mobile(i), ang_eros(i), 
 !	1vel_eros(i), ang_dep(i), vel_dep(i), cond_noerod(i), struttura(i),
 !    1pile(i), C_star(i)   ! modifica 20/7/2015 e 13/9/2017 e 25/12/2018                                                             ! modifica 20/7/2015 e 13/9/2017
************************************************************************************

        read(70,*) uso_suolo(i), scabr(i), Mobile(i), ang_eros(i),
     1 vel_eros(i), ang_dep(i), vel_dep(i), C_star(i), cond_noerod(i), 
     1struttura(i), ponte(i)                                                   ! modifica 20/7/2015 e 13/9/2017 e 5/12/2019
	  write(10,'(10f12.2)') uso_suolo(i), scabr(i), Mobile(i), ang_eros(i), 
	1vel_eros(i), ang_dep(i), vel_dep(i), cond_noerod(i), struttura(i),
     1 C_star(i), ponte(i)                                                 ! modifica 20/7/2015 e 13/9/2017 e 5/12/2019
		
	
	!  AGGIUNTA 28/9/2016
	
	IF (ang_eros(i).le.ang_dep(i)) THEN   ! modifica 13/9/2017
	
	 write(0,'("Warning: the inferior erosion angle of soil",I5)') i 
	 write(0,'("is lower than the deposition angle:")')  
	 write(0,'("results could be not reliable")')  
       write(10,'("Warning: the inferior erosion angle of soil",I5)') i 
       write(10,'("is lower than the deposition angle:")')  
	 write(10,'("results could be not reliable")') 
	
	
	
	ENDIF
	
	   enddo
          
          endif
      
          else
************************************* PILE 25/12/2018 **************************************************************          
 !         do i = 1, N_suoli
!	  read(70,*) uso_suolo(i), scabr(i), struttura(i), pile(i)   ! modifica 20/7/2015 e 13/9/2017 e 25/12/2018    
!	  write(10,'(3f12.1)') uso_suolo(i), scabr(i), struttura(i), pile(i)   ! modifica 20/7/2015 e 13/9/2017 e 25/12/2018  
!      enddo
**********************************************************************************************************************
         
          do i = 1, N_suoli
	  read(70,*) uso_suolo(i), scabr(i), struttura(i), ponte(i)    ! modifica 23/9/2015 e 5/12/2019
	  write(10,'(3f12.1)') uso_suolo(i), scabr(i), struttura(i), 
     1ponte(i)  ! modifica 20/7/2015 e 5/12/2019
      enddo
      
      
      
          
          write(10,*)
          write(10,*)
          
          endif
          
          
          ! AGGIUNTA 28/9/2016
          
          
                       
                             
                            
        do irow = 1, no_rows
           do icol = 1, no_columns

	           if (ele(icol,irow).ne.esterno) then
	
	             do i = 1, N_suoli
	                   if (Suolo(icol,irow).eq.uso_suolo(i)) then
	                   
	                      Ch(icol,irow) = scabr(i)
	                      
	                      if (control_eros.eq.1.0) then
	                      
	                      Erod(icol,irow) = Mobile(i)
	                      
	                      No_erod(icol,irow) = cond_noerod(i)
	                      
	                      U_crit1(icol,irow) = vel_eros(i)
	                      senteta_crit(icol,irow) = ang_eros(i)

                             U_crit2(icol,irow) = vel_dep(i)
	                      senteta_crit2(icol,irow) = ang_dep(i)
	                      
	                      
	                      if (Cstar.gt.0.0) then
	                      
	                        C_fondo(icol,irow) = Cstar	                        
	                                             
	                           else
	                                            
	                        C_fondo(icol,irow) = C_star(i)

                                
	                      	                      	                      
	                      endif
	                      
	                      
	                      
	                         else
	                         
	                        Erod(icol,irow) = 0.0
	                        No_erod(icol,irow) = 0.0
	                      
	                      endif
	                   
	                   endif
	             enddo
	             
	                              
	
	           endif

	     enddo
	  enddo
	  
       
      
	else
	
	
   		if (Chezy.eq.0.0) write(0,'("Warning: the Chezy coefficient
	1is 0.0: no flow propagation computed")')

	   if (Chezy.eq.0.0) write(10,'("Warning: the Chezy coefficient
	1is 0.0: no flow propagation computed")')


	        do irow = 1, no_rows
					do icol = 1, no_columns

	  if  (ele(icol,irow).ne.esterno) Ch(icol,irow) = Chezy

			         enddo
	         enddo

      	if (control_eros.eq.1.0) then
    

c      parametri concentrati per l' erosione del bacino

         

      if (Vel_erosion.eq.0.0) then 
	write(0,'("Warning: the superior erosion velocity is 0.0: always 
	1erosion could be computed")')
	write(10,'("Warning: the superior erosion velocity is 0.0: always 
	1erosion could be computed")') 
	endif
    !  DA CONTROLLARE C_FONDO = Cstar
	do irow = 1, no_rows
					do icol = 1, no_columns

	  if  (ele(icol,irow).ne.esterno) then
	   U_crit1(icol,irow) = Vel_erosion
         U_crit2(icol,irow) = Vel_dep_sup  ! aggiunta 13/9/2017
	   C_fondo(icol,irow) = Cstar
	  endif
	  

			         enddo
	         enddo


	if (Ang_erosion.eq.0.0) then 
	write(0,'("Warning: the inferior erosion angle is 0.0: always 
	1erosion could be  computed")')
      write(10,'("Warning: the inferior erosion angle is 0.0: always 
	1erosion coul be computed")')
	endif
	
	!  AGGIUNTA 28/9/2016
	
	IF (ang_erosion.le.ang_deposito) THEN
	
	write(0,'("Warning: the inferior erosion angle is lower than the 
     1deposition angle: results could be not reliable")')
      write(10,'("Warning: the inferior erosion angle is lower than the 
     1deposition angle: results could be not reliable")')
	
      ENDIF
	
      if (ang_deposito.eq.0.0) then
	write(0,'("Warning: the deposition angle is 0.0: deposit is always
	1 computed")')
	write(10,'("Warning: the deposition angle is 0.0: deposit is 
	1always computed")')
	endif

	if (Vel_dep_sup.eq.0.0) then
	write(0,'("Warning: the deposition velocity is 0.0: deposit is 
	1always computed")')
	write(10,'("Warning: the deposition velocity is 0.0: deposit is 
	1always computed")')
      endif
      
      do irow = 1, no_rows
					do icol = 1, no_columns

	if  (ele(icol,irow).ne.esterno) senteta_crit(icol,irow) = 
	1Ang_erosion

      
	if  (ele(icol,irow).ne.esterno) senteta_crit2(icol,irow) = 
	1Ang_deposito   ! aggiunta 13/9/2017

			         enddo
	         enddo

      endif  ! chiusura control_eros
      endif  !  chiusura control1
      
      
      if (control_eros.eq.1.0) then
      
       	
	if (Egash_eros.eq.0.0) then
	write(0,'("Warning: the Egashira coefficient is 0.0: no erosion 
	1computed")')
      write(10,'("Warning: the Egashira coefficient is 0.0: no erosion 
	1computed")')
	endif


		if (Egash_dep.eq.0.0) then
	write(0,'("Warning: the Egashira coefficient is 0.0: no deposition 
	1computed")')
      write(10,'("Warning: the Egashira coefficient is 0.0: no depositio
	1n computed")')
	endif

	 endif
	 
	 
***********************************************************************************
*     CALCOLO NUMERO DI STRUTTURE PRESENTI  aggiunta del 20/7/2015
***********************************************************************************


       N_strutture = 0 

      if (control_eros.eq.1.0) then
      
       do i = 1, N_suoli
       
         codice_struttura(i) = 0.0  ! AGGIUNTA DEL 22/9/2015
      
        if (cond_noerod(i).eq.1.0.and.struttura(i).eq.1.0) then
      
          N_strutture = N_strutture + 1
      
            codice_struttura(N_strutture) = uso_suolo(i)
      
        endif
      
            
       enddo
      
            
         else
         
                  
        if (struttura(i).eq.1.0) then
      
          N_strutture = N_strutture + 1
      
            codice_struttura(N_strutture) = uso_suolo(i)
      
        endif
      
               
      endif
      
      if (N_strutture.ge.1) then
      
           write(10,*)
           WRITE(10,'("NUMBER OF STRUCTURAL ELEMENTS SUBJECTED TO SHEAR 
     1STRESS",2X,I10)') N_strutture
           write(10,*)
           
           allocate (Tx(N_strutture))
            allocate (Ty(N_strutture))
             allocate (P(N_strutture))
              allocate (SOLLECIT_VERT(N_strutture))
              allocate (i_file_sforzoPlatea(N_strutture))
               allocate (file_strutture(no_columns,no_rows))  ! AGGIUNTA DEL 22/9/2015
                 allocate (file_strutturecontigue(no_columns,no_rows))  ! AGGIUNTA DEL 23/9/2015
               
               do ir = 1, no_rows
       do ic = 1, no_columns
       
          if (ele(ic,ir).eq.esterno) then
       
       file_strutture(ic,ir) = esterno
       file_strutturecontigue(ic,ir) = esterno
       
         else
       
        file_strutture(ic,ir) = 0.0
        file_strutturecontigue(ic,ir) = 0.0
              
          endif
       
       enddo
             enddo 
               
               
              
********************************************************************
*   Apertura file sforzi platea  2/5/2015 modificato il 21/7/2015
********************************************************************   
              
             
             do iii = 1, N_strutture
        
        
           if (iii.lt.10) 
	1write(file_name,'("_sforzoPlatea",I1,".dat")') iii

      if (iii.ge.10.and.iii.lt.100)
     1write(file_name,'("_sforzoPlatea",I2,".dat")') iii
     
      
        
      file_name2 = file_name
	retint = scan (fileLog,'.')
      if (retint > 1) then
      file_name = fileLog(1:retint-1)//file_name2
      endif
      
      
       i_file_sforzoPlatea(iii) = 134 + iii
       !write(10,*) i_file_sforzoPlatea
       !write(10,*) file_name
       
       !write(*,*) i_file_sforzoPlatea, file_name

      open(i_file_sforzoPlatea(iii),file=file_name,err=1500)
        
      
      !open ( i_file_sforzoPlatea(iii),file=fileSforzoPlatea,err=149)
      
      write(i_file_sforzoPlatea(iii),'("%         tempo (sec)         Tx
     1 (N/m^2)          Ty         (N/m^2)             P (N/m^2)")')
      write(i_file_sforzoPlatea(iii),*)  
      
***************************  AGGIUNTA 22/9/2015  ******************
***************************  FILE STRUTTURE      ******************
      do ir = 1, no_rows
       do ic = 1, no_columns
       if (suolo(ic,ir).eq.codice_struttura(iii)) then
       
         !file_strutture(ic,ir) = float(iii)
       file_strutture(ic,ir) = 1.0
       
       endif
       
       
       enddo
       enddo
******************************* FINE AGGIUNTA 22/9/2015 ************

      
      enddo  ! fine ciclo apertura file sforzo platea 
!        write(*,'("struttura",2x,2f20.10)') file_strutture(342,273), 
 !    1suolo(342,273)
      
************************  APERTURA FILE STRUTTURE 22/9/2015 *******

      fileStrutture = fileComandi
     
         	retint = scan (fileStrutture,'.')
      if (retint > 1) then
	
      fileStrutture = fileStrutture(1:retint-1)//'_strutture.flt'
      endif

		 retint = scan (fileStrutture,'.')
	if (retint > 1) then
      fileHeader = fileStrutture(1:retint-1)//'.hdr'
      if (fileHeader /= fileFormat) call HdrWrite (fileHeader)
      endif  
      
      open(147021,file=fileStrutture,form='binary',err=1501)
             
             do ir = 1,no_rows

      write (147021) (file_strutture(ic,ir), ic=1,no_columns)  
      
             enddo
             
      close(147021)
      
       
      
      ! RICERCA FILE CON CELLE CON STRUTTURA O CONTIGUE  A STRUTTURA   23/9/2015
      
      
        ! RICERCA FILE CON CELLE CON STRUTTURA O CONTIGUE  A STRUTTURA   23/9/2015
      
      
     
      
        do ir = 1, no_rows
       do ic = 1, no_columns
       if (file_strutture(ic,ir).eq.1.0) then
       
        file_strutturecontigue(ic,ir) = 2.0
        
        
        N_celle_strutt_contigue = N_celle_strutt_contigue + 1
        
        do j = 1,8
	         
	            icj = ic + i_sh_col(j)
                  irj = ir + i_sh_row(j)

      	          if (ele(icj,irj).ne.esterno) then

	if (val_sorg(icj,irj).ne.100) then
	        
	      	        
	 file_strutturecontigue(icj,irj) = 2.0
	 
	 endif
	 endif
	 
	 enddo
	   
        
        
       
       endif       
       enddo
       enddo
       
       fileStrutture = fileComandi
     
         	retint = scan (fileStrutture,'.')
      if (retint > 1) then
	
      fileStrutture = fileStrutture(1:retint-1)//'_strutture2.flt'
      endif

		 retint = scan (fileStrutture,'.')
	if (retint > 1) then
      fileHeader = fileStrutture(1:retint-1)//'.hdr'
      if (fileHeader /= fileFormat) call HdrWrite (fileHeader)
      endif  
      
      open(147021,file=fileStrutture,form='binary',err=1501)
             
             do ir = 1,no_rows

      write (147021) (file_strutturecontigue(ic,ir), ic=1,no_columns)  
      
             enddo
             
      close(147021)
       
       
       
      
      N_celle_strutt_contigue =0
      
              
      do ir = 1, no_rows
       do ic = 1, no_columns
       if (file_strutturecontigue(ic,ir).eq.2.0) then
       
        N_celle_strutt_contigue = N_celle_strutt_contigue + 1
            
      
       endif
       enddo
      enddo
      
      
      allocate(ic_strutt(N_celle_strutt_contigue))
      allocate(ir_strutt(N_celle_strutt_contigue))
      
      i = 0
      
      do ir = 1, no_rows
       do ic = 1, no_columns
       if (file_strutturecontigue(ic,ir).eq.2.0) then
       
       i = i + 1
       ic_strutt(i) = ic
       ir_strutt(i) = ir
       
       endif
       enddo      
      enddo
      
      
      endif

****************************************
*  CALCOLO NUMERO DI PONTI   5/12/2019
****************************************

         do ir = 1,no_rows
           read (33) (ele_ponti(ic,ir), ic=1,no_columns)  
         enddo

         N_ponti = 0

         do i = 1, N_suoli

         if (ponte(i).eq.1.0) then    
         N_ponti = N_ponti + 1
         endif

         enddo

          close(33)
          allocate (ponte_ostruito(N_ponti))  !  modifica 5/12/2019
          allocate (N_celle_ponti(N_ponti))  !  modifica 5/12/2019
          allocate (soletta(N_ponti))  !  modifica 5/12/2019
          allocate (franco(N_ponti))  !  modifica 5/12/2019
        
         do i = 1, N_ponti            
          read(34,*) soletta(i),franco(i)
         enddo

          j = 0
         do i = 1, N_suoli
             
        if (ponte(i).eq.1.0) then
      
          j = j + 1
      
            codice_ponte(j) = uso_suolo(i)
      
        endif

        enddo
      
            



!            allocate (ponte_ostruito(N_ponti))  !  modifica 5/12/2019
!           allocate (N_celle_ponti(N_ponti))  !  modifica 5/12/2019
           allocate (Volume_ostruzione(N_ponti))  !  modifica 5/12/2019

            do i = 1, N_ponti

            ponte_ostruito(i) = 0.0
            N_celle_ponti(i) = 0

            enddo


         write(10,*)
        write(10,'("numero di ponti",3x,I7)') N_ponti
         write(10,*)


       
         !  calcolo file ponti

           do ir = 1, no_rows
       do ic = 1, no_columns
       
          if (ele(ic,ir).eq.esterno) then
       
       file_ponti(ic,ir) = esterno
     
       
         else

        file_ponti(ic,ir) = esterno
        
        do i = 1, N_ponti

       if (Suolo(ic,ir).eq.codice_ponte(i)) then
        file_ponti(ic,ir) = codice_ponte(i)  ! al limite mettere float(i) invece che codice_ponte(i)
        N_celle_ponti(i) = N_celle_ponti(i) + 1
        endif
        enddo

        endif
       
       
       enddo
             enddo 

             N_celle_ponti_max = 0
             do i = 1, N_ponti
            if (N_celle_ponti(i).gt.N_celle_ponti_max) then
            N_celle_ponti_max = N_celle_ponti(i)
           endif
           enddo


              allocate (ic_ponti(N_ponti,N_celle_ponti_max))  !  modifica 5/12/2019
              allocate (ir_ponti(N_ponti,N_celle_ponti_max))  !  modifica 5/12/2019
              allocate (diff_ponti(N_ponti,N_celle_ponti_max))  !  modifica 5/12/2019

              diff_ponti = 0.0


               do i = 1, N_ponti

               j = 0

                do ir = 1, no_rows
       do ic = 1, no_columns
        
               

       if (Suolo(ic,ir).eq.codice_ponte(i)) then
        j = j + 1
        ic_ponti(i,j) = ic 
        ir_ponti(i,j) = ir 
        endif
       

       enddo
       
       
       enddo
             enddo 


             write(10,*)
             write(10,'("celle ponti")')
             write(10,*)

             do i = 1, N_ponti

             write(10,'("Ponte n. ",I5)') i
             write(10,*)

             do j = 1, N_celle_ponti(i)
             write(10,*) ic_ponti(i,j), ir_ponti(i,j)
             enddo

             write(10,*)

             enddo

             
             !  CONTROLLO FILE ELE_PONTI

           !  controllo sovrapposizione DEM con file ELE_PONTI

           control_ele_ponti = 0.0

             do icol = 1, no_columns
               do irow = 1, no_rows

      if (ele(icol,irow).eq.esterno.and.ele_ponti(icol,irow).ne.esterno)
	1 then

       control_ele_ponti = 1.0
       endif

    
               enddo
               enddo
           
      if (control_ele_ponti.eq.1.0) then

      write(0,'("Warning: the DEM raster file and bridge elevation")')
	write(0,'(" raster file do not overlap:")')
	write(0,'("the simulation could fail or give wrong results")') 

	write(10,'("Warning:the DEM raster file and the bridge elevation")')
	write(10,'(" raster file do not overlap:")')
	write(10,'("the simulation could fail or give wrong results")') 

      endif



      control_file_ponti = 0.0
                

             do ic = 1, no_columns
               do ir = 1, no_rows

             if (file_ponti(ic,ir).ne.esterno) then

         if (file_ponti(ic,ir).ne.0.0.and.ele_ponti(ic,ir).le.0.0) then

           control_file_ponti = 1.0

         endif

         if (file_ponti(ic,ir).eq.0.0.and.ele_ponti(ic,ir).ne.0.0) then

           control_file_ponti = 1.0

         endif


             endif



                enddo

             enddo


              if (control_file_ponti.eq.1.0) then

      write(0,'("Warning: the bridge raster file and bridge ")')
	write(0,'(" elevation raster file do not overlap:")')
	write(0,'("the simulation could fail or give wrong results")') 

	write(10,'("Warning:the bridge raster file and the bridge elevation")')
	write(10,'(" raster file do not overlap:")')
	write(10,'("the simulation could fail or give wrong results")') 

      endif

         
      !  SPOSTATO QUI DAL CICLO DI CALCOLO PER DIMIMUIRE TEMPI DI SIMULAZIONE IL 17/12/2015
      
      avvertenza_erosione_quota_inerodibile = 0.0
      controllo_inerodibilita = 0.0
      
      do j = 1,no_rows
	 do jj = 1, no_columns
	 
	   IF (no_erod(jj,j).eq.1.0) THEN
	   
	   controllo_inerodibilita = 1.0
	   
	   ENDIF
	   
	   enddo
	   enddo
	
      
      
      

	 
	   ! scrittura file raster caratteristiche suolo
	  
	  
          do ir = 1,no_rows

      write (12) (Ch(ic,ir), ic=1,no_columns)  ! raster Ch
      write (133) (No_erod(ic,ir), ic=1,no_columns)  ! raster Erodibilità
      write (13) (Erod(ic,ir), ic=1,no_columns)  ! raster fondo mobile
      write (131213) (C_fondo(ic,ir), ic=1,no_columns)  ! raster Concentrazione fondo

      enddo
      
       close(12)
       close(13)
       close(133)
       close(131213)
        if (control_eros.eq.1.0) then

            
      do ir = 1,no_rows

      write (14) (U_crit1(ic,ir), ic=1,no_columns)  ! raster velocità di erosione

      enddo
    
      do ir = 1,no_rows

      write (15) (senteta_crit(ic,ir), ic=1,no_columns)  ! raster teta eros

      enddo
      
	do ir = 1,no_rows

      write (131214) (U_crit2(ic,ir), ic=1,no_columns)  ! raster velocità di erosione

      enddo
    
      	do ir = 1,no_rows

      write (131215) (senteta_crit2(ic,ir), ic=1,no_columns)  ! raster teta eros

      enddo          
      
      close(14)
      close(15)
      close(131214)
      close(131215)
      !  30/4/2015
      
      cond_eros = 0.0
      
      
      do ij = 1, N_suoli
      
      if (cond_noerod(ij).eq.1.0)  cond_eros = 1.0
      
      enddo
            
      
      if (cond_eros.eq.1.0) then
      
      
       allocate(h_noerod(no_columns,no_rows)) !   30/04/2015
      
              
      do irow = 1, no_rows
           do icol = 1, no_columns

	           if (ele(icol,irow).ne.esterno) then
	
	             do i = 1, N_suoli
	                   if (Suolo(icol,irow).eq.uso_suolo(i)) then
	                   
	                                            
	                      if (cond_noerod(i).eq.1.0) then
	                      
	                      h_noerod(icol,irow) = ele(icol,irow)
	                      
	                      else
	                      
	                      h_noerod(icol,irow) = 0.0
	                      
	                      
	                      endif
	                      endif
	                      
	                      enddo
	                      
	                      else
	                      
	                      h_noerod(icol,irow) = esterno
	                      
	                      endif
	                      
	                      enddo
	                      enddo
      
                        
      file_hErod = fileComandi
     
         	retint = scan (file_hErod,'.')
      if (retint > 1) then
	
      file_hErod = file_hErod(1:retint-1)//'_ele_noerosion'//'.flt'
      endif

	
		 	retint = scan (file_hErod,'.')
	if (retint > 1) then
      fileHeader = file_hErod(1:retint-1)//'.hdr'
      if (fileHeader /= fileFormat) call HdrWrite (fileHeader)
      endif
      
      
      
      !write(*,*) file_hErod
      
           
      open ( 134,file=file_hErod,form='binary', err=154)
            
      
      do ir = 1,no_rows

      write (134) (h_noerod(ic,ir), ic=1,no_columns)  ! raster altezza limite di erosione

      enddo
      
      endif
      
      close(134)
      
              
      
  !   ! senteta_deposito = sind(ang_deposito)  !  tolto il 13/09/2017
      
      sin_Limit_Angle = sind(Limit_Angle)  ! 1/2/2013
      
      write(*,*) Limit_Angle, sin_Limit_Angle	    
    
    
    		do irow = 1, no_rows
      do icol = 1, no_columns

	if (senteta_crit(icol,irow).ne.esterno) then

	senteta_crit(icol,irow) = sind(senteta_crit(icol,irow))
      senteta_crit2(icol,irow) = sind(senteta_crit2(icol,irow))    !  aggiunto il 13/09/2017

	endif
	
	enddo
	enddo
	
	endif


       C_limite_deposito = 0.05
	
	! INSERIMENTO 29 MARZO 2013
	
       if (Cstar.gt.0.0) then
	
	Cmax = 0.9*Cstar
	
		else
	
	Cmax = 0.9*MAXVAL(C_star)
	
	endif
	
	  write(10,*)
	  write(10,'("Mean input solid concentration = ",1x,f10.3)') Cmedio
	  write(10,*)
	  
	  if (Cstar.gt.0.0) then
	   write(10,'("Rest solid concentration = ",1x,f10.3)') Cstar
	  endif
	  
	  write(10,*)
	  write(10,*)
	  write(10,'("Maximum routing solid concentration = ",1x,f10.3)') Cmax
	  write(10,*)
	  write(10,*)
	  write(10,'("Solid concentration inferior limit for deposition = "
	1,1x,f10.3)') C_limite_deposito
	  write(10,*)

       Cmedio_input = Cmedio
       
       tempo_scrittura = 0.0
        
        
        
        IF (Cmax.le.Cmedio) THEN
        
        WRITE(0,'("WARNING MEAN INPUT SOLID CONCENTRATION LARGER THAN 
     190% OF REST SOLID CONCENTRATION: SIMULATION COULD GIVE WRONG 
     1RESULTS")')
     
        WRITE(10,'("WARNING MEAN INPUT SOLID CONCENTRATION LARGER THAN 
     190% OF REST SOLID CONCENTRATION: SIMULATION COULD GIVE WRONG 
     1RESULTS")')
        
        
        ENDIF
             file_name2 = "_parallel.m"
	retint = scan (fileLog,'.')
      if (retint > 1) then
	     file_finale = fileLog(1:retint-1)//'_'//file_name2
      endif
      open(1299,file = file_finale)
      write(1299,'(" clear all")')
      write(1299,'(" Threads number",i3)') omp_get_num_procs()
	write(1299,'(" Device number",i3)') omp_get_num_devices()
      write(1299,'(" get default Device",i3)') omp_get_default_device()
      call omp_set_default_device(1)
      write(1299,'("set 1 default Device",i3)') omp_get_default_device()
****************************************************************************************
*                         ACQUISIZIONE SEZIONI E CELLE PER INTERNAL OUTPUT
****************************************************************************************

      if (Intern_Output.eq.1.0) then


	      
      allocate(InternalOutput(no_columns,no_rows))	 
      allocate(InternalOutputValle(no_columns,no_rows))	!  11 Lug 2017
      allocate(InternalOutputValleAux(no_columns,no_rows))	!  11 Lug 2017
      allocate(dh_uscita_sez(no_columns,no_rows))	!  11 Lug 2017
      allocate(dh_uscita_solido_sez(no_columns,no_rows))	!  11 Lug 2017
      allocate(dh_uscita_tot(no_columns,no_rows))	!  11 Lug 2017
      allocate(dh_uscita_solido_tot(no_columns,no_rows))	!  11 Lug 2017
     
      allocate(contaCelleSezInt(999))
      contaCelleSezInt=0
      maxSezInt=0

      ValoreEsterno=externalValue(file_Internal_Outputs)
		do ir = 1,no_rows
            do ic= 1,no_columns 
                read (16) (InternalOutput(ic,ir))  ! raster internal output
                if (InternalOutput(ic,ir).eq.ValoreEsterno
     1.and.esterno.ne.ValoreEsterno) then
                  InternalOutput(ic,ir)=esterno
                  endif
                if (abs(InternalOutput(ic,ir))>10**9) 
     1InternalOutput(ic,ir)=esterno
                if (isnan(InternalOutput(ic,ir))) 
     1InternalOutput(ic,ir)=esterno
                
      !CONTEGGIO CELLE PER OGNI SEZIONE INTERNA BERNARD febbraio 2021
                if (InternalOutput(ic,ir)/=esterno) then
                    contaCelleSezInt(int(InternalOutput(ic,ir)-999))=
     1contaCelleSezInt(int(InternalOutput(ic,ir)-999))+1
                    if (InternalOutput(ic,ir)>maxSezInt) maxSezInt=
     1InternalOutput(ic,ir)
                     
                    
                endif
         end do
        enddo
      
	      Nsez=int(maxSezInt-999)
      allocate (sezioniInterne(Nsez))

      do i =1,Nsez
        allocate(sezioniInterne(i)%seqCell(contaCelleSezInt(i)))
        sezioniInterne(i)%index=0
        sezioniInterne(i)%direzioni=0
      enddo


      do ir = 1,no_rows
      do ic =1,no_columns
      !bool=isnan(InternalOutput(ic,ir)
        InternalOutputValle(ic,ir)=esterno
        if (InternalOutput(ic,ir)/=esterno) then
            i=int(InternalOutput(ic,ir)-999)

            sezioniInterne(i)%index=sezioniInterne(i)%index+1
            sezioniInterne(i)%seqCell(sezioniInterne(i)%index)%ic=ic
            sezioniInterne(i)%seqCell(sezioniInterne(i)%index)%ir=ir
        endif
      enddo
      enddo
      write(1299,*) "sez99",Nsez
      call Sezioni999()   !BERNARD
      do ir = 1,no_rows
        write (16666666) (InternalOutputValle(ic,ir), ic=1,no_columns)
      enddo
      
      close (16)       !BERNARD
      close (16666666) !BERNARD   
      
      retint = scan (file_Internal_OutputsValle,'.')
      if (retint > 1) then
      fileHeader = file_Internal_OutputsValle(1:retint-1)//'.hdr'
      if (fileHeader /= fileFormat) call HdrWrite (fileHeader)
      endif           
      ! Controllo sovrapposizione con file ele
      
       control7 = 0.0

	do irow = 1, no_rows
      do icol = 1, no_columns

	if (ele(icol,irow).eq.esterno.and.InternalOutput(icol,irow).ne.
	1esterno) then

	control7 = 1.0

	endif
	
	enddo
	enddo
	
	 if (control7.eq.1.0) then

	write(0,'("Warning: the DEM raster file and the internal output")')
	write(0,'(" raster file do not overlap:")')
	write(0,'("the simulation could fail or give wrong results")') 

	write(10,'("Warning:the DEM raster file and the internal output")')
	write(10,'(" raster file do not overlap:")')
	write(10,'("the simulation could fail or give wrong results")') 

	endif

    ! 11/7/2017
      control7 = 0.0

	do irow = 1, no_rows
      do icol = 1, no_columns

	if (ele(icol,irow).eq.esterno.and.InternalOutputValle(icol,irow).ne.
	1esterno) then

	control7 = 1.0

	endif
	
	enddo
	enddo
	
	 if (control7.eq.1.0) then

	write(0,'("Warning: the DEM raster file and the second internal ")')
	write(0,'(" output raster file do not overlap:")')
	write(0,'("the simulation could fail or give wrong results")') 

	write(10,'("Warning:the DEM raster file and the second internal ")')
	write(10,'(" output raster file do not overlap:")')
	write(10,'("the simulation could fail or give wrong results")') 

	endif
	
	! controllo del file output
	
		
	 Control_Output = 0.0
	
	do irow = 1, no_rows
         do icol = 1, no_columns
         
         if (InternalOutput(icol,irow).eq.1000.0) then ! correzione da 1000 a 1000.0 del 18/7/2017
         
          Control_Output = 1.0
           
         
         endif
         
                
         
         enddo
        enddo
        
        if (Control_Output.eq.0.0) then
        
      write(0,'(" Warning: internal output raster file bad built:")')
	write(0,'(" the simulation could fail or give wrong results")') 

	write(10,'(" Warning: internal output raster file bad built:")')
	write(10,'(" the simulation could fail or give wrong results")') 
        
        
        endif

        ! 11/7/2017
         Control_Output = 1.0
	
	do irow = 1, no_rows
         do icol = 1, no_columns

         if (InternalOutputValle(icol,irow).ne.esterno) then
         
       if (InternalOutputValle(icol,irow).ne.0.0.and.InternalOutputValle
     1(icol,irow).ne.999.0) then ! 11/7/2017
         
          Control_Output = 0.0
           
         
         endif

         endif
         
                
         
         enddo
        enddo
        
        if (Control_Output.eq.0.0) then
        
      write(0,'(" Warning: internal output raster file bad built:")')
	write(0,'(" the simulation could fail or give wrong results")') 

	write(10,'(" Warning: internal output raster file bad built:")')
	write(10,'(" the simulation could fail or give wrong results")') 
        
        
        endif
        
       
	Output_massimo = 0.0
	
	  do irow = 1, no_rows
         do icol = 1, no_columns
         
         if (InternalOutput(icol,irow).gt.Output_massimo) 
     1   Output_massimo = InternalOutput(icol,irow)
                 
         enddo
        enddo 


        ! 11/7/2017

        InternalOutputValleAux = InternalOutputValle

         do irow = 1, no_rows
         do icol = 1, no_columns
         
         if (InternalOutputValle(icol,irow).eq.999.0) 
     1   InternalOutputValleAux(icol,irow) = 0.0
                 
         enddo
        enddo 
	
	
	
	
	N_sezioni_interne = int(Output_massimo) - 1000 + 1 
	
	i = 0
	i_max = 0
	
	  do while (i.le.N_sezioni_interne)
	  
	    i = i + 1
	    i_cont = 0
	  	  
	  do irow = 1, no_rows
         do icol = 1, no_columns
         
         if (InternalOutput(icol,irow).eq.(999.0 + float(i))) 
     1   i_cont = i_cont + 1
                 
         enddo
        enddo
        
        if (i_cont.gt.i_max) i_max = i_cont
	  
	    
	  
	  enddo
	  
	  
	  ! allocazione memoria variabili
	  
	  
	  allocate(N_celle_sez_intern(N_sezioni_interne))
        allocate(N_celle_sez_internValle(N_sezioni_interne))
	  allocate(ic_intern(i_max,N_sezioni_interne))
	  allocate(ir_intern(i_max,N_sezioni_interne))
	  
	  
	  
	  do ii = 1, N_sezioni_interne
	  
	    Output = 1000.0 + float(ii-1)
	    N_celle_sez_intern(ii) = 0
	    j = 0
	    
	      do irow = 1, no_rows
             do icol = 1, no_columns
	    
	     if (InternalOutput(icol,irow).eq.Output) then
	     
	     j = j + 1
	     
	      N_celle_sez_intern(ii) = N_celle_sez_intern(ii) + 1
	     
	       ic_intern(j,ii) = icol
	       ir_intern(j,ii) = irow
	     
	     
	     endif
	     
	        enddo
	       enddo
	       
	  	  
	  
	  enddo
	  
	  !  scrittura celle delle sezioni

	write(10,*) 
	write(10,'("  INTERNAL OUTPUT SECTIONS  n. ",1x,I3)') N_sezioni_interne
	  
	  
	  do ii = 1, N_sezioni_interne
	  
	    write(10,*)
	    write(10,'("INTERNAL SECTION n.",1x,I3)') ii
	    write(10,*)
	    
	    write(10,*)
	    write(10,'("column and row indexes of cells")')
	    write(10,*)
	    
	      do jj = 1, N_celle_sez_intern(ii)
	  
	      write(10,*) ic_intern(jj,ii), ir_intern(jj,ii)
	      
	      enddo
	  
	  enddo

      !  11 Luglio 2017

      ! DETERMINAZIONE NUMERO CELLE DI OGNI SEZIONE AUSILIARIA DI VALLE

        do ii = 1, N_sezioni_interne

            N_celle_sez_internValle(ii) = 0
            
             do jj = 1, N_celle_sez_intern(ii)
	  
	        do j = 1,8

                  icj = ic_intern(jj,ii) + i_sh_col(j)
                  irj = ir_intern(jj,ii) + i_sh_row(j)


                    if (ele(icj,irj).ne.esterno) then

	  if (val_sorg(icj,irj).ne.100.0) then
            

       if (InternalOutputValle(icj,irj).eq.999.0.and.InternalOutputValle
     1Aux(icj,irj).eq.0.0) then
	     
	         
	      N_celle_sez_internValle(ii) = N_celle_sez_internValle(ii) + 1
	     	       
           InternalOutputValleAux(icj,irj) = 
     1InternalOutput(ic_intern(jj,ii),ir_intern(jj,ii)) + 10000.0
	     	     
	     endif

         endif
         endif
	     
              
            
	      
	      enddo
          enddo
          enddo


          !  DETERMINAZIONE INDICI RIGA E COLONNA DELLE CELLE AUSILIARIE DI VALLE


         i_maxValle = maxval(N_celle_sez_internValle)
         allocate(ic_internValle(i_maxValle,N_sezioni_interne))
	   allocate(ir_internValle(i_maxvalle,N_sezioni_interne))

               
          do ii = 1, N_sezioni_interne
	  
	    Output = 1000.0 + float(ii-1) + 10000.0
	   
          j = 0
	    
	      do irow = 1, no_rows
             do icol = 1, no_columns
	    
	     if (InternalOutputValleAux(icol,irow).eq.Output) then


             j = j + 1	     
	      
	       ic_internValle(j,ii) = icol
	       ir_internValle(j,ii) = irow
	     
	     
	     endif
	     
	        enddo
	       enddo
	       
	  	  
	  
	  enddo
	  
	  !  scrittura celle delle sezioni

	write(10,*) 
	write(10,'("  SECOND INTERNAL OUTPUT SECTIONS  n. ",1x,I3)')
     1 N_sezioni_interne
	  
	  
	  do ii = 1, N_sezioni_interne
	  
	    write(10,*)
	    write(10,'("SECOND INTERNAL SECTION n.",1x,I3)') ii
	    write(10,*)
	    
	    write(10,*)
	    write(10,'("column and row indexes of cells")')
	    write(10,*)
	    
	      do jj = 1, N_celle_sez_internValle(ii)
	  
	      write(10,*) ic_internValle(jj,ii), ir_internValle(jj,ii)
	      
	      enddo
	  
	  enddo
         
     
      
	  
	  
	  
	  ! apertura file di output
	  
	  i_file2 = 0
	  
	  
	  
	  
	  do ii = 1, N_sezioni_interne
	  
	                 if (ii.lt.10) 
	1write(file_name,'("sezione_",I1,".txt")') ii

      if (ii.ge.10.and.ii.lt.100)
	1write(file_name,'("sezione_",I2,".txt")') ii


	    if (ii.ge.100.and.ii.lt.1000)
	1write(file_name,'("sezione_",I3,".txt")') ii


   	  ! i_file2 = i_file2 + (ii-1)

	
	!	i_file = i_file2 + 115000
	
	 i_file = ii - 1 + 115000
       
        
 !     	write(file_name,'("velocity_direction",I1,".flt")') i
	file_name2 = file_name
	retint = scan (fileLog,'.')
      if (retint > 1) then
      file_name = fileLog(1:retint-1)//'_'//file_name2
      endif

      open(i_file,file=file_name,err=550)

	      
      write(i_file,'("% time (seconds) discharge in (m^3/s) free surface
     1(m) terrain elevation (m)  initial terrain elevation (m) 
     1flow depth (m)  thickness (m) sediment concentration  
     1discharge out (m^3/s)  solid discharge out (m^3/s)  discharge2 out
     1 (m^3/s)  solid discharge2 out (m^3/s)")')  
     
     
       write(i_file,*)
      
	
	  enddo

        do ii = 1, N_sezioni_interne


       ! inizio aggiunta 25/10/2017
      if (ii.lt.10)   
	1write(file_name,'("sezioneNEW_",I1,".txt")') ii

      if (ii.ge.10.and.ii.lt.100)
	1write(file_name,'("sezioneNEW_",I2,".txt")') ii


	    
	 if (ii.ge.100.and.ii.lt.1000)
	1write(file_name,'("sezioneNEW_",I3,".txt")') ii

        i_file = ii - 1 + 215000
       
        
 !     	write(file_name,'("velocity_direction",I1,".flt")') i
	file_name2 = file_name
	retint = scan (fileLog,'.')
      if (retint > 1) then
      file_name = fileLog(1:retint-1)//'_'//file_name2
      endif

      open(i_file,file=file_name,err=550)

	      
      write(i_file,'("%time (seconds)  total discharge (m^3/s)  
     1solid discharge (m^3/s)   flow depth (m) ")')  
     
     
       write(i_file,*)
      
	
	  enddo

	  
	  	  
	      !  DT_Internal_Output = 1.0  ! minuti   tolto il 29/03/2013

	write(10,*)

	write(10,'("internal output time step (seconds)",1x,f15.1)')        !! MODIFICA DEL 21/09/2015
     1 DT_Internal_Output
	write(10,*)
	write(10,*)


      else  !  11 Lug 2017   

      allocate(InternalOutput(no_columns,no_rows))          !  11 Lug 2017
      allocate(InternalOutputValle(no_columns,no_rows))        !  11 Lug 2017

      InternalOutput = 0.0             !  11 Lug 2017
      InternalOutputValle = 0.0        !  11 Lug 2017
      
   	
	endif  ! fine Internal Outputs
	  
	  


****************************************************************************************
*                         ACQUISIZIONE AREE E CELLE DI INPUT
****************************************************************************************


       allocate(InletOutlet(no_columns,no_rows))

      ValoreEsterno=externalValue(fileBC)
	 	do ir = 1,no_rows

      
            do ic=1,no_columns 
                read (18) (InletOutlet(ic,ir))  ! raster internal output
                
                if (InletOutlet(ic,ir).eq.ValoreEsterno
     1.and.esterno.ne.ValoreEsterno)  
     1InternalOutput(ic,ir)=esterno

                if (abs(InletOutlet(ic,ir))>10**9) 
     1InletOutlet(ic,ir)=esterno
        
        
        enddo
          enddo

	      do ir = 1,no_rows
      do ic=1,no_columns
      !bool=isnan(InternalOutput(ic,ir)
        if (isnan(InletOutlet(ic,ir))) then
            InletOutlet(ic,ir)=esterno
        endif
      enddo
      enddo
      ! Controllo sovrapposizione con file ele
      
       control8 = 0.0

	do irow = 1, no_rows
      do icol = 1, no_columns

	if (ele(icol,irow).eq.esterno.and.InletOutlet(icol,irow).ne.esterno)
     1 then

	control8 = 1.0

	endif
	
	enddo
	enddo
	
	 if (control8.eq.1.0) then

	write(0,'("Warning: the DEM raster file and the inlet-outlet")')
	write(0,'(" raster file do not overlap:")')
	write(0,'("the simulation could fail or give wrong results")') 

	write(10,'("Warning:the DEM raster file and the inlet-outlet")')
	write(10,'(" raster file do not overlap:")')
	write(10,'("the simulation could fail or give wrong results")') 

	endif
	
	! controllo del file output
	
		
	 Control_InletOutlet1 = 0.0
	 Control_InletOutlet2 = 0.0
	
	do irow = 1, no_rows
         do icol = 1, no_columns
         
         if (InletOutlet(icol,irow).eq.5000.0) then
         
          Control_InletOutlet1  = 1.0
           
         
         endif
         
         if (InletOutlet(icol,irow).eq.9000.0) then
         
          Control_InletOutlet2  = 1.0
           
         
         endif
         
                
         
         enddo
        enddo
        
        if (Control_InletOutlet1.eq.0.0) then
        
      write(0,'(" Warning: inlet-outlet raster file bad built: 
     1no input cells, the simulation could fail or give wrong results")
     1')
	write(10,'(" Warning: inlet-outlet raster file bad built: 
     1no input cells, the simulation could fail or give wrong results")
     1')
        
        
        endif
        
            if (Control_InletOutlet2.eq.0.0) then
        
      write(0,'(" Warning: no outflow cells: the simulation could fail 
     1or give wrong results")')
   
	 write(10,'(" Warning: no outflow cells: the simulation could fail 
     1 or give wrong results")')
   
        
        
        endif
        
       
	Inlet_massimo = 0.0
	
	  do irow = 1, no_rows
         do icol = 1, no_columns
         
         if (InletOutlet(icol,irow).gt.Inlet_massimo.and.
     1InletOutlet(icol,irow).lt.9000)  
     1 Inlet_massimo = InletOutlet(icol,irow)
                 
         enddo
        enddo 
	
	
	Num_sorgenti = int(Inlet_massimo) - 5000 + 1 
	
	write(10,'(''input cells area number'',2x,I5)') Num_sorgenti
	
	allocate(Nsorg1(Num_sorgenti))
	
	i = 0
	i_max = 0
	
	  do while (i.le.Num_sorgenti-1)
	  
	    i = i + 1
	    i_cont = 0

  	  
	  do irow = 1, no_rows
         do icol = 1, no_columns
         
         if (InletOutlet(icol,irow).eq.(4999.0 + float(i))) 
     1   i_cont = i_cont + 1
                 
         enddo
        enddo
        
        if (i_cont.gt.i_max) i_max = i_cont
	  
	    Nsorg1(i) = i_cont
	  
	  enddo
	  	  
	  ! allocazione memoria variabili
	   	
	  allocate(ic_sorg1(i_max,Num_sorgenti))
	  allocate(ir_sorg1(i_max,Num_sorgenti))
	  
	  N_allagamenti = Num_sorgenti
	  
	  allocate (idf(N_allagamenti))
      allocate (j_fin(N_allagamenti))
      allocate (j_fine(N_allagamenti))
	allocate (N_step_input(N_allagamenti))
	                ! modifica 27/11/2012
	  
	  
	  
	  
	  do ii = 1, Num_sorgenti
	  
	    Sorg = 5000.0 + (ii-1)
	    j = 0
	  
	     do irow = 1, no_rows
            do icol = 1, no_columns
         
         if (InletOutlet(icol,irow).eq.Sorg) then
         
             j = j + 1
           ic_sorg1(j,ii) = icol
           ir_sorg1(j,ii) = irow
          
         endif
                 
            enddo
           enddo
           
        enddo
	    
	  
		  
	  !  scrittura celle delle sezioni
	  
	  do ii = 1, Num_sorgenti

	write(10,*) 
	write(10,'("  INPUT CELLS AREA  n. ",1x,I3)') ii
	   
	  	    
	    write(10,*)
	    write(10,'("column and row indexes of cells")')
	    write(10,*)
	    
	      do jj = 1, Nsorg1(ii)
	  
	      write(10,*) ic_sorg1(jj,ii), ir_sorg1(jj,ii)
	      
	      enddo
	  
	  enddo
	  
	  
	        
 !     do i = 1, N_stati
	
!	   Nstr1(i) = 0
	
 !     enddo

	


1111  format('cell n°',I5,2x,'of the input area n°',I5,2x,'is external'
     1)
     
1112  format('the following column and row indexs are wrong',2x,2I5)

1113  format('the time value of the time step n',I5)
1114  format('of the hydograph n°',I5,2x,'is negative')
1115  format('the discharge value of the time step n',I5)
1116  format('of the hydrograph n°',I5,2x,'is negative')
1117  format(3x,I5,10x,I5,5x,I5,8x,f15.4)
1119  format(3x,a20,3x,I5)

  
        
c       controllo che la cella non sia fuori dal dem

            do i = 1, Num_sorgenti
              do j = 1, Nsorg1(i)
     

             if (ele(ic_sorg1(j,i),ir_sorg1(j,i)).eq.esterno) then

                 write(0,1111) j, i
			   write(0,*)
	           write(0,1112) ic_sorg1(j,i), ir_sorg1(j,i)
	           write(0,*)
	write(0,*) ele(ic_sorg1(j,i),ir_sorg1(j,i))
	           write(0,*)  sugg1
                 read(0,*) ic_sorg1(j,i), ir_sorg1(j,i)
	write(0,*) ic_sorg1(j,i), ir_sorg1(j,i), ele(ic_sorg1(j,i)
	1,ir_sorg1(j,i))

              endif


               enddo
             enddo

	!      N_step_input(i) = 17




	write(10,*)
	
	!    calcolo del numero di passi temporali per ogni idrogramma
	
	
	
	!  calcolo numero di righe
	
	j = 0
	
!	N_allagamenti = 2
!	deallocate( N_step_input)
!	allocate(N_step_input(N_allagamenti))
	
	do i = 1, N_allagamenti
	  N_step_input(i) = 0
	enddo

	loopQ:  do i = 1, 20000000
       read (3,*,end=151) pippone      !     NUOVO INSERIMENTO DICEMBRE 2013
       
       i_retint = scan (pippone,'Sezione')
       
     
       iijj = i_retint
       
	if (i.gt.1) then
	
	
	 if (iijj > 0) then
	j = j + 1
	N_step_input(j) = i - j - sum(N_step_input)-1
!	write(10,'("eureka")')
	
	else
	
!	write(10,*) pippone, pippone
	 endif
	
	
	i_retint2 = scan (pippone,'END')
	
	!write(10,*) i, pippone, i_retint, i_retint2

	iijj = i_retint2
!		write(10,*) pippone, i_retint2, iijj
		
			
	  if (iijj > 0) then
	  j = j + 1
	  N_step_input(j) = i - j - sum(N_step_input) - 1
!	  write(10,*) j, N_step_input(j)
	  exit loopQ
	  endif
	endif
	
      end do loopQ
151   continue

     
      close(3)

	open ( 3,file=fileIdrogramma, err=130)
	
	
          Nmax_step = 0
          
           write(10,*)
      write(10,*)
      write(10,'("Number of time steps for each hydrograph")')
      write(10,*)

	do i = 1, N_allagamenti

      j_fine(i) = 1

	!read(3,'(60x)')
!	read(3,'(I30)') N_step_input(i)
	

	write(10,*)
	write(10,'("hydrograph n.",1x,I3,9x,I5)') i, N_step_input(i)
	write(10,*)
*****************************************************

*************************************************

		if (N_step_input(i).le.1) then

      write(10,'("Warning the Hydrograph time steps of input area 
	1number",1x,I3,1x,"are less than 2:")') i
	write(10,'("the simulation could fail or give wrong results")') 
	write(0,'("Warning the Hydrograph time steps of input area number
	1",1x,I3,1x,"are less than 2:")') i
	write(0,'("the simulation could fail or give wrong results")') 

	    endif

*************************************************
	
	if (Nmax_step.lt.N_step_input(i)) Nmax_step = N_step_input(i)


       enddo



    !  allocate (t(N_stati+1))    15/01/2013
	allocate (t_fin(N_allagamenti))
	allocate (t_inizio(N_allagamenti))
	allocate (t_1d(N_allagamenti,Nmax_step))
	allocate (Q_input(N_allagamenti,Nmax_step))
	allocate (Q_input_tot(N_allagamenti,Nmax_step))
	
    !  if (Cmedio_input.le.0.0) then
           allocate (Conc_input(N_allagamenti,Nmax_step))            ! modifica 6/12/2013
    !  endif	
!allocate (Q_out(N_allagamenti,N_stati))



       do i = 1, Num_sorgenti

      read(3,*)

   !    if (Cmedio_input.gt.0.0) then

    !  write(10,'(''hydrograph n.'',1x,I5)') i
	!write(10,*)
	!write(10,'(''time (sec) and  input discharge value (m^3/s)'')')  
	!write(10,*)
	
	!else
	
	write(10,'(''hydrograph n.'',1x,I5)') i
	write(10,*)
	 write(10,'(''time (sec), input cell discharge value (m^3/s) and sedime
     1nt concentration'')')   
	write(10,*)
	 
	
	!endif

      do j = 1, N_step_input(i)
     
         if (Cmedio_input.gt.0.0) then
         
	        read(3,*)    t_1d(i,j), Q_input_tot(i,j)
	        Conc_input(i,j) = Cmedio_input
	        write(10,*)  t_1d(i,j), Q_input_tot(i,j), Conc_input(i,j)
	        
	      else
	      
	       read(3,*)    t_1d(i,j), Q_input_tot(i,j), Conc_input(i,j)
	       write(10,*)  t_1d(i,j), Q_input_tot(i,j), Conc_input(i,j)
	
	
	  endif
	  
	  Q_input(i,j) = Q_input_tot(i,j)/float(Nsorg1(i))   !   MODIFICA DEL 5/12/2013

c     controllo che i tempi e le portate degli idrogrammi di input siano positivi

             if (t_1d(i,j).lt.0.0) then

	            write(0,1113) j
				write(0,1114) i
	            write(0,*)
	            write(0,*) sugg2
	            read(0,*) t_1d(i,j)

	                 if (t_1d(i,j).lt.0.0) then

      write(0,'("Warning: a time value is negative:")')
	write(0,'("the simulation could fail or give wrong results")')

	write(10,'("Warning: a time value is negative:")')
	write(10,'("the simulation could fail or give wrong results")')
                       	
                  	 endif
	       endif

	if (Q_input_tot(i,j).lt.0.0) then

	            write(0,1115) j
				write(0,1116) i
	            write(0,*)
	            write(0,*) sugg3
	            read(0,*) Q_input_tot(i,j)

	                 if (Q_input_tot(i,j).lt.0.0) then

	write(0,'("Warning: a discharge data value is negative:")')
	write(0,'("the simulation could fail or give wrong results")')

	write(10,'("Warning: a discharge data value is negative:")')
	write(10,'("the simulation could fail or give wrong results")')
                       	
                  	 endif
	       endif

	enddo
	
		
	t_inizio(i) = t_1d(i,1)
	t_fin(i) = t_1d(i,N_step_input(i))

	write(10,*)
	write(10,'(''beginning and final time of the input hydograph of
	1input cells area number'',1x,I5)') i
	write(10,*)

	write(10,*) t_1d(i,1), t_1d(i,N_step_input(i))   ! correzione del 
	write(10,*)


	enddo
	
	write(10,*)
	write(10,*)
	
	! if (Cmedio_input.le.0.0) then
	 
	     do i = 1, Num_sorgenti
	     
	     
	     do j = 1, N_step_input(i)
     
         
            if (Conc_input(i,j).lt.0.0) then
            
            
            write(0,'("Warning: a sediment concentration data value is 
     1negative: the simulation could fail or give wrong results")')

	       write(10,'("Warning: a sediment concentration data value is 
     1negative: the simulation could fail or give wrong results")')
            
          
            
            endif
            
                 IF (Cmax.le.Conc_input(i,j)) THEN
        
        WRITE(0,'("WARNING INPUT SOLID CONCENTRATION LARGER THAN 
     190% OF REST SOLID CONCENTRATION: SIMULATION COULD GIVE WRONG 
     1RESULTS")')
     
        WRITE(10,'("WARNING INPUT SOLID CONCENTRATION LARGER THAN 
     190% OF REST SOLID CONCENTRATION: SIMULATION COULD GIVE WRONG 
     1RESULTS")')
        
        
        ENDIF
         
                 
           enddo
	  
	     
	     
	     enddo
	
	 
	! endif
	
	
	
	
	
	  do i = 1, Num_sorgenti


      write(10,'(''input cell area number'',1x,I5)') i
	write(10,*)
	
	!   if (Cmedio_input.gt.0.0) then
	
	!write(10,'(''time (sec) and  input cell discharge value (m^3/s)'')')  
	!write(10,*)

                 !do j = 1, N_step_input(i)
     	
	             !   write(10,*)  t_1d(i,j), Q_input(i,j)
	
	          ! enddo
	
	!write(10,*)
	
	       !else
	       
	 write(10,'(''time (sec), input cell discharge value (m^3/s) and sedime
     1nt concentration'')')  
	write(10,*)

                 do j = 1, N_step_input(i)
     	
	                write(10,*)  t_1d(i,j), Q_input(i,j), Conc_input(i,j)
	
	           enddo
	
	write(10,*)      
	       
	       
	       
	       
	       
	  ! endif
	
	   enddo
	
	
	
	
	

	t_minimo = 1000000.0
	
	do  j = 1, Num_sorgenti

	if (t_inizio(j).lt.t_minimo) t_minimo = t_inizio(j)    ! modifica 22/11/2012

	enddo
	

   
2     format(10f6.1)

      write(10,*)


	pippok2 = "];"

c	write(9,*) pippok2


       Qmax_input = 0.0


       write(22,'(" Q_IN = [")')

	
	do jj = 1, Num_sorgenti


	 if (jj.gt.1) then

	   write(22,'("];")')

	if (Num_sorgenti.lt.10) then

	     write(Sorgente,122) jj
122        format(i1)

      endif

         if (Num_sorgenti.ge.10.and.Num_sorgenti.lt.100) then

	   write(Sorgente,1244) jj
1244        format(i2)

         endif

         if (Num_sorgenti.ge.100.and.Num_sorgenti.lt.1000) then

	   write(Sorgente,1255) jj
1255        format(i3)

         endif


	     pippo_char = " Q_IN"//Sorgente//" = ["

	write(22,'(a16)') pippo_char
	
	
	 endif
	
      	


       do j = 1, N_step_input(jj)


	ttttt = t_1d(jj,j)/3600.0
	QQQQQ = Q_input(jj,j)*float(Nsorg1(jj))  ! modifica del 11/6/2015

	if (QQQQQ.gt.Qmax_input) Qmax_input = QQQQQ

	write(22,'(2F15.4)') ttttt, QQQQQ 

      enddo

	

	enddo


	write(22,'(" ];")')

	write(22,*)
	write(22,*)

	write(22,'(" Q_OUT = [")')
      
	close(2)
	close(3)
	
	
	
	
**************************************************************************
*  CALCOLO NUMERO DI FILE DI OUTPUT E DEL TEMPO INIZIALE   19 MARZO 2013
**************************************************************************
	
      
	
	IF (DT_OUTPUT_MINUTI.LT.2.0) THEN   ! MODIFICATO IL 28/2/2015
	
	   WRITE(0,'("WARNING OUTPUT TIME STEP SMALLER THAN 2 SECONDS:")')  ! MODIFICATO IL 28/2/2015
	   WRITE(30,'("WARNING OUTPUT TIME STEP SMALLER THAN 2 SECONDS:")')    ! MODIFICATO IL 28/2/2015
	   WRITE(0,'("SIMULATION COULD FAIL OR GIVE WRONG RESULTS")')
	   WRITE(30,'("SIMULATION COULD FAIL OR GIVE WRONG RESULTS")')
	   
	ENDIF
	
	DT_OUTput_secondi = DT_OUTPUT_MINUTI   ! modifica secondi
	
	N_file_Output = int((tempo_finale-t_minimo)/DT_OUTPUT_secondi)
	
	write(*,'("N_file_Output =",3x,i10)') N_file_Output


      allocate (t_file(N_file_output))
	allocate (flag(N_file_output))
	allocate (tempo_file(N_file_output))
	allocate (t_out_minuti(N_file_output))
	allocate (i_tmin(N_file_output))
	allocate (filename_flowdepth(N_file_output))
	allocate (filename_freesurf(N_file_output))
	allocate (filename_erosiondepth(N_file_output))
	allocate (filename_velmax(N_file_output))
	allocate (filename_veldir(N_file_output))
	allocate (filename_DEM(N_file_output))
	allocate (filename_conc(N_file_output))
	allocate (filename_VelCella(N_file_output))
      allocate (VolumeEntrato(N_file_output))   ! 1/8/2017
      allocate (VolumeSolidoEntrato(N_file_output))   ! 1/8/2017

      allocate (filename_velocit_uscente(N_file_output))   ! 13/7/2018
	allocate (filename_direz_vel_uscente(N_file_output))   ! 1/8/2017

      allocate (filename_Vx(N_file_output))  ! 29/4/2019
	allocate (filename_Vy(N_file_output))  ! 29/4/2019
!	 allocate (filename_VV(N_file_output)) ! 29/4/2019

      i_entrato = 0  ! 1/8/2017
	
	

***************************************************************************************
*                         INIZIALIZZAZIONE FILE RASTER DI OUTPUT
****************************************************************************************	

	su4="write the output file time and then enter until the last-one" 
	

**************************************************************
*  CONTROLLO NUMERO FILE DI OUTPUT  (17 GEN 2013)
**************************************************************

      ! DT_OUTput_secondi = tempo_finale/float(N_file_output)
       
   !  !  if (DT_OUTput_secondi.lt.120.0) then
       
   !    write(0,'("ATTENTION NUMBER OF OUTPUT FILE TOO LARGE: SIMULATION
   !  1 COULD FAIL OR GIVE WRONG RESULTS: REMEMBER MINUM OUTPUT TIME STEP
   !  1 2 MINUTES")')
       
   !    endif
       
       write(10,*)
       write(10,*)
       write(10,'("OUTPUT RESULTS TIME (SECONDS)")')    ! MODIFICATO IL 28/2/2015
       write(10,*)

	!if (i_flag.eq.1) then     ! TOLTO IL 22 MARZO 2013

	  do i = 1, N_file_output
	    t_file(i) = t_minimo + DT_OUTput_secondi*i
	      flag(i) = 0.0
	        tempo_file(i) = 0.0

	t_out_minuti(i) = t_file(i)   !  modifica secondi
	WRITE(10,*) i, t_out_minuti(i)
	i_tmin(i) = int(t_out_minuti(i))
     
        enddo
        
        write(10,*)
        write(10,*)

	!else 

	 !  write(0,*) su4

        !   do i = 1, N_file_output
	   !   read(0,*) t_file(i)
	  !     write(0,*) t_file(i), i
	    !    flag(i) = 0.0
	    !      tempo_file(i) = 0.0

	!t_out_minuti(i) = t_file(i)/60.0   !  aggiunto Novembre 2012
	!i_tmin(i) = int(t_out_minuti(i))
    
	 !    enddo

    ! ! endif

		do i = 1, N_file_output


       if (i_tmin(i).lt.10) 
	1write(file_name,'("flow_depth_",I1,".flt")') i_tmin(i)

      if (i_tmin(i).ge.10.and.i_tmin(i).lt.100)
	1write(file_name,'("flow_depth_",I2,".flt")') i_tmin(i)


	    if (i_tmin(i).ge.100.and.i_tmin(i).lt.1000)
	1write(file_name,'("flow_depth_",I3,".flt")') i_tmin(i)

	    if (i_tmin(i).ge.1000.and.i_tmin(i).lt.10000)
	1write(file_name,'("flow_depth_",I4,".flt")') i_tmin(i)


	    if (i_tmin(i).ge.10000.and.i_tmin(i).lt.100000)
	1write(file_name,'("flow_depth_",I5,".flt")') i_tmin(i)

		    if (i_tmin(i).ge.100000.and.i_tmin(i).lt.1000000)
	1write(file_name,'("flow_depth_",I6,".flt")') i_tmin(i)




	!i_file = 5000 + i - 1
	!i_file2 = i_file
	file_name2 = file_name
	retint = scan (fileLog,'.')
      if (retint > 1) then
	     file_name = fileLog(1:retint-1)//'_'//file_name2
      endif
      
      filename_flowdepth(i) = file_name

!	open(i_file,file=file_name,form='BINARY',
 !    1         access='DIRECT',recl=no_columns*4,err=500)
 
    !   file_name = filename_flowdepth(i)
 
  !    open(i_file,file=filename_flowdepth(i),form='BINARY',
  !   1         access='DIRECT',recl=no_columns*4,err=500)

	!i_file = i_file + 1000

!	retint = scan (file_name,'.')
!      if (retint > 1) then
 !     fileHeader = file_name(1:retint-1)//'.hdr'
 !     if (fileHeader /= fileFormat) call HdrWrite (fileHeader)
 !     endif

	


         if (i_tmin(i).lt.10) 
	1write(file_name,'("WS_",I1,".flt")') i_tmin(i)

      if (i_tmin(i).ge.10.and.i_tmin(i).lt.100)
	1write(file_name,'("WS_",I2,".flt")') i_tmin(i)


	    if (i_tmin(i).ge.100.and.i_tmin(i).lt.1000)
	1write(file_name,'("WS_",I3,".flt")') i_tmin(i)

	    if (i_tmin(i).ge.1000.and.i_tmin(i).lt.10000)
	1write(file_name,'("WS_",I4,".flt")') i_tmin(i)


	    if (i_tmin(i).ge.10000.and.i_tmin(i).lt.100000)
	1write(file_name,'("WS_",I5,".flt")') i_tmin(i)

		    if (i_tmin(i).ge.100000.and.i_tmin(i).lt.1000000)
	1write(file_name,'("WS_",I6,".flt")') i_tmin(i)



      file_name2 = file_name
	retint = scan (fileLog,'.')
      if (retint > 1) then
      file_name = fileLog(1:retint-1)//'_'//file_name2
      endif

      filename_freesurf(i) = file_name

              
          if (i_tmin(i).lt.10) 
	1write(file_name,'("erosion_depth_",I1,".flt")') i_tmin(i)

      if (i_tmin(i).ge.10.and.i_tmin(i).lt.100)
	1write(file_name,'("erosion_depth_",I2,".flt")') i_tmin(i)


	    if (i_tmin(i).ge.100.and.i_tmin(i).lt.1000)
	1write(file_name,'("erosion_depth_",I3,".flt")') i_tmin(i)

	    if (i_tmin(i).ge.1000.and.i_tmin(i).lt.10000)
	1write(file_name,'("erosion_depth_",I4,".flt")') i_tmin(i)


	    if (i_tmin(i).ge.10000.and.i_tmin(i).lt.100000)
	1write(file_name,'("erosion_depth_",I5,".flt")') i_tmin(i)

		    if (i_tmin(i).ge.100000.and.i_tmin(i).lt.1000000)
	1write(file_name,'("erosion_depth_",I6,".flt")') i_tmin(i)



   !  	i_file = i_file + 1000


!	write(file_name,'("erosion_height",I1,".flt")') i
      file_name2 = file_name
	retint = scan (fileLog,'.')
      if (retint > 1) then
	 file_name = fileLog(1:retint-1)//'_'//file_name2
      endif
      
        filename_erosiondepth(i) = file_name

      


             if (i_tmin(i).lt.10) 
	1write(file_name,'("Vx_",I1,".flt")') i_tmin(i)

      if (i_tmin(i).ge.10.and.i_tmin(i).lt.100)
	1write(file_name,'("Vx_",I2,".flt")') i_tmin(i)


	    if (i_tmin(i).ge.100.and.i_tmin(i).lt.1000)
	1write(file_name,'("Vx_",I3,".flt")') i_tmin(i)

	    if (i_tmin(i).ge.1000.and.i_tmin(i).lt.10000)
	1write(file_name,'("Vx_",I4,".flt")') i_tmin(i)


	    if (i_tmin(i).ge.10000.and.i_tmin(i).lt.100000)
	1write(file_name,'("Vx_",I5,".flt")') i_tmin(i)

		    if (i_tmin(i).ge.100000.and.i_tmin(i).lt.1000000)
	1write(file_name,'("Vx_",I6,".flt")') i_tmin(i)

	

	!i_file = i_file + 1000



   !   	write(file_name,'("velocity",I1,".flt")') i
	file_name2 = file_name
	retint = scan (fileLog,'.')
      if (retint > 1) then
      file_name = fileLog(1:retint-1)//'_'//file_name2
      endif

       filename_Vx(i) = file_name
       
 
	             if (i_tmin(i).lt.10) 
	1write(file_name,'("Vy_",I1,".flt")') i_tmin(i)

      if (i_tmin(i).ge.10.and.i_tmin(i).lt.100)
	1write(file_name,'("Vy_",I2,".flt")') i_tmin(i)


	    if (i_tmin(i).ge.100.and.i_tmin(i).lt.1000)
	1write(file_name,'("Vy_",I3,".flt")') i_tmin(i)

	    if (i_tmin(i).ge.1000.and.i_tmin(i).lt.10000)
	1write(file_name,'("Vy_",I4,".flt")') i_tmin(i)


	    if (i_tmin(i).ge.10000.and.i_tmin(i).lt.100000)
	1write(file_name,'("Vy_",I5,".flt")') i_tmin(i)

		    if (i_tmin(i).ge.100000.and.i_tmin(i).lt.1000000)
	1write(file_name,'("Vy_",I6,".flt")') i_tmin(i)
	
		!	i_file = i_file + 1000

		
!			    if (i_tmin(i).ge.1000.and.i_tmin(i).lt.10000)
!	1write(file_name,'("max_direction_",I4,".flt")') i_tmin(i)

 !     	write(file_name,'("velocity_direction",I1,".flt")') i
	file_name2 = file_name
	retint = scan (fileLog,'.')
      if (retint > 1) then
      file_name = fileLog(1:retint-1)//'_'//file_name2
      endif
        
	  
        filename_Vy(i) = file_name





        
        
           if (i_tmin(i).lt.10) 
	1write(file_name,'("velocity_",I1,".flt")') i_tmin(i)

      if (i_tmin(i).ge.10.and.i_tmin(i).lt.100)
	1write(file_name,'("velocity_",I2,".flt")') i_tmin(i)


	    if (i_tmin(i).ge.100.and.i_tmin(i).lt.1000)
	1write(file_name,'("velocity_",I3,".flt")') i_tmin(i)

	    if (i_tmin(i).ge.1000.and.i_tmin(i).lt.10000)
	1write(file_name,'("velocity_",I4,".flt")') i_tmin(i)


	    if (i_tmin(i).ge.10000.and.i_tmin(i).lt.100000)
	1write(file_name,'("velocity_",I5,".flt")') i_tmin(i)

		    if (i_tmin(i).ge.100000.and.i_tmin(i).lt.1000000)
	1write(file_name,'("velocity_",I6,".flt")') i_tmin(i)



	!i_file = i_file + 1000



   !   	write(file_name,'("velocity",I1,".flt")') i
	file_name2 = file_name
	retint = scan (fileLog,'.')
      if (retint > 1) then
      file_name = fileLog(1:retint-1)//'_'//file_name2
      endif

       filename_VelCella(i) = file_name

         
	
	
	             if (i_tmin(i).lt.10) 
	1write(file_name,'("DEM_",I1,".flt")') i_tmin(i)

      if (i_tmin(i).ge.10.and.i_tmin(i).lt.100)
	1write(file_name,'("DEM_",I2,".flt")') i_tmin(i)


	    if (i_tmin(i).ge.100.and.i_tmin(i).lt.1000)
	1write(file_name,'("DEM_",I3,".flt")') i_tmin(i)

	    if (i_tmin(i).ge.1000.and.i_tmin(i).lt.10000)
	1write(file_name,'("DEM_",I4,".flt")') i_tmin(i)


	    if (i_tmin(i).ge.10000.and.i_tmin(i).lt.100000)
	1write(file_name,'("DEM_",I5,".flt")') i_tmin(i)

		    if (i_tmin(i).ge.100000.and.i_tmin(i).lt.1000000)
	1write(file_name,'("DEM_",I6,".flt")') i_tmin(i)


	!	i_file = i_file + 1000



 !     	write(file_name,'("velocity_direction",I1,".flt")') i
	file_name2 = file_name
	retint = scan (fileLog,'.')
      if (retint > 1) then
      file_name = fileLog(1:retint-1)//'_'//file_name2
      endif

        filename_DEM(i) = file_name
        
                     if (i_tmin(i).lt.10) 
	1write(file_name,'("conc_",I1,".flt")') i_tmin(i)

      if (i_tmin(i).ge.10.and.i_tmin(i).lt.100)
	1write(file_name,'("conc_",I2,".flt")') i_tmin(i)


	    if (i_tmin(i).ge.100.and.i_tmin(i).lt.1000)
	1write(file_name,'("conc_",I3,".flt")') i_tmin(i)

	    if (i_tmin(i).ge.1000.and.i_tmin(i).lt.10000)
	1write(file_name,'("conc_",I4,".flt")') i_tmin(i)


	    if (i_tmin(i).ge.10000.and.i_tmin(i).lt.100000)
	1write(file_name,'("conc_",I5,".flt")') i_tmin(i)

		    if (i_tmin(i).ge.100000.and.i_tmin(i).lt.1000000)
	1write(file_name,'("conc_",I6,".flt")') i_tmin(i)


	!	i_file = i_file + 1000



 !     	write(file_name,'("velocity_direction",I1,".flt")') i
	file_name2 = file_name
	retint = scan (fileLog,'.')
      if (retint > 1) then
      file_name = fileLog(1:retint-1)//'_'//file_name2
      endif

        filename_conc(i) = file_name


        !  SCRITTURA FILE VELOCITA USCENTE


            if (i_tmin(i).lt.10) 
	1write(file_name,'("velocit_out_",I1,".flt")') i_tmin(i)

      if (i_tmin(i).ge.10.and.i_tmin(i).lt.100)
	1write(file_name,'("velocit_out_",I2,".flt")') i_tmin(i)


	    if (i_tmin(i).ge.100.and.i_tmin(i).lt.1000)
	1write(file_name,'("velocit_out_",I3,".flt")') i_tmin(i)

	    if (i_tmin(i).ge.1000.and.i_tmin(i).lt.10000)
	1write(file_name,'("velocit_out_",I4,".flt")') i_tmin(i)


	    if (i_tmin(i).ge.10000.and.i_tmin(i).lt.100000)
	1write(file_name,'("velocit_out_",I5,".flt")') i_tmin(i)

		    if (i_tmin(i).ge.100000.and.i_tmin(i).lt.1000000)
	1write(file_name,'("velocit_out_",I6,".flt")') i_tmin(i)


        file_name2 = file_name
	retint = scan (fileLog,'.')
      if (retint > 1) then
      file_name = fileLog(1:retint-1)//'_'//file_name2
      endif
        
        filename_velocit_uscente(i) = file_name


        
            if (i_tmin(i).lt.10) 
	1write(file_name,'("direct_vel_out_",I1,".flt")') i_tmin(i)

      if (i_tmin(i).ge.10.and.i_tmin(i).lt.100)
	1write(file_name,'("direct_vel_out_",I2,".flt")') i_tmin(i)


	    if (i_tmin(i).ge.100.and.i_tmin(i).lt.1000)
	1write(file_name,'("direct_vel_out_",I3,".flt")') i_tmin(i)

	    if (i_tmin(i).ge.1000.and.i_tmin(i).lt.10000)
	1write(file_name,'("direct_vel_out_",I4,".flt")') i_tmin(i)


	    if (i_tmin(i).ge.10000.and.i_tmin(i).lt.100000)
	1write(file_name,'("direct_vel_out_",I5,".flt")') i_tmin(i)

		    if (i_tmin(i).ge.100000.and.i_tmin(i).lt.1000000)
	1write(file_name,'("direct_vel_out_",I6,".flt")') i_tmin(i)


        file_name2 = file_name
	retint = scan (fileLog,'.')
      if (retint > 1) then
      file_name = fileLog(1:retint-1)//'_'//file_name2
      endif

         filename_direz_vel_uscente(i) = file_name
     

      	!  file volumi e portate nel tempo

      write(file_name,'("xyz",I3,".out")') i
	i_file3 = 1000 + i-1
	open(i_file3,file=file_name)
	write(file_name,'("h",I3,".out")') i
	i_file4 = 22000  + i-1
	open(i_file4,file=file_name)
	write(file_name,'("eros",I3,".out")') i
	i_file5 = 43000 + i-1
	open(i_file5,file=file_name)
	write(file_name,'("ele",I3,".out")') i
	i_file6 = 64000 + i-1
	open(i_file6,file=file_name)

      

	enddo
	
**********************************************************************
*     FILE INTERNAL OUTPUT  SPOSTAMENTO DEL 29/03/2013)
**********************************************************************

       IF (Intern_Output.eq.1.0) THEN
	
	! rapp_tempi = (tempo_finale-t_minimo)/(DT_Internal_Output*60.0)
	! rapp_tempi = (tempo_finale-t_minimo)/DT_Internal_Output*60.0   ! MODIFICA DEL 21/09/2015

      rapp_tempi = (tempo_finale-t_minimo)/DT_Internal_Output   ! MODIFICA DEL 7/08/2017
	 
	 !write(*,*) rapp_temp, tempo_finale, t_minimo, DT_internal_Output
         !write(*,'("pippo")')  
	 
	
            N_internal_DT = int(rapp_tempi)


            !write(*,*) N_internal_DT 
            
          
            allocate (tempi_output(N_internal_DT))
            allocate (flag_int(N_internal_DT))
            allocate (Q_out_interne(N_sezioni_interne))
	      allocate (FreeSurf_interne_medio(N_sezioni_interne))
	      allocate (Conc_sezioni_interne(N_sezioni_interne))
	      allocate (ele_interno_medio(N_sezioni_interne))
	      allocate (Q_int_medio(N_sezioni_interne))
            allocate (Ele_medio(N_sezioni_interne))
            allocate (FRSURF_medio(N_sezioni_interne))
            allocate (Conc_med(N_sezioni_interne))
            allocate (T_intervallo_calcolo(N_sezioni_interne))
            allocate (T_intervallo_calcoloELE(N_sezioni_interne))   ! 21/7/2017

             allocate (flow_depth_interne_medio(N_sezioni_interne))  ! 21/7/2017
	      allocate (flow_depth_medio(N_sezioni_interne))   ! 21/7/2017
            allocate (ele_iniz_interno_medio(N_sezioni_interne))    ! 21/7/2017
            allocate (ele_iniz_medio(N_sezioni_interne))     ! 21/7/2017


             allocate (spessore_interne_medio(N_sezioni_interne))  ! 21/9/2017
	      allocate (spessore_medio(N_sezioni_interne))   ! 21/9/2017

      
            flow_depth_medio = 0.0  ! 21/7/2017
            ele_iniz_medio = 0.0   ! 21/7/2017
            FRSURF_medio = 0.0   ! 21/7/2017
            Conc_med = 0.0  ! 21/7/2017
            Q_int_medio = 0.0   ! 21/7/2017
            Ele_medio = 0.0   ! 21/7/2017

             spessore_medio = 0.0  ! 21/7/2017



            ! aggiunto il 11/7/2017
            allocate (Q_uscita_interne(N_sezioni_interne))
            allocate (Q_uscita_solido_interne(N_sezioni_interne))
            allocate (Q_uscita_sez_interne(N_sezioni_interne))
            allocate (Q_uscita_solido_sez_interne(N_sezioni_interne))
            allocate (Q_uscita_medio(N_sezioni_interne))
            allocate (Q_uscita_solido_medio(N_sezioni_interne))
            allocate (Q_uscita_sez_medio(N_sezioni_interne))
            allocate (Q_uscita_solido_sez_medio(N_sezioni_interne))

              ! aggiunto il 25/10/2017
            allocate (Q_uscita(N_sezioni_interne))
            allocate (Q_uscita_solido(N_sezioni_interne))
            allocate (Vol_uscita(N_sezioni_interne))
            allocate (Vol_uscita_solido(N_sezioni_interne))
            allocate (volume_sez(N_sezioni_interne))
            allocate (Averaged_flow_depth(N_sezioni_interne))


      allocate  (Q_out_sez(N_sezioni_interne))   ! 15/11/2017
	allocate  (FreeSurf_sez(N_sezioni_interne))    ! 15/11/2017
	allocate  (Conc_sez(N_sezioni_interne))    ! 15/11/2017
      allocate  (Flow_depth_sez(N_sezioni_interne))   ! 15/11/2017
	allocate  (Spessore_sez(N_sezioni_interne))    ! 15/11/2017
	allocate  (Q_uscita_sez(N_sezioni_interne))    ! 15/11/2017
      allocate  (Q_uscita_solido_sez(N_sezioni_interne))    ! 15/11/2017
      allocate  (Q_uscitatot_sez(N_sezioni_interne))    ! 15/11/2017
      allocate  (Q_uscita_solidotot_sez(N_sezioni_interne))    ! 15/11/2017
      allocate  (Averaged_conc(N_sezioni_interne))    ! 15/11/2017
      allocate  (Averaged_FreeSurf(N_sezioni_interne))    ! 15/11/2017
      allocate  (Averaged_Spessore(N_sezioni_interne))    ! 15/11/2017
         
                
            write(*,*)  N_file_output, N_internal_DT, DT_Internal_Output
              do i = 1, N_internal_DT
        !  tempi_output(i) = t_minimo + DT_Internal_Output*60.0*float(i)
          tempi_output(i) = t_minimo + DT_Internal_Output*float(i)  ! MODIFICA DEL 21/2015
              flag_int(i) = 0.0
              if (i.le.10) then
               write(*,*) i, tempi_output(i), flag_int(i)
               endif
              enddo
              i_file_out = 1
	  
	   flag_int_tempo_finale = 0.0
	
	
	 endif  ! fine Internal Outputs
	
	
	
	
	
**********************************************************************
*     FILE ENTRAINMENT  (AGGIUNTA/SPOSTAMENTO DEL 14/01/2013)
**********************************************************************
		 
	!DT_entrain =  60.0
        DT_entrain =  DT_OUTPUT_MINUTI  ! 1/8/2017

	file_name2 = "_entrainment.m"
	retint = scan (fileLog,'.')
      if (retint > 1) then
	     file_finale = fileLog(1:retint-1)//'_'//file_name2
      endif

		open (25,file=file_finale)



    !  N_step_entrain = int(tempo_finale/DT_entrain) + 2

      N_step_entrain = int((tempo_finale-t_minimo)/DT_OUTPUT_secondi)+2  ! 1/8/2017

	allocate (t_step_entrain(N_step_entrain))
	allocate (V_entrained_step(N_step_entrain))
	allocate (V_entrained_tot(N_step_entrain))


********************************************      CALCOLO TIMESTEP INIZIALE e PRIMO AFFLUSSO MARZO 2010

       do jj = 1, Num_sorgenti
       
        if (t_1d(jj,1).eq.t_minimo) i_mini = jj
        
       enddo
              

      a_DT = (Q_input(i_mini,2)-Q_input(i_mini,1))/
     1(t_1d(i_mini,2)-t_1d(i_mini,1))
	b_DT = Q_input(i_mini,1)
	c_DT = (-1.0)*lato_cella*lato_cella

	DT1 = ((b_DT*b_DT - 4*a_DT*c_DT)**(0.5) - b_DT)/(2*a_DT)

	if (t_1d(i_mini,2).lt.(t_1d(i_mini,1) + DT1)) 
     1DT1 = t_1d(i_mini,2) - t_1d(i_mini,1)

	
	
	if ((DT1.gt.0.5).or.(Q_input(i_mini,2).eq.Q_input(i_mini,1))) DT1 = 0.5   ! correzione 2021


	j_fin(1) = 1


     
********************************************      FINE CALCOLO TIMESTEP INIZIALE e PRIMO AFFLUSSO MARZO 2010


**************************************************************************
*            Boundary condition aggiornata a Dicembre 2012
**************************************************************************

       N_celle_contorno = 0

      
	do irow = 1, no_rows
         do icol = 1, no_columns
         
         if (InletOutlet(icol,irow).eq.9000.0) then
         
          N_celle_contorno = N_celle_contorno + 1
           
         
         endif
         
                       
         
         enddo
        enddo
        
      allocate (ic_bc(N_celle_contorno))
	allocate (ir_bc(N_celle_contorno))
	allocate (Q_contorno(N_celle_contorno))
	allocate (dh_contorno(N_celle_contorno))
	allocate (dh_solido_contorno(N_celle_contorno))
	allocate (V_contorno(no_columns,no_rows))
	!allocate (V_fuori_uscito_DT(N_stati))
      

        j = 0

      do irow = 1, no_rows
         do icol = 1, no_columns
         
         if (InletOutlet(icol,irow).eq.9000.0) then
         
         j = j + 1
         
          ic_bc(j) = icol
          ir_bc(j) = irow
           
         
         endif
                                
         
         enddo
        enddo

	

	write(10,*)

	write(10,'("Number of outflow cells",I9)') N_celle_contorno

	write(10,*)
      


	do irow = 1, no_rows
	    do icol = 1, no_columns

	 
	    V_contorno(icol,irow) = esterno
	  

              if (ele(icol,irow).ne.esterno) then

                    V_contorno(icol,irow) = 0.0
	 	           
	        endif
	  enddo
	enddo

	  

    
************************************************************* FINE BOUNDARY DICEMBRE 2012
      
	!  azzeramento variabili



	!do i = 1, N_stati     ! modifica del 14/01/2013
	! V_fuori_uscito_DT(i) = 0.0
      ! enddo



	!  azzeramento variabili
       V_fuori_uscito_totale = 0.0
       V_solido_fuori_uscito_totale = 0.0




	! scrittura su log file delle celle del contorno

	write(10,*)
	WRITE(10,'("BOUNDARY CELLS")')
	WRITE(10,*)
	write(10,'(" column index   row index      altitude (m)")')
	write(10,*)


	do jjj = 1, N_celle_contorno

        write(10,'(7x,I5,3x,I5,f14.7)') ic_bc(jjj), ir_bc(jjj),
	1 ele(ic_bc(jjj),ir_bc(jjj))

	enddo



      write(30,*)
	write(30,'(" number of outflow cells",3x,I9)') N_celle_contorno
	write(30,*)

	     
************************************************************************* FINE BOUNDARY CONDITION DECEMBER 2012

* ------------------------------- 


      call time(orario)
      write (0,'('' data and control acquisition ends at '',a8)') orario
	write (0,*)

      call time(orario)
      write (0,'('' execution begins at '',a8)') orario
	write (0,*)
	
	
	write(10,'('' execution begins at '',a8)') orario 
	write(10,*) 

           
	
      Tempo_iniziale = omp_get_wtime()

      i_celle = 0

        do irow = 1, no_rows
	    do icol = 1, no_columns

      if (ele(icol,irow).eq.esterno) then

          val_sorg(icol,irow) = esterno
          val(icol,irow) = esterno
          val_tempi(icol,irow) = esterno
          val_flag(icol,irow) = esterno
	    Eros_tot(icol,irow) = esterno
	    Solid_tot(icol,irow) = esterno
	    k(icol,irow) = esterno
	    Q_entrata(icol,irow) = esterno
	    conc_max(icol,irow) = esterno
	    h_tot_max(icol,irow) = esterno
	    hh_max(icol,irow) = esterno
	    vel_max(icol,irow) = esterno
	    direz_max(icol,irow) = esterno
	    spessore_max(icol,irow) = esterno
	    ele_iniz(icol,irow) = esterno

       

	    do iz = 1,8
	        sen_teta(icol,irow,iz) = esterno
	        senteta(icol,irow,iz) = esterno        ! NUOVO nov09
	        peso(icol,irow,iz) = esterno
	        peso_d(icol,irow,iz) = esterno
	    enddo 

      else

        i_celle = i_celle + 1
	  val_sorg(icol,irow) = 0.0
        val(icol,irow) = 0.0
	  val_tempi(icol,irow) = 0.0
        val_flag(icol,irow) = 0.0
	  Eros_tot(icol,irow) = 0.0
	  Solid_tot(icol,irow) = 0.0
        k(icol,irow) = 0.0
        Q_entrata(icol,irow) = 0.0
        conc_max(icol,irow) = 0.0
	  h_tot_max(icol,irow) = 0.0
        hh_max(icol,irow) = 0.0
	  vel_max(icol,irow) = 0.0
	  direz_max(icol,irow) = 0.0
	  spessore_max(icol,irow) = 0.0
	  ele_iniz(icol,irow) = ele(icol,irow)

      	

	  do iz = 1,8
          sen_teta(icol,irow,iz) = 0.0
	    senteta(icol,irow,iz) = 0.0   ! NUOVO nov09
	    peso(icol,irow,iz) = 0.0
	    peso_d(icol,irow,iz) = 0.0
	 
	  enddo

	endif
	  enddo
	enddo
	
	


	allocate (ic_eros(i_celle))
	allocate (ir_eros(i_celle))

c      azzeramento profondita' di deflusso

       do irow = 1, no_rows
	    do icol = 1, no_columns
            if (ele(icol,irow).eq.esterno) then

	h(icol,irow) = esterno      
	dh(icol,irow) = esterno
      dh_entrata_unif(icol,irow) = esterno
      dh_entrata_sorg(icol,irow) = esterno
      dh_entrata_solido_sorg(icol,irow) = esterno
      dh_entrata_solido(icol,irow) = 0.0
      h_solido(icol,irow) = esterno
       Conc(icol,irow) = esterno
       dh_solido(icol,irow) = esterno
	dh_entrata_Bel(icol,irow) = esterno
	h_tot(icol,irow) = esterno
	dh_sed(icol,irow) = esterno
	velocit(icol,irow) = esterno
	direz_vel(icol,irow) = esterno
	h_pre(icol,irow) = esterno  
	h_post(icol,irow) = esterno 
	Vx(icol,irow) = esterno
	Vy(icol,irow) = esterno
	Vel_Cella(icol,irow) = esterno
	Vel_Cella_max(icol,irow) = esterno
	Vx_max(icol,irow) = esterno
	Vy_max(icol,irow) = esterno
	Pmax(icol,irow) = esterno	 
      SVmax(icol,irow) = esterno
      


      if (Intern_Output.eq.1.0)    then  ! 11 lug 2017


      dh_uscita_sez(icol,irow) = esterno
      dh_uscita_solido_sez(icol,irow) = esterno

      dh_uscita_tot(icol,irow) = esterno
      dh_uscita_solido_tot(icol,irow) = esterno

      endif
	
	

	       else
      
	h(icol,irow) = 0.0
	dh(icol,irow) = 0.0
	dh_entrata_unif(icol,irow) = 0.0
	dh_entrata_sorg(icol,irow) = 0.0
	dh_entrata_solido_sorg(icol,irow) = 0.0
	h_solido(icol,irow) = 0.0
	 Conc(icol,irow) = 0.0
	 dh_entrata_solido(icol,irow) = 0.0
	 dh_solido(icol,irow) = 0.0
	dh_entrata_Bel(icol,irow) = 0.0
	h_tot(icol,irow) = 0.0
	dh_sed(icol,irow) = 0.0
      velocit(icol,irow) = 0.0
	direz_vel(icol,irow) = 0.0
	h_pre(icol,irow) = 0.0  
	h_post(icol,irow) = 0.0  
	Vx(icol,irow) = 0.0
	Vy(icol,irow) = 0.0
	Vel_Cella(icol,irow) = 0.0
	Vel_Cella_max(icol,irow) = 0.0
	Vx_max(icol,irow) = 0.0
	Vy_max(icol,irow) = 0.0
    	Pmax(icol,irow) = 0.0
        SVmax(icol,irow) = 0.0

      
      !dh_x(icol,irow) = 0.0    ! 12/7/2018
	!dh_y(icol,irow) = 0.0    ! 12/7/2018

      !dh_xE(icol,irow) = 0.0    ! 12/7/2018
	!dh_yE(icol,irow) = 0.0    ! 12/7/2018
   !   Vel_Cella_maxE(icol,irow) = 0.0   ! 12/7/2018
    !  Vel_CellaE(icol,irow) = 0.0   ! 12/7/2018

   !   VXX(icol,irow) = 0.0   ! 29/04/2019
!	VYY(icol,irow) = 0.0   ! 29/04/2019
   !   VV(icol,irow) = 0.0    ! 29/04/2019
	


      if (Intern_Output.eq.1.0)    then  ! 11 lug 2017
      
      dh_uscita_sez(icol,irow) = 0.0
      dh_uscita_solido_sez(icol,irow) = 0.0

      dh_uscita_tot(icol,irow) = 0.0
      dh_uscita_solido_tot(icol,irow) = 0.0

      endif
	
	


	       endif
       enddo
	    enddo


         do irow = 1, no_rows  ! 29/04/2019
	    do icol = 1, no_columns
            if (ele(icol,irow).eq.esterno) then

            do j = 1,8
             Vel8(icol,irow,j) = esterno
              Deltah8(icol,irow,j) = esterno
             enddo

             else

               do j = 1,8
             Vel8(icol,irow,j) = 0.0
             Deltah8(icol,irow,j) = 0.0
             enddo


            endif
            enddo
            enddo


	Qmax_contorno = 0.0  ! aggiunto 19 Novembre 2012

	   V_dep_step = 0.0
	   V_eros_step = 0.0

	V_dep_step_A = 0.0
	   V_eros_step_A = 0.0

	V_dep_step_B = 0.0
	   V_eros_step_B = 0.0
	   V_dep_step_C = 0.0
	   
	   V_dep_unif = 0.0
	   V_dep_belang = 0.0
	   V_eros_unif = 0.0
	   V_eros_belang = 0.0
      

      
!	Nstr1(1) = 0

	! t(1) = 0.0  ! 15/01/2013
	
	t1 = 0.0

	
	ijij = 5000
	i_file = 1


	
c       ciclo iniziale: sorgente iniziale

      
      V_celle = 0.0

                            
      allocate (attivata(Num_sorgenti))
      allocate (V_input_iniziale(Num_sorgenti))
       allocate (Conc_input_iniziale(Num_sorgenti))
       
	       

       
       
	   
	   
       
*********************  MODIFICA DEL 7/372014  ****************************    
       
       do ii = 1, Num_sorgenti
       
           do i = 1, Nsorg1(ii)
       
             val_sorg(ic_sorg1(i,ii),ir_sorg1(i,ii))= 100.0
             
           enddo
       
       enddo
       
*********************  FINE MODIFICA DEL 7/372014  ****************************
      
      
     
         do ii = 1, Num_sorgenti   !  modifica 22/11/2012
         
          attivata(ii) = 0.0
          
          do i = 1, Nsorg1(ii)
          
          if (t_inizio(ii).lt.(t_minimo + DT1)) then
          
            if (t_1d(ii,2).ge.(t_minimo+DT1)) then
          
              IF  (Q_input(ii,1).NE.0.0.OR.Q_input(ii,2).NE.0.0) THEN  ! modificata 28/11

	    !    val_sorg(ic_sorg1(i,ii),ir_sorg1(i,ii))= 100.0      !  TOLTO 7/3/2014
	        val(ic_sorg1(i,ii),ir_sorg1(i,ii))= 1.0
	      
	          attivata(ii) = 1.0
	      
	      ENDIF
	    
	    else
	    
	      Qseconda = 0.0
	    
	    
	       do jj = 2, N_step_input(ii)
	       
	      if (t_1d(ii,jj).lt.(t_minimo+DT1).and.Q_input(ii,jj).gt.0.0) then
	          
	               Qseconda = 1.0
	               
	          endif
	          
	       enddo
	       
	       
	       if (Qseconda.eq.0.0) then
	       
	         do jj = 2, N_step_input(ii)-1
	         
	          if (t_1d(ii,jj).lt.(t_minimo+DT1).and.t_1d(ii,jj+1).ge.
	1(t_minimo+DT1)) then
		 	          
		 	if (Q_input(ii,jj+1).gt.0.0)   Qseconda = 1.0
		 	               
	          endif
	       
	        enddo 
	       
	       endif
	       
	    
	     IF  (Q_input(ii,1).NE.0.0.OR.Qseconda.NE.0.0) THEN    ! modificata  28/11
	     
	    !       val_sorg(ic_sorg1(i,ii),ir_sorg1(i,ii))= 100.0  !  TOLTO 7/3/2014
	     	   val(ic_sorg1(i,ii),ir_sorg1(i,ii))= 1.0
	     	      
	     	   attivata(ii) = 1.0
	     	      
	     ENDIF
	    
	    
	    
	    
	    
	      
	  endif
	  
	  endif
	
	    enddo

	
	    
	    if (attivata(ii).eq.1.0) then
	    
	       write(10,*)
	       write(10,'("active input area n. ",1x,I5)') ii
	       write(10,*)
	       
	    endif
	    
	   	    
	  enddo

      write(10,*)


                                
	
      
      
!**************************************************************************
!       CALCOLO VOLUMI DI RIEMPIMENTO DELLE CELLE DI INPUT  (22/11/2012)
!**************************************************************************

                  
              !    t(1) = t_minimo + DT1
              
              t1 = t_minimo + DT1  ! 15/01/2013

	       
                  
              do ii = 1, Num_sorgenti
              
              
                jjj = 0   ! modifica del 28/11/2012
              
              
                V_input_iniziale(ii) = 0.0
         !   if (Cmedio_input.le.0.0)   
         
         Conc_input_iniziale(ii) = 0.0
                  
                  if (attivata(ii).eq.1.0) then

	                  
                  
                     do jj = 1, N_step_input(ii)-1
		       	         
	if (t_1d(ii,jj).lt.(t_minimo+DT1).and.t_1d(ii,jj+1).ge.(t_minimo+DT1))
     1  then
		       		 	          
		       		jjj = jj+1
		       		 	
	endif
	
		
	              enddo
	              
	       
		         
		         if (jjj.eq.2) then
		         
      V_input_iniziale(ii) = 0.5*(t1-t_inizio(ii))*(2.0*Q_input(ii,1)+ 
	1(Q_input(ii,2) - Q_input(ii,1))/(t_1d(ii,2)-t_1d(ii,1)))*
	1(t1+t_inizio(ii)-2*t_1d(ii,1))
	
	! al posto di  0.5*(t1-t_inizio(ii))*  mettere 0.5*(t1+t_inizio(ii)-2*t_1d(ii,1))*
	
	! if (Cmedio_input.le.0.0) then
	Conc_input_iniziale(ii) = 0.5*(2.0*Conc_input(ii,1)+ (Conc_input(ii,2)-
	1Conc_input(ii,1))/(t_1d(ii,2)-t_1d(ii,1))*
	1(t1+t_inizio(ii)-2*t_1d(ii,1)))
	
	
	
	! endif
	
			         
		         else
		         
		         
	V_input_iniziale(ii) = 0.5*(t_1d(ii,2)-t_inizio(ii))*(Q_input(ii,1) +
     1 ((Q_input(ii,2)-Q_input(ii,1))/(t_1d(ii,2)-t_1d(ii,1)))*
     1(t_inizio(ii)-t_1d(ii,1)) + Q_input(ii,2))
	
!	V_input_iniziale(ii) = 0.5*(t_1d(ii,2)-t_inizio(ii))*(Q_input(ii,1) + 
!	1Q_input(ii,2) + (t_inizio(ii)-t_1d(ii,1))*(Q_input(ii,2)-Q_input(ii,1))/(t_1d(ii,2)-t_1d(ii,1)))
	
	
	
	V_input_iniziale(ii) = V_input_iniziale(ii) + 0.5*
	1(t1-t_1d(ii,jjj-1))*
	1(2.0*Q_input(ii,jjj-1) + (Q_input(ii,jjj) - Q_input(ii,jjj-1))/
	1(t_1d(ii,jjj)-t_1d(ii,jjj-1))*(t1-t_1d(ii,jjj-1)))
	
	
	! if (Cmedio_input.le.0.0) then
	
	Conc_input_iniziale(ii) = 0.5*(t_1d(ii,2)-t_inizio(ii))*
     1(Conc_input(ii,1) +
     1 ((Conc_input(ii,2)-Conc_input(ii,1))/(t_1d(ii,2)-t_1d(ii,1)))*
     1(t_inizio(ii)-t_1d(ii,1)) + Conc_input(ii,2))
	     
     
	Conc_input_iniziale(ii) = Conc_input_iniziale(ii) + 0.5*
	1(t1-t_1d(ii,jjj-1))*(2.0*Conc_input(ii,jjj-1) + 
	1(Conc_input(ii,jjj) - Conc_input(ii,jjj-1))/
	1(t_1d(ii,jjj)-t_1d(ii,jjj-1))*(t1-t_1d(ii,jjj-1)))
	
	
	
	
	
	
	 ! endif
		          
		            if (jjj.gt.3) then
		            
		              do iijj = 2, jjj-2   ! modifica del 28/11/2012
		            
	V_input_iniziale(ii) = V_input_iniziale(ii) + 0.5*(t_1d(ii,iijj+1)-
     1t_1d(ii,iijj))*(Q_input(ii,iijj) + Q_input(ii,iijj+1))
     
     	         ! if (Cmedio_input.le.0.0) then   
	Conc_input_iniziale(ii) = Conc_input_iniziale(ii) +0.5*(t_1d(ii,iijj+1)
     1-t_1d(ii,iijj))*(Conc_input(ii,iijj) + Conc_input(ii,iijj+1))
		       ! endif    
		            
		              enddo
		            
		            endif
		            
	   Conc_input_iniziale(ii) = Conc_input_iniziale(ii)/(t1-t_inizio(ii))
		         
		         	         
		         
		         endif
		         
		         
		       
		       		 	               
	          endif
	          
	          enddo


       DO jj = 1, Num_sorgenti

      write(10,'("INPUT AREA n. ",1x,I5)') jj
	write(10,'("INITIAL INPUT VOLUME FOR EACH INPUT CELL (m^3)"
	1,2X,F15.4)') V_input_iniziale(jj)
	 !if (Cmedio_input.le.0.0) then
	 write(10,'("INITIAL SEDIMENT CONCENTRATION FOR EACH INPUT CELL"
	1,2X,F15.4)') Conc_input_iniziale(jj)
	!endif
	
	 ENDDO          
	          
	          !  POI METTERE V_INPUT_INIZIALE/NUMERO CELLE INPUT
                      


        !    Nstr1(2) = 0   ! aggiunto il 22/11/2012

       Num_celle_routing = 0   ! modificato 10/12/2012


      do ii = 1, Num_sorgenti
     
     
     
      if (attivata(ii).eq.1.0) then

       write(10,*)

       do i = 1, Nsorg1(ii)

	write(10,'('' input area n. '',1x,I5,1x,''cell number n. '',1x,I5)')
     1	 ii, i
		     
	    do j = 1,8

                  icj = ic_sorg1(i,ii) + i_sh_col(j)
                  irj = ir_sorg1(i,ii) + i_sh_row(j)

                if (ele(icj,irj).ne.esterno) then


c        controllo che la cella drenante non sia sorgente

	if (val_sorg(icj,irj).ne.100) then
                  
                   call kern (ele(ic_sorg1(i,ii),ir_sorg1(i,ii)),
     1                            ele(icj,irj),j,sen_tetaj,lato_cella)

                    sen_teta(ic_sorg1(i,ii),ir_sorg1(i,ii),j)= sen_tetaj
      write(10,'(''input area n.'',1x,I5,'' cell number'',I5,2x,''routin
	1g cell number'',I5,2x,''sin of their relative angle'',2x,F8.5)') ii, i
     1,j, sen_teta(ic_sorg1(i,ii),ir_sorg1(i,ii),j)
       write(10,'("elevations of input and routing cells",2x,3f20.10)')
     1 ele(ic_sorg1(i,ii),ir_sorg1(i,ii)), ele(icj,irj), 
     1Ch(ic_sorg1(i,ii),ir_sorg1(i,ii))

	endif

	          endif


             if  (sen_teta(ic_sorg1(i,ii),ir_sorg1(i,ii),j).gt.0.0) then

	k(ic_sorg1(i,ii),ir_sorg1(i,ii)) = k(ic_sorg1(i,ii),ir_sorg1(i,ii)) + 1

	 

	senteta(ic_sorg1(i,ii),ir_sorg1(i,ii),k(ic_sorg1(i,ii),ir_sorg1(i,ii))
	1) = sen_teta(ic_sorg1(i,ii),ir_sorg1(i,ii),j)

	ic_d(ic_sorg1(i,ii),ir_sorg1(i,ii),k(ic_sorg1(i,ii),ir_sorg1(i,ii))) 
	1= icj
	ir_d(ic_sorg1(i,ii),ir_sorg1(i,ii),k(ic_sorg1(i,ii),ir_sorg1(i,ii))) 
	1= irj

	sen_tetatot = sen_tetatot+ sen_teta(ic_sorg1(i,ii),ir_sorg1(i,ii),j)
	write(10,'(''column and row index of the routing cell number'',I5,
	12x,I5,2x,I5)') j, ic_d(ic_sorg1(i,ii),ir_sorg1(i,ii),k(ic_sorg1(i,ii),
     1ir_sorg1(i,ii))),ir_d(ic_sorg1(i,ii),ir_sorg1(i,ii),
     1k(ic_sorg1(i,ii),ir_sorg1(i,ii)))
	write(10,*)

	          endif


          enddo

      
c      determinazione del peso e della pendenza e peso massimi

      write(10,'(''total sum of the sin of the angle between input
	1 cell and the routing cells'',1x,F8.5)') sen_tetatot  

	write(10,*)

	sen_max(ic_sorg1(i,ii),ir_sorg1(i,ii)) = 0.0

	        do j = 1,k(ic_sorg1(i,ii),ir_sorg1(i,ii))

   	 peso_d(ic_sorg1(i,ii),ir_sorg1(i,ii),j) = senteta(ic_sorg1(i,ii)
     1,ir_sorg1(i,ii),j)/sen_tetatot

		    if (senteta(ic_sorg1(i,ii),ir_sorg1(i,ii),j).gt.sen_max
	1(ic_sorg1(i,ii),ir_sorg1(i,ii))) then

	write(10,'(''weight value of the stripe cell number'',1x,I5,2x,f8.
	15)') j, peso_d(ic_sorg1(i,ii),ir_sorg1(i,ii),j)

	 sen_max(ic_sorg1(i,ii),ir_sorg1(i,ii)) = senteta
     1 (ic_sorg1(i,ii),ir_sorg1(i,ii),j)

	 peso_max(ic_sorg1(i,ii),ir_sorg1(i,ii)) = peso_d(ic_sorg1(i,ii),
	1 ir_sorg1(i,ii),j)

	    endif

      write(10,*)
	write(10,'(''maximum sin of relative angle and weight value'',2x,
	1f8.5,2x,f8.5)') sen_max(ic_sorg1(i,ii),ir_sorg1(i,ii)), peso_max(ic_
     1sorg1(i,ii),ir_sorg1(i,ii))

	 
      write(10,*)

	      enddo

      write(10,*) 
	write(10,'(''weight values of stripe cells flooded by the input
	1area'',1x,I5,'' cell number n.'',2x,I5)') ii, i
	write(10,*)
	write(10,*) (peso_d(ic_sorg1(i,ii),ir_sorg1(i,ii),ij), ij= 1,j-1)


	write(10,*)


	sen_tetatot = 0.0


	enddo
	
	
	endif
	
	enddo
	
	
	write(10,*)
c      individuazione della striscia di celle drenanti le  
c      celle sorgenti iniziali al successivo intervallo temporale 

c      celle drenanti la prima cella sorgente iniziale per gravità

        jjj = 0

	Num_celle_routing = 0

	
	do ii = 1, Num_sorgenti
	     
	    if (attivata(ii).eq.1.0) then
	
	         do i = 1, Nsorg1(ii)
	
	      if (k(ic_sorg1(i,ii),ir_sorg1(i,ii)).gt.0.0) then
	  
	  do j = 1,k(ic_sorg1(i,ii),ir_sorg1(i,ii))
	  
	   if (InletOutlet(ic_d(ic_sorg1(i,ii),ir_sorg1(i,ii),j),
     1ir_d(ic_sorg1(i,ii),ir_sorg1(i,ii),j)).ne.9000.0) then      ! MODIFICA DEL 16/8/2015       
	  
           if (val(ic_d(ic_sorg1(i,ii),ir_sorg1(i,ii),j),
     1ir_d(ic_sorg1(i,ii),ir_sorg1(i,ii),j)).eq.0.0) then
	  
	  
	  
	  	jjj = jjj + 1
	  
!	  ic_str1(Nstr1(2)+jjj,2) = ic_d(ic_sorg1(i,ii),ir_sorg1(i,ii),j)
!	  ir_str1(Nstr1(2)+jjj,2) = ir_d(ic_sorg1(i,ii),ir_sorg1(i,ii),j)
!	  val(ic_str1(Nstr1(2)+jjj,2),ir_str1(Nstr1(2)+jjj,2)) = 2.0

 !        write(*,*) Num_celle_bacino, jjj

	  ic_routing(Num_celle_routing+jjj) = 
	1ic_d(ic_sorg1(i,ii),ir_sorg1(i,ii),j)   ! modifica 10/12/2012
	  ir_routing(Num_celle_routing+jjj) = 
	1ir_d(ic_sorg1(i,ii),ir_sorg1(i,ii),j)
	  val(ic_routing(Num_celle_routing+jjj),
	1ir_routing(Num_celle_routing+jjj)) = 2.0

!	write(*,*) jjj, ic_routing(jjj), ir_routing(jjj)

	  
	  	
	  	  
	  	endif
	  	  
	  	endif     ! MODIFICA DEL 16/8/2015
	  
	        enddo
	  	            
	   endif
	  
	        write(10,*)
	  
	  
	  
	  	Num_celle_routing = Num_celle_routing + jjj
	  
	jjj = 0
	  
	  
	  enddo
	
	
	
	endif
	
		enddo

     
	
      write(10,'(''number of the second stripe of routing cells'',2x,I5)
     1') Num_celle_routing
	write(10,*)
	write(10,'(''column and row index of the second stripe of routing 
	1cells'')')
	write(10,*)

	do ij = 1, Num_celle_routing
	write(10,*) ic_routing(ij), ir_routing(ij)
	enddo

         allocate (V_solido_sorg(Num_sorgenti))
         allocate (V_entrato_sorg(Num_sorgenti))
	

c      simulazione deflusso delle prime celle sorgenti 
      
      zero = 0.0
		
c      stabilita'

           
	cel_max = 0.0


      
	!   t(1) = t_1d(1,1) + DT1   tolto il 22/11/2012



*******************************************  MARZO 2010    da RIVEDERE

c      calcolo afflusso

     
 !     call Q_tempi_iniz(1,1)

!	write(*,*) DT1, Vtot
	

	N_iji = 1

	idf(1) = 1

	i_iniz = N_iji + 1

	V_totale = 0.0
	V_affluito = 0.0   ! 22/11/2012

	!V_totale = Vtot*float(Nsorg1(1))
	
	
!***************************************************************************************
!  RIEMPIMENTO CELLE DI INPUT ATTIVE  22/11/2012
!***************************************************************************************
	
	
	do ii = 1, Num_sorgenti
	 IF (attivata(ii).eq.1.0) THEN
	   do i = 1, Nsorg1(ii)

           h(ic_sorg1(i,ii),ir_sorg1(i,ii)) = V_input_iniziale(ii)/
     1(lato_cella*lato_cella)
           h_tot(ic_sorg1(i,ii),ir_sorg1(i,ii)) = ele(ic_sorg1(i,ii),
     1ir_sorg1(i,ii)) + h(ic_sorg1(i,ii),ir_sorg1(i,ii)) ! DA MODIFICARE CON /(LATO_CELLA*LATO_CELLA)
     
       Conc(ic_sorg1(i,ii),ir_sorg1(i,ii)) = Conc_input_iniziale(ii)  ! bifase
       h_solido(ic_sorg1(i,ii),ir_sorg1(i,ii)) = Conc(ic_sorg1(i,ii)
     1,ir_sorg1(i,ii))*h(ic_sorg1(i,ii),ir_sorg1(i,ii))
            
                Vaffluito = Vaffluito + V_input_iniziale(ii)
			
	write(10,'(''flow depth in the input area n.'',1x,I3,
	1'' cell number n.'',1x,I3,4x,f14.4)') ii, i, 
     1h(ic_sorg1(i,ii),ir_sorg1(i,ii))
	write(10,'(''corresponding maximum sin of relative angle, weight
	1 value and Chezy value'',2x,f8.5,2x,f8.5,2x,f8.5)') peso_max
	1(ic_sorg1(i,ii),ir_sorg1(i,ii)), sen_max(ic_sorg1(i,ii),ir_sorg1(i,ii)
	1), Ch(ic_sorg1(i,ii),ir_sorg1(i,ii))
			
		      
		
			 cel = Ch(ic_sorg1(i,ii),ir_sorg1(i,ii))*peso_max(ic_sorg1(i,ii)
	1,ir_sorg1(i,ii))*sqrt(9.81*h(ic_sorg1(i,ii),ir_sorg1(i,ii))*
     1sen_max(ic_sorg1(i,ii),ir_sorg1(i,ii))) 
		      cel = cel + sqrt(9.81*h(ic_sorg1(i,ii),ir_sorg1(i,ii)))
		
		      write(10,'(''corresponding wave celerity'',2x,f14.4)') cel
		
		    	 if (cel.gt.cel_max) then
                 cel_max = cel
               !   IC_celmax = ic_sorg1(i,ii)
               ! IR_celmax = ir_sorg1(i,ii)
                endif

           enddo
          ENDIF
         enddo	
         
         DT = 0.0
         
         if (cel_max.gt.0.0) then
         
                DT = Courant*lato_cella/cel_max
               
                 
         else
         
         ! vedere di fare il ciclo con lo stramazzo e se non viene niente allora warning
         
         
      write(10,'("WARNING MAX CELERITY AFTER TIME STEP IS 0: no flow  
     1from the input cells")') 
     
       write(10,'("time step is setted to 5 seconds")') 
     
      DT = 5.0
                 
         
         endif
         
    !     if (Cmedio_input.gt.0.0) then
         
         
    !     do j = 1, Num_sorgenti
         
	!V_totale = V_totale + V_input_iniziale(j)*float(Nsorg1(j))  !  29/11/2012
	
	   
	!   enddo
	
	!  V_totale = sum(V_input_iniziale)  !  22/11/2012

*******************************************  MARZO 2010

*********************************************************************** computo continuità
      
!	V_entrato = 0.0 !  azzeramento variabile
!	V_solid_input = 0.0

    !  V_entrato = V_entrato + Vtot*float(Nsorg1(1))
    
    !    V_entrato = V_totale
    !    V_solid_input = V_totale*Cmedio_input
    

	!V_eroso = 0.0
	!V_depositato = 0.0
	
	!else
	
	V_solid_input = 0.0
	
	  do j = 1, Num_sorgenti
         
	V_totale = V_totale + V_input_iniziale(j)*float(Nsorg1(j))  !  29/11/2012
	V_solid_input = V_solid_input + Conc_input_iniziale(j)*
	1V_input_iniziale(j)*float(Nsorg1(j))
	   
	   enddo
	V_entrato = 0.0 !  azzeramento variabile
	

    !  V_entrato = V_entrato + Vtot*float(Nsorg1(1))
    
        V_entrato = V_totale
        
	V_eroso = 0.0
	V_depositato = 0.0
	
	V_solido_eroso = 0.0
	V_solido_depositato = 0.0
	
	V_solido_eroso_STEP = 0.0
	V_solido_depositato_STEP = 0.0
	
	Cmedio = V_solid_input/V_totale
	
	
	
	!endif
	
	

*************************************************************************************************
*        DEFLUSSO DA CELLE SORGENTE IN DT [t(2) - t(1)] per il riempimento fino al tempo  t(1)
**************************************************************************************************
       h_defluit = 0.0

        do ii = 1, Num_sorgenti
        
          if (attivata(ii).eq.1.0) then


      do iii = 1, Nsorg1(ii)

      h_vol = 0.0  ! aggiunto il 26/11/2012
      coeff = 1.0
      dhh_tot = 0.0
      ddh_tot = 0.0
  
	if (h(ic_sorg1(iii,ii),ir_sorg1(iii,ii)).gt.zero) then

*****************************************************************	   

      loop_AD :   do iiii = 1,15

	 Qtot = 0.0

	        do j = 1, k(ic_sorg1(iii,ii),ir_sorg1(iii,ii))

c      calcolo portata defluente nella j-esima cella

              
 
      dh_cost(j) = 0.0
	Q(j) = 0.0

	Q(j) = peso_d(ic_sorg1(iii,ii),ir_sorg1(iii,ii),j)*lato_cella
     1*h(ic_sorg1(iii,ii),ir_sorg1(iii,ii))*sqrt(9.81*h(ic_sorg1(iii,ii)
     1,ir_sorg1(iii,ii))*senteta(ic_sorg1(iii,ii),ir_sorg1(iii,ii),j))*
	1coeff*Ch(ic_sorg1(iii,ii),ir_sorg1(iii,ii))



c      calcolo della profondita' nella cella j-esima

      ic1 = ic_d( ic_sorg1(iii,ii), ir_sorg1(iii,ii),j)
	ir1 = ir_d( ic_sorg1(iii,ii), ir_sorg1(iii,ii),j)

	dh_cost(j) = Q(j)*DT/(lato_cella*lato_cella)

      

c       totale della portata defluita dalla iii-esima cella sorgente

       Qtot = Qtot + Q(j)


	         enddo

c      controllo continuita'

        h_vol = Qtot*DT/(lato_cella*lato_cella)

	 


	if (h_vol.gt.h(ic_sorg1(iii,ii),ir_sorg1(iii,ii))) then
	 
	 coeff = 0.95*coeff*(1 - (h_vol - h(ic_sorg1(iii,ii),ir_sorg1
	1(iii,ii)))/h_vol)


      else

!		  h(ic_sorg1(iii,ii),ir_sorg1(iii,ii)) = 
!     1 h(ic_sorg1(iii,ii),ir_sorg1(iii,ii)) - h_vol

      do j = 1,k(ic_sorg1(iii,ii),ir_sorg1(iii,ii))

      
      ic1 = ic_d(ic_sorg1(iii,ii), ir_sorg1(iii,ii),j)
	ir1 = ir_d(ic_sorg1(iii,ii), ir_sorg1(iii,ii),j)

	dh_entrata_sorg(ic1,ir1) = dh_entrata_sorg(ic1,ir1) + dh_cost(j)
	
	dh_entrata_solido_sorg(ic1,ir1) = dh_entrata_solido_sorg(ic1,ir1) +
     1Conc_input_iniziale(ii)*dh_cost(j)   ! bifase

	h_affluito = h_affluito + dh_cost(j)

	enddo


	 h_defluito = h_defluito + h_vol

	 exit loop_AD

      endif


	if (iiii.eq.15) then

	    do j = 1,k(ic_sorg1(iii,ii),ir_sorg1(iii,ii))


      ic1 = ic_d(ic_sorg1(iii,ii), ir_sorg1(iii,ii),j)
	ir1 = ir_d(ic_sorg1(iii,ii), ir_sorg1(iii,ii),j)

	dh_entrata_sorg(ic1,ir1) = dh_entrata_sorg(ic1,ir1) + dh_cost(j)
	dh_entrata_solido_sorg(ic1,ir1) = dh_entrata_solido_sorg(ic1,ir1) +
     1Conc_input_iniziale(ii)*dh_cost(j)   ! bifase

	h_affluito = h_affluito + dh_cost(j)
	enddo

!	 h_defluito = h_defluito + h_vol

	write(0,'("mass conservation not respected in input cell")')
	write(0,*) warn6
	write(0,1117) iii, ic_sorg1(iii,ii), ir_sorg1(iii,ii), t1


      write(10,'("mass conservation not respected in input cell")')
	write(10,*) warn6
	write(10,1117) iii, ic_sorg1(iii,ii), ir_sorg1(iii,ii), t1

     
	endif




	end do loop_AD
	   


	
     
	
		h(ic_sorg1(iii,ii),ir_sorg1(iii,ii)) = h(ic_sorg1(iii,ii),ir_sorg1
	1(iii,ii)) - ddh_tot - h_vol  ! aggiornamento simultaneità
	h_solido(ic_sorg1(iii,ii),ir_sorg1(iii,ii)) = h_solido(ic_sorg1(iii,ii)
     1,ir_sorg1(iii,ii)) - (ddh_tot + h_vol)*Conc_input_iniziale(ii)
	
c	      write(30,*) warn16
c		write(30,'("mass conservation not respected in input cell")')
c		write(30,*) warn6
c		write(30,1117) iii, ic_sorg1(iii,ii), ir_sorg1(iii,ii), t(2)
c		write(30,1119) warn18, ii
	
c	      write(10,*) warn16
c	      write(10,'("mass conservation not respected in input cell")')
c		write(10,*) warn6
c		write(10,1117) iii, ic_sorg1(iii,ii), ir_sorg1(iii,ii), t(2)
c		write(10,1119) warn18, ii
	   
		
c		  endif
	
c		end do loop_DD 
		
		h_defluit = h_defluit + h_vol + dhh_tot
	
		
		endif  ! chiusura h > 0
		
		enddo  ! chiusura celle sorgenti di una stessa area
		
		endif   ! chiusura attivata 
		
		enddo  !  chiusura ciclo celle sorgenti
	
			
	

	Vdefluito = Vdefluito + h_defluit*lato_cella*lato_cella 

	  sommadh = 0.0

      do irow = 1, no_rows
	    do icol = 1, no_columns
            if (ele(icol,irow).ne.esterno) then


      sommadh = sommadh + dh_entrata_sorg(icol,irow)*lato_cella*
	1lato_cella    ! aggiornato 26/11/2012
   
      endif
	enddo
	enddo

	Vaffluito_striscia1_tot = Vaffluito_striscia1_tot + sommadh


c      profondita' istante successivo



        do irow = 1, no_rows
	      do icol = 1, no_columns
            if (ele(icol,irow).ne.esterno) then

	          if(val_sorg(icol,irow).ne.100) then
	          
	  

	h(icol,irow) = h(icol,irow) + dh_entrata_sorg(icol,irow) 
	h_tot(icol,irow) = ele(icol,irow) + h(icol,irow)
	
	
	if (h(icol,irow).gt.0.0) then
	h_solido(icol,irow) = dh_entrata_solido_sorg(icol,irow)
	Conc(icol,irow) = dh_entrata_solido_sorg(icol,irow)/h(icol,irow)  ! bifase
	endif
	
	!if (Conc(icol,irow).ne.0.0) then
	! write(10,*) icol, irow
	  ! write(10,*)dh_entrata_solido_sorg(icol,irow), h(icol,irow)
	   !write(10,*) conc(icol,irow)
	   !endif
	
	h_post(icol,irow) = h(icol,irow)

	i = i + 1

c	write(10,*) icol, irow, i
c	write(10,*) h(icol,irow), dh(icol,irow), h_tot(icol,irow)
c	write(10,*)

	           else

                     h_tot(icol,irow) = ele(icol,irow) + h(icol,irow)
                     
	   
	   
	           endif


	endif
       enddo
	    enddo


c      write(10,*) pippo2
c	write(10,*)

             
   !   t(2) = t(1) + DT
   
        t2 = t1 + DT

	

	
*************** damocles ********************************************

c      CONTROLLO per evitare che il secondo passo temporale modello 
c      superi il secondo passo temporale del secondo idrogramma 


      
****************************************  MARZO 2010

      do ii = 1, Num_sorgenti
	do i = 1,Nsorg1(ii)

	!  val_tempi(ic_sorg1(i,ii),ir_sorg1(i,ii)) = t(1)
	val_tempi(ic_sorg1(i,ii),ir_sorg1(i,ii)) = t1    ! 15/01/2013
	  val_flag(ic_sorg1(i,ii),ir_sorg1(i,ii)) = 1.0

	enddo
	enddo

	
	do i = 1,Num_celle_routing

!	write(*,*) Num_celle_bacino, i, ic_routing(i), ir_routing(i), t(2)

      !	val_tempi(ic_routing(i),ir_routing(i)) = t(2)
      val_tempi(ic_routing(i),ir_routing(i)) = t2   ! 15/01/2013
	    val_flag(ic_routing(i),ir_routing(i)) = 1.0

	enddo
	
	sum_attivata = 0.0
	
	allocate (attivata_new(Num_sorgenti))
	
	do j = 1, Num_sorgenti
	
	 sum_attivata = sum_attivata + attivata(j)
	 attivata_new(j) = 0.0
	
	
	enddo

      	    

*************** damocles ********************************************

           j_TS = 0   ! aggiunta 31/10/2013

          write(1000001,'("TS     0")')
          write(1000002,'("TS     0")')
          write(1000006,'("TS     0")')  ! 18/9/2017
          if (control_eros.eq.1.0) then
          write(1000003,'("TS     0")')
          endif
         !write(1000004,'("TS     0")')
          write(1000005,'("TS     0")')
          
          j_TS = j_TS + 1  ! aggiunta 31/10/2013
          
          
           i_celle2 = 0
        
       do j = 1, no_rows
	     do i = 1, no_columns
	        
              if(ele(i,j).ne.esterno) then
               i_celle2 = i_celle2 + 1 
               
               ic_sol(i_celle2)= i
               ir_sol(i_celle2)= j
               
       
	        h_sol(i_celle2) = h(i,j)
	        htot_sol(i_celle2) = h_tot(i,j)
	        eros_sol(i_celle2) = Eros_tot(i,j)
              conc_sol(i_celle2) = conc(i,j)  ! 18/9/2017
	    !    vel_sol(i_celle2) = velocit(i,j)
	    !    direz_vel_sol(i_celle2) = direz_vel(i,j)
	        vel_sol_x(i_celle2) = Vx(i,j)
	        vel_sol_y(i_celle2) = Vy(i,j)
	       
	     
	         write(1000001,'(f15.6)') h_sol(i_celle2)
	         write(1000002,'(f15.6)') htot_sol(i_celle2)
               write(1000006,'(f15.6)') conc_sol(i_celle2)  ! 18/9/2017
	         if (control_eros.eq.1.0) then
	         write(1000003,'(f15.6)') eros_sol(i_celle2)
	         endif
   !   write(1000004,'(2f15.6)') vel_sol(i_celle2), 
   !  1direz_vel_sol(i_celle2)
     
              write(1000005,'(2f15.6)') vel_sol_x(i_celle2), 
     1vel_sol_y(i_celle2)
	         
	         endif
	         
	         
	         
	         enddo
	         enddo


	
       allocate (V_input(Num_sorgenti))
       allocate (VS_input(Num_sorgenti))
       
       Check_massa = 0.0
       Check_VS = 0.0
       
       h_solid = 0.0
       
        do irow = 1, no_rows
	      do icol = 1, no_columns
              if (ele(icol,irow).ne.esterno) then

	           h_solid = h_solid + h_solido(icol,irow)
	       
	         endif
	       
	       enddo
	  enddo
	       
	        
	   V_solido = h_solid*lato_cella*lato_cella 
	   
	    
	 write(10,*)
       write(10,'(" input solid volume (m^3)",2x,f20.5)') V_solid_input
       write(10,*)
       write(10,'(" solid routing volume (m^3)",2x,f20.5)') V_solido
       write(10,*)
    
       volume_solido_intrappolato = 0.0
       volume_intrappolato = 0.0
             
       volume_solido_intrappolato_STEP = 0.0 
       
       i_DQ = 0
       
       tempo_scrittura_interfaccia = 0.0
       
       volume_entrato = 0.0
       

*************************************************************************
**********BARBINI parallel principal cycle october 2021
*************************************************************************
      file_name2 = "_parallel.m"
	retint = scan (fileLog,'.')
      if (retint > 1) then
	     file_finale = fileLog(1:retint-1)//'_'//file_name2
      endif
      open(1299,file = file_finale)
      write(1299,'(" clear all")')
!      cel_print = 20
c      write(1299,*) "Parallel code"
c      WRite(1299,*) OMP_get_num_procs(), OMP_get_num_threads()
!      
      file_name2 = "_parallel_vol.m"
	retint = scan (fileLog,'.')
      if (retint > 1) then
	     file_finale = fileLog(1:retint-1)//'_'//file_name2
      endif
      open(1399,file = file_finale)
      write(1399,'(" clear all")')
      write(1399,*) "Parallel code"
      WRite(1399,*) OMP_get_num_procs(), OMP_get_num_threads() 
!      
      file_name2 = "_parallel_vel.m"
	retint = scan (fileLog,'.')
      if (retint > 1) then
	     file_finale = fileLog(1:retint-1)//'_'//file_name2
      endif
      open(1499,file = file_finale)
      write(1499,'(" clear all")')
      write(1499,*) "Parallel code"
!      
!            file_name2 = "_parallel_t.m"
!	retint = scan (fileLog,'.')
!      if (retint > 1) then
!	     file_finale = fileLog(1:retint-1)//'_'//file_name2
!      endif
!      open(1599,file = file_finale)
!      write(1599,'(" clear all")')
!      write(1599,*) "Parallel code"
 
      
      
      
      avvert = "inizio ciclo di calcolo"
      avvert = "beginning of computation loop"
      write(10,*)
	write(10,*) avvert, Total_t
	write(10,*)
      write(0,*) avvert
      
      write(0,*)  "Number of available threads =", OMP_get_num_procs()
      write(0,*)  "Number of setted threads    =", CPUs

      write(10,*) "Number of available threads =", OMP_get_num_procs()
      Write(10,*) "Number of setted threads    =", CPUs
   !   loop_centrale : do ii = 2,N_stati-1
   
        ii = 2
       
        t = t2
        t_prima = t1
        index_timing=1
        V_entrato_DT = 0.0
        V_solid_input_DT = 0.0
        V_entrato_DT_1 = 0.0
        V_solid_input_DT_1 = 0.0
        VOLUME_ENTRATO_IDRO = 0.0
	  VOLSOL_ENTRATO_IDRO = 0.0
        VOLUME_ENTRATO_IDRO_1 = 0.0
	  VOLSOL_ENTRATO_IDRO_1 = 0.0
        VOLUME_ENTRATO_IDROGRAMMI = 0.0
        VOLsol_ENTRATO_IDROGRAMMI = 0.0
        Vaffluito_1 = 0.0
        Vaffluito_2 = 0.0
        sen_tetatot = 0.0
        cel_max = 0.0
        cel_max_sor = 0.0
        cel = 0.0
        cel1= 0.0
        Volume_solido_eroso_step = 0.0
        Volume_solido_depositato_step = 0.0            
        Volume_solido_eroso = 0.0
        Volume_solido_depositato = 0.0
        V_solido_fuoriuscito_DT = 0.0
        V_fuori_uscito_DT = 0.0
        Q_CONTORNO_TOTALE = 0.0
        Num_celle_routing_old = Num_celle_routing
        i_eros = 0
        j_vel = 0
        cq = 0.385
        V_input = 0
        tempo_scrittura2  = 0.0
       
  
      
c Point 1.1 Riempimento celle di input nel time step precedente


      DO iijj = 1, Num_sorgenti     ! 26/11/2012

         V_inp = 0.0
         VS_inp = 0.0
         V_input(iijj) = 0.0
         VS_input(iijj) = 0.0
         if (attivata(iijj).eq.1.0) then
           if (t_fin(iijj).gt.t_prima) then
           call Hydrograph_volume(t,iijj,V2,VS2)

            if (ii.eq.2) then
             V1 = V_input_iniziale(iijj)
             VS1 = V_input_iniziale(iijj)*Conc_input_iniziale(iijj)
            else
             call Hydrograph_volume(t_prima,iijj,V1,VS1)

            endif
              
            V_input(iijj) = V2 - V1
            VS_input(iijj) = VS2 - VS1
                          
           V_entrato_DT = V_entrato_DT + 
     1     V_input(iijj)*float(Nsorg1(iijj))                 
            
           V_solid_input_DT = V_solid_input_DT + 
     1     VS_input(iijj)*float(Nsorg1(iijj))
              
           V_entrato = V_entrato + 
     1     V_input(iijj)*float(Nsorg1(iijj)) 
           V_solid_input = V_solid_input + 
     1     VS_input(iijj)*float(Nsorg1(iijj))
      
          VOLUME_ENTRATO_IDRO = VOLUME_ENTRATO_IDRO + 
     1    V2*float(Nsorg1(iijj))
     
          VOLSOL_ENTRATO_IDRO = VOLSOL_ENTRATO_IDRO + 
     1    VS2*float(Nsorg1(iijj))
         

           else

           do j = 1, N_step_input(iijj)-1
             
          V_inp = V_inp + 0.5*(Q_input(iijj,j) + Q_input(iijj,j+1))*
     1    (t_1d(iijj,j+1) - t_1d(iijj,j)) 
     
    
          VS_inp = VS_inp + 0.5*(Q_input(iijj,j)*Conc_input(iijj,j) + 
     1    Q_input(iijj,j+1)*Conc_input(iijj,j+1))*
     1    (t_1d(iijj,j+1) - t_1d(iijj,j)) 
         
          enddo
          VOLUME_ENTRATO_IDRO = VOLUME_ENTRATO_IDRO + 
     1    V_inp*float(Nsorg1(iijj)) 
     
          VOLSOL_ENTRATO_IDRO = VOLSOL_ENTRATO_IDRO + 
     1    VS_inp*float(Nsorg1(iijj))           
      
                   
          end if  
            do j = 1, Nsorg1(iijj)
                
               h(ic_sorg1(j,iijj),ir_sorg1(j,iijj)) = h(ic_sorg1
	1(j,iijj),ir_sorg1(j,iijj)) + V_input(iijj)/((lato_cella)**(2.0))
	
	h_solido(ic_sorg1(j,iijj),ir_sorg1(j,iijj)) = h_solido(ic_sorg1(j,iijj)
     1,ir_sorg1(j,iijj)) + VS_input(iijj)/((lato_cella)**(2.0))    ! bifase
     
      Conc(ic_sorg1(j,iijj),ir_sorg1(j,iijj)) = 
     1h_solido(ic_sorg1(j,iijj),ir_sorg1(j,iijj))/
     1h(ic_sorg1(j,iijj),ir_sorg1(j,iijj))    ! bifase
	
	 Vaffluito_1 = Vaffluito_1 + V_input(iijj)

            enddo       
         endif
      enddo   


      tt1_1 = omp_get_wtime()          
 
      		
c Point 1.2  acquisizione celle sorgenti passo temporale successivo

         
      if (int(sum_attivata).lt.Num_sorgenti) then

       do j = 1, Num_sorgenti
        
            V_inp = 0.0
            VS_inp = 0.0
              
           if (attivata(j).eq.0.0) then
 
              if (t_1d(j,1).ge.t_prima.and.t_1d(j,1).lt.t) then
              
                attivata(j) = 1.0
                attivata_new(j) = 1.0

                  sum_attivata = sum_attivata + attivata(j)
 
                call Hydrograph_volume(t,j,V_inp,VS_inp)
                 
      V_input(j) = V_inp
      VS_input(j) = VS_inp
      
      V_entrato_DT_1 = V_entrato_DT_1 + V_input(j)*float(Nsorg1(j)) 
      
      V_solid_input_DT_1 = V_solid_input_DT_1 + 
     1VS_input(j)*float(Nsorg1(j))
      
             
       VOLUME_ENTRATO_IDRO_1 = VOLUME_ENTRATO_IDRO_1 + 
     1V_inp*float(Nsorg1(j))  
     
       VOLSOL_ENTRATO_IDRO_1 = VOLSOL_ENTRATO_IDRO_1 + 
     1VS_inp*float(Nsorg1(j)) 

       do jj = 1, Nsorg1(j)
           
               h(ic_sorg1(jj,j),ir_sorg1(jj,j)) = h(ic_sorg1
	1(jj,j),ir_sorg1(jj,j)) + V_input(j)/((lato_cella)**(2.0))

      h_solido(ic_sorg1(jj,j),ir_sorg1(jj,j)) =      
     1h_solido(ic_sorg1(jj,j),ir_sorg1(jj,j)) + 
     1VS_input(j)/((lato_cella)**(2.0))                  ! bifase
     
      Conc(ic_sorg1(jj,j),ir_sorg1(jj,j)) = h_solido(ic_sorg1(jj,j),
     1ir_sorg1(jj,j))/h(ic_sorg1(jj,j),ir_sorg1(jj,j))      ! bifase
	
	 Vaffluito_2 = Vaffluito_2 + V_input(j)
                                 
            enddo                   
           endif 
         endif   
        enddo   


c Point 2.1  Ciclo sorgenti attive per calcolare pendenze per celle sorgenti attivate tempo t
! $OMP do

      do jj = 1, Num_sorgenti

       if (attivata_new(jj).eq.1.0) then   


        do ij = 1, Nsorg1(jj)
          sen_tetatot = 0.0
c       correzione per tener conto che se la cella era già inondata il suo k e' diverso
c       da zero     
            
            k(ic_sorg1(ij,jj),ir_sorg1(ij,jj)) = 0
            
             do j = 1,8
                  icj = ic_sorg1(ij,jj) + i_sh_col(j)
                  irj = ir_sorg1(ij,jj) + i_sh_row(j)
	            
	
	if (ele(icj,irj).ne.esterno) then
	  if (val_sorg(icj,irj).ne.100) then
         call kern (ele(ic_sorg1(ij,jj),ir_sorg1(ij,jj)),
     1              ele(icj,irj),j,sen_tetaj,lato_cella)
         sen_teta(ic_sorg1(ij,jj),ir_sorg1(ij,jj),j)= sen_tetaj
	
        endif
      endif
 
      if  (sen_teta(ic_sorg1(ij,jj),ir_sorg1(ij,jj),j).gt.0.0) then
	  if (val(icj,irj).ge.0.0.and.val(icj,irj).le.float(ii)) then

	   k(ic_sorg1(ij,jj),ir_sorg1(ij,jj)) = 
	1    k(ic_sorg1(ij,jj),ir_sorg1(ij,jj))+ 1
    
      senteta(ic_sorg1(ij,jj),ir_sorg1(ij,jj),k(ic_sorg1(ij,jj),ir_sorg1
	1(ij,jj))) = sen_teta(ic_sorg1(ij,jj),ir_sorg1(ij,jj),j)

	ic_d(ic_sorg1(ij,jj),ir_sorg1(ij,jj),k(ic_sorg1(ij,jj),
	1ir_sorg1(ij,jj))) = icj
	ir_d(ic_sorg1(ij,jj),ir_sorg1(ij,jj),k(ic_sorg1(ij,jj),
	1ir_sorg1(ij,jj))) = irj

      sen_tetatot = sen_tetatot
	1 + sen_teta(ic_sorg1(ij,jj),ir_sorg1(ij,jj),j)

	   endif
	 endif
      enddo

	sen_max(ic_sorg1(ij,jj),ir_sorg1(ij,jj)) = 0.0

c      determinazione del peso e della pendenza e peso massimi   

	do j = 1,k(ic_sorg1(ij,jj),ir_sorg1(ij,jj))

	peso_d(ic_sorg1(ij,jj),ir_sorg1(ij,jj),j) = senteta(ic_sorg1(ij,jj),
	1ir_sorg1(ij,jj),j)/sen_tetatot

	if (senteta(ic_sorg1(ij,jj),ir_sorg1(ij,jj),j).gt.sen_max
	1(ic_sorg1(ij,jj),ir_sorg1(ij,jj))) then
	 sen_max(ic_sorg1(ij,jj),ir_sorg1(ij,jj)) = senteta
     1 (ic_sorg1(ij,jj),ir_sorg1(ij,jj),j)
	 peso_max(ic_sorg1(ij,jj),ir_sorg1(ij,jj)) = peso_d(ic_sorg1(ij,jj),
	1 ir_sorg1(ij,jj),j)
	 endif
	   enddo 
        enddo

       endif  ! fine ciclo attivata_new

      enddo
! $OMP end do nowait 

c Point 2.2  Identificazione celle routing su nuove sorgenti 

! $OMP Single private(jj,j,i,icj,irj)
        
	  do jj = 1, Num_sorgenti
	  
	     if (attivata_new(jj).eq.1.0) then
	  
              attivata_new(jj) = 0.0
              
	Loop_B: do i = 1, Nsorg1(jj)

      if (k(ic_sorg1(i,jj),ir_sorg1(i,jj)).gt.0) then

       do j = 1, k(ic_sorg1(i,jj),ir_sorg1(i,jj))

        if (val(ic_d(ic_sorg1(i,jj),ir_sorg1(i,jj),j),
	1ir_d(ic_sorg1(i,jj),ir_sorg1(i,jj),j)).eq.0.0) then

         Num_celle_routing = Num_celle_routing + 1

	   ic_routing(Num_celle_routing) = 
	1    ic_d(ic_sorg1(i,jj),ir_sorg1(i,jj),j)
	   ir_routing(Num_celle_routing) = 
	1    ir_d(ic_sorg1(i,jj),ir_sorg1(i,jj),j)

	val(ic_routing(Num_celle_routing),ir_routing(Num_celle_routing)) 
	1= float(ii+1)
	
	     endif
	    enddo
	   endif
	  end do Loop_B
	 endif
        enddo
      
  

       endif

  


   

C point 2.3 calcolo della pendenze per le celle routing individuate nello step precedente
      

      do i = 1, Num_celle_routing_old
        sen_tetatot = 0.0
        if (val(ic_routing(i),ir_routing(i)).eq.float(ii)) then   ! nuova if  10/12/2012   
         k(ic_routing(i),ir_routing(i)) = 0  
         do j = 1,8
           icj = ic_routing(i) + i_sh_col(j)
           irj = ir_routing(i) + i_sh_row(j)
           if (ele(icj,irj).ne.esterno) then
            if (val_sorg(icj,irj).ne.100.0) then   ! MODIFICA DEL 16/08/2015   
             call kern (ele(ic_routing(i),ir_routing(i)),
     1                  ele(icj,irj),j,sen_tetaj,lato_cella)
                  sen_teta(ic_routing(i),ir_routing(i),j)= sen_tetaj
            endif
          endif

         if  (sen_teta(ic_routing(i),ir_routing(i),j).gt.0.0) then
           
	 if (val(icj,irj).ge.0.0.and.val(icj,irj).le.float(ii+1)) then

	k(ic_routing(i),ir_routing(i)) = k(ic_routing(i),ir_routing(i)) + 1
      
	j_dir(ic_routing(i),ir_routing(i),
	1k(ic_routing(i),ir_routing(i))) = j   ! aggiunto il 20/11/2011

      senteta(ic_routing(i),ir_routing(i),k(ic_routing(i),ir_routing(i))
	1) = sen_teta(ic_routing(i),ir_routing(i),j)

	ic_s(ic_routing(i),ir_routing(i),k(ic_routing(i),ir_routing(i))) =
	1 icj
	ir_s(ic_routing(i),ir_routing(i),k(ic_routing(i),ir_routing(i))) = 
	1irj

	sen_tetatot = sen_tetatot
	1 + sen_teta(ic_routing(i),ir_routing(i),j)

        endif
       endif
      enddo

c      peso e pendenza e peso massimi
   
      sen_max(ic_routing(i),ir_routing(i)) = 0.0

	   do j = 1,k(ic_routing(i),ir_routing(i))
     
	 peso(ic_routing(i),ir_routing(i),j) = senteta(ic_routing(i),
	1 ir_routing(i),j)/sen_tetatot
          if (senteta(ic_routing(i),ir_routing(i),j).gt.sen_max
	1       (ic_routing(i),ir_routing(i))) then
	  sen_max(ic_routing(i),ir_routing(i)) = senteta
     1    (ic_routing(i),ir_routing(i),j)

	  peso_max(ic_routing(i),ir_routing(i)) = peso(ic_routing(i),
	1    ir_routing(i),j)

          endif
         enddo
	 endif
      enddo
      
       VOLUME_ENTRATO_IDROGRAMMI = VOLUME_ENTRATO_IDRO_1 +
     1 VOLUME_ENTRATO_IDRO
      VOLSOL_ENTRATO_IDROGRAMMI = VOLSOL_ENTRATO_IDRO_1 +
     1 VOLSOL_ENTRATO_IDRO
      V_entrato_DT = V_entrato_DT + V_entrato_DT_1
      V_entrato = V_entrato + V_entrato_DT_1
      V_solid_input_DT = V_solid_input_DT + V_solid_input_DT_1
      V_solid_input = V_solid_input + V_solid_input_DT_1
      Vaffluito = Vaffluito + Vaffluito_1 + Vaffluito_2
      Check_massa = abs(V_entrato-VOLUME_ENTRATO_IDROGRAMMI)/V_entrato

c Point 1.3 Verifica calolo volumi in ingresso 
      write(10,*)'primo',V_entrato,VOLUME_ENTRATO_IDROGRAMMI,t,t_prima
      if (Check_massa.gt.0.02) write(10,'("MASS CONSERVATION OF INPUT 
     1HYDROGRAPH NOT RESPECTED",4f14.4)')
     iV_entrato,VOLUME_ENTRATO_IDROGRAMMI
     
        if (Check_massa.gt.Check_massa_max) then
      
          Check_massa_max = Check_massa
          t_check_massa_max = t
     
        endif       
        
      Check_VS = abs(V_solid_input-VOLSOL_ENTRATO_IDROGRAMMI)/
     1V_solid_input
      
      if (Check_VS.gt.0.02) write(10,'("SOLID CONSERVATION OF INPUT 
     1HYDROGRAPH NOT RESPECTED")')
     
        if (Check_VS.gt.Check_VS_max) then
      
          Check_VS_max = Check_VS
          t_check_VS_max = t
          
        endif 
        
        V_entrato_DT_t1 = V_entrato_DT
        V_solid_input_DT_t1 = V_solid_input_DT
        V_entrato_t1 = V_entrato
        V_solid_input_t1 = V_solid_input
        V_entrato_DT = 0.0
        V_solid_input_DT = 0.0
        V_entrato_DT_1 = 0.0
        V_solid_input_DT_1 = 0.0
        V_entrato_DT_1 = 0.0
        V_solid_input_DT_1 = 0.0
        VOLUME_ENTRATO_IDRO = 0.0
	  VOLSOL_ENTRATO_IDRO = 0.0
        VOLUME_ENTRATO_IDRO_1 = 0.0
	  VOLSOL_ENTRATO_IDRO_1 = 0.0
        VOLUME_ENTRATO_IDROGRAMMI = 0.0
        VOLsol_ENTRATO_IDROGRAMMI = 0.0
        Vaffluito_1 = 0.0
        Vaffluito_2 = 0.0


c punto 3.2    celerita' massima celle striscie

      do ij  = 1, Num_sorgenti   ! modificata il 3/12/2012
      cel1= 0.0
       
      do i = 1, Nsorg1(ij)
      
	if (h(ic_sorg1(i,ij),ir_sorg1(i,ij)).gt.zero) then

	cel1 = Ch(ic_sorg1(i,ij),ir_sorg1(i,ij))*peso_max(ic_sorg1(i,ij)
	1,ir_sorg1(i,ij))*sqrt(9.81*h(ic_sorg1(i,ij),ir_sorg1(i,ij))*
     1sen_max(ic_sorg1(i,ij),ir_sorg1(i,ij))) + 
     1 sqrt(9.81*h(ic_sorg1(i,ij),ir_sorg1(i,ij)))

      if (cel1.gt.cel_max_sor) cel_max_sor = cel1

      endif
      enddo

      enddo


      do ij = 1, Num_celle_routing_old
       
       if (val(ic_routing(ij),ir_routing(ij)).le.float(ii)) then

	cel = Ch(ic_routing(ij),ir_routing(ij))*peso_max(ic_routing(ij)
	1,ir_routing(ij))*sqrt(9.81*h(ic_routing(ij),ir_routing(ij))*
     1sen_max(ic_routing(ij),ir_routing(ij)))
     1 + sqrt(9.81*h(ic_routing(ij),ir_routing(ij)))
	 

          if (cel.gt.cel_max) cel_max = cel

       endif
      enddo

       do irow = 1, no_rows
	  do icol = 1, no_columns
           if (ele(icol,irow).ne.esterno) then
	        error_map(icol,irow) = 0.0
              dh(icol,irow) = 0.0
		    velocit(icol,irow) = 0.0
		    Vx(icol,irow) = 0.0
		    Vy(icol,irow) = 0.0
		    Vel_Cella(icol,irow) = 0.0
	        dh_entrata_unif(icol,irow) = 0.0
	        dh_entrata_sorg(icol,irow) = 0.0
	        dh_entrata_solido_sorg(icol,irow) = 0.0
	        dh_entrata_solido(icol,irow) = 0.0
	        dh_solido(icol,irow) = 0.0
		    dh_entrata_Bel(icol,irow) = 0.0
	        dh_sed(icol,irow) = 0.0 
              do j = 1,8
                  Vel8(icol,irow,j) = 0.0  ! 29/4/2019
                  Deltah8(icol,irow,j) = 0.0 ! 29/4/2109
              enddo
              if (Intern_Output.eq.1.0)    then
                  dh_uscita_sez(icol,irow) = 0.0
                  dh_uscita_solido_sez(icol,irow) = 0.0              
              endif
	   endif
        enddo
       enddo

c Point 4.0     CALCOLO propagazione

c Point 3.3 Calcolo dt

      if (cel_max_sor.gt.cel_max) cel_max = cel_max_sor
      
      if (cel_max.gt.0.0) then

       IF (cel_max.gt.50.0) cel_max = 50.0  !  8 Settembre 2017
        
        DT = Courant*lato_cella/cel_max
        !DT =0.5 !CEL_fissa
         
        !
	else
	
	  write(10,'("WARNING MAX CELERITY AFTER TIME STEP",1x,I10," IS 0:   
     1no flow")') 
     
       write(10,'("time step is setted to 5 seconds")') 
	
	   DT = 5.0
	   
	endif
	      
      t_dopo = t + DT   ! 15/01/2013
        
      if (tempo_scrittura2.eq.1.0) then
 
      write(30,'(" time step and simulation time (seconds)",1x,f12.5,2x,
     1f25.5)')DT, t_dopo

	write(30,*)

	endif
	write(10,'(" simulation time and time step (seconds)",2x,2f25.5)') 
     1 DT, t_dopo

        sen_tetatot = 0.0
        cel_max = 0.0
        cel_max_sor = 0.0
        cel = 0.0
        cel1= 0.0
        
        
        
!$OMP parallel num_threads(CPUs) 
      
      do while (t_dopo.lt.tempo_finale) 
 
!$OMP single private(i, j, icj,irj)
      tt1_1 = omp_get_wtime() 
c Cicle 2.4 Indetificazione nuove celle routing per ciclo ii+1  
      do i = 1, Num_celle_routing_old
       if (val(ic_routing(i),ir_routing(i)).eq.float(ii)) then   ! nuova if  10/12/2012   
        do j = 1,8
         icj = ic_routing(i) + i_sh_col(j)
         irj = ir_routing(i) + i_sh_row(j)
          if  (sen_teta(ic_routing(i),ir_routing(i),j).gt.0.0) then
	     if (val(icj,irj).eq.0.0) then
		   val(icj,irj) = float(ii+1)
	   	    if (InletOutlet(icj,irj).ne.9000.0) then  ! MODIFICA DEL 16/8/2105     
	         Num_celle_routing = Num_celle_routing + 1
               ic_routing(Num_celle_routing) = icj
	         ir_routing(Num_celle_routing) = irj	    
	     endif   ! MODIFICA DEL 16/8/2105
          endif
         endif
        enddo
       endif
      enddo
      tt2 = omp_get_wtime()
!$OMP end single nowait 


      
c Point 4.0     CALCOLO propagazione      
!$OMP  do 
!$OMP& private(h_vol,coeff,j,iii,iiii,ij)
!$OMP& private(Q,dh_cost,ic1,ir1, Qtot,beta)
!$OMP& private(DHH,DHH_tot,peso_s,alfa,ddh_tot,ddh,betamin) 
!$OMP& private(U_stramaz)
!$OMP& collapse(2)
!$OMP& schedule(monotonic: dynamic)
        
      do ij = 1, Num_sorgenti   ! MODIFICATA IL 3/12/2012

         do iii = 1, Nsorg1(ij)
             
          if (attivata(ij).eq.1.0) then   
             
          h_vol = 0.0
          coeff = 1.0
          Q = 0.0
          dh_cost = 0.0
          
          if (h(ic_sorg1(iii,ij),ir_sorg1(iii,ij)).ge.h_routing) then
          
c point 4.2.1 Calcolo deflusso celle sorgente per gravità

          loop_BD :   do iiii = 1,15 

	    Qtot = 0.0


	    do j = 1, k(ic_sorg1(iii,ij),ir_sorg1(iii,ij))

           ic1 = ic_d(ic_sorg1(iii,ij),ir_sorg1(iii,ij),j)
	     ir1 = ir_d(ic_sorg1(iii,ij),ir_sorg1(iii,ij),j)

      if (h_tot(ic_sorg1(iii,ij),ir_sorg1(iii,ij)).gt.h_tot(ic1,ir1))
	1 then     
	    
	Q(j) =peso_d(ic_sorg1(iii,ij),ir_sorg1(iii,ij),j)*lato_cella*
	1h(ic_sorg1(iii,ij),ir_sorg1(iii,ij))*sqrt(9.81*
     1h(ic_sorg1(iii,ij),ir_sorg1(iii,ij))*senteta(ic_sorg1(iii,ij)
     1,ir_sorg1(iii,ij),j))*coeff*Ch(ic_sorg1(iii,ij),ir_sorg1(iii,ij))
c      calcolo della profondita' nella cella j-esima
	        dh_cost(j) = Q(j)*DT/(lato_cella*lato_cella)
c       totale della portata defluita dalla iii-esima cella sorgente
              Qtot = Qtot + Q(j)
	
	    endif
	enddo

C Point 4.2.2     Controllo continuita'

        h_vol = Qtot*DT/(lato_cella*lato_cella)
      
        if (h_vol.gt.h(ic_sorg1(iii,ij),ir_sorg1(iii,ij))) then
	 
	 coeff = 0.95*coeff*(1 - (h_vol - h(ic_sorg1(iii,ij),ir_sorg1  ! Correzione sulle portate uscenti se non è ripettata if precedente
	1(iii,ij)))/h_vol)

         else

       do j =1,k(ic_sorg1(iii,ij),ir_sorg1(iii,ij))
      
	ic1 = ic_d(ic_sorg1(iii,ij),ir_sorg1(iii,ij),j)
	ir1 = ir_d(ic_sorg1(iii,ij),ir_sorg1(iii,ij),j)

!$omp atomic
	dh_entrata_sorg(ic1,ir1) = dh_entrata_sorg(ic1,ir1) + dh_cost(j)

!$OMP atomic
      dh_entrata_solido_sorg(ic1,ir1) = dh_entrata_solido_sorg(ic1,ir1)+
     1Conc(ic_sorg1(iii,ij),ir_sorg1(iii,ij))*dh_cost(j)   ! bifase


       
       enddo
       
	 exit loop_BD

         endif

      if (iiii.eq.15) then
 
	 do j = 1,k(ic_sorg1(iii,ij),ir_sorg1(iii,ij))

	 ic1 = ic_d(ic_sorg1(iii,ij),ir_sorg1(iii,ij),j)
	 ir1 = ir_d(ic_sorg1(iii,ij),ir_sorg1(iii,ij),j)
!$omp atomic
	dh_entrata_sorg(ic1,ir1) = dh_entrata_sorg(ic1,ir1) + dh_cost(j)

!$omp atomic	
	dh_entrata_solido_sorg(ic1,ir1) = dh_entrata_solido_sorg(ic1,ir1) +
     1Conc(ic_sorg1(iii,ij),ir_sorg1(iii,ij))*dh_cost(j)   ! bifase


       enddo
      
      
       
      if(boolfileERR)then
	 write(19,*) warn15
	 write(19,'("mass conservation not respected in source cell")')
	 write(19,*) warn6
	 write(19,1117) ij, ic_sorg1(iii,ij), ir_sorg1(iii,ij), t
	 write(19,1119) warn18, ii
       write(10,*) "Warning",warn15
      else

      write(10,*) "Warning",warn15
      write(10,'("mass conservation not respected in source cell")')
	write(10,*) warn6
	write(10,1117) ij, ic_sorg1(iii,ij), ir_sorg1(iii,ij), t
	write(10,1119) warn18, ii
      
      end if 
      
      endif
      
	end do loop_BD

c point 4.2.3      calcolo deflusso per differenze di altezza
  
************************************************************

c       calcolo dei pesi

      dhh_tot = 0.0
      
	do j = 1,8
      
	DHH(j) = 0.0

	ic1 = ic_sorg1(iii,ij)+i_sh_col(j)
	ir1 = ir_sorg1(iii,ij)+i_sh_row(j)

      if (ele(ic1,ir1).ne.esterno.and.val_sorg(ic1,ir1).ne.100.0) then

      if (ele(ic_sorg1(iii,ij),ir_sorg1(iii,ij)).le.ele(ic1,ir1)) then

	 if (h_tot(ic_sorg1(iii,ij),ir_sorg1(iii,ij)).gt.h_tot
	1(ic1,ir1)) then

      DHH(j) = h_tot(ic_sorg1(iii,ij),ir_sorg1(iii,ij)) - ele(ic1,ir1)

	DHH_tot = DHH_tot + DHH(j)

c       aggiornamento dell' ultima striscia
	endif
	endif
	 endif
 
	 enddo

	do j = 1,8

	peso_s(j) = 0.0

	    if (DHH(j).gt.zero) then

	         peso_s(j) = DHH(j)/DHH_tot
	
	          
	    endif

	enddo

c      algoritmo di deflusso



      alfa(1) = 1.0

      loop_DDD : do iiii = 1,15


	ddh_tot = 0.0

	      do j = 1,8
      if (DHH(j).gt.zero) then

      !  aggiunto 8/10/2019
      cq = 0.385
      U_stramaz(j) = 0.0

	 ddh(j) = alfa(iiii)*peso_s(j)*(cq)*DHH(j)*sqrt(2.0*9.81*
	1 DHH(j))*DT/lato_cella

	 ddh_tot = ddh_tot + ddh(j)
	
	endif

	enddo
	
c Point 4.2.4     controllo di compatibilita'/continuita'

      betamin = 1.0
	beta = 0.0
      do j = 1,8
	  if (DHH(j).gt.zero) then
	    if (ddh_tot.gt.DHH(j)) then
	      beta = DHH(j)/ddh_tot
	      if (beta.lt.betamin) betamin = beta
	    endif
	  endif
      enddo

	alfa(iiii+1) = 0.95*alfa(iiii)*betamin


	if (betamin.eq.1.0) then
	
	do j = 1,8

        if (DHH(j).gt.zero) then

          ic1 = ic_sorg1(iii,ij)+i_sh_col(j)
	    ir1 = ir_sorg1(iii,ij)+i_sh_row(j)

!$omp atomic
	    dh_entrata_sorg(ic1,ir1) = dh_entrata_sorg(ic1,ir1) + ddh(j)

!$omp atomic
	dh_entrata_solido_sorg(ic1,ir1) = dh_entrata_solido_sorg(ic1,ir1) +
     1Conc(ic_sorg1(iii,ij),ir_sorg1(iii,ij))*ddh(j)   ! bifase	

        
        endif
	
      enddo

	h(ic_sorg1(iii,ij),ir_sorg1(iii,ij)) = h(ic_sorg1(iii,ij),
	1ir_sorg1(iii,ij)) - ddh_tot - h_vol ! aggiornamento simultaneità

      h_solido(ic_sorg1(iii,ij),ir_sorg1(iii,ij)) = 
	1h_solido(ic_sorg1(iii,ij),ir_sorg1(iii,ij)) - (ddh_tot + h_vol)*
	1Conc(ic_sorg1(iii,ij),ir_sorg1(iii,ij))  ! aggiornamento simultaneità
	exit loop_DDD

      endif

	if (iiii.eq.15) then

	do j = 1,8

	  if (DHH(j).gt.zero) then

          ic1 = ic_sorg1(iii,ij)+i_sh_col(j)
	    ir1 = ir_sorg1(iii,ij)+i_sh_row(j)

!$omp atomic
		dh_entrata_sorg(ic1,ir1) = dh_entrata_sorg(ic1,ir1) + ddh(j)

!$omp atomic	
		dh_entrata_solido_sorg(ic1,ir1) = dh_entrata_solido_sorg(ic1,ir1) +
     1Conc(ic_sorg1(iii,ij),ir_sorg1(iii,ij))*ddh(j)   ! bifase

        endif

      enddo

	h(ic_sorg1(iii,ij),ir_sorg1(iii,ij)) = h(ic_sorg1(iii,ij),ir_sorg1
	1(iii,ij)) - ddh_tot - h_vol  ! aggiornamento simultaneità
	
	h_solido(ic_sorg1(iii,ij),ir_sorg1(iii,ij)) = 
	1h_solido(ic_sorg1(iii,ij),ir_sorg1(iii,ij)) - (ddh_tot + h_vol)*
	1Conc(ic_sorg1(iii,ij),ir_sorg1(iii,ij))  ! aggiornamento simultaneità
      
      
      if(boolfileERR)then
      write(19,*) warn16
	write(19,'("mass conservation not respected in source cell")')
	write(19,*) warn6
	write(19,1117) ij, ic_sorg1(iii,ij), ir_sorg1(iii,ij), t
	write(19,1119) warn18, ii
      write(10,*) "WARNING",warn16
      else
      
      write(10,*) "WARNING",warn16
      write(10,'("mass conservation not respected in source cell")')
	write(10,*) warn6
	write(10,1117) ij, ic_sorg1(iii,ij), ir_sorg1(iii,ij), t
	write(10,1119) warn18, ii
      end if
      
	    endif
	   end do loop_DDD 
          endif   ! chiusura h>0
   	endif   ! chiusura attivata       
       enddo   ! chiusura ciclo delle celle area sorgente      
       enddo   ! chiusura ciclo aree sorgenti
      
!$OMP end do NOWAIT    
!$OMP single
        V_entrato_DT = 0.0
        V_solid_input_DT = 0.0
        V_entrato_DT_1 = 0.0
        V_solid_input_DT_1 = 0.0
!$OMP end single nowait
!$OMP single
        VOLUME_ENTRATO_IDRO = 0.0
	  VOLSOL_ENTRATO_IDRO = 0.0
        VOLUME_ENTRATO_IDRO_1 = 0.0
	  VOLSOL_ENTRATO_IDRO_1 = 0.0
!$OMP end single nowait
!$OMP single
        Vaffluito_1 = 0.0
        Vaffluito_2 = 0.0
        sen_tetatot = 0.0
!$OMP end single nowait      
        
      
!$OMP do      
!$OMP& private(iii, j,h_vol_str,coeff,Qtot,Q,UU, h_fin)
!$OMP& private(dh_cost_tot,dh_neg,dh_inf,dh_infBel)
!$OMP& private(dh_cost,dh_eros,ic1,ir1,h_fin_origine,h_origine) 
!$omp& private(h_fin_destinaz_max,h_iniz_destinaz_max,dh_cost_max)
!$OMP& private(rapp,differenza,dh_eros_tot,ic,ir,j_vel_stramaz_max)
!$OMP& private(dhh_tot,DHH_max,DHH,peso_e,betamin,beta)
!$OMP& private(ddh_tot,ddh,U_stramaz,somma_dh, diff_dh, coeff_dh)
!$OMP& private(U_stramaz_max, deposito_limitato,differenza_solido)
!$OMP& private(differenza_liquido,deposito_liquido,deposito_solido)
!$OMP& private(Eros_tot_previous,Solid_tot_previous,somma_dh_1)
!$OMP& private(sin_max, j_vel_max, D_ele, senteta_superf,eros)
!$OMP& private(quota_finale,spessore_erodibile,dh_eros_Belangier)
!$OMP& reduction(+:volume_solido_intrappolato_STEP)
!$OMP& schedule(monotonic: dynamic)

! 20 maggio 2015

      do iii = 1, Num_celle_routing_old ! Nstr1(ij) ! CICLO CELLE STRISCIA ALLAGATE ALLO STESSO TIME STEP  MODIFICA DEL 10/12/2012

      
      ic = ic_routing(iii)
      ir = ir_routing(iii)

       if (h(ic,ir).gt.zero.and.h(ic,ir).ge.h_routing) then    ! modifica 21/12/2010

*****************************************************************	   
 
	Qtot = 0.0
	dh_cost_tot = 0.0
	dh_neg = 0.0
	dh_inf = 0.0
	dh_infBel = 0.0
      h_vol_str = 0.0
      coeff = 1.0
      dh_eros_tot= 0.0
      
      
c point 4.3.1  calcolo portata defluente nella j-esima cella gravità     
	do j = 1, k(ic,ir)

      dh_cost(j) = 0.0
	dh_eros(j) = 0.0
	Q(j) = 0.0
	UU(j) = 0.0

      ic1 = ic_s(ic,ir,j)
	ir1 = ir_s(ic,ir,j)


      if (h_tot(ic,ir).gt.h_tot(ic1,ir1)) then

      !  3/12/2017
      UU(j) = coeff*peso(ic,ir,j)*sqrt(9.81*
     1 h(ic,ir)*senteta(ic,ir,j))*Ch(ic,ir)

      if (UU(j).gt.20.0) UU(j) = 20.0

      Q(j) = lato_cella*h(ic,ir)*UU(j)
	      
c      calcolo della profondita' nella cella j-esima
      
	dh_cost(j) = Q(j)*DT/(lato_cella*lato_cella)

	dh_cost_tot = dh_cost_tot + dh_cost(j)

c       totale della portata defluita dalla iii-esima cella striscia

       Qtot = Qtot + Q(j)

	endif

	 enddo

c point 4.3.2  controllo continuita' e compatibilita'

        h_vol_str = Qtot*DT/(lato_cella*lato_cella)
        	
      if (h_vol_str.gt.h(ic,ir)) then

	 coeff = h(ic,ir)/h_vol_str - 0.005

	Qtot = 0.0
	dh_cost_tot = 0.0
      dh_neg = 0.0
	h_vol_str = 0.0

c      ri-calcolo portata defluente nella j-esima cella

	 do j = 1, k(ic,ir)

c      calcolo portata defluente nella j-esima cella

      dh_cost(j) = 0.0
	dh_eros(j) = 0.0
	Q(j) = 0.0
	UU(j) = 0.0

          ic1 = ic_s(ic,ir,j)
	    ir1 = ir_s(ic,ir,j)


      if (h_tot(ic,ir).gt.h_tot(ic1,ir1)) then

        UU(j) = coeff*peso(ic,ir,j)*sqrt(9.81*h(ic,ir)*senteta(ic,
     1ir,j))*Ch(ic,ir)

        if (UU(j).gt.20.0) UU(j) = 20.0

       Q(j) = lato_cella*h(ic,ir)*UU(j)

c      calcolo della profondita' nella cella j-esima
      
      
	dh_cost(j) = Q(j)*DT/(lato_cella*lato_cella)

	dh_cost_tot = dh_cost_tot + dh_cost(j)
c       totale della portata defluita dalla iii-esima cella striscia

       Qtot = Qtot + Q(j)
      
      endif

	enddo


	 h_vol_str = Qtot*DT/(lato_cella*lato_cella)

	endif

c        controllo oscillazioni




	h_fin_origine = h_tot(ic,ir) - h_vol_str

	h_origine = h_tot(ic,ir) 


      if (ele(ic,ir).gt.h_fin_origine) then
      
      if(boolfileERR)then    
       write(19,'("uniform flow transfer - first cycle")')
	 write(19,'("Negative depth: continuity equation not respected")')
	 write(19,*) warn8
	 write(19,1117) ij, ic_routing(iii), ir_routing(iii), t
	 write(19,1119) warn18, ii
       write(10,'("Warning - uniform flow transfer - last cycle")')
      else
       write(10,'("Warning - uniform flow transfer - last cycle")')
	 write(10,'("Negative depth: continuity equation not respected")')
	 write(10,*) warn8
	 write(10,1117) ij, ic_routing(iii), ir_routing(iii), t
       write(10,1119) warn18, ii
      endif
      
	endif

c point 4.3.3   controllo oscillazioni     	

	h_fin_destinaz_max = 0.0
	h_iniz_destinaz_max = 0.0
	dh_cost_max = 0.0



	do j = 1,k(ic,ir)
      
	h_fin(j) = 0.0

	if (dh_cost(j).gt.zero) then

	ic1 = ic_s(ic,ir,j)
	ir1 = ir_s(ic,ir,j)

	h_fin(j) = h_tot(ic1,ir1) + dh_cost(j)

	   if (h_fin(j).gt.h_fin_destinaz_max) then
	
	       h_fin_destinaz_max = h_fin(j)
	       h_iniz_destinaz_max = h_tot(ic1,ir1)
	       dh_cost_max = dh_cost(j)

	   endif

	endif
	enddo

	    if (h_fin_destinaz_max.gt.h_fin_origine.and.h_vol_str.gt.0.0) then  !  modificato il 5/02/2013

      coeff = coeff*(1-0.5*(h_fin_destinaz_max-h_fin_origine)/h_vol_str)

      if (coeff.eq.zero) 	coeff = 0.00000000001

	Qtot = 0.0
	dh_cost_tot = 0.0
      dh_neg = 0.0
	h_vol_str = 0.0

c      ri-ri-calcolo portata defluente nella j-esima cella

	        do j = 1, k(ic,ir)

c      calcolo portata defluente nella j-esima cella


      dh_cost(j) = 0.0
	dh_eros(j) = 0.0
	Q(j) = 0.0
	UU(j) = 0.0

          ic1 = ic_s(ic,ir,j)
	    ir1 = ir_s(ic,ir,j)


      if (h_tot(ic,ir).gt.h_tot(ic1,ir1)) then


        UU(j) = coeff*peso(ic,ir,j)*sqrt(
     19.81*h(ic,ir)*senteta(ic,ir,j))*Ch(ic,ir)

         if (UU(j).gt.10.0) UU(j) = 10.0

       Q(j) = lato_cella*h(ic_routing(iii),ir_routing(iii))*UU(j)
	      
c      calcolo della profondita' nella cella j-esima
      dh_cost(j) = Q(j)*DT/(lato_cella*lato_cella)

	 dh_cost_tot = dh_cost_tot + dh_cost(j)

	
c       totale della portata defluita dalla iii-esima cella striscia

       Qtot = Qtot + Q(j)

      endif

              enddo

              h_vol_str = Qtot*DT/(lato_cella*lato_cella)

     
          endif
          
c point 4.3.4 DETERMINAZIONE VELOCITA E DIREZIONI MASSIME  (Novembre 2012)
			
 	   j_vel_max = 0

        do j = 1, k(ic,ir)

          ic1 = ic_s(ic,ir,j)
	    ir1 = ir_s(ic,ir,j)
        
        
             if (UU(j).gt.0.0) j_vel(ic,ir,j_dir(ic,ir,j)) = 1    !  SPOSTATO IL 28 LUGLIO 2015

	      if (UU(j).gt.velocit(ic,ir))  then  ! modificato il 22/02/2012
 	      velocit(ic,ir) = UU(j)
 	      direz_vel(ic,ir) = 
     1 float(j_dir(ic,ir,j))
            j_vel_max = j   ! aggiunto il 24/01/2013
       endif

         !  29/4/2019
      Vel8(ic,ir,j_dir(ic,ir,j)) = UU(j)

      Deltah8(ic,ir,j_dir(ic,ir,j)) = dh_cost(j)

       enddo
        
	if (h_vol_str.gt.h(ic,ir)) then
          
      
      
      if(boolfileERR) then
       write(19,'("uniform flow transfer - last cycle")')
	 write(19,'("Negative depth: continuity equation not respected")')
	 write(19,*) warn8
	 write(19,1117) ij, ic_routing(iii), ir_routing(iii), t
	 write(19,1119) warn18, ii
       write(10,'("Waring - uniform flow transfer - last cycle")')
       else
	write(10,'("Waring - uniform flow transfer - last cycle")')
	write(10,'("Negative depth: continuity equation not respected")')
	write(10,*) warn8
	write(10,1117) ij, ic_routing(iii), ir_routing(iii), t
      write(10,1119) warn18, ii
       end if
	
       endif


c point 4.3.5 calcolo erosione/deposito finale della cella e parziale per le celle confinanti - modificato aprile 09


      if (erod(ic,ir).eq.1.0) then
	
**************************************************************************************
*                      CALCOLO EROSIONE E DEPOSITO (24/01/2013)
**************************************************************************************
c point 4.3.5.1 calcolo erosione
         eros = 0.0
	
	   DO j = 1, k(ic,ir)
	               
	    ic1 = ic_s(ic,ir,j)
	    ir1 = ir_s(ic,ir,j)
	    
	    IF (j.eq.j_vel_max) then    ! 19/04/2013


      if (h_tot(ic,ir).gt.h_tot(ic1,ir1)) then
	               
	if (h(ic,ir).gt.h_erosione) then
	
	 if (Conc(ic,ir).le.0.9*C_fondo(ic,ir)) then   ! INTRODOTTO IL 29 MARZO 2013
	
	 if (UU(j).ge.U_crit1(ic,ir).and.senteta(ic,ir,j).gt.
     1     senteta_crit(ic,ir))  then
     
     
        if (h_post(ic,ir).gt.h_pre(ic,ir)) then   ! 3 Maggio 2013  condizione dh/dt > 0 per erosione
     
	call erosione(DT,j,iii,dh_eros(j),UU(j))
      dh_neg = dh_neg + dh_eros(j)
      
	     endif
	
	  endif

	 endif

        endif

c point 4.3.5.2 calcolo deposito 
      
       if (Conc(ic,ir).ge.C_limite_deposito)
     1 then   ! 30/03/2013
       
c point 4.3.5.2.1 Con pendenza inferiore delle pendenza limite            
        if (senteta(ic,ir,j).le.sin_Limit_Angle)   then
     
          call deposito_inferiore(DT,j,iii,dh_eros(j),UU(j))
       
       dh_inf = dh_inf + dh_eros(j)
       
       dh_neg = dh_neg + dh_eros(j)	
        else
            
c point 4.3.5.2.2 Con velocità inferiroe delle velocità critica a pendenza inferiore delle pendenza critica  

       if (UU(j).le.U_crit2(ic,ir).and.
     1senteta(ic,ir,j).lt.senteta_crit2(ic,ir))   then  ! modifica 13/9/2017
     
	call deposito(DT,j,iii,dh_eros(j),UU(j))
	dh_neg = dh_neg + dh_eros(j)	
	 endif
	 
	 
	 endif
	 
	   endif
	 
	! ENDIF

	
	  endif
	  
	  ENDIF  ! 19/04/2013
	
	                  ENDDO
 
c point 4.3.5.3    controllo che non vi sia un erosione superiore al volume erodibile 
 
         if (dh_neg.lt.0.0) then
         
	     if (abs(dh_neg).gt.ele(ic,ir)) then

	          rapp = ele(ic,ir)/abs(dh_neg)

	                 do j = 1, k(ic,ir)

                             dh_eros(j) = rapp*dh_eros(j)   
                         	          
	                 enddo
	                 
	     endif  
	     
         endif
         
c point 4.3.5.4   controllo che non si depositi un volume solido superiore a quello transitante

         if (dh_neg.gt.0.0) then

	differenza = h(ic,ir) - h_vol_str 

	     if (dh_neg.gt.differenza) then

	         rapp = 0.95*differenza/dh_neg

               do j = 1, k(ic,ir)

               dh_eros(j) = rapp*dh_eros(j) 

	         enddo
	         
	         dh_inf = rapp*dh_inf

	      endif

	 endif

**************************************************************************    
c point 4.3.5.5 Aggiornamento erosione depositi
**************************************************************************

      dh_eros_tot = 0.0       

        do j = 1,k(ic,ir)
	
         dh_eros_tot = dh_eros_tot + dh_eros(j)
     
	  enddo

c      volume totale eroso o depositato per ogni cella
      endif

**************************************************************************
c point 4.3.5.6	AGGIORNAMENTO PROFONDITA' CELLE CONFINANTI
**************************************************************************

      do j = 1,k(ic,ir)
	
        
          ic1 = ic_s(ic,ir,j)
	    ir1 = ir_s(ic,ir,j)

!$OMP atomic
	dh_entrata_unif(ic1,ir1) = dh_entrata_unif(ic1,ir1) + dh_cost(j)

!$OMP atomic	
	dh_entrata_solido(ic1,ir1) = dh_entrata_solido(ic1,ir1) + 
     1dh_cost(j)*Conc(ic,ir)   ! bifase


      if (InternalOutput(ic,ir).ge.1000.0)    !  11 lug 2017
     1then
       if (InternalOutputValle(ic1,ir1).eq.999.0) then

      dh_uscita_sez(ic,ir) = dh_uscita_sez(ic,ir) + dh_cost(j)

     
      dh_uscita_solido_sez(ic,ir) =dh_uscita_solido_sez(ic,ir) + 
     1dh_cost(j)*Conc(ic,ir)   ! bifase
     
      endif
      endif
     	  enddo	  
     	  
**************************************************************************
c point 4.4	DEFLUSSO PER DIFFERENZE DI ALTEZZA - STRAMAZZO BELANGIER
**************************************************************************

c point 4.4.1      calcolo deflusso per differenze di altezza

      dhh_tot = 0.0
	DHH_max = 0.0

	do j = 1,8
      
	DHH(j) = 0.0

	ic1 = ic_routing(iii)+i_sh_col(j)
	ir1 = ir_routing(iii)+i_sh_row(j)

      if (ele(ic1,ir1).ne.esterno.and.val_sorg(ic1,ir1).ne.100.0) then

      if (ele(ic,ir).le.ele(ic1,ir1)) then

	 if (h_tot(ic,ir).gt.h_tot(ic1,ir1)) then

      DHH(j) = h_tot(ic,ir) - ele(ic1,ir1)
      

	DHH_tot = DHH_tot + DHH(j)

	if (DHH(j).gt.DHH_max) DHH_max = DHH(j)
      
         endif
	  endif
	 endif
	enddo

c      CALCOLO PESI

	do j = 1,8

	peso_e(j) = 0.0
	
	    if (DHH(j).gt.zero) then
	         peso_e(j) = DHH(j)/DHH_tot
 	    endif

	enddo


c      ALGORITMO DI DEFLUSSO

    
      betamin = 1.0
	beta = 1.0


	ddh_tot = 0.0

      
	      do j = 1,8

	ddh(j) = 0.0
      U_stramaz(j) = 0.0  ! 8/10/2019

	if (DHH(j).gt.zero) then


 	 ddh(j) = peso_e(j)*(cq)*DHH(j)*sqrt(2.0*9.81*
	1 DHH(j))*DT/lato_cella

	 ddh_tot = ddh_tot + ddh(j)
  
	endif

	enddo
 
	
c point 4.4.2    CONTROLLO CONTINUITA'e  controllo di compatibilità: ddh(j) deve essere inferiore a dhh(j)


      if (ddh_tot.gt.DHH_tot) then

	beta = DHH_tot/ddh_tot

	     
       do j = 1,8

	    if (DHH(j).gt.zero) then


	               ddh(j) = ddh(j)*beta

		     
	 
	    endif

	                  enddo

	endif
 
     

	do j = 1,8

	    if (DHH(j).gt.zero) then

             if (ddh(j).gt.DHH(j)) beta = DHH(j)/ddh(j)
             
                   if (beta.lt.betamin) betamin = beta

	    endif

      enddo

        ddh_tot = 0.0
	somma_dh = 0.0
      


	 do j = 1,8

	!  inizio correzione 22 ott 2010

	 if (DHH(j).gt.zero) then

	    ddh(j) = betamin*ddh(j)
	    ddh_tot = ddh_tot + ddh(j)
     
	 endif


      enddo
c point 4.4.3    CONTROLLO compatiblità con il flusso a gravità
	if (erod(ic,ir).eq.1.0) then   !  MODIFICA DEL 19/12/2012

	      somma_dh = h_vol_str + ddh_tot + dh_eros_tot
       
                                       
        else

	      somma_dh = h_vol_str + ddh_tot
            
         
            !diff_dh = h(ic,ir) - h_vol_str
        endif
   
        
      
      if (somma_dh.gt.h(ic,ir)) then

          !  MODIFICA DEL 19/12/2012
          diff_dh = h(ic,ir) - h_vol_str - dh_eros_tot
          
	    coeff_dh = 0.95*diff_dh/ddh_tot
  
	      ddh_tot = 0.0

	
	    do j = 1,8

	       if (DHH(j).gt.zero) then

	          ddh(j) = coeff_dh*ddh(j)
	          ddh_tot = ddh_tot + ddh(j)

	       endif

	    enddo

      endif
      
*******************************************************************************
c point 4.4.4  AGGIORNAMENTO PROFONDITA' CELLE CONFINANTI e velocità massima
*******************************************************************************
       U_stramaz_max = 0.0

	 do j = 1,8

	                ic1 = ic_routing(iii)+i_sh_col(j)
	                ir1 = ir_routing(iii)+i_sh_row(j)

	U_stramaz(j) = 0.0
	


	 if (DHH(j).gt.zero) then

	

	 !            dh(ic1,ir1) = dh(ic1,ir1) + ddh(j)


!$OMP atomic
      dh_entrata_Bel(ic1,ir1) = dh_entrata_Bel(ic1,ir1) + ddh(j)

!$OMP atomic
      dh_entrata_solido(ic1,ir1) = dh_entrata_solido(ic1,ir1) + 
     1ddh(j)*Conc(ic,ir)    ! bifase 
     


        if (InternalOutput(ic,ir).ge.1000.0)    !  11 lug 2017
     1then
       if (InternalOutputValle(ic1,ir1).eq.999.0) then

      dh_uscita_sez(ic,ir) = 
     1dh_uscita_sez(ic,ir) + ddh(j)

      dh_uscita_solido_sez(ic,ir) = dh_uscita_solido_sez(ic,ir) + 
     1ddh(j)*Conc(ic,ir)   ! bifase
     
      endif
      endif
      !  aggiunto 8/10/2019
      U_stramaz(j) = ddh(j)*lato_cella/(DHH(j)*DT)

    !  29/4/2019

      Vel8(ic,ir,j) = U_stramaz(j)

      Deltah8(ic,ir,j) = ddh(j)
     
      !  29/4/2019
	
	j_vel(ic, ir,j) = 1   ! 20 maggio 2015

	if (U_stramaz(j).gt.velocit(ic,ir)) then
		velocit(ic,ir) = U_stramaz(j)
	    direz_vel(ic,ir) = float(j)     ! modificato il 20/11/2012
	endif
	
	 if (U_stramaz(j).gt.U_stramaz_max)  then  ! 	      
          j_vel_stramaz_max = j   ! aggiunto il 30/01/2013
          U_stramaz_max = U_stramaz(j)  ! aggiunto il 29/4/2015              
 	 endif 
            
	        endif

           enddo 

 
*******************************************************
c point 4.4.5    CALCOLO EROSIONE E DEPOSITO
*******************************************************

 
      if (erod(ic,ir).eq.1.0) then
      
              
        !  NUOVO  24/02/2014
        
        ! NEL CASO DI DEPOSITO A MOTO UNIFORME OCCORRE VEDERE SE CON QUELLO CHE SI DEPOSITA E VA VIA A MOTO UNIFORME
        ! RESTA ABBASTANZA SOLIDO PER FAR DEPOSITARE LA PARTE RELATIVA AL DEFLUSSO A STRAMAZZO 
        
        deposito_limitato = 0.0
              !dh_eros_tot = 0.0
		  
         if (dh_neg.gt.0.0) then

       differenza_solido = h_solido(ic,ir) -
     1(h_vol_str+ddh_tot)*Conc(ic,ir)
     
      differenza_liquido = differenza_solido*(1.0 - Conc(ic
     1,ir))/Conc(ic,ir)
           
       deposito_liquido = dh_eros_tot*(1.0 - C_fondo(ic,ir)) 
     
      deposito_solido = dh_eros_tot*C_fondo(ic,ir)
    

       if (deposito_solido.gt.differenza_solido) then
       
       deposito_solido = 0.95*differenza_solido
       deposito_liquido = 0.95*differenza_solido*(1.0 - C_fondo
     1(ic,ir))/C_fondo(ic,ir)
     
       deposito_limitato = 1.0
       
           
        if (deposito_liquido.gt.differenza_liquido) then
        
        deposito_liquido = 0.95*differenza_liquido
        deposito_solido = deposito_liquido*C_fondo(ic,
     1ir)/(1.0 - C_fondo(ic,ir))
                 
        endif
        
        dh_eros_tot = deposito_solido + deposito_liquido
        
       else
       
         if (deposito_liquido.gt.differenza_liquido) then
         
         deposito_liquido = 0.95*differenza_liquido
        deposito_solido = deposito_liquido*C_fondo(ic_routing(iii),
     1ir_routing(iii))/(1.0 - C_fondo(ic_routing(iii),ir_routing(iii)))
     
        dh_eros_tot = deposito_solido + deposito_liquido
        
          deposito_limitato = 1.0
          
         else
           
       endif
       endif
       
       ELSE   
            
        
           endif   	  


         Eros_tot_previous = Eros_tot(ic,ir)  ! 13/7/2015
         Solid_tot_previous = Solid_tot(ic,ir)


	  if (dh_eros_tot.ne.0.0) then

	dh_sed(ic,ir) = (-1.0)*dh_eros_tot
	
c variazione della quota altimetrica della cella identificazione celle con variazioni di altezza
      
          cell_eros(ic,ir) = 1
          
c      volume totale eroso o depositato per ogni cella

	Eros_tot(ic,ir) = Eros_tot(ic,ir) + dh_eros_tot
	
	Solid_tot(ic,ir) = Solid_tot(ic,ir) + 
     1dh_eros_tot*C_fondo(ic,ir)   !  AGGIUNTA 2 APRILE 2013
		
         endif
      
      dh_neg = 0.0
	
!	if (j_vel_stramaz_max.gt.0) sin_max = senteta(ic,ir,j_vel_max)   !????????  j_vel_stramaz_max non 
	  
	do j = 1,8
	 dh_eros(j) = 0.0
        if (DHH(j).gt.0.0) then

	D_ele = ele(ic,ir) - ele(ic1,ir1)
       
	call kern_erosion (h_tot(ic,ir),h_tot(ic1,
     1ir1),j,senteta_superf,lato_cella,D_ele)

	ang_tot(j) = asind(senteta_superf)
     	       
	eros = 0.0
   
c point 4.4.5.1 ERosione belangier

       if(j.eq.j_vel_stramaz_max) then   ! 19/04/2013

        if (h(ic,ir).gt.h_erosione) then
      
         IF (Conc(ic,ir).le.0.9*C_fondo(ic,ir)) then

	    if (U_stramaz(j).ge.U_crit1(ic,ir).and.ang_tot(j).gt.
     1  asind(senteta_crit(ic,ir)))  then

       if (h_post(ic,ir).gt.h_pre(ic,ir)) then   ! 3 Maggio 2013

	call erosione_Belangier(DT,j,iii,ang_tot(j)
     1 ,dh_eros(j),U_stramaz(j))
	dh_neg = dh_neg + dh_eros(j)	
	 endif
		
	 endif
	 
      ENDIF

      endif
      
      endif   ! 19/04/2013

c  point 4.4.5.2    deposito

      IF (h_vol_str.eq.0.0.and.j.eq.j_vel_stramaz_max) then    ! 30/01/2013 e 5/02/2013    !????????  A COSA SERVE?
      
       IF (Conc(ic,ir).ge.C_limite_deposito) then
        
        IF (ang_tot(j).le.sin_Limit_Angle) THEN     !????????  A COSA SERVE?
         
         call deposito_Belangier_inferiore (DT,j,iii,ang_tot(j)
     1   ,dh_eros(j),U_stramaz(j))
         
         dh_infBel = dh_infBel + dh_eros(j)
        dh_neg=dh_neg+dh_eros(j)	
        ELSE

      if (U_stramaz(j).le.U_crit2(ic,ir).and.
     1ang_tot(j).lt.asind(senteta_crit2(ic,ir)))  then    ! modifica 13/9/2017
      
	call deposito_Belangier(DT,j,iii,ang_tot(j)
     1 ,dh_eros(j),U_stramaz(j))
      dh_neg=dh_neg+dh_eros(j)	
	 endif
	 
	  ENDIF
	  
	  ENDIF
	 
	 ENDIF

	endif
	enddo
	
*******************************************************
c point 4.4.5.3    CONTROLLO CONTINUITA' EROSIONE E DEPOSITO
*******************************************************
	rapp = 0.0

c       controllo che non vi sia un erosione superiore al volume erodibile      
     
         if (dh_neg.lt.0.0) then   ! da aggiustare tenendo conto del probabile volume eroso per deflusso a moto uniforme 
     
	     if (abs(dh_neg).gt.ele(ic,ir)) then

	          rapp = ele(ic,ir)/abs(dh_neg)

	                 do j = 1, 8

                             dh_eros(j) = rapp*dh_eros(j)
	          
	                 enddo
      	

	     endif

	

	   endif


c      controllo che non si depositi un volume superiore a quello transitante

          dh_eros_Belangier = 0.0	

           do j = 1, 8

                     dh_eros_Belangier = dh_eros_Belangier + dh_eros(j)
                     	          
           enddo
   
           if (dh_neg.gt.0.0.AND.DEPOSITO_LIMITATO.EQ.0.0) then   ! MODIFICATO IL 24/2/2014

	   differenza_solido = (h_solido(ic,ir) -
     1(h_vol_str+ddh_tot)*Conc(ic,ir))
     
      differenza_liquido = differenza_solido*(1.0 - Conc(ic
     1,ir))/Conc(ic,ir)
        
      deposito_liquido = (dh_eros_tot + dh_eros_Belangier)*(1.0 - 
     1C_fondo(ic,ir)) 
     
      deposito_solido = (dh_eros_tot + dh_eros_Belangier)*
     1C_fondo(ic,ir)
     
       if (deposito_solido.gt.differenza_solido) then
       
       deposito_solido = 0.95*differenza_solido
       deposito_liquido = 0.95*differenza_solido*(1.0 - C_fondo
     1(ic,ir))/C_fondo(ic,ir)
     
        if (deposito_liquido.gt.differenza_liquido) then
        
        deposito_liquido = 0.95*differenza_liquido
        deposito_solido = deposito_liquido*C_fondo(ic,
     1ir)/(1.0 - C_fondo(ic,ir))
                 
        endif
        
        dh_eros_Belangier = deposito_solido + deposito_liquido - 
     1dh_eros_tot
       else 
         if (deposito_liquido.gt.differenza_liquido) then
         
         deposito_liquido = 0.95*differenza_liquido
        deposito_solido = deposito_liquido*C_fondo(ic,
     1ir)/(1.0 - C_fondo(ic,ir))
     
        dh_eros_Belangier = deposito_solido + deposito_liquido - 
     1dh_eros_tot
        
         else
         
           dh_eros_Belangier = 0.0
                 
         do j = 1,8
	
          dh_eros_Belangier = dh_eros_Belangier + dh_eros(j)

	  enddo
    
       endif
       endif
       
       ELSE   
       
       dh_eros_Belangier = 0.0
          
                
       do j = 1,8
	
         dh_eros_Belangier = dh_eros_Belangier + dh_eros(j)
     
	  enddo
           endif   

***********************************************************************
c point 4.4.5.4      SECONDO AGGIORNAMENTO EROSIONE E DEPOSITO 
***********************************************************************
	
	    if (dh_eros_Belangier.ne.0.0) then

c      identificazione celle con variazioni di altezza

      if (dh_sed(ic,ir).eq.0.0) then
          

          cell_eros(ic,ir) = 1
          
          
      endif
      
	dh_sed(ic,ir) = dh_sed(ic,ir) - dh_eros_Belangier 

      
c      variazione della quota altimetrica della cella

	Eros_tot(ic,ir) = Eros_tot(ic,ir) + dh_eros_Belangier 
	
		
	Solid_tot(ic,ir) = Solid_tot(ic,ir) + dh_eros_Belangier*
	1C_fondo(ic,ir)

	   endif

        endif
********************************************************************************
c point 4.5         INTRODUZIONE CONDIZIONE DI INERODIBILITA' (30/4/2015)
********************************************************************************

          IF (no_erod(ic,ir).eq.1.0) THEN
 
      spessore_erodibile = h_noerod(ic,ir) -
     1 ele_iniz(ic,ir)    ! aggiunto il 28/1/2016
    
                    
                   !  CAMBIAMENTO 28/9/2016
                                      
      quota_finale = ele_iniz(ic,ir) + Eros_tot(ic,ir)
           
       if (quota_finale.lt.h_noerod(ic,ir)) then
                                             
      dh_sed(ic,ir) = 0.95*(ele(ic,ir)-h_noerod(ic,ir)) 
 
      if (Eros_tot(ic,ir).lt.spessore_erodibile) then   ! cambiato il 28/1/2016

      dh_sed(ic,ir) = 0.95*(Eros_tot_previous - spessore_erodibile)   ! cambiato il 28/1/2016
     
                  
       endif
       
        Eros_tot(ic,ir) = Eros_tot_previous - dh_sed(ic,ir)
      
                			
	  Solid_tot(ic,ir) = Solid_tot_previous -dh_sed(ic,ir)*C_fondo(ic,ir)
		
	
	!  CAMBIAMENTO 28/9/2016
                                      
      quota_finale = ele_iniz(ic,ir) + Eros_tot(ic,ir)
                      
          else
                         
        if (Eros_tot(ic,ir).lt.spessore_erodibile) then     ! cambiato il 28/1/2016
        
           dh_sed(ic,ir) =0.95*(Eros_tot_previous - spessore_erodibile)   ! cambiato il 28/1/2016
            
        Eros_tot(ic,ir) = Eros_tot_previous - dh_sed(ic,ir)
     	
		
	  Solid_tot(ic,ir) = Solid_tot_previous -
	1  dh_sed(ic,ir)*C_fondo(ic,ir)
	
	     
       endif
            
        endif
         
       
       ENDIF  ! fine condizione di inerodibilità
        
                     

*******************************************************************************
c point 4.6   AGGIORNAMENTO PROFONDITA' CELLA
*******************************************************************************

	dh(ic,ir) = - ddh_tot - h_vol_str  ! aggiornamento simultaneità
	
	dh_solido(ic,ir) = - (h_vol_str + ddh_tot)*Conc(ic,ir)   ! bifase   
   
*****************************************************************
c point 4.7   AGGIUNTA DEPOSITO DEFLUSSO INTRAPPOLATO 6/02/2013
*****************************************************************

       IF (h_vol_str.eq.0.0.and.ddh_tot.eq.0.0) THEN
      
          if (erod(ic,ir).eq.1.0) then
          
      IF (Conc(ic,ir).ge.C_limite_deposito)then
  
      if (conc(ic,ir).le.C_fondo(ic,ir)) then
     
      dh_sed(ic,ir) = (-0.95)*h_solido(ic,ir)/C_fondo(ic,ir)  ! bifase
     
        else

      dh_sed(ic,ir) = (-1.0)*h(ic,ir)*(1- conc(ic,ir))/
     1 (1.0 - C_fondo(ic,ir))  ! bifase

        endif
       
******************************************************************************************

          cell_eros(ic,ir) = 1
          
               
      Eros_tot(ic,ir) = Eros_tot(ic,ir) - dh_sed(ic,ir)
	
	Solid_tot(ic,ir) = Solid_tot(ic,ir) - 
	1C_fondo(ic,ir)*dh_sed(ic,ir)
      
      volume_solido_intrappolato_STEP =  volume_solido_intrappolato_STEP
     1 - dh_sed(ic,ir)*lato_cella*lato_cella*C_fondo(ic,ir) 
     
      !!  V_dep_step_C = V_dep_step_C - 
      !!1dh_sed(ic_routing(iii),ir_routing(iii))
  
*****************************************************************************************

     
      endif
           
      
         endif
            
            
      ENDIF

      endif  ! fine condizione h(ic,ir)>0


      enddo  ! fine ciclo celle allagate allo stesso time step
!$OMP end do nowait
      
      

      !      enddo  ! fine ciclo celle striscia   ! MODIFICA DEL 10/12/2012

c point 5.3 parametri da azzerare 
!$OMP do
!$OMP& private   (V_inp,VS_inp, V2, VS2, V1, VS1,j,iijj)
!$OMP& reduction (+: V_solid_input_DT, V_entrato_DT)
!$OMP& reduction (+: VOLSOL_ENTRATO_IDRO, Vaffluito_1,V_entrato)
!$OMP& reduction (+: V_solid_input,VOLUME_ENTRATO_IDRO)
!$OMP& schedule  (monotonic: dynamic)
      DO iijj = 1, Num_sorgenti     ! 26/11/2012
         
         V_inp = 0.0
         VS_inp = 0.0
         V_input(iijj) = 0.0
         VS_input(iijj) = 0.0
         if (attivata(iijj).eq.1.0) then
           if (t_fin(iijj).gt.t) then
               
              call Hydrograph_volume(t_dopo,iijj,V2,VS2)
              
                
              call Hydrograph_volume(t,iijj,V1,VS1)
             
            
              
            V_input(iijj)     = V2 - V1
            VS_input(iijj)    = VS2 - VS1
                          
           V_entrato_DT = V_entrato_DT + 
     1     V_input(iijj) *float(Nsorg1(iijj))                 
            
           V_solid_input_DT = V_solid_input_DT + 
     1     VS_input(iijj)*float(Nsorg1(iijj))
              
           V_entrato = V_entrato + 
     1     V_input(iijj) *float(Nsorg1(iijj)) 
           
           V_solid_input = V_solid_input + 
     1     VS_input(iijj)*float(Nsorg1(iijj))
      
          VOLUME_ENTRATO_IDRO = VOLUME_ENTRATO_IDRO + 
     1     V2*float(Nsorg1(iijj))
     
          VOLSOL_ENTRATO_IDRO = VOLSOL_ENTRATO_IDRO + 
     1    VS2*float(Nsorg1(iijj))
          
           else

           do j = 1, N_step_input(iijj)-1
             
          V_inp = V_inp + 0.5*(Q_input(iijj,j) + Q_input(iijj,j+1))*
     1    (t_1d(iijj,j+1) - t_1d(iijj,j)) 
     
    
          VS_inp = VS_inp + 0.5*(Q_input(iijj,j)*Conc_input(iijj,j) + 
     1    Q_input(iijj,j+1)*Conc_input(iijj,j+1))*
     1    (t_1d(iijj,j+1) - t_1d(iijj,j)) 
         
          enddo
          VOLUME_ENTRATO_IDRO = VOLUME_ENTRATO_IDRO + 
     1    V_inp*float(Nsorg1(iijj)) 
     
          VOLSOL_ENTRATO_IDRO = VOLSOL_ENTRATO_IDRO + 
     1    VS_inp*float(Nsorg1(iijj))           
      
                   
          end if  
                
	      Vaffluito_1 = Vaffluito_1 + V_input(iijj)*float(Nsorg1(iijj))
      
         endif
      enddo   
!$OMP end do nowait

               
 
      		
c Point 1.2  acquisizione celle sorgenti passo temporale successivo
!$OMP single private(j,V_inp,VS_inp,jj)
!$OMP& private(i,ij,sen_tetatot,icj,irj,sen_tetaj)
         
      if (int(sum_attivata).lt.Num_sorgenti) then

       do j = 1, Num_sorgenti
        
            V_inp = 0.0
            VS_inp = 0.0
              
           if (attivata(j).eq.0.0) then
 
              if (t_1d(j,1).ge.t.and.t_1d(j,1).lt.t) then
              
                attivata(j) = 1.0
                attivata_new(j) = 1.0

                  sum_attivata = sum_attivata + attivata(j)
 
                call Hydrograph_volume(t_dopo,j,V_inp,VS_inp)
                 
      V_input(j) = V_inp
      VS_input(j) = VS_inp
      
      V_entrato_DT_1 = V_entrato_DT_1 + V_input(j)*float(Nsorg1(j)) 
      
      V_solid_input_DT_1 = V_solid_input_DT_1 + 
     1VS_input(j)*float(Nsorg1(j))
      
             
       VOLUME_ENTRATO_IDRO_1 = VOLUME_ENTRATO_IDRO_1 + 
     1V_inp*float(Nsorg1(j))  
     
       VOLSOL_ENTRATO_IDRO_1 = VOLSOL_ENTRATO_IDRO_1 + 
     1VS_inp*float(Nsorg1(j)) 

           
	 Vaffluito_2 = Vaffluito_2 + V_input(j)*float(Nsorg1(j))
                                 
                  
           endif 
         endif   
        enddo   


c Point 2.1  Ciclo sorgenti attive per calcolare pendenze per celle sorgenti attivate tempo t
! $OMP do

      do jj = 1, Num_sorgenti

       if (attivata_new(jj).eq.1.0) then   
!$OMP parallel do num_threads(1)
!$omp& private(ij,sen_tetatot,icj,irj,j,sen_tetaj)

        do ij = 1, Nsorg1(jj)
          sen_tetatot = 0.0
c       correzione per tener conto che se la cella era già inondata il suo k e' diverso
c       da zero     
            
            k(ic_sorg1(ij,jj),ir_sorg1(ij,jj)) = 0
            
             do j = 1,8
                  icj = ic_sorg1(ij,jj) + i_sh_col(j)
                  irj = ir_sorg1(ij,jj) + i_sh_row(j)
	   
	
	if (ele(icj,irj).ne.esterno) then
	  if (val_sorg(icj,irj).ne.100) then
         call kern (ele(ic_sorg1(ij,jj),ir_sorg1(ij,jj)),
     1              ele(icj,irj),j,sen_tetaj,lato_cella)
         sen_teta(ic_sorg1(ij,jj),ir_sorg1(ij,jj),j)= sen_tetaj
	
        endif
      endif
 
      if  (sen_teta(ic_sorg1(ij,jj),ir_sorg1(ij,jj),j).gt.0.0) then
	  if (val(icj,irj).ge.0.0.and.val(icj,irj).le.float(ii)) then

	   k(ic_sorg1(ij,jj),ir_sorg1(ij,jj)) = 
	1    k(ic_sorg1(ij,jj),ir_sorg1(ij,jj))+ 1
    
      senteta(ic_sorg1(ij,jj),ir_sorg1(ij,jj),k(ic_sorg1(ij,jj),ir_sorg1
	1(ij,jj))) = sen_teta(ic_sorg1(ij,jj),ir_sorg1(ij,jj),j)

	ic_d(ic_sorg1(ij,jj),ir_sorg1(ij,jj),k(ic_sorg1(ij,jj),
	1ir_sorg1(ij,jj))) = icj
	ir_d(ic_sorg1(ij,jj),ir_sorg1(ij,jj),k(ic_sorg1(ij,jj),
	1ir_sorg1(ij,jj))) = irj

      sen_tetatot = sen_tetatot
	1 + sen_teta(ic_sorg1(ij,jj),ir_sorg1(ij,jj),j)

	   endif
	 endif
      enddo

	sen_max(ic_sorg1(ij,jj),ir_sorg1(ij,jj)) = 0.0

c      determinazione del peso e della pendenza e peso massimi   

	do j = 1,k(ic_sorg1(ij,jj),ir_sorg1(ij,jj))

	peso_d(ic_sorg1(ij,jj),ir_sorg1(ij,jj),j) = senteta(ic_sorg1(ij,jj),
	1ir_sorg1(ij,jj),j)/sen_tetatot

	if (senteta(ic_sorg1(ij,jj),ir_sorg1(ij,jj),j).gt.sen_max
	1(ic_sorg1(ij,jj),ir_sorg1(ij,jj))) then
	 sen_max(ic_sorg1(ij,jj),ir_sorg1(ij,jj)) = senteta
     1 (ic_sorg1(ij,jj),ir_sorg1(ij,jj),j)
	 peso_max(ic_sorg1(ij,jj),ir_sorg1(ij,jj)) = peso_d(ic_sorg1(ij,jj),
	1 ir_sorg1(ij,jj),j)
	 endif
	   enddo 
        enddo
!$OMP end parallel do
       endif  ! fine ciclo attivata_new

      enddo


c Point 2.2  Identificazione celle routing su nuove sorgenti 


        
	  do jj = 1, Num_sorgenti
	  
	     if (attivata_new(jj).eq.1.0) then
	  
              attivata_new(jj) = 0.0
              
	do i = 1, Nsorg1(jj)

      if (k(ic_sorg1(i,jj),ir_sorg1(i,jj)).gt.0) then

       do j = 1, k(ic_sorg1(i,jj),ir_sorg1(i,jj))

        if (val(ic_d(ic_sorg1(i,jj),ir_sorg1(i,jj),j),
	1ir_d(ic_sorg1(i,jj),ir_sorg1(i,jj),j)).eq.0.0) then

         Num_celle_routing = Num_celle_routing + 1

	   ic_routing(Num_celle_routing) = 
	1    ic_d(ic_sorg1(i,jj),ir_sorg1(i,jj),j)
	   ir_routing(Num_celle_routing) = 
	1    ir_d(ic_sorg1(i,jj),ir_sorg1(i,jj),j)

	val(ic_routing(Num_celle_routing),ir_routing(Num_celle_routing)) 
	1= float(ii+1)
	
	     endif
	    enddo
	   endif
	  end do
	 endif
        enddo
      
  

      endif

!$OMP end single nowait  
      
!$OMP Single
          cel_max = 0.0
          cel_max_sor = 0.0
          h_solid = 0.0
          h_solido_pre = 0.0   
	    h_totale = 0.0
	    h_totale2 = 0.0
	    total_eros = 0.0
	    V_total = 0.0
	    V_eros = 0.0
	    V_netto = 0.0
	    total_solid = 0.0
	    V_solid = 0.0
      	Area_inondata = 0.0
	    Area_erosa = 0.0
	    Area_alluvionata = 0.0
 !$OMP END single nowait
 !$OMP Single private (ic1,ir1,ij,iii,j)    
c point 5.1 Aggiornamento numero celle routing bagnate dalla celle sorgenti 

      do ij = 1, Num_sorgenti   ! MODIFICATA IL 3/12/2012
       if (attivata(ij).eq.1.0) then
        do iii = 1, Nsorg1(ij)
         do j = 1, otto
         
          ic1 = ic_sorg1(iii,ij)+i_sh_col(j)
	    ir1 = ir_sorg1(iii,ij)+i_sh_row(j)
          
       if (ele(ic1,ir1).ne.esterno.and.val_sorg(ic1,ir1).ne.100.0) then

      if (ele(ic_sorg1(iii,ij),ir_sorg1(iii,ij)).le.ele(ic1,ir1)) then

	 if (h_tot(ic_sorg1(iii,ij),ir_sorg1(iii,ij)).gt.h_tot
	1(ic1,ir1)) then
           
	 if (val(ic1,ir1).eq.zero) then  ! MODIFICA DEL 16/8/2105
 	    val(ic1,ir1) = float(ii+1)
 	
 	    if (InletOutlet(ic1,ir1).ne.9000.0) then     ! MODIFICA DEL 16/8/2105

              Num_celle_routing = Num_celle_routing + 1
	        ic_routing(Num_celle_routing) = ic1
              ir_routing(Num_celle_routing) = ir1
          endif     ! MODIFICA DEL 16/8/2105
              endif
	       endif
	      endif
	     endif
	    enddo
         end do
        end if
      end do

c point 5.1 Aggiornamento numero celle routing bagnate dalle celle strisce
      do iii = 1, Num_celle_routing_old
       if (h(ic_routing(iii),ir_routing(iii)).gt.zero.and.
	1  h(ic_routing(iii),ir_routing(iii)).ge.h_routing) then 
	  do j = 1,8 

	   ic1 = ic_routing(iii)+i_sh_col(j)
	   ir1 = ir_routing(iii)+i_sh_row(j)

         if (ele(ic1,ir1).ne.esterno.and.val_sorg(ic1,ir1).ne.100.0)then
          if (ele(ic_routing(iii),ir_routing(iii)).le.ele(ic1,ir1)) then
	     if (h_tot(ic_routing(iii),ir_routing(iii)).gt.h_tot(ic1,ir1)) then
	      if (val(ic1,ir1).eq.zero) then
             Num_celle_routing = Num_celle_routing + 1
	       ic_routing(Num_celle_routing) = ic1   
             ir_routing(Num_celle_routing) = ir1
	       val(ic1,ir1) = float(ii+1)
	      endif
	     endif
          endif
         endif 
        enddo
       endif
      enddo
      tt4 = omp_get_wtime()
!$OMP END single nowait
!$OMP single 
      tt5 = omp_get_wtime()
!$OMP end single nowait

c point 7 ciclo sulle celle di contorno portata fuori uscita
!$OMP do
!$OMP& private(i,icol,irow,icj,irj,j,sen_tetaj,h_finn)
!$OMP& reduction(+: Q_CONTORNO_TOTALE,V_fuori_uscito_DT)
!$OMP& reduction(+: V_solido_fuoriuscito_DT)
!$OMP& schedule(monotonic: dynamic)

	do i = 1, N_celle_contorno

	  Q_contorno(i) = 0.0
	  dh_contorno(i) = 0.0
	  dh_solido_contorno(i) = 0.0
	  icol = ic_bc(i)
	  irow = ir_bc(i)
  
        if (h(icol,irow).gt.0.0) then

        do j = 1,8
            
           icj = icol + i_sh_col(j)
           irj = irow + i_sh_row(j)
         
         if (ele(icj,irj).ne.esterno) then

          if (val_sorg(icj,irj).ne.100.0) then

               
         call kern (ele(icj,irj),ele(icol,irow),j,sen_tetaj,lato_cella)  ! modifica 6/11/2014 

		
	         if (sen_tetaj.gt.0.0) then    ! modifica 6/11/2014 
				 
				 
      Q_contorno(i) = Q_contorno(i) + lato_cella*Ch(icol,irow)*
	1h(icol,irow)*(9.81*sen_tetaj*h(icol,irow))**(0.5)	   ! modifica del 14/1/2015
	
	 endif
	 
	 
	   if (sen_tetaj.lt.0.0) then    ! modifica 10/11/2014 
	 
	 
	 !else
	 
      Q_contorno(i) = Q_contorno(i) + lato_cella*0.385*((h(icol,irow))**
	1(1.5))*((2*9.81)**(0.5))
	

				 
				  endif

	         endif

	endif
         

	 enddo


      dh_contorno(i) = Q_contorno(i)*DT/(lato_cella*lato_cella)
      dh_solido_contorno(i) = dh_contorno(i)*Conc(icol,irow)

	h_finn = h(icol,irow) + dh(icol,irow) + dh_sed(icol,irow) 

***************************************************************************
*    Controllo continuità ed aggiornamento profondità celle contorno
***************************************************************************


	       if (dh_contorno(i).gt.h_finn) then
	
	Q_contorno(i) = 0.95*h_finn*lato_cella*lato_cella/DT

	dh_contorno(i) = Q_contorno(i)*DT/(lato_cella*lato_cella)
	dh_solido_contorno(i) = dh_contorno(i)*Conc(icol,irow)

	endif
 
      h(icol,irow) = h(icol,irow) - dh_contorno(i)
      h_solido(icol,irow) = h_solido(icol,irow) - dh_solido_contorno(i)  ! bifase

	V_contorno(icol,irow) = V_contorno(icol,irow) + Q_contorno(i)*DT

      V_fuori_uscito_DT = V_fuori_uscito_DT + Q_contorno(i)*DT
      V_solido_fuoriuscito_DT = V_solido_fuoriuscito_DT + 
     1Conc(icol,irow)*Q_contorno(i)*DT    ! bifase

	Q_CONTORNO_TOTALE = Q_CONTORNO_TOTALE + Q_contorno(i)   ! Novembre 2012
	
	 if (h(icol,irow).gt.0.0) then    ! bifase
      Conc(icol,irow) = h_solido(icol,irow)/h(icol,irow)
      endif


	endif

      enddo  ! fine ciclo celle contorno DICEMBRE 2010
!$OMP end do nowait

	

         
***********************************************************************  
*        CALCOLO VOLUMI FUORI_USCITI ED EROSI/DEPOSITATI
***********************************************************************

!  calcolo volumi fuoriusciti fino a quest'istante
       

C point 9.0 CAlcolo volumi di erosion e deposito totali e aggiornamento delle ell

!$OMP do private(ic,ir)    
!$OMP& reduction(+: Volume_solido_depositato, V_depositato, V_eroso)
!$OMP& reduction(+: Volume_solido_eroso)   
!$OMP& schedule(monotonic: dynamic)
             
	do ic = 1, no_columns
	  do ir = 1, no_rows

          if (ele(ic,ir).ne.esterno) then

		if (val_sorg(ic,ir).ne.100) then 

	   if (Eros_tot(ic,ir).gt.0.0)  then
	   
	   V_depositato = V_depositato + 
     1Eros_tot(ic,ir)*lato_cella*lato_cella
     
         Volume_solido_depositato = Volume_solido_depositato +
     1Eros_tot(ic,ir)*lato_cella*lato_cella*C_fondo(ic,ir)
           
        endif

	   if (Eros_tot(ic,ir).lt.0.0) then
	   
	   V_eroso = V_eroso + 
	1Eros_tot(ic,ir)*lato_cella*lato_cella
	
	Volume_solido_eroso = Volume_solido_eroso +
     1Eros_tot(ic,ir)*lato_cella*lato_cella*C_fondo(ic,ir)
     
         endif
                	
       	ele(ic,ir) = ele_iniz(ic,ir) + Eros_tot(ic,ir)  ! 29/9/2016
       	         	
       	!  CONTROLLO EROSIONE
       	if (no_erod(ic,ir).eq.1.0) then       	      	
       	
       	if (ele(ic,ir).lt.h_noerod(ic,ir)) then

         if(boolFileERR) then
        
        write(19,'("WARNING EROSION ON ARMOURED CELL ic  ir = ",2x,2I9)'
        
     1) ic, ir
        write(19,'("time steps number and simulation time (sec)",
     11x,I25,2x,f25.4)') ii, t_dopo
        write(19,'("initial and no erodible elevations (m)",2x,2f25.4)')
     1   ele_iniz(ic,ir), h_noerod(ic,ir)
       write(19,'("elevation variation and finale elevation (m)",
     12x,2f20.10)') dh_sed(ic,ir), ele(ic,ir)
        end if
       
       write(10,'("WARNING EROSION ON ARMOURED CELL ic  ir = ",2x,2I9)')
     1 ic, ir
       write(10,*)
       	
             	       	
       	endif
       	
       	if (Eros_tot(ic,ir).lt.0.0) then
       	if(boolFileERR) then

       write(19,'("WARNING EROSION DEPTH ON ARMOURED CELL ic  ir = ",2x,
     12I9)')
     1 ic, ir
      	write(19,'("time steps number and simulation time (sec)",
     11x,I25,2x,f25.4)') ii, t_dopo
        write(19,'("initial and no erodible elevations (m)",2x,2f25.4)')
     1   ele_iniz(ic,ir), h_noerod(ic,ir)
       write(19,'("elevation variation, erosion depth and final 
     1elevation (m)",2x,3f25.15)') dh_sed(ic,ir), eros_tot(ic,ir), 
     1ele(ic,ir)
          end if
          
       write(10,'("WARNING EROSION ON ARMOURED CELL ic  ir = ",2x,2I9)')
     1 ic, ir
       write(10,*)	
       
       	endif     	
       	
       	
       	endif
       	endif
       	
       	endif

	  enddo
      enddo
!$OMP end do nowait
     
      tt6 = omp_get_wtime()

	   
c point 11.0 ciclo ricalibrazione pendenze di flusso per variazione altezza
c      causa deposito/erosione

!$OMP single private(i, ij)
        tt7 = omp_get_wtime()  
       do i = 1, no_rows
        do ij = 1, no_columns
         if (cell_eros(ij,i).eq.1)then
	   call ricalibratura(ij,i,ii)
         cell_eros(ij,i) = 0
         end if
        enddo
      enddo
      
      
!$OMP end single nowait
!!$OMP single 
!       Write (1499,'(i8,18f14.6)')ii,tt1,tt1_1,tt1_2,tt1_3,tt1_4,
!     1  tt1_5,tt1_6,tt1_7,tt1_8,tt1_9,tt1_10,tt1_11,tt1_12,tt1_13,tt1_14
!     1 tt2
!      tt9 = omp_get_wtime()
!!$OMP end single nowait
      
c Point 6.0 Caccolo della velocità massima   
      
!$OMP do
!$OMP& private(i_rout,j,QM_TOT,QM_U_TOT,QM_U,ir,ic,QM_E_TOT)
!$OMP& private(QM_E, ir1,ic1)         
!$OMP& schedule(monotonic: dynamic)         
      do i_rout = 1, Num_celle_routing_old
        
       !  AGGIUNTA 30/1/2015
       
      if (h(ic_routing(i_rout),ir_routing(i_rout)).gt.0.0) then
      ir = ir_routing(i_rout)
      ic = ic_routing(i_rout)
      
      if (velocit(ic,ir).gt.vel_max(ic,ir)) then
     
      vel_max(ic,ir) = velocit(ic,ir)
     
      direz_max(ic,ir) = direz_vel(ic,ir)
     
      endif

c point 6.1 Quantità di moto uscente

        QM_TOT = 0.0

        QM_U_TOT = 0.0
     
     
       DO j = 1,8

       QM_U(j) = 0.0
       
       QM_U(j) = Vel8(ic,ir,j)*Deltah8(ic,ir,j)*(conc(ic,ir)*2650.0 + 
     1 (1.0 - conc(ic,ir))*1000.0)

   
       QM_U_TOT = QM_U_TOT + QM_U(j)
             

       ENDDO

c point 6.2 CALCOLO QUANTITA DI MOTO ENTRANTE

        QM_E_TOT = 0.0
     
       DO j = 1,8

       QM_E(j) = 0.0
       
       ic1 = ic + i_sh_col(j)
	 ir1 = ir + i_sh_row(j)
      if (ele(ic1,ir1).ne.esterno)then
            
       QM_E(j) = Vel8(ic1,ir1,i_jj(j))*Deltah8(ic1,ir1,i_jj(j))*
     1(conc(ic1,ir1)*2650.0 + (1.0 - conc(ic1,ir1))*1000.0)
      end if
       QM_E_TOT = QM_E_TOT + QM_E(j)
             

       ENDDO


       QM_TOT = QM_E_TOT + QM_U_TOT 

              
c point 6.3 CALCOLO COMPONENTI DI VELOCITA MEDIATE SULLA QUANTITA DI MOTO

     
       DO j = 1,8

       ic1 = ic + i_sh_col(j)
	 ir1 = ir + i_sh_row(j)

      if (j.eq.1) then
       Vy(ic,ir) = Vel8(ic,ir,j)*QM_U(j) - Vel8(ic1,ir1,5)*QM_E(j)

       endif

      if (j.eq.2) then
      Vx(ic,ir) = (-1.0)*QM_U(j)* 
     1Vel8(ic,ir,j)/sqrt(2.0) + Vel8(ic1,ir1,6)*QM_E(j)/sqrt(2.0)

       Vy(ic,ir) = Vy(ic,ir) + Vel8(ic,ir,j)/sqrt(2.0)*QM_U(j) - 
     1  Vel8(ic1,ir1,6)*QM_E(j)/sqrt(2.0) 

          endif

      if (j.eq.3) then
       Vx(ic,ir) = Vx(ic,ir) - Vel8(ic,ir,j)*QM_U(j) + 
     1Vel8(ic1,ir1,7)*QM_E(j)

   
      endif

      if (j.eq.4) then
       Vx(ic,ir) = Vx(ic,ir) - QM_U(j)*Vel8(ic,ir,j)/sqrt(2.0) + 
     1Vel8(ic1,ir1,8)*QM_E(j)/sqrt(2.0)

      Vy(ic,ir) = Vy(ic,ir) - QM_U(j)*Vel8(ic,ir,j)/sqrt(2.0) + 
     1Vel8(ic1,ir1,8)*QM_E(j)/sqrt(2.0)

           endif

        if (j.eq.5) then
       Vy(ic,ir) =Vy(ic,ir) + Vel8(ic,ir,j)*(-1.0)*QM_U(j) + 
     1  Vel8(ic1,ir1,1)*QM_E(j)
        
    
      endif

       if (j.eq.6) then

       Vx(ic,ir) = Vx(ic,ir) + Vel8(ic,ir,j)*QM_U(j)/sqrt(2.0) - 
     1  Vel8(ic1,ir1,2)*QM_E(j)/sqrt(2.0)  

       Vy(ic,ir) = Vy(ic,ir) - QM_U(j)* Vel8(ic,ir,j)/sqrt(2.0) + 
     1Vel8(ic1,ir1,2)*QM_E(j)/sqrt(2.0)

   
      endif

       
       if (j.eq.7) then
       Vx(ic,ir) = Vx(ic,ir) + Vel8(ic,ir,7)*QM_U(7) - 
     1 Vel8(ic1,ir1,3)*QM_E(j)

    

      endif


      if (j.eq.8) then

       Vx(ic,ir) = Vx(ic,ir) + Vel8(ic,ir,j)/sqrt(2.0)*QM_U(j) - 
     1  Vel8(ic1,ir1,4)*QM_E(j)/sqrt(2.0)  

      Vy(ic,ir) = Vy(ic,ir) + Vel8(ic,ir,j)/sqrt(2.0)*QM_U(j) - 
     1 Vel8(ic1,ir1,4)*QM_E(j)/sqrt(2.0)  

    
      endif


       ENDDO

        if (QM_TOT.gt.0.0) then


       Vx(ic,ir) = Vx(ic,ir)/QM_TOT


       Vy(ic,ir) = Vy(ic,ir)/QM_TOT


        vel_cella(ic,ir) =sqrt(Vx(ic,ir)**(2.0) + Vy(ic,ir)**(2.0))
      
      
      if (vel_cella(ic,ir).gt.
     1vel_cella_max(ic,ir)) then
     
        vel_cella_max(ic,ir) = vel_cella(ic,ir)
     
        Vx_max(ic,ir) = Vx(ic,ir)
     
        Vy_max(ic,ir) = Vy(ic,ir)
     
          endif
         endif
       endif      ! FINE AGGIUNTA 30/1/2015
      enddo

!$OMP end do nowait          

c      profondita' istante successivo
    

*point 12.0 aggiornamento delle profondità
!$OMP do private(irow,icol,h_solido_pre,CONC_PRE, spessore)
!$OMP& reduction(+: H_totale,Total_eros, total_solid,h_solid)
!$OMP& reduction(+:Area_inondata, area_erosa, area_alluvionata)
!$OMP& schedule(monotonic: dynamic)
        do irow = 1, no_rows
	    do icol = 1, no_columns
            if (ele(icol,irow).ne.esterno) then
	        if(val_sorg(icol,irow).ne.100) then
  
      h_pre(icol,irow) = h(icol,irow)          
     
      h_solido_pre = h_solido(icol,irow)
        
      h_solido(icol,irow) = h_solido(icol,irow) +
     1dh_entrata_solido_sorg(icol,irow) + 
     1dh_entrata_solido(icol,irow) + dh_solido(icol,irow) +
     1C_fondo(icol,irow)*dh_sed(icol,irow)   ! modifica 6/12/2013
     
	h(icol,irow) = h(icol,irow) + dh(icol,irow) + dh_sed(icol,irow) + 
	1dh_entrata_unif(icol,irow) + dh_entrata_Bel(icol,irow) + 
     1dh_entrata_sorg(icol,irow)        

         CONC_PRE = Conc(icol,irow)
    
       if (h(icol,irow).gt.0.0) then    ! bifase
      Conc(icol,irow) = h_solido(icol,irow)/h(icol,irow)
    
      else
      Conc(icol,irow) = 0.0
      endif
     
          
       
       if (h_solido(icol,irow).lt.0.0) then
      error_map(icol,irow) = error_map(icol,irow) + 1

      if (error_map(icol,irow).eq.1)then
      if(boolFileERR) then !BERNARD writing ERR file
      write(19,'("WARNING NEGATIVE SOLID DEPTH AT CELL ic and ir = "
     1,2x,2I7)') icol, irow
      write(19,'("time steps number ",1x,I25)') ii
      write(19,'("previous and actual solid depths (m) = ",14x,2f20.10)'
     1) h_solido_pre, h_solido(icol,irow)
      conc_prima = h_solido_pre/h_pre(icol,irow)
      write(19,'("previous and actual sediment concentration values",4x
     1,2f20.10)') conc_prima, Conc(icol,irow)
        trapped_solid_depth = C_fondo(icol,irow)*dh_sed(icol,irow)
      WRITE(19,'("solid depth from input cells = ",21x,f20.10)') 
     1dh_entrata_solido_sorg(icol,irow)
      WRITE(19,'("solid depth from routing cells = ",19x,f20.10)')
     1dh_entrata_solido(icol,irow)
      WRITE(19,'("solid depth to neighbouring routing cells = ",12x,
     1f20.10)') dh_solido(icol,irow)
      WRITE(19,'("solid depth exchanged with bed (+ erosion - deposition
     1 = ",12x,f20.10)') dh_sed(icol,irow)
       write(19,'("condizione di inerodibilita",2x,f10.1)') 
     1no_erod(icol,irow)
      write(10,'("WARNING NEGATIVE SOLID DEPTH AT CELL ic and ir = "
     1,2x,2I7)') icol, irow
      else
      write(10,'("WARNING NEGATIVE SOLID DEPTH AT CELL ic and ir = "
     1,2x,2I7)') icol, irow
      write(10,'("previous and actual solid depths (m) = ",14x,2f20.10)'
     1) h_solido_pre, h_solido(icol,irow)
      conc_prima = h_solido_pre/h_pre(icol,irow)
      write(10,'("previous and actual sediment concentration values",4x
     1,2f20.10)') conc_prima, Conc(icol,irow)
      write(10,'("Noeroded condition",2x,f10.1)') 
     1no_erod(icol,irow)
      endif
      endif
      endif

      if (conc(icol,irow).gt.1.0.and.h(icol,irow).gt.h_routing) then  ! aggiunto il 3/12/2017
      
      error_map(icol,irow) = error_map(icol,irow) + 1

      if (error_map(icol,irow).eq.1)then    

      
      if(boolFileERR) then
          
      write(19,'("WARNING concentration larger than Cmax AT CELL ic and 
     1ir ",2x,2I7,"  at time step",2x,f14.7)') icol, irow, t_dopo
      conc_prima = h_solido_pre/h_pre(icol,irow)
      write(19,'("previous and actual sediment concentration values",4x
     1,2f20.10)') conc_prima, Conc(icol,irow)
       write(19,'("actual flow and solid depths (m) = ",14x,2f20.10)'
     1) h(icol,irow), h_solido(icol,irow)
       write(19,'("previous flow and solid depths (m) = ",14x,2f20.10)'
     1) h_pre(icol,irow), h_solido_pre 
       write(10,'("WARNING concentration larger than Cmax AT CELL ic and 
     1ir = ",2x,2I7)') icol, irow
      else
      write(10,'("WARNING concentration larger than Cmax AT CELL ic and 
     1ir = ",2x,2I7)') icol, irow
      write(10,'("actual flow and solid depths (m) = ",14x,2f20.10)'
     1) h(icol,irow), h_solido(icol,irow)
      write(10,'("previous and actual sediment concentration values",4x
     1,2f20.10)') conc_prima, Conc(icol,irow)
      
      end if 
      endif
      endif
	
	 h_post(icol,irow) = h(icol,irow)
	 
	 h_tot(icol,irow) = ele(icol,irow) + h(icol,irow) 

	    if (h(icol,irow).ge.h_routing.and.val_flag(icol,irow).eq.0.0) 
	1     then
      
	            val_tempi(icol,irow) = t
	            val_flag(icol,irow) = 1.0

	    endif

*point 13.0  CALCOLO VALORI MASSIMI DI PROFONDITA, CONCENTRAZIONE, SPESSORE MAX E QUOTA SUPERFICIE LIBERA   21/9/2017

          if (h(icol,irow).gt.hh_max(icol,irow)) then
     
      hh_max(icol,irow) = h(icol,irow)
     
            endif     
       
      if (h_tot(icol,irow).gt.h_tot_max(icol,irow)) then

      if (h(icol,irow).gt.0.0) then   ! modifica 26 Luglio 2018
     
      h_tot_max(icol,irow) = h_tot(icol,irow)

      endif
     
        endif
     
      if (conc(icol,irow).gt.conc_max(icol,irow)) then
     
      conc_max(icol,irow) = conc(icol,irow)
       
         endif

          spessore = h(icol,irow) + Eros_tot(icol,irow) 
         
       if (spessore.gt.spessore_max(icol,irow)) then
     
      spessore_max(icol,irow) = spessore
     
       endif
  

	else
  
	h_tot(icol,irow) = ele(icol,irow) + h(icol,irow) 
   
      endif

          h_totale = h_totale + h(icol,irow)

          total_eros = total_eros + Eros_tot(icol,irow)
          
          total_solid = total_solid + Solid_tot(icol,irow)  ! 30 Marzo 2013
     
          h_solid = h_solid + h_solido(icol,irow)  ! 30 Marzo 2013
     	       
          
          if(val_tempi(icol,irow).gt.0.0) Area_inondata = 
	1Area_inondata + lato_cella*lato_cella

	if (eros_tot(icol,irow).lt.0.0) Area_erosa = 
	1Area_erosa + lato_cella*lato_cella

		if (eros_tot(icol,irow).gt.0.0) Area_alluvionata = 
	1Area_alluvionata + lato_cella*lato_cella
	        if(val_sorg(icol,irow).ne.100) then


	  if (h(icol,irow).lt.0.0) then   
         error_map(icol,irow) = error_map(icol,irow) + 1

         if(error_map(icol,irow).eq.1)then    
            
	   if(boolFileERR) then !BERNARD writing ERR file	   
	     write(19,'("WARNING FLOW DEPTH VALUE MINUS THAN 0")')
	     write(19,'("time steps number ",1x,I25)') ii
	     write(19,'("time (sec) ",2x,f25.1)') t_dopo
	     write(19,'("column and row indexes",2x,2I6)') icol,irow
	     write(19,'("flow depth (m) = ",1x,f20.10)') h(icol, irow)
           write(19,'("outflow (m) = ",1x,f20.10)') dh(icol, irow)
           write(19,'("inflow uniform (m) = ",1x,f20.10)') 
     1dh_entrata_unif(icol,irow)
           write(19,'("inflow Belangier (m) = ",1x,f20.10)') 
     1dh_entrata_Bel(icol,irow)
           write(19,'("dh_sed (m) = ",1x,f20.10)') dh(icol, irow)

	     write(19,'("value of flow depth (m) at previous time step"
	1,1x,f20.10)') h_pre(icol,irow)
      write(10,'("WARNING FLOW DEPTH VALUE MINUS THAN 0 "),2i6')
     1 icol,irow
         else
         
       write(10,'("WARNING FLOW DEPTH VALUE MINUS THAN 0")')
       write(10,'("column and row indexes",2x,2I6)') icol,irow
       write(10,'("flow depth (m) = ",1x,f20.10)') h(icol, irow)
         end if
         endif
	   endif

	        endif
          endif
          
       enddo
      enddo
!$OMP END do nowait
      
!$OMP do 
!$OMP& private(irow, icol)
!$OMP& schedule(monotonic: dynamic)
       do irow = 1, no_rows
	  do icol = 1, no_columns
           if (ele(icol,irow).ne.esterno) then
	        dh(icol,irow) = 0.0
		    velocit(icol,irow) = 0.0
		    Vx(icol,irow) = 0.0
		    Vy(icol,irow) = 0.0
		    Vel_Cella(icol,irow) = 0.0
	        dh_entrata_unif(icol,irow) = 0.0
	        dh_entrata_sorg(icol,irow) = 0.0
	        dh_entrata_solido_sorg(icol,irow) = 0.0
	        dh_entrata_solido(icol,irow) = 0.0
	        dh_solido(icol,irow) = 0.0
		    dh_entrata_Bel(icol,irow) = 0.0
	        dh_sed(icol,irow) = 0.0 
              do j = 1,8
                  Vel8(icol,irow,j) = 0.0  ! 29/4/2019
                  Deltah8(icol,irow,j) = 0.0 ! 29/4/2109
              enddo
	   endif
        enddo
       enddo
!$OMP end do nowait      
         
     
      
      !$OMP single    !#1
    
      
      
		if (Q_CONTORNO_TOTALE.gt.0.0) then   ! 13/6/2015

	   Conc_fuoriuscito = V_solido_fuoriuscito_DT/V_fuori_uscito_DT   ! 13/6/2015
	   
	   else
	   
	   Conc_fuoriuscito = 0.0
	   
	   endif
!$OMP end single nowait
!$OMP single	   !#2

	if (Q_CONTORNO_TOTALE.gt.Qmax_contorno) Qmax_contorno = 
	1Q_CONTORNO_TOTALE      ! aggiunto 20/11/2012
      
       V_fuori_uscito_totale = V_fuori_uscito_totale + 
	1V_fuori_uscito_DT
	
	   V_solido_fuori_uscito_totale = V_solido_fuori_uscito_totale + 
	1V_solido_fuoriuscito_DT
         
	Volume_solido_depositato_step = Volume_solido_depositato - 
	1Volume_solido_depositato_prima
		
	Volume_solido_eroso_step = Volume_solido_eroso - 
	1Volume_solido_eroso_prima

		
*******************************************************************************
*                         AGGIUNTA DEL 14/01/2013
*******************************************************************************
!$OMP end single nowait
!$OMP single	  ! #3


      IF (ii.eq.2) then 
      
      j_entr = 1
      t_step_entrain(j_entr) = t
      ! t_step_entrain(j_entr) = t
       V_entrained_tot(j_entr) = V_eroso
       V_entrained_step(j_entr) = V_eroso 
      j_entr = j_entr + 1
      t_step_entrain(j_entr) = t_step_entrain(j_entr-1) + DT_entrain
      
        ELSE
        
         ! if (t(ii).ge.t_step_entrain(j_entr)) then
       if (t.ge.t_step_entrain(j_entr)) then
          
          V_entrained_tot(j_entr) = V_eroso
          V_entrained_step(j_entr) = V_eroso - V_eroso_prima 
          j_entr = j_entr + 1
          t_step_entrain(j_entr) = t_step_entrain(j_entr-1) + DT_entrain
      
          endif 
             
        
       ENDIF
       
*******************************************************************************
*                         FINE AGGIUNTA DEL 14/01/2013
*******************************************************************************
!$OMP end single nowait
!$OMP single	   !#4
    
     
	if (tempo_scrittura2.eq.1.0) then
      tempo_scrittura2 = 0.0
	write(10,'("  solid eroded, deposited and trapped volumes (m^3) at
     1 this step",12x,3f20.5)') 
	1Volume_solido_eroso_step, Volume_solido_depositato_step, 
	1 volume_solido_intrappolato_STEP 
	write(10,*)
      
      endif
      
!$OMP end single nowait
      
      
!$OMP single       !#5
	V_total = h_totale*lato_cella*lato_cella
	V_eros =  (-1.0)*total_eros*lato_cella*lato_cella
	V_solid = (-1.0)*total_solid*lato_cella*lato_cella   ! 30 Marzo 2013
	Volume_solido = h_solid*lato_cella*lato_cella    ! 29 Marzo 2013
	
	Cmedio = h_solid/h_totale  ! bifase

         ! aggiunto il 2/3/2015



********************************************************************************
*point 10.0  INSERIMENTO CALCOLO SFORZI SPINTE 27 APRILE 2015
********************************************************************************

        if (N_strutture.ge.1) then
         
         call Calcolo_SforzoFondo   !  SPOSTATO DAL BASSO IL 24/9/2015
         
        endif

  
!$OMP end single nowait    
       
       
       
       if (t_dopo.ge.t_file(i_file).and.flag(i_file).eq.0.0) then
!$OMP single !#6

	 i_cont_file = i_cont_file + 1

       tempo_file(i_file) = t_dopo
       
       tempo_scrittura2 = 1.0    ! aggiunto il 2/3/2015

       ijij = 5000 + i_cont_file - 1
       
!$OMP end single nowait
       
!$OMP do private(ic, ir)
!$OMP& schedule(monotonic: dynamic)
      do i_celle2 = 1, Num_celle_bacino

              ic = ic_sol(i_celle2)
              ir = ir_sol(i_celle2)
              
!	        i_celle2 = i_celle2 + 1
	       
	        h_sol(i_celle2) = h(ic,ir)
	        htot_sol(i_celle2) = h_tot(ic,ir)
	        eros_sol(i_celle2) = Eros_tot(ic,ir) 
              conc_sol(i_celle2) = conc(ic,ir)  ! 18/9/2017
	        vel_sol_x(i_celle2) = Vx(ic,ir)
	        vel_sol_y(i_celle2) = Vy(ic,ir)
           
      end do
!$OMP end do nowait

*point 14.0 scrittura risultati intermed
!$OMP Sections private (file_name,retint,fileHeader,num_open,nrec,ky,kx)
!$OMP& private(i)
c filename_flowdepth(i_file)
 !$OMP Section 
      num_open = 95000
              
        file_name = filename_flowdepth(i_file) 
        open(num_open,file=file_name,form='BINARY',mode='write')
        
        retint = scan (file_name,'.')
      if (retint > 1) then
      fileHeader = file_name(1:retint-1)//'.hdr'
      if (fileHeader /= fileFormat) call HdrWrite1 (fileHeader,num_open)
      endif
	  do nrec = 1, no_rows
          ky = nrec 
          write (95000)  (h(kx,ky),kx=1,no_columns)
        enddo  
	close(num_open)
c filename_erosiondepth(i_file)
 !$OMP Section 
      num_open =97000
      
        file_name = filename_erosiondepth(i_file)
        open(num_open,file=file_name,form='BINARY',mode='write')
        
        retint = scan (file_name,'.')
      if (retint > 1) then
      fileHeader = file_name(1:retint-1)//'.hdr'
      if (fileHeader /= fileFormat) call HdrWrite1 (fileHeader,num_open)
      endif
	
	do j = 1, no_rows
	     write (97000) (Eros_tot(i,j),i=1,no_columns)
	enddo  	
      close(num_open)
c filename_Vx(i_file)	
 !$OMP Section
      num_open = 98000
        
        file_name = filename_Vx(i_file)
        open(num_open,file=file_name,form='BINARY',mode='write')
        
        retint = scan (file_name,'.')
      if (retint > 1) then
      fileHeader = file_name(1:retint-1)//'.hdr'
      if (fileHeader /= fileFormat) call HdrWrite1 (fileHeader,num_open)
      endif
	do j = 1, no_rows
		  write (98000) (Vx(i,j),i=1,no_columns)
	enddo
	       
      close(num_open)
c filename_Vy(i_file)
 !$OMP Section  
      num_open = 99000
      	  
	  file_name = filename_Vy(i_file)
        open(num_open,file=file_name,form='BINARY',mode='write')
        
        retint = scan (file_name,'.')
      if (retint > 1) then
      fileHeader = file_name(1:retint-1)//'.hdr'
      if (fileHeader /= fileFormat) call HdrWrite1 (fileHeader,num_open)
      endif
	 do j = 1, no_rows
	     write (99000) (Vy(i,j),i=1,no_columns)
	enddo      
      close(num_open)
c filename_VelCella(i_file)	    
 !$OMP Section
      num_open = 198000
      
        file_name = filename_VelCella(i_file)
        open(num_open,file=file_name,form='BINARY',mode='write')
        
        retint = scan (file_name,'.')
      if (retint > 1) then
      fileHeader = file_name(1:retint-1)//'.hdr'
      if (fileHeader /= fileFormat) call HdrWrite1 (fileHeader,num_open)
      endif
  	do j = 1, no_rows
	     write (198000) (Vel_Cella(i,j),i=1,no_columns)
	enddo
      close(num_open)
***************************************************************
*  parte tolta per diminuire dimensione output 28/02/2015
****************************************************************
 
c filename_conc(i_file)        
  !$OMP Section  
       num_open = 199500
      	  
	  file_name = filename_conc(i_file)
        open(num_open,file=file_name,form='BINARY',mode='write')
        
        retint = scan (file_name,'.')
      if (retint > 1) then
      fileHeader = file_name(1:retint-1)//'.hdr'
      if (fileHeader /= fileFormat) call HdrWrite1 (fileHeader,num_open)
      endif
	  do j = 1, no_rows
	     write (199500) (conc(i,j),i=1,no_columns)
	enddo       
      close(num_open)
c filename_direz_vel_uscente(i_file)
 !$OMP Section  
      num_open = 199502
      	  
	  file_name = filename_direz_vel_uscente(i_file)
        open(num_open,file=file_name,form='BINARY',mode='write')
        
        retint = scan (file_name,'.')
      if (retint > 1) then
      fileHeader = file_name(1:retint-1)//'.hdr'
      if (fileHeader /= fileFormat) call HdrWrite1 (fileHeader,num_open)
      endif
	do j = 1, no_rows
	     write (199502) (direz_vel(i,j),i=1,no_columns)
	enddo
	 close(num_open)                 
        !  scrittura file per sms

 !$OMP section
      write(1000001,'("TS",3x,f15.1)') t_dopo   
      do i = 1, Num_celle_bacino 
          write(1000001,'(f15.6)') h_sol(i)
      end do
 !$OMP section 
      write(1000002,'("TS",3x,f15.1)')  t_dopo
      do i = 1, Num_celle_bacino
	 write(1000002,'(f15.6)') htot_sol(i)
      end do
 !$OMP section
      write(1000006,'("TS",3x,f15.1)')  t_dopo  ! 18/9/2017
      do i = 1, Num_celle_bacino
       write(1000006,'(f15.6)') conc_sol(i)  ! 18/9/2017
      end do
 !$OMP section
      if (control_eros.eq.1.0) then
            write(1000003,'("TS",3x,f15.1)')  t_dopo
        do i = 1, Num_celle_bacino
       
	    write(1000003,'(f15.6)') eros_sol(i)
        end do
      endif
!$OMP section
      write(1000005,'("TS",3x,f15.1)')  t_dopo
      do i=1, Num_celle_bacino
       write(1000005,'(2f15.6)') vel_sol_x(i), vel_sol_y(i)
      end do
!$OMP end sections nowait

********************************************************************************************
*  PARTE OUTPUT PER FILE MATLAB TOLTA IL 28/2/2015
********************************************************************************************


!$OMP single !#7
	  flag(i_file) = 1.0
	  if (i_file.lt.N_file_output) then    !  MODIFICATO IL 28 MARZO 2013
	  	  i_file = i_file + 1
	  	  endif
	  ijij = ijij + i_file
        
!$OMp end single nowait
      end if

  


	

*********************************  SCRITTURA SUPERFICI AREE ALLUVIONATE  MARZO 2010
 

!$OMP single !#8  


      
        
***********************************************************************

        if (tempo_scrittura2.eq.1.0) then

       write(10,'(" input total and solid volumes (m3)",10x,2f20.5)') 
     1V_entrato_t1, V_solid_input_t1
      i_entrato = i_entrato + 1
      VolumeEntrato(i_entrato) = V_entrato_t1
      VolumeSolidoEntrato(i_entrato) = V_solid_input_t1
	write(10,'(" input total and solid volumes this step (m3)",2f20.5)')
     1 V_entrato_DT-1, V_solid_input_DT_t1
	
      write(10,'(" total and solid eroded volumes (m3)",9x,2f20.5)')
     1 V_eroso, Volume_solido_eroso
	
	write(10,'(" total and solid deposited volumes (m3)",6x,2f20.5)')
     1 V_depositato, Volume_solido_depositato
	
      write(10,'(" eroded(+)/deposited(-) volume (m3)",10x,f20.5)')
	1 V_eros
	
      write(10,'(" solid eroded(+)/deposited(-) volume (m^3)",2x
     1,f20.5)') V_solid
  
      write(10,'(" routing solid volume (m3) ",17x,f20.5)')
	1 Volume_solido

	  write(10,'(" total routing volume (m3)",18x,f20.5)')
	1 V_total

	WRITE(10,'(" Mean solid concentration",30x,f15.8)') Cmedio

	 write(10,*)
      write(10,'(" volume out (m^3) at this step",24x,f14.2)') 
	1V_fuori_uscito_DT
	write(10,'(" total and solid volumes out (m^3)",20x,2f14.2)')
	1V_fuori_uscito_totale, V_solido_fuori_uscito_totale

	write(10,'(" net volume (m3)",40x,f11.1)') V_netto
	write(10,'(" flooded area (m2)",38x,f11.1)') Area_inondata

      write(10,'(" Check input mass conservation: relative volume differ
     1ence",2X,f11.5)') Check_massa
	write(10,*)
	write(10,*)
	  
		  
	write(30,'(" input total and solid volumes (m3)",10x,2f20.5)') 
     1V_entrato_t1, V_solid_input_t1
	write(30,'(" input total and solid volumes this step (m3)",2f20.5)')
     1 V_entrato_DT_t1, V_solid_input_DT_t1
	
      write(30,'(" total and solid eroded volumes (m3)",9x,2f20.5)')
     1 V_eroso, Volume_solido_eroso
	
	write(30,'(" total and solid deposited volumes (m3)",6x,2f20.5)')
     1 V_depositato, Volume_solido_depositato
	
      write(30,'(" eroded(+)/deposited(-) volume (m3)",10x,f20.5)')
	1 V_eros
	
      write(30,'(" solid eroded(+)/deposited(-) volume (m^3)",2x
     1,f20.5)') V_solid
  
      write(30,'(" routing solid volume (m3) ",17x,f20.5)')
	1 Volume_solido
	
	  write(30,'(" total routing volume (m3)",18x,f20.5)')
	1 V_total
	WRITE(30,'(" Mean solid concentration",27x,f15.8)') Cmedio

	 write(30,*)
      write(30,'(" volume out (m^3) at this step",24x,f14.2)') 
	1V_fuori_uscito_DT
	write(30,'(" total and solid volumes out (m^3)",6x,2f14.2)')
	1V_fuori_uscito_totale, V_solido_fuori_uscito_totale

	write(30,'(" net volume (m3)",40x,f11.1)') V_netto
	write(30,'(" flooded area (m2)",38x,f11.1)') Area_inondata
      
      write(30,'(" Check input mass conservation: relative volume differ
     1ence",f11.5)') Check_massa
	write(30,*)
	write(30,*)
	
        tempo_scrittura = 0.0
  
	   
      endif
!$OMP end single nowait
!$OMP single !#9

	if (mod(ii,200).eq.0) then
			  
		ttttt = t_dopo/3600.0   ! 15/01/2013

      write(22,*) ttttt, Q_CONTORNO_TOTALE, Conc_fuoriuscito  ! modificato il 13/06/2015 

	write(24,'(6f15.3)') ttttt, V_entrato_t1, V_fuori_uscito_totale,  
	1V_total, V_depositato, V_eroso
	
	write(210001,*) ttttt, Cmedio      ! aggiunto il 2 Aprile 2013

      endif
!$OMP end single nowait  
      
C point 2.3 calcolo della pendenze per le celle routing individuate nello step precedente
      
!$OMP  do
!$OMP& private(i,j,icj,irj,sen_tetaj,sen_tetatot,jj)
!$OMP& schedule(monotonic: dynamic)
      do i = 1, Num_celle_routing
        sen_tetatot = 0.0
        if (val(ic_routing(i),ir_routing(i)).eq.float(ii+1)) then   ! nuova if  10/12/2012   
         k(ic_routing(i),ir_routing(i)) = 0  
         do j = 1,8
           icj = ic_routing(i) + i_sh_col(j)
           irj = ir_routing(i) + i_sh_row(j)
           if (ele(icj,irj).ne.esterno) then
            if (val_sorg(icj,irj).ne.100.0) then   ! MODIFICA DEL 16/08/2015   
             call kern (ele(ic_routing(i),ir_routing(i)),
     1                  ele(icj,irj),j,sen_tetaj,lato_cella)
                  sen_teta(ic_routing(i),ir_routing(i),j)= sen_tetaj
            endif
          endif

         if  (sen_teta(ic_routing(i),ir_routing(i),j).gt.0.0) then
           
	 if (val(icj,irj).ge.0.0.and.val(icj,irj).le.float(ii+1)) then

	k(ic_routing(i),ir_routing(i)) = k(ic_routing(i),ir_routing(i)) + 1
      
	j_dir(ic_routing(i),ir_routing(i),
	1k(ic_routing(i),ir_routing(i))) = j   ! aggiunto il 20/11/2011

      senteta(ic_routing(i),ir_routing(i),k(ic_routing(i),ir_routing(i))
	1) = sen_teta(ic_routing(i),ir_routing(i),j)

	ic_s(ic_routing(i),ir_routing(i),k(ic_routing(i),ir_routing(i))) =
	1 icj
	ir_s(ic_routing(i),ir_routing(i),k(ic_routing(i),ir_routing(i))) = 
	1irj

	sen_tetatot = sen_tetatot
	1 + sen_teta(ic_routing(i),ir_routing(i),j)

        endif
       endif
      enddo

c      peso e pendenza e peso massimi
   
      sen_max(ic_routing(i),ir_routing(i)) = 0.0

	   do j = 1,k(ic_routing(i),ir_routing(i))
     
	 peso(ic_routing(i),ir_routing(i),j) = senteta(ic_routing(i),
	1 ir_routing(i),j)/sen_tetatot
          if (senteta(ic_routing(i),ir_routing(i),j).gt.sen_max
	1       (ic_routing(i),ir_routing(i))) then
	  sen_max(ic_routing(i),ir_routing(i)) = senteta
     1    (ic_routing(i),ir_routing(i),j)

	  peso_max(ic_routing(i),ir_routing(i)) = peso(ic_routing(i),
	1    ir_routing(i),j)

          endif
         enddo
	 endif
      enddo
!$OMP end do nowait
C Point 4.1     azzeramento variazioni di profondita' per presente ciclo     
     
!$OMP do private (ij,i,cel1)
!$OMP& collapse(2)
!$OMP& reduction(max:cel_max_sor)
!$OMP& schedule(monotonic: dynamic)
      do ij  = 1, Num_sorgenti   ! modificata il 3/12/2012        
       do i = 1, Nsorg1(ij)
* New Aggiornamento flowdepth sezione attive
       if(attivata(ij).eq.1)then
           
      h(ic_sorg1(i,ij),ir_sorg1(i,ij)) = h(ic_sorg1(i,ij),
     1 ir_sorg1(i,ij)) + V_input(ij)/((lato_cella)**(2.0))

      h_solido(ic_sorg1(i,ij),ir_sorg1(i,ij)) =      
     1h_solido(ic_sorg1(i,ij),ir_sorg1(i,ij)) + 
     1VS_input(ij)/((lato_cella)**(2.0))                  ! bifase
     
      Conc(ic_sorg1(i,ij),ir_sorg1(i,ij)) = h_solido(ic_sorg1(i,ij),
     1 ir_sorg1(i,ij))/h(ic_sorg1(i,ij),ir_sorg1(i,ij))
      
      end if
	if (h(ic_sorg1(i,ij),ir_sorg1(i,ij)).gt.zero) then

	cel1 = Ch(ic_sorg1(i,ij),ir_sorg1(i,ij))*peso_max(ic_sorg1(i,ij)
	1,ir_sorg1(i,ij))*sqrt(9.81*h(ic_sorg1(i,ij),ir_sorg1(i,ij))*
     1sen_max(ic_sorg1(i,ij),ir_sorg1(i,ij))) + 
     1 sqrt(9.81*h(ic_sorg1(i,ij),ir_sorg1(i,ij)))

      if (cel1.gt.cel_max_sor) cel_max_sor = cel1
      
      endif
      enddo
      enddo
!$OMP end do nowait
       
      
!$OMP do private(ij,cel)
!$OMP& reduction(max:cel_max)
!$OMP& schedule(monotonic: dynamic)
      do ij = 1, Num_celle_routing
       
       if (val(ic_routing(ij),ir_routing(ij)).le.float(ii+1)) then

	cel = Ch(ic_routing(ij),ir_routing(ij))*peso_max(ic_routing(ij)
	1,ir_routing(ij))*sqrt(9.81*h(ic_routing(ij),ir_routing(ij))*
     1sen_max(ic_routing(ij),ir_routing(ij)))
     1 + sqrt(9.81*h(ic_routing(ij),ir_routing(ij)))
	 
          if (cel.gt.cel_max) cel_max = cel
       
       endif
      enddo
!$OMP end do nowait


!  scrittura file di internal output

      if (Intern_Output.eq.1.0) then

!  INIZIO AGGIUNTA (SEZIONI NUOVE) DEL 25/10/2017
!$OMP do private (jj,iijj,celle_attive_sez,i_file88)
!$OMP& schedule(monotonic: dynamic)
          
        do jj = 1, N_sezioni_interne   

          Vol_uscita(jj) = 0.0
          Vol_uscita_solido(jj) = 0.0
          volume_sez(jj) = 0.0 
          Q_uscita(jj) = 0.0
          Q_uscita_solido(jj) = 0.0
          Averaged_flow_depth(jj) = 0.0
          Averaged_conc(jj) = 0.0
          
*point 15.0 Calcolo e scrittura sezioni interne       

          celle_attive_sez = 0

      do iijj = 1, N_celle_sez_intern(jj)

      Vol_uscita(jj) = Vol_uscita(jj) + 
     1dh_uscita_sez(ic_intern(iijj,jj),ir_intern(iijj,jj))

      Vol_uscita_solido(jj) = Vol_uscita_solido(jj) + 
     1dh_uscita_solido_sez(ic_intern(iijj,jj),ir_intern(iijj,jj))

      if (h(ic_intern(iijj,jj),ir_intern(iijj,jj)).gt.h_routing) then  ! modificata 14/11/2017

      volume_sez(jj) = volume_sez(jj) + 
     1h(ic_intern(iijj,jj),ir_intern(iijj,jj))

      Averaged_conc(jj) = Averaged_conc(jj) + 
     1conc(ic_intern(iijj,jj),ir_intern(iijj,jj))

      celle_attive_sez = celle_attive_sez + 1.0

      endif
     
      enddo

      Q_uscita(jj) = Vol_uscita(jj)*lato_cella*lato_cella/DT
      Q_uscita_solido(jj) = Vol_uscita_solido(jj)*lato_cella*lato_cella/
     1DT
      
      if (celle_attive_sez.gt.0.0) then
       Averaged_flow_depth(jj) = volume_sez(jj)/celle_attive_sez   ! 14/11/2017
       Averaged_conc(jj) = Averaged_conc(jj)/celle_attive_sez   ! 5/11/2017
      else
       Averaged_flow_depth(jj) = 0.0   ! 14/11/2017
       Averaged_conc(jj) = 0.0   ! 5/11/2017
      endif

      i_file88 = 215000 + jj - 1

       write(i_file88,'(F15.4,3x,f15.3,1x,f15.3,1x,f15.3,1x,f15.3)')  ! modificato il 25/10/2017
     1t_dopo, Q_uscita(jj), Q_uscita_solido(jj), Averaged_flow_depth(jj)
     1, Averaged_conc(jj) ! aggiunto il 11/7/2017

       enddo
!$OMP end do
    !  FINE AGGIUNTA (SEZIONI NUOVE) DEL 25/10/2017
                        
      if (i_file_out.le.N_internal_DT) then
           
         if (t_dopo.ge.tempi_output(i_file_out).and.flag_int(i_file_out)
     1.eq.0.0) then 
!$OMP single    
         i_DQ = i_DQ + 1   ! N.B. i_DQ viene azzerato all'inizio del ciclo di calcolo ed alla scrittura dell'ouptut delle sezioni
         
         if (i_DQ.eq.1) then
          tempo_scrittura = 1.0
          t_minuti = t_dopo/60.0 
          T_intervallo = 0.0

      do jj = 1, N_sezioni_interne
          T_intervallo_calcolo(jj) = 0.0
          T_intervallo_calcoloELE(jj) = 0.0  ! 21/07/2017
          Q_out_sez(jj) = 0.0 
	    FreeSurf_sez(jj) = 0.0   ! 15/11/2017
	    Conc_sez(jj) = 0.0  ! 15/11/2017
          Flow_depth_sez(jj) = 0.0   ! 15/11/2017
	    Spessore_sez(jj) = 0.0    ! 15/11/2017
	    Q_uscita_sez(jj) = 0.0    ! 15/11/2017
          Q_uscita_solido_sez(jj) = 0.0    ! 15/11/2017
          Q_uscitatot_sez(jj) = 0.0   ! 15/11/2017
          Q_uscita_solidotot_sez(jj) = 0.0  

       enddo

                        
         endif    ! fine i_DQ = 0 (azzeramenti istante iniziale)
          T_intervallo = T_intervallo + DT 
!$OMP end single nowait
      
!$OMP do private(jj,iijj,celle_attive,celle_ele_variata)
!$OMP& schedule(monotonic: dynamic)
          do jj = 1, N_sezioni_interne
           
           Q_out_interne(jj) = 0.0
           FreeSurf_interne_medio(jj) = 0.0
           Conc_sezioni_interne(jj) = 0.0
           ele_interno_medio(jj) = 0.0
           flow_depth_interne_medio(jj) = 0.0   ! 21/7/2017
           ele_iniz_interno_medio(jj) = 0.0    ! 21/7/2017
           Q_uscita_interne(jj) = 0.0  ! aggiunto il 11/7/2017
           Q_uscita_solido_interne(jj) = 0.0  ! aggiunto il 11/7/2017
           spessore_interne_medio(jj) = 0.0   ! 21/9/2017
           Q_uscita_sez_interne(jj) = 0.0  ! aggiunto il 11/7/2017
           Q_uscita_solido_sez_interne(jj) = 0.0  ! aggiunto il 11/7/2017    
           celle_attive = 0.0
           celle_ele_variata = 0.0    ! 21/7/2017
   
           do iijj = 1, N_celle_sez_intern(jj)
              
             
      Q_entrata(ic_intern(iijj,jj),ir_intern(iijj,jj)) = 
     1(dh_entrata_unif(ic_intern(iijj,jj),ir_intern(iijj,jj)) + 
     1dh_entrata_Bel(ic_intern(iijj,jj),ir_intern(iijj,jj)) + 
     1dh_sed(ic_intern(iijj,jj),ir_intern(iijj,jj)) + 
     1dh_entrata_sorg(ic_intern(iijj,jj),ir_intern(iijj,jj)))*
	1lato_cella*lato_cella/DT


      Q_out_interne(jj) =  Q_out_interne(jj) + 
     1Q_entrata(ic_intern(iijj,jj),ir_intern(iijj,jj)) -  
     1dh_sed(ic_intern(iijj,jj),ir_intern(iijj,jj))*
	1lato_cella*lato_cella/DT


      dh_uscita_tot(ic_intern(iijj,jj),ir_intern(iijj,jj)) =
     1dh_uscita_sez(ic_intern(iijj,jj),ir_intern(iijj,jj)) +
     1 dh_sed(ic_intern(iijj,jj),ir_intern(iijj,jj))
     
      dh_uscita_solido_tot(ic_intern(iijj,jj),ir_intern(iijj,jj)) =
     1dh_uscita_solido_sez(ic_intern(iijj,jj),ir_intern(iijj,jj)) +
     1 C_fondo(ic_intern(iijj,jj),ir_intern(iijj,jj))*
     1dh_sed(ic_intern(iijj,jj),ir_intern(iijj,jj))
          
    ! aggiunto il 11/7/2017
       Q_uscita_interne(jj) =  Q_uscita_interne(jj) + 
     1 dh_uscita_tot(ic_intern(iijj,jj),ir_intern(iijj,jj))*
	1lato_cella*lato_cella/DT

    ! aggiunto il 11/7/2017
       Q_uscita_solido_interne(jj) =  Q_uscita_solido_interne(jj) + 
     1 dh_uscita_solido_tot(ic_intern(iijj,jj),ir_intern(iijj,jj))*
	1lato_cella*lato_cella/DT

      ! aggiunto il 11/7/2017
       Q_uscita_sez_interne(jj) =  Q_uscita_sez_interne(jj) + 
     1 dh_uscita_sez(ic_intern(iijj,jj),ir_intern(iijj,jj))*
	1lato_cella*lato_cella/DT

    ! aggiunto il 11/7/2017
       Q_uscita_solido_sez_interne(jj) = Q_uscita_solido_sez_interne(jj)
     1+ dh_uscita_solido_sez(ic_intern(iijj,jj),ir_intern(iijj,jj))*
	1lato_cella*lato_cella/DT


      if (h(ic_intern(iijj,jj),ir_intern(iijj,jj)).gt.h_routing) then   ! messo qui il 14/11/2017
     
           FreeSurf_interne_medio(jj) = FreeSurf_interne_medio(jj) + 
     1 h_tot(ic_intern(iijj,jj),ir_intern(iijj,jj))

       Flow_depth_interne_medio(jj) = Flow_depth_interne_medio(jj) +   ! 21/7/2017 
     1 h(ic_intern(iijj,jj),ir_intern(iijj,jj))
     
       spessore_interne_medio(jj) = spessore_interne_medio(jj) +   ! 21/9/2017 
     1 h(ic_intern(iijj,jj),ir_intern(iijj,jj)) + Eros_tot(ic_intern
     1(iijj,jj),ir_intern(iijj,jj))
             
           Conc_sezioni_interne(jj) = conc_sezioni_interne(jj) +
     1 conc(ic_intern(iijj,jj),ir_intern(iijj,jj))
     
       celle_attive = celle_attive + 1.0
             
      endif

       if (Eros_tot(ic_intern(iijj,jj),ir_intern(iijj,jj)).ne.0.0) then   ! 21/7/2017 
                 
       ele_iniz_interno_medio(jj) = ele_iniz_interno_medio(jj) +     ! 21/7/2017 
     1 ele_iniz(ic_intern(iijj,jj),ir_intern(iijj,jj))
          
        ele_interno_medio(jj) = ele_interno_medio(jj) + 
     1 ele(ic_intern(iijj,jj),ir_intern(iijj,jj))            !  21/07/2017

       celle_ele_variata = celle_ele_variata + 1.0   ! 21/7/2017

       endif   ! 21/7/2017 
                  
            enddo   ! fine ciclo celle interne
            
               ! calcolo quantità medie per la sezione e mediate per il DT     
            if (celle_attive.gt.0.0) then
            
      Conc_sezioni_interne(jj) = Conc_sezioni_interne(jj)/celle_attive
      
      !ele_interno_medio(jj) = ele_interno_medio(jj)/celle_attive     !  21/7/2017
      
      FreeSurf_interne_medio(jj)=FreeSurf_interne_medio(jj)/celle_attive   

      Flow_depth_interne_medio(jj) = Flow_depth_interne_medio(jj)/     ! 21/7/2017 
     1celle_attive

      spessore_interne_medio(jj) = spessore_interne_medio(jj)/     ! 21/9/2017 
     1celle_attive
          
      Conc_med(jj) = Conc_sezioni_interne(jj)*DT + Conc_med(jj)
   
      FRSURF_medio(jj) = FreeSurf_interne_medio(jj)*DT +FRSURF_medio(jj)

      Q_int_medio(jj) = Q_out_interne(jj)*DT + Q_int_medio(jj)

      Flow_depth_medio(jj) = Flow_depth_interne_medio(jj)*DT +     ! 21/7/2017 
     1 Flow_depth_medio(jj)

      spessore_medio(jj) = spessore_interne_medio(jj)*DT +     ! 21/9/2017 
     1 spessore_medio(jj)
      
      T_intervallo_calcolo(jj) = T_intervallo_calcolo(jj) + DT


 
  !  non credo sia necessario mettere questo qua: si perde eventuale portata perchè dipende da h e non da h_pre

      ! aggiunto il 11/7/2017
      Q_uscita_medio(jj) = Q_uscita_medio(jj) + Q_uscita_interne(jj)*DT

      Q_uscita_solido_medio(jj) = Q_uscita_solido_medio(jj) + 
     1Q_uscita_solido_interne(jj)*DT

      Q_uscita_sez_medio(jj) = Q_uscita_sez_medio(jj) + 
     1Q_uscita_sez_interne(jj)*DT

      Q_uscita_solido_sez_medio(jj) = Q_uscita_solido_sez_medio(jj) + 
     1Q_uscita_solido_sez_interne(jj)*DT

  
      endif

      if (celle_ele_variata.gt.0.0) then  ! 21/07/2017

      ele_interno_medio(jj) = ele_interno_medio(jj)/celle_ele_variata

      ele_iniz_interno_medio(jj) = ele_iniz_interno_medio(jj)/
     1celle_ele_variata    ! 21/7/2017 
           
      Ele_medio(jj) = ele_interno_medio(jj)*DT + Ele_medio(jj)
                
      Ele_iniz_medio(jj) = ele_iniz_interno_medio(jj)*DT +      ! 21/7/2017 
     1Ele_iniz_medio(jj)


      T_intervallo_calcoloELE(jj) = T_intervallo_calcoloELE(jj) + DT

       endif  ! 21/07/2017   
       
       if (i_file.eq.20.and.jj.eq.2) then    
       
       write(10,*) celle_attive, Flow_depth_interne_medio(jj)
       
       endif        
        
       enddo
!$OMP end do 

       if (T_intervallo.gt.10.0.or.T_intervallo.ge.DT_Internal_Output) 
     1then   ! MODIFICA DEL 21/9/2015
!$OMP single
      
       write(10,*)
      write(10,'("INTERNAL SECTIONS")')
         
      
	! scrittura su file
	write(10,*)
	!write(10,'("time (minutes)",3x,f20.1)') t_minuti
	write(10,'("time (seconds)",3x,f20.1)') t_dopo
	write(10,*)
	
		
	write(10,'("section   discharge (m^3/s)  free surface (m)  terrain 
     1elevation (m)  initial terrain elevation (m)  flow depth (m)
     1sediment concentration")')   ! modificato il 21/7/2017
      write(10,*)
!$OMP end single nowait
      

        
!$OMP do private(i_file77)
!$OMP& schedule(monotonic: dynamic)
	  do jj = 1, N_sezioni_interne 
	  
	  if (T_intervallo_calcolo(jj).le.0.0) then
	  
	       Q_out_sez(jj) = 0.0
             FreeSurf_sez(jj) = 0.0
             Conc_sez(jj) = 0.0
             Flow_depth_sez(jj) = 0.0    ! 21/7/2017 
             spessore_sez(jj) = 0.0    ! 21/9/2017 

              ! aggiunto il 11/7/2017
              Q_uscita_sez(jj) = 0.0
              Q_uscita_solido_sez(jj) = 0.0

              Q_uscitatot_sez(jj) = 0.0
              Q_uscita_solidotot_sez(jj) = 0.0
              
          else
              
      Q_out_sez(jj) = Q_int_medio(jj)/T_intervallo_calcolo(jj)

      FreeSurf_sez(jj) = FRSURF_medio(jj)
     1/T_intervallo_calcolo(jj)

      Conc_sez(jj) = Conc_med(jj)/T_intervallo_calcolo(jj)

      Flow_depth_sez(jj) = Flow_depth_medio(jj)/
     1T_intervallo_calcolo(jj)    ! 21/7/2017

         spessore_sez(jj) = spessore_medio(jj)/
     1T_intervallo_calcolo(jj)    ! 21/9/2017

      ! aggiunto il 11/7/2017
      Q_uscitatot_sez(jj) = Q_uscita_medio(jj)/T_intervallo_calcolo(jj)
      Q_uscita_solidotot_sez(jj) = Q_uscita_solido_medio(jj)/
     1T_intervallo_calcolo(jj)

      Q_uscita_sez(jj) = Q_uscita_sez_medio(jj)/
     1T_intervallo_calcolo(jj)
      Q_uscita_solido_sez(jj) = Q_uscita_solido_sez_medio(jj)/
     1T_intervallo_calcolo(jj)
                
        endif

         if (T_intervallo_calcoloELE(jj).le.0.0) then    ! 21/7/2017 
	  	   
              ele_interno_medio(jj) = 0.0
              ele_iniz_interno_medio(jj) = 0.0     ! 21/7/2017 
              
          else
                   
      ele_interno_medio(jj) = Ele_medio(jj)/T_intervallo_calcoloELE(jj)
     
      ele_iniz_interno_medio(jj) = Ele_iniz_medio(jj)/
     1T_intervallo_calcoloELE(jj)     ! 21/7/2017 
      
        endif   ! 21/7/2017 
              
		i_file77 = 115000 + jj - 1
		
		
      write(10,'(I9,3x,f15.3,1x,f15.3,1x,f15.3,1X,F15.3,1X,F10.3,f10.3,
     11x,f10.3,1x,f10.3,1x,f10.3,1X,f10.3,1X,F10.3)') jj,   ! modificato il 11/7/2017
     1Q_out_sez(jj), FreeSurf_sez(jj), ele_interno_medio(jj), 
     1ele_iniz_interno_medio(jj), Flow_depth_sez(jj), Spessore_sez(jj), 
     1Conc_sez(jj), Q_uscita_sez(jj), Q_uscita_solido_sez(jj),   ! aggiunto il 11/7/2017
     1Q_uscitatot_sez(jj), Q_uscita_solidotot_sez(jj)   ! aggiunto il 11/7/2017

      write(i_file77,'(F10.3,3x,f15.3,1x,f15.3,1x,f15.3,1X,F15.3,1X,
     1F10.3,1x,f10.3,f10.3,1x,f10.3,1x,f10.3,1X,f10.3,1X,F10.3)')  ! modificato il 11/7/2017
    !1t_minuti, Q_out_interne(jj), FreeSurf_interne_medio(jj), 
     1 t_dopo, Q_out_sez(jj), FreeSurf_sez(jj), ele_interno_medio(jj), 
     1ele_iniz_interno_medio(jj), Flow_depth_sez(jj), spessore_sez(jj), 
     1Conc_sez(jj), Q_uscita_sez(jj), Q_uscita_solido_sez(jj),   ! aggiunto il 11/7/2017
     1Q_uscitatot_sez(jj), Q_uscita_solidotot_sez(jj)   ! aggiunto il 11/7/2017  
   
     
      Conc_med(jj) = 0.0
      Ele_medio(jj) = 0.0
      FRSURF_medio(jj) = 0.0
      Q_int_medio(jj) = 0.0
      Flow_depth_medio(jj) = 0.0    ! 21/7/2017
      Ele_iniz_medio(jj) = 0.0   ! 21/7/2017
      T_intervallo_calcolo(jj) = 0.0
      T_intervallo_calcoloELE(jj) = 0.0  ! 21/07/2017
      spessore_medio(jj) = 0.0    ! 21/7/2017
      Q_uscita_medio(jj) = 0.0
      Q_uscita_solido_medio(jj) = 0.0
      Q_uscita_sez_medio(jj) = 0.0
      Q_uscita_solido_sez_medio(jj) = 0.0
      
        enddo
!$OMP end do nowait
!$OMP single
       i_DQ = 0.0
         
       write(10,*)
     
      flag_int(i_file_out) = 1.0
      i_file_out = i_file_out + 1

    !  if (t(ii+1).eq.tempo_finale)  flag_int_tempo_finale = 1.0
      
      if (t_dopo.eq.tempo_finale)  flag_int_tempo_finale = 1.0     !  14/01/2013
!$OMP end single nowait     
      endif  ! relativo a T_intervallo
      endif
      
      endif
      
      else
!$OMP single      
       tempo_scrittura_interfaccia = tempo_scrittura_interfaccia + DT
       
	 if (tempo_scrittura_interfaccia.gt.120) then
	 
	   tempo_scrittura = 1.0
	     tempo_scrittura_interfaccia = 0.0
	     
	     else
	     
	     tempo_scrittura = 0.0
	     
	     endif      
!$OMP end single nowait     
      endif 
      


*****************************************************************
*              AZZERAMENTO VARIABILI EROSIONE/DEPOSITO
*****************************************************************
!$OMP do private(icol, irow)
!$OMP& schedule(monotonic: dynamic)      
	do irow = 1, no_rows
	    do icol = 1, no_columns
            if (ele(icol,irow).ne.esterno) then
               cell_eros(icol,irow) = 0
               Q_entrata(icol,irow) = 0.0
               if (Intern_Output.eq.1.0)  then
                  dh_uscita_tot(icol,irow) = 0.0
                  dh_uscita_solido_tot(icol,irow) = 0.0
                  dh_uscita_sez(icol,irow) = 0.0
                  dh_uscita_solido_sez(icol,irow) = 0.0    
               endif
               
            endif
          enddo
      enddo
!$OMP end do nowait

!$OMP single firstprivate(cel_max_sor, cel_max)
c Point 3.3 Calcolo dt
       tt1_9 = omp_get_wtime() 
      t_prima = t
      t = t_dopo

      if (cel_max_sor.gt.cel_max) cel_max = cel_max_sor

      if (cel_max.gt.0.0) then

       IF (cel_max.gt.50.0) cel_max = 50.0  !  8 Settembre 2017
        
        DT = Courant*lato_cella/cel_max
        !DT =0.5 !CEL_fissa

        !
	else
	
	  write(10,'("WARNING MAX CELERITY AFTER TIME STEP",1x,I10," IS 0:   
     1no flow")') 
        
        
        
     
       write(10,'("time step is setted to 5 seconds")') 

	   DT = 5.0
	   
	endif
	      
      t_dopo = t + DT   ! 15/01/2013
        
      if (tempo_scrittura2.eq.1.0) then
 
      write(30,'(" time step and simulation time (seconds)",1x,f12.5,2x,
     1f25.5,2x,f25.5)') DT, t_dopo

	write(30,*)

	endif
	write(10,'(" simulation time and time step (seconds)",2x,3f25.5)')      
     1 DT, t_dopo

!$OMP end single nowait 
      
!$OMP single 
!$OMP& firstprivate(VOLUME_ENTRATO_IDRO_1,VOLUME_ENTRATO_IDRO)
!$OMP& firstprivate(VOLSOL_ENTRATO_IDRO_1,VOLSOL_ENTRATO_IDRO)
!$OMP& firstprivate(V_entrato_DT_1,V_entrato_DT)
!$OMP& firstprivate(Vaffluito_1,Vaffluito_2)
!$OMP& firstprivate(V_solid_input_DT,V_solid_input_DT_1)
!$OMP& private(VOLUME_ENTRATO_IDROGRAMMI,VOLSOL_ENTRATO_IDROGRAMMI)
       tt1_12 = omp_get_wtime() 
      VOLUME_ENTRATO_IDROGRAMMI = VOLUME_ENTRATO_IDRO_1 +
     1 VOLUME_ENTRATO_IDRO
      VOLSOL_ENTRATO_IDROGRAMMI = VOLSOL_ENTRATO_IDRO_1 +
     1 VOLSOL_ENTRATO_IDRO
      V_entrato_DT = V_entrato_DT + V_entrato_DT_1
      V_entrato = V_entrato + V_entrato_DT_1
      V_solid_input_DT = V_solid_input_DT + V_solid_input_DT_1
      V_solid_input = V_solid_input + V_solid_input_DT_1
      Vaffluito = Vaffluito + Vaffluito_1 + Vaffluito_2
      Check_massa = abs(V_entrato-VOLUME_ENTRATO_IDROGRAMMI)/V_entrato

c Point 1.3 Verifica calolo volumi in ingresso 

      if (Check_massa.gt.0.02) write(10,'("MASS CONSERVATION OF INPUT 
     1HYDROGRAPH NOT RESPECTED",4f14.4)')
     iV_entrato,VOLUME_ENTRATO_IDROGRAMMI
      
        if (Check_massa.gt.Check_massa_max) then
      
          Check_massa_max = Check_massa
          t_check_massa_max = t
     
        endif       
        
      Check_VS = abs(V_solid_input-VOLSOL_ENTRATO_IDROGRAMMI)/
     1V_solid_input
      
      if (Check_VS.gt.0.02) write(10,'("SOLID CONSERVATION OF INPUT 
     1HYDROGRAPH NOT RESPECTED")')
     
        if (Check_VS.gt.Check_VS_max) then
      
          Check_VS_max = Check_VS
          t_check_VS_max = t
          
        endif 
!$OMP end single nowait      
    
!$OMP single
      V_eros_step = 0.0
	V_dep_step = 0.0
!$OMP end single nowait
!$OMP single 
	V_eros_step_A = 0.0
	V_dep_step_A = 0.0
!$OMP end single nowait
!$OMP single 
	V_eros_step_B = 0.0
	V_dep_step_B = 0.0
	V_dep_step_C = 0.0
!$OMP end single nowait
!$OMP single 	
	V_eroso_prima = V_eroso
	V_depositato_prima = V_depositato
!$OMP end single nowait
!$OMP single 	
	Volume_solido_depositato_prima = Volume_solido_depositato
	Volume_solido_eroso_prima = Volume_solido_eroso
!$OMP end single nowait
!$OMP single 
	V_eroso = 0.0
	V_depositato = 0.0
	
	V_step = 0.0
	
	volume_solido_intrappolato_STEP = 0.0

!$OMP end single nowait
!$OMP single  
      if (t_prima.gt.t_minimo+(tempo_finale-t_minimo)/10*
     1     index_timing) then
        write (0,'(" Percentuale di esecuzione completata ", i3, "%")')
     1index_timing*10
        index_timing=index_timing+1
      endif
!$OMP end single nowait
!$OMP single 
c Point 1.0
        ii = ii + 1
!$OMP end single nowait

!$OMP single

        
        Volume_solido_eroso_step = 0.0
        Volume_solido_depositato_step = 0.0   
!$OMP end single nowait
!$OMP single
        Volume_solido_eroso = 0.0
        Volume_solido_depositato = 0.0
        V_solido_fuoriuscito_DT = 0.0
        V_fuori_uscito_DT = 0.0
        Q_CONTORNO_TOTALE = 0.0
!$OMP end single nowait
!$OMP single
        Num_celle_routing_old = Num_celle_routing
        i_eros = 0
        j_vel = 0
        cq = 0.385
        V_input = 0
!$OMP end single nowait

! $OMP end single


	

*******************************************************
*point 17.0 Controllo ostruzione ponti  5/12/2019
*******************************************************
 
      if (N_ponti.gt.0) then


!$OMP do 
!$OMP& private (i,j)
!$OMP& schedule(monotonic: dynamic)
      do i = 1, N_ponti

      if (ponte_ostruito(i).eq.0.0) then
      
      do j = 1, N_celle_ponti(i)

      quota_critica_ponte(ic_ponti(i,j),ir_ponti(i,j)) = 
     1ele_ponti(ic_ponti(i,j),ir_ponti(i,j)) - soletta(i) - franco(i)

      if (h_tot(ic_ponti(i,j),ir_ponti(i,j)).ge.
     1quota_critica_ponte(ic_ponti(i,j),ir_ponti(i,j)))  then

      ponte_ostruito(i) = 1.0
      
      write(*,*) "Ponte ostruito"
       write(10,*)"Ponte ostruito"


      endif
      
      enddo

      endif

      ! cambio DEM per ponte ostruito
      ! quando il ponte viene ostruito per la prima volta l'ID ostruzione
      !passa da 0 ad 1; eseguita l'ostruzione l'ID ostruzione passa a 2

      if (ponte_ostruito(i).eq.1.0) then

      do j = 1,N_celle_ponti(i)

      ele(ic_ponti(i,j),ir_ponti(i,j)) = 
     1ele_ponti(ic_ponti(i,j),ir_ponti(i,j)) 

      diff_ponti(i,j) = ele_ponti(ic_ponti(i,j),ir_ponti(i,j)) -
     1  h_tot(ic_ponti(i,j),ir_ponti(i,j))

      h_tot(ic_ponti(i,j),ir_ponti(i,j)) = 
     1ele_ponti(ic_ponti(i,j),ir_ponti(i,j))

      h(ic_ponti(i,j),ir_ponti(i,j)) = 0.0

      Eros_tot(ic_ponti(i,j),ir_ponti(i,j)) = 0.0 !Bernard
      ele_iniz(ic_ponti(i,j),ir_ponti(i,j)) = 
     1ele_ponti(ic_ponti(i,j),ir_ponti(i,j))

      h_noerod(ic_ponti(i,j),ir_ponti(i,j))=
     1ele(ic_ponti(i,j),ir_ponti(i,j)) 

      No_erod(ic_ponti(i,j),ir_ponti(i,j))= 1.0

        enddo
        
              ponte_ostruito(i) = 2.0

      endif

      enddo
!$OMP end do nowait 

      endif  ! fine calcolo ponti
!$OMP single firstprivate(tt12)
     
     !! write (1299,'(i8,12f18.6)') ii, tt2-tt1,tt3-tt2,tt4-tt3,tt5-tt4,
     !!1 tt6-tt5,
     !!1 tt7-tt6,tt8-tt7,tt9-tt8,tt10-tt9,tt11-tt10,tt12-tt11
     !! Write (1399,'(i8,12f14.6)')ii,tt1,tt2,tt3,tt4,tt5,tt6,tt7,tt8,tt9,
     !!1 tt10,tt11,tt12

!$OMP end single nowait

     
!$OMP single 
        V_entrato_t1 = V_entrato
        V_solid_input_t1 = V_solid_input
!$OMP end single nowait

      end do   ! chiusura ciclo
!$OMP end parallel
      
**************************************************************************************
**************************************************************************************     
********                     fine ciclo do while t                            ********
**************************************************************************************
**************************************************************************************
      
    !  t_simulaz_finale = t(ii+1)
      
       t_simulaz_finale = t_dopo  ! 14/01/2013

	! if (t_simulaz_finale.eq.0.0) t_simulaz_finale = t(ii)   ! aggiunta 11/12/2012
	
	 if (t_simulaz_finale.eq.0.0) t_simulaz_finale = t   ! aggiunta 11/12/2012 e modificata il 14/01/2013
	
	sugg4 =  "  suggested time steps:"

	if (t_simulaz_finale.lt.tempo_finale) then

	DT_medio = t_simulaz_finale/float(ii)

	N_sugg =  N_stati + 
	1int(0.9*(tempo_finale - t_simulaz_finale)/DT_medio)

          	
	write(30,'(" Warning: final time inferior to simulation time:")')
	write(30,'(" time steps number not enough")')
	write(30,*)
	write(30,1118) sugg4, N_sugg
1118  format(1x,a30,1x,I20)

      write(10,'("Warning: final time inferior to simulation time:")')
	write(10,'("time steps number not enough")')
	write(10,*)
	write(10,1118) sugg4, N_sugg

	endif

	
********************************************************************
*  APERTURA FILE RISULTATI FINALI (29 MARZO 2013)
*********************************************************************

       
	retint = scan (fileLog,'.')
      if (retint > 1) then
	     file_finale = fileLog(1:retint-1)//'.ris'
      endif



		open ( 210000,file=file_finale)
       


	ttt = " simulation end time (sec.) and total time steps number"

	write(30,179) ttt, t_simulaz_finale, ii
179   format(a55,f25.1,1x,i25)
      WRITE(30,*)
	WRITE(30,*)

	write(10,179) ttt, t_simulaz_finale, ii
      WRITE(10,*)
	WRITE(10,*)
	
	WRITE(210000,*)
	WRITE(210000,'("FINAL RESULTS OF SIMULATION")')
	WRITE(210000,*)
	WRITE(210000,*)
	write(210000,179) ttt, t_simulaz_finale, ii
      WRITE(210000,*)
	WRITE(210000,*)

	h_totale = 0.0
	V_total = 0.0
      total_eros = 0.0
	V_eros = 0.0
	total_solid = 0.0
	V_solid = 0.0
      ttt = "  simulation computing time (seconds)"
1121  format(1x,I5,2x,3f15.4)      
c apertura file di final output
       file_name2 = "pre_final_flow_depth.flt"
	retint = scan (fileLog,'.')
      if (retint > 1) then
	     file_finale = fileLog(1:retint-1)//'_'//file_name2
      endif

		open ( 26,file=file_finale,form='BINARY')

		retint = scan (file_finale,'.')
      if (retint > 1) then
       fileHeader = file_finale(1:retint-1)//'.hdr'
      if (fileHeader /= fileFormat) call HdrWrite (fileHeader)
      endif
      
		file_name2 = "pre_final_elevation.flt"
	retint = scan (fileLog,'.')
      if (retint > 1) then
	     file_finale = fileLog(1:retint-1)//'_'//file_name2
      endif

		open ( 27,file=file_finale,form='BINARY')


		retint = scan (file_finale,'.')
      if (retint > 1) then
       fileHeader = file_finale(1:retint-1)//'.hdr'
      if (fileHeader /= fileFormat) call HdrWrite (fileHeader)
      endif


		file_name2 = "pre_final_eros_deposit.flt"
	retint = scan (fileLog,'.')
      if (retint > 1) then
	     file_finale = fileLog(1:retint-1)//'_'//file_name2
      endif

		open ( 28,file=file_finale,form='BINARY')


		retint = scan (file_finale,'.')
      if (retint > 1) then
       fileHeader = file_finale(1:retint-1)//'.hdr'
      if (fileHeader /= fileFormat) call HdrWrite (fileHeader)
      endif


		file_name2 = "pre_Final_Area_dep_eros.flt"
	retint = scan (fileLog,'.')
      if (retint > 1) then
	     file_finale = fileLog(1:retint-1)//'_'//file_name2
      endif

		open ( 29,file=file_finale,form='BINARY')


		retint = scan (file_finale,'.')
      if (retint > 1) then
       fileHeader = file_finale(1:retint-1)//'.hdr'
      if (fileHeader /= fileFormat) call HdrWrite (fileHeader)
      endif


		file_name2 = "pre_final_conc.flt"
	retint = scan (fileLog,'.')
      if (retint > 1) then
	     file_finale = fileLog(1:retint-1)//'_'//file_name2
      endif

		open ( 31,file=file_finale,form='BINARY')


		retint = scan (file_finale,'.')
      if (retint > 1) then
       fileHeader = file_finale(1:retint-1)//'.hdr'
      if (fileHeader /= fileFormat) call HdrWrite (fileHeader)
      endif
      
      	file_name2 = "pre_final_ws.flt"
	retint = scan (fileLog,'.')
      if (retint > 1) then
	     file_finale = fileLog(1:retint-1)//'_'//file_name2
      endif

		open ( 32,file=file_finale,form='BINARY')


		retint = scan (file_finale,'.')
      if (retint > 1) then
       fileHeader = file_finale(1:retint-1)//'.hdr'
      if (fileHeader /= fileFormat) call HdrWrite (fileHeader)
      endif

      
!$OMP parallel num_threads(CPUs)
!$OMP do private(j,jj)
!$OMP& reduction(+: h_totale, h_totale_routing,total_eros)
!$OMP& reduction(+: total_solid)
!$OMP& schedule(monotonic: dynamic)
      do j = 1,no_rows
	 do jj = 1, no_columns
         Area_dep_eros_ultimo_step(jj,j) = esterno
         
	   if (ele(jj,j).ne.esterno) then 
	
              h_totale = h_totale + h(jj,j)
          			Area_dep_eros_ultimo_step(jj,j) = 0.0
			
		 if (Eros_tot(jj,j).lt.0.0)  then	
			
			Area_dep_eros_ultimo_step(jj,j) = 1.0

          endif

	    if (Eros_tot(jj,j).gt.0.0)  then	
			
			Area_dep_eros_ultimo_step(jj,j) = 2.0

	    endif
		
	    if (h(jj,j).ge.h_routing) then

            h_totale_routing = h_totale_routing + h(jj,j)

	    endif

         endif
         if (Eros_tot(jj,j).ne.esterno) then

	     total_eros = total_eros + Eros_tot(jj,j)
	     total_solid = total_solid + C_fondo(jj,j)*Eros_tot(jj,j)

	   endif

       enddo

      enddo 
      
      
!$OMP end do
!$omp SINGLE 
      V_eros = total_eros*lato_cella*lato_cella
	V_solid = total_solid*lato_cella*lato_cella
      V_total = h_totale*lato_cella*lato_cella
	V_total_routing = h_totale_routing*lato_cella*lato_cella
      check_massa = check_massa*100.0
	string = "  time (sec.) of the flow depth file number n."

!$OMP END SINGLE nowait
c         file di output raster  celle allagate - tempi di allagamento 
!$omp Sections private(ir,ic)
!$OMP section 
      do ir = 1, no_rows
       write  (50) (val_tempi(ic,ir),ic=1,no_columns) 
      end do
!$OMP section
      do ir = 1, no_rows
       write  (21) (V_contorno(ic,ir),ic=1,no_columns) 
	
      enddo
!$OMP section
      do ir = 1, no_rows
       write (4) (ele(ic,ir), ic = 1, no_columns)
      enddo
!$OMP end sections
!$OMP end parallel
      do i = 1, N_file_output

	  write(30,1120) string, i, tempo_file(i)
1120  format(1x,a60,I5,2x,f15.4)     
      enddo
      
      write(30,*)
      write(30,'("  input volume",24x,f11.1)') V_entrato
	write(30,*)
      write(30,'("  input solid volume (m^3)",24x,f11.1)') V_solid_input
      write(30,'(" final check mass conservation of input volume:")')
	write(30,'(" relative difference (%) about ",1x,f12.5)') check_massa 
	write(30,'(" largest relative difference during simulation:"
	1,1x,f12.5)') check_massa_max
	write(30,'(" at time (seconds):",1x,f12.5)') t_check_massa_max
	write(30,*)
      write(30,178) V_total
      write(30,*)
      write(30,1788) V_total_routing 
      write(30,'(" routing solid volume (m3) ",15x,f20.5)')
	1 Volume_solido
      write(30,*)
      write(30,'("  outflow volume (m^3)",3x,f14.2)')
	1V_fuori_uscito_totale
	write(30,*)
	write(30,*)
	write(30,'(" total solid volume out (m^3)",11x,f14.2)')
	1V_solido_fuori_uscito_totale
	write(30,*)
   	write(30,'("without deposition of flow depth less than minimum 
	1flow depth")')
	write(30,'(''  Total eroded (-)/deposited (+) sediment volume (m^3)
	1'')')
	write(30,'(f15.3)') V_eros
	write(30,*)
	write(30,'(''  Total eroded (-)/deposited (+) solid volume (m^3)
	1'')')
	write(30,'(f15.3)') V_solid
	write(30,*)

      do i = 1, N_file_output
        write(10,1120) string, i, tempo_file(i)
      enddo
    
      write(10,*)
	write(10,'("  input volume",24x,f11.1)') V_entrato
	write(10,*)
      write(10,'("  input solid volume (m^3)",24x,f11.1)') V_solid_input
      write(10,'(" final check mass conservation of input volume:")')
	write(10,'(" relative difference (%) about ",1x,f12.5)') check_massa 
	write(10,'(" largest relative difference during simulation:"
	1,1x,f12.5)') check_massa_max
	write(10,'(" at time (seconds):",1x,f12.5)') t_check_massa_max
	write(10,*)
      write(10,178) V_total
178   format(1x,'  Flux volume (m^3)',1x,f25.4)
	write(10,*)
      write(10,1788) V_total_routing
1788  format(1x,'  Routing volume (m^3)',1x,f25.4)    
      write(10,'(" routing solid volume (m3) ",15x,f20.5)')
	1 Volume_solido
      write(10,*)
      	write(10,'("  outflow volume (m^3)",3x,f14.2)')
	1V_fuori_uscito_totale
	write(10,*)
      write(10,*)
      write(10,'(" total solid volume out (m^3)",11x,f14.2)')
	1V_solido_fuori_uscito_totale
	write(10,*)
	write(10,'("without deposition of flow depth less than minimum 
	1flow depth")')
	write(10,'(''Total eroded (-)/deposited (+) sediment volume (m^3)
	1'')')
     	write(10,'(f15.3)') V_eros
     	write(10,*)

	write(10,'(''Total eroded (-)/deposited (+) solid volume (m^3)
	1'')')
	write(10,'(f15.3)') V_solid
	write(10,*)
      
    
      ! modifica del 1/8/2017
      
      string_1 = " time step number, time (sec.), Entrained volume (m3),
     1 Solid Entrained Volume (m3)"
      write(210000,'(a150)') string_1
      write(210000,*)

      do i = 1, N_file_output
      write(210000,1121) i, tempo_file(i), VolumeEntrato(i), 
     1VolumeSolidoEntrato(i)   ! 1/8/2017

      enddo
           
      write(210000,*)
      write(210000,'("  input volume",24x,f11.1)') V_entrato
	write(210000,*)
	write(210000,'("  input solid volume (m^3)",24x,f11.1)') V_solid_input
	write(210000,'(" final check mass conservation of input volume:")')
	write(210000,'(" relative difference (%) about ",1x,f12.5)')check_massa
	write(210000,'(" largest relative difference during simulation:"
	1,1x,f12.5)') check_massa_max
	write(210000,'(" at time (seconds):",1x,f12.5)') t_check_massa_max
	write(210000,*)
      write(210000,178) V_total
      write(210000,*)
	write(210000,1788) V_total_routing
      write(210000,'(" routing solid volume (m3) ",15x,f20.5)')
	1 Volume_solido
      write(210000,*)
      	write(210000,'("  outflow volume (m^3)",3x,f14.2)')
	1V_fuori_uscito_totale
	write(210000,*)
      write(210000,*)
      write(210000,'(" total solid volume out (m^3)",11x,f14.2)')
	1V_solido_fuori_uscito_totale
      write(210000,*)
      write(210000,'("without deposition of flow depth less than minimum
	1flow depth")')
      write(210000,'(''Total eroded (-)/deposited (+) sediment volume 
	1(m^3)'')')
	write(210000,'(f15.3)') V_eros
     	write(210000,*)
	write(210000,'(''Total eroded (-)/deposited (+) solid volume (m^3)
	1'')')
	write(210000,'(f15.3)') V_solid
      write(210000,*)

      
      

            
      
	
	if (controllo_inerodibilita.eq.1.0) then
	
		
	do j = 1,no_rows
	 do jj = 1, no_columns
	 
	   IF (no_erod(jj,j).eq.1.0) THEN

          if (Eros_tot(jj,j).lt.0.0) then

          WRITE(10,'("IC    IR  =",2X,2i7)') jj, j
          write(10,'("erosion depth = ",2x,f25.15)') Eros_tot(jj,j)
          write(10,'("no erodible elevation",2x,f25.15)') h_noerod(jj,j)
          write(10,'("elevation ",2x,f25.15)') ele(jj,j)
          write(10,*)
          
          endif
          
          
          
           if (ele(jj,j).lt.h_noerod(jj,j)) then

          WRITE(10,'("IC    IR  =",2X,2i7)') jj, j
          write(10,'("no erodible elevation",2x,f25.15)') h_noerod(jj,j)
          write(10,'("elevation ",2x,f25.15)') ele(jj,j)
          write(10,'("erosion depth = ",2x,f25.15)') Eros_tot(jj,j)
          write(10,*)
          
          avvertenza_erosione_quota_inerodibile = 1.0
	   
          
          endif

         ENDIF
         
         enddo
         enddo
         
         if (avvertenza_erosione_quota_inerodibile.eq.1.0) then
         
         
      write(10,*)
	write(10,*)
	write(10,'("ARMOURED AREAS SUBJECT TO EROSION")')
	WRITE(10,*)
	WRITE(10,*)
	
	endif
         
         endif
        	 
*************************************************************************************************
*   FILE FINALI PRIMA DEL DEPOSITO DEL FLUSSO MINORE DEL minimum flow routing depth  (7/2/2016)
*************************************************************************************************



       allocate (h_finale2(no_columns,no_rows))
	 allocate (erosione_finale2(no_columns,no_rows)) 
	 allocate (ele_finale2(no_columns,no_rows))
	 allocate (h_tot_finale2(no_columns,no_rows))   
	 allocate (conc_finale2(no_columns,no_rows))
	 allocate (Area_dep_eros_finale2(no_columns,no_rows))
         
!$OMP parallel num_threads(CPUs)
!$OMP do private(j,jj)
!$OMP& schedule(monotonic: dynamic)
      do j = 1,no_rows
	 do jj = 1, no_columns

 
	  Area_dep_eros_finale2(jj,j) = esterno

	   if (ele(jj,j).ne.esterno) then 
          h_finale2(jj,j) = h(jj,j)
	    erosione_finale2(jj,j) =  Eros_tot(jj,j)
	    ele_finale2(jj,j) = ele(jj,j) 
	    h_tot_finale2(jj,j) = h_tot(jj,j)   
	    conc_finale2(jj,j) = conc(jj,j) 
          Area_dep_eros_finale2(jj,j) = 0.0
          if (erosione_finale2(jj,j).lt.0.0)  then	
            Area_dep_eros_finale2(jj,j) = 1.0
	    endif
	    if (erosione_finale2(jj,j).gt.0.0)  then	
		  Area_dep_eros_finale2(jj,j) = 2.0
	    endif
         else
          h_finale2(jj,j) = esterno
	    erosione_finale2(jj,j) = esterno
	    ele_finale2(jj,j) = esterno
	    h_tot_finale2(jj,j) = esterno   
	    conc_finale2(jj,j) = esterno   
	   end if
	  enddo
      enddo
!$OMP end do
      
!$OMP sections private(ir,ic)
!$OMP section
 
      do ir = 1, no_rows
              write (26) (h_finale2(ic,ir),ic=1,no_columns)
      end do
!$OMP section
      do ir = 1, no_rows
	        write (27) (ele_finale2(ic,ir), ic = 1, no_columns)
	end do
!$OMP section
      do ir = 1, no_rows        
              write (28) (erosione_finale2(ic,ir), ic = 1, no_columns)
      end do
!$OMP section
      do ir = 1, no_rows	        
           write (29) (Area_dep_eros_finale2(ic,ir), ic = 1, no_columns)
      end do
!$OMP section
      do ir = 1, no_rows	        	        
              write (31) (conc_finale2(ic,ir), ic = 1, no_columns)
      end do
!$OMP section
      do ir = 1, no_rows	        
              write (32) (h_tot_finale2(ic,ir), ic = 1, no_columns)
	enddo
!$OMP end sections
!$OMP end parallel


      close (26)
	close (27)
	close (28)
	close (29)
	close (31)
	close (32)
	close(21)
	close(50)
	close(4)
	
		
  
      V_eros_prima = V_eros   
      total_eros = 0.0
	V_eros = 0.0
	total_solid = 0.0
	V_solid = 0.0   
      
           
**********  DEPOSITO h < h_routing  **************   21/12/2010
!$OMP parallel num_threads(CPUS)
!$OMP do private(j,jj)
!$OMP& reduction (+:  total_eros,total_solid )
!$OMP& schedule(monotonic: dynamic)
       do j = 1,no_rows
	 do jj = 1, no_columns

	        if (ele(jj,j).ne.esterno) then 

                  if (h(jj,j).lt.h_routing) then

	    h_finale(jj,j) = 0.0
	    erosione_finale(jj,j) = Eros_tot(jj,j) + h(jj,j)
	    ele_finale(jj,j) = ele(jj,j) + h(jj,j)
	    Solid_tot(jj,j) = C_fondo(jj,j)*Eros_tot(jj,j) + Conc(jj,j)*h(jj,j)
	    conc_finale(jj,j) = 0.0  ! 30/1/2015
	    h_tot_finale(jj,j) = 0.0    ! 30/1/2015

	          else


          h_finale(jj,j) = h(jj,j)
	    erosione_finale(jj,j) =  Eros_tot(jj,j)
	    ele_finale(jj,j) = ele(jj,j) 
	    solid_tot(jj,j) = C_fondo(jj,j)*Eros_tot(jj,j)
	    h_tot_finale(jj,j) = h_tot(jj,j)    ! 30/1/2015
	    conc_finale(jj,j) = conc(jj,j)  ! 30/1/2015

                endif

          total_eros = total_eros + erosione_finale(jj,j)
          total_solid = total_solid + solid_tot(jj,j)
          Area_dep_eros_finale(jj,j) = 0.0 
          if (erosione_finale(jj,j).lt.0.0)  then	
			
			Area_dep_eros_finale(jj,j) = 1.0

	    endif

	    if (erosione_finale(jj,j).gt.0.0)  then	
			
			Area_dep_eros_finale(jj,j) = 2.0

	    endif
          else
                  
          h_finale(jj,j) = esterno
	    erosione_finale(jj,j) = esterno
	    ele_finale(jj,j) = esterno
	    solid_tot(jj,j) = esterno 
	    h_tot_finale(jj,j) = esterno   ! 30/1/2015
	    conc_finale(jj,j) = esterno    ! 30/1/2015
           Area_dep_eros_finale(jj,j) = esterno        
                  endif
       end do
       end do
 
!$OMP end do

!$OMP sections private( asse1,i_coord_t,i_coord_Q,j)
!$OMP& private( iiiiii, i, jjjj)
!$OMP section 
	V_eros = total_eros*lato_cella*lato_cella
	V_solid = total_solid*lato_cella*lato_cella
	
	write(10,*)
	write(30,*)
	write(210000,*) 
	
	
	write(10,'("after deposition of flow depth less than minimum flow 
     1depth")')
      write(30,'("after deposition of flow depth less than minimum flow 
     1depth")')
	
	write(210000,'("after deposition of flow depth less than minimum flow 
     1depth")') 
	
	write(10,*)
	write(30,*)
	write(210000,*) 
	
	write(30,'(''  Total eroded (-)/deposited (+) sediment volume (m^3)
	1'')')
	write(30,'(f15.3)') V_eros

	write(10,'(''Total eroded (-)/deposited (+) sediment volume (m^3)
	1'')')
	write(10,'(f15.3)') V_eros
	
	write(210000,'(''Total eroded (-)/deposited (+) sediment volume (m^3)
	1'')')
	write(210000,'(f15.3)') V_eros

		write(30,*)
	write(10,*)
	write(210000,*)
	
	write(30,'(''  Total eroded (-)/deposited (+) solid volume (m^3)
	1'')')
	write(30,'(f15.3)') V_solid
      write(30,*)

	write(10,'(''Total eroded (-)/deposited (+) solid volume (m^3)
	1'')')
	write(10,'(f15.3)') V_solid
	
	write(210000,'(''Total eroded (-)/deposited (+) solid volume (m^3)
	1'')')
	write(210000,'(f15.3)') V_solid


	write(10,*)
	write(210000,*)
	

!*********************************************************************************
!  file volumi entrained nel tempo   5 MARZO 2012 e modifica del 14/01/2013
!*********************************************************************************
!$OMP section 
       V_entrained_step = (-1.0)*V_entrained_step
	
			write(25,'(" V_entrain_step = [")')

							

	

       do j = 1, j_entr-1

	write(25,'(2F16.2)') t_step_entrain(j), V_entrained_step(j)

   


       enddo


	write(25,'(" ];")')

	write(25,*)
	write(25,*)

	write(25,'(" V_entrain = [")')

							
         V_entrained_tot = (-1.0)*V_entrained_tot
	

       do j = 1, j_entr-1

	write(25,'(2F16.1)') t_step_entrain(j), V_entrained_tot(j)

       enddo


	write(25,'(" ];")')


      write(25,*)
	write(25,*)

      do i = 1,1000000000

		  if (float(i).ge.V_eros) then

		     i_coord_Q = i + 1000

			 exit

			 endif

			 enddo

	
			 	do i = 1,1000000

		  if ((float(i)).ge.tt_max) then

		     i_coord_t = i + 300

			 exit

			 endif

			 enddo

			 write(asseq,'(i12)') i_coord_Q
			 write(asset,'(i8)') i_coord_t

		asse1 = "axis([0 " // asset // ' 0 ' // asseq // ' ])'

			

	write(25,'("plot(t_step_entrain, V_entrain_step,''-k'',
	1''LineWidth'',1.4),hold on")')
	write(25,'("plot(t_step_entrain, V_entrain,''-b'',
	1''LineWidth'',1.6)")')
    
	write(25,'("xlabel(''time (seconds)'')")')
	write(25,'("ylabel(''sediment deposition/erosion (m^3/s)'')")')
	write(25,'("legend(''incremental volume'',''cumulative volume''
	1)")')
	write(25,'(a50)') asse1

						



!$OMP section 
!*******************************************************
!  Fine file volumi entrained nel tempo   5 MARZO 2012
!*******************************************************


       
        write(22,'(" ];")')
        write(22,*)
	  write(22,*)

	Qmaxx = max(Qmax_contorno,Qmax_input)


	


      do i = 1,1000000000

		  if (float(i).ge.Qmaxx) then

              if (mod(i,10).eq.0) then

		       i_coord_Q = i + 10

	           exit

	        else

	        do jjjj = 1, 1000000000
	          iiiiii = i + jjjj

	          if (mod(iiiiii,10).eq.0) then

	           i_coord_Q = iiiiii + 10
	           exit
  	         endif
	        enddo

	        endif

			 endif

      enddo
      
	         tt_max = t/3600.0
	
			 	do i = 1,1000000

		  if ((float(i)).ge.tt_max) then

		     i_coord_t = i + 1

			 exit

			 endif

			 enddo

			 write(asseq,'(i12)') i_coord_Q
			 write(asset,'(i8)') i_coord_t

		asse1 = "axis([0 " // asset // ' 0 ' // asseq // ' ])'
						
      write(22,'("Qsol_out = Q_OUT(:,3).*Q_OUT(:,2);")')  ! aggiunto il 13/6/2015
       write(22,*)
					

	write(22,'("plot(Q_IN(:,1), Q_IN(:,2),''--k'',
	1''LineWidth'',1.8),hold on")')
	write(22,'("plot(Q_OUT(:,1),Q_OUT(:,2),''-k'',
	1''LineWidth'',1.6)")')
	write(22,'("plot(Q_OUT(:,1),Qsol_out,'':k'',
	1''LineWidth'',2.0)")')
    
	write(22,'("xlabel(''time (hrs)'')")')
	write(22,'("ylabel(''discharge (m^3/s)'')")')
	write(22,'("legend(''input'',''output'',''solid output'')")')
	write(22,'(a90)') asse1

!$OMP section 
	write(24,'(" ];")')


      write(24,*)
	write(24,*)

      do i = 1,1000000000

		  if (float(i).ge.V_entrato) then


	           if (mod(i,100).eq.0) then

		     i_coord_Q = i + 10

	          exit

	else

	         do jjjj = 1, 1000000000
	         iiiiii = i + jjjj

	 if (mod(iiiiii,100).eq.0) then

	 i_coord_Q = iiiiii + 100



	         exit

	      endif


	enddo

	        endif

			 endif

			 enddo

	

			 write(asseq,'(i12)') i_coord_Q
			 write(asset,'(i8)') i_coord_t

		asse1 = "axis([0 " // asset // ' 0 ' // asseq // ' ])'

			
					
	write(24,'("plot(data(:,1), data(:,2),''-k'',
	1''LineWidth'',1.5),hold on")')
	write(24,'("plot(data(:,1), data(:,3),'':k'',
	1''LineWidth'',1.8),hold on")')
      write(24,'("plot(data(:,1), data(:,4),''--k'',
	1''LineWidth'',1.6),hold on")')		
      write(24,'("plot(data(:,1), data(:,5),''--r'',
	1''LineWidth'',1.6),hold on")')	
      write(24,'("plot(data(:,1), data(:,6),''-r'',
	1''LineWidth'',1.6)")')			


    
	write(24,'("xlabel(''time (hrs)'')")')
	write(24,'("ylabel(''volumes (m^3)'')")')
	write(24,'("legend(''input'',''output''
	1)")')
	write(24,'(a90)') asse1


							
	write(210001,'(" ];")')

         write(210001,*)
	write(210001,*)	
	
	asse1 = "axis([0 " // asset // ' 0    1  ])'
			

      write(210001,'("plot(sedvolconc(:,1), sedvolconc(:,2),''-k'',
	1''LineWidth'',1.5),hold on")')
	
	write(210001,'("xlabel(''time (hrs)'')")')
	write(210001,'("ylabel(''sediment volumetric concentration'')")')
	
	write(210001,'(a90)') asse1
!$OMP end sections
!$OMP end parallel      

     	deallocate (sen_teta, senteta, peso, peso_d)
	
	allocate(magnitudo(no_columns,no_rows))
!!!! OPEN file resulte
      
!$OMP parallel sections num_threads(1)
!$OMP& private(file_finale, file_name2, fileHeader, ic, ir,num_open)
!$OMP& private( retint)   
	file_name2 = "final_flow_depth.flt"
	retint = scan (fileLog,'.')
      if (retint > 1) then
	     file_finale = fileLog(1:retint-1)//'_'//file_name2
      endif
      num_open=260
		retint = scan (file_finale,'.')
      if (retint > 1) then
       fileHeader = file_finale(1:retint-1)//'.hdr'
      if (fileHeader /= fileFormat) call HdrWrite1 (fileHeader,num_open)
      endif
      open (num_open,file=file_finale,form='BINARY')
      do ir = 1, no_rows
          write (num_open) (h_finale(ic,ir),ic=1,no_columns)
      end do
      close(num_open)

!$OMP section
      
	file_name2 = "final_elevation.flt"
	retint = scan (fileLog,'.')
      if (retint > 1) then
	     file_finale = fileLog(1:retint-1)//'_'//file_name2
      endif
      num_open=262
		retint = scan (file_finale,'.')
      if (retint > 1) then
       fileHeader = file_finale(1:retint-1)//'.hdr'
      if (fileHeader /= fileFormat) call HdrWrite1 (fileHeader,num_open)
      endif
      open (num_open,file=file_finale,form='BINARY')
      do ir = 1, no_rows 
        write (num_open) (ele_finale(ic,ir), ic = 1, no_columns)
	      end do
      close(num_open)

!$OMP section	
		
	file_name2 = "final_eros_deposit.flt"
	retint = scan (fileLog,'.')
      if (retint > 1) then
	     file_finale = fileLog(1:retint-1)//'_'//file_name2
      endif
      num_open=264
		retint = scan (file_finale,'.')
      if (retint > 1) then
       fileHeader = file_finale(1:retint-1)//'.hdr'
      if (fileHeader /= fileFormat) call HdrWrite1 (fileHeader,num_open)
      endif

      open (num_open,file=file_finale,form='BINARY')
      do ir = 1, no_rows
          	write (num_open) (erosione_finale(ic,ir), ic = 1, no_columns)
            end do
      close(num_open)
 
!$OMP section
      
	file_name2 = "Final_Area_dep_eros.flt"
	retint = scan (fileLog,'.')
      if (retint > 1) then
	     file_finale = fileLog(1:retint-1)//'_'//file_name2
      endif
      num_open=266

	retint = scan (file_finale,'.')
      if (retint > 1) then
       fileHeader = file_finale(1:retint-1)//'.hdr'
      if (fileHeader /= fileFormat) call HdrWrite1 (fileHeader,num_open)
      endif

	open (num_open,file=file_finale,form='BINARY')
	do ir = 1, no_rows
      write (num_open) (Area_dep_eros_finale(ic,ir), ic = 1, no_columns)
      end do
      close(num_open)

!$OMP section    
          
      file_name2 = "Last_step_dep_eros.flt"
	retint = scan (fileLog,'.')
      if (retint > 1) then
	     file_finale = fileLog(1:retint-1)//'_'//file_name2
      endif
      num_open=268

		retint = scan (file_finale,'.')
      if (retint > 1) then
       fileHeader = file_finale(1:retint-1)//'.hdr'
      if (fileHeader /= fileFormat) call HdrWrite1 (fileHeader,num_open)
      endif
      open (num_open,file=file_finale,form='BINARY')
      do ir = 1, no_rows
       write (num_open) (Area_dep_eros_ultimo_step(ic,ir), ic = 1,
     1  no_columns)
      end do
      close(num_open)

!$OMP section

	file_name2 = "final_ws.flt"
	retint = scan (fileLog,'.')
      if (retint > 1) then
	     file_finale = fileLog(1:retint-1)//'_'//file_name2
      endif
      num_open=270
		retint = scan (file_finale,'.')
      if (retint > 1) then
       fileHeader = file_finale(1:retint-1)//'.hdr'
      if (fileHeader /= fileFormat) call HdrWrite1 (fileHeader,num_open)
      endif
      
      open (num_open,file=file_finale,form='BINARY')
      do ir = 1, no_rows
        write (num_open) (h_tot_finale(ic,ir),ic=1,no_columns)       
      end do
      close (num_open)
  
!$OMP section     
      file_name2 = "final_conc.flt"
	retint = scan (fileLog,'.')
      if (retint > 1) then
	     file_finale = fileLog(1:retint-1)//'_'//file_name2
      endif
      num_open=272
		retint = scan (file_finale,'.')
      if (retint > 1) then
       fileHeader = file_finale(1:retint-1)//'.hdr'
      if (fileHeader /= fileFormat) call HdrWrite1 (fileHeader,num_open)
      endif
      
      open (num_open,file=file_finale,form='BINARY')       
      do ir = 1, no_rows 
	  write (num_open) (conc_finale(ic,ir), ic = 1, no_columns)
	enddo
	close (num_open)	
!$OMP section  	
	
	 file_name2 = "max_flow_depth.flt"
	retint = scan (fileLog,'.')
      if (retint > 1) then
	     file_finale = fileLog(1:retint-1)//'_'//file_name2
      endif
      num_open=274
      retint = scan (file_finale,'.')
      if (retint > 1) then
       fileHeader = file_finale(1:retint-1)//'.hdr'
      if (fileHeader /= fileFormat) call HdrWrite1 (fileHeader,num_open)
      endif
      
	open (num_open,file=file_finale,form='BINARY')      
      do ir = 1, no_rows
          write (num_open) (hh_max(ic,ir),ic=1,no_columns) 
	enddo
      close (num_open)
!$OMP section        
      
      file_name2 = "max_ws.flt"
	retint = scan (fileLog,'.')
      if (retint > 1) then
	     file_finale = fileLog(1:retint-1)//'_'//file_name2
      endif
      num_open=276
		retint = scan (file_finale,'.')
      if (retint > 1) then
       fileHeader = file_finale(1:retint-1)//'.hdr'
      if (fileHeader /= fileFormat) call HdrWrite1 (fileHeader,num_open)
      endif
      
      open (num_open,file=file_finale,form='BINARY')
      	    do ir = 1, no_rows
      write (num_open) (h_tot_max(ic,ir),ic=1,no_columns) 
		    enddo
      close (num_open)
!$OMP section        
      
      file_name2 = "max_conc.flt"
	retint = scan (fileLog,'.')
      if (retint > 1) then
	     file_finale = fileLog(1:retint-1)//'_'//file_name2
      endif
      num_open=278
		retint = scan (file_finale,'.')
      if (retint > 1) then
       fileHeader = file_finale(1:retint-1)//'.hdr'
      if (fileHeader /= fileFormat) call HdrWrite1 (fileHeader,num_open)
      endif
      
      open (num_open,file=file_finale,form='BINARY')
      do ir = 1, no_rows
        write (num_open) (conc_max(ic,ir),ic=1,no_columns) 
      enddo
      close (num_open)
 !$OMP section       
      
       file_name2 = "max_velocity.flt"
	retint = scan (fileLog,'.')
      if (retint > 1) then
	     file_finale = fileLog(1:retint-1)//'_'//file_name2
      endif
      num_open=280
		retint = scan (file_finale,'.')
      if (retint > 1) then
       fileHeader = file_finale(1:retint-1)//'.hdr'
      if (fileHeader /= fileFormat) call HdrWrite1 (fileHeader,num_open)
      endif
      
      open (num_open,file=file_finale,form='BINARY')      
      do ir = 1, no_rows
        write (num_open) (vel_cella_max(ic,ir),ic=1,no_columns) 
	enddo
      close (num_open)
!$OMP section  

    
       file_name2 = "max_velocit_out.flt"
	retint = scan (fileLog,'.')
      if (retint > 1) then
	     file_finale = fileLog(1:retint-1)//'_'//file_name2
      endif
      num_open=282
		retint = scan (file_finale,'.')
      if (retint > 1) then
       fileHeader = file_finale(1:retint-1)//'.hdr'
      if (fileHeader /= fileFormat) call HdrWrite1 (fileHeader,num_open)
      endif    
      open (num_open,file=file_finale,form='BINARY')      
      	    do ir = 1, no_rows
      write (num_open) (vel_max(ic,ir),ic=1,no_columns) 
		    enddo
      close (num_open)
!$OMP section  

         file_name2 = "max_direct_vel_out.flt"
	retint = scan (fileLog,'.')
      if (retint > 1) then
	     file_finale = fileLog(1:retint-1)//'_'//file_name2
      endif
      num_open=284
		retint = scan (file_finale,'.')
      if (retint > 1) then
       fileHeader = file_finale(1:retint-1)//'.hdr'
      if (fileHeader /= fileFormat) call HdrWrite1 (fileHeader,num_open)
      endif
      
	open (num_open,file=file_finale,form='BINARY')      
      	    do ir = 1, no_rows
      write (num_open) (direz_max(ic,ir),ic=1,no_columns) 
		    enddo
      close (num_open)
!$OMP section        
         
       file_name2 = "maxVx.flt"
	retint = scan (fileLog,'.')
      if (retint > 1) then
	     file_finale = fileLog(1:retint-1)//'_'//file_name2
      endif
      num_open=286
		retint = scan (file_finale,'.')
      if (retint > 1) then
       fileHeader = file_finale(1:retint-1)//'.hdr'
      if (fileHeader /= fileFormat) call HdrWrite1 (fileHeader,num_open)
      endif
	open (num_open,file=file_finale,form='BINARY')      
      
      do ir = 1, no_rows
        write (num_open) (Vx_max(ic,ir),ic=1,no_columns) 
	enddo
      close (num_open)
!$OMP section  	  
	  file_name2 = "maxVy.flt"
	retint = scan (fileLog,'.')
      if (retint > 1) then
	     file_finale = fileLog(1:retint-1)//'_'//file_name2
      endif
      num_open=288
		retint = scan (file_finale,'.')
      if (retint > 1) then
       fileHeader = file_finale(1:retint-1)//'.hdr'
      if (fileHeader /= fileFormat) call HdrWrite1 (fileHeader,num_open)
      endif
      open (num_open,file=file_finale,form='BINARY')
      
      do ir = 1, no_rows
        write (num_open) (Vy_max(ic,ir),ic=1,no_columns) 
	enddo
      close (num_open)
!$OMP section        
      
      file_name2 = "max_depth.flt"
	retint = scan (fileLog,'.')
      if (retint > 1) then
	     file_finale = fileLog(1:retint-1)//'_'//file_name2
      endif
      num_open=290
		retint = scan (file_finale,'.')
      if (retint > 1) then
       fileHeader = file_finale(1:retint-1)//'.hdr'
      if (fileHeader /= fileFormat) call HdrWrite1 (fileHeader,num_open)
      endif
		open (num_open,file=file_finale,form='BINARY')      
      
      do ir = 1, no_rows
        write (num_open) (spessore_max(ic,ir),ic=1,no_columns) 
	enddo

      close (num_open)
!$OMP section       
	
        call calcolo_magnitudo
        
         file_name2 = "magnitudo.flt"
	retint = scan (fileLog,'.')
      if (retint > 1) then
	     file_finale = fileLog(1:retint-1)//'_'//file_name2
      endif
      num_open=292
		retint = scan (file_finale,'.')
      if (retint > 1) then
       fileHeader = file_finale(1:retint-1)//'.hdr'
      if (fileHeader /= fileFormat) call HdrWrite1 (fileHeader,num_open)
      endif
      
	open (num_open,file=file_finale,form='BINARY')      
      	    do ir = 1, no_rows
      write (num_open) (magnitudo(ic,ir),ic=1,no_columns) 
		    enddo
		    
		    close(num_open)
  		   
**************************************************************************
*    SCRITTURA FILE SFORZO AL FONDO (27 APRILE 2015)
**************************************************************************		    
!$OMP section	

      file_name2 = "tauMax.flt"
	retint = scan (fileLog,'.')
      if (retint > 1) then
	     file_finale = fileLog(1:retint-1)//'_'//file_name2
      endif
      num_open=294
	retint = scan (file_finale,'.')
      if (retint > 1) then
       fileHeader = file_finale(1:retint-1)//'.hdr'
      if (fileHeader /= fileFormat) call HdrWrite1 (fileHeader,num_open)
      endif
      
      open (num_open,file=file_finale,form='BINARY')
      	    do ir = 1, no_rows
      write (num_open) (tauMax(ic,ir),ic=1,no_columns) 
		    enddo
		    
		    close(num_open)
		    
 !$OMP section		    
		    	     file_name2 = "tauMax_x.flt"
	retint = scan (fileLog,'.')
      if (retint > 1) then
	     file_finale = fileLog(1:retint-1)//'_'//file_name2
      endif
      num_open=296
		retint = scan (file_finale,'.')
      if (retint > 1) then
       fileHeader = file_finale(1:retint-1)//'.hdr'
      if (fileHeader /= fileFormat) call HdrWrite1 (fileHeader,num_open)
      endif
      
     		open (num_open,file=file_finale,form='BINARY') 
      	    do ir = 1, no_rows
      write (num_open) (tauMax_x(ic,ir),ic=1,no_columns) 
		    enddo
		    
		    close(num_open)
!$OMP section			    
		    	     file_name2 = "tauMax_y.flt"
	retint = scan (fileLog,'.')
      if (retint > 1) then
	     file_finale = fileLog(1:retint-1)//'_'//file_name2
      endif
      num_open=298
		retint = scan (file_finale,'.')
      if (retint > 1) then
       fileHeader = file_finale(1:retint-1)//'.hdr'
      if (fileHeader /= fileFormat) call HdrWrite1 (fileHeader,num_open)
      endif
      
		open ( num_open,file=file_finale,form='BINARY')      
      	    do ir = 1, no_rows
      write (num_open) (tauMax_y(ic,ir),ic=1,no_columns) 
		    enddo
		    
		    close(num_open)
              
!$OMP section
              		    	     file_name2 = "error_map.flt"
	retint = scan (fileLog,'.')
      if (retint > 1) then
	     file_finale = fileLog(1:retint-1)//'_'//file_name2
      endif
      num_open=299
		retint = scan (file_finale,'.')
      if (retint > 1) then
       fileHeader = file_finale(1:retint-1)//'.hdr'
      if (fileHeader /= fileFormat) call HdrWrite1 (fileHeader,num_open)
      endif
      
		open ( num_open,file=file_finale,form='BINARY')      
      	    do ir = 1, no_rows
      write (num_open) (error_map(ic,ir),ic=1,no_columns) 
		    enddo
		    
		    close(num_open)
!$OMP end parallel sections				
			    
      
*******************************************************************************
*   Calcolo sforzi platea da valori massimi
*******************************************************************************


        if (N_strutture.ge.1) then
        
       allocate (Tx_max(N_strutture))
       allocate (Ty_max(N_strutture))
       allocate (P_max(N_strutture))
       allocate (Valore_massimo_T(N_strutture))
       allocate (Valore_massimo_P(N_strutture))
       allocate (SV_max(N_strutture))
       allocate (Valore_massimo_SV(N_strutture))
       
	 
        
        do iii = 1, N_strutture
        Tx_max(iii) = 0.0
        Ty_max(iii) = 0.0
        P_max(iii)  = 0.0
        SV_max(iii)  = 0.0
        Valore_massimo_T(iii) = 0.0
        Valore_massimo_P(iii) = 0.0
        Valore_massimo_SV(iii) = 0.0
        enddo


       do ic = 1, no_columns
        do ir = 1, no_rows
        
           do iii = 1, N_strutture    !  aggiunta 21/07/2015
        if (Suolo(ic,ir).eq.codice_struttura(iii)) then
        
        Tx_max(iii) = Tx_max(iii) + tauMax_x(ic,ir)
        Ty_max(iii) = Ty_max(iii) + tauMax_y(ic,ir)

        P_max(iii) = P_max(iii) + Pmax(ic,ir)
         SV_max(iii) = SV_max(iii) + SVmax(ic,ir)
        
        if (tauMax(ic,ir).gt.Valore_massimo_T(iii)) 
     1Valore_massimo_T(iii) = tauMax(ic,ir)
     
       if (Pmax(ic,ir).gt.Valore_massimo_P(iii)) 
     1Valore_massimo_P(iii) = Pmax(ic,ir)

      if (SVmax(ic,ir).gt.Valore_massimo_SV(iii)) 
     1Valore_massimo_SV(iii) = SVmax(ic,ir)
                 
        
        endif
        enddo  ! ciclo strutture
                
        
        enddo
        enddo
        
        do iii = 1, N_strutture
        
        write(10,*)
        write(10,'("structure n. ",2x,I5)') iii
        write(10,*)
        write(10,*)
      write(10,'("VALORI SFORZI PLATEA (N/m^2) Tx, Ty N e P ottenuti per 
     1integrazione dei valori massimi per ogni singola cella")')
        write(10,*)
        write(10,'(4f20.1)') Tx_max, Ty_max, P_max, SV_max
        write(10,*)
        
       WRITE(210000,*)
       WRITE(210000,*)
      write(210000,'("VALORI SFORZI PLATEA (N/m^2) Tx, Ty N e P ottenuti 
     1per integrazione dei valori massimi per ogni singola cella")')
       
       WRITE(210000,*)
       write(210000,'(4f20.1)') Tx_max, Ty_max, P_max, SV_max
       WRITE(210000,*)
       
       
        write(10,*)
        write(10,*)
      write(10,'("VALORI MASSIMI SFORZI SU SINGOLA CELLA PLATEA (N/m^2) 
     1T, N e P ")')
        write(10,*)
        write(10,'(3f20.1)') Valore_massimo_T, Valore_massimo_P, 
     1Valore_massimo_SV
        write(10,*)
        
       WRITE(210000,*)
       WRITE(210000,*)
      write(210000,'("VALORI MASSIMI SFORZI SU SINGOLA CELLA PLATEA 
     1(N/m^2) T, N e P ")')
       
       WRITE(210000,*)
       write(210000,'(3f20.1)') Valore_massimo_T, Valore_massimo_P, 
     1Valore_massimo_P
       WRITE(210000,*)
       
       enddo
       
       endif  ! fine ciclo calcolo sforzi strutture

       !  CALCOLO VOLUME SEDIMENTO IMMESSO CON OSTRUZIONE

         do i = 1, N_ponti

         volume_ostruzione(i) = 0.0

         if (ponte_ostruito(i).eq.2.0) then

         do j = 1, N_celle_ponti(i)

         volume_ostruzione(i) = volume_ostruzione(i) + diff_ponti(i,j)

         enddo

         write(10,'("Ponte n. ",I5)')
         write(10,*)
         write(10,'("Volume ostruzione = ",f15.2)') volume_ostruzione(i)
         write(10,*)

         write(210000,'("Ponte n. ",I5)')
         write(210000,*)
         write(210000,'("Volume ostruzione = ",f15.2)') 
     1volume_ostruzione(i)
         write(210000,*)
         
         endif


         enddo
       
		    
		    
		   !*******************************************************************
		   !  CREAZIONE FILE .2dm E .sol PER SMS
		   !*******************************************************************
		   
		   !  chiude i file in cui ha scritto h e wse
		    close(1000001)  
		    close(1000002)
             close(1000006)  ! 18/9/2017
		    if (control_eros.eq.1.0) then
		    close(1000003)
		    endif
		    close(1000004)
		       close(1000005)
		    
		    deallocate(h_sol)
		    deallocate(htot_sol) 
             deallocate(conc_sol)  ! 18/9/2017
		    deallocate(eros_sol)  
		  !  deallocate(vel_sol)
		    deallocate(vel_sol_x)
		    deallocate(vel_sol_y)
		 !   deallocate(direz_vel_sol)
		    deallocate(magnitudo)
		    !deallocate(spessore_max)
		    !deallocate(vel_max)
		    !deallocate(h_finale)
		    deallocate(direz_vel)
		    deallocate(velocit)
		    deallocate(Area_dep_eros_finale)
		    deallocate(Area_dep_eros_ultimo_step)
		    
		       
		    
		  if (t_dopo.ge.DT_OUTPUT_MINUTI)     call crea_file_sms
		   
		  		    
		    
	
***************************************************


	

    

      t_fine = omp_get_wtime()

	hh = t_fine - tempo_iniziale
 


	write(30,198) ttt, hh 
198   format(a50,1x,2f10.2)
      
      write(10,*) 
	write(10,198) ttt, hh
	
	write(10,'("END SIMULATION")')
	
      write(*,'("END SIMULATION")')
      
      write(30,'("END SIMULATION")')
	close(10)
	
	write(210000,*) 
	write(210000,198) ttt, hh

	close(210000)


		

      pippok2 = "];"
    
      

      stop
136   stop ' -------- Error reading land use txt file -------------'
500   stop ' -------- Error opening output files ------------------'
550   stop ' -------- Error opening internal section output files -----'   ! 25/10/2017
115   stop ' -------- Error opening elevation file --------------------'
130   stop ' -------- Error opening input hydographs  file ------------'
140   stop ' -------- Error opening Chezy file ------------------------'
149   stop ' -------- Error opening platea stresses file --------------'
!150   stop ' -------- Error opening land use file ---------------------'
152   stop ' -------- Error opening sediment dep./eros. condition file-'
153   stop ' -------- Error opening erosion control file --------------'
154   stop ' -------- Error opening no erosion level file -----'
1515  stop ' -------- Error opening rest concentration file -----------'
160   stop ' -------- Error opening inferior erosion velocity file ----'
161   stop ' -------- Error opening superior deposition velocity file -'
170   stop ' -------- Error opening inferior erosion angle file -------'
171   stop ' -------- Error opening superior deposition angle file ----'
1500  stop ' -------- Error opening shear stress on structure file ----'
1501  stop ' -------- Error opening structures file ----'  ! aggiunto il 21/09/2015
1502  stop ' -------- Error opening breakers file ----'  ! aggiunto il 25/12/2018

      end


  

* **************************************************************
      subroutine kern (h0,hj,j,sen_tetaj,dx)
      
      integer j, i_sh_col(8), i_sh_row(8)
	real ho, hj, sen_tetaj, peso_peso, slopej, tetaj, dx


      i_sh_col = (/  0, -1, -1, -1,  0,  1,  1,  1/) 
	i_sh_row  =(/ -1, -1,  0,  1,  1,  1,  0, -1/)	

* --------------------------------------------------------------------

      if (i_sh_col(j).eq.0.or.i_sh_row(j).eq.0) then
         peso_peso = 1.0
* ------------------------- 1  sui lati; û2  sulle diagonali
*                           grid quadrato !
       else
         peso_peso = sqrt(2.0)
       endif
       slopej = (h0 - hj)/(peso_peso*dx)
       tetaj = atan(slopej)
       sen_tetaj = sin(tetaj)

      
       return
       end
* **************************************************************
      subroutine kern_erosion (h0,hj,j,sen_tetaj,dx,dh)
      
      integer j, i_sh_col(8), i_sh_row(8)
	real ho, hj, sen_tetaj, peso_peso, slopej, tetaj, dx, dh


      i_sh_col = (/  0, -1, -1, -1,  0,  1,  1,  1/) 
	i_sh_row  =(/ -1, -1,  0,  1,  1,  1,  0, -1/)	

* --------------------------------------------------------------------

      if (i_sh_col(j).eq.0.or.i_sh_row(j).eq.0) then
         peso_peso = 1.0
* ------------------------- 1  sui lati; û2  sulle diagonali
*                           grid quadrato !
       else
         peso_peso = sqrt(2.0)
       endif
       slopej = (h0 - hj + dh)/(peso_peso*dx)
       tetaj = atan(slopej)
       sen_tetaj = sin(tetaj)

      
       return
       end
* ******************************************************************************

       subroutine Hydrograph_volume(t22,iijj,V_sub,Vs_sub)   ! 29 Novemnbre 2012
              
       use mdl_bin5
       
       integer j1, iijj,j
       real  t22, Q2, V_sub, Vs_sub
       
       V_sub = 0.0
       Vs_sub = 0.0
             
       if (t_fin(iijj).gt.t22) then
            
          do j = 1, N_step_input(iijj)-1
            
       if (t_1d(iijj,j).le.t22.and.t_1d(iijj,j+1).gt.t22) j1 = j  ! modificato 29/11
       
          enddo
                  
          if (j1.gt.1) then
          
           do j = 1, j1-1
          
           V_sub = V_sub + 0.5*(Q_input(iijj,j) + 
     1Q_input(iijj,j+1))*(t_1d(iijj,j+1) - t_1d(iijj,j))

           Vs_sub = Vs_sub + 0.5*(Q_input(iijj,j)*Conc_input(iijj,j) +
     1Q_input(iijj,j+1)*Conc_input(iijj,j+1))*(t_1d(iijj,j+1) - 
     1t_1d(iijj,j))

           enddo
           
         endif
     

       Q2 = Q_input(iijj,j1+1) - (Q_input(iijj,j1+1) - Q_input(iijj,j1))
     1*(t_1d(iijj,j1+1)-t22)/(t_1d(iijj,j1+1)-t_1d(iijj,j1))
      
           V_sub = V_sub + 0.5*(Q2 + Q_input(iijj,j1))*
     1(t22 - t_1d(iijj,j1))
     
      CQ2 = Q_input(iijj,j1+1)*Conc_input(iijj,j1+1) - 
     1(Q_input(iijj,j1+1)*Conc_input(iijj,j1+1) - Q_input(iijj,j1)*
     1Conc_input(iijj,j1))*
     1(t_1d(iijj,j1+1)-t22)/(t_1d(iijj,j1+1)-t_1d(iijj,j1))
     
      Vs_sub = Vs_sub + 0.5*(CQ2 + Q_input(iijj,j1)*Conc_input(iijj,j1))
     1*(t22 - t_1d(iijj,j1))
        
        else  ! relativo a t_fin

         do j = 1, N_step_input(iijj)-1
          
           V_sub = V_sub + 0.5*(Q_input(iijj,j) + Q_input(iijj,j+1))*
     1(t_1d(iijj,j+1) - t_1d(iijj,j))
     
           Vs_sub = Vs_sub + 0.5*(Q_input(iijj,j)*Conc_input(iijj,j) + 
     1Q_input(iijj,j+1)*Conc_input(iijj,j+1))*
     1(t_1d(iijj,j+1) - t_1d(iijj,j))

           enddo
        
        endif
        

       return
       end



************************************************************************************************

      subroutine ricalibratura(ic_0,ir_0,ii)
      use mdl_bin5

	integer ic_0, ir_0, icj_0, irj_0, j, icont
      real sen_tetaj_s, sen_tetatot_s

      sen_tetatot_s = 0.0
	icont = 0
	
	k(ic_0,ir_0) = 0.0
	
	do j = 1,8
	  j_dir(ic_0,ir_0,j) = 0   !   MODIFICA DEL 25/01/2013
      enddo

	 do j = 1,8

                  icj_0 = ic_0 + i_sh_col(j)
                  irj_0 = ir_0 + i_sh_row(j)
      
      if (ele(icj_0,irj_0).ne.esterno) then

	  if (val_sorg(icj_0,irj_0).ne.100) then
            
           call kern (ele(ic_0,ir_0),ele(icj_0,irj_0),
     1       j,sen_tetaj_s,lato_cella)

               sen_teta(ic_0,ir_0,j)= sen_tetaj_s
        else

	     call calibratura1(icj_0,irj_0,ii)

        endif

	endif

      if  (sen_teta(ic_0,ir_0,j).gt.0.0) then

	 if (val(icj_0,irj_0).ge.0.0.and.val(icj_0,irj_0).le.float(ii+1)) then

	    k(ic_0,ir_0) = k(ic_0,ir_0) + 1
	
	    j_dir(ic_0,ir_0,k(ic_0,ir_0)) = j   !   MODIFICA DEL 25/01/2013 

          senteta(ic_0,ir_0,k(ic_0,ir_0)) = sen_teta(ic_0,ir_0,j)
!$OMP Critical

          if (val(icj_0,irj_0).eq.0.0) then

	         Num_celle_routing = Num_celle_routing + 1

	            ic_routing(Num_celle_routing) = icj_0
                  ir_routing(Num_celle_routing) = irj_0

	                val(icj_0,irj_0) = float(ii+1)
	    endif
!$OMP end Critical 
	ic_s(ic_0,ir_0,k(ic_0,ir_0)) = icj_0
	ir_s(ic_0,ir_0,k(ic_0,ir_0)) = irj_0

	sen_tetatot_s = sen_tetatot_s + sen_teta(ic_0,ir_0,j)
	
	endif

	     else

	  if  (sen_teta(ic_0,ir_0,j).lt.0.0) call calibratura2(icj_0,irj_0,ii)
        
	      endif

        enddo
    
      sen_max(ic_0,ir_0) = 0.0

	 do j = 1,k(ic_0,ir_0)
     
	peso(ic_0,ir_0,j) = senteta(ic_0,ir_0,j)/sen_tetatot_s

      if (senteta(ic_0,ir_0,j).gt.sen_max(ic_0,ir_0)) then

	 sen_max(ic_0,ir_0) = senteta(ic_0,ir_0,j)

	 peso_max(ic_0,ir_0) = peso(ic_0,ir_0,j)

	    endif

	  enddo

	sen_tetatot_s = 0.0

	return 
	end

		
      

* **************************************************************

      subroutine calibratura1(ic_1,ir_1,ii)

c      per celle sorgenti



      use mdl_bin5

	integer ic_1, ir_1, icj_1, irj_1, jjj


	real sen_tetatot3,sen_tetaj_sss

	k(ic_1,ir_1) = 0.0
	sen_tetatot3 = 0.0
	
	do jjj = 1,8
	j_dir(ic_1,ir_1,jjj) = 0   !   MODIFICA DEL 25/01/2013
      enddo

	 do jjj = 1,8

                  icj_1 = ic_1 + i_sh_col(jjj)
                  irj_1 = ir_1 + i_sh_row(jjj)
      


	          if (ele(icj_1,irj_1).ne.esterno) then

	if (val_sorg(icj_1,irj_1).ne.100) then

	   
	              
                  
                   call kern (ele(ic_1,ir_1),
     1                    ele(icj_1,irj_1),jjj,sen_tetaj_sss,lato_cella)

               sen_teta(ic_1,ir_1,jjj)= sen_tetaj_sss

      

      endif

	          endif



           if  (sen_teta(ic_1,ir_1,jjj).gt.0.0) then




	 if (val(icj_1,irj_1).ge.0.0.and.val(icj_1,irj_1).le.float(ii+1)) then

	k(ic_1,ir_1) = k(ic_1,ir_1) + 1
	
	j_dir(ic_1,ir_1,k(ic_1,ir_1)) = jjj    !   MODIFICA DEL 25/01/2013

      senteta(ic_1,ir_1,k(ic_1,ir_1)) = sen_teta(ic_1,ir_1,jjj)

!$OMP Critical
	    if (val(icj_1,irj_1).eq.0.0) then
	    
	      Num_celle_routing = Num_celle_routing + 1

	            ic_routing(Num_celle_routing) = icj_1
                  ir_routing(Num_celle_routing) = irj_1

	                val(icj_1,irj_1) = float(ii+1)

	    	    

	     endif
!$OMP end Critical


	ic_d(ic_1,ir_1,k(ic_1,ir_1)) = icj_1
	ir_d(ic_1,ir_1,k(ic_1,ir_1)) = irj_1

      


	sen_tetatot3 = sen_tetatot3 + sen_teta(ic_1,ir_1,jjj)

	
	endif


	    

	 

	                      endif


          enddo



c      peso e pendenza e peso massimi

    
      sen_max(ic_1,ir_1) = 0.0


	 do jjj = 1,k(ic_1,ir_1)

	       
	peso_d(ic_1,ir_1,jjj) = senteta(ic_1,ir_1,jjj)/sen_tetatot3
      
      	if (senteta(ic_1,ir_1,jjj).gt.sen_max(ic_1,ir_1)) then

	 sen_max(ic_1,ir_1) = senteta(ic_1,ir_1,jjj)

	 peso_max(ic_1,ir_1) = peso_d(ic_1,ir_1,jjj)

	    endif


	  enddo

	sen_tetatot3 = 0.0

	

	return 
	end

    

! ****************************************************************************

        subroutine calibratura2(ic_2,ir_2,ii)

c      per celle striscia



      use mdl_bin5

	integer ic_2, ir_2, icj_2, irj_2, jj
      


	real sen_tetatot2, sen_tetaj_ss

	k(ic_2,ir_2) = 0.0
	sen_tetatot2 = 0.0
	
	
	do jj = 1,8
	j_dir(ic_2,ir_2,jj) = 0   !   MODIFICA DEL 25/01/2013
      enddo


	 do jj = 1,8

                  icj_2 = ic_2 + i_sh_col(jj)
                  irj_2 = ir_2 + i_sh_row(jj)

	          if (ele(icj_2,irj_2).ne.esterno) then

	if (val_sorg(icj_2,irj_2).ne.100) then

            
                   call kern (ele(ic_2,ir_2),
     1                      ele(icj_2,irj_2),jj,sen_tetaj_ss,lato_cella)

               sen_teta(ic_2,ir_2,jj)= sen_tetaj_ss

      

      endif

	          endif



           if  (sen_teta(ic_2,ir_2,jj).gt.0.0) then




	 if (val(icj_2,irj_2).ge.0.0.and.val(icj_2,irj_2).le.float(ii+1)) then

	k(ic_2,ir_2) = k(ic_2,ir_2) + 1
	
	j_dir(ic_2,ir_2,k(ic_2,ir_2)) = jj    !   MODIFICA DEL 25/01/2013

      senteta(ic_2,ir_2,k(ic_2,ir_2)) = sen_teta(ic_2,ir_2,jj)

!$OMP Critical
	    if (val(icj_2,irj_2).eq.0.0) then
	    
	      Num_celle_routing = Num_celle_routing +1

	            ic_routing(Num_celle_routing) = icj_2
                  ir_routing(Num_celle_routing) = irj_2

	                val(icj_2,irj_2) = float(ii+1)


	     endif
!$OMP end Critical

	ic_s(ic_2,ir_2,k(ic_2,ir_2)) = icj_2
	ir_s(ic_2,ir_2,k(ic_2,ir_2)) = irj_2

      
	sen_tetatot2 = sen_tetatot2 + sen_teta(ic_2,ir_2,jj)

	
	endif

	                      endif


          enddo

c      peso e pendenza e peso massimi

    
      sen_max(ic_2,ir_2) = 0.0


	 do jj = 1,k(ic_2,ir_2)

	       
	peso(ic_2,ir_2,jj) = senteta(ic_2,ir_2,jj)/sen_tetatot2




      	if (senteta(ic_2,ir_2,jj).gt.sen_max(ic_2,ir_2)) then

	 sen_max(ic_2,ir_2) = senteta(ic_2,ir_2,jj)

	 peso_max(ic_2,ir_2) = peso(ic_2,ir_2,jj)

	    endif


	  enddo

	sen_tetatot2 = 0.0

	

	return 
	end

    

! ****************************************************************************

      subroutine erosione(DT,j,iii,dh_e_s,U_s)
      use mdl_bin5
      implicit none
      integer  j, ij, iii
	real DT, er, dh_e_s, U_s

      er = Egash_eros*U_s*(senteta(ic_routing(iii),ir_routing(iii
	1),j) - senteta_crit(ic_routing(iii),ir_routing(iii)))
	
	dh_e_s = (-1.0)*er*DT

	return 
	end

! ****************************************************************************

	subroutine deposito(DT,j,iii,dh_e_s,U_s)
      use mdl_bin5
      implicit none
      integer  j,  iii
	real DT, er, dh_e_s, U_s
      
	er = Egash_dep*U_s*(senteta(ic_routing(iii),ir_routing(iii
	1),j) - senteta_crit2(ic_routing(iii),ir_routing(iii)))   ! modifica 13/9/2017

	dh_e_s = (-1.0)*er*DT
	
	return 
	end


****************************************************************************

	subroutine deposito_inferiore(DT,j,iii,dh_e_s,U_s)
      use mdl_bin5
      implicit none
      integer  j,  iii
	real DT, er, dh_neg_s, dh_e_s, U_s
 	
		er= Coeff_Ang_Limit*Egash_dep*U_s*(senteta(ic_routing(iii),
	1ir_routing(iii),j) - senteta_crit2(ic_routing(iii),ir_routing(iii)))   ! modifica 13/9/2017

	dh_e_s = (-1.0)*er*DT

		
	return 
	end


****************************************************************************


      subroutine erosione_Belangier(DT,j,iii,ang_new,dh_e_s,U_stra_s)
      use mdl_bin5
      implicit none
      integer  j, iii
	real DT, ang_new, er, dh_neg_s, dh_e_s, U_stra_s
	
	er = Egash_eros*U_stra_s*(sinD(ang_new) - 
     1senteta_crit(ic_routing(iii),ir_routing(iii)))
	
	dh_e_s = (-1.0)*er*DT
		
	return 
	end

! ****************************************************************************

	subroutine deposito_Belangier(DT,j,iii,ang_new,dh_e_s,U_stra_s)
      use mdl_bin5
      implicit none
      integer  j, iii
	real DT, ang_new, er, dh_neg_s, dh_e_s, U_stra_s

      er = Egash_dep*U_stra_s*(sinD(ang_new) - senteta_crit2
     1(ic_routing(iii),ir_routing(iii)))   ! modifica 13/9/2017 e 3/7/2015

	dh_e_s = (-1.0)*er*DT
	
	return 
	end



! ****************************************************************************

	subroutine deposito_Belangier_inferiore(DT,j,iii,ang_new,
     1 dh_e_s,U_stra_s)
      use mdl_bin5	
      implicit none
      integer  j, iii
	real DT, er, dh_neg_s, dh_e_s, U_stra_s, ang_new
     
      er = Coeff_Ang_Limit*Egash_dep*U_stra_s*(sinD(ang_new) - 
     1senteta_crit2(ic_routing(iii),ir_routing(iii)))   ! modifica 13/9/2017

	dh_e_s = (-1.0)*er*DT
			
	return 
	end
	! ****************************************************************************

	subroutine calcolo_magnitudo
	use mdl_bin5
C nuova versione calcolo pericolosità	
	real*8  classe_vel
	real*8  classe_h
	real*8  Vel1, h1, magnitud, Temp_rit
	
	   h1 =  1

	   Vel1 =  1
	
	   do j = 1, no_rows
	     do i = 1, no_columns
	     
	        if (ele(i,j).ne.esterno) then
	
	            if(spessore_max(i,j).gt.0.0) then
                  
                !  calcolo
                  Temp_rit = 300
                  Classe_vel = 2.0
                  Classe_h = 2.0
                  if (vel_max(i,j).gt.Vel1) Classe_vel = 3.0
                  
                  if (spessore_max(i,j).gt.h1) Classe_h = 3.0

                  
                  !  calcolo magnitudo 
                  
                  if (Temp_rit.le.300.and.Tem_rit.gt.30) then 
                   
                  Magnitud = 2.0
              
                  if(Classe_vel.eq.3.0.and.Classe_h.eq.3.0) then
                      Magnitud = 3.0
                  endif    
                  else if (Tem_rit.le.30) then 
                  Magnitud = 3.0
              
                  endif
                 
                  Magnitudo(i,j) = Magnitud
                    
          
                  else
                  
                  
                  Magnitudo(i,j) = 0.0
                  
                  endif
                  
                  else
                  
                  Magnitudo(i,j) = esterno
                  
                  endif 
              

        enddo
        enddo


		
	return 
	end






       subroutine readinput
       use mdl_bin5
! ----------------------------------------------------------------------
      open (100,file=fileComandi,mode='read')
! .................................................................
      read  (100,'(30x,a)',end=200) fileFormat
  !    read  (100,'(30x,a)',end=200) fileEle
  !    read  (100,'(30x,a)',end=200) file_Internal_Outputs
      read  (100,'(30x,a)',end=201) fileIdrogramma 
      read  (100,'(35x,f10.2)',end=200) control1
	if (control1.eq.1.0) then
      read  (100,'(30x,a)',end=202) fileLandUse
	read  (100,'(30x,a)',end=203) fileLandChar
	else
      read  (100,'(35x,f10.3)',end=200) Chezy
	endif
	read  (100,'(35x,f10.1)',end=200) Intern_Output
	if (Intern_Output.eq.1.0) then
      read  (100,'(30x,a)',end=204) file_Internal_Outputs
      read  (100,'(30x,a)',end=205) file_Internal_OutputsValle
      read  (100,'(40x,f15.1)',end=200) DT_Internal_Output
	endif
      read  (100,'(35x,f15.2)',end=200) tempo_finale
      read  (100,'(35x,f10.3)',end=200) Coeff_Ang_Limit
!	read  (100,'(40x,f15.1)',end=200) DT_Internal_Output
	read  (100,'(52x,f10.2)',end=200) Limit_Angle
      read  (100,'(35x,f10.3)',end=200) Courant
      read  (100,'(35x,f10.5)',end=200) h_routing
	read  (100,'(35x,f10.2)',end=200) control_eros
	if (control_eros.eq.1.0) then
	if (control1.eq.2.0) then
	read  (100,'(35x,f10.3)',end=200) Vel_erosion
	read  (100,'(35x,f10.3)',end=200) Ang_erosion
      read  (100,'(35x,f10.3)',end=200) Vel_dep_sup    ! modifica 13/9/2017
	read  (100,'(35x,f10.3)',end=200) ang_deposito      ! modifica 13/9/2017
	endif
      read  (100,'(35x,f10.2)',end=200) Egash_eros
	read  (100,'(35x,f10.2)',end=200) Egash_dep
      !read  (100,'(35x,f10.4)',end=200) Vel_dep_sup       ! modifica 13/9/2017
	!read  (100,'(35x,f10.5)',end=200) ang_deposito       ! modifica 13/9/2017
	read  (100,'(35x,f10.5)',end=200) h_erosione
	read  (100,'(35x,f10.3)',end=200) Cmedio
	read  (100,'(35x,f10.3)',end=200) Cstar
	endif
	read  (100,'(35x,f10.3)',end=500) DT_OUTPUT_MINUTI
!      read  (100,'(50x,i7)',end=600) i_flag
      read  (100,'(30x,i7)',end=208) CPUS     !BARBINI
	read  (100,'(30x,a)',end=206) fileBC
      read  (100,'(30x,a)',end=206) fileElePonti
      read  (100,'(30x,a)',end=206) fileTxtPonti
!	read  (100,'(30x,a)',end=200) fileBM 
      read  (100,'(30x,i1)',end=207) intFileERR
      if (intFileERR==1)then
         boolfileERR=.false.
      else
         boolfileERR=.true.
      end if   
	! .................................................................
      close (100)

      return
      
200   write (10,'(a)') ' -------- Error in the input command file:
     1 hdr file--------' !BERNARD
      close (10)
      stop ' -------- Error in the input command file: hdr file--------'
201   write (10,'(a)') ' -------- Error in the input command file:
     1 hydrograph file--------' !BERNARD
      close (10)
      stop ' -------- Error in the input command file: hydrograph file'          !  11/7/2017
202   write (10,'(a)') ' -------- Error in the input command file:
     1 land use flt file--------' !BERNARD
      close (10)
      stop ' ------- Error in the input command file: land use flt file'         !  11/7/2017
203   write (10,'(a)') ' -------- Errore nel file comandi: file uso  
     1suolo txt--------' !BERNARD
      close (10)
      stop ' ------- Error in the input command file: land use flt file'    !  11/7/2017
204   write (10,'(a)') ' -------- Error in the input command file:
     1 internal output file -------' !BERNARD
      close (10)
      stop ' ---- Error in the input command file: internal output file'       !  11/7/2017
205   write (10,'(a)') ' --------Error in the input command file:
     1 secon internal output file--------' !BERNARD
      close (10)
      stop '---Error in the input command file: secon internal output 
     1 file'     !  11/7/2017
206   write (10,'(a)') ' -------- Error in the input command file:
     1 boundary conditions file--------' !BERNARD
      close (10)
      stop ' Error in the input command file: boundary conditions file'   !  11/7/2017
500   write (10,'(a)') ' -------- Error in the number output files 
     1--------' !BERNARD
      close (10)
      stop ' -------- Error in the number output files   -----------'
600   write (10,'(a)') ' --------Error in the control of output files
     1--------' !BERNARD
      close (10)
      stop ' -------- Error in the control of output files---------'
208   write (10,'(a)') ' -------- Error in the number of setted threads 
     1--------' !BARBINI
      close (10)
      stop ' -------- Error in the number of setted threads   ---------'
207   boolFileERR=.false. !BERNARD WRITING FILE ERR
      close (100)
      Return
           end
! ****************************************************************************
         subroutine writeinput
       use mdl_bin5
      character*256 NoCString
! .................................................................
  !    fileLog = fileComandi

      open   (100,file=fileComandi)
      write  (100,'(''Header                   File:'',a)')  trim(NoCStr
	1ing(fileFormat))
  !    write  (100,'(''Elevation                File:'',a)')  trim(NoCStr
!	1ing(fileEle))
!      write  (100,'(''Internal Outputs         File:'',a)')  trim(NoCStr
!	1ing(file_Internal_Outputs))
      write  (100,'(''Input hydrographs        File:'',a)')  trim(NoCStr
	1ing(fileIdrogramma))
      write  (100,'(''Distribution control flag number  :'',f10.2)')  
	1control1 
	if (control1.eq.1.0) then
      write  (100,'(''Land Use                 File:'',a)') trim(NoCStr
	1ing(fileLandUse))
	write  (100,'(''Land Characteristic      File:'',a)')  trim(NoCStr
	1ing(fileLandChar))
	else
      write  (100,'(''Chezy coefficient                 :'',f10.2)')  
	1Chezy   
	endif
	write  (100,'(''Internal Output (1)               :'',f10.1)')
	1 Intern_Output
	if (Intern_Output.eq.1.0) then
      write  (100,'(''Internal Outputs         File:'',a)')  trim(NoCStr
	1ing(file_Internal_Outputs))
      write  (100,'(''Second Internal Outputs  File:'',a)')  trim(NoCStr
	1ing(file_Internal_OutputsValle))   ! 11/7/2017
      write  (100,'(''Internal Output Time Step (seconds):'',f15.1)')            !! MODIFICA DEL 21/09/2015
     1 DT_Internal_Output
	endif
      write  (100,'(''Simulation time                   :'',f15.2)')  
	1tempo_finale   
      write  (100,'(''Depos. Coeff. for Limit Angle     :'',f10.3)')    
	1  Coeff_Ang_Limit    
 !     write  (100,'(''Internal Output Time Step (minute):'',f15.1)')                               
!	1  DT_Internal_Output
	write  (100,'(''Inferior Limit Angle (°) for debris flow routing:'',
	1f10.2)') Limit_Angle
!	write  (100,'(''Internal Output (1)               :'',f10.1)')
!	1 Intern_Output
      write  (100,'(''Courant number                    :'',f10.3)')  
	1Courant
      write  (100,'(''Minimum Flow Depth for Routing (m):'',f10.5)')  
	1h_routing
      write  (100,'(''Erosion flag number               :'',f10.2)')
	1  control_eros
	if (control_eros.eq.1.0) then
	if (control1.eq.2.0) then
      write (100,'(''Erosion inferior velocity (m/s)   :'',f10.3)') 
	1Vel_erosion
	write (100,'(''Erosion inferior angle (°s)       :'',f10.3)') 
	1Ang_erosion
      write  (100,'(''Superior deposit velocity (m/s)   :'',f10.4)')   ! modifica 13/9/2017
	1 Vel_dep_sup    
	write  (100,'(''Superior deposit angle (°)        :'',f10.5)')    ! modifica 13/9/2017
	1 ang_deposito  
	endif
      write  (100,'(''Egashira erosion coefficient     :'',f10.2)')  
	1Egash_eros  
      write  (100,'(''Egashira deposition coefficient  :'',f10.2)')  
	1Egash_dep      
   !   write  (100,'(''Superior deposit velocity (m/s)   :'',f10.4)')     ! modifica 13/9/2017
!	1 Vel_dep_sup    
!	write  (100,'(''Superior deposit angle (°)        :'',f10.5)')      ! modifica 13/9/2017
!	1 ang_deposito  
	write  (100,'(''Minimum Flow Depth for Eros/Dep(m):'',f10.5)') 
	1 h_erosione 
	write  (100,'(''Mean solid concentration          :'',f10.3)') 
	1 Cmedio  
	write  (100,'(''Rest solid concentration          :'',f10.3)') 
	1 Cstar 
	endif
      write  (100,'(''Output time step (seconds)     	:'',f10.3)')
     1  DT_OUTPUT_MINUTI    
    !  write  (100,'(''Equal Time-Spaced (1) No Equal Time-Spaced (2)   
	!1:'',i7)')   i_flag 
      write  (100,'(''Number of set logical CPUs   :'',i3)') CPUs 
      write  (100,'(''Inlet Outlet condition   File:'',a)')  trim(NoCStr
	1ing(fileBC))   
!	write  (100,'(''Boundary mask            File:'',a)')  trim(NoCStr
!	1ing(fileBM))  
        write (100,'(''Bridge elevation         File:'',a)') trim(NoCStr
	1ing(fileElePonti))   
       write  (100,'(''Bridge characteristics   File:'',a)') trim(NoCStr
	1ing(filetxtPonti))
      close(100)
! .................................................................
      return
      end
! ****************************************************************************
      subroutine hdrprepare
      use mdl_bin5
 ! .................................................................
      retint = scan (fileTempi_Allag,'.')
      if (retint > 1) then
       fileHeader = fileTempi_Allag(1:retint-1)//'.hdr'
      if (fileHeader /= fileFormat) call HdrWrite (fileHeader)
      endif

      retint = scan (fileBM,'.')
      if (retint > 1) then
       fileHeader = fileBM(1:retint-1)//'.hdr'
      if (fileHeader /= fileFormat) call HdrWrite (fileHeader)
      endif

	retint = scan (fileVC,'.')
      if (retint > 1) then
       fileHeader = fileVC(1:retint-1)//'.hdr'
      if (fileHeader /= fileFormat) call HdrWrite (fileHeader)
      endif

		retint = scan (fileEleNuovo,'.')
      if (retint > 1) then
       fileHeader = fileEleNuovo(1:retint-1)//'.hdr'
      if (fileHeader /= fileFormat) call HdrWrite (fileHeader)
      endif

      return
      end
! ****************************************************************************
      subroutine HdrWrite (filename)
      use mdl_bin5
      character* 256 filename
! --------------------------------------------------------------------
      open (1,file=filename)
      write  ( 1,'(''ncols         '',i7   )')  no_columns
      write  ( 1,'(''nrows         '',i7   )')  no_rows
      write  ( 1,'(''xllcorner     '',f10.2)')  or_easting
      write  ( 1,'(''yllcorner     '',f10.2)')  or_northing
      write  ( 1,'(''cellsize      '',f10.2)')  lato_cella
      write  ( 1,'(''NODATA_value  '',f10.2)')  esterno
      write  ( 1,'(''byteorder     LSBFIRST'')')
      write  ( 1,'(''undef_value   '',f10.2)')  undefined
      close (1)
      return
      end
      
      ! ****************************************************************************
      subroutine HdrWrite1 (filename,num_open_s)
      use mdl_bin5
      character* 256 filename
      integer num_open_s, che_open_s
      che_open_s = num_open_s+1
! --------------------------------------------------------------------
      open (che_open_s,file=filename)
      write  (che_open_s,'(''ncols         '',i7   )')  no_columns
      write  (che_open_s,'(''nrows         '',i7   )')  no_rows
      write  (che_open_s,'(''xllcorner     '',f10.2)')  or_easting
      write  (che_open_s,'(''yllcorner     '',f10.2)')  or_northing
      write  (che_open_s,'(''cellsize      '',f10.2)')  lato_cella
      write  (che_open_s,'(''NODATA_value  '',f10.2)')  esterno
      write  (che_open_s,'(''byteorder     LSBFIRST'')')
      write  (che_open_s,'(''undef_value   '',f10.2)')  undefined
      close (che_open_s)
      return
       end
! ****************************************************************************
         subroutine decodeinput (iout)
         use mdl_bin5
! --------------------------------------------------------------------
         open (1,file=fileFormat,mode='read',err=100)  
      call hdrread (1)
      close (1)
      call keywrite (iout)
      
      write (iout,'('' Header file                  _'',a)') 
	1trim(fileFormat)
! .................................................................
 !     open ( 11,file=fileEle,mode='read',form='binary', err=110)
  !    write (iout,'('' Elevation                    _'',a)') 
!	1trim(fileEle)
      open ( 3,file=fileIdrogramma, err=130)
      write (iout,'('' Input hydographs             _'',a)') 
	1trim(fileIdrogramma)
      write(iout,'(''Distribution control flag number  _'',f10.2)')
	1 control1
	if (control1.eq.1.0) then
!	open ( 12,file=fileCh,mode='read',form='binary', err=140)
 !     write (iout,'('' Chezy                       _'',a)') trim(fileCh)
      !write(*,*) fileLandUse, fileLandChar
      open ( 69,file=fileLandUse,mode='read',form='binary', err=155)
      write (iout,'('' Land Use file                _'',a)') 
	1trim(fileLandUse)
	open ( 70,file=fileLandChar, err=135)
      write (iout,'('' Land Chracteristics          _'',a)') 
	1trim(fileLandChar)
	else
	write( iout,'('' Chezy coefficient               _'',f10.2)')
	1 Chezy
	endif
        write (iout,'('' Internal Outputs (1)            _'',f10.1)')
	1 Intern_Output
      if (Intern_Output.eq.1.0) then
      open ( 16,file=file_Internal_Outputs,mode='read',form='binary',
	1err=120)
      open (16666666,file=file_Internal_OutputsValle,mode='write',form='
     1binary',err=121)   ! 11/7/2011
      !write(*,'(a200)') file_Internal_OutputsValle
       write (iout,'('' Internal Outputs time step (seconds)         
	1'',f15.1)')  DT_Internal_Output                                     ! MODIFICA DEL 21/9/2015 
	endif

      write (iout,'('' Simulation time (sec)           _'',f15.5)') 
	1 tempo_finale    
      write (iout,'('' Depos. Coeff. for Limit Angle   _'',f10.3)') 
	1Coeff_Ang_Limit     
   !   write (iout,'('' Internal Outputs time step (minutes) 
!	1'',f15.1)')  DT_Internal_Output
      write (iout,'('' Inferior Limit Angle (°) for debris flow routing_
     1'',f10.2)') Limit_Angle
 !     write (iout,'('' Internal Outputs (1)            _'',f10.1)')
!	1 Intern_Output
   !   if (Intern_Output.eq.1.0) then
   !   open ( 16,file=file_Internal_Outputs,mode='read',form='binary',
!	1err=120)
 !     write (iout,'('' Internal Outputs              _'',a)') 
!	1trim(file_Internal_Outputs)
  !    endif
	write (iout,'('' Courant number                  _'',f10.3)') 
	1 Courant
      write (iout,'('' Minimum Flow Depth for Routing (m) _'',f10.5)')
	1  h_routing
	write (iout,'('' Erosion flag number             _'',f10.2)')  
	1control_eros 
	if (control_eros.eq.1.0) then
	if (control1.eq.2.0) then
!	open ( 13,file=fileErosione,mode='read',form='binary', err=150)
!      write (iout,'('' Control erosion file        _'',a)') 
!	1trim(fileErosione)
  !    open ( 14,file=fileVel_inf_eros,mode='read',form='binary',err=160)
  !    write (iout,'('' Erosion inferior velocity   _'',a)') 
	!1trim(fileVel_inf_eros)
!	open ( 15,file=fileAng_inf_eros,mode='read',form='binary',err=170)
  !    write (iout,'('' Deposit inferior angle file _'',a)') 
!	1trim(fileAng_inf_eros)
!	else
      write (iout,'('' Erosion inferior velocity (m/s) _'',f10.3)') 
	1Vel_erosion
	write (iout,'('' Erosion inferior angle (°s)     _'',f10.3)') 
	1Ang_erosion

      write (iout,'('' Deposit superior velocity (m/s) _'',f10.4)')    ! modifica 13/9/2017
	1 Vel_dep_sup
      write (iout,'('' Deposit superior angle (°)      _'',f10.5)')      ! modifica 13/9/2017
	1  ang_deposito

	endif
     	write (iout,'('' Egashira erosion coefficient    _'',f10.2)')
	1  Egash_eros
	write (iout,'('' Egashira deposition coefficient  _'',f10.2)')
	1  Egash_dep
	!write (iout,'('' Deposit superior velocity (m/s) _'',f10.4)')     ! modifica 13/9/2017
	!1 Vel_dep_sup
  !    write (iout,'('' Deposit superior angle (°)      _'',f10.5)')       ! modifica 13/9/2017
!	1  ang_deposito
	write (iout,'('' Minimum Flow Depth for Erosion (m) _'',f10.5)')
	1  h_erosione
	write (iout,'('' Mean solid concentration          _'',f10.3)')
	1  Cmedio
	write (iout,'('' Rest solid concentration           _'',f10.3)')
	1  Cstar
	endif
	write  (iout,'(''Output time step (minutes)                
	1_'',f10.3)')  DT_OUTPUT_MINUTI    
	Write  (iout,'(''Number of set logical CPUs  :   '',i3)') CPUs   
   !   write  (iout,'(''Equal Time-Spaced (1) No Equal Time-Spaced (2)   
    !1:'',i7)')   i_flag    
      open ( 18,file=fileBC,mode='read',form='binary', err=171)
      write (iout,'('' Inlet Outlet conditions              _'',a)') 
	1trim(fileBC)
!	open ( 212,file=fileBM,form='BINARY')
  !    write (iout,'('' Boundary Mask File                   _'',a)') 
!	1trim(fileBM)
      open ( 33,file=fileElePonti,mode='read',form='binary', err=174)
      write (iout,'('' Bridge elevation              _'',a)') 
	1trim(fileElePonti)
      open ( 34,file=fileTxTPonti,mode='read', err=175)
      write (iout,'('' Bridge characteristics         _'',a)') 
	1trim(fileTxtPonti)
	if(boolfileERR)then
       write (iout,'('' Error file = ON'')')
      else 
       write (iout,'('' Error file = OFF'')')
      endif
! ------------------------------------------------------------------
       return
100   stop ' -------- Error opening header file -----------------------'
110   stop ' -------- Error opening elevation file --------------------'
120   stop ' -------- Error opening internal output file --------------'
121   stop ' -------- Error opening second internal output file -------'
130   stop ' -------- Error opening input hydographs  file ------------'
140   stop ' -------- Error opening Chezy file ------------------------'
155   stop ' -------- Error opening land use file ---------------------'
135   stop ' -------- Error opening land characteristic file ----------'
160   stop ' -------- Error opening inferior erosion velocity file ----'
170   stop ' -------- Error opening inferior erosion angle file -------'
171   stop ' -------- Error opening boundary condition file -----------'
!172   stop ' -------- Error opening internal output file -- -----------'
!173   stop ' -------- Error opening outflow volume distribution file --'
174   stop ' -------- Error opening Bridge elevation file -------------'
175   stop ' -------- Error opening Bridge characteristics file -------'
      end
! *******************************************************
      character*256 function NoCString (stringa)
      character*(*) stringa
      i = SCAN (stringa, char(0))  
      if (i > 0)  then
      NoCString = stringa(1:i-1)
      else
      NoCString = stringa
      endif
      end function
! **************************************************************
          subroutine hhmmss(time,ih,im,is)
        is = nint(time)
        im = int (is/60.)
        ih = int (im/60.)
        is = is - im * 60
        im = im - ih * 60
      return
       end
! *****************************************************************
       subroutine hdrread (n)
       use mdl_bin5
        character*60 alfa
      character*12 ,beta, keyword(8)
      data keyword /'ncols','nrows','xllcorner','yllcorner','cellsize','
	1nodata_value','byteorder','undef_value'/
	 integer kkk
! --------------------------------------------------------------------
      do j=1,8
      read (n,'(a60)',end=10) alfa
! ---------------------------------- reduce to lowercase
      beta = trim(ADJUSTL(alfa(1:scan(alfa,' ')-1)))
      kkk = len_trim(beta)
      write(*,*) beta, kkk
      do kkk = 1, len_trim(beta)
      if (ichar(beta(kkk:kkk)) >= 65 .and. ichar(beta(kkk:kkk)) <= 90)
	1 beta(kkk:kkk) = char(ichar(beta(kkk:kkk)) + 32)
      enddo
      do kkk=1,8
      if (beta == keyword(kkk)) then
      call hdrdecode (kkk, trim(ADJUSTL(alfa(scan(alfa,' '):60))))
      exit
      endif
      enddo
      enddo
! ----------------------------------------- origine nel vertice NW
10    return
      entry keywrite (iout)
      write (iout,1000) keyword(1), real(no_columns)
      write (iout,1000) keyword(2), real(no_rows)
      write (iout,1000) keyword(3), or_easting
      write (iout,1000) keyword(4), or_northing
      write (iout,1000) keyword(5), lato_cella
      write (iout,1000) keyword(6), esterno
      write (iout,1000) keyword(8), undefined
      write (iout,'(1x,a12,17x,''_'',a10)') keyword(7), byteorder
1000  format( 1x,a12,17x,'_',f12.2)
      return
      end
! ********************************************************************
      subroutine hdrdecode (kkk, alfa)
       use mdl_bin5
        character*(*)   alfa
	integer kkk
! --------------------------------------------------------------------
        select case (kkk)
      case (1)
      read  (alfa,*)           no_columns
      case (2)
      read  (alfa,*)           no_rows
      case (3)
      read  (alfa,*)           or_easting
	case (4)
      read  (alfa,*)           or_northing
      case (5)
      read  (alfa,*)           lato_cella
      case (6)
      read  (alfa,*)           esterno
      case (7)
      read  (alfa,*)           byteorder
      case (8)
      read  (alfa,*)           undefined
      end select
      return
      end
    !**************************************************
      

        subroutine crea_file_sms
        use mdl_bin5
        
        
        integer, allocatable :: n_element(:,:)
        integer, allocatable :: nop(:,:)
        integer, allocatable :: n_nod_elem(:)
        integer, allocatable :: nod_elem(:,:)
        integer, allocatable :: i_material_element(:)
                  
                  
        integer imat(90000),nb(90000,4),    !nod_elem(180000,4),
     +  con(4),i_all(90000),i_test,i_sed,i_mult    ! n_nod_elem(180000)
	integer nelem,n_mat,chk,sum,nnod,nod,cell,i_vmax,i_in,i_fin, el
   !   mult(90000)
      integer num_nodi, numero_nodi, i_sh_col2(4), i_sh_row2(4)
      
      integer ij_iniz, j_iniz, i_nod
                  
                  
                  
                !  real, allocatable :: ele(:,:)
           real, allocatable :: coord(:,:)
           real, allocatable :: nodxyz(:,:)
           real, allocatable :: flow_depth(:,:)
           real, allocatable :: depth(:)
           real, allocatable :: profond(:)
           real, allocatable :: wse(:)
           real, allocatable :: erosion_depth(:)
           real, allocatable :: conc_sms(:)   ! 18/9/2017
                          
           real, allocatable :: wse_nod(:)
           real, allocatable :: erosion_depth_nod(:)
           real, allocatable :: conc_sms_nod(:)    ! 18/9/2017
              
           real, allocatable :: vel(:)
           real, allocatable :: dir_vel(:)
                          
           real, allocatable :: vel_x(:)
           real, allocatable :: vel_y(:)
                          
                          
           real, allocatable :: vel_x_nod(:)
           real, allocatable :: vel_y_nod(:)
                          
           real, allocatable :: tau_x_max(:)  ! 28/4/2015
           real, allocatable :: tau_y_max(:)  ! 28/4/2015
                          
           real, allocatable :: tau_x_nod(:)  ! 28/4/2015
           real, allocatable :: tau_y_nod(:)  ! 28/4/2015
                          
           real, allocatable :: vel_cel_x(:)   ! 29/4/2015
           real, allocatable :: vel_cel_y(:)  ! 29/4/2015
                          
           real, allocatable :: vel_cel_x_nod(:)  ! 29/4/2015
           real, allocatable :: vel_cel_y_nod(:)  ! 29/4/2015
                          
           real, allocatable :: velcel_x_max(:)  ! 29/4/2015
           real, allocatable :: velcel_y_max(:)  ! 29/4/2015       
                     
           real, allocatable :: max_conc(:)  ! 30/1/2015
           real, allocatable :: max_ws(:)  ! 30/1/2015
           real, allocatable :: max_flow_depth(:)
           real, allocatable :: max_spessore(:)
           real, allocatable :: fin_erosion(:)
           real, allocatable :: v_max(:)
           real, allocatable :: d_max(:)
                          
            real, allocatable :: concmax(:)
                          real, allocatable :: ws_max(:)
                          real, allocatable :: h_max(:)
                          real, allocatable :: spess_max(:)
                          real, allocatable :: fin_erosion_nod(:)
                          
                      
      real dist, quota_wse, quota_eros, xll, yll, quota_conc
      real quota_vx, quota_vy, quota_h, quota_spessore, vel_z, quota_ws
      real quota_tau_x, quota_tau_y, quota_vx_cel, quota_vy_cel
	integer ndry(180000)
	
	
        
        character*1000 file_2dm, file_flt, file_sol_h, file_sol_wse
        character*1000 file_sol_max_flow_depth, file_sol_max_spessore
        character*1000 file_sol_eros, file_input_h, file_input_wse
        character*1000 file_input_eros, file_input_vel, file_sol_vel
        character*1000 file_sol_eros_fin, file_sol_max_vel
        character*1000 file_input_velcel, file_sol_max_cellvel   ! 29/4/2015
        character*1000 file_sol_cell_vel  ! 29/4/2015
        character*1000 file_sol_max_conc, file_sol_max_ws
        character*100  prima_riga
        character*1000 file_sol_max_tau  ! 28/4/2015
        character*1000 file_sol_conc, file_input_conc   ! 18/9/2017
        
        
   ! 	definizioni per banner

	integer MFLG,IREC1,IWRT1,IBAN(1200),IWRT2,IWRT3,IREC(40),FREC(40),
     +        IWRT4,ITIT(77)

	MFLG=120
	IREC1=435
	IWRT1=1200
	
	DATA IBAN /1200*1/

	IWRT2=40
	IWRT3=40

	DATA IREC /40*1/
	DATA FREC /40*1/

	IWRT4=77

	DATA ITIT /77*1/

	i_test=0
	i_sed=0
	
	
	 i_sh_col2 = (/  -1, 1, 1,  -1  /) 
	 i_sh_row2  =(/ -1, -1,  1,  1/)	
c----------------------------------------------------------------------
         
        !********************************
        !  apertura file input
        !********************************

         file_input_h = fileSOL1
         file_input_wse = fileSOL2
         if (control_eros.eq.1.0) then
         file_input_eros = fileSOL3
         endif
         file_input_vel = fileSOL4
         file_input_velcel = fileSOL5
         file_input_conc = fileSOL6  ! 18/9/2017
         
         
         open (1000001,file=file_input_h,err=501)
         open (1000002,file=file_input_wse,err=502)
         open (1000006,file=file_input_conc,err=506)  ! 18/9/2017
         if (control_eros.eq.1.0) then
         open (1000003,file=file_input_eros,err=503)
         endif
   !     open (1000004,file=file_input_vel,err=504)
         open (1000005,file=file_input_velcel,err=505)
        
         
         
         
         j_TS = 0
         
       do i = 1,99999999999999999
         read (1000001,'(a2))',err=501, end=100) TS
         if (TS.eq.'TS') j_TS = j_TS + 1
       enddo
         
100   continue

       close(1000001)
      
      
       open (1000001,file=file_input_h,err=501)
        
        !********************************
        !  apertura file output
        !********************************
        
         !  file geometria    
    
       file_2dm = fileLog
     
         	retint = scan (fileLog,'.')
      if (retint > 1) then
	
      file_2dm = fileLog(1:retint-1)//'.2dm'
      endif
      
	open(11000011,file=file_2dm)
	
	
		
	! file sol
	
	retint = scan (fileLog,'.')
      
      if (retint > 1) then
	
      file_sol_h = fileLog(1:retint-1)//'_flow_depth.sol'
      file_sol_wse = fileLog(1:retint-1)//'_wse.sol'
      file_sol_conc = fileLog(1:retint-1)//'_conc.sol'
      file_sol_max_flow_depth = fileLog(1:retint-1)//
     1'_max_flow_depth.sol'
      file_sol_max_spessore = fileLog(1:retint-1)//'_max_thickness.sol'
      
      if (control_eros.eq.1.0) then
      file_sol_eros_fin = fileLog(1:retint-1)//'_erosion_depth_last.sol'
      file_sol_eros = fileLog(1:retint-1)//'_erosion_depth.sol'
      endif
      
	file_sol_cell_vel = fileLog(1:retint-1)//'_velocity.sol'
      file_sol_max_conc = fileLog(1:retint-1)//'_max_conc.sol'
      file_sol_max_ws = fileLog(1:retint-1)//'_max_ws.sol'
      file_sol_max_cellvel =fileLog(1:retint-1)//'_max_velocity.sol'
      file_sol_max_tau = fileLog(1:retint-1)//'_max_tau.sol'

      endif 

       open(11000050,file=file_sol_h)
              
       open(11000051,file=file_sol_wse)
      
       if (control_eros.eq.1.0) then
         open(11000054,file=file_sol_eros)
         open(11000058,file=file_sol_eros_fin)
       endif
       
       open(11000056,file=file_sol_max_flow_depth)
        
       open(11000057,file=file_sol_max_spessore)

       open(11000061,file=file_sol_max_conc)    ! 30/1/2015
       open(11000062,file=file_sol_max_ws)    ! 30/1/2015
       open(11000063,file=file_sol_max_tau)    ! 28/4/2015
       open(11000064,file=file_sol_cell_vel)    ! 29/4/2015
       open(00065,file=file_sol_max_cellvel)    ! 29/4/2015
       open(11000066,file=file_sol_conc)    ! 18/9/2017
         
       num_nodi = 5*num_celle_bacino
	 
	 allocate  (coord(num_celle_bacino,3))
	 allocate  (n_element(no_columns,no_rows))
	 allocate  (nop(num_celle_bacino,4))
	 allocate  (nodxyz(num_nodi,3))
	 allocate  (profond(num_celle_bacino))
	 allocate  (wse(num_celle_bacino))
       allocate  (conc_sms(num_celle_bacino))   ! 18/9/2017
	 if (control_eros.eq.1.0) then
	 allocate  (erosion_depth(num_celle_bacino))
	 endif
	 allocate  (vel(num_celle_bacino))
	 allocate  (dir_vel(num_celle_bacino))
	 allocate  (vel_x(num_celle_bacino))
	 allocate  (vel_y(num_celle_bacino))
	 allocate  (i_material_element(num_celle_bacino))
	 allocate  (max_flow_depth(num_celle_bacino))
	 allocate  (max_ws(num_celle_bacino))   ! 30/1/2015
	 allocate  (max_conc(num_celle_bacino))   ! 30/1/2015
	 allocate  (max_spessore(num_celle_bacino))
	 if (control_eros.eq.1.0) then
	 allocate  (fin_erosion(num_celle_bacino))
	 endif
	 allocate  (v_max(num_celle_bacino))
	 allocate  (d_max(num_celle_bacino))
	 
	 allocate  (tau_x_max(num_celle_bacino)) ! 28/4/2015
	 allocate  (tau_y_max(num_celle_bacino)) ! 28/4/2015
	 
	 allocate  (vel_cel_x(num_celle_bacino))  ! 29/4/2015
	 allocate  (vel_cel_y(num_celle_bacino))  ! 29/4/2015
	 allocate  (velcel_x_max(num_celle_bacino))  ! 29/4/2015
	 allocate  (velcel_y_max(num_celle_bacino))  ! 29/4/2015
	  
	 
	 i_cella = 0    

	 xll = or_easting 
	 yll = or_northing
         
	    do j = 1, no_rows
	     do i = 1, no_columns
	     
	     if (ele(i,j).eq.esterno) n_element(i,j) = esterno
	  
	   
	     if (ele(i,j).ne.esterno) then
	     
	        i_cella = i_cella + 1
	        n_element(i,j) = i_cella
	     
	        i_material_element(i_cella) = int(suolo(i,j))
	        coord(i_cella,1) = xll + 0.5*lato_cella + float(i)*lato_cella
	        coord(i_cella,2) = yll + 0.5*lato_cella + float(no_rows - j)
     1*lato_cella
              coord(i_cella,3) = ele(i,j)
                    
	     endif
	   
	   
	   enddo
	 enddo

	 
	 dist=sqrt((coord(1,1)-coord(2,1))**2+(coord(1,2)-coord(2,2))**2)
   
      i_cella = 0
   
      do j = 1, no_rows
	 do i = 1, no_columns
	    
	     if (ele(i,j).ne.esterno) then
	     i_cella = i_cella + 1
	      if (i_cella.eq.1) then
	      ij_iniz = i
	      j_iniz = j
	      endif
	     endif
	  	   
	   enddo
	 enddo
	 
	! write(*,*) i_cella, i_iniz, j_iniz
   !  !   read(*,*) pippo
   
       nnod = 0

          i_cella = 0
     
	 do i = ij_iniz, no_columns
	! write(*,*) i, ele(i,j_iniz)
	 if (ele(i,j_iniz).ne.esterno) then
       !   write(*,*) i, j_iniz
        i_cella = i_cella + 1
        
       ! n_element(i_iniz,j_iniz) = 1
        
        if (i_cella.eq.1) then
        
    !  write(110,'(I5,2f20.2)') i_cella,coord(i_cella,1),coord(i_cella,2)
    !  write(110,*)
    !  write(110,*)
      
    !  write(120,'(I5,2f20.2)') i_cella,coord(i_cella,1),coord(i_cella,2)
    !  write(120,*)
    !  write(120,*)
           
           do j = 1,4
           
            nnod=nnod+1		
            nodxyz(nnod,1)=coord(i_cella,1) + float(i_sh_col2(j))*dist/2		! coordinata x
			nodxyz(nnod,2)=coord(i_cella,2) + float(i_sh_row2(j))*dist/2
			nop(i_cella,j)=nnod
	!		write(110,'(I5,2f20.2)') nnod,  nodxyz(nnod,1), nodxyz(nnod,2)
			
		
           
           enddo
           
      !     write(110,*)
      !     write(120,*)
           
           else
           
    !  write(110,*)
   !   write(110,*)     
   !  write(110,'(I5,2f20.2)') i_cella,coord(i_cella,1),coord(i_cella,2)
    !  write(110,*) n_element(i,j_iniz)
   !   write(110,*)
      
   !    write(120,*)
   !   write(120,*)     
   !   write(120,'(I5,2f20.2)') i_cella,coord(i_cella,1),coord(i_cella,2)
   !   write(120,*) n_element(i,j_iniz)
   !   write(120,*)
      
                   
           
           
              do j = 2, 3
              
            nnod=nnod+1		
            nodxyz(nnod,1)=coord(i_cella,1) + float(i_sh_col2(j))*dist/2		! coordinata x
			nodxyz(nnod,2)=coord(i_cella,2) + float(i_sh_row2(j))*dist/2
			nop(i_cella,j)=nnod
			
		              
              
              enddo
           
           nop(i_cella,1) = nop(i_cella-1,2)
           nop(i_cella,4) = nop(i_cella-1,3)
          
          
   !        do j = 1,4
   !    write(110,'(I5,2f20.2)') nop(i_cella,j), nodxyz(nop(i_cella,j),1) 
   !  1,nodxyz(nop(i_cella,j),2)
    !       enddo
           
          
      
           
           
          endif
          
          endif
          
          enddo


         !  per gli elementi dalla seconda riga in poi

	        do j = j_iniz+1, no_rows
	           do i = 1, no_columns
	    
	            if (ele(i,j).ne.esterno) then
	            
	            
	                 i_cella = i_cella + 1
	                 
	!write(110,*)
    !  write(110,*)     
    !  write(110,'(I5,2f20.2)') i_cella,coord(i_cella,1),coord(i_cella,2)
    !  write(110,*) n_element(i,j)
    ! write(110,*)
      
          	            

                   if (ele(i-1,j).ne.esterno) then    !  ELEMENTO A EST  NODO 1 
                   
                      nop(i_cella,1) = nop(i_cella-1,2)
                     
                                      
                    else
                    
                   
             nnod = nnod + 1
            nodxyz(nnod,1)=coord(i_cella,1) + float(i_sh_col2(1))*dist/2		! coordinata x
			nodxyz(nnod,2)=coord(i_cella,2) + float(i_sh_row2(1))*dist/2
                    
                     nop(i_cella,1) = nnod 
                
                                      
                   
                   endif 
                                    
                   !  NODO 4
                  
                      if (ele(i-1,j-1).ne.esterno) then

                        nop(i_cella,4) = nop(n_element(i-1,j-1),2)
                        
                          else
                        
                            if (ele(i-1,j).ne.esterno) then
                            
                                nop(i_cella,4) = nop(i_cella-1,3)
                       
                             
                                  else
                                  
                            if (ele(i,j-1).ne.esterno) then
                                    
                               nop(i_cella,4) = nop(n_element(i,j-1),1)
                                
                                 else
                               
                                 
            nnod = nnod + 1
            nodxyz(nnod,1)=coord(i_cella,1) + float(i_sh_col2(4))*dist/2		! coordinata x
			nodxyz(nnod,2)=coord(i_cella,2) + float(i_sh_row2(4))*dist/2
                    
                     nop(i_cella,4) = nnod 
                     
           
                                 
                              endif
                              
                              
                              endif
                                 
                                 
                      endif
                                                                        
                                         
                
                   !  NODO 3


                       if (ele(i,j-1).ne.esterno) then                           


                        
                         nop(i_cella,3) = nop(n_element(i,j-1),2)
                      
                         
                      
                        else
                        
                      			
			
			                 if (ele(i+1,j-1).ne.esterno) then                 
                            
                              nop(i_cella,3) = nop(n_element(i+1,j-1),1)
                         
                               else
                                      
                         nnod = nnod + 1
            nodxyz(nnod,1)=coord(i_cella,1) + float(i_sh_col2(3))*dist/2		! coordinata x
			nodxyz(nnod,2)=coord(i_cella,2) + float(i_sh_row2(3))*dist/2       
                    nop(i_cella,3) = nnod   
                    
               


                             endif


                        endif
                        
                        ! NODO 2
                     
                        
                        
                     
                     
                         nnod = nnod + 1
            nodxyz(nnod,1)=coord(i_cella,1) + float(i_sh_col2(2))*dist/2		! coordinata x
			nodxyz(nnod,2)=coord(i_cella,2) + float(i_sh_row2(2))*dist/2             
                     nop(i_cella,2) = nnod
                     
                  
  !       do jj = 1,4
  !     write(110,'(I9,2f20.2)') nop(i_cella,jj), 
   !  1nodxyz(nop(i_cella,jj),1), 
   !  1nodxyz(nop(i_cella,jj),2)
    !       enddo 
           
                           
                          
                        
               endif         
               enddo
               enddo         

       numero_nodi = nnod 
       
       allocate (n_nod_elem(numero_nodi))                       
       allocate (nod_elem(numero_nodi,4))         
       
         
       nelem = num_celle_bacino   ! modifica del 6/11/2013


c********************************************************************************
	
	do i=1,nnod

		n_nod_elem(i)=0
		

	enddo

	do i=1,nelem	! determina gli elementi collegati ad ogni nodo

		do j=1,4

			n_nod_elem(nop(i,j))=n_nod_elem(nop(i,j))+1

			nod_elem(nop(i,j),n_nod_elem(nop(i,j)))=i

		enddo
		
			

	enddo
c*********************************************************************************

c	quotatura dei nodi sulla base delle quote delle celle collegate

	do i=1,nelem

		do j=1,4	! nodi d'angolo

			i_nod=nop(i,j)	! nodo considerato

			quota=0.0

			do jk=1,n_nod_elem(i_nod)

				quota=quota+coord(nod_elem(i_nod,jk),3)

			enddo

			nodxyz(i_nod,3)=quota/n_nod_elem(i_nod)


		enddo

	enddo
	
****************************************************************
*                        SCRITTURA FILE 2dm
****************************************************************


            i_material = 1
            
! 	write(10,2001)
!2001	format('T1',/,'T2 geometria da FLT',/,'T3',/'SI  1',
!     +       /,'$L  3  0  6  0')           
       
       	write(11000011,2011)
2011	format('MESH2D',/,'MESHNAME "da flt"',/,'NUM_MATERIALS_PER_ELEM 1')
     
    !  i_material = 1

	do i=1,nelem
       
!		write(10,2002) i,(nop(i,j),j=1,4),i_material,0.0
!2002		format('GE',10i7,f7.1)

		write(11000011,2022) i,(nop(i,j),j=1,4),i_material_element(i)
2022		format('E4Q',8i7)

	enddo

	do i=1,nnod

!		write(10,2003) i,(nodxyz(i,j),j=1,3)
!2003		format('GNN',i8,3f21.4)

		write(11000011,2033) i,(nodxyz(i,j),j=1,3)
2033		format('ND',i8,3f21.4)





	enddo
	
	close(11000011)
!	write(*,2004) file_geo
!2004	format(///,'File della geometria scritto in',/a72,//)



****************************************************************
*       SCRITTURA FILES sol h, wse ed eros
****************************************************************




       allocate (depth(nnod))   
       allocate (wse_nod(nnod)) 
       allocate (conc_sms_nod(nnod)) 
       if (control_eros.eq.1.0) then
       allocate (erosion_depth_nod(nnod)) 
       endif  
       allocate (vel_x_nod(nnod))
       allocate (vel_y_nod(nnod))
        allocate (tau_x_nod(nnod))
       allocate (tau_y_nod(nnod))
       allocate (vel_cel_x_nod(nnod))
       allocate (vel_cel_y_nod(nnod))
       
    
       
c	calcolo profondità nodi sulla base delle profondità delle celle collegate



         WRITE(11000050,'("SCALAR")')
          WRITE(11000051,'("SCALAR")')
           WRITE(11000066,'("SCALAR")')  ! 18/9/2017
          if (control_eros.eq.1.0) then
           WRITE(11000054,'("SCALAR")')
          endif

c  record 2
   !   write(50)iwrt1,(IBAN(k),k=1,iwrt1)
       sca = 'ND'
    !   write(50) sca,  nnod
       WRITE(11000050,'("ND    ",I7)') nnod
        WRITE(11000051,'("ND    ",I7)') nnod
         WRITE(11000066,'("ND    ",I7)') nnod  ! 18/9/2017
        if (control_eros.eq.1.0) then
         WRITE(11000054,'("ND    ",I7)') nnod
        endif

c  record 3
   !   write(50)iwrt2,iwrt3,(IREC(k),k=1,iwrt2),(FREC(K),k=1,iwrt3)
       sca = 'TS   0'


       
       if (control_eros.eq.1.0) then
       
      
      do ii = 1, j_TS
      
       read(1000001,'(a100)') prima_riga
       write(11000050,'(a100)') prima_riga
       
       read(1000002,'(a100)') prima_riga
       write(11000051,'(a100)') prima_riga

       ! 18/9/2017
        read(1000006,'(a100)') prima_riga
       write(11000066,'(a100)') prima_riga
       
       if (control_eros.eq.1.0) then
       read(1000003,'(a100)') prima_riga
       write(11000054,'(a100)') prima_riga
       endif
       
       do j = 1, num_celle_bacino
       read(1000001,*) profond(j)
       read(1000002,'(f15.6)') wse(j)
       read(1000006,'(f15.6)') conc_sms(j)  ! 18/9/2017
       if (control_eros.eq.1.0) then
       read(1000003,'(f15.6)') erosion_depth(j)
       endif
       enddo
       
       do i=1,nelem

		do j=1,4	! nodi d'angolo

			nod=nop(i,j)	! nodo considerato

			quota=0.0
			quota_wse = 0.0
			quota_eros = 0.0
            quota_conc = 0.0  ! 18/9/2017

			do jk=1,n_nod_elem(nod)

				quota=quota+profond(nod_elem(nod,jk))
				quota_wse=quota_wse+wse(nod_elem(nod,jk))
                quota_conc=quota_conc+conc_sms(nod_elem(nod,jk))  ! 18/9/2017
				if (control_eros.eq.1.0) then
				quota_eros=quota_eros+erosion_depth(nod_elem(nod,jk))
				endif

			enddo

			depth(nod)=quota/n_nod_elem(nod)
			wse_nod(nod) = quota_wse/n_nod_elem(nod)
            conc_sms_nod(nod) = quota_conc/n_nod_elem(nod)   ! 18/9/2017
			if (control_eros.eq.1.0) then
			erosion_depth_nod(nod) = quota_eros/n_nod_elem(nod)
			endif


		enddo

	enddo
	
	  do i = 1, nnod
  !    write(50,'(f20.6)') depth(i)
    !    write(50,*) depth(i)
        write(11000050,'(f15.6)') depth(i)
        write(11000051,'(f15.6)') wse_nod(i)
         write(11000066,'(f15.6)') conc_sms_nod(i)   ! 18/9/2017
        if (control_eros.eq.1.0) then
        write(11000054,'(f15.6)') erosion_depth_nod(i)
        endif
       
       enddo
    
    
      enddo ! fine ciclo j_TS
      
      else
      
      do ii = 1, j_TS
      
       read(1000001,'(a100)') prima_riga
       write(11000050,'(a100)') prima_riga
       
       read(1000002,'(a100)') prima_riga
       write(11000051,'(a100)') prima_riga
       
       ! 18/9/2017
       read(1000006,'(a100)') prima_riga
       write(11000066,'(a100)') prima_riga
       
       do j = 1, num_celle_bacino
       read(1000001,*) profond(j)
       read(1000002,'(f15.6)') wse(j)
     
       enddo
       
       do i=1,nelem

		do j=1,4	! nodi d'angolo

			nod=nop(i,j)	! nodo considerato

			quota=0.0
			quota_wse = 0.0
		

			do jk=1,n_nod_elem(nod)

				quota=quota+profond(nod_elem(nod,jk))
				quota_wse=quota_wse+wse(nod_elem(nod,jk))
                quota_conc=quota_conc+conc_sms(nod_elem(nod,jk))  ! 18/9/2017
				
			enddo

			depth(nod)=quota/n_nod_elem(nod)
			wse_nod(nod) = quota_wse/n_nod_elem(nod)
            conc_sms_nod(nod) = quota_conc/n_nod_elem(nod)  ! 18/9/2017
			
		

		enddo

	enddo
	
	  do i = 1, nnod
 
        write(11000050,'(f15.6)') depth(i)
        write(11000051,'(f15.6)') wse_nod(i)
        write(11000066,'(f15.6)') conc_sms_nod(i)! 18/9/2017
    
       
       enddo
    
    
      enddo ! fine ciclo j_TS
      
      
      
      endif
       
                
       
      
****************************************************************
*                        SCRITTURA FILE sol vel 
****************************************************************
   !    WRITE(11000055,'("VECTOR")')
   !    WRITE(11000055,'("ND    ",I7)') nnod
       
       WRITE(11000064,'("VECTOR")')
       WRITE(11000064,'("ND    ",I7)') nnod
            
       
       
       vel_z = 0.0
       
     


  
       do ii = 1, j_TS
      
            
   !    read(1000004,'(a100)') prima_riga
   !    write(11000055,'(a100)') prima_riga
       
         read(1000005,'(a100)') prima_riga
       write(11000064,'(a100)') prima_riga
       
       do j = 1, num_celle_bacino
   !    read(1000004,'(2f15.6)') vel(j), dir_vel(j)
        read(1000005,*) a,b
        vel_cel_x(j) = a
        vel_cel_y(j) = b        
       enddo
       
       
       
       
              
       
       do i=1,nelem

		do j=1,4	! nodi d'angolo

			nod=nop(i,j)	! nodo considerato

			
			quota_vx = 0.0
			quota_vy = 0.0
			
			quota_vx_cel = 0.0
			quota_vy_cel = 0.0
			
			!quota_tau_x = 0.0
			!quota_tau_y = 0.0

			do jk=1,n_nod_elem(nod)

			!	quota_vx=quota_vx+vel_x(nod_elem(nod,jk))
			!	quota_vy=quota_vy+vel_y(nod_elem(nod,jk))
				
				quota_vx_cel = quota_vx_cel + vel_cel_x(nod_elem(nod,jk))
				quota_vy_cel = quota_vy_cel + vel_cel_y(nod_elem(nod,jk))
				
				!quota_tau_x = quota_tau_x+tau_x(nod_elem(nod,jk))
				!quota_tau_y = quota_tau_y+tau_y(nod_elem(nod,jk))
				

			enddo

			
		!	vel_x_nod(nod) = quota_vx/n_nod_elem(nod)
		!	vel_y_nod(nod) = quota_vy/n_nod_elem(nod)
			
			vel_cel_x_nod(nod) = quota_vx_cel/n_nod_elem(nod)
			vel_cel_y_nod(nod) = quota_vy_cel/n_nod_elem(nod)
			
			!tau_x_nod(nod) = quota_tau_x/n_nod_elem(nod)
			!tau_y_nod(nod) = quota_tau_y/n_nod_elem(nod)


		enddo

	enddo
	
	   do i = 1, nnod
  !    write(50,'(f20.6)') depth(i)
    !    write(50,*) depth(i)
   !     write(11000055,'(3f15.6)') vel_x_nod(i), vel_y_nod(i), vel_z
      write(11000064,'(3f15.6)') vel_cel_x_nod(i),vel_cel_y_nod(i),vel_z
        !write(11000066,'(3f15.6)') tau_x_nod(i), tau_y_nod(i), vel_z
   
       
       enddo
    
    
      enddo ! fine ciclo j_TS
      
      
***********************************************************************************
*       SCRITTURA FILES sol h, spessore, vel max, velcel max e finale erosion
***********************************************************************************
        allocate (concmax(nnod))
       allocate (ws_max(nnod))
       allocate (h_max(nnod))   
       allocate (spess_max(nnod)) 
       if (control_eros.eq.1.0) then
         allocate (fin_erosion_nod(nnod))
       endif   
      


! riapertura file sol_h

      close(1000001)
      open (1000001,file=file_input_h,err=501)


      WRITE(11000056,'("SCALAR")')
          WRITE(11000057,'("SCALAR")')
          if (control_eros.eq.1.0) then
           WRITE(11000058,'("SCALAR")')
           endif
       !      WRITE(11000059,'("VECTOR")')
                WRITE(11000061,'("SCALAR")')
                   WRITE(11000062,'("SCALAR")')
                    WRITE(11000063,'("VECTOR")')   ! 28/4/2015
                     WRITE(11000065,'("VECTOR")')   ! 29/4/2015

c  record 2
   !   write(50)iwrt1,(IBAN(k),k=1,iwrt1)
       sca = 'ND'
    !   write(50) sca,  nnod
       WRITE(11000056,'("ND    ",I7)') nnod
        WRITE(11000057,'("ND    ",I7)') nnod
        if (control_eros.eq.1.0) then
         WRITE(11000058,'("ND    ",I7)') nnod
        endif
      !    WRITE(11000059,'("ND    ",I7)') nnod
           WRITE(11000061,'("ND    ",I7)') nnod
           WRITE(11000062,'("ND    ",I7)') nnod
            WRITE(11000063,'("ND    ",I7)') nnod   ! 28/4/2015
             WRITE(11000065,'("ND    ",I7)') nnod   ! 28/4/2015
         

c  record 3
   !   write(50)iwrt2,iwrt3,(IREC(k),k=1,iwrt2),(FREC(K),k=1,iwrt3)
       sca = 'TS   0'

      i_celle2 = 0       
                  
       read(1000001,'(a100)') prima_riga
       write(11000056,'(a100)') prima_riga
       write(11000057,'(a100)') prima_riga
       if (control_eros.eq.1.0) then
       write(11000058,'(a100)') prima_riga
       endif
   !    write(11000059,'(a100)') prima_riga
       write(11000061,'(a100)') prima_riga
       write(11000062,'(a100)') prima_riga
       write(11000063,'(a100)') prima_riga       ! 28/4/2015
       write(11000065,'(a100)') prima_riga       ! 28/4/2015
       
   
       
       
       
        do j = 1, no_rows
	     do i = 1, no_columns
	     	    
	     if (ele(i,j).ne.esterno) then
	     
	       i_celle2 = i_celle2 + 1
	       
	        max_conc(i_celle2) = conc_max(i,j)
	        max_ws(i_celle2) = h_tot_max(i,j)
	        max_flow_depth(i_celle2) = hh_max(i,j)
	        max_spessore(i_celle2) = spessore_max(i,j)
	        if (control_eros.eq.1.0) then  ! modifica 5/11/2014
	        fin_erosion(i_celle2) = erosione_finale(i,j)
	        endif
	 !       v_max(i_celle2) = vel_max(i,j)
	 !       d_max(i_celle2) = direz_max(i,j)
	        tau_x_max(i_celle2) = tauMax_x(i,j)   ! 28/4/2015
	         tau_y_max(i_celle2) = tauMax_y(i,j)   ! 28/4/2015
	         velcel_x_max(i_celle2) = Vx_max(i,j)   ! 29/4/2015
	         velcel_y_max(i_celle2) = Vy_max(i,j)   ! 29/4/2015
	      
	        endif
	        
	        enddo
	        enddo
	        
	        
	        
       
       do i=1,nelem

		do j=1,4	! nodi d'angolo

			nod=nop(i,j)	! nodo considerato

			quota_h=0.0
			quota_ws = 0.0  ! 31/1/2015
			quota_conc = 0.0 ! 31/1/2015
			quota_spessore = 0.0
			quota_eros = 0.0
			

			do jk=1,n_nod_elem(nod)

                quota_conc=quota_conc+max_conc(nod_elem(nod,jk))
                quota_ws=quota_ws+max_ws(nod_elem(nod,jk))
				quota_h=quota_h+max_flow_depth(nod_elem(nod,jk))
				quota_spessore=quota_spessore+max_spessore(nod_elem(nod,jk))
				if (control_eros.eq.1.0) then  ! modifica 5/11/2014
				quota_eros=quota_eros+fin_erosion(nod_elem(nod,jk))
				endif

			enddo

             concmax(nod) =   quota_conc/n_nod_elem(nod)
            ws_max(nod) =   quota_ws/n_nod_elem(nod)
			h_max(nod)=quota_h/n_nod_elem(nod)
			spess_max(nod) = quota_spessore/n_nod_elem(nod)
			if (control_eros.eq.1.0) then  ! modifica 5/11/2014
			fin_erosion_nod(nod) = quota_eros/n_nod_elem(nod)
			endif


		enddo

	enddo
	
	  do i = 1, nnod
  !    write(50,'(f20.6)') depth(i)
    !    write(50,*) depth(i)
        write(11000056,'(f15.6)') h_max(i)
        write(11000057,'(f15.6)') spess_max(i)
        if (control_eros.eq.1.0) then
        write(11000058,'(f15.6)') fin_erosion_nod(i)
        endif
         write(11000061,'(f15.6)') concmax(i)
          write(11000062,'(f15.6)') ws_max(i)
       enddo
       
       
       vel_x = 0.0
       vel_y = 0.0
       vel_x_nod = 0.0
	 vel_y_nod = 0.0
	 
	 !tau_x = 0.0
	 !tau_y = 0.0
	 !tau_x_nod = 0.0
	 !tau_y_nod = 0.0
       
       
   !    do j = 1, num_celle_bacino
       
       
       ! scomposizione in componenti
       
   !    if (d_max(j).eq.1) then
       
   !       vel_x(j) = 0.0
   !       vel_y(j) = (-1.0)*v_max(j)
                    
   !    endif
       
    !   if (d_max(j).eq.2) then
       
   !       vel_x(j) = (-1.0)*sqrt(v_max(j))
   !       vel_y(j) = (-1.0)*sqrt(v_max(j))
                    
   !    endif
       
       
    !    if (d_max(j).eq.3) then
       
    !      vel_x(j) = (-1.0)*v_max(j)
    !      vel_y(j) = 0.0
               
   !    endif
       
   !     if (d_max(j).eq.4) then
       
   !       vel_x(j) = (-1.0)*sqrt(v_max(j))
   !       vel_y(j) = sqrt(v_max(j))

    !   endif
       
   !     if (d_max(j).eq.5) then
       
    !      vel_x(j) = 0.0
   !       vel_y(j) = v_max(j)
                    
    !   endif
       
    !      if (d_max(j).eq.6) then
       
    !      vel_x(j) = sqrt(v_max(j))
    !      vel_y(j) = sqrt(v_max(j))

    !   endif
       
   !     if (d_max(j).eq.7) then
       
   !       vel_x(j) = v_max(j)
    !      vel_y(j) = 0.0
               
    !   endif
       
    !      if (d_max(j).eq.8) then
       
    !      vel_x(j) = sqrt(v_max(j))
    !      vel_y(j) = (-1.0)*sqrt(v_max(j))

   !    endif
       
       
       
    !   enddo
       
       
       
       
       do i=1,nelem

		do j=1,4	! nodi d'angolo

			nod=nop(i,j)	! nodo considerato

			
			quota_vx = 0.0
			quota_vy = 0.0
			
			quota_vx_cel = 0.0
			quota_vy_cel = 0.0
			
			quota_tau_x = 0.0
			quota_tau_y = 0.0

			do jk=1,n_nod_elem(nod)

	!			quota_vx=quota_vx+vel_x(nod_elem(nod,jk))
	!			quota_vy=quota_vy+vel_y(nod_elem(nod,jk))
				
				quota_tau_x = quota_tau_x+tau_x_max(nod_elem(nod,jk))
				quota_tau_y = quota_tau_y+tau_y_max(nod_elem(nod,jk))
				
				quota_vx_cel = quota_vx_cel + velcel_x_max(nod_elem(nod,jk))
				quota_vy_cel = quota_vy_cel + velcel_y_max(nod_elem(nod,jk))
				

			enddo

			
	!		vel_x_nod(nod) = quota_vx/n_nod_elem(nod)
	!		vel_y_nod(nod) = quota_vy/n_nod_elem(nod)
			
			tau_x_nod(nod) = quota_tau_x/n_nod_elem(nod)
			tau_y_nod(nod) = quota_tau_y/n_nod_elem(nod)
			
			vel_cel_x_nod(nod) = quota_vx_cel/n_nod_elem(nod)
			vel_cel_y_nod(nod) = quota_vy_cel/n_nod_elem(nod)
			
			


		enddo

	enddo
	
	
	 do i = 1, nnod
  !    write(50,'(f20.6)') depth(i)
    !    write(50,*) depth(i)
    !    write(11000059,'(3f15.6)') vel_x_nod(i), vel_y_nod(i), vel_z
        write(11000063,'(3f15.6)') tau_x_nod(i), tau_y_nod(i), vel_z
      write(11000065,'(3f15.6)') vel_cel_x_nod(i),vel_cel_y_nod(i),vel_z
      
       
       enddo
       
       
       !  chiusura ed eliminazione file      19/9 - 28/9  2016
       
        CLOSE (1000001, STATUS='DELETE', IOSTAT=I )
        CLOSE (1000002, STATUS='DELETE', IOSTAT=I )
        if (control_eros.eq.1.0) then
         CLOSE (1000003, STATUS='DELETE', IOSTAT=I )
        endif        
                   
       CLOSE (1000005, STATUS='DELETE', IOSTAT=I )
      CLOSE (1000006, STATUS='DELETE', IOSTAT=I )   ! 3/12/2017
               


      return
501   stop ' -------- Error in the input h_sol file ----------------'
502   stop ' -------- Error in the input wse_sol file   ------------'
503   stop ' -------- Error in the input erosion sol file ----------'
504   stop ' -------- Error in the input velocity sol file ----------'
505   stop ' -------- Error in the input cell velocity sol file -----'
506   stop ' -------- Error in the input concentration sol file -----'
      
      
	end
	
	

       subroutine Calcolo_concentrazione(t22,iijj)   ! 6 Dicembre 2013
       
       use mdl_bin5
	
       
       !Sum_conc = 0.0
       
       integer j1
       
       
       ! calcolo 
       
       
       do j = 1, N_step_input(iijj)
       
       if (t_1d(iijj,j).le.t_prima.and.t_1d(iijj,j+1).gt.t_prima) j1 = j
       
       
       enddo
       
       if (t22.le.t_fin(iijj)) then
       
       
         do j = j1+1, N_step_input(iijj)
         
       if (t_1d(iijj,j-1).lt.t22.and.t_1d(iijj,j).ge.t22) j2 = j
         
         enddo
         
         if ((j2-j1).eq.1) then
         
         C1 = Conc_input(iijj,j-1) + (t_prima-t_1d(iijj,j-1))*(Conc_
     1input(iijj,j-1)+Conc_input(iijj,j))/(t_1d(iijj,j-1)+t_1d(iijj,j))
     
          C2 = Conc_input(iijj,j) + (t22-t_1d(iijj,j))*(Conc_
     1input(iijj,j-1)+Conc_input(iijj,j))/(t_1d(iijj,j-1)+t_1d(iijj,j))
     
       !   Conc_inp = 0.5*(C1 + C2)
         
         endif       
         
          if ((j2-j1).eq.2) then
         
         C1 = Conc_input(iijj,j-1) + (t_prima-t_1d(iijj,j-1))*(Conc_
     1input(iijj,j-1)+Conc_input(iijj,j))/(t_1d(iijj,j-1)+t_1d(iijj,j))
     
          C2 = Conc_input(iijj,j) + (t22-t_1d(iijj,j))*(Conc_
     1input(iijj,j-1)+Conc_input(iijj,j))/(t_1d(iijj,j-1)+t_1d(iijj,j))
     
          Conc_inp = 0.5*(C1 + C2)
         
         endif       
       
       
       
       endif
       
       
       
       
       return
       end
       
************************************************************************************************************     
       subroutine Calcolo_SforzoFondo   ! 27 Aprile 2015
       
       use mdl_bin5  
       
      !integer jallocate (tauMax_y(no_columns,no_rows))  !   27/04/2015  tolto il 24/7/2018
      
      real inclin_energia(8), i_x, i_y, tau_x, tau_y, xxxx, yyyy 
      real inclin_fondo(8), inclinaz_fondo, i_fondo_x, i_fondo_y
      real Tx1, Tx2, Tx12,Ty1, Ty2, Ty12, P1, P2, P12, pippo2, PP2
      real pippo3, energ(8), fondo(8), a, b
	 


      i_sh_col = (/  0, -1, -1, -1,  0,  1,  1,  1/) 
	i_sh_row  =(/ -1, -1,  0,  1,  1,  1,  0, -1/)
	
		
	 ! azzeramento variabili sforzo al fondo ad inizio ciclo  ! 21/7/2015
        
        do iii = 1, N_strutture
        
          Tx(iii) = 0.0
          Ty(iii) = 0.0
          P(iii) = 0.0
          SOLLECIT_VERT(iii) = 0.0
                 
          
        enddo        
	
	            
       
       !  calcolo sforzi  tau = gamma x h x sen inclinaz energia
       !  calcolo spinta statica e dinamica
       
       ij = 0.0            	        
	        
	        do i = 1, N_celle_strutt_contigue
        	        	        
       energia(ic_strutt(i),ir_strutt(i)) = 
     1h_tot(ic_strutt(i),ir_strutt(i)) + vel_cella(ic_strutt(i),
     1ir_strutt(i))*vel_cella(ic_strutt(i),ir_strutt(i))/(2.0*9.81)  ! 29/04/2015
 
       densita(ic_strutt(i),ir_strutt(i)) = 
     1conc(ic_strutt(i),ir_strutt(i))*2650.0 + 
     1(1-conc(ic_strutt(i),ir_strutt(i)))*1000.0
     
   !   spintadinamica = densita(icol,irow)*velocit(icol, irow)*
   !  1velocit(icol,irow)*h(icol,irow)
     
   !   spintastatica = 0.5*9.81*densita(icol,irow)*
   !  1h(icol,irow)*h(icol,irow)
     
   !   spintaTOT = spintadinamica + spintastatica
      
  !    if (spintaTOT.gt.spinta(icol,irow)) then
      
  !    spinta_dinamica(icol,irow) = spintadinamica
  !    spinta_statica(icol,irow) = spintastatica
  !    spinta(icol,irow) = spintaTOT
            
       enddo                    
                
        
        !  calcolo lungo x ed y della pendenza della linea dell'energia
        
        ! la linea dell'energia viene calcolata per tutte le direzioni di velocità uscente
            
          do irow = 1, no_rows
	    do icol = 1, no_columns
	    
	          
            if (ele(icol,irow).ne.esterno) then
	        if(val_sorg(icol,irow).ne.100) then
	         if (file_strutture(icol,irow).gt.0.0) then   ! AGGIUNTA DEL 21/7/2015
                               
	         
	              i_x = 0.0
	              i_y = 0.0
	              
	              tan_x = 0.0
	              tan_y = 0.0

                    i_fondo_x = 0.0
                    i_fondo_y = 0.0

                    PP = 0.0
                    Sollecitazione_Verticale = 0.0
	        
	            IF (h(icol,irow).gt.h_routing)   THEN ! INSERITO IL 25/9/2015

                     
	        
	         do j = 1,8
	         
                energ(j) = 0.0
                fondo(j) = 0.0
	         !inclin_energia(j) = 0.0
	         !inclin_fondo(j) = 0.0

                  icj = icol + i_sh_col(j)
                  irj = irow + i_sh_row(j)


          if (ele(icj,irj).ne.esterno) then

	if (val_sorg(icj,irj).ne.100) then

       energ(j) = energia(icj,irj)

         if (suolo(icj,irj).eq.suolo(icol,irow)) then

        
        fondo(j) = h_noerod(icj,irj) 

        else

        fondo(j) = h_noerod(icol,irow)

   !      if (t_dopo.gt.300.and.t_dopo.lt.305) then
   !          if (icol.eq.359.and.irow.eq.260) then
             
    !        write(10,*) j, icj, irj, suolo(icol,irow), suolo(icj,irj)
    !        write(10,*) h_noerod(icol,irow), h_noerod(icj,irj), fondo(j)
            
   !           endif
    !         endif       
        
      endif  
	        
	! call kern (energia(icol,irow),energia(icj,irj),j,sen_tetaj,lato_cella)
	 	 !  if (sen_tetaj.gt.0.0) then
	   	   !    if (j_vel(icol,irow,j).eq.1) then
	              !   inclin_energia(j) = sen_tetaj
                 !    else
                          !   inclin_energia(j) = 0.0
                         !   endif
              !  else
             !    inclin_energia(j) = 0.0
                   !  endif     
        
       endif
       endif                  
               
              enddo
                           
             

      i_x = sin(atan((energ(6) + 2.0*energ(7) + energ(8) - energ(2) -2.0
     1*energ(3) -energ(4))/(-8.0*lato_cella)))

      i_y = sin(atan((energ(2) + 2.0*energ(1) + energ(8) - energ(4) -2.0
     1*energ(5) -energ(6))/(-8.0*lato_cella)))

      tan_x = (fondo(6) + 2.0*fondo(7) + fondo(8) - fondo(2) 
     1- 2.0*fondo(3) - fondo(4))/(8.0*lato_cella)

      tan_y = (fondo(2) + 2.0*fondo(1) + fondo(8) - fondo(4) 
     1- 2.0*fondo(5) - fondo(6))/(8.0*lato_cella)

      
        i_fondo_x = sin(atan((-1.0)*tan_x)) ! CODICE ORIGINALE
        i_fondo_y = sin(atan((-1.0)*tan_y))

      
      inclinaz_fondo = sin(atan(sqrt(tan_x*tan_x + tan_y*tan_y)))

    !  if (t_dopo.gt.300.and.t_dopo.lt.305) then
    ! !         if (icol.eq.359.and.irow.eq.260) then
    !          do j = 1,8
    ! !        write(10,*) j, fondo(j), energ(j)
    ! !        enddo
   !           write(10,*) i_x, i_y, i_fondo_x, i_fondo_y
    !          endif
   !          endif       
  !            i_x = inclin_energia(7) - inclin_energia(3) - 
 !    1(inclin_energia(2) + inclin_energia(4))/sqrt(2.0) + 
  !   1(inclin_energia(6) + inclin_energia(8))/sqrt(2.0)
     
  !            i_y = inclin_energia(1) - inclin_energia(5) + 
 !    1(inclin_energia(2) + inclin_energia(8))/sqrt(2.0) - 
 !    1(inclin_energia(4) + inclin_energia(6))/sqrt(2.0)    !  CORREZIONE DEI SEGNI DEL 7/10/2015
     
            
        ENDIF    ! INSERITO IL 25/9/2015  
     
        
                   ! tau somma del contributo dovuto allo sforzo tangenziale dovuto alla corrente ed a quello del  di quello del materiale depositato se
                   ! il piano non è orizzontale
          
       tau_x =  9.81*densita(icol,irow)*h(icol,irow)*i_x + 
     19.81*(1000.0*(1-C_fondo(icol,irow)) +
     12650.0*C_fondo(icol,irow))*eros_tot(icol,irow)*i_fondo_x    ! MODIFICHE 16 MAG2015 E 25/9/2015
     
       tau_y =  9.81*densita(icol,irow)*h(icol,irow)*i_y  +
     19.81*(1000.0*(1-C_fondo(icol,irow)) + 
     12650.0*C_fondo(icol,irow))*eros_tot(icol,irow)*i_fondo_y     ! MODIFICHE 16 MAG2015 E 25/9/2015
                        
          tau = sqrt(tau_x*tau_x + tau_y*tau_y) 
          
         if (tauMax(icol,irow).lt.tau) then
                        
         tauMax(icol,irow) = tau
         tauMax_x(icol,irow) = tau_x 
         tauMax_y(icol,irow) = tau_y
         
         endif               
         
                    
         ! aggiunta/modifica del 20/7/2015
         
         do iii = 1, N_strutture
                 
         
         if (suolo(icol,irow).eq.codice_struttura(iii)) then
         
  !    Tx(iii) = Tx(iii) + tau_x + 9.81*(1000.0*(1-C_fondo(icol,irow))+
  !   12650.0*C_fondo(icol,irow))*eros_tot(icol,irow)*i_fondo_x    ! MODIFICA 16 MAG2015
      !   write(10,'("Tx(iii) e Ty(iii) pre",2f20.10)') Tx(iii), Ty(iii)
  
      Tx(iii) = Tx(iii) + tau_x 
      
      Ty(iii) = Ty(iii) + tau_y 
       
      PP = 9.81*densita(icol,irow)*h(icol,irow)*cos(asin(inclinaz_fondo)   ! Eros_tot positivo per deposito  
     1)+ 9.81*(1000.0*(1-C_fondo(icol,irow))+2650.0*C_fondo(icol,irow))*
     1eros_tot(icol,irow)*cos(asin(inclinaz_fondo))    ! MODIFICA 16 MAG2015 E 25/9/2015

       Sollecitazione_Verticale = 9.81*densita(icol,irow)*h(icol,irow) +
     19.81*(1000.0*(1-C_fondo(icol,irow)) + 2650.0*C_fondo(icol,irow))*
     1eros_tot(icol,irow)  
                          
         P(iii)  = P(iii) + PP 

      SOLLECIT_VERT(iii) = SOLLECIT_VERT(iii) + Sollecitazione_Verticale
         
     
      !        if (t_dopo.gt.300.0) then
   !             if (suolo(icol,irow).eq.26.0) then
  !     write(10,*) icol, irow, 
   !    write(10,*) inclinaz_fondo, PP, P(iii), Sollecitazione_Verticale,
  !   1 SOLLECIT_VERT(iii)
 !              endif
  !            endif
       !          if (icol.eq.342.and.irow.eq.273) then
        !    Tx1 = tau_x + 9.81*(1000.0*(1-C_fondo(icol,irow))+
 !    12650.0*C_fondo(icol,irow))*eros_tot(icol,irow)*i_fondo_x 
      !     Ty1 = tau_y + 9.81*(1000.0*(1-C_fondo(icol,irow))+
 !    12650.0*C_fondo(icol,irow))*eros_tot(icol,irow)*i_fondo_y   
 !     write(10,'("i_x",2x,f20.10)') i_x
 !     write(10,'("i_y",2x,f20.10)') i_y
    !  write(10,'("densita",2x,f20.10)') densita(icol,irow)
    !  write(10,'("h",2x,f20.10)') h(icol,irow)
!      write(10,'("tau_x",2x,f20.10)') tau_x
!      write(10,'("tau_y",2x,f20.10)') tau_y
    !  write(10,'("C_fondo",2x,f20.10)') C_fondo(icol,irow)
    !  write(10,'("eros_tot",2x,f20.10)') eros_tot(icol,irow)
!      write(10,'("i_fondo_x",2x,f20.10)') i_fondo_x
!      write(10,'("i_fondo_y",2x,f20.10)') i_fondo_y
  !    write(10,'("inclinaz_fondo",2x,4f20.10)') suolo(icol,irow), 
 !    1inclinaz_fondo, PP, Sollecitazione_verticale

   !         endif         
  !          endif
         
         if (Pmax(icol,irow).lt.PP) Pmax(icol,irow) = PP 
         if (SVmax(icol,irow).lt.Sollecitazione_Verticale) 
     1SVmax(icol,irow) = Sollecitazione_Verticale                             
                  
        endif
        enddo
                 
                    
         endif ! AGGIUNTA DEL 21/7/2015
           endif
             endif
             
        enddo
        enddo
        
        
        ! scrittura sforzi agenti sulla platea
        
        !  mettere dentro anche diversi file dati
        
        
        do iii = 1, N_strutture
        
       write(i_file_sforzoPlatea(iii),'(f20.4,4f18.1)') t_dopo, Tx(iii),
     1 Ty(iii), P(iii), SOLLECIT_VERT(iii)
        
        enddo     
             
       
       
        return
       end

************************************************************************************************************     
       subroutine Calcolo_velocita_media_cella(UUU,j,iii)   ! 27 Aprile 2015
       
       use mdl_bin5  
       
       real UUU
       integer j, iii

        
	        
          
          if (j.eq.1) then
          
            Vy(ic_routing(iii),ir_routing(iii)) = 
     1Vy(ic_routing(iii),ir_routing(iii)) - UUU
          
          endif
          
          
           if (j.eq.2) then
          
      Vx(ic_routing(iii),ir_routing(iii)) = 
     1Vx(ic_routing(iii),ir_routing(iii)) - sqrt(UUU)
     
      Vy(ic_routing(iii),ir_routing(iii)) = 
     1Vy(ic_routing(iii),ir_routing(iii)) - sqrt(UUU)
          
          
          endif
          
          
           if (j.eq.3) then
          
            Vx(ic_routing(iii),ir_routing(iii)) = 
     1Vx(ic_routing(iii),ir_routing(iii)) - UUU
          
          endif
          
          
            if (j.eq.4) then
          
      Vx(ic_routing(iii),ir_routing(iii)) = 
     1Vx(ic_routing(iii),ir_routing(iii)) - sqrt(UUU)
     
      Vy(ic_routing(iii),ir_routing(iii)) = 
     1Vy(ic_routing(iii),ir_routing(iii)) + sqrt(UUU)
          
          
          endif
          
          
           if (j.eq.5) then
          
            Vy(ic_routing(iii),ir_routing(iii)) = 
     1Vy(ic_routing(iii),ir_routing(iii)) + UUU
          
          endif
          
           if (j.eq.6) then
          
      Vx(ic_routing(iii),ir_routing(iii)) = 
     1Vx(ic_routing(iii),ir_routing(iii)) + sqrt(UUU)
     
      Vy(ic_routing(iii),ir_routing(iii)) = 
     1Vy(ic_routing(iii),ir_routing(iii)) + sqrt(UUU)
          
          
          endif
          
          
          if (j.eq.7) then
          
            Vx(ic_routing(iii),ir_routing(iii)) = 
     1Vx(ic_routing(iii),ir_routing(iii)) + UUU
          
          endif
          
          
            if (j.eq.8) then
          
      Vx(ic_routing(iii),ir_routing(iii)) = 
     1Vx(ic_routing(iii),ir_routing(iii)) + sqrt(UUU)
     
      Vy(ic_routing(iii),ir_routing(iii)) = 
     1Vy(ic_routing(iii),ir_routing(iii)) - sqrt(UUU)
          
          
          endif
 	     
 	     
 	         return
       end
*************************************************************************************
        subroutine Sezioni999() !BERNARD
        use mdl_bin5
        integer countO,countS,countE,countN,massimo
		real, allocatable :: InternalOutputValleCopy(:,:)
		allocate(InternalOutputValleCopy(no_columns,no_rows))
        Write(1299,*) "Subroutine",Nsez
        do i = 1, Nsez
        Write(1299,*) sezioniInterne(i)%index
            do j = 1, sezioniInterne(i)%index
                
                ir=sezioniInterne(i)%seqCell(j)%ir
                ic=sezioniInterne(i)%seqCell(j)%ic

                !4 direzioni cardinali
                if (ic>1) then
                    DEM_O=ele(ic-1, ir)
                    if (ele(ic,ir).gt.DEM_O.and.InternalOutput(ic-1, ir)
     1.eq.esterno) then
                        sezioniInterne(i)%direzioni(3)=
     1sezioniInterne(i)%direzioni(3)+1 
                    endif
                endif
                if (ic<no_columns) then
                    DEM_E=ele(ic+1, ir)
                    if (ele(ic,ir).gt.DEM_E.and.InternalOutput(ic+1, ir)
     1.eq.esterno) then
                        sezioniInterne(i)%direzioni(4)=
     1sezioniInterne(i)%direzioni(4)+1  !InternalOutputValle(ic+1,ir)=999
                    endif
                endif
                if (ir>1) then
                    DEM_N=ele(ic, ir-1)
                    if (ele(ic,ir).gt.DEM_N.and.InternalOutput(ic, ir-1)
     1.eq.esterno) then
                        sezioniInterne(i)%direzioni(1)=
     1sezioniInterne(i)%direzioni(1)+1 !InternalOutputValle(ic,ir+1)=999
                    endif
                endif
                if (ir<no_rows) then
                    DEM_S=ele(ic, ir+1)
                    if (ele(ic,ir).gt.DEM_S.and.InternalOutput(ic, ir+1)
     1.eq.esterno) then
                        sezioniInterne(i)%direzioni(2)=
     1sezioniInterne(i)%direzioni(2)+1 !InternalOutputValle(ic,ir-1)=999
                    endif
                endif




            enddo
        
        end do
        
        
               
        do i = 1, Nsez
            countN=sezioniInterne(i)%direzioni(1)
            CountO=sezioniInterne(i)%direzioni(3)
            CountS=sezioniInterne(i)%direzioni(2)
            CountE=sezioniInterne(i)%direzioni(4)

            massimo=max(countO,countS,countE,countN)
                 
            do j = 1, sezioniInterne(i)%index
                ir=sezioniInterne(i)%seqCell(j)%ir
                ic=sezioniInterne(i)%seqCell(j)%ic
                
                if (ic>1.and.massimo.eq.countO) then
           
                    if (InternalOutput(ic-1, ir).eq.esterno) then
                        InternalOutputValle(ic-1,ir)=999
                    endif
                endif
                if (ic<no_columns.and.massimo.eq.countE) then
            
                    if (InternalOutput(ic+1, ir).eq.esterno) then
                        InternalOutputValle(ic+1,ir)=999
                    endif
                endif
                if (ir<no_rows.and.massimo.eq.countS) then
            
                    if (InternalOutput(ic, ir+1).eq.esterno) then
                        InternalOutputValle(ic,ir+1)=999
                    endif
                endif
                if (ir>1.and.massimo.eq.countN) then
            
                    if (InternalOutput(ic, ir-1).eq.esterno) then
                        InternalOutputValle(ic,ir-1)=999
                    endif
                endif




        
            end do
        
        
        end do
        
  
			InternalOutputValleCopy=InternalOutputValle

			do ir = 1, no_rows
				do ic=1,no_columns
			if (InternalOutputValle(ic, ir).ne.esterno) then
            if (InternalOutputValle(ic-1, ir-1).ne.esterno) then
                if (InternalOutput(ic-1, ir).eq.esterno) then
                    InternalOutputValleCopy(ic-1,ir)=999
                else
                    InternalOutputValleCopy(ic,ir-1)=999
                endif
            else if (InternalOutputValle(ic+1, ir-1).ne.esterno) then
                if (InternalOutput(ic, ir-1).eq.esterno) then
                    InternalOutputValleCopy(ic,ir-1)=999
                else
                    InternalOutputValleCopy(ic+1,ir)=999
                endif
            endif
  
            endif
           enddo
        enddo

        InternalOutputValle=InternalOutputValleCopy	
        do ir = 1, no_rows
		    do ic=1,no_columns
                if (ele(ic,ir).eq.esterno) InternalOutputValle(ic,ir)=
     1esterno
            enddo
        enddo
        return
      end
************************************************************************************************
       
       
       
       
        real function externalValue (fileName)
        use mdl_bin5
        implicit none
        integer kkk,j,retint
        character*(*) fileName
        character*1000 fileHeaderTemp
        character*60 alfa,beta

        retint = scan (fileName,'.') !BERNARD
        if (retint > 1) then
            fileHeaderTemp = fileName(1:retint-1)//'.hdr'
        endif
        open (999,file=fileHeaderTemp,mode='read')

! --------------------------------------------------------------------
      do j=1,8
        read (999,'(a60)',end=1051) alfa
! ---------------------------------- reduce to lowercase
        beta = trim(ADJUSTL(alfa(1:scan(alfa,' ')-1)))
        kkk = len_trim(beta)
        !write(*,*) beta, kkk
        do kkk = 1, len_trim(beta)
        if (ichar(beta(kkk:kkk)) >= 65 .and. ichar(beta(kkk:kkk)) <= 90)
	1 beta(kkk:kkk) = char(ichar(beta(kkk:kkk)) + 32)
        enddo
        if (beta == 'nodata_value') then
         read(alfa(scan(alfa,' '):60),*) externalValue
         return
        endif

      enddo
1051  externalValue=0.0/0.0
      return
      end
*********************************************************************
