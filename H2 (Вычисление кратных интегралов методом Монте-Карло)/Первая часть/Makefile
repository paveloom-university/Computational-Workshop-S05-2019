
     ## Заглушка на вывод сообщений указанными правилами
     ## (без указания имён подавляет вывод со стороны make-файла у всех правил)
     
     .SILENT : 

     # Настройки компиляции программ
     
     ## Компилятор
     comp := gfortran
     
     ## Расширение исходных файлов
     pattern := f95
     
     ## Режим отладки (при значении true использует флаги opt_debug, при другом значении — opt_production)
     debugging := true
     
     ## Флаги для отладки
     opt_debug := -Og -g -Wall -Wextra -fcheck=all -fbacktrace -pedantic -std=f2008
     
     ## Флаги для финальной сборки
     opt_production := -Ofast
     
     ## Имя главной программы
     main_name := main
     
     ## Использовать input файл?
     use_input := true
     
     ## Сохранять собранную программу при очистке?
     save_main := false
     
     ## Директория с исходниками
     source_path := ./Исходники/
     
     ## Правила-зависимости (при необходимости)
     $(source_path)$(main_name).o : $(source_path)monte.mod
     $(source_path)monte.mod : $(source_path)checkin.mod
     $(source_path)monte.mod : $(source_path)rand.mod
     $(source_path)checkin.mod : $(source_path)rtype.mod
     
     # Определение флагов компилятора
     
     ifeq (true, $(debugging))
          opt := $(opt_debug)
     else
          opt := $(opt_production)
     endif
     
     # Распределение исходных файлов по переменным
     
     allpattern := $(source_path)*.$(pattern)
     anypattern := $(source_path)%.$(pattern)
     source := $(wildcard $(allpattern))
     mod := $(patsubst %.$(pattern), %.mod, $(filter-out %$(main_name).$(pattern), $(source)))
     obj_main := $(patsubst %.$(pattern), %.o, $(filter %$(main_name).$(pattern), $(source)))
     obj_mod := $(patsubst %.mod, %.o, $(mod))
     
     # Блок правил для компиляции объектных файлов
      
     $(main_name) : $(obj_main) $(obj_mod)
	               $(comp) $(opt) $^ -o $@

     $(source_path)%.mod : $(anypattern)
	                      $(comp) -c $(opt) -J $(source_path) $<
	                      if [ "./" != "$(source_path)" ]; then\
	                           mv -f $(patsubst $(source_path)%.mod, %.o, ./$@) $(source_path);\
	                      fi

     $(obj_main) : $(source_path)$(main_name).$(pattern)
	              $(comp) -c $(opt) $< -o $@
	
     # Блок правил для сборки программы
      
     input :
	        touch input
      
     result : $(main_name)
	         if [ "true" = "$(use_input)" ]; then\
	              make input;\
	              time ./$< < input > output;\
	         else\
	              time ./$< > output;\
	         fi
	        
     result-r : 
		      make result
		      cat output
		      
     result-d : 
	           make result
	           make clean
	           
     result-c : 
	           make result-r
	           make clean

     # Блок правил для очистки директории
     
     clean :
	        if [ "true" = "$(save_main)" ]; then\
	             rm -f $(obj_main) $(obj_mod) $(mod);\
	        else\
	             rm -f $(obj_main) $(obj_mod) $(mod) $(main_name);\
	        fi

     clean-all :
	            rm -f *.o *.mod $(main_name) *.eps *.dat result



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
	               make force-change; \
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
	                     make force-change; \
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

     ifeq (git-new-2, $(firstword $(MAKECMDGOALS)))
          new_rep := $(wordlist 2, 2, $(MAKECMDGOALS))
          $(eval $(new_rep):;@#)
     endif

     git-new : 
			make git-clean
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
			  make git-clean
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
			   make git-dev
			   
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
			         make git-dev-ready
	
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
 