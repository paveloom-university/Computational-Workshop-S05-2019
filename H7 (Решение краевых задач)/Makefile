
     ## Подробное описание шаблона данного make-файла можно найти
     ## на Wiki-страничках репозитория по адресу https://github.com/Paveloom/B1

     ## Для корректного отображения содержимого рекомендуется использовать
     ## текстовые редакторы gedit или Visual Studio Code.

     # Настройки make-файла

	## Имя координатора
     make_name := make

     ## Заглушка на вывод сообщений указанными правилами
     ## (без указания имён подавляет вывод со стороны make-файла у всех правил)
     
     .SILENT : 

     ## Правила-псевдоцели

     .PHONY : result, result-r, result-d, result-c, clean, \
	         git, git-am, git-dev, git-dev-ready, git-new, git-new-2, \
		    git-dev-re, git-dev-ready-re, force_change, git-clean

     ## Правило, выполняющееся при вызове координатора без аргументов
     ALL : result

     # Настройки компиляции программ
     
     ## Компилятор
     comp := gfortran-9

	## Флаг для указания директории для хранения .mod файлов
     module_flag := -J
     
     ## Расширение исходных файлов
     pattern := f90
     
     ## Режим отладки (при значении true использует флаги opt_debug, при другом значении — opt_production)
     debugging := false
     
     ## Флаги для отладки
     opt_debug := -Og -g -Wall -Wextra -Warray-temporaries -Wcharacter-truncation -Wconversion-extra \
	             -Wimplicit-interface -Wimplicit-procedure -Wintrinsics-std \
                  -Wreal-q-constant -Wsurprising -Wunderflow -Wuse-without-only -Walign-commons \
			   -Wfunction-elimination -Wrealloc-lhs -Wrealloc-lhs-all \
                  -fbacktrace -ffree-line-length-0 -fcheck=all \
			   -ffpe-trap=invalid,zero,overflow,underflow -pedantic-errors -std=f2008
     
     ## Флаги для финальной сборки
     opt_production := -ffree-line-length-0 -Ofast
     
     ## Имя главной программы
     main_name := main
     
     ## Использовать input файл?
     use_input := false

	## Использовать output файл?
     use_output := false
     
     ## Сохранять собранную программу при очистке?
     save_main := false
     
     ## Директория с исходными файлами (всегда в окончании прямой слеш; точка-слеш, если хранить в текущей директории)
     source_path := Исходники/

     ## Указание поддиректорий в директории с исходными файлами (всегда в окончании прямой слеш)
     
     bvp_subs := Входные_данные/ Входные_данные/Ошибки/ Входные_данные/Ошибки/Лог/ Входные_данные/Функции/ \
		   	  Входные_данные/Считывание/ Входные_данные/Получение/ Входные_данные/Присваивание/ \
		   	  Настройки/ Настройки/Ошибки/ Настройки/Ошибки/Лог/ \
		   	  Настройки/Считывание/ Настройки/Получение/ Настройки/Присваивание/ \
		   	  Считывание/ \
			  Результат/ Результат/Ошибки/ Результат/Ошибки/Лог/ \
                 Результат/Получение/ Результат/Выделение/ Результат/Освобождение/ Результат/Вывод/ \
                 Решение/ Решение/Ошибки/ Решение/Ошибки/Лог/ \
                 Решение/Род/ Решение/Стрельба/ Решение/Стрельба/Выбор/ Решение/Стрельба/Рунге-Кутта/ \
                 Решение/Стрельба/Варьирование/Громко/ Решение/Стрельба/Варьирование/Тихо/ \
                 Решение/Прогонка/ Решение/Прогонка/Процедура/

     subs := Прослойка/ \
             Модуль/ $(addprefix Модуль/, $(bvp_subs))

     ## Имя скрипта для функций p, q, f
     add_sub := functions

     ## Путь к модулю для функций p, q, f
     add_sub_path := Исходники/Модуль/Входные_данные/Функции/

     ## Путь к скрипту для функций p, q, f
     add_sub_script_path := Исходники/Скрипт/

     ## Директория с объектными файлами (всегда в окончании прямой слеш; точка-слеш, если хранить в текущей директории)
     obj_path := Объектники/
     
     ## Правила-зависимости (при необходимости)

     $(obj_path)$(main_name).o : $(obj_path)bvp.o

          # Зависимости для модуля bvp

     	$(obj_path)bvp.o : $(obj_path)prec_m.o $(obj_path)input_m.o $(obj_path)settings_m.o \
                             $(obj_path)read_m.o $(obj_path)result_m.o $(obj_path)bvp_solver_m.o

               $(obj_path)input_m.o : $(obj_path)prec_m.o $(obj_path)settings_m.o $(obj_path)input_errors_m.o \
                                      $(obj_path)$(add_sub)_m.o

                    $(obj_path)read_input_s.o : $(obj_path)input_m.o

                    $(obj_path)get_l_s.o : $(obj_path)input_m.o

                    $(obj_path)get_r_pt_s.o : $(obj_path)input_m.o
                    $(obj_path)get_l_pt_s.o : $(obj_path)input_m.o

                    $(obj_path)get_n_pt_s.o : $(obj_path)input_m.o

                    $(obj_path)get_beta_1_s.o : $(obj_path)input_m.o
                    $(obj_path)get_gamma_1_s.o : $(obj_path)input_m.o

                    $(obj_path)get_alpha_1_pt_s.o : $(obj_path)input_m.o
                    $(obj_path)get_beta_1_pt_s.o : $(obj_path)input_m.o
                    $(obj_path)get_gamma_1_pt_s.o : $(obj_path)input_m.o

                    $(obj_path)get_alpha_2_pt_s.o : $(obj_path)input_m.o
                    $(obj_path)get_beta_2_pt_s.o : $(obj_path)input_m.o
                    $(obj_path)get_gamma_2_pt_s.o : $(obj_path)input_m.o

                    $(obj_path)put_l_s.o : $(obj_path)input_m.o
                    $(obj_path)put_r_s.o : $(obj_path)input_m.o

                    $(obj_path)put_alpha_1_s.o : $(obj_path)input_m.o
                    $(obj_path)put_beta_1_s.o : $(obj_path)input_m.o
                    $(obj_path)put_gamma_1_s.o : $(obj_path)input_m.o

                    $(obj_path)put_alpha_2_s.o : $(obj_path)input_m.o
                    $(obj_path)put_beta_2_s.o : $(obj_path)input_m.o
                    $(obj_path)put_gamma_2_s.o : $(obj_path)input_m.o

                         $(obj_path)log_input_error_s.o : $(obj_path)input_errors_m.o

                    $(obj_path)$(add_sub)_m.o : $(obj_path)prec_m.o

               $(obj_path)settings_m.o : $(obj_path)prec_m.o $(obj_path)settings_errors_m.o

                    $(obj_path)read_settings_s.o : $(obj_path)settings_m.o

                    $(obj_path)get_do_read_l_s.o : $(obj_path)settings_m.o
                    $(obj_path)get_do_read_r_s.o : $(obj_path)settings_m.o

                    $(obj_path)get_do_read_alpha_1_s.o : $(obj_path)settings_m.o
                    $(obj_path)get_do_read_beta_1_s.o : $(obj_path)settings_m.o
                    $(obj_path)get_do_read_gamma_1_s.o : $(obj_path)settings_m.o

                    $(obj_path)get_do_read_alpha_2_s.o : $(obj_path)settings_m.o
                    $(obj_path)get_do_read_beta_2_s.o : $(obj_path)settings_m.o
                    $(obj_path)get_do_read_gamma_2_s.o : $(obj_path)settings_m.o

                    $(obj_path)get_input_params_err_s.o : $(obj_path)settings_m.o
     			$(obj_path)get_do_show_bvp_solver_output_s.o : $(obj_path)settings_m.o

                    $(obj_path)get_y_l_initial_1_s.o : $(obj_path)settings_m.o
                    $(obj_path)get_y_l_initial_2_s.o : $(obj_path)settings_m.o

                    $(obj_path)get_z_l_initial_1_s.o : $(obj_path)settings_m.o
                    $(obj_path)get_z_l_initial_2_s.o : $(obj_path)settings_m.o

                    $(obj_path)get_method_number_s.o : $(obj_path)settings_m.o

                         $(obj_path)log_settings_error_s.o : $(obj_path)settings_errors_m.o

     		$(obj_path)result_m.o : $(obj_path)prec_m.o $(obj_path)input_m.o $(obj_path)settings_m.o \
                                       $(obj_path)result_errors_m.o

                    $(obj_path)allocate_result_s.o : $(obj_path)result_m.o

     			$(obj_path)get_x_pt_s.o : $(obj_path)result_m.o
     			$(obj_path)get_y_pt_s.o : $(obj_path)result_m.o
     			$(obj_path)get_z_pt_s.o : $(obj_path)result_m.o

                    $(obj_path)put_method_number_result_s : $(obj_path)result_m.o
                    $(obj_path)get_method_number_result_s : $(obj_path)result_m.o

                    $(obj_path)write_s.o : $(obj_path)result_m.o

                    $(obj_path)deallocate_result_s.o : $(obj_path)result_m.o

                         $(obj_path)log_result_error_s.o : $(obj_path)result_errors_m.o

               $(obj_path)bvp_solver_m.o : $(obj_path)prec_m.o $(obj_path)input_m.o $(obj_path)settings_m.o \
                                           $(obj_path)result_m.o $(obj_path)bvp_errors_m.o \
                                           $(obj_path)solve_bvp_shooting_m.o $(obj_path)solve_bvp_tma_m.o

                    $(obj_path)solve_bvp_s.o : $(obj_path)bvp_solver_m.o
                    $(obj_path)solve_bvp_loud_s.o : $(obj_path)bvp_solver_m.o
                    $(obj_path)solve_bvp_quiet_s.o : $(obj_path)bvp_solver_m.o

                         $(obj_path)log_bvp_error_s.o : $(obj_path)bvp_errors_m.o

                    $(obj_path)solve_bvp_shooting_m.o : $(obj_path)prec_m.o $(obj_path)input_m.o $(obj_path)settings_m.o \
                                                        $(obj_path)result_m.o

                         $(obj_path)solve_bvp_shooting_choosing_s.o : $(obj_path)solve_bvp_shooting_m.o
     				$(obj_path)runge_kutta_s.o : $(obj_path)solve_bvp_shooting_m.o

                         $(obj_path)solve_bvp_shooting_LB1_and_RB1_loud_s.o : $(obj_path)solve_bvp_shooting_m.o
                         $(obj_path)solve_bvp_shooting_LB1_and_RB2_loud_s.o : $(obj_path)solve_bvp_shooting_m.o
                         $(obj_path)solve_bvp_shooting_LB1_and_RB3_loud_s.o : $(obj_path)solve_bvp_shooting_m.o
                         
                         $(obj_path)solve_bvp_shooting_LB2_and_RB1_loud_s.o : $(obj_path)solve_bvp_shooting_m.o
                         $(obj_path)solve_bvp_shooting_LB2_and_RB2_loud_s.o : $(obj_path)solve_bvp_shooting_m.o
                         $(obj_path)solve_bvp_shooting_LB2_and_RB3_loud_s.o : $(obj_path)solve_bvp_shooting_m.o

                         $(obj_path)solve_bvp_shooting_LB3_and_RB1_loud_s.o : $(obj_path)solve_bvp_shooting_m.o
                         $(obj_path)solve_bvp_shooting_LB3_and_RB2_loud_s.o : $(obj_path)solve_bvp_shooting_m.o
                         $(obj_path)solve_bvp_shooting_LB3_and_RB3_loud_s.o : $(obj_path)solve_bvp_shooting_m.o

                         $(obj_path)solve_bvp_shooting_LB1_and_RB1_quiet_s.o : $(obj_path)solve_bvp_shooting_m.o
                         $(obj_path)solve_bvp_shooting_LB1_and_RB2_quiet_s.o : $(obj_path)solve_bvp_shooting_m.o
                         $(obj_path)solve_bvp_shooting_LB1_and_RB3_quiet_s.o : $(obj_path)solve_bvp_shooting_m.o

                         $(obj_path)solve_bvp_shooting_LB2_and_RB1_quiet_s.o : $(obj_path)solve_bvp_shooting_m.o
                         $(obj_path)solve_bvp_shooting_LB2_and_RB2_quiet_s.o : $(obj_path)solve_bvp_shooting_m.o
                         $(obj_path)solve_bvp_shooting_LB2_and_RB3_quiet_s.o : $(obj_path)solve_bvp_shooting_m.o

                         $(obj_path)solve_bvp_shooting_LB3_and_RB1_quiet_s.o : $(obj_path)solve_bvp_shooting_m.o
                         $(obj_path)solve_bvp_shooting_LB3_and_RB2_quiet_s.o : $(obj_path)solve_bvp_shooting_m.o
                         $(obj_path)solve_bvp_shooting_LB3_and_RB3_quiet_s.o : $(obj_path)solve_bvp_shooting_m.o

                    $(obj_path)solve_bvp_tma_m.o : $(obj_path)prec_m.o $(obj_path)input_m.o $(obj_path)settings_m.o \
                                                   $(obj_path)result_m.o

                         $(obj_path)solve_bvp_tma_s.o : $(obj_path)solve_bvp_tma_m.o
     
     # Определение флагов компилятора
     
     ifeq (true, $(debugging))
          opt := $(opt_debug)
     else
          opt := $(opt_production)
     endif
     
     # Распределение исходных файлов по переменным

     ## Директории, где искать исходные файлы
     VPATH := $(source_path) $(addprefix $(source_path), $(subs))
     
	## Получение полного списка исходных файлов

     allpattern := $(addsuffix *.$(pattern), $(VPATH))
     source := $(wildcard $(allpattern))

     main_source := $(filter %$(main_name).$(pattern), $(source))

     ## Смена пути исходных файлов

     obj_path_source := $(addprefix $(obj_path), $(notdir $(source)))

	## Получение списка .mod файлов и .o файлов, связанных с модулями. Объектный
	## файл для главной программы записан в переменную obj_main для сохранения
	## общности семантики. 
	
     mod := $(filter-out %$(main_name).mod, $(patsubst %.$(pattern), %.mod, $(obj_path_source)))
     obj_mod := $(patsubst %.mod, %.o, $(mod))

     obj_main := $(patsubst %.$(pattern), %.o, $(filter %$(main_name).$(pattern), $(obj_path_source)))
     
     # Блок правил для компиляции объектных файлов
      
     $(main_name) : $(obj_main) $(obj_mod)
	               $(comp) $(opt) $^ -o $@

     $(obj_path)%.o : %.$(pattern)
	                 $(comp) -c $(opt) $(module_flag) $(obj_path) $< -o $(addprefix $(obj_path), $(subst .$(pattern),.o, $(notdir $<)))

     $(obj_main) : $(main_source)
	              $(comp) -c $(opt) $(module_flag) $(obj_path) $< -o $(addprefix $(obj_path), $(notdir $@))

	# Правило для обновления содержимого модуля с функциями p, q, f

     $(add_sub_path)$(add_sub).$(pattern) : $(add_sub)
	                                      sh $(add_sub_script_path)$(add_sub).sh
	
     # Блок правил для сборки программы
      
     input :
	        touch input

     result : $(add_sub_path)$(add_sub).$(pattern) $(main_name)

	         if [ "true" = "$(use_input)" ]; then\
	              $(make_name) input;\
			    if [ "true" = "$(use_output)" ]; then\
	                   time ./$(word 2, $^) < input > output;\
			    else\
			         time ./$(word 2, $^) < input;\
			    fi\
	         else\
		         if [ "true" = "$(use_output)" ]; then\
	                   time ./$(word 2, $^) > output;\
			    else\
			         time ./$(word 2, $^);\
			    fi\
	         fi
	        
     result-r : 
	           if [ "true" != "$(use_output)" ]; then\
			      echo; echo "Вы не можете использовать это правило, пока значение переменной use_output != true."; echo;\
				 exit 1;\
			 fi
		      $(make_name) result
		      cat output
		      
     result-d : 
	           $(make_name) result
	           $(make_name) clean
	           
     result-c : 
	           if [ "true" != "$(use_output)" ]; then\
			      echo; echo "Вы не можете использовать это правило, пока значение переменной use_output != true."; echo;\
				 exit 1;\
			 fi
	           $(make_name) result-r
	           $(make_name) clean

     # Блок правил для очистки директории
     
     clean :
	        if [ "true" = "$(save_main)" ]; then\
	             rm -f $(obj_main) $(obj_mod) $(mod) $(obj_path)*.smod ;\
	        else\
	             rm -f $(obj_main) $(obj_mod) $(mod) $(obj_path)*.smod $(main_name);\
	        fi



     # Блок правил для разработки и публикации кода на Github
     
     ## Имя пользователя на GitHub
     username := Paveloom
     
     ## Форсировать изменения в текущей версии? (см. Сценарии использования для правил git-dev
     ## и git-dev-ready; см. действия, выполняемые при значении true, в правиле force-change)
     force-changes := true
		
	## Правило для создания и публикации коммита

     git : 
		 git add -A
		 git commit -e
		 git push
		 
     ## Правило для обновления последнего коммита до текущего состояния локального репозитория
		 
     git-am : 
	         git add -A
	         git commit --amend
	         git push --force-with-lease
	         
	## Правило для обновления ветки master до текущего состояния ветки dev
	## (слияние без создания коммита слияния; способ через создание второстепенной ветки feature)
			
     git-dev : 
	          if [ "true" = "$(force-changes)" ]; then \
	               git checkout dev; \
	               $(make_name) force-change; \
	               git add -A; \
	               git commit --amend --no-edit; \
	               git push --force-with-lease; \
	          fi
     
			git checkout master
			git checkout -b feature
			git merge --squash dev -Xtheirs
			git commit
			git checkout master
			git merge feature
			git branch -D feature
			git push --force-with-lease
			git checkout dev
			
	## Правило для обновления ветки dev до текущего состояния ветки master
	## (аналогично правилу git-dev, только в обратную сторону; разумно использовать, только
	## если были проделаны изменения на ветке master после последнего слияния)
	
     git-dev-ready : 
	                if [ "true" = "$(force-changes)" ]; then \
	                     git checkout master; \
	                     $(make_name) force-change; \
	                     git add -A; \
	                     git commit --amend --no-edit; \
	                     git push --force-with-lease; \
	                fi

	                git checkout dev
	                git checkout -b dev-upd
	                git merge --squash master -Xtheirs
	                git commit
	                git checkout dev
	                git merge dev-upd
	                git branch -D dev-upd
	                git push --force-with-lease

     ## Правило для подключения удалённого репозитория с одной веткой и
     ## загрузки в него стартового make-файла (см. Правила)

     ifeq (git-new, $(firstword $(MAKECMDGOALS)))
          new_rep := $(wordlist 2, 2, $(MAKECMDGOALS))
          $(eval $(new_rep):;@#)
     endif

     git-new : 
			$(make_name) git-clean
			git init
			git remote add origin git@github.com:$(username)/$(new_rep).git
			git add Makefile
			git commit -m "Стартовый коммит."
			git push -u origin master
			
     ## Правило для подключения нового удалённого репозитория с двумя ветками и
     ## загрузки в него стартового make-файла (см. Правила)

     ifeq (git-new-2, $(firstword $(MAKECMDGOALS)))
          new_rep := $(wordlist 2, 2, $(MAKECMDGOALS))
          $(eval $(new_rep):;@#)
     endif

     git-new-2 : 
			  $(make_name) git-clean
			  git init
			  git remote add origin git@github.com:$(username)/$(new_rep).git
			  git add Makefile
			  git commit -m "Стартовый коммит."
			  git push -u origin master
			  git checkout -b dev
			  git push -u origin dev
			
	## Правило для повторения последнего переноса изменений из ветки dev в ветку master
	## (используется reset --hard, поэтому следует использовать только при уверенности в
	## правильности своих действий — поэтому задаётся вопрос)
	
     git-dev-re :
			   echo
			   echo "Будет использован reset --hard. Убедитесь, что последний коммит в ветке master получен переносом изменений из ветки dev."
			   echo "Скопируйте, если необходимо, сообщение последнего коммита на ветке master:"
			   echo
			   
			   git log master -1 --pretty=format:%s; echo
			   git log master -1 --pretty=format:%b; echo
			   
			   while [ -z "$$CONTINUE" ]; do \
	                  read -r -p "Продолжить? [y]: " CONTINUE; \
	             done ; \
	             [ $$CONTINUE = "y" ] || [ $$CONTINUE = "Y" ] || (echo; echo "Отменено."; echo; exit 1;)
	             
	             echo
			   git checkout master
			   git reset --hard HEAD~1
			   $(make_name) git-dev
			   
	## Правило для повторения последнего переноса изменений из ветки master в ветку dev
	## (используется reset --hard, поэтому следует использовать только при уверенности в
	## правильности своих действий — поэтому задаётся вопрос)
	
     git-dev-ready-re :
			         echo
			         echo "Будет использован reset --hard. Убедитесь, что последний коммит в ветке dev получен переносом изменений из ветки master."
			         echo "Скопируйте, если необходимо, сообщение последнего коммита на ветке dev:"
			         echo
			         
			         git log dev -1 --pretty=format:%s; echo
			         git log dev -1 --pretty=format:%b; echo
			         
			         while [ -z "$$CONTINUE" ]; do \
	                        read -r -p "Продолжить? [y]: " CONTINUE; \
	                   done ; \
	                   [ $$CONTINUE = "y" ] || [ $$CONTINUE = "Y" ] || (echo; echo "Отменено."; echo; exit 1;)
	             
	                   echo
			         git checkout dev
			         git reset --hard HEAD~1
			         $(make_name) git-dev-ready
	
     ## Правило для форсирования изменений (добавляет / удаляет пробелы в последней пустой строке;
     ## создает пустую строку, если необходимо; использование зависит от переменной force-changes)
     
     force-change : 
	               if tail Makefile -n 1 | grep '[[:alpha:]]'; then \
	                    echo "$f" >> Makefile; \
	               else \
	                    if tail Makefile -n 1 | grep ' [[:space:]]'; then \
	                         truncate -s-1 Makefile; \
	                    else \
	                         truncate -s-1 Makefile; \
	                         echo "$f " >> Makefile; \
	                    fi \
	               fi
	
     ## Правило для удаления репозитория в текущей директории
     
     git-clean : 
		       rm -rf .git
 
