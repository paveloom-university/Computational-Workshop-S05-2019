submodule ( input_m ) get_r_s
implicit none
     
     contains
     
     ! Функция для получения значения
     ! правой границы промежутка
     module procedure get_r
          
          r = input%r
          
     end procedure get_r
     
end submodule get_r_s