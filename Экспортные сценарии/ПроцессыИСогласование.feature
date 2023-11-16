#language: ru

@ExportScenarios
@IgnoreOnCIMainBuild

Функционал: Экспортные сценарии для работы с подсистемой 'Process_ и согласование'

Сценарий: Я создаю роль контактных лиц 'TheRole'

	* Открываем форму списка
		И В командном интерфейсе я выбираю "Consolidation under IFRS" "Contact person roles"

	* Удаляем элемент
		И Я в списке "Contact person roles" по полю "Description" ищу элемент '[TheRole]' "Exact match"		
		И Пока в таблице 'List' количество строк 'больше' 0 Тогда
			И в таблице 'List' я выбираю текущую строку
			И Я удаляю текущий элемент в окне "[TheRole] (Contact person roles)" очищая
	
	* Создаем элемент
		Когда открылось окно "Contact person roles"
		И я нажимаю на кнопку с именем 'FormCreate'
		Тогда открылось окно "Contact person roles (create)"
		И в поле с именем 'Description' я ввожу текст '[TheRole]'
		И я нажимаю на кнопку с именем 'FormWriteAndClose'
		И я жду закрытия окна "Contact person roles (create) *" в течение 20 секунд
		И Я закрываю окно "Contact person roles"

Сценарий: Я создаю элемент расширенной адресации 'TheExtendedAddressing' роль 'TheRole'

	* Открываем форму списка
		И В командном интерфейсе я выбираю "Processes and approval" "Extended approval addressing"

	* Удаляем элемент
		И Я в списке "Extended approval addressing" по полю "Description" ищу элемент '[TheExtendedAddressing]' "Exact match"		
		И Пока в таблице 'List' количество строк 'больше' 0 Тогда
			И в таблице 'List' я выбираю текущую строку
			И Я удаляю текущий элемент в окне "[TheExtendedAddressing] (Extended approval addressing)" очищая

	* Создаем элемент
		И я нажимаю на кнопку с именем 'FormCreate'
		Тогда открылось окно "Extended approval addressing (create)"
		И в поле с именем 'Description' я ввожу текст '[TheExtendedAddressing]'
		И я нажимаю кнопку выбора у поля с именем 'Owner'
		Тогда открылось окно "Select data type"
		И в таблице "" я перехожу к строке:
			| ''            |
			| "Infobase document" |
		И в таблице "" я выбираю текущую строку
		И Я в списке "Infobase documents" по полю "Document" ищу и выбираю элемент "Report instance" "Anywhere in the line"
		Тогда открылось окно "Extended approval addressing (create) *"
		И из выпадающего списка с именем 'ExtendedAddressingNegotiationType' я выбираю точное значение "Role by fixed object"
		И я перехожу к закладке с именем 'GroupPageRoleByFixedObject'
		И я нажимаю кнопку выбора у поля с именем 'AddressingRole1'
		И Я в списке "Contact person roles" по полю "Description" ищу и выбираю элемент '[TheRole]' "Exact match"
		Тогда открылось окно "Extended approval addressing (create) *"
		И я нажимаю кнопку выбора у поля с именем 'FixedAddressingObjects'
		Тогда открылось окно "Select data type"
		Если '$$IsERPCPM$$' Тогда
			И в таблице "" я перехожу к строке:
				| ''            |
				| "Company" |
		Иначе
			И в таблице "" я перехожу к строке:
				| ''                        |
				| "Business unit" |
		И в таблице "" я выбираю текущую строку
		Тогда открылось окно "Business unit*"
		И Я закрываю окно "Business unit*"
		Тогда открылось окно "Extended approval addressing (create) *"
		И я нажимаю на кнопку с именем 'FormWriteAndClose'
		И я жду закрытия окна "[TheExtendedAddressing] (Extended approval addressing)" в течение 20 секунд	
		И Я закрываю окно "Extended approval addressing"	

Сценарий: Я добавляю строку в матрицу адресации роль 'TheRole' пользователь 'TheUser'

	И В командном интерфейсе я выбираю "Processes and approval" "Addressing matrix"
	
	* Удаляем элемент
		Тогда открылось окно "Addressing matrix"
		И в таблице 'TableOfResponsiblePersons' я нажимаю на кнопку с именем 'TableOfResponsiblePersonsFind'
		Тогда открылось окно "Find"
		И из выпадающего списка с именем 'FieldSelector' я выбираю точное значение "Role"
		И я меняю значение переключателя с именем 'CompareType' на "Anywhere in the line"
		И в поле с именем 'Pattern' я ввожу текст '[TheRole]'
		И я нажимаю на кнопку с именем 'Find'
		
		Тогда открылось окно "Addressing matrix"
		И в таблице 'TableOfResponsiblePersons' я нажимаю на кнопку с именем 'TableOfResponsiblePersonsFind'
		Тогда открылось окно "Find"
		И из выпадающего списка с именем 'FieldSelector' я выбираю точное значение "User"
		И я меняю значение переключателя с именем 'CompareType' на "Anywhere in the line"
		И в поле с именем 'Pattern' я ввожу текст '[TheUser]'
		И я нажимаю на кнопку с именем 'Find'
		
		И Пока в таблице 'TableOfResponsiblePersons' количество строк 'больше' 0 Тогда
			И в таблице 'TableOfResponsiblePersons' я выбираю текущую строку
			И Я удаляю текущий элемент в окне "Responsible persons by objects*" очищая

	Если в таблице 'TableOfResponsiblePersons' количество строк "=" 0 Тогда
		И в таблице 'TableOfResponsiblePersons' я нажимаю на кнопку с именем 'TableOfResponsiblePersonsCreate'
		Тогда открылось окно "Responsible persons by objects"
		И я нажимаю кнопку выбора у поля с именем 'Role'
		И Я в списке "Contact person roles" по полю "Description" ищу и выбираю элемент '[TheRole]' "Exact match"
		Тогда открылось окно "Responsible persons by objects *"
		И я нажимаю кнопку выбора у поля с именем 'User'
		И Я в списке "Select user" по полю "Full name" ищу элемент '[TheUser]' "Exact match"
		И в таблице 'UsersList' я выбираю текущую строку
		Тогда открылось окно "Responsible persons by objects *"
		И я нажимаю на кнопку с именем 'FormWriteAndClose'
		И я жду закрытия окна "Responsible persons by objects *" в течение 20 секунд
		
	И в таблице 'TableOfResponsiblePersons' я нажимаю на кнопку с именем 'TableOfResponsiblePersonsCancelSearch'	
	И Я закрываю окно "Addressing matrix"	

Сценарий: Я добавляю этап согласования с наименованием 'TheStepName' способ адресации 'TheAddressingMethod' пользователь 'TheUser' роль 'TheRole' расширенная адресация 'TheExtendedAddressing'

	И в табличном документе 'PossibleStepsTableBox' я перехожу к ячейке 'ApprovalStep'
	И я нажимаю на кнопку с именем 'AddSelectedStep'
	Тогда открылось окно "Approval step (Universal process step)"
	И в поле с именем 'Description' я ввожу текст '[TheStepName]'
	И в таблице 'Approvers' я активизирую поле с именем 'ApproversAddressingMethod'
	И в таблице 'Approvers' я выбираю текущую строку

	Если '"[TheAddressingMethod]" = "User"' Тогда
		И в таблице 'Approvers' из выпадающего списка с именем 'ApproversAddressingMethod' я выбираю точное значение "User"
		И в таблице 'Approvers' я завершаю редактирование строки
		И в таблице 'Approvers' я активизирую поле с именем 'ApproversUser'
		И в таблице 'Approvers' я выбираю текущую строку
		И Я в списке "Users" по полю "Full name" ищу и выбираю элемент '[TheUser]' "Exact match"		
	
	Если '"[TheAddressingMethod]" = "Role"' Тогда
		И в таблице 'Approvers' из выпадающего списка с именем 'ApproversAddressingMethod' я выбираю точное значение "Role"
		И в таблице 'Approvers' я завершаю редактирование строки
		И в таблице 'Approvers' я активизирую поле с именем 'ApproversUser'
		И в таблице 'Approvers' я выбираю текущую строку
		И Я в списке "Contact person roles" по полю "Description" ищу и выбираю элемент '[TheRole]' "Exact match"
	
	Если '"[TheAddressingMethod]" = "Extended адресация" OR "[TheAddressingMethod]" = "Extended addressing"' Тогда
		И в таблице 'Approvers' из выпадающего списка с именем 'ApproversAddressingMethod' я выбираю точное значение "Extended addressing"
		И в таблице 'Approvers' я завершаю редактирование строки
		И в таблице 'Approvers' я активизирую поле с именем 'ApproversUser'
		И в таблице 'Approvers' я выбираю текущую строку
		И Я в списке "Extended approval addressing" по полю "Description" ищу и выбираю элемент '[TheExtendedAddressing]' "Exact match"
		
	И я нажимаю на кнопку с именем 'FormWriteAndClose'
	И я жду закрытия окна "Approval step (Universal process step) *" в течение 20 секунд

Сценарий: Я добавляю связь этапа 'TheStepOne' с этапом 'TheStepTwo'

	Когда открылось окно "Editing process stages: *"
	И я нажимаю на кнопку с именем 'AddLink'
	И Я в списке "Select initial link step" по полю "Description" ищу и выбираю элемент '[TheStepOne]' "Exact match"
	И Я в списке "Select end link step" по полю "Description" ищу и выбираю элемент '[TheStepTwo]' "Exact match"

Сценарий: Для пользователя 'TheUser' я добавляю заместителя 'TheDeputy'
		
	Попытка
		Когда В панели открытых я выбираю "Home page"
	Исключение
		И я закрываю все окна клиентского приложения
	
	Тогда открылось окно "Home page"
	И я нажимаю на кнопку с именем 'AssignSubstitute'
		
	И Я в списке "Substitutes for user: [TheUser]" по полю "Substitute" ищу элемент '[TheDeputy]' "Anywhere in the line"

	Если в таблице 'List' количество строк "=" 0 Тогда
		И в таблице "List" я нажимаю на кнопку с именем 'AddSubstitute'
			
		И Я в списке "Select user" по полю "Full name" ищу элемент '[TheDeputy]' "Exact match"
		И в таблице 'UsersList' количество строк 'равно' 1
		И в таблице 'UsersList' я выбираю текущую строку

		Тогда открылось окно "User substitute: [TheUser] *"
		И я нажимаю на кнопку с именем 'FormWriteAndClose'
		И я жду закрытия окна "User substitute: [TheUser] *" в течение 20 секунд
	Тогда открылось окно "Substitutes for user: [TheUser]"				
	И Я закрываю окно "Substitutes for user: [TheUser]"
