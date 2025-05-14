      program deb_gis_bin5_mod7_3v166103
* -------------------------- versione test 2023-------------------------

* Volumi finiti toro

* exporto model to use in linux capri 
* Otimizzazione scrittura file SMS
      
*     Codice parallelo
      
*     Ottimizzazione subroutine readinput
      
* operazione di media sulla QM entrante ed uscente (29/4/2019)

* introduzione calcolo velocità media in base alla conservazione della quantità di moto

* AGGIUNTA CALCOLO SFORZO PILE   (25/12/2018)

* modifica calcolo ws_max che viene eseguito solo se la profondità è superiore a 0.0

* introduzione calcolo velocità media in base alla conservazione della quantità di moto

* introduzione dell'operazione di media della velocità uscenti (12/7/2019)

* aggiunta contributi entranti per il calcolo delle componenti Vx e Vy  (6/7/2018)

* modifica calcolo erosione: limite velocità a 10 m/s

* correzione routine scrittura file SMS

*  scrittura file DEM, Vx, Vy, FreeSurface disabilitata

* modifica scrittura file sezione vecchio

*  celerità limitata da 50 m/s

* scrittura nuovo file sezione con scrittura di tutti i valori di portata

* aggiunta scrittura flow depth + deposition depth (spessore) nel file sezioni

* scrittura file conc per visualizzazione in SMS (18/9/2017)

* introduzione parametri deposito distribuiti (13/9/2017)

* Introduzione limite sulla celerita_massima

* DT_entrain posto uguale al DT_  (prima era 60 secondi)

* nuovo calcolo portata uscente con introduzione file delle sezioni contigue di valle 

* spostamento calcolo Q_entrata nel solo ciclo delle celle delle sezioni

* spostamento del calcolo portata di Q_entrata nel ciclo delle celle attive

* nuovo calcolo valore mediato (21/07/2017) di flow depth, ws, ele ed ele_iniz per la sezione

* nuova sezione con identificativo 999.0 a valle di ogni sezione

* controllo che l'angolo di erosione non sia minore od uguale di quello di deposito (28/9/2016)

* sostituzione aggiornamento file ele con eros_tot invece che con dh_sed (28/9/2016)

* file velcelsol: aggiustamento (28/9/2016)

* eliminazione file soltxt a fine simulazione (19/9/2016)

* correzione errore sulla velocità media (la componente nella direzione 7 non veniva conteggiata mentre nella 5 due volte) 11/3/2015

* scrittura file pre deposito del minimum flow routing  7/2/2016

* snellimento della condizione di inerodibilita 29/1/2016
*introduzione nella condizione di inerodibilità dello spessore erodibile (ad es strato di terreno su opera civile) 28/1/2016 


* eliminati una istruzione quota_finale = .....  ed un else dopo if (dh_neg.lt.0.0) dopo il deflusso a moto uniforme il 27/1/2016
* eliminati cicli dh_eros_tot = 0.0 e do j = 1, K con dh_eros_tot = dh_eros_tot + dh_eros(j) dopo il
* confronto tra differenze solido con solido depositato dopo il deflusso a stramazzo (27/1/2016)
* 
* DT_Internal_Output  in secondi (22/9/2015)
* ulteriore correzioni sezione interne 19/8/2015

* correzione contorno del 16/8/2015

* eliminazione velocita massima e direz vel

* calcolo sforzo su platea

* introduzione calcolo velocita media

* introduzione calcolo sforzo al fondo

* eliminazione scrittura file .out

*  output in secondi

* scrittura file ws e conc e direz vel max

* correzione DT da 5 a 0.5 secondi

* correzione errore contorno

* aggiunta control_eros in tre punti

* correzione su errore iniziale con secondo idrogramma di input

*  correzione errore sul calcolo del deposito intrappolato

*  aggiunta della cstar dipendente dal suolo

*  controllo sul numero e identificativi del file uso suolo raster e txt

*  scrittura portata fondo, tiranti e concentrazione dei file interni mediati su 5 secondi

*  scrittura portata fondo, tiranti e concentrazione dei file interni mediati su 1 secondo

*  bifase

*  riempimento celle di input attivate nei time step successivi all'inizio simulazione

*  modifica dei volumi di entrata iniziali

*  unificazione sia per input costante che variabile della concentrazione

*  inserimento concentrazione solida nell'idrogramma di input

*  eliminazione del numero di passi temporali dal file dell'idrogramma di entrata  

*  sistemazione per inserimento idrogramma totale di input

*  creazione file .2dm e soluzioni per h e wse per SMS

*  introduzione Cmedio  >  C_limite per deflusso intrappolato

*  con equazione stramazzo originale (hi - zj) invece che (hi-hj)

*  con max flow_depth_deposition

*  con file .sol per sms

*  con max_flow_depth e velocity

*  Q_entrata

*  erosione solo con dh/dt>0

*  output dei file DEM

*  calcolo erosione come deposito

*  aggiunta controlllo concentrazioni per erosione e deposito

*  aggiunta file risultati finali

*  aggiustamento file di internal output

*  controllo se le celle routing appartengano al bordo NO

*  introduzione out time step

*   introduzione coeff moltiplicatore per deposito sotto angolo limite

*   introduzione deposito deflusso intrappolato

*   introduzione angolo limite per deposito in zone pianeggianti (per deflusso a stramazzo)

*    introduzione angolo limite per deposito in zone pianeggianti (solo deflusso a moto uniforme)

*    calcola deposito solo in direzione j_vel_max per il deflusso a stramazzo se h_vol_str = 0

*    calcola deposito solo in direzione j_vel_max per il deflusso a moto uniforme

*     condensa del calcolo dell'erosione/deposito in un unico ciclo al termine
*     del calcolo idraulico

*     correzione errore sulla determinazione file direzioni di velocità: 
*     nel caso di mobile bed in alcuni casi con velocità non nulla dava zero 
*     perchè non ricalcolava le direzioni di deflusso quando variava la quota del fondo
*     (aggiustamento subroutine ricalibratura1 e ricalibratura2

*     condensa del calcolo della velocità massima e della corrispondente direzione
*     un unico ciclo

*     ri-aggiustamento file di output

*     condensa del calcolo della velocità massima e della corrispondente direzione
*     un unico ciclo

*     eliminazione file .flt DEM dal file comandi ed aggiustamento file output

*     utilizzo file uso suolo

*     numero libero di file di output

*     eliminazione time step

*      aggiunta warning per probabile superamento del numero massimo di celle striscia 

*      modifica h_routing

*      modifica h_erosione solo per erosione

*      
*     ulteriore modifica condizioni al contorno (eliminazione N_celle_contorno_MAX) ed eliminazione delle celle sorgenti
*     da quelle al contorno

*      modifica condizioni al contorno

*     rispetto a v4 cambio estensione da ctr a log e nome file flt di output uguale al file comandi


*     rispetto a v3 modifica dh = - h_vol_str - ddh_tot

*     rispetto a v2 modifica dh_entrata_unif e belangier

*     rispetto a v1 la modifica del 22 Ottobre 2010 per il deflusso a stramazzo
*      
*      rispetto a deb_gis_bin sono eliminati i time steps dalla variabili allocate

*      rispetto al deb_gis_bin_mod due costanti di Egashira e nuova compatibilit\'a erosione e 
*      spostamento aggiornamento celle per deflusso ed erosione/deposito da prima ciclo differenze altezza a fine ciclo 
*      aggiornamento profondità celle striscia mediante dh invece che h = h - ddh_tot - h_vol_str

*     modifica controllo continuità ed oscillazioni per le celle striscia
*     mette erosione e deposito in una subroutine


c       senza la modifica sulle celle striscia che diventano sorgente 


c       correzione errore sulla condizione al contorno   8 Agosto 2011
c       introduzione controllo a fine ciclo che le profondità siano positive
c       con scrittura del file .err in caso contrario


c       inserimento file velocità
      
      
      use mdl_bin5
	use dflib
      use msflib !BERNARD			
      use OMP_lib !BARBINI
    
      
      integer i, j, icj, irj, m, otto, nerc, kx, ky, N_iji, jij, ijij
	
	integer  icol, irow, iz, ij, index_timing
	integer ii, jj, iii, jjj, iiii, jjjj, mm
	
	integer N_sugg

	integer i_file, i_file2, i_file3, i_file4, i_file5, i_file6
      integer i_file_step

	integer  N_DT, ic1, ir1, iij
      integer  ic, ir, iijj,ic_ss,ir_ss
	integer  i_max, i_cont, i_cont_file

**************************************************** MARZO 09 Boundary condition **************
	integer  N_righe_mezzo, N_colonne_mezzo, N_lati_contorno, i1 , i2
	integer  N_celle_contorno, N_colonne, N_righe, diff_i1, diff_i2
	integer  ic_iniz_sx, ir_iniz_sx, ic_iniz_dx, ir_iniz_dx 
      integer  ic_fin_sx, ir_fin_sx, ic_fin_dx, ir_fin_dx 
	integer  i_shh_col(5), i_shh_row(5), attivazione, indMB1 indMB2 !BERNARD
	integer  ic_plot, ir_plot, def_int_on, max_s
	integer  ic_bc_1(10), ic_bc_2(10), ir_bc_1(10), ir_bc_2(10)
***********************************************************************************************

      
      
      
      
	integer*2    get_status


	integer, allocatable ::  i_flag2(:)  !Boundary condition *****
	integer, allocatable ::  i_cont2(:)  !Boundary condition *****
      
      
      integer, allocatable ::  contaCelleSezInt(:) 
	logical controlla_attivazione !BERNARD
      integer zero_int
	
      real segno, pes, sumpes, pesk
	real sumpesk, h_totale, V_totale,ValoreEsterno

      real, parameter :: pigreco=3.141593
	
	real dh_cost(8), h_affluito, h_defluito, DHH(8), DHH_tot
	real peso_e(8), alfa(40), DDH(8), ddh_tot, peso_s(8)

	real control2, control3

      real max_d_ele, max_d_ele_h2o,vx_in,vy_in, v_tot
      real U_k_min
      
      integer j_d_ele, j_d_ele_h2o
          

      real zero, coeff, cel,  H_t0 , H_t1 
	real DT, h_vol, h_vol_str, Qtot, beta, betamin
	real h_fin_destinaz_max, h_fin_origine, h_fin(8), vero, dh_cost_tot
	real h_iniz_destinaz_max, allarme2, h_fine, hh, tempo_iniziale
	real DT_medio, t_simulaz_finale, t_sugg

	real r_ic, r_ir, volume_entrato(100)
      real function fun_beta
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
      real flag_int_tempo_finale, p_con(4), Con, C0, C75
      
      real vol_grav,vol_bel,vol_int,ero_tot,ero_tot_solid,L
      real WSE_max,Q_diag(5),F_x(5),F_y(5),Slope_pp(4,2),Uxy
      real Q_pp(4,5),S_cor(4,5),Sx,Sy,n_div_slope(2),Flux_x_pp(4,5)
      real Flux_y_pp(4,5),Slope_pp_v(4,2),S0(5),Scab_x,Scab_y,S_0(5)
      real Dx,Dy,a,b,d,n_celle_C,Conc_minimo,Conc_m,cel_max(2),n_celle
      real coef_wall (2,4),coef_diag(4),Vol_s_cella,u_max, v_max
      real, parameter :: g = 9.81
      real, parameter :: rad_grad = pigreco/180
      integer Angolo(4),ind_Qx_max(2),ind_Qy_max(2)
      integer coef_pp(4,2),k_cor,n_div(4),dir_U
      

      
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

      DFRM_VERSION ='DFRM_FV_TORO Ver. dic2023 TESI_Dott mod condzioni
     1al contorno'
      
      
	i_sh_col = (/  0, -1, -1, -1,  0,  1,  1,  1/) 
	i_sh_row  =(/  1, 1, 0,  -1,  -1,  -1,  0, 1/)

	i_shh_col = (/ -1, -1, 0,  1,  1/) 
	i_shh_row  =(/  0,  1, 1,  1,  0/)

	i_qhh_col = (/ -1,  0, 1,  0/) 
	i_qhh_row = (/  0,  1, 0, -1/) 

      i_jj = (/  5, 6, 7, 8,  1, 2, 3,  4/) 
      
      ic_plot = 1348
      ir_plot = 285
      
      coef_mm(:) = (/ 0, 3, 4, 5  /)
      
      j_check(:) = (/ 2, 1, 4, 3 /)  
          
          
      ic_corner = (/1, 0, 0, 1/)
      ir_corner = (/1, 1, 0, 0/)
	
      dir_U_Nan(:,1) = (/7, 0, 3, 0/)
      dir_U_Nan(:,2) = (/3, 1, 0, 0/)
      dir_U_Nan(:,3) = (/0, 5, 0, 1/)
      dir_U_Nan(:,4) = (/3, 5, 0, 0/)
      dir_U_Nan(:,5) = (/7, 0, 3, 0/)
      dir_U_Nan(:,6) = (/7, 5, 0, 0/)
      dir_U_Nan(:,7) = (/0, 5, 0, 1/)
      dir_U_Nan(:,8) = (/7, 1, 0, 0/)
      
      
* ----------------------------------------------------------------------
      TotalCPUS = OMP_get_num_procs()
      
 !     open ( 0,file='user',title='Cells Routing Model3',carriagecontrol=
	!1'fortran')
 !     i4 = setbkcolor(15)
 !     i4 = settextcolor(INT2(0)) 
 !     call clearscreen($GCLEARSCREEN)
 !     open (20,file='user',title='Parameter Definition',carriagecontrol=
	!1'fortran')
 !     i4 = setbkcolor(15)
 !     i4 = settextcolor(INT2(0)) 
 !     call clearscreen($GCLEARSCREEN)
 !     open (30,file='user',title='Simulation results',carriagecontrol=
	!1'fortran')
 !     i4 = setbkcolor(15)
 !     i4 = settextcolor(INT2(0)) 
 !     call clearscreen($GCLEARSCREEN)
 !     fileFormat       =      REPEAT(' ', 256)
 !     !fileEle          = REPEAT(' ', 256)
 !     fileCh           =      REPEAT(' ', 256)
 !     file_Internal_Outputs = REPEAT(' ', 256)
 !     fileIdrogramma   =      REPEAT(' ', 256)
 !     fileLandUse      =      REPEAT(' ', 256)
	!fileLandChar     =      REPEAT(' ', 256)
 !     fileElePonti     =      REPEAT(' ', 256)
 !     fileTxtPonti     =      REPEAT(' ', 256)
 !     fileVel_inf_eros = REPEAT(' ', 256)
!  !    fileAng_inf_eros = REPEAT(' ', 256)
!!	fileControllo    = REPEAT(' ', 256)
!
!      fileComandi = 'D:\Dottorato20-21\Modello colate\test_par\Nw_ex\
!     12input_nopar.clm'
!      fileComandi = 'D:\Dottorato20-21\Modello colate\test_par\
!     1\modello_DFRM2\2.clm'
!      fileComandi = 'D:\Dottorato20-21\simulazioni\Cancia\
!     1modello_DFRM2_1CPU\sim10_DFRM2_1CPU.clm'
!      fileComandi = 'D:\Dottorato20-21\simulazioni\Cancia\
!     1modello_DFRM2_11CPU\sim9_DFRM2_11CPU.clm'
                     
     !! fileComandi = 'D:\Dottorato22-23\Verifica modello VF\
     !!1lanzoni2017\SIM_run59\run_59.clm'
      !fileComandi ='E:\Rio_lazer\SIM2023\test_1\execution.clm'
      !get_status = 1
      call getarg (1,buffer) !Legge *.BAT  BERNARD
      
      fileComandi=trim(adjustl(buffer))
      retint = scan(fileComandi,".")
      if (retint.gt.1)then
          get_status = 1
          retint = scan(fileComandi,";")
          if (retint.gt.1)then
          read(fileComandi(retint+1:retint+1),'(i1)')chezy_cont    !27/02/2025 chezy_cont = 0 Chezy costante, chezy_cont = 1 Chezy varia con concetrazione 
          read(fileComandi(retint+3:retint+3),'(i1)')eros_mom_cont !27/02/2025 0 = erosione non contribuisce alla quantità di moto, 1 = erosione contribuisce alla quantità di moto       
          ttt = fileComandi(retint+5:5256)
          read(ttt,*) C0
          fileComandi = fileComandi(1:retint-1)
          C75 = 1.1
          else
          chezy_cont    = 3
          eros_mom_cont = 0
          C0 = 6
          C75 = 1.1
          endif  
          
      else
          
          get_status = 0
      endif 
      
	write(*,*) get_status
      if (get_status > 0) then
          i4 = SETEXITQQ(QWIN$EXITNOPERSIST)
          call readinput
          call decodeinput (20)
          call hdrprepare
      else
 !!         i4 = SETEXITQQ(QWIN$EXITPERSIST)
 !!         call CommandFile2
 !!         do while (fileFormat(1:1) ==' ' .or. fileBC(1:1) ==' '.or.
	!!1 fileIdrogramma(1:1) ==' '.or.fileBC(1:1) ==' ') 
 !!     iresponse = MESSAGEBOXQQ( 'A Compulsory File Name is Missing'C,'Re
	!!1try or Cancel?'C, MB$RETRYCANCEL )
	!!if (iresponse == MB$IDRETRY ) then
 !!     call CommandFile2
 !!     else
 !!     stop
 !!     endif
 !!     enddo
 !!
	!!if (control1.eq.1.0) then
	!!do while (fileLandUse(1:1) ==' ' .or. fileLandChar(1:1) ==' ')
 !!     iresponse = MESSAGEBOXQQ( 'A Compulsory File Name is Missing'C,'Re
	!!1try or Cancel?'C, MB$RETRYCANCEL )
	!!if (iresponse == MB$IDRETRY ) then
 !!     call CommandFile2
 !!     else
 !!     stop
 !!     endif
 !!     enddo
	!!endif
 !!     estensione = '*.clm'
 !!     tipofile = 'File Comandi'
 !!     
 !!     call OpenNewFile (istat, estensione, tipofile, fileComandi)
 !!     if (istat .eqv. .FALSE.) stop
 !!     call decodeinput (20)
 !!     call writeinput
 !!     call hdrprepare
      endif
      
      call time(orario)
      
      Write (0,*) DFRM_VERSION
      retint = 1
      retint1 = scan (fileComandi,'.')
      fileEle = fileComandi
      do While (retint.gt.0)
              
         	retint = scan (fileEle,'\')
          fileEle = fileEle(retint+1:retint1-1)//'.log'
          retint1 = scan (fileEle,'.')
      end do
      write (0,*)
      
      Write (0,'('' SIMULATION NAME = '',a100)')fileEle
      write (0,*)
	write (0,'('' data and control acquisition begins at '',a8)')
	1 orario
	write (10,'('' data and control acquisition begins at '',a8)')
	1 orario
	write (0,*)
	
      Dx =lato_cella
      Dy =lato_cella
      

      
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
      Write (10,'(10x,a70)') DFRM_VERSION
      Write (10,*)
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
   
        allocate (cella_bacino(no_columns,no_rows))
        allocate (celle_routing(no_columns,no_rows))
        allocate (celle_wet(no_columns,no_rows))
      
      n_celle_wet = 0
      celle_wet = 0
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
      write(10,'("Coeff. for inferior debris flow routing ",f10.2)')
	1 coeff_ang_limit

	endif
       write(10,*)
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
	
	!allocate (ic_sol(Num_celle_bacino)) !BARBINI
	!allocate (ir_sol(Num_celle_bacino)) !BARBINI
	!allocate (h_sol(Num_celle_bacino))
	!allocate (htot_sol(Num_celle_bacino))
	!allocate (eros_sol(Num_celle_bacino))
	!!allocate (vel_sol(Num_celle_bacino))
	!!allocate (direz_vel_sol(Num_celle_bacino))
	!
	!allocate (vel_sol_x(Num_celle_bacino))  ! 29/4/2015
	!allocate (vel_sol_y(Num_celle_bacino))   ! 29/4/2015
 !
 !     allocate (conc_sol(Num_celle_bacino))    ! 18/9/2017
      


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
      
       do irow = 1, no_rows
					do icol = 1, no_columns

	     If(ele(icol,irow).ne.esterno) then

         if (control_eros.eq.1.0) then
         
	   Erod(icol,irow) = 1.0
	   !No_erod(icol,irow) = 1.0    !  aggiunta del 17/12/2015
	   
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
	  write(10,'(12f12.1)') uso_suolo(i), scabr(i), Mobile(i), ang_eros(i), 
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
	  write(10,'(13f12.2)') uso_suolo(i), scabr(i), Mobile(i), ang_eros(i), 
	1vel_eros(i), ang_dep(i), vel_dep(i),  C_star(i), cond_noerod(i), 
     1struttura(i), ponte(i)                                                 ! modifica 20/7/2015 e 13/9/2017 e 5/12/2019
		
	
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
	  write(10,'(6f12.1)') uso_suolo(i), scabr(i), struttura(i), 
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


       C_limite_deposito = 0.01
	
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

****************************************************************************************
*                         ACQUISIZIONE AREE E CELLE DI INPUT
****************************************************************************************
       write(10,*) "Lettura raster in-out flow"

       allocate(InletOutlet(no_columns,no_rows))
       allocate(InternalOutput(no_columns,no_rows))	
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
        
        ! InletOutlet(ic,ir)=esterno 
          
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
****************************************************************************************
*                         ACQUISIZIONE SEZIONI E CELLE PER INTERNAL OUTPUT
****************************************************************************************

      if (Intern_Output.eq.1.0) then


	      
      write(10,*) "Lettura file sezioni interne"
	      
    !  allocate(InternalOutput(no_columns,no_rows))	 
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
                if(inletoutlet(ic,ir).ge.5000)then
                    InternalOutput(ic,ir) = inletoutlet(ic,ir)
                endif    
                    
         end do
        enddo
           
	      Nsez=int(maxSezInt-999)
            if (Num_sorgenti.lt.0) Num_sorgenti = 0
      allocate (sezioniInterne(Nsez + Num_sorgenti))

      do i =1,Nsez
        allocate(sezioniInterne(i)%seqCell(contaCelleSezInt(i)))
        sezioniInterne(i)%index=0
        sezioniInterne(i)%direzioni=0
      enddo
      do i =Nsez+1,Nsez+Num_sorgenti
        allocate(sezioniInterne(i)%seqCell(Nsorg1(i-Nsez)))
        sezioniInterne(i)%index=0
        sezioniInterne(i)%direzioni=0
      enddo

      do ir = 1,no_rows
      do ic =1,no_columns
      !bool=isnan(InternalOutput(ic,ir)
        InternalOutputValle(ic,ir)=esterno
        if (InternalOutput(ic,ir)/=esterno.and.
     1    InternalOutput(ic,ir).lt.5000.and.
     1    InternalOutput(ic,ir).ne.9000) then
            i=int(InternalOutput(ic,ir)-999)

            sezioniInterne(i)%index=sezioniInterne(i)%index+1
            sezioniInterne(i)%seqCell(sezioniInterne(i)%index)%ic=ic
            sezioniInterne(i)%seqCell(sezioniInterne(i)%index)%ir=ir
        endif
         if (InternalOutput(ic,ir)/=esterno.and.
     1    InternalOutput(ic,ir).ge.5000.and.
     1    InternalOutput(ic,ir).ne.9000) then
            i=Nsez+int(InternalOutput(ic,ir)-4999)

            sezioniInterne(i)%index=sezioniInterne(i)%index+1
            sezioniInterne(i)%seqCell(sezioniInterne(i)%index)%ic=ic
            sezioniInterne(i)%seqCell(sezioniInterne(i)%index)%ir=ir
        endif
      enddo
      enddo

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
         if(InternalOutput(icol,irow).lt.5000)then
         if (InternalOutput(icol,irow).gt.Output_massimo) 
     1   Output_massimo = InternalOutput(icol,irow)
         endif
         
              
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
     1discharge out (m^3/s)  solid discharge out (m^3/s)  Vx
     1 (m/s)  solid discharge2 out (m^3/s)")')  
     
     
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

 !     allocate(InternalOutput(no_columns,no_rows))          !  11 Lug 2017
      allocate(InternalOutputValle(no_columns,no_rows))        !  11 Lug 2017
      
      InternalOutput = esterno             !  11 Lug 2017
      InternalOutputValle = esterno        !  11 Lug 2017
      
      write(10,*) "Calcolo cella downstream solo per celle sorgenti"
	
      ValoreEsterno=externalValue(file_Internal_Outputs)
		do ir = 1,no_rows
            do ic= 1,no_columns 
               
             if(inletoutlet(ic,ir).ge.5000)then
                    InternalOutput(ic,ir) = inletoutlet(ic,ir)
             endif    
                    
         enddo
          enddo
          
      allocate (sezioniInterne(Num_sorgenti))

      do i =1,Num_sorgenti
        allocate(sezioniInterne(i)%seqCell(Nsorg1(i-Nsez)))
        sezioniInterne(i)%index=0
        sezioniInterne(i)%direzioni=0
      enddo

      do ir = 1,no_rows
       do ic =1,no_columns
      
        InternalOutputValle(ic,ir)=esterno
        if (InternalOutput(ic,ir).ge.5000.and.
     1      InternalOutput(ic,ir).ne.9000) then
            i=int(InternalOutput(ic,ir)-4999)

            sezioniInterne(i)%index=sezioniInterne(i)%index+1
            sezioniInterne(i)%seqCell(sezioniInterne(i)%index)%ic=ic
            sezioniInterne(i)%seqCell(sezioniInterne(i)%index)%ir=ir
        endif
      enddo
      enddo   
          
          
          
       
      call Sezioni999()   !BERNARD

********** Open file_iternal_OutPUTVALLE ********************************
      retint = scan(filelog,'.')
      
      file_Internal_OutputsValle = filelog(1:retint-1)//
     1'_inlet_valle999.flt'
      
      open (16666666,file=file_Internal_OutputsValle,mode='write',form='
     1binary')      
*************************************************************************      
      
      do ir = 1,no_rows
        write (16666666) (InternalOutputValle(ic,ir), ic=1,no_columns)
      enddo
      
      close (16666666)       !BERNARD  
      
      retint = scan (file_Internal_OutputsValle,'.')
      if (retint > 1) then
      fileHeader = file_Internal_OutputsValle(1:retint-1)//'.hdr'
      if (fileHeader /= fileFormat) call HdrWrite (fileHeader)
      endif  
      
      
   	
	endif  ! fine Internal Outputs
	  
	  
      
*************************************************************************      
*	 Lettura Idrogrammi
*************************************************************************	
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
	if (t_minimo .ge. 1000000) t_minimo = 0

   
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
      
      allocate (n_celle_sol(N_file_output+2))
      i_entrato = 0  ! 1/8/2017
	
	

***************************************************************************************
*                         INIZIALIZZAZIONE FILE RASTER DI OUTPUT
****************************************************************************************	

	su4="write the output file time and then enter until the last-one" 
	

**************************************************************
*  CONTROLLO NUMERO FILE DI OUTPUT  (17 GEN 2013)
**************************************************************

       DT_OUTput_secondi = tempo_finale/float(N_file_output)
       
       if (DT_OUTput_secondi.lt.120.0) then
       
       write(0,'("ATTENTION NUMBER OF OUTPUT FILE TOO LARGE: SIMULATION
     1 COULD FAIL OR GIVE WRONG RESULTS: REMEMBER MINUM OUTPUT TIME STEP
     1 2 MINUTES")')
       
       endif
       
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

      
            Vx_media_sez = 0.0
            Vy_mdeia_sez = 0.0
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
      allocate  (Vy_media(N_sezioni_interne))
      allocate  (Vx_media(N_sezioni_interne))
      allocate  (Vy_media_sez(N_sezioni_interne))
      allocate  (Vx_media_sez(N_sezioni_interne))
      allocate  (Vy_media_sez_int(N_sezioni_interne))
      allocate  (Vx_media_sez_int(N_sezioni_interne))   
                
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
        error_map(icol,irow) = 0.0
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


     !!!    do irow = 1, no_rows  ! 29/04/2019
	    !!!do icol = 1, no_columns
     !!!       if (ele(icol,irow).eq.esterno) then
     !!!
     !!!       do j = 1,8
     !!!        Vel8(icol,irow,j) = esterno
     !!!         Deltah8(icol,irow,j) = esterno
     !!!        enddo
     !!!
     !!!        else
     !!!
     !!!          do j = 1,8
     !!!        Vel8(icol,irow,j) = 0.0
     !!!        Deltah8(icol,irow,j) = 0.0
     !!!        enddo
     !!!
     !!!
     !!!       endif
     !!!       enddo
     !!!       enddo


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
     
	allocate(Q_2d(Num_celle_bacino, 5))
      allocate(Q_t2d(Num_celle_bacino, 5))
      allocate(routing_type(Num_celle_bacino))
      allocate(Param(Num_celle_bacino, 8 ))
      allocate(Flux_x(Num_celle_bacino, 5))
      allocate(Flux_y(Num_celle_bacino, 5))
      allocate(Q_int(Num_celle_bacino))  
      allocate(Q_1(Num_celle_bacino)) 
      allocate(index_celle(Num_celle_bacino))
      allocate(index_celle_1(Num_celle_bacino))
      Q_2d = -9999
      Q_t2d = -9999
      Param = -9999
      routing_type = -9999 
	 allocate (V_input(Num_sorgenti))
       allocate (VS_input(Num_sorgenti))   
	   
       
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
              DT1 = 5 
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

      Num_celle_routing = 0
      celle_routing = -9999
**************************************************************************************
********* DAM Break intial conditions

!!! DAM break cylinder, initla flow depth
     
      x_min = 30
      x_max = 60
         do i=1,no_rows
          do j=1,no_columns
              
            
            if(ele(j,i).ne.esterno)then
              h(j,i) = 0
              h_tot(j,i) = ele(j,i) + h(j,i)
              
     !!        if(j*lato_cella.gt.x_min.and.
     !!1          j*lato_cella.lt.x_max)then 
     !!           h(j,i) = 13
     !!           h_tot(j,i) = ele(j,i) + h(j,i) 
     !!         else
     !!           h(j,i) = 0
     !!           h_tot(j,i) = ele(j,i) + h(j,i)  
     !!        endif
             !if(i.lt.no_rows/2.and.ele(j,i).ne.esterno)then
             !   h(j,i) = 1
             !   h_tot(j,i) = ele(2,2) + h(j,i) 
             !else   
             !   h(j,i) = 0.0
             !   if(ele(j,i).eq.esterno)then
             !       h_tot(j,i) = esterno
             !    else   
             !       h_tot(j,i) = ele(j,i) + h(j,i)
             !    endif   
             !endif
                  
            if(h_tot(j,i).gt.ele(j,i))then 
              Num_celle_routing = Num_celle_routing +1

              ic_routing(Num_celle_routing) = j 

              ir_routing(Num_celle_routing) = i
 
              celle_routing(j,i) = Num_celle_routing  
                   
              call new_cell_param(Num_celle_routing,j,i,0)
            endif 
              endif
              
          enddo
         enddo      
      
      
      
***************************************************************************************
************************** Nuovo individuazione delle prime celle routing *************
* Tutte quelle nell'intorno delle sorgenti, anche le sorgenti sono celle routing ******
      
        jjj = 0
        max_s = 0
      do j =1, Num_sorgenti
          if(Nsorg1(j).gt.max_s)max_s=Nsorg1(j)
      enddo
      allocate(Boundary(Num_sorgenti,max_s,2))
	
	
	do ii = 1, Num_sorgenti
	     
	    if (attivata(ii).eq.1.0) then
	
	         do i = 1, Nsorg1(ii)
                   
         if(celle_routing(ic_sorg1(i,ii),ir_sorg1(i,ii)).eq.esterno)then
             
                   Num_celle_routing = Num_celle_routing +1

                   ic_routing(Num_celle_routing) = ic_sorg1(i,ii)  

                   ir_routing(Num_celle_routing) =ir_sorg1(i,ii)
 
                   celle_routing(ic_routing(Num_celle_routing),
	1             ir_routing(Num_celle_routing)) = Num_celle_routing  
                   
                   call new_cell_param(Num_celle_routing,ic_sorg1(i,ii)
     1              ,ir_sorg1(i,ii),i)
                 endif  
                   jjj = 0
                   
	  do j = 1, 8
       ic1 = ic_sorg1(i,ii)+i_sh_col(j)
       ir1 = ir_sorg1(i,ii)+i_sh_row(j)
       
       if(celle_routing(ic1,ir1).eq.esterno.and.
     1  ele(ic1,ir1).ne.esterno.and.
     1  internalOutputValle(ic1,ir1).eq.999)then
	  	jjj = jjj + 1

	  ic_routing(Num_celle_routing+jjj) = ic1
	  
	  ir_routing(Num_celle_routing+jjj) = ir1
	
        celle_routing(ic1,ir1) = Num_celle_routing+jjj
	  
        call new_cell_param(Num_celle_routing+jjj,ic1,ir1,i)
        
	  	endif
	  	  
	  	
	  
	        enddo
	  	  Num_celle_routing = Num_celle_routing+jjj         
	   enddo
	  
	      
	  endif
	
		enddo

	    write(10,*)

	
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
!!!	zero_int= 0	
!!!c      stabilita'
!!!
!!!           
!!!	cel_max = 0.0
!!!
!!!
!!!
!!!*******************************************  MARZO 2010    da RIVEDERE
!!!
!!!	N_iji = 1
!!!
!!!	idf(1) = 1
!!!
!!!	i_iniz = N_iji + 1
!!!
!!!	V_totale = 0.0
!!!	V_affluito = 0.0   ! 22/11/2012
!!!
!!!	!V_totale = Vtot*float(Nsorg1(1))
!!!	
!!!	
!!!!***************************************************************************************
!!!!  RIEMPIMENTO CELLE DI INPUT ATTIVE  22/11/2012
!!!!***************************************************************************************
!!!	
!!!	
!!!	do ii = 1, Num_sorgenti
!!!	 IF (attivata(ii).eq.1.0) THEN
!!!	   do i = 1, Nsorg1(ii)
!!!
!!!           h(ic_sorg1(i,ii),ir_sorg1(i,ii)) = V_input_iniziale(ii)/
!!!     1(lato_cella*lato_cella)
!!!           h_tot(ic_sorg1(i,ii),ir_sorg1(i,ii)) = ele(ic_sorg1(i,ii),
!!!     1ir_sorg1(i,ii)) + h(ic_sorg1(i,ii),ir_sorg1(i,ii)) ! DA MODIFICARE CON /(LATO_CELLA*LATO_CELLA)
!!!     
!!!       Conc(ic_sorg1(i,ii),ir_sorg1(i,ii)) = Conc_input_iniziale(ii)  ! bifase
!!!       h_solido(ic_sorg1(i,ii),ir_sorg1(i,ii)) = Conc(ic_sorg1(i,ii)
!!!     1,ir_sorg1(i,ii))*h(ic_sorg1(i,ii),ir_sorg1(i,ii))
!!!            
!!!                Vaffluito = Vaffluito + V_input_iniziale(ii)
!!!			
!!!	write(10,'(''flow depth in the input area n.'',1x,I3,
!!!	1'' cell number n.'',1x,I3,4x,f14.4)') ii, i, 
!!!     1h(ic_sorg1(i,ii),ir_sorg1(i,ii))
!!!	write(10,'(''corresponding maximum sin of relative angle, weight
!!!	1 value and Chezy value'',2x,f8.5,2x,f8.5,2x,f8.5)') peso_max
!!!	1(ic_sorg1(i,ii),ir_sorg1(i,ii)), sen_max(ic_sorg1(i,ii),ir_sorg1(i,ii)
!!!	1), Ch(ic_sorg1(i,ii),ir_sorg1(i,ii))
!!!			
!!!		      
!!!		
!!!			 cel = Ch(ic_sorg1(i,ii),ir_sorg1(i,ii))*peso_max(ic_sorg1(i,ii)
!!!	1,ir_sorg1(i,ii))*sqrt(9.81*h(ic_sorg1(i,ii),ir_sorg1(i,ii))*
!!!     1sen_max(ic_sorg1(i,ii),ir_sorg1(i,ii))) 
!!!		      cel = cel + sqrt(9.81*h(ic_sorg1(i,ii),ir_sorg1(i,ii)))
!!!		
!!!		      write(10,'(''corresponding wave celerity'',2x,f14.4)') cel
!!!		
!!!		    	 if (cel.gt.cel_max) then
!!!                 cel_max = cel
!!!               !   IC_celmax = ic_sorg1(i,ii)
!!!               ! IR_celmax = ir_sorg1(i,ii)
!!!                endif
!!!
!!!           enddo
!!!          ENDIF
!!!         enddo	
!!!         
!!!         DT = 0.0
!!!         
!!!         if (cel_max.gt.0.0) then
!!!         
!!!                DT = Courant*lato_cella/cel_max
!!!      if (DT.gt.5)then                  
!!!      write(10,'("WARNING FIRST DT GREATER THAN 5 SEC")') 
!!!     
!!!       write(10,'("Time step is setted to 5 seconds")') 
!!!     
!!!      DT = 5.0
!!!       endif          
!!!         else
!!!         
!!!         ! vedere di fare il ciclo con lo stramazzo e se non viene niente allora warning
!!!         
!!!         
!!!      write(10,'("WARNING MAX CELERITY AFTER TIME STEP IS 0: no flow  
!!!     1from the input cells")') 
!!!     
!!!       write(10,'("time step is setted to 5 seconds")') 
!!!     
!!!      DT = 5.0
!!!                 
!!!         
!!!         endif
!!!         
!!!    !     if (Cmedio_input.gt.0.0) then
!!!         
!!!         
!!!    !     do j = 1, Num_sorgenti
!!!         
!!!	!V_totale = V_totale + V_input_iniziale(j)*float(Nsorg1(j))  !  29/11/2012
!!!	
!!!	   
!!!	!   enddo
!!!	
!!!	!  V_totale = sum(V_input_iniziale)  !  22/11/2012
!!!
!!!*******************************************  MARZO 2010
!!!
!!!*********************************************************************** computo continuità
      
!	V_entrato = 0.0 !  azzeramento variabile
!	V_solid_input = 0.0

    !  V_entrato = V_entrato + Vtot*float(Nsorg1(1))
    
    !    V_entrato = V_totale
    !    V_solid_input = V_totale*Cmedio_input
    

	!V_eroso = 0.0
	!V_depositato = 0.0
	
	!else
	
	!V_solid_input = 0.0
	!
	!  do j = 1, Num_sorgenti
 !        
	!V_totale = V_totale + V_input_iniziale(j)*float(Nsorg1(j))  !  29/11/2012
	!V_solid_input = V_solid_input + Conc_input_iniziale(j)*
	!1V_input_iniziale(j)*float(Nsorg1(j))
	!   
	!   enddo
	!V_entrato = 0.0 !  azzeramento variabile
	!
 !
 !   !  V_entrato = V_entrato + Vtot*float(Nsorg1(1))
 !   
 !       V_entrato = V_totale
 !       
	!V_eroso = 0.0
	!V_depositato = 0.0
	!
	!V_solido_eroso = 0.0
	!V_solido_depositato = 0.0
	!
	!V_solido_eroso_STEP = 0.0
	!V_solido_depositato_STEP = 0.0
	!
	!Cmedio = V_solid_input/V_totale
	
	
	
	!endif
	
	

*************************************************************************************************
*        DEFLUSSO DA CELLE SORGENTE IN DT [t(2) - t(1)] per il riempimento fino al tempo  t(1)
**************************************************************************************************
!       h_defluit = 0.0
!
!        do ii = 1, Num_sorgenti
!        
!          if (attivata(ii).eq.1.0) then
!
!
!      do iii = 1, Nsorg1(ii)
!
!      h_vol = 0.0  ! aggiunto il 26/11/2012
!      coeff = 1.0
!      dhh_tot = 0.0
!      ddh_tot = 0.0
!  
!	if (h(ic_sorg1(iii,ii),ir_sorg1(iii,ii)).gt.zero) then
!
!*****************************************************************	   
!
!      loop_AD :   do iiii = 1,15
!
!	 Qtot = 0.0
!
!	        do j = 1, k(ic_sorg1(iii,ii),ir_sorg1(iii,ii))
!
!c      calcolo portata defluente nella j-esima cella
!
!              
! 
!      dh_cost(j) = 0.0
!	Q(j) = 0.0
!
!	Q(j) = peso_d(ic_sorg1(iii,ii),ir_sorg1(iii,ii),j)*lato_cella
!     1*h(ic_sorg1(iii,ii),ir_sorg1(iii,ii))*sqrt(9.81*h(ic_sorg1(iii,ii)
!     1,ir_sorg1(iii,ii))*senteta(ic_sorg1(iii,ii),ir_sorg1(iii,ii),j))*
!	1coeff*Ch(ic_sorg1(iii,ii),ir_sorg1(iii,ii))
!
!
!
!c      calcolo della profondita' nella cella j-esima
!
!      ic1 = ic_d( ic_sorg1(iii,ii), ir_sorg1(iii,ii),j)
!	ir1 = ir_d( ic_sorg1(iii,ii), ir_sorg1(iii,ii),j)
!
!	dh_cost(j) = Q(j)*DT/(lato_cella*lato_cella)
!
!      
!
!c       totale della portata defluita dalla iii-esima cella sorgente
!
!       Qtot = Qtot + Q(j)
!
!
!	         enddo
!
!c      controllo continuita'
!
!        h_vol = Qtot*DT/(lato_cella*lato_cella)
!
!	 
!
!
!	if (h_vol.gt.h(ic_sorg1(iii,ii),ir_sorg1(iii,ii))) then
!	 
!	 coeff = 0.95*coeff*(1 - (h_vol - h(ic_sorg1(iii,ii),ir_sorg1
!	1(iii,ii)))/h_vol)
!
!
!      else
!
!!		  h(ic_sorg1(iii,ii),ir_sorg1(iii,ii)) = 
!!     1 h(ic_sorg1(iii,ii),ir_sorg1(iii,ii)) - h_vol
!
!      do j = 1,k(ic_sorg1(iii,ii),ir_sorg1(iii,ii))
!
!      
!      ic1 = ic_d(ic_sorg1(iii,ii), ir_sorg1(iii,ii),j)
!	ir1 = ir_d(ic_sorg1(iii,ii), ir_sorg1(iii,ii),j)
!
!	dh_entrata_sorg(ic1,ir1) = dh_entrata_sorg(ic1,ir1) + dh_cost(j)
!	
!	dh_entrata_solido_sorg(ic1,ir1) = dh_entrata_solido_sorg(ic1,ir1) +
!     1Conc_input_iniziale(ii)*dh_cost(j)   ! bifase
!
!	h_affluito = h_affluito + dh_cost(j)
!
!	enddo
!
!
!	 h_defluito = h_defluito + h_vol
!
!	 exit loop_AD
!
!      endif
!
!
!	if (iiii.eq.15) then
!
!	    do j = 1,k(ic_sorg1(iii,ii),ir_sorg1(iii,ii))
!
!
!      ic1 = ic_d(ic_sorg1(iii,ii), ir_sorg1(iii,ii),j)
!	ir1 = ir_d(ic_sorg1(iii,ii), ir_sorg1(iii,ii),j)
!
!	dh_entrata_sorg(ic1,ir1) = dh_entrata_sorg(ic1,ir1) + dh_cost(j)
!	dh_entrata_solido_sorg(ic1,ir1) = dh_entrata_solido_sorg(ic1,ir1) +
!     1Conc_input_iniziale(ii)*dh_cost(j)   ! bifase
!
!	h_affluito = h_affluito + dh_cost(j)
!	enddo
!
!!	 h_defluito = h_defluito + h_vol
!
!	write(0,'("mass conservation not respected in input cell")')
!	write(0,*) warn6
!	write(0,1117) iii, ic_sorg1(iii,ii), ir_sorg1(iii,ii), t1
!
!
!      write(10,'("mass conservation not respected in input cell")')
!	write(10,*) warn6
!	write(10,1117) iii, ic_sorg1(iii,ii), ir_sorg1(iii,ii), t1
!
!     
!	endif
!
!
!
!
!	end do loop_AD
!	   
!
!
!	
!     
!	
!		h(ic_sorg1(iii,ii),ir_sorg1(iii,ii)) = h(ic_sorg1(iii,ii),ir_sorg1
!	1(iii,ii)) - ddh_tot - h_vol  ! aggiornamento simultaneità
!	h_solido(ic_sorg1(iii,ii),ir_sorg1(iii,ii)) = h_solido(ic_sorg1(iii,ii)
!     1,ir_sorg1(iii,ii)) - (ddh_tot + h_vol)*Conc_input_iniziale(ii)
!	
!c	      write(30,*) warn16
!c		write(30,'("mass conservation not respected in input cell")')
!c		write(30,*) warn6
!c		write(30,1117) iii, ic_sorg1(iii,ii), ir_sorg1(iii,ii), t(2)
!c		write(30,1119) warn18, ii
!	
!c	      write(10,*) warn16
!c	      write(10,'("mass conservation not respected in input cell")')
!c		write(10,*) warn6
!c		write(10,1117) iii, ic_sorg1(iii,ii), ir_sorg1(iii,ii), t(2)
!c		write(10,1119) warn18, ii
!	   
!		
!c		  endif
!	
!c		end do loop_DD 
!		
!		h_defluit = h_defluit + h_vol + dhh_tot
!	
!		
!		endif  ! chiusura h > 0
!		
!		enddo  ! chiusura celle sorgenti di una stessa area
!		
!		endif   ! chiusura attivata 
!		
!		enddo  !  chiusura ciclo celle sorgenti
!	
!			
!	
!
!	Vdefluito = Vdefluito + h_defluit*lato_cella*lato_cella 
!
!	  sommadh = 0.0
!
!      do irow = 1, no_rows
!	    do icol = 1, no_columns
!            if (ele(icol,irow).ne.esterno) then
!
!
!      sommadh = sommadh + dh_entrata_sorg(icol,irow)*lato_cella*
!	1lato_cella    ! aggiornato 26/11/2012
!   
!      endif
!	enddo
!	enddo
!
!	Vaffluito_striscia1_tot = Vaffluito_striscia1_tot + sommadh
!
!
!c      profondita' istante successivo
!
!        do irow = 1, no_rows
!	      do icol = 1, no_columns
!            if (ele(icol,irow).ne.esterno) then
!
!	          if(val_sorg(icol,irow).ne.100) then
!	          
!	  
!
!	h(icol,irow) = h(icol,irow) + dh_entrata_sorg(icol,irow) 
!	h_tot(icol,irow) = ele(icol,irow) + h(icol,irow)
!	
!	
!	if (h(icol,irow).gt.0.0) then
!	h_solido(icol,irow) = dh_entrata_solido_sorg(icol,irow)
!	Conc(icol,irow) = dh_entrata_solido_sorg(icol,irow)/h(icol,irow)  ! bifase
!	endif
!	
!	h_post(icol,irow) = h(icol,irow)
!
!	i = i + 1
!
!	           else
!
!                     h_tot(icol,irow) = ele(icol,irow) + h(icol,irow)
!                     
!	   
!	   
!	           endif
!
!
!	endif
!       enddo
!	    enddo
!
!
!c      write(10,*) pippo2
!c	write(10,*)
!
!             
!   !   t(2) = t(1) + DT
!   
!        t2 = t1 + DT

	

	
*************** damocles ********************************************

c      CONTROLLO per evitare che il secondo passo temporale modello 
c      superi il secondo passo temporale del secondo idrogramma 

	do i = 1,Num_celle_routing

!	write(*,*) Num_celle_bacino, i, ic_routing(i), ir_routing(i), t(2)

      !	val_tempi(ic_routing(i),ir_routing(i)) = t(2)
          val_tempi(ic_routing(i),ir_routing(i)) = t1   ! 15/01/2013
	    val_flag(ic_routing(i),ir_routing(i)) = 1.0

	enddo
	
	sum_attivata = 0.0
	
	allocate (attivata_new(Num_sorgenti))
	
	do j = 1, Num_sorgenti
	
	 sum_attivata = sum_attivata + attivata(j)
	 attivata_new(j) = 0.0
	
	
	enddo

      	    
*******************************************************************************************
*************** Costruzion file risultati SMS  ********************************************
*****************************Lasciare non necessario qui perche non c'è propagazione spostare negli out put******************************************************              
      !!
      !!     j_TS = 0   ! aggiunta 31/10/2013
      !!
      !!    write(1000001,'("TS     0")')
      !!    write(1000002,'("TS     0")')
      !!    write(1000006,'("TS     0")')  ! 18/9/2017
      !!    if (control_eros.eq.1.0) then
      !!    write(1000003,'("TS     0")')
      !!    endif
      !!   !write(1000004,'("TS     0")')
      !!    write(1000005,'("TS     0")')
      !!    
      !!    j_TS = j_TS + 1  ! aggiunta 31/10/2013
      !!    
      !!    
      !!     i_celle2 = 0 
      !!     
      !! n_celle_sol  = 0
      !! 
       do j = 1, no_rows
	     do i = 1, no_columns
	        cella_bacino(i,j) = 0
              if(ele(i,j).ne.esterno) then
               i_celle2 = i_celle2 + 1 
               
      
               cella_bacino(i,j)=i_celle2
	       
	         !!if(h(i,j).ne.zero)then
          !!      n_celle_sol(1) = n_celle_sol(1) + 1   
	         !! write(1000001,'(i10,f15.6)') cella_bacino(i,j),h(i,j)
	         !! write(1000002,'(f15.6)') h_tot(i,j)
          !!      write(1000006,'(f15.6)') conc(i,j)  ! 18/9/2017
	         !! if (control_eros.eq.1.0) then
	         !!  write(1000003,'(f15.6)') Eros_tot(i,j)
	         !! endif
          !!      write(1000005,'(2f15.6)') Vx(i,j),Vy(i,j)
          !!
	         !!endif
	         endif
	         
	         
	         
	         enddo
         enddo


*******************************************************************************************
*******************************************************************************************
*******************************************************************************************


******************************************************************************************
*************************** Calolo volume primo time step ********************************
  !!     allocate (V_input(Num_sorgenti))
  !!     allocate (VS_input(Num_sorgenti))
  !!     
  !!     Check_massa = 0.0
  !!     Check_VS = 0.0
  !!     
  !!     h_solid = 0.0
  !!     
  !!      do irow = 1, no_rows
	 !!     do icol = 1, no_columns
  !!            if (ele(icol,irow).ne.esterno) then
  !!
	 !!          h_solid = h_solid + h_solido(icol,irow)
	 !!      
	 !!        endif
	 !!      
	 !!      enddo
	 !! enddo
	 !!      
	 !!       
	 !!  V_solido = h_solid*lato_cella*lato_cella 
	 !!  
	 !!   
	 !!write(10,*)
  !!     write(10,'(" input solid volume (m^3)",2x,f20.5)') V_solid_input
  !!     write(10,*)
  !!     write(10,'(" solid routing volume (m^3)",2x,f20.5)') V_solido
  !!     write(10,*)
  !!  
  !!     volume_solido_intrappolato = 0.0
  !!     volume_intrappolato = 0.0
  !!           
  !!     volume_solido_intrappolato_STEP = 0.0 
  !!     
  !!     i_DQ = 0
  !!     
  !!     tempo_scrittura_interfaccia = 0.0
  !!     
  !!     volume_entrato = 0.0
  !!     

*************************************************************************
**********  BARBINI parallel principal cycle october 2021
*************************************************************************
      
 
      
      
      
      avvert = "inizio ciclo di calcolo"
      avvert = "beginning of computation loop"
      write(10,*)
	write(10,*) avvert, Total_t
	write(10,*)
      write(10,*) "FV FORCE solution"
      write(0,*) avvert
      write(0,*) "FV FORCE solution"
      
      write(0,*)  "Number of available threads =", OMP_get_num_procs()
      write(0,*)  "Number of setted threads    =", CPUs

      write(10,*) "Number of available threads =", OMP_get_num_procs()
      Write(10,*) "Number of setted threads    =", CPUs
   !   loop_centrale : do ii = 2,N_stati-1
   
        ii = 1
        def_int_on = 0
        t_prima = t_minimo
        Dt = 0.1
        t = t_prima + Dt
        
        V_entrato = 0
        
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
        vol_int=0
        vol_grav=0
        vol_bel=0
        n_celle_sol_1 = 0
        ero_tot=0.0
        ero_tot_solid=0.0
          ! curva per simulare la variaizone della conduttanza
        p_con = [2.49303671704023,	-3.68956736291013,	
     1         -1.04472474874445,	2.87538329420638]
        
          ic_corner = (/1, 0, 0, 1/)
          ir_corner = (/1, 1, 0, 0/)
          
          
                    
          coef_pp(:,1) = ( / 1, -1, -1, 1 /)
          coef_pp(:,2) = (/ -1,  -1, 1, 1 /) !!! Corretto 28/01/2025
          
          coef_wall(:,1) = (/ 3,5 /) 
          coef_wall(:,2) =(/ 5,7 /)
          coef_wall(:,3) =(/7,1 /)
          coef_wall(:,4) = (/ 1,3 /)
          
          coef_diag = (/ 4 , 6 , 8 , 2 /)
          
      file_name2 = "_volint.txt"
	retint = scan (fileLog,'.')
      if (retint > 1) then
          file_finale = fileLog(1:retint-1)//'_'//file_name2
      endif

		open (1299,file=file_finale)
          
            file_name2 = "_int.txt"
	retint = scan (fileLog,'.')
      if (retint > 1) then
          file_finale = fileLog(1:retint-1)//'_'//file_name2
      endif

		open (1399,file=file_finale)  
        
*********************************************************************
******** Building the Q_2d file                           ***********
*********************************************************************


      !allocate(Eros_vet(Num_celle_bacino))
      
      
      
      do iii=1 , Num_celle_routing_old
        
          ic = ic_routing(iii)
          ir = ir_routing(iii)
          
          Q_2d(iii,1) = h_tot(ic,ir) 
          Q_2d(iii,2) = 0.0
          Q_2d(iii,3) = 0.0
          Q_2d(iii,4) = 0.0
          Q_2d(iii,5) = ele(ic,ir)
          
          !Eros_vet(iii) = 0.0
        Flux_x(iii,1) = Q_2d(iii,2)
        Flux_y(iii,1) = Q_2d(iii,3)
        Flux_x(iii,5)=0
        Flux_y(iii,5)=0     
 
              
        if((Q_2d(iii,1)-Q_2d(iii,5)).gt.0.0)then
            
            Flux_x(iii,2) = Q_2d(iii,2)**2/
     1    (Q_2d(iii,1)-Q_2d(iii,5))+g/2*(Q_2d(iii,1)-Q_2d(iii,5))**2
            Flux_y(iii,3) = Q_2d(iii,3)**2/
     1    (Q_2d(iii,1)-Q_2d(iii,5))+g/2*(Q_2d(iii,1)-Q_2d(iii,5))**2
            
           if (Q_2d(iii,2).eq.0.0)then
            Flux_x(iii,3) = 0.0
            Flux_x(iii,4) = 0.0       
           else
            Flux_x(iii,3) = (Q_2d(iii,2)*Q_2d(iii,3))/
     1      (Q_2d(iii,1)-Q_2d(iii,5))
            Flux_x(iii,4) = (Q_2d(iii,2)*Q_2d(iii,4))/
     1      (Q_2d(iii,1)-Q_2d(iii,5))             
           endif
           if (Q_2d(iii,3).eq.0.0)then
            Flux_y(iii,2) = 0.0
            Flux_y(iii,4) = 0.0       
           else
            Flux_y(iii,2) = (Q_2d(iii,2)*Q_2d(iii,3))/
     1      (Q_2d(iii,1)-Q_2d(iii,5))
            Flux_y(iii,4) = (Q_2d(iii,3)*Q_2d(iii,4))/
     1      (Q_2d(iii,1)-Q_2d(iii,5))             
           endif  
        else
           Flux_x(iii,2) =0 
           Flux_x(iii,3) =0
           Flux_x(iii,4)=0
           Flux_y(iii,2)=0
           Flux_y(iii,3)=0
           Flux_y(iii,4)=0
            
        endif
      enddo
        
        
        
        
        
 !$OMP parallel num_threads(CPUs)       
      do while (t.lt.tempo_finale) 
          
*********************************************************************          
*******        Volumi input                          ****************
*********************************************************************
c Point 1.1 Riempimento celle di input nel time step precedente

!$OMP do
!$OMP& private   (V_inp,VS_inp, V2, VS2, V1, VS1,j,iijj)
!$OMP& reduction (+: V_solid_input_DT, V_entrato_DT)
!$OMP& reduction (+: VOLSOL_ENTRATO_IDRO, Vaffluito_1,V_entrato)
!$OMP& reduction (+: V_solid_input,VOLUME_ENTRATO_IDRO)
!$OMP& schedule  (monotonic: dynamic)
      DO iijj = 1, Num_sorgenti     ! 26/11/2012
        if(ii.gt.10059)then
            continue
        endif
         V_inp = 0.0
         VS_inp = 0.0
         V_input(iijj) = 0.0
         VS_input(iijj) = 0.0
         if (attivata(iijj).eq.1.0) then
           if (t_fin(iijj).gt.t_prima) then
           call Hydrograph_volume(t,iijj,V2,VS2)
            !
            !if (ii.eq.2) then
            ! V1 =  V_input_iniziale(iijj)
            ! VS1 = V_input_iniziale(iijj)*Conc_input_iniziale(iijj)
            !else
                if(ii .ne. 1)then
                   call Hydrograph_volume(t_prima,iijj,V1,VS1)

                else
                    V1 = 0.0
                    Vs1 =0.00
               endif
            !endif
              
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
            do jj = 1, Nsorg1(iijj)
               
             ic = ic_sorg1(jj,iijj)
             ir = ir_sorg1(jj,iijj)
                
             iii = celle_routing(ic,ir)
             
c per ogni cella cerchiamo di indetificare la direzione di massima pendenza

          max_d_ele     = 0.0
          max_d_ele_h2o = 0.0

          j_d_ele = 0
          j_d_ele_h2o = 0.0
          
         if (ii .eq.6)then
            continue
         endif  
          do j = 1,8
            icj = ic + i_sh_col(j)
            irj = ir + i_sh_row(j)
            
     !!       if(celle_routing(icj,irj).ne.esterno.and.
     !!1         inletoutlet(icj,irj).ne.5000)then
      if(internaloutputvalle(icj,irj).eq.999)then
          
             iii_1 = celle_routing(icj,irj)
             
            D_ele = Q_2d(iii,5) - Q_2d(iii_1,5)
            D_ele_H2O = Q_2d(iii,1)-Q_2d(iii_1,5)
             
            if(max_d_ele.lt.D_ele)then
                j_d_ele = j
                max_d_ele = D_ele
            endif
            
            if(max_d_ele_h2o.lt.D_ele_h20)then
                j_d_ele_h2o = j
                max_d_ele_h2o = D_ele_h2o
            endif
            endif
           end do
            
c calcolo la velocità della cella con leggi mono dimensionali 

c Chezy in caso di pendenza positiva
          
          if (max_d_ele .gt. 0.0) then
              V_tot = 1
            if (j_d_ele .eq. 1.or.j_d_ele .eq. 3.or.
     1            j_d_ele .eq. 5.or.j_d_ele .eq. 7)then  
             teta = atand(max_d_ele/lato_cella)  
             
!             V_tot = Param(iii,1)* sqrt(g * (Q_2d(iii,1)-Q_2d(iii,5) + 
!     1                V_input(iijj)/(Dx*Dy)) * sind(teta))
             
            
             Vx_in = i_sh_col(j_d_ele)* V_tot 
             Vy_in = -i_sh_row(j_d_ele)* V_tot
            
            else 
             teta = atand(max_d_ele/lato_cella/sqrt(2.d0))  
           
!             V_tot = Param(iii,1)* sqrt(g * (Q_2d(iii,1)-Q_2d(iii,5) + 
!     1               V_input(iijj)/(Dx*Dy)) * sind(teta))
                      
             Vx_in = i_sh_col(j_d_ele)* V_tot /sqrt(2.d0)
             Vy_in = -i_sh_row(j_d_ele)* V_tot /sqrt(2.d0)  
            
             endif    
            
              
c stramazzo in caso pendenza negativa
          else if(max_d_ele_h2o .gt. 0.0)then    
              
!            V_tot = 0.385 * sqrt(2*g*(Q_2d(iii,1)-Q_2d(iii,5) + 
!     1               V_input(iijj)/(Dx*Dy)))  
            if (j_d_ele .eq. 1.or.j_d_ele .eq. 3.or.
     1          j_d_ele .eq. 5.or.j_d_ele .eq. 7)then    
                          
             Vx_in = i_sh_col(j_d_ele)* V_tot 
             Vy_in = -i_sh_row(j_d_ele)* V_tot
            
            else 
                          
             Vx_in = i_sh_col(j_d_ele)* V_tot /sqrt(2.d2)
             Vy_in = -i_sh_row(j_d_ele)* V_tot /sqrt(2.d2)
                        
            endif    
            
           else 
                        
             
        if (Q_2d(iii,1)-Q_2d(iii,5).gt.0)then     
          Vx_in=Q_2d(iii,2)/(Q_2d(iii,1)-Q_2d(iii,5))
          Vy_in=Q_2d(iii,3)/(Q_2d(iii,1)-Q_2d(iii,5))
        else
          Vx_in=0
          Vy_in=0
        endif
        
        endif
  
        Vol_s_cella = (Q_2d(iii,1)-Q_2d(iii,5))*Q_2d(iii,4)*(Dx*Dy)
         
        Q_2d(iii,1) = Q_2d(iii,1) + V_input(iijj)/(Dx*Dy)   !update WSE

        if (Q_2d(iii,1)-Q_2d(iii,5).gt.0)then
      
      Q_2d(iii,4)=(VS_input(iijj)+Vol_s_cella)/(Q_2d(iii,1)-Q_2d(iii,5))   !update C_solido
     1 /(Dx*Dy)
        else
         Q_2d(iii,4)=0
        endif
        if (Q_2d(iii,1)-Q_2d(iii,5).lt.0.or.Q_2d(iii,4).gt.1)then
            continue
        end if
        
        Vaffluito_1 = Vaffluito_1 + V_input(iijj)   
        !if(abs(Vx_in).gt.15)then
        !   Vx_in=Vx_in/abs(Vx_in)*15
        !endif
        !if(abs(Vy_in).gt.15)then
        !   Vy_in=Vy_in/abs(Vy_in)*15
        !endif   
        
       Write(1399,'(2i6,20f20.10)')ii,iii,Dt,t,Q_2d(iii,1),Q_2d(iii,2),
     1 Q_2d(iii,3),Q_2d(iii,4),Q_2d(iii,5),Q_2d(iii,1)-Q_2d(iii,5), 
     1  Flux_x(iii,2),Flux_x(iii,3),Flux_y(iii,2), Flux_y(iii,3),
     1  Flux_x(iii,4),Vx_in, Vy_in, v_tot
        
        u = Q_2d(iii,2)
        v = Q_2d(iii,3)
   
        
        Q_2d(iii,2) = Boundary(iijj,jj,1)*V_input(iijj)/Dt
        Q_2d(iii,3) = Boundary(iijj,jj,2)*V_input(iijj)/Dt
        
        Flux_x(iii,1) = Q_2d(iii,2)
        Flux_y(iii,1) = Q_2d(iii,3)
        Flux_x(iii,5)=0
        Flux_y(iii,5)=0     
 
              
        if((Q_2d(iii,1)-Q_2d(iii,5)).gt.0.0)then
            
            Flux_x(iii,2) = Q_2d(iii,2)**2/
     1    (Q_2d(iii,1)-Q_2d(iii,5))+g/2*(Q_2d(iii,1)-Q_2d(iii,5))**2
            Flux_y(iii,3) = Q_2d(iii,3)**2/
     1    (Q_2d(iii,1)-Q_2d(iii,5))+g/2*(Q_2d(iii,1)-Q_2d(iii,5))**2
            
           if (Q_2d(iii,2).eq.0.0)then
            Flux_x(iii,3) = 0.0
            Flux_x(iii,4) = 0.0       
           else
            Flux_x(iii,3) = (Q_2d(iii,2)*Q_2d(iii,3))/
     1      (Q_2d(iii,1)-Q_2d(iii,5))
            Flux_x(iii,4) = (Q_2d(iii,2)*Q_2d(iii,4))/
     1      (Q_2d(iii,1)-Q_2d(iii,5))             
           endif
           if (Q_2d(iii,3).eq.0.0)then
            Flux_y(iii,2) = 0.0
            Flux_y(iii,4) = 0.0       
           else
            Flux_y(iii,2) = (Q_2d(iii,2)*Q_2d(iii,3))/
     1      (Q_2d(iii,1)-Q_2d(iii,5))
            Flux_y(iii,4) = (Q_2d(iii,3)*Q_2d(iii,4))/
     1      (Q_2d(iii,1)-Q_2d(iii,5))             
           endif  
        else
           Flux_x(iii,2) =0 
           Flux_x(iii,3) =0
           Flux_x(iii,4)=0
           Flux_y(iii,2)=0
           Flux_y(iii,3)=0
           Flux_y(iii,4)=0
            
        endif
        if(ii.ge.1)then
        
     !!   Write(1299,'(2i6,20f20.10)')ii,iii,Dt,t,V_input(iijj)/Dx**2,
     !!1 VS_input(iijj),Vol_s_cella,Q_2d(iii,1)-Q_2d(iii,5), Flux_x(iii,2)
     !!1   ,Flux_x(iii,3),Flux_y(iii,2), Flux_y(iii,3), Flux_x(iii,4), 
     !!1   Vx_in, Vy_in, v_tot
        
     !!  if(abs(Q_2d(iii,5)-ele(ic,ir)).gt.10.or.abs(Q_2d(iii,4)).gt.1
     !!1  .or.Q_2d(iii,1)-Q_2d(iii,5).eq."NaN")
     !!1  then
     !!   write(1299,*) "cella",ii,t,iii,ic,ir,Q_t2d(iii,5)-ele(ic,ir)
     !!  endif 
     !!   continue
        endif
 
 
            
        enddo       
         endif
      enddo   
!$OMP end do nowait     

c Point 1.2  acquisizione celle sorgenti passo temporale successivo
!$OMP single private(j,V_inp,VS_inp,jj,ir_ss,ic_ss)
!$OMP& private(i,ij,sen_tetatot,icj,irj,sen_tetaj)
         
      if (int(sum_attivata).lt.Num_sorgenti) then

       do iijj = 1, Num_sorgenti
        
            V_inp = 0.0
            VS_inp = 0.0
              
           if (attivata(iijj).eq.0.0) then
 
              if (t_1d(iijj,1).ge.t_prima.and.t_1d(iijj,1).lt.t) then
              
                attivata(iijj) = 1.0
                attivata_new(iijj) = 1.0

                  sum_attivata = sum_attivata + attivata(iijj)
 
                call Hydrograph_volume(t,iijj,V_inp,VS_inp)
                 
      V_input(iijj) = V_inp
      VS_input(iijj) = VS_inp
      
      V_entrato_DT_1 =V_entrato_DT_1 + V_input(iijj)*float(Nsorg1(iijj)) 
      
      V_solid_input_DT_1 = V_solid_input_DT_1 + 
     1VS_input(iijj)*float(Nsorg1(iijj))
      
             
       VOLUME_ENTRATO_IDRO_1 = VOLUME_ENTRATO_IDRO_1 + 
     1V_inp*float(Nsorg1(iijj))  
     
       VOLSOL_ENTRATO_IDRO_1 = VOLSOL_ENTRATO_IDRO_1 + 
     1VS_inp*float(Nsorg1(iijj)) 

       do jj = 1, Nsorg1(iijj)
           
             ic = ic_sorg1(jj,iijj)
             ir = ir_sorg1(jj,iijj)
             
        if(celle_routing(ic,ir).eq.esterno)then
         Num_celle_routing = Num_celle_routing + 1

	   ic_routing(Num_celle_routing) = ic
	  
	   ir_routing(Num_celle_routing) = ir
	
         celle_routing(ic,ir) = Num_celle_routing
	
         call new_cell_param(Num_celle_routing,ic,ir,jj)
         
         iii = celle_routing(ic,ir) 
        else 
            
         iii = celle_routing(ic,ir)   
            
        endif
              
        Vol_s_cella = (Q_2d(iii,1)-Q_2d(iii,5))*Q_2d(iii,4)*(Dx*Dy)
         
        Q_2d(iii,1) = Q_2d(iii,1) + V_input(iijj)/(Dx*Dy)
	 
        if(Q_2d(iii,1)-Q_2d(iii,5).gt.0.0)then
       Q_2d(iii,4)=(VS_input(iijj)+Vol_s_cella)/(Q_2d(iii,1)-Q_2d(iii,5)
     1 )/(Dx*Dy)
       else
      Q_2d(iii,4) = 0.0
      endif
        Vaffluito_1 = Vaffluito_1 + V_input(iijj)
        
        Flux_x(iii,1) = Q_2d(iii,2)
        Flux_y(iii,1) = Q_2d(iii,3)
        Flux_x(iii,5)=0
        Flux_y(iii,5)=0     
 
              
        if((Q_2d(iii,1)-Q_2d(iii,5)).gt.0.0)then
            
            Flux_x(iii,2) = Q_2d(iii,2)**2/
     1    (Q_2d(iii,1)-Q_2d(iii,5))+g/2*(Q_2d(iii,1)-Q_2d(iii,5))**2
            Flux_y(iii,3) = Q_2d(iii,3)**2/
     1    (Q_2d(iii,1)-Q_2d(iii,5))+g/2*(Q_2d(iii,1)-Q_2d(iii,5))**2
            
           if (Q_2d(iii,2).eq.0.0)then
            Flux_x(iii,3) = 0.0
            Flux_x(iii,4) = 0.0       
           else
            Flux_x(iii,3) = (Q_2d(iii,2)*Q_2d(iii,3))/
     1      (Q_2d(iii,1)-Q_2d(iii,5))
            Flux_x(iii,4) = (Q_2d(iii,2)*Q_2d(iii,4))/
     1      (Q_2d(iii,1)-Q_2d(iii,5))             
           endif
           if (Q_2d(iii,3).eq.0.0)then
            Flux_y(iii,2) = 0.0
            Flux_y(iii,4) = 0.0       
           else
            Flux_y(iii,2) = (Q_2d(iii,2)*Q_2d(iii,3))/
     1      (Q_2d(iii,1)-Q_2d(iii,5))
            Flux_y(iii,4) = (Q_2d(iii,3)*Q_2d(iii,4))/
     1      (Q_2d(iii,1)-Q_2d(iii,5))             
           endif  
        else
           Flux_x(iii,2) =0 
           Flux_x(iii,3) =0
           Flux_x(iii,4)=0
           Flux_y(iii,2)=0
           Flux_y(iii,3)=0
           Flux_y(iii,4)=0
            
        endif
            enddo                   
           endif 
         endif   
        enddo   


c Point 2.1  Ciclo sorgenti attive per calcolare pendenze per celle sorgenti attivate tempo t
! $OMP do

      do iijj = 1, Num_sorgenti

       if (attivata_new(iijj).eq.1.0) then   

        do jj = 1, Nsorg1(iijj)
          
c       correzione per tener conto che se la cella era già inondata il suo k e' diverso
c       da zero 
          
           ic = ic_sorg1(jj,iijj)
           ir = ir_sorg1(jj,iijj)
           
          do j = 1,8
           icj = ic + i_sh_col(j)
           irj = ir + i_sh_row(j)
          
	
                    if(celle_routing(icj,irj).eq.esterno.and.
     1            ele(icj,irj).ne.esterno.and.
     1            internaloutputValle(icj,irj).eq.999)then
                       Num_celle_routing = Num_celle_routing+1

	                 ic_routing(Num_celle_routing) = icj
	  
	                 ir_routing(Num_celle_routing) = irj
	
                       celle_routing(icj,irj) = Num_celle_routing
                       
                       call new_cell_param(Num_celle_routing,icj,irj,jj)
                         
                    endif

      enddo

c      determinazione del peso e della pendenza e peso massimi   

      enddo

      
      endif  ! fine ciclo attivata_new

      enddo
      endif 

c Point 2.2  Identificazione celle routing su nuove sorgenti 
       
 !     do jj = 1, Num_sorgenti
	!  
	! if (attivata_new(jj).eq.1.0) then
	!  
 !        attivata_new(jj) = 0.0
 !             
	!   Loop_B: do i = 1, Nsorg1(jj)
 !         
 !          ic_ss = ic_sorg1(i,jj)
 !          ir_ss = ir_sorg1(i,jj)
 !          
 !       if (k(ic_ss,ir_ss).gt.0) then
 !
 !         do j = 1, k(ic_ss,ir_ss)
 !
 !         if (val(ic_d(ic_ss,ir_ss,j),ir_d(ic_ss,ir_ss,j)).eq.0.0) then
 !
 !         Num_celle_routing = Num_celle_routing + 1
 !
	!   ic_routing(Num_celle_routing) =  ic_d(ic_ss,ir_ss,j)
	!   ir_routing(Num_celle_routing) =  ir_d(ic_ss,ir_ss,j)
 !
	!val(ic_routing(Num_celle_routing),ir_routing(Num_celle_routing)) 
	!1= float(ii+1)
	!
	!     endif
	!    enddo
	!   endif
	!  end do Loop_B
	! endif
 !       enddo
 !     endif

!$OMP end single nowait
          
*********************************************************************
*******       Assegnazione indentià alla celle routing         *******
*********************************************************************
!$OMP do 
!$OMP& private(III,ic,ir,icj,irj,iii_1)
      do iii=1, Num_celle_routing_old
          
            ic = ic_routing(iii)
            ir = ir_routing(iii)
      
            routing_type(iii) = esterno
          
        if (Q_2d(iii, 1) - Q_2d(iii, 5).le. h_routing .and. 
     1      Q_2d(iii, 1) - Q_2d(iii, 5) .ge. 0.0) then
            
          do j = 1, 8
            icj = ic + i_sh_col(j)
            irj = ir + i_sh_row(j)
            
            if(celle_routing(icj,irj).ne.esterno)then
     
                iii_1 = celle_routing(icj,irj)
            
             if (routing_type(iii) .eq. esterno .and. 
     1          ele(icj,irj) .ne. esterno) then

                if (Q_2d(iii_1, 1) .gt. Q_2d(iii, 1) .and. 
     1              Q_2d(iii_1, 1) - Q_2d(iii_1, 5) .gt. h_routing) then
                    
                    routing_type(iii) = 0.0
         !  write(1399,'(5i8,f14.8)') iii,ic,ir,icj,irj,routing_type(iii)        
               end if
             end if
            else
                
           endif
           enddo
       else
          
          do j = 1, 8
            icj = ic + i_sh_col(j)
            irj = ir + i_sh_row(j)
            
            if(celle_routing(icj,irj).ne.esterno)then
            iii_1 = celle_routing(icj,irj)
                
              if (Q_2d(iii_1, 1) - Q_2d(iii_1, 5) .le. h_routing .and.
     1            Q_2d(iii_1, 1) - Q_2d(iii_1, 5) .ge. 0.0) then
                  
                if (Q_2d(iii, 1) .gt. Q_2d(iii_1, 1) .and.                
     1               routing_type(iii) .eq. -9999.0) then
      
                    routing_type(iii) = 1.0
    !       write(1399,'(5i8,f14.8)') iii,ic,ir,icj,irj,routing_type(iii)
                elseif (Q_2d(iii, 1) .lt. Q_2d(iii_1, 1)) then
          
                    routing_type(iii) = 2.0
    !       write(1399,'(5i8,f14.8)') iii,ic,ir,icj,irj,routing_type(iii)
               end if
              end if
            else 
                if(ele(icj,irj).ne.esterno.and.
     1         ele(icj,irj).lt.Q_2d(iii,1).and.
     1         Q_2d(iii,1)-Q_2d(iii,5).gt.h_routing.or.
     1           inletoutlet(icj,irj).eq.9000)then
!$OMP critical                     
                    if(celle_routing(icj,irj).eq.esterno)then
                       do jj=1, 8
                         ic1 = icj + i_sh_col(jj)
                         ir1 = irj + i_sh_row(jj)
                         if(inletoutlet(ic1,ir1).ge.5000.and.
     1                    inletoutlet(ic1,ir1).lt.9000) goto 1295
                       enddo 
                       
                       Num_celle_routing = Num_celle_routing+1

	                 ic_routing(Num_celle_routing) = icj
	  
	                 ir_routing(Num_celle_routing) = irj
	
                       celle_routing(icj,irj) = Num_celle_routing

                       call new_cell_param(Num_celle_routing,icj,irj,0)
      !      write(1399,'(5i8,f14.8)') iii,ic,ir,icj,irj
                       routing_type(Num_celle_routing) = 1.0
1295                  Continue                       
                    endif
!$OMP end Critical
      else
          continue
                endif
                
             endif
                

            if ((routing_type(iii) .eq. esterno).and.(j.eq.8)) then
              routing_type(iii) = 0.0
            endif
          enddo
         endif
          
      enddo
!$OMP end do
!$OMP single
      Num_celle_routing_old = Num_celle_routing
      
 !     conc(:,:) = esterno
 !     do iii = 1, num_celle_routing
 !         ic = ic_routing(iii)
 !         ir = ir_routing(iii)
 !         Conc(ic,ir) = routing_type(iii)
 !     enddo 
 !
 !      num_open = 199500
 !     	  
 !       file_name2 = "_routing.flt"
	!  retint = scan (filelog,'.')
 !     if (retint > 1) then
 !         file_name = fileLog(1:retint-1)//'_'//file_name2
 !     endif
 !       
 !       open(num_open,file=file_name,form='BINARY',mode='write')
 !       
 !       retint = scan (file_name,'.')
 !     if (retint > 1) then
 !     fileHeader = file_name(1:retint-1)//'.hdr'
 !     if (fileHeader /= fileFormat) call HdrWrite1 (fileHeader,num_open)
 !     endif
	!  do j = 1, no_rows
	!     write (num_open) (conc(i,j),i=1,no_columns)
	!enddo       
 !     close(num_open)
 !     
       
!$OMP end single
!$OMP do
!$OMP& private(ic,ir,ic_1,ir_1,ic_2,ir_2,ic_3,ir_3)
!$OMP& private(iii,iii_1,iii_2,iii_3,Chexy,Sx,Sy,S0)
!$OMP& private(S_cor)
      do iii=1, Num_celle_routing_old
          
          ic = ic_routing(iii)
          ir = ir_routing(iii)
          
          n_div  = 0.0
          Q_pp      = 0.0
          Flux_x_pp = 0.0
          Flux_y_pp = 0.0
          S_cor=0.0 
          Angolo    = 0.0
         if(routing_type(iii).ne.esterno)then
          do k_cor = 1 , 4
             
            WSE_max = 0.0
            celle_nonattive = 0.0
      ! Serching the cell with max WSE 
            do j=1, 4
              if (j.eq.1)then
                ic_1 = ic + ic_corner(k_cor)
                ir_1 = ir + ir_corner(k_cor)
              else
                ic_1 = ic + ic_corner(k_cor) + i_sh_col(coef_mm(j))
                ir_1 = ir + ir_corner(k_cor) + i_sh_row(coef_mm(j))
              endif

              
              if (celle_routing(ic_1,ir_1).ne.esterno)then
              iii_1 = celle_routing(ic_1,ir_1)
              
              if (Q_2d(iii_1,1)-Q_2d(iii_1,5).gt.h_routing) then
                  if (Q_2d(iii_1,1).gt.WSE_max) then
                     WSE_max = Q_2d(iii_1,1) 
                  end if
              endif
        ! Calculation of non active cells      
              if (Q_2d(iii,1)-Q_2d(iii,5).gt.h_routing)then ! cella iii routing
                if(ic_1.ne.ic .or. ir_1.ne.ir)then
                    if (Q_2d(iii_1,1).gt.Q_2d(iii,1).and.
     1                  Q_2d(iii_1,1)-Q_2d(iii_1,5).lt.h_routing)then 
                        
                        celle_nonattive = celle_nonattive + 1
                        
                    end if
                end if
              endif
            else 
                celle_nonattive = celle_nonattive + 1
            endif
            
          enddo
            
          
          if(WSE_max.gt.0)then
            if(celle_nonattive.lt.3)then
                
             Slope_pp   = 0.0 
             
             
             do j=1, 4
              if (j.eq.1)then
                ic_1 = ic + ic_corner(k_cor)
                ir_1 = ir + ir_corner(k_cor)
              else
                ic_1 = ic + ic_corner(k_cor) + i_sh_col(coef_mm(j))
                ir_1 = ir + ir_corner(k_cor) + i_sh_row(coef_mm(j))
              endif
              
              if(celle_routing(ic_1,ir_1).ne.esterno)then 
              iii_1=celle_routing(ic_1,ir_1)
              

              

              
              if(Q_2d(iii_1,1).le.WSE_max)then
               F_x= 0.0
               F_y= 0.0 
               Q_diag = Q_2d(iii_1,:)
               Q_diag(2) = 0.0
               Q_diag(3) = 0.0
               Slope_pp(j,1) = 0.000000001
               Slope_pp(j,2) = 0.000000001
               
               do k1=1, 2
                 ic_2 = ic_1 + i_sh_col(coef_wall(k1,j))
                 ir_2 = ir_1 + i_sh_row(coef_wall(k1,j))
                 
                 if(celle_routing(ic_2,ir_2).ne.esterno) then          
                 iii_2 = celle_routing(ic_2,ir_2)
                 wall_esterno = 1 
                 else
                 iii_2 = iii_1
                 wall_esterno = 0
                 endif
                 
       if(Q_2d(iii_2,1)-Q_2d(iii_2,5).gt .h_routing.and.wall_esterno.eq.
     1  1.or.Q_2d(iii_2,1).lt.Q_2d(iii_1,1).or.wall_esterno.eq.1.and.
     1            Q_2d(iii_2,1).le.WSE_max) then
                     
                  if(k1.eq.1)then
                    if(j.eq.1.or.j.eq.3)then
                     F_x = Flux_x(iii_1,:)
                     Q_diag(2) = Q_2d(iii_1,2)
                     
                     if(Q_2d(iii_2,5).ne.Q_2d(iii_1,5))then
                     if(Q_2d(iii_1,1)-Q_2d(iii_1,5).gt.0.0)then
                         
                      Slope_pp(j,1) = Dt*coef_pp(j,1)/2*(Q_2d(iii_1,1)-
     1                Q_2d(iii_1,5))*(Q_2d(iii_2,5)-Q_2d(iii_1,5))/Dx*g
                      endif 
                     else
                         Slope_pp(j,1) = 0.0
                     endif
                    endif
                    
                   if(j.eq.2.or.j.eq.4)then
                     F_y = Flux_y(iii_1,:)
                     Q_diag(3) = Q_2d(iii_1,3)
                     
                     if(Q_2d(iii_2,5).ne.Q_2d(iii_1,5))then
                     if(Q_2d(iii_1,1)-Q_2d(iii_1,5).gt.0.0)then
                      
                      Slope_pp(j,2) = Dt*coef_pp(j,2)/2*(Q_2d(iii_1,1)-
     1                Q_2d(iii_1,5))*(Q_2d(iii_2,5)-Q_2d(iii_1,5))/Dy*g
                      endif
                     else
                      Slope_pp(j,2) = 0.0
                     endif
                    endif
                    
                   else      ! k1 = 2
                    
                    if(j.eq.2.or.j.eq.4)then
                     F_x(:) = Flux_x(iii_1,:)
                     Q_diag(2) = Q_2d(iii_1,2)
                     
                     if(Q_2d(iii_2,5).ne.Q_2d(iii_1,5))then
                      if( Q_2d(iii_1,1)-Q_2d(iii_1,5).gt.0.0)then
                        
                      Slope_pp(j,1) = Dt*coef_pp(j,1)/2*(Q_2d(iii_1,1)-
     1                Q_2d(iii_1,5))*(Q_2d(iii_2,5)-Q_2d(iii_1,5))/Dx*g
                      endif

                     else
                         Slope_pp(j,1) = 0.0
                     endif
                    endif
                    
                     if(j.eq.1.or.j.eq.3)then
                     F_y(:) = Flux_y(iii_1,:)
                     Q_diag(3) = Q_2d(iii_1,3)
                     
                     if(Q_2d(iii_2,5).ne.Q_2d(iii_1,5))then
                      if(Q_2d(iii_1,1)-Q_2d(iii_1,5).gt.0.0)then
                         
                      Slope_pp(j,2) = Dt*coef_pp(j,2)/2*(Q_2d(iii_1,1)-
     1                Q_2d(iii_1,5))*(Q_2d(iii_2,5)-Q_2d(iii_1,5))/Dy*g
                      endif
                     else
                      Slope_pp(j,2) = 0.0
                     endif
                     endif   
                   endif
                  else
          
                   ic_3 = ic_1 + i_sh_col(coef_diag(j))
                   ir_3 = ir_1 + i_sh_row(coef_diag(j))
                   
                   
                   
                  if(celle_routing(ic_3,ir_3).ne.esterno)then
                     iii_3 = celle_routing(ic_3,ir_3) 
                   if(celle_routing(ic_2,ir_2).eq.esterno.or.
     1                ele(ic_2,ir_2).gt.H_max_tot)then
                    if(Q_2d(iii_3,1).lt.Q_2d(iii_1,1))then
                        if(Angolo(k_cor).eq.0.0)then
                          Angolo(k_cor) = 1
                        endif
                        
                   if(k1.eq.1)then
                    if(j.eq.1.or.j.eq.3)then
                      Slope_pp(j,2) = Dt*coef_pp(j,2)/2*(Q_2d(iii_1,1)-
     1                Q_2d(iii_1,5))*(Q_2d(iii_3,5)-Q_2d(iii_1,5))/Dy*g
                     else
                      Slope_pp(j,1) = Dt*coef_pp(j,1)/2*(Q_2d(iii_1,1)-
     1                Q_2d(iii_1,5))*(Q_2d(iii_3,5)-Q_2d(iii_1,5))/Dx*g
                     endif
                   else
                     if(j.eq.1.or.j.eq.3)then
                      Slope_pp(j,1) = Dt*coef_pp(j,1)/2*(Q_2d(iii_1,1)-
     1                Q_2d(iii_1,5))*(Q_2d(iii_3,5)-Q_2d(iii_1,5))/Dx*g
                     else
                      Slope_pp(j,2) = Dt*coef_pp(j,2)/2*(Q_2d(iii_1,1)-
     1                Q_2d(iii_1,5))*(Q_2d(iii_3,5)-Q_2d(iii_1,5))/Dx*g
                     endif
                    endif
                  endif
              
                  endif
                  endif
                  endif
               enddo    !do k1=1, 2
              
      !if(ii.ge.10059.and.iii.eq.12460)then
      ! write(1399,'(4i6,10f14.8)')iii,k_cor,n_div(k_cor),j,Q_pp(k_cor,:)
      ! write(1399,'(10f14.8)')Q_diag(:)
      ! write(1399,'(10f14.8)')F_x(:)
      ! write(1399,'(10f14.8)')F_y(:)
      ! write(1399,'(10f14.8)')S_cor(k_cor,:)
      !endif
                  
                 
      n_div(k_cor) = n_div(k_cor) + 1        
      Q_pp(k_cor,:) =Q_pp(k_cor,:) +Q_diag(:)-Dt/Dx*coef_pp(j,1)*F_x(:)
     1  - Dt/Dy*coef_pp(j,2)*F_y(:)
      
       if(abs(Q_pp(K_cor,5)/n_div(k_cor)-ele(ic,ir)).gt.10.or.
     1  abs(Q_pp(K_cor,4)/n_div(k_cor)).gt.1)
     1  then
c      write(1299,*) "cella0",ii,t,iii,ic,ir,Q_t2d(iii,5)-ele(ic,ir)
       endif 
       endif
      endif
         enddo !do j=1, 4
      
      Sx = 0.0
      Sy = 0.0
      
      n_div_slope = 0.0
      
      if(n_div(k_cor)==4)then
        do j = 1, 4
         Sx = Sx + Slope_pp(j,1)
         Sy = Sy + Slope_pp(j,2)   
        enddo
        Sx = Sx/4
        Sy = Sy/4
      else
        do j = 1,4
          if(Slope_pp(j,1).ne.0.0)then
             Sx = Sx + Slope_pp(j,1)
             n_div_slope(1) = n_div_slope(1) + 1
          endif
          if(Slope_pp(j,2).ne.0.0)then
             Sy = Sy + Slope_pp(j,2)
             n_div_slope(2) = n_div_slope(2) + 1
          endif
        enddo
        if(n_div_slope(1).gt.0)  Sx = Sx / n_div_slope(1)
        if(n_div_slope(2).gt.0)  Sy = Sy / n_div_slope(2)
      endif
      
      S_cor(k_cor,2) = Sx
      S_cor(k_cor,3) = Sy
      

            endif
            
      if(S_cor(k_cor,2).le.0.000000001)S_cor(k_cor,2)=0.0
      if(S_cor(k_cor,3).le.0.000000001)S_cor(k_cor,3)=0.0
          endif  ! WSE_max.gt.0
          
          
          if(n_div(k_cor).gt.0.0)then
      !if(iii.eq.1..or.iii.eq.2)then
      ! write(1399,'(4i6,10f14.8)')iii,k_cor,n_div(k_cor),j,Q_pp(k_cor,:)
      ! 
      !endif 
             Q_pp(k_cor,:) = Q_pp(k_cor,:)/n_div(k_cor) + S_cor(k_cor,:)
      !if(ii.ge.14431..and.iii.eq.1737)then
      ! write(1399,'(4i6,10f14.8)')iii,k_cor,n_div(k_cor),j,Q_pp(k_cor,:)
      ! write(1399,'(10f14.8)') S_cor(k_cor,:)
      !endif 
          else
             Q_pp(k_cor,:) = Q_2d(iii,:)
          endif
          
          
         enddo  !do k_cor=1, 4
      
         Slope_pp_v = 0.0
      
      do k_cor = 1,4
        if(Q_pp(k_cor,1)-Q_pp(k_cor,5).gt.h_routing)then
            
            if(Angolo(k_cor).eq.1)then
                Q_pp(k_cor,2) = Q_pp(k_cor,2) - coef_pp(k_cor,1) *
     1            Q_pp(k_cor,2)/3
                Q_pp(k_cor,3) = Q_pp(k_cor,3) - coef_pp(k_cor,2) * 
     1            Q_pp(k_cor,3)/3
            endif
            
            if(Q_pp(k_cor,4).ne.0)then
              
              Flux_x_pp (k_cor,:) = (/Q_pp(k_cor,2), (Q_pp(k_cor,2)**2)/
     1        (Q_pp(k_cor,1)-Q_pp(k_cor,5))+g/2*(Q_pp(k_cor,1)-
     1        Q_pp(k_cor,5))**2, Q_pp(k_cor,2)*Q_pp(k_cor,3)/
     1        (Q_pp(k_cor,1)-Q_pp(k_cor,5)),Q_pp(k_cor,4)*Q_pp(k_cor,2)/
     1        (Q_pp(k_cor,1)-Q_pp(k_cor,5)),0.0/)

             Flux_y_pp (k_cor,:) = (/Q_pp(k_cor,3),Q_pp(k_cor,2)*
     1        Q_pp(k_cor,3)/(Q_pp(k_cor,1)-Q_pp(k_cor,5)),
     1        (Q_pp(k_cor,3)**2)/
     1        (Q_pp(k_cor,1)-Q_pp(k_cor,5))+g/2*(Q_pp(k_cor,1)-
     1        Q_pp(k_cor,5))**2, Q_pp(k_cor,4)*Q_pp(k_cor,3)/
     1        (Q_pp(k_cor,1)-Q_pp(k_cor,5)),0.0/)          
            else
              Flux_x_pp(k_cor,:) = (/Q_pp(k_cor,2), (Q_pp(k_cor,2)**2)/
     1        (Q_pp(k_cor,1)-Q_pp(k_cor,5))+g/2*(Q_pp(k_cor,1)-
     1        Q_pp(k_cor,5))**2, Q_pp(k_cor,2)*Q_pp(k_cor,3)/
     1        (Q_pp(k_cor,1)-Q_pp(k_cor,5)),0.0,0.0/)

              Flux_y_pp(k_cor,1) = Q_pp(k_cor,3)
              Flux_y_pp(k_cor,2) = Q_pp(k_cor,2)*
     1        Q_pp(k_cor,3)/(Q_pp(k_cor,1)-Q_pp(k_cor,5))
              Flux_y_pp(k_cor,3) = (Q_pp(k_cor,3)**2)/
     1        (Q_pp(k_cor,1)-Q_pp(k_cor,5))+g/2*(Q_pp(k_cor,1)-
     1        Q_pp(k_cor,5))**2
              
              Flux_y_pp (k_cor,4) = 0.0
              Flux_y_pp (k_cor,5) = 0.0
              
              
              
            endif
            
        else if(Q_pp(k_cor,1)-Q_pp(k_cor,5).gt.0.0000001)then
            if(Q_pp(k_cor,2).ne.0.0.and.Q_pp(k_cor,3).ne.0.0)then
                if(Q_pp(k_cor,4).gt.0.0)then
                                
              Flux_x_pp (k_cor,:) = [ 
     1         Q_pp(k_cor,2), (Q_pp(k_cor,2)**2)/
     1        (Q_pp(k_cor,1)-Q_pp(k_cor,5))+g/2*(Q_pp(k_cor,1)-
     1        Q_pp(k_cor,5))**2, Q_pp(k_cor,2)*Q_pp(k_cor,3)/
     1        (Q_pp(k_cor,1)-Q_pp(k_cor,5)),
     1        Q_pp(k_cor,4)*Q_pp(k_cor,2)/(Q_pp(k_cor,1)-Q_pp(k_cor,5)),
     1         0.0 ]

             Flux_y_pp (k_cor,:) = (/Q_pp(k_cor,3),Q_pp(k_cor,2)*
     1        Q_pp(k_cor,3)/(Q_pp(k_cor,1)-Q_pp(k_cor,5)),
     1        (Q_pp(k_cor,3)**2)/
     1        (Q_pp(k_cor,1)-Q_pp(k_cor,5))+g/2*(Q_pp(k_cor,1)-
     1        Q_pp(k_cor,5))**2,
     1        Q_pp(k_cor,4)*Q_pp(k_cor,3)/(Q_pp(k_cor,1)-Q_pp(k_cor,5)),
     1        0.0 /)

            else
                
             Flux_x_pp (k_cor,:) = (/ Q_pp(k_cor,2), (Q_pp(k_cor,2)**2)/
     1        (Q_pp(k_cor,1)-Q_pp(k_cor,5))+g/2*(Q_pp(k_cor,1)-
     1        Q_pp(k_cor,5))**2, Q_pp(k_cor,2)*Q_pp(k_cor,3)/
     1        (Q_pp(k_cor,1)-Q_pp(k_cor,5)),0.0 ,0.0 /)

             Flux_y_pp (k_cor,:) = (/Q_pp(k_cor,3),Q_pp(k_cor,2)*
     1        Q_pp(k_cor,3)/(Q_pp(k_cor,1)-Q_pp(k_cor,5)),
     1        (Q_pp(k_cor,3)**2)/
     1        (Q_pp(k_cor,1)-Q_pp(k_cor,5))+g/2*(Q_pp(k_cor,1)-
     1        Q_pp(k_cor,5))**2, 0.0,0.0/)
            endif
            
            else
             Flux_x_pp (k_cor,:) = (/ Q_pp(k_cor,2), (Q_pp(k_cor,2)**2)/
     1        (Q_pp(k_cor,1)-Q_pp(k_cor,5))+g/2*(Q_pp(k_cor,1)-
     1        Q_pp(k_cor,5))**2, 0.0, 0.0, 0.0 /)

             Flux_y_pp (k_cor,:) = (/Q_pp(k_cor,3),0.0,
     1        (Q_pp(k_cor,3)**2)/
     1        (Q_pp(k_cor,1)-Q_pp(k_cor,5))+g/2*(Q_pp(k_cor,1)-
     1        Q_pp(k_cor,5))**2, 0.0,0.0/)  
            endif
        endif  
        Slope_pp_v(k_cor,1) = 0.0
        Slope_pp_v(k_cor,2) = 0.0
       if(k_cor.eq.1)then 
           k_cor_v = 2 
       else if(k_cor.eq.2)then
           k_cor_v = 1 
       else if(k_cor.eq.3)then
           k_cor_v = 4
       else if(k_cor.eq.4)then
           k_cor_v = 3
       endif
        if(Q_pp(k_cor_v,5).ne.-9999.and.Q_pp(k_cor_v,5).ne.0.0)then
            Slope_pp_v(k_cor,1) = Dt*coef_pp(k_cor,1)/2*(Q_pp(k_cor,1)-
     1               Q_pp(k_cor,5))*(Q_pp(k_cor_v,5)-Q_pp(k_cor,5))/Dx*g
        endif
        
       if(k_cor.eq.1)then 
           k_cor_v = 4 
       else if(k_cor.eq.2)then
           k_cor_v = 3 
       else if(k_cor.eq.3)then
           k_cor_v = 2
       else if(k_cor.eq.4)then
           k_cor_v = 1
       endif
        if(Q_pp(k_cor_v,5).ne.-9999.and.Q_pp(k_cor_v,5).ne.0.0)then
            Slope_pp_v(k_cor,2) = Dt*coef_pp(k_cor,2)/2*(Q_pp(k_cor,1)-
     1               Q_pp(k_cor,5))*(Q_pp(k_cor_v,5)-Q_pp(k_cor,5))/Dy*g
        endif
      enddo
      
      Sx = 0
      Sy = 0
      n_d = 0
      n_div_slope(1) = 0
      n_div_slope(2) = 0
      if(routing_type(iii).ne.2)then
          do k_cor =1, 4
              if(Slope_pp_v(k_cor,1).ne.0.0)then
                Sx = Sx + Slope_pp_v(k_cor,1)
                n_div_slope(1) = n_div_slope(1) + 1
              endif
              if(Slope_pp_v(k_cor,2).ne.0.0)then
                Sy = Sy + Slope_pp_v(k_cor,2)
                n_div_slope(2) = n_div_slope(2) + 1
              endif
          enddo
          if(Sx.eq.0.0.or.n_div_slope(1).eq.0.0)then
            Sx = 0.0
            else
              Sx = Sx / n_div_slope(1)
            endif
           if(Sy.eq.0.0.or.n_div_slope(2).eq.0.0)then
               Sy = 0.0
            else
              Sy = Sy / n_div_slope(2)
           endif
      else
          do k_cor =1, 4
                Sx = Sx + Slope_pp_v(k_cor,1)
                Sy = Sy + Slope_pp_v(k_cor,2)
          enddo 
                Sx = Sx / 4
                Sy = Sy / 4
      endif
                
        S_0 = (/0.0, Sx, Sy,0.0,0.0/)
        
        n_div = 0.0
        Q_t2d(iii,:) = 0.0
        WSE_max = 0.0
        
        do k_cor=1,4
          if(Q_pp(k_cor,1).gt.Q_2d(iii,5))then
            if(Q_pp(k_cor,1)-Q_pp(k_cor,5).ne.0.0)then
              if(Q_pp(k_cor,1).gt.WSE_max)then
                  WSE_max = Q_pp(k_cor,1)
              endif
            endif
          endif
        enddo
      if(ii.eq.7.and.iii.eq.42)then
          continue
      endif
        if(WSE_max.ne.0)then
            do k_cor=1,4
              n_d = n_d + 1
              Q_t2d(iii,:) = Q_t2d(iii,:)+Q_pp(k_cor,:)
     1  -Dt/Dx*coef_pp(k_cor,1)*Flux_x_pp(k_cor,:)
     1  -Dt/Dy*coef_pp(k_cor,2)*Flux_y_pp(k_cor,:)
        !if(iii.eq.1..or.iii.eq.2)then
        !write(1399,'(3i6,10f14.8)')iii,k_cor,n_d,Q_t2d(iii,:)
        !write(1399,'(10f14.8)')Q_pp(k_cor,:)
        !write(1399,'(10f14.8)')Flux_x_pp(k_cor,:)
        !write(1399,'(10f14.8)')Flux_y_pp(k_cor,:)
        !write(1399,'(210f14.8)')Sx,Sy
        !endif
       enddo
                
        ! calcolo soluzion t+1 nel centro
        if(Q_2d(iii,1)-Q_2d(iii,5).gt.h_routing)then
            Q_t2d(iii,:) = Q_t2d(iii,:)/n_d + S_0
      !if(iii.eq.1..or.iii.eq.2)then
      ! write(1399,'(10f14.8)')Q_t2d(iii,:)
      ! write(1399,'(10f14.8)')S_0
      !endif
        else 
            Q_t2d(iii,:) = (/Q_t2d(iii,1)/n_d, 0.0 , 0.0 ,
     1        Q_t2d(iii,4)/n_d, Q_t2d(iii,5)/n_d /) 
        endif

  
            
            
            
            
            
            
            
            
        
        ! verifica che non ci sia modifica del fondo
        if(Q_t2d(iii,5).ne.Q_2d(iii,5))then
            Q_t2d(iii,5) = Q_2d(iii,5)
        endif
        
        if(Q_t2d(iii,4).lt.0.0)then
            Q_t2d(iii,4) = 0.0
        endif
        
        !Verifico che la WSE sia maggiore del fondo
         if(Q_t2d(iii,1)-Q_t2d(iii,5).lt.0.0)then
             Q_t2d(iii,:) =(/ Q_2d(iii,5), 0.0 ,0.0 ,0.0 ,Q_2d(iii,5) /)
         endif
         
      ! Se la variazione di 
      if (abs(Q_t2d(iii,1)-Q_2d(iii,1))<0.0000001)then
        Q_t2d(iii,2)=0.0
        Q_t2d(iii,3)=0.0
        Q_t2d(iii,4)=Q_2d(iii,4)
      endif
      
      ! se il tirante è minore dell h_minimo non c'è velocità
      if(Q_t2d(iii,1)-Q_t2d(iii,5).le.h_routing)then 
       Q_t2d(iii,2)=0.0
       Q_t2d(iii,3)=0.0 
      endif
      if(Q_t2d(iii,1)-Q_t2d(iii,5).gt.h_routing)then
          
      ! perdite di energia per scabrezza
      if (chezy_cont.eq.1)then
       Chezy = Param(iii,1)*(1-0.8*Q_t2d(iii,4)/(Param(iii,8)*0.9))
      elseif (chezy_cont.eq.0)then
       Chezy = Param(iii,1)
      elseif (chezy_cont.eq.2)then
       Con = Q_t2d(iii,4)/Param(iii,8)
       Chezy =  p_con(1)*Con**3+p_con(2)*Con**2+p_con(3)*Con+p_con(4)
      elseif (chezy_cont.eq.3)then
        Con = Q_t2d(iii,4)/Param(iii,8)
        if(Con<0.1)then
         Chezy = C0
        elseif(Con<C75)then 
         m = (C0-C75)/(0.75-0.1)   
         Chezy =  C0-m*(Con-0.1)
        else
         Chezy = C75   
        endif
        
      endif
      
      if(Chezy .lt.1)then
          Chezy = 1
      endif  
      Q_mod = sqrt(Q_t2d(iii,2)**2+Q_t2d(iii,3)**2)
      Scab_x = g*(Q_t2d(iii,1)-Q_t2d(iii,5))*(-Q_mod*
     1      Q_t2d(iii,2)/((Q_t2d(iii,1)-Q_t2d(iii,5))**3*Chezy**2*g))
      Scab_y = g*(Q_t2d(iii,1)-Q_t2d(iii,5))*(-Q_mod*
     1      Q_t2d(iii,3)/((Q_t2d(iii,1)-Q_t2d(iii,5))**3*Chezy**2*g))
      ! controlliamo che le resistenze al moto non siano maggiori al energia
      if (abs(Scab_x*Dt)>abs(Q_t2d(iii,2)))then
        Scab_x = -Q_t2d(iii,2)*0.9/Dt
      endif
      
      if (abs(Scab_y*Dt)>abs(Q_t2d(iii,3)))then
     
          Scab_y = -Q_t2d(iii,3)*0.9/Dt
      endif
        
    ! erosione e deposito
    
  ! erosione
    
      ero = 0
      Uxy = 0.0

      
      if(Param(iii,2).eq.1)then
      
c      if(Param(iii,2).eq.1.and.
c     1 inletoutlet(ic,ir).ne.5000)then
          
       if(Q_t2d(iii,2).ne.0.or.Q_t2d(iii,3).ne.0)then 
        
           call U_direction(iii,Uxy,dir_U)
      
      if(dir_U.eq.2.or.dir_U.eq.4.or.dir_U.eq.6.or.dir_U.eq.8)then
        L = sqrt(Dx**2+Dy**2) 
      elseif (dir_U.eq.1.or.dir_U.eq.5)then
        L = Dy 
      elseif(dir_U.eq.3.or.dir_U.eq.7)then
        L = Dx
      endif
      if(celle_routing(ic+i_sh_col(dir_U),ir+i_sh_row(dir_U))
     1      .ne.esterno)then
      iii_1 = celle_routing(ic+i_sh_col(dir_U),ir+i_sh_row(dir_U))
       
      teta_dir_U = (atan((Q_2d(iii,5)-Q_2d(iii_1,5))/L))*180/pigreco
      else 
          teta_dir_U = 0.0
       do k1=1,2    
           if(k1.eq.1)then
             dir_U_1 = dir_U + 1
             if (dir_U_1.gt.8)then
                 dir_U_1 = 1
             endif
           else 
               dir_U_1 = dir_U - 1
               if(dir_U_1.lt.1)then
                   dir_U_1 = 8
               endif
           endif
      if(dir_U_1.eq.2.or.dir_U_1.eq.4.or.dir_U_1.eq.6.or.dir_U_1.eq.8)
     1 then
        L = sqrt(Dx**2+Dy**2) 
      elseif (dir_U_1.eq.1.or.dir_U_1.eq.5)then
        L = Dy 
      elseif(dir_U_1.eq.3.or.dir_U_1.eq.7)then
        L = Dx
      endif
        ic_1 = ic+i_sh_col(dir_U_1)
        ir_1 = ir+i_sh_row(dir_U_1)
        if(celle_routing(ic_1,ir_1).ne.esterno)then
         iii_1 = celle_routing(ic_1,ir_1)
         if((atan((Q_2d(iii,5)-Q_2d(iii_1,5))/L))*180/pigreco.gt.
     1      teta_dir_U)then 
          
      teta_dir_U = (atan((Q_2d(iii,5)-Q_2d(iii_1,5))/L))*180/pigreco
      endif
      endif
       enddo 
      endif
      
      
      if(Uxy.ne.0)then
      ! Deposito per ecesso materiale solido, concentrazione superiore C_f *0.9 depositio
       if(Q_t2d(iii,4).gt.0.9*Param(iii,8))then 
      
         ero = -(Q_t2d(iii,4)-0.5*Param(iii,8))*(Q_t2d(iii,1)-
     1            Q_t2d(iii,5))/Dt/0.9*Param(iii,8)
      
       else 
     
      ! Erosion con
      H_t0 = Q_2d(iii,1) + sqrt(Q_2d(iii,2)**2+Q_2d(iii,3)**2)/2/9.81
      H_t1 = Q_t2d(iii,1) + sqrt(Q_t2d(iii,2)**2+Q_t2d(iii,3)**2)/2/9.81
      if(H_t1.gt.H_t0.and.
     1   Q_t2d(iii,4).lt.0.9*Param(iii,8).and.
     1 Q_t2d(iii,1)-Q_t2d(iii,5).gt.h_erosione)then 
        if(Uxy.gt.Param(iii,4).and.teta_dir_U.gt.Param(iii,5))then 
!        ero1 = Egash_eros*(Uxy-Param(iii,4))*(sin(rad_grad*teta_dir_U)-
!     1         sin(rad_grad*Param(iii,5)))
         ero = Egash_eros*(Uxy)*(sin(rad_grad*teta_dir_U)-
     1         sin(rad_grad*Param(iii,5)))
        
        
       endif 
      endif
c Deposit
      if(Q_t2d(iii,4).gt.C_limite_deposito)then 
c DEposit inf
      if(teta_dir_U .lt. Limit_Angle)then
        if(Uxy.lt.Param(iii,6))then
      ero = Coeff_Ang_Limit *Egash_dep*(Param(iii,6)-Uxy)*(sin(rad_grad
     1     *teta_dir_U)-sin(rad_grad*Param(iii,7)))+Egash_dep*
     1     (Param(iii,6)) * (sin(rad_grad*teta_dir_U)-
     1     sin(rad_grad*Param(iii,7)))
     
            ero1 = Coeff_Ang_Limit *Egash_dep*(Uxy)*(sin(rad_grad
     1     *teta_dir_U)-sin(rad_grad*Param(iii,7)))
       else
        ero = Egash_dep*(Param(iii,6))*(sin(rad_grad*teta_dir_U)
     1        -sin(rad_grad*Param(iii,7)))
            ero1 = Coeff_Ang_Limit *Egash_dep*(Uxy)*(sin(rad_grad
     1     *teta_dir_U)-sin(rad_grad*Param(iii,7)))
       endif               
      else if(Uxy.lt. Param(iii,6) .and. sin(rad_grad*teta_dir_U)
     1        .lt. sin(rad_grad*Param(iii,7)))then
c egashira deposition
        ero =Egash_dep*(Param(iii,6)-Uxy)*(sin(rad_grad*teta_dir_U)
     1        -sin(rad_grad*Param(iii,7)))


            ero1 = Egash_dep*(Uxy)*(sin(rad_grad
     1     *teta_dir_U)-sin(rad_grad*Param(iii,7)))

      endif
      endif
       endif
       endif
      endif
      endif
      ! Verifica che l'erosione non implichi il superamento della concentrazione limite    
      
      if(ero.ne.0)then 
      if(Param(iii,3).eq.1.and.ele(ic,ir).gt.Q_t2d(iii,5)-Dt*ero)then 
        ero = 0.0     
      else 
        if(Q_t2d(iii,4).lt.0.9*Param(iii,8).and.0.9*Param(iii,8)
     1   .lt.Q_t2d(iii,4)+Dt*ero*Param(iii,8)/
     1   (Q_t2d(iii,1)-Q_t2d(iii,5)))then
          ero = 0.0
      endif
      if(Q_t2d(iii,4)+ero*DT*Param(iii,8)/(Q_t2d(iii,1)-Q_t2d(iii,5))
     1     .lt.0.0)then
         ero =-Q_t2d(iii,4)* (Q_t2d(iii,1)-Q_t2d(iii,5))/Dt/Param(iii,8)
      endif
          
          
        ero_tot =        ero_tot + Dt*ero*Dx*Dy
        ero_tot_solid =  ero_tot_solid+Dt*ero*Param(iii,8)*Dx*Dy  
        
        endif
      endif
      if(inletoutlet(ic,ir).eq.5000)then 
      Write(1399,'(2i6,20f20.10)')ii,iii,Dt,t,Q_t2d(iii,1),Q_t2d(iii,2),
     1 Q_t2d(iii,3),Q_t2d(iii,4),Q_t2d(iii,5),Q_t2d(iii,1)-Q_t2d(iii,5), 
     1  Flux_x(iii,2),Flux_x(iii,3),Flux_y(iii,2), Flux_y(iii,3),
     1  Flux_x(iii,4),Scab_x,Scab_y,ero*Param(iii,8)
     1        /(Q_t2d(iii,1)-Q_t2d(iii,5)),-ero
      endif
      if(eros_mom_cont.eq.0)then
        S_ero_x =0.0
        S_ero_y =0.0
      elseif (eros_mom_cont.eq.1)then
        Con_rel = Q_t2d(iii,4)/(0.9*Param(iii,8))
        beta = fun_beta(Con_rel)
        ka = 1.11
        S_ero = ka*(0.2)**beta*Uxy*ero
        S_ero_x = cosd(teta_dir_U)*S_ero
        s_ero_y = sind(teta_dir_U)*S_ero
      endif  
        
        
      S0 = (/ 0.0 ,Scab_x+S_ero_x,Scab_y+S_ero_y,ero*Param(iii,8)
     1        /(Q_t2d(iii,1)-Q_t2d(iii,5)),-ero /)
      

        Q_t2d(iii,:) = Q_t2d(iii,:) + Dt * S0

      if(inletoutlet(ic,ir).eq.5000)then 
      Write(1399,'(2i6,20f20.10)')ii,iii,Dt,t,Q_t2d(iii,1),Q_t2d(iii,2),
     1 Q_t2d(iii,3),Q_t2d(iii,4),Q_t2d(iii,5),Q_t2d(iii,1)-Q_t2d(iii,5), 
     1  Flux_x(iii,2),Flux_x(iii,3),Flux_y(iii,2), Flux_y(iii,3),
     1  Flux_x(iii,4),Scab_x,Scab_y,ero*Param(iii,8)
     1        /(Q_t2d(iii,1)-Q_t2d(iii,5)),-ero
      endif
      
      if(Q_t2d(iii,4).lt.0.0)then
          Q_t2d(iii,4) = 0.0
      endif
          
          
      if(abs(Q_t2d(iii,5)-ele(ic,ir)).gt.10.or.abs(Q_t2d(iii,4)).gt.1)
     1  then
c        write(1299,*) "cella1",ii,t,iii,ic,ir,Q_t2d(iii,5)-ele(ic,ir)
      endif 
      
      if(Q_t2d(iii,4).lt.0.0)then 
          Q_t2d(iii,4) = 0.0
      endif
      !if(iii.eq.1..or.iii.eq.2)then
      ! write(1399,'(10f14.8)')Q_t2d(iii,:)
      ! write(1399,'(10f14.8)')S0
      !endif
    
      endif
      else
        Q_t2d(iii,:) = Q_2d(iii,:)
      endif      
    
  

      else
          Q_t2d(iii,:) = Q_2d(iii,:)
                
      endif
      enddo
!$OMP end do
 
!$OMP single  
 !     conc(:,:) = esterno
 !     do iii = 1, num_celle_routing
 !         ic = ic_routing(iii)
 !         ir = ir_routing(iii)
 !         Conc(ic,ir) = Q_t2d(iii,1)-Q_t2d(iii,5)
 !     enddo 
 !
 !      num_open = 199500
 !     	  
 !       file_name2 = "_h.flt"
	!  retint = scan (filelog,'.')
 !     if (retint > 1) then
 !         file_name = fileLog(1:retint-1)//'_'//file_name2
 !     endif
 !       
 !       open(num_open,file=file_name,form='BINARY',mode='write')
 !       
 !       retint = scan (file_name,'.')
 !     if (retint > 1) then
 !     fileHeader = file_name(1:retint-1)//'.hdr'
 !     if (fileHeader /= fileFormat) call HdrWrite1 (fileHeader,num_open)
 !     endif
	!  do j = 1, no_rows
	!     write (num_open) (conc(i,j),i=1,no_columns)
	!enddo       
 !     close(num_open)
 !      
      !Verifica sulla continuità
       
     
      a=0.0
      b=0.0
      d=0.0
      n_celle=0.0
      do i=1,num_celle_routing
         if(ii.ge.10061.and.i.eq.12460)then
          write(1399,'(2i6,10f14.8)')ii, i, Q_t2d(i, :)
         endif 
        ! Calculate volume eroso o deposito tra t e t+1
          if(Q_t2d(i, 5).gt.0)then
        d = d + (Q_t2d(i, 5) - Q_2d(i, 5))*Dx*Dy
          endif
          
        ! Calculate volume totale nel dominio al tempo t+1
          if(Q_t2d(i,1).gt.0)then
        a = a + (Q_t2d(i, 1) - Q_t2d(i, 5))*Dx*Dy
          endif
        ! Calculate volume totale presente nel dominio al tempo t
           if(Q_t2d(i,1).gt.0)then
        b = b + (Q_2d(i,1)-Q_2d(i,5))*Dx*Dy
        endif
       if(Q_t2d(i,2).ne.0 .and.(Q_t2d(i,1)-Q_t2d(i,5)).gt.1 *h_routing
     1   .or.Q_t2d(i,3).ne.0 .and. (Q_t2d(i,1) - Q_t2d(i,5)) .gt.
     1     1 * h_routing)then
        n_celle = n_celle +1 
        index_celle(n_celle)=i 
       endif
         end do
         
! Calculate 'delta_v'
       if (n_celle .gt. 0.0) then
       delta_v = (a - b + d) / n_celle
       
      Write(1299,'(1i6,20f20.10)') ii,t,a,b,d,delta_v*n_celle,delta_v
       
! Define and initialize array Q
      
      Q_1(:) = 0.0

! Update values of Q based on conditions
      do j=1, n_celle
        i = index_celle(j)
        Q_1(i) = delta_v

      
! Update Q_t2d(:,:,1)
        if (Q_t2d(i,1)-Q_t2d(i,5)- Q_1(i)  / (Dx * Dy).gt.0.0)then
         Q_t2d(i,1) = Q_t2d(i,1) - Q_1(i) / (Dx * Dy)
        else
         Q_t2d(i,1) = Q_t2d(i,5)
        endif
         if(ii.ge.10061.and.i.eq.12460)then
          write(1399,'(2i6,10f14.8)')ii, i, Q_t2d(i, :)
         endif     
       enddo
      
       endif
   
! controlla il volume solido
       ! Calculate 'd'
      a_1=a
      b_1=b
      d_1=d
      a=0.0
      b=0.0
      d=0.0
      n_celle_C = 0.0
      delta_v = 0.0
      
      do i=1,Num_celle_routing
         if(ii.ge.10061.and.i.eq.12460)then
          write(1399,'(2i6,10f14.8)')ii, i, Q_t2d(i, :)
         endif    
          
        if(Q_t2d(i,5).ne.esterno)then
      d =d+ (Q_t2d(i,5) - Q_2d(i,5))*Param(i,8)*Dx*Dy
        endif
! Calcolo volume solido t+1
        if(Q_t2d(i,4).gt.zero)then
      a =a+(Q_t2d(i, 4)*(Q_t2d(i,1)-Q_t2d(i,5))*Dx*Dy)
        endif
! Calcolo volume solido t
      if(Q_2d(i,4).ne.esterno)then
        b =b+ (Q_2d(i,4)*(Q_2d(i,1)-Q_2d(i,5))*Dx* Dy)
      endif
! Numero celle 
      if(Q_t2d(i,4).lt.0.9*Param(i,8).and.Q_t2d(i,4).gt.
     1 0.0.and.Q_t2d(i,2).ne.0.and.(Q_t2d(i,1)-Q_t2d(i,5)).gt.1.2*  
     1 h_routing.or.Q_t2d(i,4).lt.0.9*Param(i,8).and. Q_t2d(i,4).gt.0.0
     1 .and.Q_t2d(i,3).ne.0.and.(Q_t2d(i,1)-Q_t2d(i,5)).gt. 1.2* 
     1 h_routing )then
      n_celle_C = n_celle_C + 1
      index_celle(n_celle_C) = i
      endif
      
      enddo

      if (n_celle_C .gt. 0.0) then
        delta_v = (a - b + d) / n_celle_C
      
  ! Define and initialize array Q
      
      Q_int(:) = 0

  ! Update values of Q based on conditions
      do j=1, n_celle_C
        i = index_celle(j)  

       
            
  ! Calculate Q_int
      Q_int(i) = Q_t2d(i,4) - delta_v/(Dx*Dy*(Q_t2d(i,1) - Q_t2d(i,5)))
      
      enddo
  ! Update Q_int based on conditions
            
      Conc_minimo = minval(Q_int)
      Conc_m = maxval(Q_int)
      n_celle = 0.0
      Q_1=0.0
      if (Conc_minimo.lt.0.0 .or. Conc_m.gt.Cmax*0.9) then
    ! Update Q based on conditions
      do j = 1, n_celle_C
         i = index_celle(j) 
          Q_1(i) = 1

      if(Q_int(i).gt.0.0.and.Q_int(i).lt.0.9*Param(i,8))then
            n_celle = n_celle + 1
            index_celle_1(n_celle) = index_celle(j)
            Q_1(i) = 1 / (Dx*Dy*(Q_t2d(i,1)-Q_t2d(i,5)))
      end if
        
       end do
      if(n_celle.gt.0)then
         delta_v = (a - b + d) / n_celle

      
      do j=1, n_celle
          i = index_celle_1(j) 
        if(Q_1(i).ne.1.and.Q_t2d(i,5).ne.esterno)then
           Q_1(i) = delta_v / Q_1(i)
           Q_1(i) = Q_t2d(i,4) - Q_1(i)
           if(Q_t2d(i,4).gt.0)then
             Q_t2d(i,4) = Q_1(i)
           else
             Q_t2d(i,4) = 0.0
           endif
        else if(Q_1(i).eq.1)then   
           Q_1(i) = 0.0
        endif
         if(ii.ge.10061.and.i.eq.12460)then
          write(1399,'(2i6,10f14.8)')ii, i, Q_t2d(i, :)
         endif 
      enddo

      
      
       
       else
         delta_v = (a - b + d) / n_celle_C
         do j=1, n_celle_C
          i = index_celle(j)  

          if(Q_int(i).gt.0.9*Param(i,8))then
              Q_int(i)=0.9*Param(i,8)
          endif
 
           Q_t2d(i,4) = Q_int(i) 
      
         enddo   
         
      endif
       
      else
       do j=1, n_celle_C
         i = index_celle(j)  
           
  ! Calculate Q_int
       Q_t2d(i,4) = Q_t2d(i,4) - 
     1    delta_v/(Dx*Dy*(Q_t2d(i,1) - Q_t2d(i,5)))
      
      enddo
        
      endif
      
      endif
      Q_int(:) = Q_2d(1:num_celle_routing,2)
      Q_2d(1:num_celle_routing,:) = Q_t2d(1:num_celle_routing,:)
      
       h_mass= 0.0
       h_minimo = 1
       C_mass= 0.0
       C_mini= 0.0
       v_mass= 0.0
       v_min=0.0
       u_mass= 0.0
       u_min=0.0
       
       a1 = 0.0
       b1 = 0.0
       d1 = 0.0
       a11 = 0.0
       b11 = 0.0
       d11 = 0.0
       
      do i=1,num_celle_routing
          if(Q_t2d(i,5).ne.esterno)then
      d1 =d1+ (Q_t2d(i,5) - Q_2d(i,5))*Param(i,8)*Dx*Dy
        endif
! Calcolo volume solido t+1
        if(Q_t2d(i,4).ne.esterno)then
      a1 =a1+(Q_t2d(i, 4)*(Q_t2d(i,1)-Q_t2d(i,5))*Dx*Dy)
        endif
! Calcolo volume solido t
      if(Q_2d(i,4).ne.esterno)then
        b1 =b1+ (Q_2d(i,4)*(Q_2d(i,1)-Q_2d(i,5))*Dx* Dy)
      endif
       if(Q_t2d(i, 5).gt.0)then
        d11 = d11 + (Q_t2d(i, 5) - Q_2d(i, 5))*Dx*Dy
          endif
          
        ! Calculate volume totale nel dominio al tempo t+1
          if(Q_t2d(i,1).gt.0)then
        a11 = a11 + (Q_t2d(i, 1) - Q_t2d(i, 5))*Dx*Dy
          endif
        ! Calculate volume totale presente nel dominio al tempo t
           if(Q_t2d(i,1).gt.0)then
        b11 = b11 + (Q_2d(i,1)-Q_2d(i,5))*Dx*Dy
           endif
      enddo 
      
      Write(1299,'(1i6,20f20.10)')ii,t,a11,b11,d,delta_v*n_celle,delta_v
      ! IF(Q_2d(i,1)-Q_2d(i,5)) then
      !if(a.gt.h_mass) h_mass= a 
      !if(a.lt.h_minimo.and.a.ne.0.0)h_minimo= a
      !if(Q_2d(i,4).gt.C_mass) C_mass=Q_2d(i,4) 
      !if(Q_2d(i,4).lt.C_mini) C_mini=Q_2d(i,4)
      !if(Q_2d(i,2).gt.u_mass)u_mass=Q_2d(i,2)
      !if(Q_2d(i,3).gt.v_mass)v_mass=Q_2d(i,3)
      !if(Q_2d(i,2).lt.u_min)u_min=Q_2d(i,2)
      !if(Q_2d(i,3).lt.v_min)v_min=Q_2d(i,3)
      
      if(ii.eq.50)then
          continue
      endif
      
     !! Write(1399,'(i6,15f14.8)') ii,Dt,t,h_mass,h_minimo,C_mass,C_mini,
     !!1 u_mass,v_mass,u_min,v_min
     !! write(1399,'(i6,20f20.12)') ii,Dt,t,ero_tot,ero_tot_solid,a_1,b_1
     !!1 ,d_1,a11,b11,d11,a,b,c,a1,b1,d1

      V_eros  = V_eros + ero_tot
      V_solid = V_solid + ero_tot_solid
!$OMP end single
c Calolo dei vettori flusso al tempo t+1 

!$OMP do 
      do iii = 1, num_celle_routing
        ic = ic_routing(iii)
        ir = ir_routing(iii)
        if(Q_2d(iii,4).lt.0.0)then 
          Q_2d(iii,4) = 0.0
        endif
        
        
          if(inletoutlet(ic,ir).eq.9000)then
              V_fuori_uscito_DT = V_fuori_uscito_DT + 
     1          Q_2d(iii,1)-Q_2d(iii,5)
              V_solido_fuoriuscito_DT = V_solido_fuoriuscito_DT +
     1         (Q_2d(iii,1)-Q_2d(iii,5))*Q_2d(iii,4)
                            
              Q_2d(iii,:) = 0.0
              Q_2d(iii,5) = ele(ic,ir)
              Q_2d(iii,1) = ele(ic,ir)
          endif                  
          
!!!!!!!! Smooting the velocity !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
     !!  
     !!   if(Q_t2d(iii,1)-Q_t2d(iii,5).lt.h_erosione.and.
     !!1    (Q_t2d(iii,1)-Q_t2d(iii,5)).gt.0.0001) then
     !!     U = ((Q_t2d(iii,2)/(Q_t2d(iii,1)-Q_t2d(iii,5)))**2+
     !!1         (Q_t2d(iii,3)/(Q_t2d(iii,1)-Q_t2d(iii,5)))**2)**0.5   
     !!     U_k_min = U
     !!      do ij = 1,8 
     !!       ic_1 = ic+i_sh_col(ij)
     !!       ir_1 = ir+i_sh_row(ij)
     !!   if(celle_routing(ic_1,ir_1).ne.esterno)then
     !!    iii_1 = celle_routing(ic_1,ir_1)
     !!    if((Q_t2d(iii_1,1)-Q_t2d(iii_1,5)).gt.0.0001)then
     !!     U_k =sqrt((Q_t2d(iii_1,2)/(Q_t2d(iii_1,1)-Q_t2d(iii_1,5)))**2+
     !!1              (Q_t2d(iii_1,3)/(Q_t2d(iii_1,1)-Q_t2d(iii_1,5)))**2)
     !!     if(U_k.ne.0)then
     !!         if(U_k_min.eq.0.0)then
     !!             U_k_min = U_k
     !!         elseif(U_k.lt.U_k_min)then
     !!             U_k_min = U_k
     !!         endif
     !!     endif
     !!    endif
     !!
     !!   endif
     !!     enddo
     !!     
     !!     S_k = U_k_min / U
     !!     
     !!     if(S_k.gt.0.and.S_k.lt.1)then
     !!        Q_t2d(iii,2) = S_k * Q_t2d(iii,2)
     !!        Q_t2d(iii,3) = S_k * Q_t2d(iii,3)
     !!     endif
     !!   endif
        
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!          
                  
      
      
      if(Q_2d(iii,1) - Q_2d(iii,5).lt.h_routing)then
          Q_2d(iii,2)=0.0
          Q_2d(iii,3)=0.0
      endif    
              
        if (Q_2d(iii,4).eq.0) then
          Q_2d(iii,4) = 0.0
        endif
      
!      Smooth velocty

      
      if(Q_2d(iii,1)-Q_2d(iii,5).le.0.1)then
      if(abs(Q_2d(iii,2)).gt.0.0.or.abs(Q_2d(iii,3)).gt.0.0) then
      if (ic.eq.2.and.ir.gt.no_rows/2)then
          continue
      endif
        u_i = Q_2d(iii,2)/(Q_2d(iii,1)-Q_2d(iii,5))
        v_i = Q_2d(iii,3)/(Q_2d(iii,1)-Q_2d(iii,5))
        if(abs(u_i).gt.1.or.abs(v_i).gt.1)then
         U_min_i = sqrt(u_i**2+v_i**2)
         if(U_min_i.gt.0)then
          U_min = U_min_i
         else
          U_min = 1
         endif
        
        do j=1,8
            ic_1  = ic + i_sh_col(j)
            ir_1  = ir + i_sh_row(j)
          if(celle_routing(ic_1,ir_1).ne.esterno)then  
            iii_1 = celle_routing(ic_1,ir_1)
          if(Q_2d(iii_1,1)-Q_2d(iii_1,5).gt.h_routing)then
            u = Q_2d(iii_1,2)/(Q_2d(iii_1,1)-Q_2d(iii_1,5))
            v = Q_2d(iii_1,3)/(Q_2d(iii_1,1)-Q_2d(iii_1,5))
            U_min_j= sqrt(u**2+v**2) 
            if(U_min_j.lt.U_min)then
                U_min = U_min_j  
            endif
          endif
          endif
        enddo
        if(U_min .gt. 0)then
        
         Sx = U_min / U_min_i
         
         if (Sx.gt.1)then Sx = 1
          Q_2d(iii,2) = Sx * u_i * (Q_2d(iii,1)-Q_2d(iii,5))
          Q_2d(iii,3) = Sx * v_i * (Q_2d(iii,1)-Q_2d(iii,5))
         end if 
         endif
        endif
        endif
        
      if (Q_2d(iii,2).ne.0) then
      Flux_x(iii,2) = Q_2d(iii,2)**2 / (Q_2d(iii,1) - Q_2d(iii,5)) + 
     1 0.5*(Q_2d(iii,1) - Q_2d(iii,5))**2 * g
      else
       Flux_x(iii,2) = 0.5 * (Q_2d(iii,1) - Q_2d(iii,5))**2 * g
      endif

      if (Q_2d(iii,3).ne.0) then
       Flux_y(iii,3) = Q_2d(iii,3)**2 / (Q_2d(iii,1) - Q_2d(iii,5)) +
     1 0.5 * (Q_2d(iii,1) - Q_2d(iii,5))**2 * g
      else
       Flux_y(iii,3) = 0.5 * (Q_2d(iii,1) - Q_2d(iii,5))**2 * g
      endif

      if (Q_2d(iii,3).eq.0 .or. Q_2d(iii,2).eq.0) then
        Flux_y(iii,2) = 0.0
        Flux_x(iii,3) = 0.0
      else
        Flux_y(iii,2) = Q_2d(iii,2) * Q_2d(iii,3) / 
     1   (Q_2d(iii,1) - Q_2d(iii,5))
        Flux_x(iii,3) = Flux_y(iii,2)
      endif

      if (Q_2d(iii,1) - Q_2d(iii,5).gt.0) then
       Flux_x(iii,4) = Q_2d(iii,4) * Q_2d(iii,2) /
     1  (Q_2d(iii,1) - Q_2d(iii,5))
       Flux_y(iii,4) = Q_2d(iii,4) * Q_2d(iii,3) / 
     1 (Q_2d(iii,1) - Q_2d(iii,5))
      else
       Flux_x(iii,4) = 0.0
       Flux_y(iii,4) = 0.0
      endif
      
      enddo
!$OMP end do
      
!$OMP single
! Calculate the values of Flux_2d_x and Flux_2d_y for specific indices
      Flux_x(:, 1) = Q_2d(:, 2)
      Flux_x(:, 5) = 0.0

      Flux_y(:, 1) = Q_2d(:, 3)
      Flux_y(:, 5) = 0.0

! Calculate celerity values
      u_max = 0
      v_max = 0
      
       if (ii.eq.59)then
          continue
      endif
      
      
      do iii = 1, num_celle_routing_old
       ic = ic_routing(iii)
       ir = ir_routing(iii)
       if (Q_2d(iii,1) - Q_2d(iii,5).gt.0 .and. 
     1      routing_type(iii).ne.2) then
       if(Q_2d(iii,1) - Q_2d(iii,5).gt.hh_max(ic,ir))then   
          hh_max(ic,ir) = Q_2d(iii,1) - Q_2d(iii,5)
       endif
       if(Q_2d(iii,4).gt.Conc_max(ic,ir))then
           Conc_max(ic,ir) = Q_2d(iii,4)
       endif
       if(Q_2d(iii,1).gt.h_tot_max(ic,ir))then
           h_tot_max(ic,ir)=Q_2d(iii,1)
       endif
       
      u = sqrt(Q_2d(iii,2)**2) / (Q_2d(iii,1) - Q_2d(iii,5)) + 
     1     sqrt(g * (Q_2d(iii,1) - Q_2d(iii,5)))
      v = sqrt(Q_2d(iii,3)**2) / (Q_2d(iii,1) - Q_2d(iii,5)) + 
     1     sqrt(g * (Q_2d(iii,1) - Q_2d(iii,5)))

        if (u .gt. u_max) then
         u_max = u
         ind_Qx_max = (/ic, ir/)
        endif

        if (v .gt. v_max) then
         v_max = v
         ind_Qy_max = (/ic, ir/)
        endif
      endif
      if(Q_2d(iii,5)-ele(ic,ir).gt.10.or.Q_2d(iii,5)-ele(ic,ir).lt.-10)
     1  then
c        write(1299,*) "cella2",ii,t,iii,ic,ir,Q_2d(iii,5)-ele(ic,ir)
        endif
      
      
      end do


! Store maximum celerity values in c_max
     
      cel_max = (/ u_max, v_max /)
      
      if (isnan(cel_max(1))) then
       cel_max(1) = cel_max(2)
      endif
      
      if (isnan(cel_max(2))) then
       cel_max(2) = cel_max(1)
      endif
      
      if(cel_max(1).gt.50)then
       cel_max(1)=50
      endif
      if(cel_max(2).gt.50)then
       cel_max(2)=50
      endif
! Calculate time steps Dt_y and Dt_x based on CFL condition
      if(cel_max(2).gt.0.0)then
          Dt_y = Courant * Dy / cel_max(2)
      else
          Dt_y = 0.5
      endif
      
      if(cel_max(1).gt.0.0)then
          Dt_x = Courant * Dx / cel_max(1)
      else
          Dt_x = 0.5
      endif
      
      if (isnan(Dt_y)) then
        Dt_y = 0.0
      endif

      if (isnan(Dt_x)) then
        Dt_x = 0.0
      endif

      if (Dt_y < 0.001) then
        Dt_y = 0.05
      endif

      if (Dt_x < 0.001) then
        Dt_x = 0.05
      endif

      Dt = min(Dt_x, Dt_y)

      if (isnan(Dt)) then
        Dt = 0.5
      endif

       if (Dt > 0.5) then
          Dt = 0.5
       endif

      if (Dt < 0.001) then
        Dt = 0.001
      endif

      t_dopo = t + Dt

      
c      profondita' istante successivo
       


********************************************************************************
*point 10.0  INSERIMENTO CALCOLO SFORZI SPINTE 27 APRILE 2015
********************************************************************************

        if (N_strutture.ge.1) then
         
         call Calcolo_SforzoFondo   !  SPOSTATO DAL BASSO IL 24/9/2015
         
        endif




          ! aggiunto il 2/3/2015
!$OMP end single nowait    
       
!$OMP single
       if(ii.eq.1)then 
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
           
           n_celle_sol  = 0
       
	       
                
      do iii = 1, Num_celle_routing_old
          
              ic = ic_routing(iii)
              ir = ir_routing(iii)
              
              
           if(Q_2d(iii,1)-Q_2d(iii,5).gt.zero)then        
            
!$OMP Critical           
           write(1000001,'(i10,f15.6)') cella_bacino(ic,ir),
     1       Q_2d(iii,1)-Q_2d(iii,5)
           write(1000002,'(f15.6)')     Q_2d(iii,1)
           write(1000005,'(2f15.6)')Q_2d(iii,2)/(Q_2d(iii,1)-
     1  Q_2d(iii,5)),Q_2d(iii,3)/(Q_2d(iii,1)-Q_2d(iii,5))
           write(1000006,'(f15.6)')     Q_2d(iii,4)
            
           if (control_eros.eq.1.0) then
            write(1000003,'(f15.6)') Q_2d(iii,5)-ele(ic,ir)
           endif 

           n_celle_sol_1 = n_celle_sol_1 + 1
           if(celle_wet(ic,ir).eq.0)then
               celle_wet(ic,ir)=1
               N_celle_wet = N_celle_wet + 1
           endif
!$OMP end critical  
           endif
      end do
      N_celle_sol(1) = N_celle_sol_1
      N_celle_sol_1 = 0.0
      endif
!$OMP end single      
        
        
       if(N_file_output.gt.0)then
       if (t_dopo.ge.t_file(i_file).and.flag(i_file).eq.0.0) then
!$OMP single !#6
       i_file_1 = i_file
       
       tempo_file(i_file) = t_dopo
       
	 i_cont_file = i_cont_file + 1     
       
      tempo_scrittura2 = 1.0    ! aggiunto il 2/3/2015

       ijij = 5000 + i_cont_file - 1
       
       j_TS = j_TS + 1   ! aggiunta 31/10/2013
       if(t_file(i_file).ge.2100)then
          continue
       endif
       
!$OMP end single nowait
       
!$OMP single 
      write(1000001,'("TS",3x,f15.1)')  t_dopo
      write(1000002,'("TS",3x,f15.1)')  t_dopo
      write(1000005,'("TS",3x,f15.1)')  t_dopo
      write(1000006,'("TS",3x,f15.1)')  t_dopo 
      if (control_eros.eq.1.0) then
        write(1000003,'("TS",3x,f15.1)')  t_dopo
      endif
!$OMP end single nowait
      
*point 14.0 scrittura risultati i
!$OMP single private (file_name,retint,fileHeader,num_open)
!$OMP& private(i,j)
!$OMP& firstprivate(i_file)
c filename_flowdepth(i_file)
      h(:,:) = esterno
      do iii = 1, num_celle_routing
          ic = ic_routing(iii)
          ir = ir_routing(iii)
          h(ic,ir) = Q_2d(iii,1)-Q_2d(iii,5)
      enddo    
      num_open = 95000
              
        file_name = filename_flowdepth(i_file) 
        open(num_open,file=file_name,form='BINARY',mode='write')
        
        retint = scan (file_name,'.')
      if (retint > 1) then
      fileHeader = file_name(1:retint-1)//'.hdr'
      if (fileHeader /= fileFormat) call HdrWrite1 (fileHeader,num_open)
      endif
	  do j = 1, no_rows
          write (num_open)  (h(i,j),i=1,no_columns)
        enddo  
	close(num_open)
c filename_erosiondepth(i_file)
!$OMP end single  nowait   

!$OMP single private (file_name,retint,fileHeader,num_open)
!$OMP& private(i,j)
!$OMP& firstprivate(i_file)
      Eros_tot(:,:) = esterno
      do iii = 1, num_celle_routing
          ic = ic_routing(iii)
          ir = ir_routing(iii)
          Eros_tot(ic,ir) = Q_2d(iii,5)-ele(ic,ir)
      enddo    
      num_open =97000
      
        file_name = filename_erosiondepth(i_file)
        open(num_open,file=file_name,form='BINARY',mode='write')
        
        retint = scan (file_name,'.')
      if (retint > 1) then
      fileHeader = file_name(1:retint-1)//'.hdr'
      if (fileHeader /= fileFormat) call HdrWrite1 (fileHeader,num_open)
      endif
	
	do j = 1, no_rows
	     write (num_open) (Eros_tot(i,j),i=1,no_columns)
	enddo  	
      close(num_open)
c filename_Vx(i_file)	
!$OMP end single   nowait  
         
!$OMP single private (file_name,retint,fileHeader,num_open)
!$OMP& private(i,j)
!$OMP& firstprivate(i_file)
      Vx(:,:) = esterno
      do iii = 1, num_celle_routing
          ic = ic_routing(iii)
          ir = ir_routing(iii)
          if((Q_2d(iii,1)-Q_2d(iii,5)).gt.0.0)then
          Vx(ic,ir) = Q_2d(iii,2)/(Q_2d(iii,1)-Q_2d(iii,5))
          else
          Vx(ic,ir) = 0.0
          endif
      enddo 
      num_open = 98000
        
        file_name = filename_Vx(i_file)
        open(num_open,file=file_name,form='BINARY',mode='write')
        
        retint = scan (file_name,'.')
      if (retint > 1) then
      fileHeader = file_name(1:retint-1)//'.hdr'
      if (fileHeader /= fileFormat) call HdrWrite1 (fileHeader,num_open)
      endif
	do j = 1, no_rows
		  write (num_open) (Vx(i,j),i=1,no_columns)
	enddo
	       
      close(num_open)
c filename_Vy(i_file)
!$OMP end single  nowait 


      
!$OMP single private (file_name,retint,fileHeader,num_open)
!$OMP& private(i,j)
!$OMP& firstprivate(i_file)
      Vy(:,:) = esterno
      do iii = 1, num_celle_routing
          ic = ic_routing(iii)
          ir = ir_routing(iii)
          if((Q_2d(iii,1)-Q_2d(iii,5)).gt.0.0)then
          Vy(ic,ir) = Q_2d(iii,3)/(Q_2d(iii,1)-Q_2d(iii,5))
          else
          Vy(ic,ir) = 0.0
          endif
      enddo 
      
      num_open = 99000
      	  
	  file_name = filename_Vy(i_file)
        open(num_open,file=file_name,form='BINARY',mode='write')
        
        retint = scan (file_name,'.')
      if (retint > 1) then
      fileHeader = file_name(1:retint-1)//'.hdr'
      if (fileHeader /= fileFormat) call HdrWrite1 (fileHeader,num_open)
      endif
	 do j = 1, no_rows
	     write (num_open) (Vy(i,j),i=1,no_columns)
	enddo      
      close(num_open)
c filename_VelCella(i_file)	    
!$OMP end single  nowait 
 
!$OMP single private (file_name,retint,fileHeader,num_open)
!$OMP& private(i,j)
!$OMP& firstprivate(i_file)
      Vel_Cella(:,:) = esterno
      do iii = 1, num_celle_routing
          ic = ic_routing(iii)
          ir = ir_routing(iii)
          if((Q_2d(iii,1)-Q_2d(iii,5)).gt.0.0)then
           Vel_Cella(ic,ir) = sqrt(
     1     (Q_2d(iii,3)/(Q_2d(iii,1)-Q_2d(iii,5)))**2+
     2     (Q_2d(iii,2)/(Q_2d(iii,1)-Q_2d(iii,5)))**2)
          else
          Vel_Cella(ic,ir) = 0.0
          endif

      enddo
      num_open = 198000
      
        file_name = filename_VelCella(i_file)
        open(num_open,file=file_name,form='BINARY',mode='write')
        
        retint = scan (file_name,'.')
      if (retint > 1) then
      fileHeader = file_name(1:retint-1)//'.hdr'
      if (fileHeader /= fileFormat) call HdrWrite1 (fileHeader,num_open)
      endif
  	do j = 1, no_rows
	     write (num_open) (Vel_Cella(i,j),i=1,no_columns)
	enddo
      close(num_open)
***************************************************************
*  parte tolta per diminuire dimensione output 28/02/2015
****************************************************************
 
c filename_conc(i_file)        
!$OMP end single  nowait   

!$OMP single private (file_name,retint,fileHeader,num_open)
!$OMP& private(i,j)
!$OMP& firstprivate(i_file)
      Conc(:,:) = esterno
      do iii = 1, num_celle_routing
          ic = ic_routing(iii)
          ir = ir_routing(iii)
          Conc(ic,ir) = Q_2d(iii,4)
          if (Conc(ic,ir).lt.0) then
              continue
          endif
      enddo 
 
       num_open = 199500
      	  
	  file_name = filename_conc(i_file)
        open(num_open,file=file_name,form='BINARY',mode='write')
        
        retint = scan (file_name,'.')
      if (retint > 1) then
      fileHeader = file_name(1:retint-1)//'.hdr'
      if (fileHeader /= fileFormat) call HdrWrite1 (fileHeader,num_open)
      endif
	  do j = 1, no_rows
	     write (num_open) (conc(i,j),i=1,no_columns)
	enddo       
      close(num_open)
c filename_direz_vel_uscente(i_file)
!$OMP end single  nowait    
!$OMP single private (file_name,retint,fileHeader,num_open)
!$OMP& private(i,j)
!$OMP& firstprivate(i_file)
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
!$OMP end single nowait     
      
!$OMP do private(i_celle2,ic,ir)
!$OMP& firstprivate (i_file_1)

      do iii = 1, Num_celle_routing_old
          
              ic = ic_routing(iii)
              ir = ir_routing(iii)
           if(Q_2d(iii,1)-Q_2d(iii,5).gt.0.0)then               
!$OMP Critical           
           write(1000001,'(i10,f15.6)') cella_bacino(ic,ir),
     1       Q_2d(iii,1)-Q_2d(iii,5)
           write(1000002,'(f15.6)')     Q_2d(iii,1)
           write(1000005,'(2f15.6)') Q_2d(iii,2)/(Q_2d(iii,1)-
     1  Q_2d(iii,5)),Q_2d(iii,3)/(Q_2d(iii,1)-Q_2d(iii,5))
           write(1000006,'(f15.6)')     Q_2d(iii,4)
            
           if (control_eros.eq.1.0) then
            write(1000003,'(f15.6)') Q_2d(iii,5)-ele(ic,ir)
           endif 

           n_celle_sol_1 = n_celle_sol_1 + 1
           if(celle_wet(ic,ir).eq.0)then
               celle_wet(ic,ir)=1
               N_celle_wet = N_celle_wet + 1
           endif
!$OMP end critical        
           endif
      end do
!$OMP end do nowait
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
      end if
  


	

*********************************  SCRITTURA SUPERFICI AREE ALLUVIONATE  MARZO 2010
    

!$OMP single !#8     
	if (tempo_scrittura2.eq.1.0) then
       V_fuori_uscito_totale = V_fuori_uscito_totale + V_fuori_uscito_DT
       
       V_solido_fuori_uscito_totale = V_solido_fuori_uscito_totale +
     1  V_solido_fuoriuscito_DT
       
       V_netto = V_entrato - V_fuori_uscito_totale + V_eros
       
       write(10,'(" input total and solid volumes (m3)",10x,2f20.5)') 
     1V_entrato, V_solid_input
      i_entrato = i_entrato + 1
      VolumeEntrato(i_entrato) = V_entrato
      VolumeSolidoEntrato(i_entrato) = V_solid_input
	write(10,'(" input total and solid volumes this step (m3)",2f20.5)')
     1 V_entrato_DT, V_solid_input_DT
	
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
      END IF
!$OMP END SINGLE
!$omp SINGLE
	if (tempo_scrittura2.eq.1.0) then	  
	write(30,'(" input total and solid volumes (m3)",10x,2f20.5)') 
     1V_entrato, V_solid_input
	write(30,'(" input total and solid volumes this step (m3)",2f20.5)')
     1 V_entrato_DT, V_solid_input_DT
	
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

	write(24,'(6f15.3)') ttttt, V_entrato, V_fuori_uscito_totale,  
	1V_total, V_depositato, V_eroso
	
	write(210001,*) ttttt, Cmedio      ! aggiunto il 2 Aprile 2013

	 endif
!$OMP end single nowait      
      if (Intern_Output.eq.1.0) then
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
    !   if (i_file.eq.20.and.jj.eq.2) write(10,'("t_dopo",f10.4)') t_dopo 

        celle_attive_sez = 0

        do iijj = 1, N_celle_sez_intern(jj)
        ic=ic_intern(iijj,jj)
        ir=ir_intern(iijj,jj)
       if(celle_routing(ic,ir).ne.esterno)then     
         iii=celle_routing(ic,ir)
         
      if (Q_2d(iii,1)-Q_2d(iii,5).gt.h_routing) then  ! modificata 14/11/2017

      if(Q_2d(iii,2).ne.0.or.Q_2d(iii,3).ne.0)then 
        call U_direction(iii,Uxy,dir_U)
       ic_1=ic+i_sh_col(dir_U)
       ir_1=ir+i_sh_row(dir_U)
      if(celle_routing(ic_1,ir_1).ne.esterno.and.
     1  InternalOutputValle(ic_1,ir_1).eq.999.0)then
          
        Q_mod = sqrt(Q_2d(iii,2)**2+Q_2d(iii,3)**2)
        Q_uscita(jj) = Q_uscita(jj)+Q_mod*Dx  
        Q_uscita_solido(jj)=Q_uscita_solido(jj)+Q_mod*Dx*Q_2d(iii,4)  
        
      else
        if(dir_U.eq.2.or.dir_U.eq.4.or.dir_U.eq.6.or.dir_U.eq.8)then   
         ic_x=ic+i_sh_col(dir_U_nan(1,dir_U))
         ir_x=ir+i_sh_row(dir_U_nan(1,dir_U))
          if(celle_routing(ic_x,ir_x).ne.esterno.and.
     1  InternalOutputValle(ic_x,ir_x).eq.999.0)then
          Q_uscita(jj) = Q_uscita(jj) + abs(Q_2d(iii,2))
          Q_uscita_solido(jj)=Q_uscita_solido(jj)+abs(Q_2d(iii,2))*Dx*
     1    Q_2d(iii,4)
      endif
          ic_y=ic+i_sh_col(dir_U_nan(2,dir_U))
          ir_y=ir+i_sh_row(dir_U_nan(2,dir_U)) 
          if(celle_routing(ic_y,ir_y).ne.esterno.and.
     1  InternalOutputValle(ic_y,ir_y).eq.999.0)then
          Q_uscita(jj) = Q_uscita(jj) + abs(Q_2d(iii,3))
          Q_uscita_solido(jj)=Q_uscita_solido(jj)+abs(Q_2d(iii,3))*Dx*
     1    Q_2d(iii,4)
      endif
        else 
        if(dir_U.eq.3.or.dir_U.eq.7)then
          ic_y=ic+i_sh_col(dir_U_nan(2,dir_U))
          ir_y=ir+i_sh_row(dir_U_nan(2,dir_U) )
          if(celle_routing(ic_y,ir_y).ne.esterno.and.
     1 InternalOutputValle(ic_y,ir_y).eq.999.0.and.Q_2d(iii,3).gt.0)then
          Q_uscita(jj) = Q_uscita(jj) + abs(Q_2d(iii,3))
          Q_uscita_solido(jj)=Q_uscita_solido(jj)+abs(Q_2d(iii,3))*Dx*
     1    Q_2d(iii,4)
          endif
      
          ic_y=ic+i_sh_col(dir_U_nan(4,dir_U))
          ir_y=ir+i_sh_row(dir_U_nan(4,dir_U) )
          if(celle_routing(ic_y,ir_y).ne.esterno.and.
     1 InternalOutputValle(ic_y,ir_y).eq.999.0.and.Q_2d(iii,3).lt.0)then
          Q_uscita(jj) = Q_uscita(jj) + abs(Q_2d(iii,3))
          Q_uscita_solido(jj)=Q_uscita_solido(jj)+abs(Q_2d(iii,3))*Dx*
     1    Q_2d(iii,4)
            
           endif 
        else
          ic_x=ic+i_sh_col(dir_U_nan(1,dir_U))
          ir_x=ir+i_sh_row(dir_U_nan(1,dir_U)) 
          if(celle_routing(ic_x,ir_x).ne.esterno.and.
     1InternalOutputValle(ic_x,ir_x).eq.999.0.and.Q_2d(iii,2).gt.0)then
          Q_uscita(jj) = Q_uscita(jj) + abs(Q_2d(iii,2))
          Q_uscita_solido(jj)=Q_uscita_solido(jj)+abs(Q_2d(iii,2))*Dx*
     1    Q_2d(iii,4)
      endif 
         ic_x=ic+i_sh_col(dir_U_nan(3,dir_U))
         ir_x=ir+i_sh_row(dir_U_nan(3,dir_U)) 
          if(celle_routing(ic_x,ir_x).ne.esterno.and.
     1InternalOutputValle(ic_x,ir_x).eq.999.0.and.Q_2d(iii,2).lt.0)then
          Q_uscita(jj) = Q_uscita(jj) + abs(Q_2d(iii,2))
          Q_uscita_solido(jj)=Q_uscita_solido(jj)+abs(Q_2d(iii,2))*Dx*
     1    Q_2d(iii,4)
         endif
            endif
            
      endif 
      
    
      endif   
          
          
      volume_sez(jj) = volume_sez(jj) + 
     1Q_2d(iii,1)-Q_2d(iii,5)

       Averaged_conc(jj) = Averaged_conc(jj) + 
     1Q_2d(iii,4)

        celle_attive_sez = celle_attive_sez + 1.0

       endif
      endif
       endif
       
      enddo

      
      if (celle_attive_sez.gt.0.0) then
      Averaged_flow_depth(jj) = volume_sez(jj)/celle_attive_sez   ! 14/11/2017
      Averaged_conc(jj) = Averaged_conc(jj)/celle_attive_sez   ! 5/11/2017
      else
       Averaged_flow_depth(jj) = 0.0   ! 14/11/2017
      Averaged_conc(jj) = 0.0   ! 5/11/2017
       endif

     


       enddo
!$OMP end do
      if (i_file_out.le.N_internal_DT) then
          
        if (t_dopo.ge.tempi_output(i_file_out).and.flag_int(i_file_out)
     1.eq.0.0) then  
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
              
              Vx_media_sez_int(jj)=0.0
              Vy_media_sez_int(jj)=0.0
              
              celle_attive = 0.0
              celle_ele_variata = 0.0    ! 21/7/2017
                
   !   if (i_file.eq.20.and.jj.eq.2) write(10,'("t_dopo2",f10.4)') t_dopo 

        do iijj = 1, N_celle_sez_intern(jj)
              
             
    ! !  if (h_pre(ic_intern(iijj,jj),ir_intern(iijj,jj)).gt.0.0) then   ! tolto il 14/11/2017
        ic=ic_intern(iijj,jj)
        ir=ir_intern(iijj,jj)
       if(celle_routing(ic,ir).ne.esterno)then     
         iii=celle_routing(ic,ir)
         
      if (Q_2d(iii,1)-Q_2d(iii,5).gt.h_routing) then  ! modificata 14/11/2017

      if(Q_2d(iii,2).ne.0.or.Q_2d(iii,3).ne.0)then 
        call U_direction(iii,U,dir_U)
       ic_1=ic+i_sh_col(dir_U)
       ir_1=ir+i_sh_row(dir_U)
       
             if(celle_routing(ic_1,ir_1).ne.esterno.and.
     1  InternalOutputValle(ic_1,ir_1).eq.999.0)then
          
        Q_mod = sqrt(Q_2d(iii,2)**2+Q_2d(iii,3)**2)
        Q_uscita_sez_interne(jj) =  Q_uscita_sez_interne(jj)+Q_mod*Dx  
        Q_uscita_solido_sez_interne(jj)=Q_uscita_solido_sez_interne(jj)+
     1   Q_mod*Dx*Q_2d(iii,4)  
        
      else
     !!   if(dir_U.eq.2.or.dir_U.eq.4.or.dir_U.eq.6.or.dir_U.eq.8)then   
     !!    ic_x=ic+i_sh_col(dir_U_nan(1,dir_U))
     !!    ir_x=ir+i_sh_row(dir_U_nan(1,dir_U))
     !!     if(celle_routing(ic_x,ir_x).ne.esterno.and.
     !!1  InternalOutputValle(ic_x,ir_x).eq.999.0)then
     !!   Q_uscita_sez_interne(jj) = Q_uscita_sez_interne(jj) + 
     !!1   abs(Q_2d(iii,2))
     !!   Q_uscita_solido_sez_interne(jj)=Q_uscita_solido_sez_interne(jj)+
     !!1abs(Q_2d(iii,2))*Dx*Q_2d(iii,4)
     !! endif
     !!     ic_y=ic+i_sh_col(dir_U_nan(2,dir_U))
     !!     ir_y=ir+i_sh_row(dir_U_nan(2,dir_U)) 
     !!     if(celle_routing(ic_y,ir_y).ne.esterno.and.
     !!1  InternalOutputValle(ic_y,ir_y).eq.999.0)then
     !!  Q_uscita_sez_interne(jj) = Q_uscita_sez_interne(jj) + 
     !!1     abs(Q_2d(iii,3))
     !!  Q_uscita_solido_sez_interne(jj)=Q_uscita_solido_sez_interne(jj)+
     !!1abs(Q_2d(iii,3))*Dx*Q_2d(iii,4)
     !! endif
     !!   else 
     !!   if(dir_U.eq.3.or.dir_U.eq.7)then
     !!     ic_y=ic+i_sh_col(dir_U_nan(2,dir_U))
     !!     ir_y=ir+i_sh_row(dir_U_nan(2,dir_U) )
     !!     if(celle_routing(ic_y,ir_y).ne.esterno.and.
     !!1 InternalOutputValle(ic_y,ir_y).eq.999.0.and.Q_2d(iii,3).gt.0)then
     !!  Q_uscita_sez_interne(jj) = Q_uscita_sez_interne(jj) + 
     !!1    abs(Q_2d(iii,3))
     !!  Q_uscita_solido_sez_interne(jj)=Q_uscita_solido_sez_interne(jj)+
     !!1  abs(Q_2d(iii,3))*Dx*Q_2d(iii,4)
     !!     endif
     !! 
     !!     ic_y=ic+i_sh_col(dir_U_nan(4,dir_U))
     !!     ir_y=ir+i_sh_row(dir_U_nan(4,dir_U) )
     !!     if(celle_routing(ic_y,ir_y).ne.esterno.and.
     !!1 InternalOutputValle(ic_y,ir_y).eq.999.0.and.Q_2d(iii,3).lt.0)then
     !!  Q_uscita_sez_interne(jj) = Q_uscita_sez_interne(jj) + 
     !!1  abs(Q_2d(iii,3))
     !! Q_uscita_solido_sez_interne(jj)=Q_uscita_solido_sez_interne(jj)
     !!1    +abs(Q_2d(iii,3))*Dx*Q_2d(iii,4)
     !!       
     !!      endif 
     !!   else
     !!     ic_x=ic+i_sh_col(dir_U_nan(1,dir_U))
     !!     ir_x=ir+i_sh_row(dir_U_nan(1,dir_U)) 
     !!     if(celle_routing(ic_x,ir_x).ne.esterno.and.
     !!1InternalOutputValle(ic_x,ir_x).eq.999.0.and.Q_2d(iii,2).gt.0)then
     !! Q_uscita_sez_interne(jj) = Q_uscita_sez_interne(jj) + 
     !!1 abs(Q_2d(iii,2))
     !! Q_uscita_solido_sez_interne(jj)=Q_uscita_solido_sez_interne(jj)+
     !!1  abs(Q_2d(iii,2))*Dx*Q_2d(iii,4)
     !! endif 
     !!    ic_x=ic+i_sh_col(dir_U_nan(3,dir_U))
     !!    ir_x=ir+i_sh_row(dir_U_nan(3,dir_U)) 
     !!     if(celle_routing(ic_x,ir_x).ne.esterno.and.
     !!1InternalOutputValle(ic_x,ir_x).eq.999.0.and.Q_2d(iii,2).lt.0)then
     !! Q_uscita_sez_interne(jj) = Q_uscita_sez_interne(jj) + 
     !!1 abs(Q_2d(iii,2))
     !!  Q_uscita_solido_sez_interne(jj)=Q_uscita_solido_sez_interne(jj)+
     !!1  abs(Q_2d(iii,2))*Dx*Q_2d(iii,4)
     !!    endif
     !!       endif
     !!       
     !! endif 
      
    
      endif   
       
       
       
     !!!  if(celle_routing(ic_1,ir_1).ne.esterno)then
     !!!   if(InternalOutputValle(ic_1,ir_1).eq.999.0)then   
     !!!    
     !!! Q_uscita_sez_interne(jj) =Q_uscita_sez_interne(jj)+Q_2d(iii,2)*Dx
     !!! Q_uscita_solido_sez_interne(jj) = Q_uscita_solido_sez_interne(jj)+
     !!!1+Q_2d(iii,2)*Dx*Q_2d(iii,4)
     !!! 
     !!! 
     !!!   endif !downstream cell 999
     !!!  endif    !celle_routing(ic_1,ir_1).ne.0.0
      endif   !Q_2d(iii,2).ne.0.or.Q_2d(iii,3).ne.0.
      
      FreeSurf_interne_medio(jj) = FreeSurf_interne_medio(jj) + 
     1 Q_2d(iii,1)

       Flow_depth_interne_medio(jj) = Flow_depth_interne_medio(jj) +   ! 21/7/2017 
     1 Q_2d(iii,1)-Q_2d(iii,5) 
        
      spessore_interne_medio(jj) = spessore_interne_medio(jj) +   ! 21/9/2017 
     1 Q_2d(iii,1)-ele(ic,ir)
             
      Conc_sezioni_interne(jj) = conc_sezioni_interne(jj) +
     1 Q_2d(iii,4)
     
      Vx_media_sez_int(jj) = Vx_media_sez_int(jj) +
     1 Q_2d(iii,2)/(Q_2d(iii,1)-Q_2d(iii,5))
      
      Vy_media_sez_int(jj) = Vy_media_sez_int(jj) +
     1 Q_2d(iii,3)/(Q_2d(iii,1)-Q_2d(iii,5))
      
       celle_attive = celle_attive + 1.0
       
       endif !Q_2d(iii,1)-Q_2d(iii,5).gt.h_routing
     

       if (Q_2d(iii,5)-ele(ic,ir).ne.0.0) then   ! 21/7/2017 
                 
       ele_iniz_interno_medio(jj) = ele_iniz_interno_medio(jj) +     ! 21/7/2017 
     1 ele(ic,ir)
          
        ele_interno_medio(jj) = ele_interno_medio(jj) + 
     1 Q_2d(iii,5)         !  21/07/2017

       celle_ele_variata = celle_ele_variata + 1.0   ! 21/7/2017

       endif   ! 21/7/2017 Q_2d(iii,5)-ele(ic,ir).ne.0.0
      endif         !celle_routing(ic,ir).ne.0.0
        enddo   ! fine ciclo celle interne
        
         if (celle_attive.gt.0.0) then
            
      Conc_sezioni_interne(jj) = Conc_sezioni_interne(jj)/celle_attive
      
      !ele_interno_medio(jj) = ele_interno_medio(jj)/celle_attive     !  21/7/2017
      
      FreeSurf_interne_medio(jj)=FreeSurf_interne_medio(jj)/celle_attive   

      Flow_depth_interne_medio(jj) = Flow_depth_interne_medio(jj)/     ! 21/7/2017 
     1celle_attive
      
      Vx_media_sez_int(jj) = Vx_media_sez_int(jj)/celle_attive
      Vy_media_sez_int(jj) = Vy_media_sez_int(jj)/celle_attive
      
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
         
      Vx_media_sez(jj) = Vx_media_sez(jj)+ Vx_media_sez_int(jj)*Dt
      Vy_media_sez(jj) = Vy_media_sez(jj)+ Vy_media_sez_int(jj)*Dt

 
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
      !if (T_intervallo.gt.10.0) then   !! MODIFICA DEL 19/8/2015 !  modificato da 5 secondi ad 1 il 30/4/2015
       if (T_intervallo.gt.10.0.or.T_intervallo.ge.DT_Internal_Output) 
     1then   ! MODIFICA DEL 21/9/2015
     
!$OMP do private(jj,i_file77)       
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
             
             Vx_media(jj) = 0.0
             Vy_media(jj) = 0.0
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
      
      Vx_media(jj)=Vx_media_sez(jj)/T_intervallo_calcolo(jj)
      Vy_media(jj)=Vy_media_sez(jj)/T_intervallo_calcolo(jj)
        endif

         if (T_intervallo_calcoloELE(jj).le.0.0) then    ! 21/7/2017 
	  	   
              ele_interno_medio(jj) = 0.0
              ele_iniz_interno_medio(jj) = 0.0     ! 21/7/2017 
              
          else
                   
      ele_interno_medio(jj) = Ele_medio(jj)/T_intervallo_calcoloELE(jj)
     
      ele_iniz_interno_medio(jj) = Ele_iniz_medio(jj)/
     1T_intervallo_calcoloELE(jj)     ! 21/7/2017 

   !   write(10,*) jj, Ele_medio(jj), T_intervallo_calcoloELE(jj), 
   !  1ele_interno_medio(jj)
      
   !   write(10,*) jj, Eros_tot_medio(jj), T_intervallo_calcoloELE(jj), 
   !  1Eros_tot_interne_medio(jj)
   !    write(10,*)
      
        endif   ! 21/7/2017 
              
		i_file77 = 115000 + jj - 1

        write(i_file77,'(F10.3,3x,f15.3,1x,f15.3,1X,F15.3,1X,
     1F10.3,1x,f10.3,f10.3,1x,f14.6,1x,f14.6,1X,f14.6,1x,f14.6,1X)')  
     1t_dopo, FreeSurf_sez(jj), ele_interno_medio(jj), 
     1ele_iniz_interno_medio(jj), Flow_depth_sez(jj), spessore_sez(jj), 
     1Conc_sez(jj), Q_uscita_sez(jj), Q_uscita_solido_sez(jj),
     1Vx_media(jj),Vy_media(jj)   

***********************************************************************
*   MODIFICATO OTTOBRE 2019  - FINE
***********************************************************************
     
      Conc_med(jj) = 0.0
      Ele_medio(jj) = 0.0
      FRSURF_medio(jj) = 0.0
      Q_int_medio(jj) = 0.0
      Flow_depth_medio(jj) = 0.0    ! 21/7/2017
      Ele_iniz_medio(jj) = 0.0   ! 21/7/2017
      T_intervallo_calcolo(jj) = 0.0
      T_intervallo_calcoloELE(jj) = 0.0  ! 21/07/2017

       spessore_medio(jj) = 0.0    ! 21/7/2017
      
       Vx_media_sez(jj) = 0.0
       Vy_media_sez(jj) = 0.0

      ! aggiunto il 11/7/2017
      Q_uscita_medio(jj) = 0.0
      Q_uscita_solido_medio(jj) = 0.0
      Q_uscita_sez_medio(jj) = 0.0
      Q_uscita_solido_sez_medio(jj) = 0.0
      
        enddo
!$OMP end do nowait
!$OMP single
       i_DQ = 0.0
         
       write(10,*)
     
    !  write(*,'("tempo output (sec)",1x,f12.3)') time
      flag_int(i_file_out) = 1.0
      i_file_out = i_file_out + 1

    !  if (t(ii+1).eq.tempo_finale)  flag_int_tempo_finale = 1.0
      
      if (t_dopo.eq.tempo_finale)  flag_int_tempo_finale = 1.0     !  14/01/2013
!$OMP END single	       
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
!$OMP single
   	if (tempo_scrittura2.eq.1.0)then
          if (flag(N_file_output).eq.1)then
            N_celle_sol(N_file_output+1)= N_celle_sol_1
              
          else  
            N_celle_sol(i_file) = N_celle_sol_1
            
          endif
          n_celle_sol_1 = 0
           
 
      write(30,'(" time step and simulation time (seconds)",1x,f12.5,2x,
     1f25.5)')DT, t_dopo

	write(30,*)


	
          tempo_scrittura2 = 0 
	write(10,'("  solid eroded, deposited and trapped volumes (m^3) at
     1 this step",12x,3f20.5)') 
	1Volume_solido_eroso_step, Volume_solido_depositato_step, 
	1 volume_solido_intrappolato_STEP 
	write(10,*)


       endif  
      

      
!$OMP end single nowait
*****************************************************************
*              AZZERAMENTO VARIABILI EROSIONE/DEPOSITO
*****************************************************************

!$OMP single 
	t_prima = t   !   15/01/2013
	t = t_dopo
!$OMP end single nowait      
!$OMP single
      V_eros_step = 0.0
	V_dep_step = 0.0

	V_eros_step_A = 0.0
	V_dep_step_A = 0.0

	V_eros_step_B = 0.0
	V_dep_step_B = 0.0
	V_dep_step_C = 0.0
	
	V_eroso_prima = V_eroso
	V_depositato_prima = V_depositato
	
	Volume_solido_depositato_prima = Volume_solido_depositato
	Volume_solido_eroso_prima = Volume_solido_eroso

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
        ii = ii +1
!$OMP end single nowait
!$OMP single
        V_entrato_DT = 0.0
        V_solid_input_DT = 0.0
        V_entrato_DT_1 = 0.0
        V_solid_input_DT_1 = 0.0
        ero_tot=0.0
        ero_tot_solid=0.0
!$OMP end single nowait
!$OMP single
        VOLUME_ENTRATO_IDRO = 0.0
	  VOLSOL_ENTRATO_IDRO = 0.0
        VOLUME_ENTRATO_IDRO_1 = 0.0
	  VOLSOL_ENTRATO_IDRO_1 = 0.0
!$OMP end single nowait
!$OMP single
        VOLUME_ENTRATO_IDROGRAMMI = 0.0
        VOLsol_ENTRATO_IDROGRAMMI = 0.0
        Vaffluito_1 = 0.0
        Vaffluito_2 = 0.0
        sen_tetatot = 0.0
!$OMP end single nowait
!$OMP single
        cel_max = 0.0
        cel_max_sor = 0.0
        cel = 0.0
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




      end do   ! chiusura ciclo

!$OMP end parallel 

c     fine ciclo do while t

      
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
	WRITE(10,*)'vol_grav,bel,int', vol_grav,vol_bel,vol_int
      
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
      i_file = N_file_output
      
!$OMP parallel num_threads(CPUs)
!$OMP do private(j,jj)
!$OMP& reduction(+: h_totale, h_totale_routing,total_eros)
!$OMP& reduction(+: total_solid)
!$OMP& schedule(monotonic: dynamic)
      do j = 1,no_rows
	 do jj = 1, no_columns
         Area_dep_eros_ultimo_step(jj,j) = esterno
         
	   if (ele(jj,j).ne.esterno) then
          if(celle_routing(jj,j).ne.esterno)then
            iii = celle_routing(jj,j)
            
	    ele(jj,j) = Q_2d(iii,5)
          Eros_tot(jj,j) = Q_2d(iii,5)-ele_iniz(jj,j)
          h(jj,j) = Q_2d(iii,1)-Q_2d(iii,5)
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
          else
           Eros_tot(jj,j)=0.0
           h(jj,j)=0.0
            
         endif
         if (Eros_tot(jj,j).ne.esterno) then

	     total_eros = total_eros + Eros_tot(jj,j)
	     total_solid = total_solid + C_fondo(jj,j)*Eros_tot(jj,j)

	   endif
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
      
      
!$OMP single private(i_celle2,ic,ir)

      write(1000001,'("TS",3x,f15.2)') t_dopo + 0.01  
      do i_celle2 = 1, Num_celle_routing_old
          
              ic = ic_routing(i_celle2)
              ir = ir_routing(i_celle2)
                    
          if(h(ic,ir).gt.zero)then
           n_celle_sol(i_file+2) = n_celle_sol(i_file+2) + 1
           write(1000001,'(i10,f15.6)') cella_bacino(ic,ir), h(ic,ir)
           if(celle_wet(ic,ir).eq.0)then
               celle_wet(ic,ir)=1
               N_celle_wet = N_celle_wet + 1
           endif    
          endif
      end do
!$OMP end single   nowait 
!$OMP single private(i_celle2,ic,ir)

      write(1000002,'("TS",3x,f15.2)')  t_dopo + 0.01
      do i_celle2 = 1, Num_celle_routing_old
          
              ic = ic_routing(i_celle2)
              ir = ir_routing(i_celle2)
          if(celle_routing(ic,ir).ne.estreno)then
              iii=celle_routing(ic,ir)
          if(h(ic,ir).gt.zero)then
              h_tot(ic,ir)=Q_2d(iii,1)
           write(1000002,'(f15.6)') h_tot(ic,ir)
          ELSE
              h_tot(ic,ir) = ele(ic,ir)
          endif
          endif
      end do
!$OMP end single   nowait  
!$OMP single private(i_celle2,ic,ir)
      write(1000005,'("TS",3x,f15.2)')  t_dopo + 0.01
      do i_celle2 = 1, Num_celle_routing_old
          
              ic = ic_routing(i_celle2)
              ir = ir_routing(i_celle2)
          if(celle_routing(ic,ir).ne.estreno)then
              iii=celle_routing(ic,ir)          
          if(h(ic,ir).gt.zero)then
           Vx(ic,ir) = Q_2d(iii,2)/h(ic,ir)
           Vy(ic,ir) = Q_2d(iii,3)/h(ic,ir)
           write(1000005,'(2f15.6)') Vx(ic,ir),Vy(ic,ir)
          else
           Vx(ic,ir) = 0.0
           Vy(ic,ir) = 0.0
              
          endif
          endif
      end do
      !do i=1, Num_celle_bacino
      ! write(1000005,'(2f15.6)') vel_sol_x(i), vel_sol_y(i)
      !end do
!$OMP end single nowait   
!$OMP single private(i_celle2,ic,ir)

      write(1000006,'("TS",3x,f15.2)')  t_dopo + 0.01 ! 18/9/2017
      
      do i_celle2 = 1, Num_celle_routing_old
          
              ic = ic_routing(i_celle2)
              ir = ir_routing(i_celle2)
          if(celle_routing(ic,ir).ne.estreno)then
              iii=celle_routing(ic,ir)             
          if(h(ic,ir).gt.zero)then
              Conc(ic,ir)=Q_2d(iii,4)
           write(1000006,'(f15.6)') Conc(ic,ir)
          else
              Conc(ic,ir)=0.0
          endif
          endif
      end do
      
      !do i = 1, Num_celle_bacino
      ! write(1000006,'(f15.6)') conc_sol(i)  ! 18/9/2017
      !end do
!$OMP end single  nowait  
!$OMP single private(i_celle2,ic,ir)

      if (control_eros.eq.1.0) then
            write(1000003,'("TS",3x,f15.2)')  t_dopo + 0.01
      
      do i_celle2 = 1, Num_celle_routing_old
          
              ic = ic_routing(i_celle2)
              ir = ir_routing(i_celle2)
          
          if(h(ic,ir).gt.zero)then
           write(1000003,'(f15.6)') Eros_tot(ic,ir)
          endif
      end do
      
      !   do i = 1, Num_celle_bacino
	    !write(1000003,'(f15.6)') eros_sol(i)
      !   end do
      endif
!$OMP end single nowait       
           
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
        deallocate (direz_vel)
        deallocate (velocit)
        deallocate (ic_d)
	  deallocate (ir_d)
	  deallocate (ic_s)
        deallocate (ir_s)
	  deallocate (k)
	  deallocate (kk)
	  
	  deallocate (val)
	  deallocate (val_sorg)  
	  deallocate (val_flag)
	  deallocate (sen_max)
	  deallocate (peso_max)
	  deallocate (dh)
	  deallocate (Ch)
	  deallocate (U_crit1)
        deallocate (U_crit2)  ! AGGIUNTA 13/9/2017
	  
	  deallocate (senteta_crit)
        deallocate (senteta_crit2)    ! AGGIUNTA 13/9/2017
        deallocate (dh_sed)
        deallocate (dh_entrata_unif)
	  deallocate (dh_entrata_Bel) 
  	  deallocate (dh_entrata_sorg)
	  deallocate (dh_entrata_solido_sorg)
	  deallocate (h_solido)
	  deallocate (dh_entrata_solido)
	  deallocate (dh_solido)
	  deallocate (Erod_Aux)  !  19/01/2013
	   
	  deallocate (h_pre)  ! 3 Maggio 2013
	  deallocate (h_post) ! 3 Maggio 2013
	  deallocate (Q_entrata)    !   14/05/2013
	  deallocate (j_dir)
	  deallocate (j_vel)   ! 20 maggio 2015     
            !    27/04/2015                        
        deallocate (energia)   !   27/04/2015
        deallocate (densita)   !   27/04/2015
        deallocate (no_erod) !   30/04/2015
        deallocate (Vel8) !  29/4/2019
        deallocate (Deltah8) !  29/4/2019
        deallocate (file_ponti)  !  5/12/2019
        deallocate (ele_ponti)  !  5/12/2019
        deallocate (quota_critica_ponte)  !  5/12/2019
        deallocate (ic_routing)
	  deallocate (ir_routing)


       allocate (h_finale2(no_columns,no_rows))
	 allocate (erosione_finale2(no_columns,no_rows)) 
	 allocate (ele_finale2(no_columns,no_rows))
	 allocate (h_tot_finale2(no_columns,no_rows))   
	 allocate (conc_finale2(no_columns,no_rows))
	 allocate (Area_dep_eros_finale2(no_columns,no_rows))
       allocate (conc_finale(no_columns,no_rows))    !   30/1/201
	 allocate (h_finale(no_columns,no_rows)) 
	 allocate (erosione_finale(no_columns,no_rows))
	 allocate (ele_finale(no_columns,no_rows))
	 allocate (Area_dep_eros_finale(no_columns,no_rows))
       allocate (h_tot_finale(no_columns,no_rows))    !   30/1/2015
       
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

	  if (celle_routing(jj,j).gt.0.0) then 

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
!$OMP section
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
	deallocate (error_map)
      deallocate (magnitudo)
      deallocate (direz_max,vel_cella_max)
      deallocate (h_finale,h_tot_finale,Conc_finale) 
      deallocate (ele_finale)
      deallocate (Area_dep_eros_finale)
      deallocate (Area_dep_eros_ultimo_step)
      deallocate (h_tot)
      deallocate (Solid_tot)
      deallocate (C_fondo)
      deallocate (tauMax)
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
		    
		    
		    !deallocate(spessore_max)
		    !deallocate(vel_max)
		    !deallocate(h_finale)

	

      deallocate(InternalOutput,InternalOutputValle)	!  11 Lug 2017
      if (Intern_Output.eq.1.0) then
       deallocate(InternalOutputValleAux)	!  11 Lug 2017
       deallocate(dh_uscita_sez)	!  11 Lug 2017
       deallocate(dh_uscita_solido_sez)	!  11 Lug 2017
       deallocate(dh_uscita_tot)	!  11 Lug 2017
       deallocate(dh_uscita_solido_tot)
      endif
          Write(0,*) "Start SMS file writing"
		  if (t_dopo-t_minimo.ge.DT_OUTPUT_MINUTI)then
                call crea_file_sms
		   end if
          Write(0,*) "End SMS file writing"
          
		    
	
***************************************************


	

    

      t_fine = omp_get_wtime()

	hh = t_fine - tempo_iniziale
 


	write(30,198) ttt, hh 
198   format(a50,1x,2f10.2)
      
      write(10,*) 
	write(10,198) ttt, hh, hh_1 
	
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
     
      er = Coeff_Ang_Limit*Egash_dep*U_stra_s*(sen_teta(ic_routing(iii),
     1ir_routing(iii),j)-senteta_crit2(ic_routing(iii),ir_routing(iii)))    ! modifica 13/9/2017

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
      character*5256 string_clm 
      character* 100 value_clm, char_value
! ----------------------------------------------------------------------
      open (100,file=fileComandi,mode='read')
! .................................................................
      read  (100,'(a)',end=200) string_clm
          call read_string(string_clm,fileFormat)
      read  (100,'(a)',end=201) string_clm
          call read_string(string_clm,fileIdrogramma) 
      read  (100,'(a)',end=200) value_clm
          call read_string_val(value_clm , control1)
	if (control1.eq.1.0) then
      read  (100,'(a)',end=202) string_clm 
          call read_string(string_clm,fileLandUse)
	read  (100,'(a)',end=203) string_clm
          call read_string(string_clm,fileLandChar)
	else
      read  (100,'(a)',end=200) value_clm
          call read_string_val(value_clm , Chezy)
	endif
	read  (100,'(a)',end=200) value_clm
          call read_string_val(value_clm , Intern_Output) 
	if (Intern_Output.eq.1.0) then
      read  (100,'(a)',end=204)  string_clm
          call read_string(string_clm,file_Internal_Outputs)
      read  (100,'(a)',end=205)  string_clm
          call read_string(string_clm,file_Internal_OutputsValle)
      read  (100,'(a)',end=200) value_clm
          call read_string_val(value_clm ,DT_Internal_Output )
	endif
      read  (100,'(a)',end=200) value_clm
          call read_string_val(value_clm ,tempo_finale)
      read  (100,'(a)',end=200) value_clm
          call read_string_val(value_clm ,Coeff_Ang_Limit)
!	read  (100,'(40x,f15.1)',end=200) DT_Internal_Output
	read  (100,'(a)',end=200) value_clm
          call read_string_val(value_clm , Limit_Angle)
      read  (100,'(a)',end=200) value_clm
          call read_string_val(value_clm , Courant ) 
      read  (100,'(a)',end=200) value_clm
          call read_string_val(value_clm ,h_routing )
	read  (100,'(a)',end=200) value_clm
          call read_string_val(value_clm , control_eros)
	if (control_eros.eq.1.0) then
	if (control1.eq.2.0) then
	read  (100,'(a)',end=200) value_clm
          call read_string_val(value_clm ,Vel_erosion )
	read  (100,'(a)',end=200)  value_clm
          call read_string_val(value_clm ,Ang_erosion)
      read  (100,'(a)',end=200) value_clm
          call read_string_val(value_clm ,Vel_dep_sup  )  ! modifica 13/9/2017
	read  (100,'(a)',end=200) value_clm
          call read_string_val(value_clm ,ang_deposito )      ! modifica 13/9/2017
	endif
      read  (100,'(a)',end=200) value_clm
          call read_string_val(value_clm ,Egash_eros )
	read  (100,'(a)',end=200) value_clm
          call read_string_val(value_clm ,Egash_dep )
      !read  (100,'(35x,f10.4)',end=200) Vel_dep_sup       ! modifica 13/9/2017
	!read  (100,'(35x,f10.5)',end=200) ang_deposito       ! modifica 13/9/2017
	read  (100,'(a)',end=200) value_clm
          call read_string_val(value_clm ,h_erosione )
	read  (100,'(a)',end=200)  value_clm
          call read_string_val(value_clm , Cmedio)
	read  (100,'(a)',end=200) value_clm
          call read_string_val(value_clm , Cstar )
	endif
	read  (100,'(a)',end=500)  value_clm
          call read_string_val(value_clm ,DT_OUTPUT_MINUTI)
!      read  (100,'(50x,i7)',end=600) i_flag
      read  (100,'(a)',end=208)  value_clm
          retine = scan(value_clm,':')
          char_value = value_clm(retine+1:50)
          retine = scan(Char_value,'.')
          if (retine.eq.0)then
           read(char_value,'(i16)') CPUs
          else
           read(char_value(1:retine-1),'(i16)') CPUs
          endif
          
	read  (100,'(a)',end=206) string_clm
          call read_string(string_clm, fileBC)
      read  (100,'(a)',end=206) string_clm
          call read_string(string_clm, fileElePonti)
      read  (100,'(a)',end=206) string_clm
          call read_string(string_clm,fileTxtPonti)
!	read  (100,'(30x,a)',end=200) fileBM 
      read  (100,'(a)',end=207) value_clm
          retine = scan(value_clm,':')
          char_value = value_clm(retine+1:50)
          read(char_value,'(i16)') intFileERR       
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
209   write (10,'(a)') ' -------- Error in the number of erosion 
     1 distributed algorithms  
     1--------' !BARBINI
      close (10)
      stop ' --------Error in the esosion distributed algorithms-------'
207   boolFileERR=.false. !BERNARD WRITING FILE ERR
      close (100)
      Return
      end
! ****************************************************************************
      subroutine read_string(input,file_name)
      character*5256 input,file_name
      retine = scan(input,":") 
      input = input(retine+1:5000)
      read(input,'(a)') file_name 
      return
      end
      
      subroutine read_string_val(input,file_value)
      character*100 input
      real file_value
      integer i
      retine = scan(input,":") 
      input = input(retine+1:70)
      
      retine = scan(input,".")
            
      if (retine.gt.0)then
          do i = 1 , retine
            if (input(i:i).eq.' ')then
              
            else
                goto 1699
            endif
           enddo 
1699  read(input(i:50),'(f)') file_value
      else
          do i = 1 , 50
            if (input(i:i).eq.' ')then
              
            else
                goto 1799
            endif
           enddo 
1799  read(input,'(f8.0)') file_value         
      
      endif
      return
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
      write  (100,'(''Internal Output Time Step(seconds):'',f15.1)')            !! MODIFICA DEL 21/09/2015
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
      write  (100,'(''Egashira erosion coefficient      :'',f10.2)')  
	1Egash_eros  
      write  (100,'(''Egashira deposition coefficient   :'',f10.2)')  
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
      write  (100,'(''Output time step (seconds)     	  :'',f10.3)')
     1  DT_OUTPUT_MINUTI    
    !  write  (100,'(''Equal Time-Spaced (1) No Equal Time-Spaced (2)   
	!1:'',i7)')   i_flag 
      write  (100,'(''Number of set logical CPUs        :'',i7)') CPUs 
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
	integer ndry(180000), kkk,N_celle_wet1
	
	
        
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
	 i_sh_row2  =(/ -1, -1,  1,  1 /)	
c----------------------------------------------------------------------
         
        !********************************
        !  apertura file input
        !********************************

         file_input_h = fileSOL1
         file_input_wse = fileSOL2
         if (control_eros.eq.1.0) then
         file_input_eros = fileSOL3
         endif
        ! file_input_vel = fileSOL4
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
        
         
         
         
         j_TS = N_file_Output +2
         
!       do i = 1,99999999999999999
!         read (1000001,'(a2))',err=501, end=100) TS
!         if (TS.eq.'TS') j_TS = j_TS + 1
!       enddo
!         
!100   continue
!
!       close(1000001)
!      
!      
!       open (1000001,file=file_input_h,err=501)
        
        !********************************
        !  apertura file output
        !********************************
        
         !  file geometria    
    
       file_2dm = fileLog
     
         	retint = scan (fileLog,'.')
      if (retint > 1) then
	
      file_2dm = fileLog(1:retint-1)//'.2dm'
      endif
      
	open(11000011,file=file_2dm,mode='write')
	
****************************************************************
        !  Calcolo dimensioni mesh SMS
        !
****************************************************************
 
      N_celle_wet1 = 0
      do i = 1, no_rows
        do j = 1, no_columns
            if(celle_wet(j,i).ne.0)then
                     N_celle_wet1 = N_celle_wet1 + 1
      endif       
      
        end do
      end do      

      

      do i = 1, no_rows
        do j = 1, no_columns
            if(celle_wet(j,i).eq.1)then
                do kkk = 1,8
                 i_1= i + i_sh_row(kkk)
                 j_1= j + i_sh_col(kkk)
                if(ele(j_1,i_1).ne.esterno
     1          .and.celle_wet(j_1,i_1).eq.0)then
                     N_celle_wet = N_celle_wet + 1 
                     celle_wet(j_1,i_1) = 2
                   endif
                enddo
            endif               
        end do
      end do
      
      do i = 1, no_rows
        do j = 1, no_columns
            if(celle_wet(j,i).eq.2)then
                do kkk = 1,8
                 i_1= i + i_sh_row(kkk)
                 j_1= j + i_sh_col(kkk)
                if(ele(j_1,i_1).ne.esterno
     1          .and.celle_wet(j_1,i_1).eq.0)then
                     N_celle_wet = N_celle_wet + 1 
                     celle_wet(j_1,i_1) = 3
                   endif
                enddo
            endif               
        end do
      end do

      N_celle_wet1 = 0
      do i = 1, no_rows
        do j = 1, no_columns
            if(celle_wet(j,i).ne.0)then
                     N_celle_wet1 = N_celle_wet1 + 1
      endif       
      
        end do
      end do  
      
       


      

****************************************************************      
        !  Read file .soltxt writen only for the celle_routing
        !  and write 1.soltxt     
****************************************************************
      allocate (n_celle_rout(Num_celle_routing))
      allocate (h_sol(Num_celle_routing))
	allocate (htot_sol(Num_celle_routing))
	allocate (eros_sol(Num_celle_routing))
	allocate (vel_sol_x(Num_celle_routing))  ! 29/4/2015
	allocate (vel_sol_y(Num_celle_routing))   ! 29/4/2015
      allocate (conc_sol(Num_celle_routing))    ! 18/9/2017
      
         
   !      open (1000002,file=file_input_wse,err=502)
   !      open (1000006,file=file_input_conc,err=506)  ! 18/9/2017
   !      if (control_eros.eq.1.0) then
   !      open (1000003,file=file_input_eros,err=503)
   !      endif
   !!     open (1000004,file=file_input_vel,err=504)
   !      open (1000005,file=file_input_velcel,err=505)
      
      fileSOL1 = fileLog
      retint = scan (fileSOL1,'.')
      if (retint > 1) then
        fileSOL1 = fileSOL1(1:retint-1)//'_h_1.soltxt'
      endif	
	open ( 1010001,file=fileSOL1,mode='write')
	
	fileSOL2 = fileLog
      retint = scan (fileSOL2,'.')
      if (retint > 1) then
	fileSOL2 = fileSOL2(1:retint-1)//'_htot_1.soltxt'
      endif	
	open ( 1010002,file=fileSOL2)

    
      fileSOL6 = fileLog
      retint = scan (fileSOL6,'.')
      if (retint > 1) then
      fileSOL6 = fileSOL6(1:retint-1)//'_conc_1.soltxt'
      endif
	open (1010006,file=fileSOL6)
	
	
	if (control_eros.eq.1.0) then
	  fileSOL3 = fileLog
        retint = scan (fileSOL3,'.')
        if (retint > 1) then
         fileSOL3 = fileSOL3(1:retint-1)//'_eros_1.soltxt'
        endif
	  open ( 1010003,file=fileSOL3)
	endif
	  
      fileSOL5 = fileLog
      retint = scan (fileSOL5,'.')
      if (retint > 1) then
	fileSOL5 = fileSOL5(1:retint-1)//'_velCel_1.sol'
      endif
	open ( 1010005,file=fileSOL5)
	
      
      
      
      do i_time = 1 , j_TS
          
        read(1000001,'(a100)') prima_riga 
        write(1010001,'(a100)') prima_riga 
        read(1000002,'(a100)') prima_riga 
        write(1010002,'(a100)') prima_riga 
        read(1000003,'(a100)') prima_riga 
        write(1010003,'(a100)') prima_riga 
        read(1000005,'(a100)') prima_riga  
        write(1010005,'(a100)') prima_riga 
        read(1000006,'(a100)') prima_riga 
        write(1010006,'(a100)') prima_riga 
        
        do i_celle2 = 1, n_celle_sol(i_time) 
         read(1000001,'(i10,f15.6)') n_celle_rout(i_celle2), 
     1   h_sol(i_celle2)
         
         read(1000002,'(f15.6)') htot_sol(i_celle2)
         
          if (control_eros.eq.1.0) then
           read(1000003,'(f15.6)') eros_sol(i_celle2)
          endif 
         
         read(1000006,'(f15.6)') conc_sol(i_celle2)
         
         read(1000005,'(2f15.6)')vel_sol_x(i_celle2),vel_sol_y(i_celle2)
         
        end do
        i_celle2 = 1
        do i=1, no_rows
          do j=1, no_columns  
            check = 0
            if(celle_wet(j,i).ne.0)then
             do kkk = 1, n_celle_sol(i_time)
              if(n_celle_rout(kkk).eq.cella_bacino(j,i))then 
                  check = 1
                  i_celle2 = kkk
                  goto 1359                   
              endif 
             enddo   
1359         if(check.eq.1)then 
               
               write(1010001,'(f15.6)') h_sol(i_celle2)
               write(1010002,'(f15.6)') htot_sol(i_celle2)
               write(1010005,'(2f15.6)') vel_sol_x(i_celle2),
     1          vel_sol_y(i_celle2)
               write(1010006,'(f15.6)') conc_sol(i_celle2)
              if (control_eros.eq.1.0) then
                write(1010003,'(f15.6)') eros_sol(i_celle2)
              endif
               
               
              else
               write(1010001,'(f15.6)') 0.0
               write(1010002,'(f15.6)') 0.0
               write(1010005,'(2f15.6)') 0.0,0.0
               write(1010006,'(f15.6)') 0.0
              if (control_eros.eq.1.0) then
                write(1010003,'(f15.6)') 0.0
              endif    
              endif
                                    
            end if
        end do      
        end do
            
        
      end do
      
       CLOSE (1000001, STATUS='DELETE', IOSTAT=I )
       CLOSE (1000002, STATUS='DELETE', IOSTAT=I )
       if (control_eros.eq.1.0) then
        CLOSE (1000003, STATUS='DELETE', IOSTAT=I )
       endif        
                   
       CLOSE (1000005, STATUS='DELETE', IOSTAT=I )
       CLOSE (1000006, STATUS='DELETE', IOSTAT=I )   ! 3/12/2017
       
       CLOSE (1010001)
       CLOSE (1010002 )
       if (control_eros.eq.1.0) then
        CLOSE (1010003)
       endif        
                   
       CLOSE (1010005)
       CLOSE (1010006) 
      
         file_input_h = fileSOL1
         file_input_wse = fileSOL2
         if (control_eros.eq.1.0) then
         file_input_eros = fileSOL3
         endif
         
         file_input_velcel = fileSOL5
         file_input_conc = fileSOL6
         
         open (1000001,file=file_input_h,err=501)
         open (1000002,file=file_input_wse,err=502)
         open (1000006,file=file_input_conc,err=506)  ! 18/9/2017
         if (control_eros.eq.1.0) then
         open (1000003,file=file_input_eros,err=503)
         endif
         open (1000005,file=file_input_velcel,err=505)
         
      Num_celle_bacino = n_celle_wet
      
      

      
		
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
	     
	     ! if (ele(i,j).eq.esterno) n_element(i,j) = esterno
	     if(celle_wet(i,j).eq.0) n_element(i,j) = esterno
	   
	     !if (ele(i,j).ne.esterno) then
	     if(celle_wet(i,j).ne.0)then
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
	    
	     !if (ele(i,j).ne.esterno) then
           if(celle_wet(i,j).ne.0) then    
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
	 !if (ele(i,j_iniz).ne.esterno) then
       if(celle_wet(i,j_iniz).ne.0) then    
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

	        do     j = j_iniz+1, no_rows
	           do  i =        1, no_columns
	    
	           ! if (ele(i,j).ne.esterno) then
	            if (celle_wet(i,j).ne.0) then
	            
	                 i_cella = i_cella + 1
	                 
	!write(110,*)
    !  write(110,*)     
    !  write(110,'(I5,2f20.2)') i_cella,coord(i_cella,1),coord(i_cella,2)
    !  write(110,*) n_element(i,j)
    ! write(110,*)
      
          	            

                   !if (ele(i-1,j).ne.esterno) then    !  ELEMENTO A EST  NODO 1 
                   if (celle_wet(i-1,j).ne.0) then
                       
                      nop(i_cella,1) = nop(i_cella-1,2)
                     
                                      
                    else
                    
                   
             nnod = nnod + 1
            nodxyz(nnod,1)=coord(i_cella,1) + float(i_sh_col2(1))*dist/2		! coordinata x
			nodxyz(nnod,2)=coord(i_cella,2) + float(i_sh_row2(1))*dist/2
                    
                     nop(i_cella,1) = nnod 
                
                                      
                   
                   endif 
                                    
                   !  NODO 4
                  
                      !if (ele(i-1,j-1).ne.esterno) then
                      if (celle_wet(i-1,j-1).ne.0) then
                          
                        nop(i_cella,4) = nop(n_element(i-1,j-1),2)
                        
                          else
                        
                            !if (ele(i-1,j).ne.esterno) then
                            if (celle_wet(i-1,j).ne.0) then
                                
                                nop(i_cella,4) = nop(i_cella-1,3)
                       
                             
                                  else
                                  
                            !if (ele(i,j-1).ne.esterno) then
                            if (celle_wet(i,j-1).ne.0) then
                                
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


                       !if (ele(i,j-1).ne.esterno) then                           
                          if (celle_wet(i,j-1).ne.0) then

                        
                         nop(i_cella,3) = nop(n_element(i,j-1),2)
                      
                         
                      
                        else
                        
                      			
			
			                 !if (ele(i+1,j-1).ne.esterno) then                 
                            if (celle_wet(i+1,j-1).ne.0) then

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
2022		format('E4Q',8i10)

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


       
    
       
      
      do ii = 1, j_TS
!$OMP parallel num_threads(CPUs)
          
!$OMP single private(prima_riga, j)
       read(1000001,'(a100)') prima_riga
       write(11000050,'(a100)') prima_riga
       
       do j = 1, num_celle_bacino
          read(1000001,*) profond(j)
       enddo
!$OMP end single nowait
!$OMP single private(prima_riga, j)
       read(1000002,'(a100)') prima_riga
       write(11000051,'(a100)') prima_riga
       do j = 1, num_celle_bacino
          read(1000002,'(f15.6)') wse(j)
       enddo
!$OMP end single nowait
!$OMP single private(prima_riga, j)
       read(1000006,'(a100)') prima_riga
       write(11000066,'(a100)') prima_riga
       
       do j = 1, num_celle_bacino
          read(1000006,'(f15.6)') conc_sms(j)  ! 18/9/2017
       enddo
!$OMP end single nowait
            
!$OMP single private(prima_riga, j)

       if (control_eros.eq.1.0) then
        read(1000003,'(a100)') prima_riga
        write(11000054,'(a100)') prima_riga
        
        do j = 1, num_celle_bacino
          read(1000003,'(f15.6)') erosion_depth(j)
        enddo
       endif
       
!$OMP end single 
      
!$OMp do private(i,j,nod,jk)
!$OMP& private(quota,quota_wse,quota_eros,quota_conc)
       
       do i=1,nelem

		do j=1,4	! nodi d'angolo

			nod=nop(i,j)	! nodo considerato

			quota=0.0
			quota_wse = 0.0
			quota_eros = 0.0
              quota_conc = 0.0  ! 18/9/2017

			do jk=1,n_nod_elem(nod)
                  if (profond(nod_elem(nod,jk)).gt.0)then
                   continue
                  endif
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
!$OMP end do
      

!$OMP single private (i)	
	  do i = 1, nnod
  !    write(50,'(f20.6)') depth(i)
    !    write(50,*) depth(i)
        write(11000050,'(f15.6)') depth(i)
      end do
!$OMP end single nowait
!$OMP single private (i)	
	  do i = 1, nnod
        
        write(11000051,'(f15.6)') wse_nod(i)
      end do
!$OMP end single nowait
!$OMP single private (i)	
	  do i = 1, nnod
         write(11000066,'(f15.6)') conc_sms_nod(i)   ! 18/9/2017
        end do
!$OMP end single nowait
!$OMP single private (i)	
        if (control_eros.eq.1.0) then
	  do i = 1, nnod
        write(11000054,'(f15.6)') erosion_depth_nod(i)
        
       
       enddo
        endif
!$OMP end single nowait 
!$OMP end parallel
        
      enddo ! fine ciclo j_TS
      
 !     else
 !     
 !     do ii = 1, j_TS
 !     
 !      read(1000001,'(a100)') prima_riga
 !      write(11000050,'(a100)') prima_riga
 !      
 !      read(1000002,'(a100)') prima_riga
 !      write(11000051,'(a100)') prima_riga
 !      
 !      ! 18/9/2017
 !      read(1000006,'(a100)') prima_riga
 !      write(11000066,'(a100)') prima_riga
 !      
 !      do j = 1, num_celle_bacino
 !      read(1000001,*) profond(j)
 !      read(1000002,'(f15.6)') wse(j)
 !    
 !      enddo
 !      
 !      do i=1,nelem
 !
	!	do j=1,4	! nodi d'angolo
 !
	!		nod=nop(i,j)	! nodo considerato
 !
	!		quota=0.0
	!		quota_wse = 0.0
	!	
 !
	!		do jk=1,n_nod_elem(nod)
 !
	!			quota=quota+profond(nod_elem(nod,jk))
	!			quota_wse=quota_wse+wse(nod_elem(nod,jk))
 !               quota_conc=quota_conc+conc_sms(nod_elem(nod,jk))  ! 18/9/2017
	!			
	!		enddo
 !
	!		depth(nod)=quota/n_nod_elem(nod)
	!		wse_nod(nod) = quota_wse/n_nod_elem(nod)
 !           conc_sms_nod(nod) = quota_conc/n_nod_elem(nod)  ! 18/9/2017
	!		
	!	
 !
	!	enddo
 !
	!enddo
	!
	!  do i = 1, nnod
 !
 !       write(11000050,'(f15.6)') depth(i)
 !       write(11000051,'(f15.6)') wse_nod(i)
 !       write(11000066,'(f15.6)') conc_sms_nod(i)! 18/9/2017
 !   
 !      
 !      enddo
 !   
 !   
 !     enddo ! fine ciclo j_TS
 !     
 !     
 !     
 !     endif
       
                
       
      
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
	     	    
	     !if (ele(i,j).ne.esterno) then
	      if (celle_wet(i,j).ne.0)then
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
     1 h_tot(ic_strutt(i),ir_strutt(i)) + vel_cella(ic_strutt(i),
     1 ir_strutt(i))*vel_cella(ic_strutt(i),ir_strutt(i))/(2.0*9.81)  ! 29/04/2015
 
       densita(ic_strutt(i),ir_strutt(i)) = 
     1 conc(ic_strutt(i),ir_strutt(i))*2650.0 + 
     1 (1-conc(ic_strutt(i),ir_strutt(i)))*1000.0
     
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
        integer n_massimi,j_n_massimi,j_ele_max
        
        integer i_diag_col(4),i_diag_row(4)
        real  D_ele_max 
        integer countO,countS,countE,countN,massimo
		real, allocatable :: InternalOutputValleCopy(:,:)
		allocate(InternalOutputValleCopy(no_columns,no_rows))
        

      
      i_diag_col = (/ -1,  -1,  1, 1/) 
	i_diag_row = (/  1,  -1, -1, 1/)
 
        do i = 1, Nsez + Num_sorgenti
           sezioniInterne(i)%D_ele(:)=0.0
            do j = 1, sezioniInterne(i)%index
                
                ir=sezioniInterne(i)%seqCell(j)%ir
                ic=sezioniInterne(i)%seqCell(j)%ic

                !4 direzioni cardinali
                if (ic>1) then
                    DEM_O=ele(ic-1, ir)
                    if (DEM_O.eq.-9999) DEM_O = -esterno
                    if (ele(ic,ir).gt.DEM_O.and.InternalOutput(ic-1, ir)
     1.eq.esterno) then
                        sezioniInterne(i)%direzioni(3)=
     1sezioniInterne(i)%direzioni(3)+1 
      
      
      sezioniInterne(i)%D_ele(3) = sezioniInterne(i)%D_ele(3) + 
     1 ele(ic,ir)-DEM_O                 
      
      
                    endif
                endif
                if (ic<no_columns) then
                    DEM_E=ele(ic+1, ir)
                    if (DEM_E.eq.-9999) DEM_E = -esterno
                    if (ele(ic,ir).gt.DEM_E.and.InternalOutput(ic+1, ir)
     1.eq.esterno) then
                        sezioniInterne(i)%direzioni(4)=
     1sezioniInterne(i)%direzioni(4)+1  !InternalOutputValle(ic+1,ir)=999
       
      
      sezioniInterne(i)%D_ele(4) = sezioniInterne(i)%D_ele(4) + 
     1 ele(ic,ir)-DEM_E                  
                          endif
                endif
                if (ir>1) then
                    DEM_N=ele(ic, ir-1)
                    if (DEM_N.eq.-9999) DEM_N = -esterno
                    if (ele(ic,ir).gt.DEM_N.and.InternalOutput(ic, ir-1)
     1.eq.esterno) then
                        sezioniInterne(i)%direzioni(1)=
     1sezioniInterne(i)%direzioni(1)+1 !InternalOutputValle(ic,ir+1)=999
                        
      
      sezioniInterne(i)%D_ele(1) = sezioniInterne(i)%D_ele(1) + 
     1 ele(ic,ir)-DEM_N                  
                         
                    endif
                endif
                if (ir<no_rows) then
                    DEM_S=ele(ic, ir+1)
                    if (DEM_S.eq.-9999) DEM_S = -esterno
                    
                    if (ele(ic,ir).gt.DEM_S.and.InternalOutput(ic, ir+1)
     1.eq.esterno) then
                        sezioniInterne(i)%direzioni(2)=
     1sezioniInterne(i)%direzioni(2)+1 !InternalOutputValle(ic,ir-1)=999
      
      
      sezioniInterne(i)%D_ele(2) = sezioniInterne(i)%D_ele(2) + 
     1 ele(ic,ir)-DEM_s                  
         
                    endif
                endif




            enddo
        
        end do
        
! modifica BMat 2024 non corretta definizione delle dowstreamn_massimi
! nel caso in cui i contatori sezioniInterne(i)%direzioni(:) siano uguali in più direzioni
      do i = 1, Nsez + Num_sorgenti
            countN=sezioniInterne(i)%direzioni(1)
            CountO=sezioniInterne(i)%direzioni(3)
            CountS=sezioniInterne(i)%direzioni(2)
            CountE=sezioniInterne(i)%direzioni(4)

           D_ele_max = 0
           n_massimi = 0 
           j_n_massimi=0
           j_ele_max=0
           massimo=max(countO,countS,countE,countN)
        do j = 1, 4
            sezioniInterne(i)%D_ele(j) = sezioniInterne(i)%D_ele(j)/ 
     1      sezioniInterne(i)%direzioni(j) 
           if(sezioniInterne(i)%D_ele(j).gt.D_ele_max)then
             D_ele_max =  sezioniInterne(i)%D_ele(j)
             j_ele_max = j
           endif  
           if(sezioniInterne(i)%direzioni(j).eq.massimo)then
              n_massimi =  n_massimi +1
              j_n_massimi = j
           endif   
        enddo
        
        if(n_massimi.eq.1)then
          if(j_ele_max.ne.j_n_massimi)then
              
            Write(10,"('Sezione n° ',i3,' attenzione al file 999')") i
            write(10,"('la direzzione topografica prevalente non 
     1coincide con la direzione di massima pendenza media')")
          endif
        else
            Write(10,"('Sezione n° ',i3,' attenzione al file 999')") i
            write(10,"('la direzzione topografica prevalente non 
     1è univoca, verrà scelta la direzione di massima pendenza media')")
            
        sezioniInterne(i)%direzioni(j_ele_max) = massimo+1
        endif
        enddo
            
           
        
               
        do i = 1, Nsez + Num_sorgenti
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
             if(ic.gt.1.and.ir.gt.1)then     
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
            
            endif
           enddo
              enddo
              
        InternalOutputValle=InternalOutputValleCopy	
              
      ! Verifichiamo se ogni dow stream ha solo un inizio e una fine
         do i = 1, Nsez + Num_sorgenti
            countN=sezioniInterne(i)%direzioni(1)
            CountO=sezioniInterne(i)%direzioni(3)
            CountS=sezioniInterne(i)%direzioni(2)
            CountE=sezioniInterne(i)%direzioni(4)
            

           do j = 1, sezioniInterne(i)%index
               ir=sezioniInterne(i)%seqCell(j)%ir
               ic=sezioniInterne(i)%seqCell(j)%ic 
               n_celle        = 0.0
               n_bordo        = 0.0 
               n_diag_celle   = 0.0
            do jj =1, 4

                 
                 ir1 = ir + i_qhh_row(jj)
                 ic1 = ic + i_qhh_col(jj)
                 
                 if(InternalOutput(ic1,ir1).ne.esterno)then
                    n_bordo = n_bordo + 1
                 endif   
                 
                 if(InternalOutputValle(ic1,ir1).eq.999)then                       
                    n_celle = n_celle +1
                 end if
                 
                 ir1 = ir + i_diag_row(jj)
                 ic1 = ic + i_diag_col(jj)
                 
                 if(InternalOutputValle(ic1,ir1).eq.999)then                       
                    n_diag_celle = n_diag_celle +1
                 end if
                 
            enddo
            if (n_bordo.gt.1)then
            if(n_celle.le.1.and.n_diag_celle.eq.0)then
             do jj =1, 8
                 
               ir1 = ir + i_sh_row(jj)
               ic1 = ic + i_sh_col(jj)
                 
               if(InternalOutputValle(ic1,ir1).eq.esterno.and.
     1         InternalOutput(ic1,ir1).eq.esterno)then
                  InternalOutputValle(ic1,ir1) = 900 
               endif
                 
             enddo
            endif
            endif
          enddo
         enddo        
              
         InternalOutputValleCopy=InternalOutputValle
         
		do ir = 1, no_rows
		  do ic =1, no_columns
             if(InternalOutputValle(ic,ir).eq.999)then
                
              do j = 1, 4
                 ic1 = ic +i_qhh_col(j)
                 ir1 = ir +i_qhh_row(j)
                 if(ir1.ge.1.and.ic1.ge.1)then
                 if(InternalOutputValle(ic1,ir1).eq.900)then
                    InternalOutputValleCopy(ic1,ir1) = 999
1199                continue
                    do jj = 1,4
                       ic2 = ic1 + i_qhh_col(jj)
                       ir2 = ir1 + i_qhh_row(jj)
                 if(InternalOutputValle(ic2,ir2).eq.900.and.
     1              InternalOutputValleCopy(ic2,ir2).ne.999)then
                    InternalOutputValleCopy(ic2,ir2) = 999
                      ic1 = ic2
                      ir1 = ir2
                      goto 1199
                 endif
                    enddo
                 endif
                 endif
              enddo
             endif
            enddo
            enddo
                     
                 
            InternalOutputValle=InternalOutputValleCopy	      
                 

              
              
              
              
			do ir = 1, no_rows
				do ic=1,no_columns
                     n_celle = 0 
              if (InternalOutputValle(ic,ir).eq.900)then
                  InternalOutputValleCopy(ic,ir) = esterno
              endif    
                      
			if (InternalOutputValle(ic, ir).eq.999) then
                  if(ic.gt.1.and.ir.gt.1)then
            if (InternalOutputValle(ic-1, ir-1).eq.999) then
                
                if (InternalOutput(ic-1, ir).ne.esterno) then
                    n_celle = n_celle + 1
                endif
                if (InternalOutput(ic, ir-1).ne.esterno) then
                    n_celle = n_celle + 1
                endif
               if(n_celle.gt.0)then 
                if (InternalOutput(ic-1, ir).eq.esterno) then
                    InternalOutputValleCopy(ic-1,ir)=999
                else
                    InternalOutputValleCopy(ic,ir-1)=999
                    
                endif
               endif 
            else if (InternalOutputValle(ic+1, ir-1).eq.999) then
                if (InternalOutput(ic,ir-1).ne.esterno) then
                    n_celle = n_celle + 1
                endif
                if (InternalOutput(ic+1,ir).ne.esterno) then
                    n_celle = n_celle + 1
                endif
                if(n_celle.gt.0)then             
                if (InternalOutput(ic, ir-1).eq.esterno) then
                    InternalOutputValleCopy(ic,ir-1)=999
                else if(InternalOutputValleCopy(ic+1,ir).ne.999)then
                    InternalOutputValleCopy(ic+1,ir)=999
                endif
                endif
            endif
   
              endif
              endif
           enddo
          enddo
              
        InternalOutputValle=InternalOutputValleCopy	
        
    
        
      deallocate(InternalOutputValleCopy)
         
      N_sorgenti_valle = 0
        do ir = 1, no_rows
		    do ic=1,no_columns
                if (ele(ic,ir).eq.esterno) InternalOutputValle(ic,ir)=
     1esterno 
          if(internaloutputvalle(ic,ir).eq.999)then
              do j=1,8
                  ic1 = ic + i_sh_col(j)
                  ir1 = ir + i_sh_row(j)
                  
                  if(inletoutlet(ic1,ir1).ne.esterno)then
                      N_sorgenti_valle = N_sorgenti_valle + 1  
                      goto 3991
                  endif
              enddo
          endif
3991          continue
                
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

        subroutine new_cell_param(iii,i,j,nodo_sorgente)
        use mdl_bin5
        integer i,j,iii,ij,nodo_sorgente
        
        Q_2d(iii,:) = 0.0
        Q_2d(iii,1) = ele(i,j)
        Q_2d(iii,5) = ele(i,j)
        Flux_x(iii,:) = 0.0
        Flux_y(iii,:) = 0.0
! vettori matametri materiale
!Ch , Erod, noerodibile, U_lim_ero, teta_lim_ero, u_lim_dep,  teta_lim_dep, C_fondo        
         Param(iii,:) = 0.0
          do ij = 1, N_suoli
	                   if (Suolo(i,j).eq.uso_suolo(ij)) then
	                   
	                      Param(iii,1) = scabr(ij)
	                      
	                      if (control_eros.eq.1.0) then
	                      
	                       Param(iii,2) = Mobile(ij)
	                      
	                       Param(iii,3) = cond_noerod(ij)
	                      
	                       Param(iii,4) = vel_eros(ij)
	                       Param(iii,5) = ang_eros(ij)

                             Param(iii,6) = vel_dep(ij)
	                      Param(iii,7) = ang_dep(ij)
	                      
	                      
	                      if (Cstar.gt.0.0) then
	                      
	                        Param(iii,8) = Cstar	                        
	                                             
	                      else
	                                            
	                        Param(iii,8) = C_star(ij)

                                
	                      	                      	                      
	                      endif
	                      
	                      
	                      
	                         else
	                         
	                        Param(iii,2) = 0.0
	                        Param(iii,3) = 0.0
	                      
	                      endif
	                   
	                   endif
          enddo
          
      if(inletoutlet(i,j).ge.5000.and.
     1 inletoutlet(i,j).lt.9000)then
          jjj_sorgente = inletoutlet(i,j) -5000 + 1
             
             !verifichiamo le direzioni della velocità per inflow cell
             !le direzioni rimangono costanti tutto il tempo
          
          D_ele_max = 0.0
          Boundary(jjj_sorgente,nodo_sorgente,:) = 0.00
          do jj = 1, 8
            icj =i + i_sh_col(jj)  
            irj =j + i_sh_row(jj)
          
            if(ele(icj,irj).ne.esterno)then
             if(internaloutputvalle(icj,irj).eq.999)then
                 D_ele = Q_2d(iii,5) - ele(icj,irj)
                 if(D_ele.gt.D_ele_max)then
                     D_ele_max = D_ele
                     j_ele_max = jj
                 endif
             endif 
            endif
          enddo
          if(D_ele_max.gt.0)then
             if(j_ele_max.eq.1)then
                 Boundary(jjj_sorgente,nodo_sorgente,1) = 0
                 Boundary(jjj_sorgente,nodo_sorgente,2) = -1
             elseif(j_ele_max.eq.5)then
                 Boundary(jjj_sorgente,nodo_sorgente,1) = 0
                 Boundary(jjj_sorgente,nodo_sorgente,2) = 1
             elseif(j_ele_max.eq.7)then
                 Boundary(jjj_sorgente,nodo_sorgente,1) = 1
                 Boundary(jjj_sorgente,nodo_sorgente,2) = 0
             elseif(j_ele_max.eq.3)then
                 Boundary(jjj_sorgente,nodo_sorgente,1) = 0
                 Boundary(jjj_sorgente,nodo_sorgente,2) = -1
             elseif(j_ele_max.eq.2)then
                 Boundary(jjj_sorgente,nodo_sorgente,1) = -(1/2**0.5)
                 Boundary(jjj_sorgente,nodo_sorgente,2) = -(1/2**0.5)
             elseif(j_ele_max.eq.4)then
                 Boundary(jjj_sorgente,nodo_sorgente,1) = -(1/2**0.5)
                 Boundary(jjj_sorgente,nodo_sorgente,2) = (1/2**0.5)
             elseif(j_ele_max.eq.6)then
                 Boundary(jjj_sorgente,nodo_sorgente,1) = (1/2**0.5)
                 Boundary(jjj_sorgente,nodo_sorgente,2) = (1/2**0.5)
             elseif(j_ele_max.eq.8)then
                 Boundary(jjj_sorgente,nodo_sorgente,1) = (1/2**0.5)
                 Boundary(jjj_sorgente,nodo_sorgente,2) = -(1/2**0.5)
             endif    
                 
          endif      
          endif
          return
        end
        
        subroutine U_direction(iii,U1,dir_U)
        use mdl_bin5
        integer iii,dir_U
        real U1,ux,uy,ang_U
        ux =Q_t2d(iii,2)/(Q_t2d(iii,1)-Q_t2d(iii,5))
        uy =Q_t2d(iii,3)/(Q_t2d(iii,1)-Q_t2d(iii,5))
        U1 = sqrt(ux**2+uy**2)
        ang_U = (atan(uy/ux))*180/3.14
        
        if(ux.eq.0.and.uy.gt.0) ang_U =90
        if(ux.eq.0.and.uy.lt.0) ang_U =270
        if(ux.lt.0.0)then
           ang_U = ang_U + 180
        elseif(uy.le.0.0)then
           ang_U = ang_U + 360
        endif
           
      if(ang_U.lt.22.5)then 
          dir_U = 7
      elseif(ang_U.lt.67.5)then
          dir_U = 6
      elseif(ang_U.lt.112.5)then
          dir_U = 5
      elseif(ang_U.lt.157.5)then
          dir_U = 4
      elseif(ang_U.lt.202.5)then
          dir_U = 3
      elseif(ang_U.lt.247.5)then
          dir_U = 2
      elseif(ang_U.lt.292.5)then
          dir_U = 1
      elseif(ang_U.lt.337.5)then
          dir_U = 8
      else 
          dir_U = 7
      endif 
      
      return
        end
        
        function fun_beta(Con_rel) result(beta)
        implicit none
        
        real Con_rel
        real beta
        
        if(Con_rel .ge. 0.1)then
            beta = 1
        else
            beta = 1+ 0.8/(0.9)*(Con_rel-0.1)
        endif
        
        End function
        