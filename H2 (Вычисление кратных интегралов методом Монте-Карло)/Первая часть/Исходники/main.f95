program main ! Программа для использования метода Монте-Карло на плоскости
use monte, only : rt, &    ! Тип вещественных чисел, используемых в программе
                & monte_2d ! Процедура, выполняющая метод Монте-Карло на плоскости
implicit none
     
     integer(4) :: N ! Число псевдослучайных чисел, генерируемых программой
     real(rt) :: res ! Результат (площадь фигуры)

     ! Координаты вершин прямоугольника, ограничивающего данную фигуру 
     real(rt) :: x_min, x_max, y_min, y_max

     read(*,'()');  read(*,*) N ! Считывание числа псевдослучайных чисел, генерируемых программой
     read(*,'(/)'); read(*,*) x_min, x_max, y_min, y_max ! Считывание координат

     ! [ Вызов процедура, выполняющей метод Монте-Карло на плоскости ]
     call monte_2d(x_min, x_max, y_min, y_max, N, res)

     ! Прим.: аргументы — координаты прямоугольника, описывающего фигуру.

     ! [ Вывод результата ]
     write(*,'(/, 4x, a, en26.16, /)') 'Результат:', res

end program main