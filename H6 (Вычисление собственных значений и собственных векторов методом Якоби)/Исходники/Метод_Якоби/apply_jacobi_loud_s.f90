submodule ( jacobi_m ) apply_jacobi_loud_s ! Подмодуль, содержащий процедуру, реализующую
                                           ! метод Якоби для поиска собственных значений и
                                           ! векторов симметричных матриц
implicit none
     
     contains
     
     ! Процедура, реализующая метод Якоби для поиска
     ! собственных значений и векторов симметричных матриц
     module procedure apply_jacobi_loud

          ! Внедиагональный максимум и его индексы
          type ( max_type ) :: max

          ! Указатель на число строк матрицы
          integer(IP), pointer :: N_pt

          ! Объект, объединяющий число строк матрицы с использующими его разностями
          type ( N_type ) :: N

          ! Указатель на матрицу объекта
          real(RP), dimension(:, :), pointer :: A

          ! Новая матрица объекта
          real(RP), dimension(:, :), allocatable :: NA

          ! Матрица вращения (глобальная)
          real(RP), dimension(:, :), allocatable :: U

          ! Матрица вращения (итерационная)
          real(RP), dimension(:, :), allocatable :: U_k

          ! Угол поворота матрицы вращения
          real(RP) :: phi

          ! Вспомогательные переменные
          integer(JP) :: k ! Счетчик итераций
          real(RP) :: pi   ! Число pi

          ! Вспомогательные строки автоформатирования
          character(FP) :: f1, f2, f3

          ! Вычисление числа pi
          pi = 4._RP * atan(1._RP)

          ! Распаковка объекта
          N_pt => input%get_N()
          A => input%get_matrix()

          ! Конвертация
          N%m0 = int(N_pt, kind = JP)

          ! Вычисление разностей,
          ! использующих число строк матрицы
          
          N%m1 = N%m0 - 1_JP
          N%m2 = N%m0 - 2_JP

          ! Запись числа JP в строку
          write(f1,'(i2)') JP

          ! Запись числа N_JP в строку
          write(f3,'(i'//f1//')') N%m0

          write(*,'(/, 5x, a, /)') 'Исходная матрица:'
          write(*,'('//f3//'(4x, '//RF//'))') A

          ! Проверка, является ли матрица симметричной
          call test_if_the_matrix_is_symmetric(N, A)

          ! Выделение памяти под матрицы вращения
          ! и под новую матрицу объекта
          call allocate(N, U, U_k, NA)

          ! [ Первая итерация с некоторыми изменениями ]

          k = 1_JP
          write(*,'(/, 5x, a, /)') 'k = 1'

          ! Получение внедигонального максимума
          call get_max(N, max, matrix_pointer = A)

          write(*,'(5x, a, /)') 'Внедиагональный максимум:'
          write(*,'(5x, a, '//RF//')') 'Значение:', max%value
          write(*,'(5x, a, 1x, i'//f1//')') 'Номер столбца:', max%i
          write(*,'(5x, a, 2x, i'//f1//', /)') 'Номер строки:', max%j

          ! Вычисление угла поворота матрицы вращения
          call get_phi(max, pi, phi, matrix_pointer = A)

          write(*,'(5x, a, /)') 'Угол поворота матрицы вращения:'
          write(*,'(5x, a, '//RF//', /)') 'Значение:', phi

          ! Получение итерационной матрицы вращения
          call get_rotation_matrix(phi, N, max, U_k)

          ! Обновление глобальной матрицы вращения
          U(1_JP:N%m0, 1_JP:N%m0) = U_k

          write(*,'(5x, a, /)') 'Итерационная матрица вращения:'
          write(*,'('//f3//'(4x, '//RF//'))') U_k
          write(*,'()')

          ! Применение глобальной матрицы вращения
          NA(1_JP:N%m0, 1_JP:N%m0) = matmul(U, matmul(A, transpose(U)))

          write(*,'(5x, a, /)') 'Результат применения глобальной матрицы вращения:'
          write(*,'('//f3//'(4x, '//RF//'))') NA
          write(*,'()')

          ! [ Последующий цикл ]

          do while ( the_matrix_is_not_diagonal(N, NA) )

               ! Увеличение счетчика итераций
               k = k + 1_JP

               ! Запись числа k в строку
               write(f2, '(i'//f1//')') k

               ! Вывод номера итерации
               write(*,'(5x, a, /)') 'k = '//trim(adjustl(f2))

               ! Получение внедигонального максимума
               call get_max(N, max, matrix = NA)

               write(*,'(5x, a, /)') 'Внедиагональный максимум:'
               write(*,'(5x, a, '//RF//')') 'Значение:', max%value
               write(*,'(5x, a, 1x, i'//f1//')') 'Номер столбца:', max%i
               write(*,'(5x, a, 2x, i'//f1//', /)') 'Номер строки:', max%j

               ! Вычисление угла поворота матрицы вращения
               call get_phi(max, pi, phi, matrix = NA)

               write(*,'(5x, a, /)') 'Угол поворота матрицы вращения:'
               write(*,'(5x, a, '//RF//', /)') 'Значение:', phi
     
               ! Получение итерационной матрицы вращения
               call get_rotation_matrix(phi, N, max, U_k)

               write(*,'(5x, a, /)') 'Итерационная матрица вращения:'
               write(*,'('//f3//'(4x, '//RF//'))') U_k
               write(*,'()')
     
               ! Обновление глобальной матрицы вращения
               U(1_JP:N%m0, 1_JP:N%m0) = matmul(U_k, U)

               write(*,'(5x, a, /)') 'Глобальная матрица вращения:'
               write(*,'('//f3//'(4x, '//RF//'))') U
               write(*,'()')

               ! Применение глобальной матрицы вращения
               NA(1_JP:N%m0, 1_JP:N%m0) = matmul(U, matmul(A, transpose(U)))

               write(*,'(5x, a, /)') 'Результат применения глобальной матрицы вращения:'
               write(*,'('//f3//'(4x, '//RF//'))') NA
               write(*,'()')

          enddo

          write(*,'(5x, a, /)') 'Итоговая матрица:'
          write(*,'('//f3//'(4x, '//RF//'))') NA
          write(*,'()')

          ! Отправка результата
          call send_result(N, U, NA, result)

          ! Освобождение памяти из-под матриц вращения
          ! и из-под новой матрицы объекта
          call deallocate(U, U_k, NA)

     end procedure apply_jacobi_loud
     
end submodule apply_jacobi_loud_s