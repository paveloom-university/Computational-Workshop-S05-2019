submodule ( settings_m ) read_settings_s
implicit none
     
     contains
     
     ! Процедура для считывания настроек программы
     module procedure read_settings
          
          integer(SP) :: stat ! Статусная переменная
          integer(UP) :: unit ! Номер дескриптора файла

          ! Открытие файла
          open( newunit = unit, file = file, action = 'read', status = 'old', iostat = stat )
          if ( stat .ne. 0_SP ) call log_settings_error('WO', file) ! Проверка на ошибку открытия файла

          ! Считывание ответа на вопрос о считывании значения левой границы промежутка
          read( unit = unit, fmt = '()' )
          read( unit = unit, fmt = *, iostat = stat ) settings%do_read_l
          if ( stat .ne. 0_SP ) call log_settings_error('WR_do_read_l', file) ! Проверка на ошибку считывания

          ! Считывание ответа на вопрос о считывании значения правой границы промежутка
          read( unit = unit, fmt = '(/)' )
          read( unit = unit, fmt = *, iostat = stat ) settings%do_read_r
          if ( stat .ne. 0_SP ) call log_settings_error('WR_do_read_r', file) ! Проверка на ошибку считывания

          ! Считывание ответа на вопрос о считывании значения параметра alpha_1
          read( unit = unit, fmt = '(/)' )
          read( unit = unit, fmt = *, iostat = stat ) settings%do_read_alpha_1
          if ( stat .ne. 0_SP ) call log_settings_error('WR_do_read_alpha_1', file) ! Проверка на ошибку считывания

          ! Считывание ответа на вопрос о считывании значения параметра beta_1
          read( unit = unit, fmt = '(/)' )
          read( unit = unit, fmt = *, iostat = stat ) settings%do_read_beta_1
          if ( stat .ne. 0_SP ) call log_settings_error('WR_do_read_beta_1', file) ! Проверка на ошибку считывания

          ! Считывание ответа на вопрос о считывании значения параметра gamma_1
          read( unit = unit, fmt = '(/)' )
          read( unit = unit, fmt = *, iostat = stat ) settings%do_read_gamma_1
          if ( stat .ne. 0_SP ) call log_settings_error('WR_do_read_gamma_1', file) ! Проверка на ошибку считывания

          ! Считывание ответа на вопрос о считывании значения параметра alpha_2
          read( unit = unit, fmt = '(/)' )
          read( unit = unit, fmt = *, iostat = stat ) settings%do_read_alpha_2
          if ( stat .ne. 0_SP ) call log_settings_error('WR_do_read_alpha_2', file) ! Проверка на ошибку считывания

          ! Считывание ответа на вопрос о считывании значения параметра beta_2
          read( unit = unit, fmt = '(/)' )
          read( unit = unit, fmt = *, iostat = stat ) settings%do_read_beta_2
          if ( stat .ne. 0_SP ) call log_settings_error('WR_do_read_beta_2', file) ! Проверка на ошибку считывания

          ! Считывание ответа на вопрос о считывании значения параметра gamma_2
          read( unit = unit, fmt = '(/)' )
          read( unit = unit, fmt = *, iostat = stat ) settings%do_read_gamma_2
          if ( stat .ne. 0_SP ) call log_settings_error('WR_do_read_gamma_2', file) ! Проверка на ошибку считывания

          ! Считывание величины малости для параметров alpha_1, beta_1, alpha_2 и beta_2
          read( unit = unit, fmt = '(/)' )
          read( unit = unit, fmt = *, iostat = stat ) settings%input_params_err
          if ( stat .ne. 0_SP ) call log_settings_error('WR_input_params_err', file) ! Проверка на ошибку считывания

          ! Считывание ответа на вопрос о показе вывода при определении родов граничных условий
          read( unit = unit, fmt = '(/)' )
          read( unit = unit, fmt = *, iostat = stat ) settings%do_show_bvp_solver_output
          if ( stat .ne. 0_SP ) call log_settings_error('WR_do_show_bvp_solver_output', file) ! Проверка на ошибку считывания

          ! Считывание ответа на вопрос о показе вывода на итерациях метода стрельбы
          read( unit = unit, fmt = '(/)' )
          read( unit = unit, fmt = *, iostat = stat ) settings%do_show_shooting_output
          if ( stat .ne. 0_SP ) call log_settings_error('WR_do_show_shooting_output', file) ! Проверка на ошибку считывания

          ! Считывание значения для первого начального значения при вариации y(l)
          read( unit = unit, fmt = '(/)' )
          read( unit = unit, fmt = *, iostat = stat ) settings%y_l_initial_1
          if ( stat .ne. 0_SP ) call log_settings_error('WR_y_l_initial_1', file) ! Проверка на ошибку считывания

          ! Считывание значения для второго начального значения при вариации y(l)
          read( unit = unit, fmt = '(/)' )
          read( unit = unit, fmt = *, iostat = stat ) settings%y_l_initial_2
          if ( stat .ne. 0_SP ) call log_settings_error('WR_y_l_initial_2', file) ! Проверка на ошибку считывания

          ! Считывание значения для первого начального значения при вариации z(l)
          read( unit = unit, fmt = '(/)' )
          read( unit = unit, fmt = *, iostat = stat ) settings%z_l_initial_1
          if ( stat .ne. 0_SP ) call log_settings_error('WR_z_l_initial_1', file) ! Проверка на ошибку считывания

          ! Считывание значения для второго начального значения при вариации z(l)
          read( unit = unit, fmt = '(/)' )
          read( unit = unit, fmt = *, iostat = stat ) settings%z_l_initial_2
          if ( stat .ne. 0_SP ) call log_settings_error('WR_z_l_initial_2', file) ! Проверка на ошибку считывания

          ! Считывание номера метода для решения краевой задачи
          read( unit = unit, fmt = '(/)' )
          read( unit = unit, fmt = *, iostat = stat ) settings%method_number
          if ( stat .ne. 0_SP ) call log_settings_error('WR_method_number', file) ! Проверка на ошибку считывания

          ! Закрытие файла
          close( unit = unit, iostat = stat )
          if ( stat .ne. 0_SP ) call log_settings_error('WC', file) ! Проверка на ошибку закрытия файла
          
     end procedure read_settings
     
end submodule read_settings_s