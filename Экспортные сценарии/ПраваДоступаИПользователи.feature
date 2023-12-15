#language: ru

@ExportScenarios
@IgnoreOnCIMainBuild

Функционал: Экспортные сценарии для настройки пользователей и прав доступа

Сценарий: Я создаю профиль с именем 'TheName' на основании профиля 'TheProfile'

	* Открываем список
		Если '$$IsERPCPM$$' Тогда
			И В командном интерфейсе я выбираю "Master data and адмandнandстрandрованandе" "Users and rights settings"
		Иначе			
			И В командном интерфейсе я выбираю "Administration" "Users and rights settings"
		Тогда открылось окно "Users and rights settings"
		И я нажимаю на кнопку с именем 'OpenAccessGroupsProfiles'

	* Удаляем существующий профиль
		И Я в списке "Access group profiles" по полю "Description" ищу элемент '[TheName]' "Exact match"
		И Пока в таблице 'List' количество строк 'больше' 0 Тогда
			* Ставим пометку на удаление	
				И Я удаляю текущую строку в списке 'List'
			* Переименовываем
				И Я запоминаю значение выражения 'StrReplace(New UUID, "-", "")' в переменную 'UID'
				И в таблице 'List' я выбираю текущую строку
				Тогда открылось окно "* (Access group profile)"
				И в поле с именем 'Description' я ввожу значение переменной 'UID'
				И я нажимаю на кнопку с именем 'FormWriteAndClose'
				И я жду закрытия окна "* (Access group profile) *" в течение 20 секунд

	* Ищем предопределенный профиль
		Тогда открылось окно "Access group profiles"
		И я выбираю пункт контекстного меню с именем 'ListContextMenuFind' на элементе формы с именем 'List'				
		Тогда открылась форма с именем 'UniversalListFindExtForm'
		И из выпадающего списка с именем 'FieldSelector' я выбираю точное значение "Description"
		И в поле с именем 'Pattern' я ввожу текст '[TheProfile]'
		И я нажимаю на кнопку с именем 'Find'
		Тогда открылось окно "Access group profiles"
		И в таблице 'List' количество строк 'равно' 1

	* Копируем профиль
		И я выбираю пункт контекстного меню с именем 'ListContextMenuCopy' на элементе формы с именем "List"
		Тогда открылось окно "Access group profile (create)"
		И в поле с именем 'Description' я ввожу текст '[TheName]'
		И я нажимаю на кнопку с именем 'FormWrite'	
	
	* Закрываем окна
		Тогда открылось окно "[TheName] (Access group profile)"	
		И я закрываю окно "[TheName] (Access group profile)"
		Тогда открылось окно "Access group profiles"
		И Я закрываю окно "Access group profiles"	

Сценарий: Я добавляю в профиль 'TheProfile' ограничение доступа с видом 'TheType' значением	'TheValue'

	* Открываем список
		Если '$$IsERPCPM$$' Тогда
			И В командном интерфейсе я выбираю "Master data and адмandнandстрandрованandе" "Users and rights settings"
		Иначе			
			И В командном интерфейсе я выбираю "Administration" "Users and rights settings"
		Тогда открылось окно "Users and rights settings"
		И я нажимаю на кнопку с именем 'OpenAccessGroupsProfiles'

	* Ищем существующий профиль
		И Я в списке "Access group profiles" по полю "Description" ищу элемент '[TheProfile]' "Exact match"
		И в таблице 'List' количество строк 'равно' 1
		И в таблице 'List' я выбираю текущую строку

	* Удаляем вид доступа если он уже задан
		Тогда открылось окно "[TheProfile] (Access group profile)"
		И я перехожу к закладке с именем 'AccessKindsAndValues'
		И Я запоминаю значение выражения '[TheType]' в переменную 'CurrentType'
		Если в таблице 'AccessKinds' есть строка Тогда
			| "Access kind"  |
			| '$CurrentType$' |
			И в таблице 'AccessKinds' я перехожу к строке
				| "Access kind" |
				| '$CurrentType$' |
			И я выбираю пункт контекстного меню с именем 'AccessKindsContextMenuDelete' на элементе формы с именем 'AccessKinds'
						
	* Добавляем ограничение доступа		
		И в таблице 'AccessKinds' я нажимаю на кнопку с именем 'AccessKindsAdd'
		И в таблице 'AccessKinds' из выпадающего списка с именем 'AccessKindsAccessTypePresentation' я выбираю точное значение '[TheType]'
		И я перехожу к следующему реквизиту
		И в таблице 'AccessKinds' из выпадающего списка с именем 'AccessKindsAllAllowedPresentation' я выбираю точное значение '[TheValue]'
		И в таблице 'AccessKinds' я завершаю редактирование строки
		И я делаю 5 раз
			И в таблице 'AccessKinds' я нажимаю на кнопку с именем 'AccessKindsMoveUp'

	* Записываем элемент
		Когда открылось окно "[TheProfile] (Access group profile) *"		
		И я нажимаю на кнопку с именем 'FormWriteAndClose'		
		Тогда открылось окно "1C:Enterprise"
		И я нажимаю на кнопку с именем 'Button0'
		И я жду закрытия окна "[TheProfile] (Access group profile) *" в течение 20 секунд
		Тогда открылось окно "Access group profiles"
		И Я закрываю окно "Access group profiles"

Сценарий: Я добавляю в профиль 'TheProfile' роль 'TheRole'

	* Открываем список
		Если '$$IsERPCPM$$' Тогда
			И В командном интерфейсе я выбираю "Master data and адмandнandстрandрованandе" "Users and rights settings"
		Иначе			
			И В командном интерфейсе я выбираю "Administration" "Users and rights settings"
		Тогда открылось окно "Users and rights settings"
		И я нажимаю на кнопку с именем 'OpenAccessGroupsProfiles'

	* Ищем существующий профиль
		И Я в списке "Access group profiles" по полю "Description" ищу элемент '[TheProfile]' "Exact match"
		И в таблице 'List' количество строк 'равно' 1
		И в таблице 'List' я выбираю текущую строку

	* Добавляем роль
		Тогда открылось окно "[TheProfile] (Access group profile)"
		И в таблице 'Roles' я нажимаю на кнопку с именем 'RolesShowSelectedRolesOnly'
		
	* Ищем существующую роль
		И в таблице 'Roles' я нажимаю на кнопку с именем 'RolesFind'
		Тогда открылось окно "Find"
		И из выпадающего списка с именем "FieldSelector" я выбираю точное значение 'Check, Разрешенное действие (роль)'
		И я меняю значение переключателя с именем 'CompareType' на 'On точному совпадению'
		И в поле с именем 'Pattern' я ввожу текст '[TheRole]'
		И я нажимаю на кнопку с именем 'Find'
		И в таблице 'Roles' количество строк 'равно' 1
		И в таблице 'Roles' я выбираю текущую строку

	* Устанавливаем флаг роли
		И в таблице 'Roles' я устанавливаю флаг с именем 'RolesCheck'
		И в таблице 'Roles' я завершаю редактирование строки

	* Записываем элемент
		И я нажимаю на кнопку с именем 'FormWriteAndClose'
		И я жду закрытия окна "[TheProfile] (Access group profile) *" в течение 20 секунд
		И Я закрываю окно "Access group profiles"
		Тогда открылось окно "Users and rights settings"
		И Я закрываю окно "Users and rights settings"

Сценарий: Я удаляю из профиля 'TheProfile' роль 'TheRole'

	* Открываем список
		Если '$$IsERPCPM$$' Тогда
			И В командном интерфейсе я выбираю "Master data and адмandнandстрandрованandе" "Users and rights settings"
		Иначе			
			И В командном интерфейсе я выбираю "Administration" "Users and rights settings"
		Тогда открылось окно "Users and rights settings"
		И я нажимаю на кнопку с именем 'OpenAccessGroupsProfiles'

	* Ищем существующий профиль
		И Я в списке "Access group profiles" по полю "Description" ищу элемент '[TheProfile]' "Exact match"
		И в таблице 'List' количество строк 'равно' 1
		И в таблице 'List' я выбираю текущую строку

	* Удаляем роль
		Тогда открылось окно "[TheProfile] (Access group profile)"
		И в таблице 'Roles' я нажимаю на кнопку с именем 'RolesShowSelectedRolesOnly'
		
	* Ищем существующую роль
		И в таблице 'Roles' я нажимаю на кнопку с именем 'RolesFind'
		Тогда открылось окно "Find"
		И из выпадающего списка с именем "FieldSelector" я выбираю точное значение 'Check, Разрешенное действие (роль)'
		И я меняю значение переключателя с именем 'CompareType' на 'On точному совпадению'
		И в поле с именем 'Pattern' я ввожу текст '[TheRole]'
		И я нажимаю на кнопку с именем 'Find'
		И в таблице 'Roles' количество строк 'равно' 1
		И в таблице 'Roles' я выбираю текущую строку

	* Устанавливаем флаг роли
		И в таблице 'Roles' я снимаю флаг с именем 'RolesCheck'
		И в таблице 'Roles' я завершаю редактирование строки

	* Записываем элемент
		И я нажимаю на кнопку с именем 'FormWriteAndClose'
		И я жду закрытия окна "[TheProfile] (Access group profile) *" в течение 20 секунд
		И Я закрываю окно "Access group profiles"
		Тогда открылось окно "Users and rights settings"
		И Я закрываю окно "Users and rights settings"

Сценарий: Я создаю группу доступа с именем 'TheName' по профилю 'TheProfile'

	* Открываем список
		Если '$$IsERPCPM$$' Тогда
			И В командном интерфейсе я выбираю "Master data and адмandнandстрandрованandе" "Users and rights settings"
		Иначе			
			И В командном интерфейсе я выбираю "Administration" "Users and rights settings"
		Тогда открылось окно "Users and rights settings"
		И я нажимаю на кнопку с именем 'OpenAccessGroups'

	И Я в списке "Access groups" по полю "Description" ищу элемент '[TheProfile]' "Exact match"	

	Если '"[TheName]" = "Opening внешних Reports_ и обработок" OR "[TheName]" = "Open external reports and data processors"' Тогда

		* Проверяем, что у гурппы доступа правильный профиль
			И в таблице 'List' количество строк 'равно' 1
			И в таблице 'List' я выбираю текущую строку
			Тогда открылось окно "Open external reports and data processors (Access group)"
			Тогда элемент формы с именем 'Profile' стал равен '[TheProfile]'

	Иначе

		* Удаляем существующую группу доступа			
			И Пока в таблице 'List' количество строк 'больше' 0 Тогда
				* Ставим пометку на удаление	
					И Я удаляю текущую строку в списке 'List'
				* Переименовываем
					И Я запоминаю значение выражения 'StrReplace(New UUID, "-", "")' в переменную 'UID'
					И в таблице 'List' я выбираю текущую строку
					Тогда открылось окно "* (Access group)"
					И в поле с именем 'Description' я ввожу значение переменной 'UID'
					И я нажимаю на кнопку с именем 'FormWriteAndClose'
					И я жду закрытия окна "* (Access group) *" в течение 20 секунд

		* Создаем группу доступа
			Тогда открылось окно "Access groups"
			И я нажимаю на кнопку с именем 'FormCreate'
			Тогда открылось окно "Access group (create)"
			И в поле с именем 'Description' я ввожу текст '[TheName]'

		* Обновляем настройки
			И из выпадающего списка с именем "Profile" я выбираю по строке '[TheProfile]'
			И я нажимаю на кнопку с именем 'FormWrite'
			Тогда открылось окно "[TheName] (Access group)"

	И я закрываю окно "[TheName] (Access group)"
	Тогда открылось окно "Access groups"
	И Я закрываю окно "Access groups"		

Сценарий: Я добавляю в группу доступа 'TheProfile' значения доступа с видом 'TheType' из таблицы

	* Открываем список
		Если '$$IsERPCPM$$' Тогда
			И В командном интерфейсе я выбираю "Master data and адмandнandстрandрованandе" "Users and rights settings"
		Иначе			
			И В командном интерфейсе я выбираю "Administration" "Users and rights settings"
		Тогда открылось окно "Users and rights settings"
		И я нажимаю на кнопку с именем 'OpenAccessGroups'
	
	* Ищем группу доступа
		И Я в списке "Access groups" по полю "Description" ищу элемент '[TheProfile]' "Exact match"
		И в таблице 'List' количество строк 'равно' 1
		И в таблице 'List' я выбираю текущую строку

	* Настраиваем ограничения
		Тогда открылось окно "[TheProfile] (Access group)"
		И я перехожу к закладке с именем 'Access'
		И я заполняю таблицу 'AccessValues' данными
			| '$CurrentTable$' |

	* Сохраняем профиль
		Когда открылось окно "[TheProfile] (Access group) *"
		И я нажимаю на кнопку с именем 'FormWriteAndClose'
		И я жду закрытия окна "[TheProfile] (Access group) *" в течение 20 секунд
		Тогда открылось окно "Access groups"
		И Я закрываю окно "Access groups"

Сценарий: Я нахожу или создаю группу пользователей с именем 'TheName'

	* Открываем список
		Если '$$IsERPCPM$$' Тогда
			И В командном интерфейсе я выбираю "Master data and адмandнandстрandрованandе" "Users and rights settings"
		Иначе			
			И В командном интерфейсе я выбираю "Administration" "Users and rights settings"
		Тогда открылось окно "Users and rights settings"
		И я нажимаю на кнопку с именем 'OpenUsers'
		Тогда открылось окно "Users"

	* Ищем или создаем нужную группу
		И я выбираю пункт контекстного меню с именем 'UserGroupsContextMenuFind' на элементе формы с именем 'UserGroups'
		Тогда открылось окно "Find"
		И из выпадающего списка с именем 'FieldSelector' я выбираю точное значение "Description"
		И я меняю значение переключателя с именем 'CompareType' на "Anywhere in the line"
		И в поле с именем 'Pattern' я ввожу текст '[TheName]'
		И я нажимаю на кнопку с именем 'Find'
		Тогда открылось окно "Users"
		Если в таблице 'UserGroups' количество строк "равно" 0 Тогда
			И я нажимаю на кнопку с именем 'CreateUsersGroup'	
			Когда открылось окно "User group (create)"
			И в поле с именем 'Description' я ввожу текст '[TheName]'
			И я нажимаю на кнопку с именем 'FormWriteAndClose'
			И я жду закрытия окна "User group (create) *" в течение 20 секунд

	Тогда открылось окно "Users"
	И Я закрываю окно "Users"

Сценарий: Я нахожу или создаю пользователя 'TheUser' группа доступа 'TheProfile' группа 'TheGroup'

	* Открываем список
		Если '$$IsERPCPM$$' Тогда
			И В командном интерфейсе я выбираю "Master data and адмandнandстрandрованandе" "Users and rights settings"
		Иначе			
			И В командном интерфейсе я выбираю "Administration" "Users and rights settings"
		Тогда открылось окно "Users and rights settings"
		И я нажимаю на кнопку с именем 'OpenUsers'
		Тогда открылось окно "Users"

	* Ищем или создаем нужного пользователя
		И я выбираю пункт контекстного меню с именем 'UsersListContextMenuFind' на элементе формы с именем 'UsersList'
		Тогда открылось окно "Find"
		И из выпадающего списка с именем 'FieldSelector' я выбираю точное значение "Full name"
		И я меняю значение переключателя с именем 'CompareType' на "Exact match"				
		И в поле с именем 'Pattern' я ввожу текст '[TheUser]'
		И я нажимаю на кнопку с именем 'Find'
		Тогда открылось окно "Users"
		И пауза 1
		Если в таблице 'UsersList' количество строк "равно" 0 Тогда
			И я нажимаю на кнопку с именем 'CreateUser'
			Тогда открылось окно "User (create)"
			И в поле с именем 'Description' я ввожу текст '[TheUser]'
		Иначе
			И в таблице 'UsersList' я выбираю текущую строку
							
	* Обновляем настройки
		И я устанавливаю флаг с именем 'CanSignIn'
		И я устанавливаю флаг с именем 'IBUserStandardAuthentication'
		И я устанавливаю флаг с именем 'IBUserShowInList'
		И я нажимаю на кнопку с именем 'FormWrite'		
		Если открылось окно "Conversations (система взаимодействий)" Тогда
			И я устанавливаю флаг с именем 'NeverAskAgain'
			И я нажимаю на кнопку с именем 'Command2'
		Тогда открылось окно "[TheUser] (User)"

	Если 'NOT IsBlankString("[TheProfile]")' Тогда
		И В текущем окне я нажимаю кнопку командного интерфейса "Access rights"
		Если '"[TheProfile]" = "Administrators"' Тогда
			* Группа "Администраторы"
				Если в таблице 'AccessGroups' есть строка Тогда
					| "Description"   | "Profile"        |
					| "Administrators" | "Administrator"  |
					И в таблице 'AccessGroups' я перехожу к строке:
						| "Description"   |
						| "Administrators" |	
				Иначе
					И в таблице 'AccessGroups' я нажимаю на кнопку с именем 'AccessGroupsAddToGroup'
					Тогда открылось окно "Access groups"
					И в таблице 'AccessGroups' я перехожу к строке:
						| "Description"   |
						| "Administrators" |
					И в таблице 'AccessGroups' я выбираю текущую строку	
			* Группа "Открытие внешних отчетов и обработок"
				Если в таблице 'AccessGroups' есть строка Тогда
					| "Description"                         | "Profile"                              |
					| "Open external reports and data processors" | "Open external reports and data processors" |
					И в таблице 'AccessGroups' я перехожу к строке:
						| "Description"                         |
						| "Open external reports and data processors" |
				Иначе
					И в таблице 'AccessGroups' я нажимаю на кнопку с именем 'AccessGroupsAddToGroup'
					Тогда открылось окно "Access groups"
					И в таблице 'AccessGroups' я перехожу к строке:
						| "Description"                         |
						| "Open external reports and data processors" |
					И в таблице 'AccessGroups' я выбираю текущую строку
		Иначе
			* Очищаем группы и устанавливаем переданную				
				И пока в таблице 'AccessGroups' количество строк ">" 0 Тогда
					И в таблице 'AccessGroups' я нажимаю на кнопку с именем 'AccessGroupsRemoveFromGroup'	
				И в таблице 'AccessGroups' я нажимаю на кнопку с именем 'AccessGroupsAddToGroup'
				Тогда открылось окно "Access groups"
				И я выбираю пункт контекстного меню с именем 'AccessGroupsFind' на элементе формы с именем 'AccessGroups'
				Тогда открылось окно "Find"
				И в поле с именем 'Pattern' я ввожу текст '[TheProfile]'
				И я нажимаю на кнопку с именем 'Find'
				Тогда открылось окно "Access groups"
				И в таблице 'AccessGroups' я выбираю текущую строку

	Если 'NOT IsBlankString("[TheGroup]")' Тогда
		Когда открылось окно "[TheUser] (User)"
		И В текущем окне я нажимаю кнопку командного интерфейса "Groups"
		И Я запоминаю значение выражения '[TheGroup]' в переменную 'CurrentGroup'
		И в таблице 'GroupsTree' я перехожу к строке:
			| 'Group'         |
			| '$CurrentGroup$' |
		И в таблице 'GroupsTree' я устанавливаю флаг с именем 'GroupsTreeCheck'
		И в таблице 'GroupsTree' я завершаю редактирование строки
		И я нажимаю на кнопку с именем 'FormWriteAndClose'					

	Когда открылось окно "[TheUser] (User)"	
	И я закрываю окно "[TheUser] (User)"			
	Тогда открылось окно "Users"
	И Я закрываю окно "Users"				
