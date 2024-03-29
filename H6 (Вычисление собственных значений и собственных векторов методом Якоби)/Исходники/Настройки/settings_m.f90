module settings_m ! Модуль, содержащий тип настроек программы и процедуры,
                  ! связанные с объектами этого типа
use prec_m, only : SP, & ! Точность целого числа статусной переменной
                 & UP, & ! Точность целого числа номера дескриптора файла
                 & LP    ! Число байт для хранения логической переменной
use settings_warns_m, only : log_settings_error ! Процедура для вывода ошибок для 
                                                ! других процедур, связанных с настройками
implicit none
     
     private
     public :: settings_type, & ! Тип, определяющий настройки программы
             & read_settings    ! Процедура для считывания настроек программы
     
     ! Тип, определяющий настройки программы
     type settings_type

          private

          ! Показывать дополнительную информацию?
          logical(LP) :: do_show_info

          contains

          procedure :: get_do_show_info ! Функция для получения ответа на вопрос:
                                        ! показывать дополнительную информацию?

     end type settings_type

     interface
     
          ! Процедура для считывания настроек программы
          module impure elemental subroutine read_settings(settings, file)
          implicit none
          
               type ( settings_type ), intent(out) :: settings ! Настройки программы
               character(*), intent(in) :: file ! Имя файла для считывания
          
          end subroutine read_settings

          ! Функция для получения ответа на вопрос:
          ! показывать дополнительную информацию?
          module pure function get_do_show_info(settings) result(do_show_info)
          implicit none
          
               class ( settings_type ), intent(in) :: settings ! Настройки программы
               logical(LP) :: do_show_info ! Показывать дополнительную информацию?
          
          end function get_do_show_info
     
     end interface
     
end module settings_m
