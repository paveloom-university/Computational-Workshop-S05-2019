program main ! Программа, решающая дифференциальное уравнение первого порядка
             ! следующими методами: методом Эйлера, классическим методом
             ! Рунге-Кутты и четырехшаговым методом Адамса-Башфорта
use input, only : input_type, & ! Тип, определяющий входные данные
                & read ! Процедура для считывания начальных данных
use result, only : result_type, & ! Тип, определяющий результат
                 & allocate,    & ! Процедура, выделяющая память под результат
                 & deallocate,  & ! Процедура, освобождающая память из-под результата
                 & write          ! Процедура, выводящая результат
use euler, only : solve_euler ! Процедура, решающая дифференциальное уравнение
                              ! первого порядка методом Эйлера
use runge_kutta, only : solve_runge_kutta ! Процедура, решающая дифференциальное уравнение
                                          ! первого порядка классическим методом Рунге-Кутты
use adams, only : solve_adams_bashforth_o4 ! Процедура, решающая дифференциальное уравнение
                                           ! первого порядка четырехшаговым методом Адамса-Башфорта
implicit none
     
     type ( input_type ) input ! Входные данные
     type ( result_type ) result ! Результат

     call read(input) ! [ Считывание входящих данных ]

     call allocate(result, input) ! [ Выделение памяти под результат ]

     call solve_euler(input, result) ! [ Решение по методу Эйлера ]
     call write(result) ! [ Вывод результата ]

     call solve_runge_kutta(input, result) ! [ Решение по классическому методу Рунге-Кутты ]
     call write(result) ! [ Вывод результата ]

     call solve_adams_bashforth_o4(input, result) ! [ Решение по четырехшаговому методу Адамса-Башфорта ]
     call write(result) ! [ Вывод результата ]

     call deallocate(result) ! [ Освобождение памяти из-под результата ]

end program main