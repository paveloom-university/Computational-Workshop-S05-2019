submodule ( result_m ) allocate_result_s
implicit none
     
     contains
     
     ! Процедура для выделения памяти под массивы результата
     module procedure allocate_result
          
          integer(SP) :: stat ! Статусная переменная
          integer(IP), pointer :: n_pt ! Указатель на число разбиений промежутка

          ! Получение указателя на число разбиений промежутка
          n_pt => input%get_n_pt()

          allocate( result%x(0:n_pt), stat = stat ) ! Выделение памяти под массив x объекта
          if ( stat .ne. 0_SP ) call log_result_error('WA_x') ! Проверка на ошибку выделения памяти

          allocate( result%y(0:n_pt), stat = stat ) ! Выделение памяти под массив y объекта
          if ( stat .ne. 0_SP ) call log_result_error('WA_y') ! Проверка на ошибку выделения памяти

          if ( settings%get_method_number() .eq. 1_IP ) then

               allocate( result%z(0:n_pt), stat = stat ) ! Выделение памяти под массив z объекта
               if ( stat .ne. 0_SP ) call log_result_error('WA_z') ! Проверка на ошибку выделения памяти

          endif
          
     end procedure allocate_result
     
end submodule allocate_result_s