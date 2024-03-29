module prec_m ! Модуль с параметрами, указывающими точность вещественных и
              ! целых чисел, используемых в программе, а также соответствующие форматы;
              ! также здесь содержатся точности для статусных переменных и номера дескриптора файла
implicit none

     private
     public :: RP, & ! Точность вещественных чисел, используемых в программе
             & IP, & ! Точность целых чисел, используемых в программе
             & RF, & ! Формат вывода вещественных чисел
             & SP, & ! Точность целого числа статусной переменной
             & UP    ! Точность целого числа номера дескриптора файла

     ! Точность вещественных чисел, используемых в программе
     integer(1), parameter :: RP = kind(1.d0)

     ! Точность целых чисел, используемых в программе
     integer(1), parameter :: IP = kind(1_4)

     ! Формат вывода вещественных чисел
     character(*), parameter :: RF = 'e26.15'

     ! Точность целого числа статусной переменной
     integer(1), parameter :: SP = kind(1_1)

     ! Точность целого числа номера дескриптора файла
     integer(1), parameter :: UP = kind(1_1)

end module prec_m