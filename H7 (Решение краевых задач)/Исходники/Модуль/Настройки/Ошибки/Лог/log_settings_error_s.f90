submodule ( settings_errors_m ) log_settings_error_s
implicit none

     contains

     ! Процедура для вывода ошибок для других процедур, связанных с настройками
     module procedure log_settings_error
          
          select case (error_code) ! Проверка кода ошибки

               case ('WO') ! Встречается в read_settings_s

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'log_settings_error:', 'Не удалось открыть файл '//file//'&
                                                                             & для чтения.'
                    stop

               case ('WR_do_read_l') ! Встречается read_settings_s

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'log_settings_error:', 'Не удалось считать ответ на&
                                                                             & вопрос о считывании значения&
                                                                             & левой границы промежутка&
                                                                             & из файла '//file//'. Проверьте&
                                                                             & правильность введенных данных.'
                    stop

               case ('WR_do_read_r') ! Встречается read_settings_s

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'log_settings_error:', 'Не удалось считать ответ на&
                                                                             & вопрос о считывании значения&
                                                                             & правой границы промежутка&
                                                                             & из файла '//file//'. Проверьте&
                                                                             & правильность введенных данных.'
                    stop

               case ('WR_do_read_alpha_1') ! Встречается read_settings_s

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'log_settings_error:', 'Не удалось считать ответ на&
                                                                             & вопрос о считывании значения&
                                                                             & параметра alpha_1&
                                                                             & из файла '//file//'. Проверьте&
                                                                             & правильность введенных данных.'
                    stop

               case ('WR_do_read_beta_1') ! Встречается read_settings_s

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'log_settings_error:', 'Не удалось считать ответ на&
                                                                             & вопрос о считывании значения&
                                                                             & параметра beta_1&
                                                                             & из файла '//file//'. Проверьте&
                                                                             & правильность введенных данных.'
                    stop

               case ('WR_do_read_gamma_1') ! Встречается read_settings_s

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'log_settings_error:', 'Не удалось считать ответ на&
                                                                             & вопрос о считывании значения&
                                                                             & параметра gamma_1&
                                                                             & из файла '//file//'. Проверьте&
                                                                             & правильность введенных данных.'
                    stop

               case ('WR_do_read_alpha_2') ! Встречается read_settings_s

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'log_settings_error:', 'Не удалось считать ответ на&
                                                                             & вопрос о считывании значения&
                                                                             & параметра alpha_2&
                                                                             & из файла '//file//'. Проверьте&
                                                                             & правильность введенных данных.'
                    stop

               case ('WR_do_read_beta_2') ! Встречается read_settings_s

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'log_settings_error:', 'Не удалось считать ответ на&
                                                                             & вопрос о считывании значения&
                                                                             & параметра beta_2&
                                                                             & из файла '//file//'. Проверьте&
                                                                             & правильность введенных данных.'
                    stop

               case ('WR_do_read_gamma_2') ! Встречается read_settings_s

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'log_settings_error:', 'Не удалось считать ответ на&
                                                                             & вопрос о считывании значения&
                                                                             & параметра gamma_2&
                                                                             & из файла '//file//'. Проверьте&
                                                                             & правильность введенных данных.'
                    stop

               case ('WR_input_params_err') ! Встречается read_settings_s

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'log_settings_error:', 'Не удалось значение величины малости&
                                                                             & для параметров alpha_1, beta_1, alpha_2 и beta_2&
                                                                             & из файла '//file//'. Проверьте&
                                                                             & правильность введенных данных.'
                    stop

               case ('WR_do_show_bvp_solver_output') ! Встречается read_settings_s

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'log_settings_error:', 'Не удалось считать ответ на&
                                                                             & вопрос о показе вывода при&
                                                                             & определении родов граничных условий&
                                                                             & из файла '//file//'. Проверьте&
                                                                             & правильность введенных данных.'
                    stop

               case ('WR_do_show_shooting_output') ! Встречается read_settings_s

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'log_settings_error:', 'Не удалось считать ответ на&
                                                                             & вопрос о показе вывода на&
                                                                             & итерациях метода стрельбы&
                                                                             & из файла '//file//'. Проверьте&
                                                                             & правильность введенных данных.'
                    stop

               case ('WR_y_l_initial_1') ! Встречается read_settings_s

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'log_settings_error:', 'Не удалось считать значение для&
                                                                             & первого начального значения при&
                                                                             & вариации y(l)&
                                                                             & из файла '//file//'. Проверьте&
                                                                             & правильность введенных данных.'
                    stop

               case ('WR_y_l_initial_2') ! Встречается read_settings_s

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'log_settings_error:', 'Не удалось считать значение для&
                                                                             & второго начального значения при&
                                                                             & вариации y(l)&
                                                                             & из файла '//file//'. Проверьте&
                                                                             & правильность введенных данных.'
                    stop

               case ('WR_z_l_initial_1') ! Встречается read_settings_s

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'log_settings_error:', 'Не удалось считать значение для&
                                                                             & первого начального значения при&
                                                                             & вариации z(l)&
                                                                             & из файла '//file//'. Проверьте&
                                                                             & правильность введенных данных.'
                    stop

               case ('WR_z_l_initial_2') ! Встречается read_settings_s

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'log_settings_error:', 'Не удалось считать значение для&
                                                                             & второго начального значения при&
                                                                             & вариации z(l)&
                                                                             & из файла '//file//'. Проверьте&
                                                                             & правильность введенных данных.'
                    stop

               case ('WR_method_number') ! Встречается read_settings_s

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'log_settings_error:', 'Не удалось считать номер метода&
                                                                             & для решения краевой задачи&
                                                                             & из файла '//file//'. Проверьте&
                                                                             & правильность введенных данных.'
                    stop

               case ('WC') ! Встречается read_settings_s

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'log_settings_error:', 'Не удалось закрыть файл '//file//'&
                                                                             & для чтения.'
                    stop

               case default

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'log_settings_error:', 'Неизвестный код ошибки.'

          end select

     end procedure log_settings_error

end submodule log_settings_error_s