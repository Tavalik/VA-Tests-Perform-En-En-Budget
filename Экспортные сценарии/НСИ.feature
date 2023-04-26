#language: ru

@ExportScenarios
@IgnoreOnCIMainBuild

Функционал: Экспортные сценарии для создания НСИ

Сценарий: Я создаю единицу измерения с кодом 'TheCode' если ее нет, наименование 'TheName', наименование полное 'TheNameFull'

	* Открываем форму списка
		И я открываю основную форму списка справочника 'UnitOfMeasureClassifier'
		Тогда открылось окно "Classifier of Measurement Units"

	* Создадим элемент, если его нет
		И я нажимаю на кнопку с именем 'FormFind'
		Тогда открылась форма с именем 'UniversalListFindExtForm'
		И из выпадающего списка с именем 'FieldSelector' я выбираю точное значение "Code"
		И в поле с именем 'Pattern' я ввожу текст '[TheCode]'
		И я меняю значение переключателя с именем 'CompareType' на "Exact match"
		И я нажимаю на кнопку с именем 'Find'
		Если в таблице 'List' количество строк 'равно' 0 Тогда
			Если '$$ЭтоPerform$$' Тогда
				И я нажимаю на кнопку с именем 'FormCreate'
				Тогда открылось окно "Classifier of Measurement Units (create)"
				И в поле с именем 'Code' я ввожу текст '[TheCode]'
				И в поле с именем 'Description' я ввожу текст '[TheName]'				
				И в поле с именем 'DescriptionFull' я ввожу текст '[TheNameFull]'
				И я нажимаю на кнопку с именем 'FormWriteAndClose'
				И я жду закрытия окна "Classifier of Measurement Units (create) *" в течение 20 секунд							
			Иначе
				И я нажимаю на кнопку с именем 'FormSelectFromTheLayout'
				Тогда открылось окно "All-Russian Classifier of Measurement Units"
				И в поле с именем 'SearchString' я ввожу текст '[TheCode]'
				И я нажимаю на кнопку с именем 'ToSearchGoForward'
				И Пауза 1
				И я нажимаю на кнопку с именем 'FormSelect'						
				Тогда открылось окно "Classifier of Measurement Units (create)"
				И я нажимаю на кнопку с именем 'FormWriteAndClose'
				И я жду закрытия окна "Classifier of Measurement Units (create)" в течение 20 секунд
				Тогда открылось окно "All-Russian Classifier of Measurement Units"
				И я нажимаю на кнопку с именем 'Close'

	* Закрываем список
		Когда открылось окно "Classifier of Measurement Units"
		И Я закрываю окно "Classifier of Measurement Units"

Сценарий: Я создаю валюту с цифровым кодом 'TheCodeDigital' символьным кодом 'TheCodeSymbol' и наименованием 'TheCurrencyName' если ее нет

	* Открываем форму списка
		И В командном интерфейсе я выбираю "Budgeting, reporting, and analysis" "Currencies"
		Тогда открылось окно "Currencies"

	* Создадим валюту, если ее нет		
		И я нажимаю на кнопку с именем 'FormFind'
		Тогда открылась форма с именем 'UniversalListFindExtForm'
		И из выпадающего списка с именем 'FieldSelector' я выбираю точное значение "Numeric code"
		И в поле с именем 'Pattern' я ввожу текст '[TheCodeDigital]'
		И я нажимаю на кнопку с именем 'Find'
		Если в таблице 'Currencies' количество строк 'равно' 0 Тогда
			И я нажимаю на кнопку с именем 'CreateCurrency'
			Тогда открылось окно "Currency (create)"
			И в поле с именем 'DescriptionFull' я ввожу текст '[TheCurrencyName]'
			И в поле с именем 'Code' я ввожу текст '[TheCodeDigital]'
			И в поле с именем 'Description' я ввожу текст '[TheCodeSymbol]'
			И я нажимаю на кнопку с именем 'FormWriteAndClose'
			И я жду закрытия окна "Currency (create) *" в течение 20 секунд

	* Закрываем список
		Когда открылось окно "Currencies"
		И Я закрываю окно "Currencies"

Сценарий: Я устанавливаю курс валюты 'TheCodeSymbol' на дату 'TheCourseDate' в значение 'TheCourseValue' кратность 'TheCourseRepetition' базовая валюта 'TheBaseCurrencyCodeSymbol'

	* Откроем валюту
		И В командном интерфейсе я выбираю "Budgeting, reporting, and analysis" "Currencies"
		Тогда открылось окно "Currencies"
		И я нажимаю на кнопку с именем 'FormFind'
		Тогда открылась форма с именем 'UniversalListFindExtForm'
		И из выпадающего списка с именем 'FieldSelector' я выбираю точное значение "Alphabetic code"
		И в поле с именем 'Pattern' я ввожу текст '[TheCodeSymbol]'
		И я нажимаю на кнопку с именем 'Find'
		Тогда в таблице 'Currencies' количество строк 'равно' 1
		И в таблице 'Currencies' я выбираю текущую строку		
		Тогда открылось окно "* (Currency)"

	* Установим курс
		И В текущем окне я нажимаю кнопку командного интерфейса "Currency exchange rates"
		И я нажимаю на кнопку с именем 'FormFind'
		Тогда открылась форма с именем 'UniversalListFindExtForm'
		И из выпадающего списка с именем 'FieldSelector' я выбираю точное значение "Effective on"
		И в поле с именем 'Pattern' я ввожу текст '[TheCourseDate]'
		И я нажимаю на кнопку с именем 'Find'
		Если в таблице 'List' количество строк 'равно' 0 Тогда
			И я нажимаю на кнопку с именем 'FormCreate'
		Иначе
			И в таблице 'List' я выбираю текущую строку
		Тогда открылось окно "The currency exchange rate.*"
		И в поле с именем 'Period' я ввожу текст '[TheCourseDate]'
		Если '$$IsCPM$$' Тогда
			И в поле с именем 'Rate' я ввожу текст '[TheCourseValue]'
			И в поле с именем 'Repetition' я ввожу текст '[TheCourseRepetition]'
		ИначеЕсли '$$IsERPCPM$$' Тогда
			И в поле с именем 'RateЗнаменатель' я ввожу текст '[TheCourseRepetition]'
			И из выпадающего списка с именем 'Currency' я выбираю точное значение '[TheCodeSymbol]'
			И в поле с именем 'RateЧислитель' я ввожу текст '[TheCourseValue]'
			И из выпадающего списка с именем 'BaseCurrency' я выбираю точное значение '[TheBaseCurrencyCodeSymbol]'						
		И я нажимаю на кнопку с именем 'FormWriteAndClose'
		И я жду закрытия окна "The currency exchange rate.*" в течение 20 секунд		

	* Закрываем окна
		Тогда открылось окно "* (Currency)"
		И Я закрываю окно "* (Currency)"
		Тогда открылось окно "Currencies"
		И Я закрываю окно "Currencies"

Сценарий: Я создаю вид организационной единицы с именем 'TheBusinessUnitName'

	* Открываем форму справочника
		И я открываю основную форму списка справочника 'BusinessUnitKinds'

	* Удаляем элемент
		Тогда открылось окно "Business unit kinds"
		И я нажимаю на кнопку с именем 'FormFind'
		Тогда открылась форма с именем 'UniversalListFindExtForm'
		И из выпадающего списка с именем 'FieldSelector' я выбираю точное значение "Description"
		И в поле с именем 'Pattern' я ввожу текст '[TheBusinessUnitName]'
		И я меняю значение переключателя с именем 'CompareType' на "Exact match"
		И я нажимаю на кнопку с именем 'Find'
		Тогда открылось окно "Business unit kinds"
		И Пока в таблице 'List' количество строк 'больше' 0 Тогда
			* Ставим пометку на удаление	
				Когда открылось окно "Business unit kinds"
				И я выбираю пункт контекстного меню с именем 'ListContextMenuSetDeletionMark' на элементе формы с именем 'List'
				Тогда открылось окно "1C:Enterprise"
				И я нажимаю на кнопку с именем 'Button0'
			* Переименовываем
				И Я запоминаю значение выражения 'StrReplace(New UUID, "-", "")' в переменную 'UID'
				И в таблице 'List' я выбираю текущую строку
				Тогда открылось окно "* (Business unit kind)"
				И в поле с именем 'Description' я ввожу значение переменной 'UID'
				И я нажимаю на кнопку с именем 'FormWriteAndClose'
				И я жду закрытия окна "* (Business unit kind) *" в течение 20 секунд
	
	* Создаем элементм
		И я нажимаю на кнопку с именем 'FormCreate'
		Тогда открылось окно "Business unit kind (create)"
		И в поле с именем 'Description' я ввожу текст '[TheBusinessUnitName]'
		И я нажимаю на кнопку с именем 'FormWriteAndClose'
		И я жду закрытия окна "Business unit kind (create) *" в течение 20 секунд

	* Закрываем список
		Когда открылось окно "Business unit kinds"
		И Я закрываю окно "Business unit kinds"

Сценарий: Я создаю организацию с именем 'TheBusinessUnitName' типом 'TheBusinessUnitType' видом 'TheBusinessUnitKind' налогооблажением 'TheTaxation'

	Если '$$IsCPM$$' Тогда
		И В командном интерфейсе я выбираю "Budgeting, reporting, and analysis" "Business units"
	Если '$$IsERPCPM$$' Тогда
		И В командном интерфейсе я выбираю "Budgeting, reporting, and analysis" "Companies"

	* Удаляем текущий элемент		
		И я нажимаю на кнопку с именем 'FormFind'
		Тогда открылась форма с именем 'UniversalListFindExtForm'
		Если '$$IsCPM$$' Тогда
			И из выпадающего списка с именем 'FieldSelector' я выбираю точное значение "Name in the application"
		Если '$$IsERPCPM$$' Тогда
			И из выпадающего списка с именем 'FieldSelector' я выбираю точное значение "Description"
		И в поле с именем 'Pattern' я ввожу текст '[TheBusinessUnitName]'
		И я меняю значение переключателя с именем 'CompareType' на "Exact match"
		И я нажимаю на кнопку с именем 'Find'
		Тогда открылось окно "Business unit*"
		И Пока в таблице 'List' количество строк 'больше' 0 Тогда
			* Ставим пометку на удаление
				Если в таблице 'List' текущая строка не помечена на удаление Тогда	
					И я выбираю пункт контекстного меню с именем 'ListContextMenuSetDeletionMark' на элементе формы с именем 'List'
					Тогда открылось окно "1C:Enterprise"
					И я нажимаю на кнопку с именем 'Button0'
			И в таблице 'List' я выбираю текущую строку
			Когда открылось окно "* (Business unit*)"
			Если '$$IsCPM$$' Тогда
				* Удаляем все подразделения
					И В текущем окне я нажимаю кнопку командного интерфейса "Departments"
					И я нажимаю на кнопку с именем 'FormListSettings'
					И Я устанавливаю отбор в форме списка "Description" "Does not begin with" 'Delete_'
					И Пока в таблице 'List' количество строк 'больше' 0 Тогда
						И Я запоминаю значение выражения '"Delete_" + StrReplace(New UUID, "-", "")' в переменную 'UID'
						И в таблице 'List' я выбираю текущую строку
						Тогда открылось окно "* (Department)"
						И в поле с именем 'Description' я ввожу значение переменной 'UID'
						И я нажимаю на кнопку с именем 'FormWriteAndClose'
					Когда открылось окно "* (Business unit*)"						
					И я нажимаю на кнопку с именем 'FormListSettings'
					И Я снимаю все отборы в форме списка
					И В текущем окне я нажимаю кнопку командного интерфейса "Main"				
			* Переименовываем организацию
				И Я запоминаю значение выражения 'StrReplace(New UUID, "-", "")' в переменную 'UID'
				И в поле с именем 'Description' я ввожу значение переменной 'UID'
				И в поле с именем 'DescriptionFull' я ввожу значение переменной 'UID'
				И я нажимаю на кнопку с именем 'FormWriteAndClose'
				И я жду закрытия окна "* (Business unit*) *" в течение 20 секунд

	* Создаем новую организацию
		Если '$$ЭтоPerform$$' Тогда
			И я нажимаю на кнопку с именем 'FormCreate'
			Тогда открылось окно "Business unit (create)"
			Если '"[TheBusinessUnitType]"="SelectRФ"' Тогда
				И из выпадающего списка с именем 'CompanyTypeCPM' я выбираю точное значение "Company"
			ИначеЕсли '"[TheBusinessUnitKind]"="SelectЭл"' Тогда
				И из выпадающего списка с именем 'CompanyTypeCPM' я выбираю точное значение "Eliminating business unit"
			ИначеЕсли '"[TheBusinessUnitType]"="SelectCenterForFinancialResponsibility"' Тогда
				И из выпадающего списка с именем 'CompanyTypeCPM' я выбираю точное значение "Financial responsibility center or consolidating business unit"	
		ИначеЕсли '$$IsERPCPM$$' Тогда			
			Если '"[TheBusinessUnitType]"="SelectRФ"' Тогда
				Если '"[TheBusinessUnitKind]"="SelectЮL"' Тогда
					И я нажимаю на кнопку с именем 'BusinessEntity'
				Иначе
					И я нажимаю на кнопку с именем 'IndividualEntrepreneur'
			ИначеЕсли '"[TheBusinessUnitType]"="SelectИн"' Тогда
				// Нет примеров
			ИначеЕсли '"[TheBusinessUnitType]"="SelectCenterForFinancialResponsibility"' Тогда
				И я нажимаю на кнопку с именем 'FormCreateКонсолидируюшую'										
		ИначеЕсли '$$IsCPM$$' Тогда
			И я нажимаю на кнопку с именем 'FormCreate'
			Тогда открылось окно "Company type"
			И я нажимаю на кнопку с именем '[TheBusinessUnitType]'
			Если '"[TheBusinessUnitType]"="SelectRФ"' Тогда
				Когда открылось окно "Company kind"
				И я нажимаю на кнопку с именем '[TheBusinessUnitKind]'
				Если '"[TheBusinessUnitKind]"="SelectЮL"' Тогда
					Когда открылось окно "Legal entity"
					И я нажимаю на кнопку с именем '[TheTaxation]'
				Иначе
					// Нет примеров			
			ИначеЕсли '"[TheBusinessUnitType]"="SelectИн"' Тогда
				// Нет примеров
			ИначеЕсли '"[TheBusinessUnitType]"="SelectCenterForFinancialResponsibility"' Тогда
				Если '"[TheBusinessUnitKind]"="SelectЭл"' Тогда
					И из выпадающего списка с именем 'CompanyTypeCPM' я выбираю точное значение "Eliminating business unit"
			И в поле с именем 'DescriptionСокращенное' я ввожу текст '[TheBusinessUnitName]'
		И в поле с именем 'Description' я ввожу текст '[TheBusinessUnitName]'
		И в поле с именем 'DescriptionFull' я ввожу текст '[TheBusinessUnitName]'
		И я нажимаю на кнопку с именем 'FormWriteAndClose'
		И я жду закрытия окна "Business unit *" в течение 20 секунд

	* Закрываем форму списка
		Когда открылось окно "Business unit*"
		И Я закрываю окно "Business unit*"	

Сценарий: Я для организации 'TheBusinessUnitName' создаю подразделение с именем 'TheSubdivisionName' 

	* Открываем список организаций
		И В командном интерфейсе я выбираю "Budgeting, reporting, and analysis" "Business units"

	* Открываем организацию
		Когда открылось окно "Business units"
		И я нажимаю на кнопку с именем 'FormFind'
		Тогда открылась форма с именем 'UniversalListFindExtForm'
		И из выпадающего списка с именем 'FieldSelector' я выбираю точное значение "Name in the application"
		И в поле с именем 'Pattern' я ввожу текст '[TheBusinessUnitName]'
		И я меняю значение переключателя с именем 'CompareType' на "Exact match"
		И я нажимаю на кнопку с именем 'Find'
		Тогда открылось окно "Business units"
		Если в таблице 'List' количество строк 'больше' 0 Тогда
			И в таблице 'List' я выбираю текущую строку
			Тогда открылось окно "* (Business unit)"
			И В текущем окне я нажимаю кнопку командного интерфейса "Departments"
			Когда открылось окно "* (Business unit)"
			И я нажимаю на кнопку с именем 'FormFind'
			Тогда открылась форма с именем 'UniversalListFindExtForm'
			И из выпадающего списка с именем 'FieldSelector' я выбираю точное значение "Description"
			И в поле с именем 'Pattern' я ввожу текст '[TheSubdivisionName]'
			И я нажимаю на кнопку с именем 'Find'
			И Пока в таблице 'List' количество строк 'больше' 0 Тогда
				* Ставим пометку на удаление
					Если в таблице 'List' текущая строка не помечена на удаление Тогда	
						И я выбираю пункт контекстного меню с именем 'ListContextMenuSetDeletionMark' на элементе формы с именем 'List'
						Тогда открылось окно "1C:Enterprise"
						И я нажимаю на кнопку с именем 'Button0' 
				* Перименовываем подразделение
					И Я запоминаю значение выражения 'StrReplace(New UUID, "-", "")' в переменную 'UID'
					И в таблице 'List' я выбираю текущую строку					
					Тогда открылось окно "* (Department)"
					И в поле с именем 'Description' я ввожу значение переменной 'UID'
					И я нажимаю на кнопку с именем 'FormWriteAndClose'
					И я жду закрытия окна "* (Department) *" в течение 20 секунд
	
	* Создаем элемент
		Когда открылось окно "* (Business unit)"
		И я нажимаю на кнопку с именем 'FormCreate'
		Тогда открылось окно "Department (create)"
		И в поле с именем 'Description' я ввожу текст '[TheSubdivisionName]'
		И я нажимаю на кнопку с именем 'FormWriteAndClose'
		И я жду закрытия окна "Department (create) *" в течение 20 секунд

	* Закрываем организацию
		Когда открылось окно "* (Business unit)"
		И Я закрываю окно "* (Business unit)"

	* Закрываем список организаций
		Когда открылось окно "Business units"
		И Я закрываю окно "Business units"

Сценарий: Я для организации 'TheBusinessUnitName' для реквизита 'TheAttributeName' выбираю значение 'TheValuesName' 

	Если '$$IsCPM$$' Тогда
		И В командном интерфейсе я выбираю "Budgeting, reporting, and analysis" "Business units"
	Если '$$IsERPCPM$$' Тогда
		И В командном интерфейсе я выбираю "Budgeting, reporting, and analysis" "Companies"

	* Открываем организацию
		Когда открылось окно "Business unit*"
		И я нажимаю на кнопку с именем 'FormFind'
		Тогда открылась форма с именем 'UniversalListFindExtForm'
		Если '$$IsCPM$$' Тогда
			И из выпадающего списка с именем 'FieldSelector' я выбираю точное значение "Name in the application"
		Если '$$IsERPCPM$$' Тогда
			И из выпадающего списка с именем 'FieldSelector' я выбираю точное значение "Description"
		И в поле с именем 'Pattern' я ввожу текст '[TheBusinessUnitName]'
		И я меняю значение переключателя с именем 'CompareType' на "Exact match"
		И я нажимаю на кнопку с именем 'Find'
		Тогда открылось окно "Business unit*"
		Если в таблице 'List' количество строк 'больше' 0 Тогда
			И в таблице 'List' я выбираю текущую строку
			Тогда открылось окно "* (Business unit*)"
			И я разворачиваю группу с именем 'GroupConsolidationParametersCPM'
			И из выпадающего списка с именем '[TheAttributeName]' я выбираю по строке '[TheValuesName]'						
			И я нажимаю на кнопку с именем 'FormWriteAndClose'
			И я жду закрытия окна "* (Business unit*) *" в течение 20 секунд							

	* Закрываем список организаций
		Когда открылось окно "Business unit*"
		И Я закрываю окно "Business unit*"

Сценарий: Я создаю отношение к группе с именем 'TheRelationsToGroupName' и видом 'TheRelationsToGroupKind'

	* Открываем форму справочника
		И я открываю основную форму списка справочника 'CounterpartiesGroups'

	* Удаляем элемент
		Тогда открылось окно "Relations to group"
		И я нажимаю на кнопку с именем 'FormFind'
		Тогда открылась форма с именем 'UniversalListFindExtForm'
		И из выпадающего списка с именем 'FieldSelector' я выбираю точное значение "Description"
		И в поле с именем 'Pattern' я ввожу текст '[TheRelationsToGroupName]'
		И я меняю значение переключателя с именем 'CompareType' на "Exact match"
		И я нажимаю на кнопку с именем 'Find'
		Тогда открылось окно "Relations to group"
		И Пока в таблице 'List' количество строк 'больше' 0 Тогда
			* Ставим пометку на удаление	
				Когда открылось окно "Relations to group"
				И я выбираю пункт контекстного меню с именем 'ListContextMenuSetDeletionMark' на элементе формы с именем 'List'
				Тогда открылось окно "1C:Enterprise"
				И я нажимаю на кнопку с именем 'Button0'
			* Переименовываем
				И Я запоминаю значение выражения 'StrReplace(New UUID, "-", "")' в переменную 'UID'
				И в таблице 'List' я выбираю текущую строку
				Тогда открылось окно "* (Relations to group)"
				И в поле с именем 'Description' я ввожу значение переменной 'UID'
				И я нажимаю на кнопку с именем 'FormWriteAndClose'
				И я жду закрытия окна "* (Relations to group) *" в течение 20 секунд
	
	* Создаем элементм
		И я нажимаю на кнопку с именем 'FormCreate'
		Тогда открылось окно "Relations to group (create)"
		И в поле с именем 'Description' я ввожу текст '[TheRelationsToGroupName]'
		И из выпадающего списка с именем 'GroupRelationType' я выбираю точное значение '[TheRelationsToGroupKind]'				
		И я нажимаю на кнопку с именем 'FormWriteAndClose'
		И я жду закрытия окна "Relations to group (create) *" в течение 20 секунд

	* Закрываем список
		Когда открылось окно "Relations to group"
		И Я закрываю окно "Relations to group"

Сценарий: Я создаю сценарий с именем 'TheScenarioName'

	* Открываем список
		И В командном интерфейсе я выбираю "Budgeting, reporting, and analysis" "Scenarios"
	
	* Удаляем текущий элемент
		Тогда открылось окно "Scenarios"
		И я нажимаю на кнопку с именем 'FormFind'
		Тогда открылась форма с именем 'UniversalListFindExtForm'
		И из выпадающего списка с именем 'FieldSelector' я выбираю точное значение "Description"
		И я меняю значение переключателя с именем 'CompareType' на "Exact match"
		И в поле с именем 'Pattern' я ввожу текст '[TheScenarioName]'
		И я нажимаю на кнопку с именем 'Find'
		И Пока в таблице 'List' количество строк 'больше' 0 Тогда
			* Ставим пометку на удаление
				И я выбираю пункт контекстного меню с именем 'ListContextMenuSetDeletionMark' на элементе формы с именем 'List'
				Тогда открылось окно "1C:Enterprise"
				И я нажимаю на кнопку с именем 'Button0'
			* Перименовываем
				И Я запоминаю значение выражения 'StrReplace(New UUID, "-", "")' в переменную 'UID'
				И в таблице 'List' я выбираю текущую строку
				Тогда открылось окно "Scenarios: *"
				И в поле с именем 'Description' я ввожу значение переменной 'UID'
				И я нажимаю на кнопку с именем 'FormWriteAndClose'
				И я жду закрытия окна "Scenarios: *" в течение 20 секунд
			
	* Создаем новый элемент
		Тогда открылось окно "Scenarios"
		И я нажимаю на кнопку с именем 'FormCreate'
		Тогда открылось окно "Scenarios: Scenarios (create)"
		И в поле с именем 'Description' я ввожу текст '[TheScenarioName]'
		И я нажимаю на кнопку с именем 'FormWriteAndClose'
		И я жду закрытия окна "Scenarios: Scenarios (create) *" в течение 5 секунд

	* Закрываем список
		Когда открылось окно "Scenarios"
		И Я закрываю окно "Scenarios"

Сценарий: Я для сценария 'TheName' на закладке 'ThePage' для реквизита 'TheProperty' устанавливаю значение 'TheValue' 

	* Ищем элемент	
		И В командном интерфейсе я выбираю "Budgeting, reporting, and analysis" "Scenarios"
		И Я в списке "Scenarios" по полю "Description" ищу элемент '[TheName]' "Exact match"
		
	* Меняем реквизит
		И я запоминаю заголовок формы в переменную 'FormCaption'		
		Тогда открылось окно '$FormCaption$'
		И я перехожу к закладке с именем '[ThePage]'
		И Я для реквизита '[TheProperty]' устанавливаю значение '[TheValue]'		

	* Сохраняем элемент
		И я нажимаю на кнопку с именем 'FormWriteAndClose'
		И я жду закрытия окна '$FormCaption$ *' в течение 20 секунд

Сценарий: Я создаю группу видов отчетов с именем 'TheReportKindName' и родителем 'TheReportKindParentName'

	* Открываем список
		И В командном интерфейсе я выбираю "Budgeting, reporting, and analysis" "Report types and templates"

	* Удаляем текущий элемент		
		Тогда открылось окно "Report types and templates"
		И в таблице 'ReportKindList' я нажимаю на кнопку с именем 'ReportKindListFind'
		Тогда открылась форма с именем 'UniversalListFindExtForm'
		И из выпадающего списка с именем 'FieldSelector' я выбираю точное значение "Report type"
		И я меняю значение переключателя с именем 'CompareType' на "Anywhere in the line"
		И в поле с именем 'Pattern' я ввожу текст '[TheReportKindName]'
		И я нажимаю на кнопку с именем 'Find'
		И Пока в таблице 'ReportKindList' количество строк 'больше' 0 Тогда
			* Ставим пометку на удаление
				И я выбираю пункт контекстного меню с именем 'ReportKindListContextMenuSetDeletionMark' на элементе формы с именем 'ReportKindList'
				Тогда открылось окно "1C:Enterprise"
				И я нажимаю на кнопку с именем 'Button0'
				И я жду открытия окна "Report types and templates" в течение 120 секунд				
			* Перименовываем
				И Я запоминаю значение выражения '"Delete_" + StrReplace(New UUID, "-", "")' в переменную 'UID'		
				И в таблице 'ReportKindList' я выбираю текущую строку
				Когда открылось окно "* (Report types)"		
				И в поле с именем 'Description' я ввожу значение переменной 'UID'
				И в поле с именем 'Code' я ввожу значение переменной 'UID'
				И в поле с именем 'Parent' я ввожу текст ''						
				И я нажимаю на кнопку с именем 'FormWriteAndClose'
				И я жду закрытия окна "* (Report types)" в течение 20 секунд

	* Создаем новую группу отчетов
		Тогда открылось окно "Report types and templates"
		И в таблице 'ReportKindList' я нажимаю на кнопку с именем 'ReportKindListCreateFolder'
		Тогда открылось окно "Report types (create folder)"
		И в поле с именем 'Description' я ввожу текст '[TheReportKindName]'
		Если 'StrLen("[TheReportKindParentName]") = 0' Тогда
			И в поле с именем 'Parent' я ввожу текст ''
		Иначе
			И из выпадающего списка с именем 'Parent' я выбираю по строке '[TheReportKindParentName]'
		И я нажимаю на кнопку с именем 'FormWriteAndClose'
		И я жду закрытия окна "Report types (create folder) *" в течение 20 секунд

	* Закрываем список
		Когда открылось окно "Report types and templates"
		И Я закрываю окно "Report types and templates"	

Сценарий: Я создаю вид отчета с именем 'TheReportKindName' и родителем 'TheReportKindParentName'

	* Открываем список
		И В командном интерфейсе я выбираю "Budgeting, reporting, and analysis" "Report types and templates"	

	* Удаляем текущий элемент	
		Тогда открылось окно "Report types and templates"
		И в таблице 'ReportKindList' я нажимаю на кнопку с именем 'ReportKindListFind'
		Тогда открылась форма с именем 'UniversalListFindExtForm'
		И из выпадающего списка с именем 'FieldSelector' я выбираю точное значение "Report type"
		И я меняю значение переключателя с именем 'CompareType' на "Anywhere in the line"
		И в поле с именем 'Pattern' я ввожу текст '[TheReportKindName]'
		И я нажимаю на кнопку с именем 'Find'
		И Пока в таблице 'ReportKindList' количество строк 'больше' 0 Тогда
			* Ставим пометку на удаление
				И я выбираю пункт контекстного меню с именем 'ReportKindListContextMenuSetDeletionMark' на элементе формы с именем 'ReportKindList'
				Тогда открылось окно "1C:Enterprise"
				И я нажимаю на кнопку с именем 'Button0'
			* Перименовываем
				И Я запоминаю значение выражения '"Delete_" + StrReplace(New UUID, "-", "")' в переменную 'UID'		
				И в таблице 'ReportKindList' я выбираю текущую строку
				Тогда открылось окно "* (Report types)"		
				И в поле с именем 'Description' я ввожу значение переменной 'UID'
				И в поле с именем 'FullDescr' я ввожу значение переменной 'UID'
				И в поле с именем 'Code' я ввожу значение переменной 'UID'
				И в поле с именем 'Parent' я ввожу текст ''
				И я нажимаю на кнопку с именем 'FormWriteAndClose'
				И я жду закрытия окна "* (Report types)" в течение 20 секунд

	* Создаем новый элемент
		Тогда открылось окно "Report types and templates"
		И в таблице 'ReportKindList' я нажимаю на кнопку с именем 'ReportKindListCreate'
		Тогда открылось окно "Report types (create)"
		И в поле с именем 'Description' я ввожу текст '[TheReportKindName]'
		Если 'StrLen("[TheReportKindParentName]") = 0' Тогда
			И в поле с именем 'Parent' я ввожу текст ''
		Иначе
			И из выпадающего списка с именем 'Parent' я выбираю по строке '[TheReportKindParentName]'
		И я нажимаю на кнопку с именем 'FormWriteAndClose'
		И я жду закрытия окна "Report types (create folder) *" в течение 20 секунд

	* Закрываем список
		Когда открылось окно "Report types and templates"
		И Я закрываю окно "Report types and templates"

Сценарий: Я создаю проект с именем 'TheProjectName'

	* Открываем список
		И В командном интерфейсе я выбираю "Budgeting, reporting, and analysis" "Projects*"
	
	* Удаляем текущий элемент
		Тогда открылось окно "Projects*"
		И я нажимаю на кнопку с именем 'FormFind'
		Тогда открылась форма с именем 'UniversalListFindExtForm'
		И из выпадающего списка с именем 'FieldSelector' я выбираю точное значение "Description"
		И я меняю значение переключателя с именем 'CompareType' на "Exact match"
		И в поле с именем 'Pattern' я ввожу текст '[TheProjectName]'
		И я нажимаю на кнопку с именем 'Find'
		И Пока в таблице 'List' количество строк 'больше' 0 Тогда
			* Ставим пометку на удаление
				И я выбираю пункт контекстного меню с именем 'ListContextMenuSetDeletionMark' на элементе формы с именем 'List'
				Тогда открылось окно "1C:Enterprise"
				И я нажимаю на кнопку с именем 'Button0'
			* Перименовываем
				И Я запоминаю значение выражения 'StrReplace(New UUID, "-", "")' в переменную 'UID'
				И в таблице 'List' я выбираю текущую строку
				Тогда открылось окно "*(Project*"
				И в поле с именем 'Description' я ввожу значение переменной 'UID'
				И я нажимаю на кнопку с именем 'FormWriteAndClose'
				И я жду закрытия окна "*(Project*" в течение 20 секунд
			
	* Создаем новый элемент
		Тогда открылось окно "Projects*"
		И я нажимаю на кнопку с именем 'FormCreate'
		Тогда открылось окно "Project* (create)"
		И в поле с именем 'Description' я ввожу текст '[TheProjectName]'
		И я нажимаю на кнопку с именем 'FormWriteAndClose'
		И я жду закрытия окна "Project* (create) *" в течение 20 секунд

	* Закрываем список
		Когда открылось окно "Projects*"
		И Я закрываю окно "Projects*"

Сценарий: Я создаю вид аналитики с кодом 'TheAnalyticsCode' именем 'TheAnalyticsName' и типом 'TheAnalyticsType'

	* Открываем список
		И В командном интерфейсе я выбираю "Budgeting, reporting, and analysis" "Dimension types (corporate)"
		
	* Удаляем элемент	
		Тогда открылось окно "Dimension types (corporate)"
		И я нажимаю на кнопку с именем 'FormFind'
		Тогда открылась форма с именем 'UniversalListFindExtForm'
		И из выпадающего списка с именем 'FieldSelector' я выбираю точное значение "Code"
		И в поле с именем 'Pattern' я ввожу текст '[TheAnalyticsCode]'
		И я меняю значение переключателя с именем 'CompareType' на "Exact match"
		И я нажимаю на кнопку с именем 'Find'
		Тогда открылось окно "Dimension types (corporate)"
		И Пока в таблице 'List' количество строк 'больше' 0 Тогда
			* Произвольный классификтор
				И в таблице 'List' я выбираю текущую строку
				Тогда открылось окно "* (Dimension types (corporate))"
				И В текущем окне я нажимаю кнопку командного интерфейса "Arbitrary classifier"
				Если в таблице 'List' количество строк 'больше' 0 Тогда
					И я нажимаю на кнопку с именем 'FormListSettings'
					И Я устанавливаю отбор в форме списка "Description" "Does not begin with" 'Delete_'
					И Пока в таблице 'List' количество строк 'больше' 0 Тогда	
						* Ставим пометку на удаление
							И я выбираю пункт контекстного меню с именем 'ListContextMenuSetDeletionMark' на элементе формы с именем 'List'
							Тогда открылось окно "1C:Enterprise"
							И я нажимаю на кнопку с именем 'Button0'
						* Перименовываем
							И Я запоминаю значение выражения '"Delete_" + StrReplace(New UUID, "-", "")' в переменную 'UID'	
							И в таблице 'List' я выбираю текущую строку
							Когда открылось окно "* (Arbitrary classifier)"		
							Тогда в поле с именем 'Description' я ввожу значение переменной 'UID'
							И я нажимаю на кнопку с именем 'FormWriteAndClose'
							И я жду закрытия окна "* (Arbitrary classifier)" в течение 20 секунд
					И я нажимаю на кнопку с именем 'FormListSettings'
					И Я снимаю все отборы в форме списка		
				Когда открылось окно "* (Dimension types (corporate))"
				И я закрываю окно "* (Dimension types (corporate))"																													
			* Ставим пометку на удаление	
				И я выбираю пункт контекстного меню с именем 'ListContextMenuSetDeletionMark' на элементе формы с именем 'List'
				Тогда открылось окно "1C:Enterprise"
				И я нажимаю на кнопку с именем 'Button0'
			* Перименовываем	
				И Я запоминаю значение выражения 'StrReplace(New UUID, "-", "")' в переменную 'UID'		
				И в таблице 'List' я выбираю текущую строку
				Тогда открылось окно "* (Dimension types (corporate))"
				И в поле с именем 'Code' я ввожу текст 'Delete'
				Тогда открылось окно "1C:Enterprise"
				И я нажимаю на кнопку с именем 'Button0'
				Тогда открылось окно "* (Dimension types (corporate))"
				И в поле с именем 'Code' я ввожу текст ''
				И в поле с именем 'Description' я ввожу значение переменной 'UID'
				И я нажимаю на кнопку с именем 'FormWriteAndClose'
				И я жду закрытия окна "* (Dimension types (corporate)) *" в течение 20 секунд

	* Создаем элемент кодом
		И я выполняю код встроенного языка на сервере без контекста	
			| 'TypeАналитик = ChartsOfCharacteristicTypes.CorporateExtDimensionTypes.CreateItem();' |
			| 'Array = New Array;' |
			| 'Array.Add(Type("[TheAnalyticsType]"));' |
			| 'TypeАналитик.ValueType = New TypeDescription(Array);' |
			| 'TypeАналитик.Code = "[TheAnalyticsCode]";' |
			| 'TypeАналитик.Description = "[TheAnalyticsName]";' |
			| 'TypeАналитик.Write();' |

	* Настраиваем вид аналитики
		Когда открылось окно "Dimension types (corporate)"
		И я нажимаю на кнопку с именем 'FormRefresh'
		Когда открылось окно "Dimension types (corporate)"
		И я нажимаю на кнопку с именем 'FormFind'
		Тогда открылась форма с именем 'UniversalListFindExtForm'
		И из выпадающего списка с именем 'FieldSelector' я выбираю точное значение "Code"
		И в поле с именем 'Pattern' я ввожу текст '[TheAnalyticsCode]'
		И я меняю значение переключателя с именем 'CompareType' на "Exact match"
		И я нажимаю на кнопку с именем 'Find'
		Тогда открылось окно "Dimension types (corporate)"
		И в таблице 'List' я выбираю текущую строку
		Когда открылось окно "* (Dimension types (corporate))"

		Если в таблице 'TableBoxAttributes' есть строка Тогда
			| "Attribute"     | "Key" | "Template" |
			| "Description" | "No"  | "No"   |
			И в таблице 'TableBoxAttributes' я перехожу к строке по шаблону:
				| "Attribute"     | "Key" | "Template" |
				| "Description" | "No"  | "No"   |
			И в таблице 'TableBoxAttributes' я изменяю флаг с именем 'AttributesTableTemplate'
			И в таблице 'TableBoxAttributes' я изменяю флаг с именем 'AttributesTableKey'
			И в таблице 'TableBoxAttributes' я завершаю редактирование строки
		ИначеЕсли в таблице 'TableBoxAttributes' есть строка Тогда
			| "Attribute"                 | "Key" | "Template" |
			| "Name in the application" | "No"  | "No"   |
			И в таблице 'TableBoxAttributes' я перехожу к строке по шаблону:
				| "Attribute"                 | "Key" | "Template" |
				| "Name in the application" | "No"  | "No"   |
			И в таблице 'TableBoxAttributes' я изменяю флаг с именем 'AttributesTableTemplate'
			И в таблице 'TableBoxAttributes' я изменяю флаг с именем 'AttributesTableKey'
			И в таблице 'TableBoxAttributes' я завершаю редактирование строки	
		ИначеЕсли в таблице 'TableBoxAttributes' есть строка Тогда
			| "Attribute" | "Key" | "Template" |
			| "Code"      | "No"  | "No"   |
			И в таблице 'TableBoxAttributes' я перехожу к строке:
				| "Attribute" | "Key" | "Template" |
				| "Code"      | "No"  | "No"   |
			И в таблице 'TableBoxAttributes' я изменяю флаг с именем 'AttributesTableTemplate'
			И в таблице 'TableBoxAttributes' я изменяю флаг с именем 'AttributesTableKey'
			И в таблице 'TableBoxAttributes' я завершаю редактирование строки
		
		И я нажимаю на кнопку с именем 'FormWriteAndClose'
		И я жду закрытия окна "Dimension types (corporate) (create) *" в течение 20 секунд

	* Закрываем список	
		И Я закрываю окно "Dimension types (corporate)"		

Сценарий: Я создаю субконто УХ с именем 'TheExtDimensionCPMName' и видом аналитики с кодом 'TheExtDimensionCPMKind'

	* Открываем список
		И В командном интерфейсе я выбираю "Budgeting, reporting, and analysis" "Arbitrary classifier"
		Когда открылось окно "Arbitrary classifier"

	* Устанавливаем вид
		И из выпадающего списка с именем 'Owner' я выбираю по строке '[TheExtDimensionCPMKind]'

	* Удаляем текущий элемент
		И я выбираю пункт контекстного меню с именем 'ListContextMenuFind' на элементе формы с именем 'List'
		Тогда открылась форма с именем 'UniversalListFindExtForm'
		И из выпадающего списка с именем 'FieldSelector' я выбираю точное значение "Description"
		И в поле с именем 'Pattern' я ввожу текст '[TheExtDimensionCPMName]'
		И я меняю значение переключателя с именем 'CompareType' на "Exact match"
		И я нажимаю на кнопку с именем 'Find'
		Тогда открылось окно "Arbitrary classifier"
		И Пока в таблице 'List' количество строк 'больше' 0 Тогда	
			* Ставим пометку на удаление
				И я выбираю пункт контекстного меню с именем 'ListContextMenuSetDeletionMark' на элементе формы с именем 'List'
				Тогда открылось окно "1C:Enterprise"
				И я нажимаю на кнопку с именем 'Button0'
			* Перименовываем
				И Я запоминаю значение выражения 'StrReplace(New UUID, "-", "")' в переменную 'UID'	
				И в таблице 'List' я выбираю текущую строку
				Когда открылось окно "* (Arbitrary classifier)"		
				Тогда в поле с именем 'Description' я ввожу значение переменной 'UID'
				И я нажимаю на кнопку с именем 'FormWriteAndClose'
				И я жду закрытия окна "* (Arbitrary classifier)" в течение 20 секунд 

	* Создаем новый элемент
		Когда открылось окно "Arbitrary classifier"
		И я нажимаю на кнопку с именем 'FormCreate'
		Тогда открылось окно "Arbitrary classifier (create)"
		И в поле с именем 'Description' я ввожу текст '[TheExtDimensionCPMName]'
		И я нажимаю на кнопку с именем 'FormWriteAndClose'
		И я жду закрытия окна "Arbitrary classifier (create) *" в течение 20 секунд				

	* Закрываем список
		Когда открылось окно "Arbitrary classifier"
		И Я закрываю окно "Arbitrary classifier"

Сценарий: Я создаю группу номенклатуры с именем 'TheProductGroupName'

	* Открываем список
		Если в панели разделов есть команда 'Справочники' Тогда
			И В командном интерфейсе я выбираю "Catalogs" "Product range"
		Иначе
			И В командном интерфейсе я выбираю "Quick menu" "Product range"

	* Удаляем текущий элемент
		Когда открылось окно "Product range"
		И я выбираю пункт контекстного меню с именем 'ListContextMenuFind' на элементе формы с именем 'List'
		Тогда открылась форма с именем 'UniversalListFindExtForm'
		И из выпадающего списка с именем 'FieldSelector' я выбираю точное значение "Description"
		И в поле с именем 'Pattern' я ввожу текст '[TheProductGroupName]'
		И я меняю значение переключателя с именем 'CompareType' на "Exact match"
		И я нажимаю на кнопку с именем 'Find'
		Тогда открылось окно "Product range"
		И Пока в таблице 'List' количество строк 'больше' 0 Тогда	
			* Ставим пометку на удаление
				И я выбираю пункт контекстного меню с именем 'ListContextMenuSetDeletionMark' на элементе формы с именем 'List'
				Тогда открылось окно "1C:Enterprise"
				И я нажимаю на кнопку с именем 'Button0'
			* Перименовываем
				И Я запоминаю значение выражения 'StrReplace(New UUID, "-", "")' в переменную 'UID'	
				И в таблице 'List' я выбираю текущую строку
				Когда открылось окно "* (Product range)"		
				Тогда в поле с именем 'Description' я ввожу значение переменной 'UID'
				Если элемент 'Parent' присутствует на форме Тогда
					И в поле с именем 'Parent' я ввожу текст ''								
				И я нажимаю на кнопку с именем 'FormWriteAndClose'
				И я жду закрытия окна "* (Product range)" в течение 20 секунд 

	* Создаем новый элемент
		Когда открылось окно "Product range"
		И я нажимаю на кнопку с именем 'FormCreateFolder'
		Тогда открылось окно "Product range (create folder)"
		И в поле с именем 'Description' я ввожу текст '[TheProductGroupName]'
		И я нажимаю на кнопку с именем 'FormWriteAndClose'
		И я жду закрытия окна "Product range (create folder) *" в течение 20 секунд

	* Закрываем список
		Когда открылось окно "Product range"
		И Я закрываю окно "Product range"

Сценарий: Я создаю тип цен с именем 'ThePricesTypeName' валютой 'TheCurrency'

	* Открываем форму справочника
		И я открываю основную форму списка справочника 'ProductsPricesTypes'

	* Удаляем элемент
		Тогда открылось окно "Product range price types"
		И я нажимаю на кнопку с именем 'FormFind'
		Тогда открылась форма с именем 'UniversalListFindExtForm'
		И из выпадающего списка с именем 'FieldSelector' я выбираю точное значение "Description"
		И в поле с именем 'Pattern' я ввожу текст '[ThePricesTypeName]'
		И я меняю значение переключателя с именем 'CompareType' на "Exact match"
		И я нажимаю на кнопку с именем 'Find'
		Тогда открылось окно "Product range price types"
		И Пока в таблице 'List' количество строк 'больше' 0 Тогда
			* Ставим пометку на удаление	
				Когда открылось окно "Product range price types"
				И я выбираю пункт контекстного меню с именем 'ListContextMenuSetDeletionMark' на элементе формы с именем 'List'
				Тогда открылось окно "1C:Enterprise"
				И я нажимаю на кнопку с именем 'Button0'
			* Переименовываем
				И Я запоминаю значение выражения 'StrReplace(New UUID, "-", "")' в переменную 'UID'
				И в таблице 'List' я выбираю текущую строку
				Тогда открылось окно "* (Product range price type)"
				И в поле с именем 'Description' я ввожу значение переменной 'UID'
				И я нажимаю на кнопку с именем 'FormWriteAndClose'
				И я жду закрытия окна "* (Product range price type) *" в течение 20 секунд
	
	* Создаем элементм
		И я нажимаю на кнопку с именем 'FormCreate'
		Тогда открылось окно "Product range price type (create)"
		И в поле с именем 'Description' я ввожу текст '[ThePricesTypeName]'
		Если элемент 'CurrencyЦены' присутствует на форме Тогда
			И из выпадающего списка с именем 'CurrencyЦены' я выбираю точное значение "TheCurrency"
		Если элемент 'PriceВключаетVAT' присутствует на форме Тогда
			И я изменяю флаг с именем 'PriceВключаетVAT'		
		И я нажимаю на кнопку с именем 'FormWriteAndClose'
		И я жду закрытия окна "Product range price type (create) *" в течение 20 секунд

	* Закрываем список
		Когда открылось окно "Product range price types"
		И Я закрываю окно "Product range price types"

Сценарий: Я создаю условие оплаты с именем 'TheTermsOfPaymentName'

	* Открываем форму списка
		И В командном интерфейсе я выбираю "Management обязательствами" "Условия оплаты"
		Тогда открылось окно "Условия оплаты"

	* Удаляем текущий элемент
		И я нажимаю на кнопку с именем 'FormFind'
		Тогда открылась форма с именем 'UniversalListFindExtForm'
		И из выпадающего списка с именем 'FieldSelector' я выбираю точное значение "Description"
		И в поле с именем 'Pattern' я ввожу текст '[TheTermsOfPaymentName]'
		И я меняю значение переключателя с именем 'CompareType' на "Exact match"
		И я нажимаю на кнопку с именем 'Find'
		Тогда открылось окно "Условия оплаты"
		И Пока в таблице 'List' количество строк 'больше' 0 Тогда
			* Ставим пометку на удаление
				И я выбираю пункт контекстного меню с именем 'ListContextMenuSetDeletionMark' на элементе формы с именем 'List'
				Тогда открылось окно "1C:Enterprise"
				И я нажимаю на кнопку с именем 'Button0'
			* Переименовываем
				И Я запоминаю значение выражения 'StrReplace(New UUID, "-", "")' в переменную 'UID'				
				И в таблице 'List' я выбираю текущую строку
				Тогда открылось окно "* (Condition оплаты)"
				И в поле с именем 'Description' я ввожу значение переменной 'UID'
				И я нажимаю на кнопку с именем 'FormWriteAndClose'
				И я жду закрытия окна "* (Условия оплаты)" в течение 20 секунд

	* Создаем элемент
		Тогда открылось окно "Условия оплаты"	
		И я нажимаю на кнопку с именем 'FormCreate'
		Тогда открылось окно "Condition оплаты (create)"
		И в таблице 'StagesОплаты' я нажимаю на кнопку с именем 'StagesОплатыAdd'
		И в таблице 'StagesОплаты' из выпадающего списка с именем 'StagesОплатыVariantОплаты' я выбираю точное значение "Постоплата (после базовой даты)"
		И в таблице 'StagesОплаты' из выпадающего списка с именем 'StagesОплатыDueDate' я выбираю точное значение "60"
		И в таблице 'StagesОплаты' в поле с именем 'StagesОплатыPercentОплаты' я ввожу текст '100'
		И в таблице 'StagesОплаты' я завершаю редактирование строки
		И я изменяю флаг с именем 'Автонаименование'
		И в поле с именем 'Description' я ввожу текст '[TheTermsOfPaymentName]'
		И я нажимаю на кнопку с именем 'FormWriteAndClose'
		И я жду закрытия окна "Condition оплаты (create) *" в течение 20 секунд	

	* Закрываем список	
		Тогда открылось окно "Условия оплаты"
		И Я закрываю окно "Условия оплаты"

Сценарий: Я создаю группу контрагентов с именем 'TheCounterpartyGroupName'

	* Открываем форму списка
		Если в панели разделов есть команда 'Справочники' Тогда
			И В командном интерфейсе я выбираю "Catalogs" "Counterparties"
		Иначе
			И В командном интерфейсе я выбираю "Quick menu" "Counterparties"
		Тогда открылось окно "Counterparties"
	
	* Удаляем текущий элемент
		И я нажимаю на кнопку с именем 'FormFind'
		Тогда открылась форма с именем 'UniversalListFindExtForm'
		И из выпадающего списка с именем 'FieldSelector' я выбираю точное значение "Name in the application"
		И в поле с именем 'Pattern' я ввожу текст '[TheCounterpartyGroupName]'
		И я меняю значение переключателя с именем 'CompareType' на "Exact match"
		И я нажимаю на кнопку с именем 'Find'
		Тогда открылось окно "Counterparties"
		И Пока в таблице 'List' количество строк 'больше' 0 Тогда
			* Ставим пометку на удаление
				И я выбираю пункт контекстного меню с именем 'ListContextMenuSetDeletionMark' на элементе формы с именем 'List'
				Тогда открылось окно "1C:Enterprise"
				И я нажимаю на кнопку с именем 'Button0'
			* Переименовываем
				И Я запоминаю значение выражения 'StrReplace(New UUID, "-", "")' в переменную 'UID'	
				И в таблице 'List' я выбираю текущую строку
				Тогда открылось окно "* (Counterparties)"
				И в поле с именем 'Description' я ввожу значение переменной 'UID'
				И я нажимаю на кнопку с именем 'FormWriteAndClose'
				И я жду закрытия окна "* (Counterparties)" в течение 20 секунд

	* Создаем новый элемент
		И я нажимаю на кнопку с именем 'FormCreateFolder'
		Тогда открылось окно "Counterparties (create folder)"
		И в поле с именем 'Description' я ввожу текст '[TheCounterpartyGroupName]'
		И я нажимаю на кнопку с именем 'FormWriteAndClose'
		И я жду закрытия окна "Counterparties (create folder) *" в течение 20 секунд

	* Закрываем список
		Когда открылось окно "Counterparties"
		И Я закрываю окно "Counterparties"

Сценарий: Я создаю контрагента с именем 'TheCounterpartyName' родителем 'TheCounterpartyParent' страной регистрации 'TheRegistrationCountry'

	* Открываем форму списка
		Если в панели разделов есть команда 'Справочники' Тогда
			И В командном интерфейсе я выбираю "Catalogs" "Counterparties"
		Иначе
			И В командном интерфейсе я выбираю "Quick menu" "Counterparties"
		Тогда открылось окно "Counterparties"

	* Удаляем текущий элемент
		И я нажимаю на кнопку с именем 'FormFind'
		Тогда открылась форма с именем 'UniversalListFindExtForm'
		И из выпадающего списка с именем 'FieldSelector' я выбираю точное значение "Name in the application"
		И в поле с именем 'Pattern' я ввожу текст '[TheCounterpartyName]'
		И я меняю значение переключателя с именем 'CompareType' на "Exact match"
		И я нажимаю на кнопку с именем 'Find'
		Тогда открылось окно "Counterparties"
		И Пока в таблице 'List' количество строк 'больше' 0 Тогда
			* Ставим пометку на удаление
				Если в таблице 'List' текущая строка не помечена на удаление Тогда
					И я выбираю пункт контекстного меню с именем 'ListContextMenuSetDeletionMark' на элементе формы с именем 'List'
					Тогда открылось окно "1C:Enterprise"
					И я нажимаю на кнопку с именем 'Button0'
			И в таблице 'List' я выбираю текущую строку
			Когда открылось окно "* (Counterparty)"
			* Удаляем все договоры				
				И В текущем окне я нажимаю кнопку командного интерфейса "Contracts"
				И я нажимаю на кнопку с именем 'FormListSettings'
				И Я устанавливаю отбор в форме списка "Description" "Does not begin with" 'Delete_'
				И Пока в таблице 'List' количество строк 'больше' 0 Тогда
					И Я запоминаю значение выражения '"Delete_" + StrReplace(New UUID, "-", "")' в переменную 'UID'
					И в таблице 'List' я выбираю текущую строку
					Тогда открылось окно "*"
					И в поле с именем 'Description' я ввожу значение переменной 'UID'
					И я нажимаю на кнопку с именем 'FormWrite'
					Тогда открылось окно "*"
					И Я закрываю окно "*"		
				И я нажимаю на кнопку с именем 'FormListSettings'
				И Я снимаю все отборы в форме списка
				И В текущем окне я нажимаю кнопку командного интерфейса "Main"								
			* Удаляем контрагента
				И Я запоминаю значение выражения 'StrReplace(New UUID, "-", "")' в переменную 'UID'	
				И в поле с именем 'Description' я ввожу значение переменной 'UID'
				Если '$$ЭтоPerform$$' Тогда
					И я нажимаю на кнопку с именем 'FormWriteAndClose'
				Иначе
					И я нажимаю на кнопку с именем 'FormCommandSaveAndClose'
				И я жду закрытия окна "* (Counterparty)" в течение 20 секунд			

	* Создаем новый элемент
		И я нажимаю на кнопку с именем 'FormCreate'
		Тогда открылось окно "Counterparty (create)"
		И в поле с именем 'Description' я ввожу текст '[TheCounterpartyName]'
		И из выпадающего списка с именем 'Parent' я выбираю по строке '[TheCounterpartyParent]'
		И из выпадающего списка с именем 'RegistrationCountry' я выбираю по строке '[TheRegistrationCountry]'				
		Если '$$ЭтоPerform$$' Тогда
			И я нажимаю на кнопку с именем 'FormWriteAndClose'
		Иначе
			И я нажимаю на кнопку с именем 'FormCommandSaveAndClose'
		И я жду закрытия окна "Counterparty (create) *" в течение 20 секунд

	* Закрываем список
		Когда открылось окно "Counterparties"
		И Я закрываю окно "Counterparties"

Сценарий: Я создаю договор для контрагента 'TheCounterpartyName' номер 'TheNumber' дата 'TheDate' валюта 'TheCurrency' организация 'TheBusinessUnit' вид 'TheContractKind' сумма 'TheSum' условие оплаты 'TheTermsOfPayment'

	* Открываем форму списка
		Если '$$ЭтоPerform$$' Тогда
			И В командном интерфейсе я выбираю "Quick menu" "Counterparties"
		Иначе
			И В командном интерфейсе я выбираю "Catalogs" "Counterparties"
		Тогда открылось окно "Counterparties"

	* Ищем контрагента
		И я нажимаю на кнопку с именем 'FormFind'
		Тогда открылась форма с именем 'UniversalListFindExtForm'
		И из выпадающего списка с именем 'FieldSelector' я выбираю точное значение "Name in the application"
		И в поле с именем 'Pattern' я ввожу текст '[TheCounterpartyName]'
		И я меняю значение переключателя с именем 'CompareType' на "Exact match"
		И я нажимаю на кнопку с именем 'Find'
		Тогда открылось окно "Counterparties"
		И в таблице 'List' количество строк 'равно' 1
		И в таблице 'List' я выбираю текущую строку
		Тогда открылось окно "* (Counterparty)"
		И В текущем окне я нажимаю кнопку командного интерфейса "Contracts"

	* Удаляем текущий элемент		
		И я нажимаю на кнопку с именем 'FormFind'
		Тогда открылась форма с именем 'UniversalListFindExtForm'
		И из выпадающего списка с именем 'FieldSelector' я выбираю точное значение "Description"
		И в поле с именем 'Pattern' я ввожу текст "[TheNumber] from [TheDate]"
		И я меняю значение переключателя с именем 'CompareType' на "Exact match"
		И я нажимаю на кнопку с именем 'Find'
		И Пока в таблице 'List' количество строк 'больше' 0 Тогда	
			* Ставим пометку на удаление
				Если в таблице 'List' текущая строка не помечена на удаление Тогда
					И я выбираю пункт контекстного меню с именем 'ListContextMenuSetDeletionMark' на элементе формы с именем 'List'
					Тогда открылось окно "1C:Enterprise"
					И я нажимаю на кнопку с именем 'Button0'
			* Переименовываем
				И Я запоминаю значение выражения 'StrReplace(New UUID, "-", "")' в переменную 'UID'	
				И в таблице 'List' я выбираю текущую строку
				Тогда открылось окно "*"
				И в поле с именем 'Description' я ввожу значение переменной 'UID'
				И я нажимаю на кнопку с именем 'FormWrite'
				Тогда открылось окно "*"
				И Я закрываю окно "*"				

	* Создаем элемент
		Когда открылось окно "* (Counterparty)"
		И я нажимаю на кнопку с именем 'FormCreate'
		Если '$$ЭтоPerform$$' Тогда
			Когда открылось окно "Contract (Create)*"
			И из выпадающего списка с именем 'TypeOfAgreement' я выбираю точное значение "TheContractKind"
		Иначе	
			Тогда открылось окно "Выберите вид договора"
			И в таблице 'KindsДоговоров' я перехожу к строке:
				| "Contract kind"     |
				| '[TheContractKind]' |
			И в таблице 'KindsДоговоров' я выбираю текущую строку
		Тогда открылось окно "* (Create)*"
		И в поле с именем 'Number' я ввожу текст '[TheNumber]'
		И в поле с именем 'Date' я ввожу текст '[TheDate]'
		И в поле с именем 'Description' я ввожу текст "[TheNumber] from [TheDate]"
		И из выпадающего списка с именем 'Organization' я выбираю по строке '[TheBusinessUnit]'
		И из выпадающего списка с именем 'ARAPCurrency' я выбираю точное значение '[TheCurrency]'
		Если '$$ЭтоPerform$$' Тогда
			И в поле с именем 'Sum' я ввожу текст '[TheSum]'
			И я нажимаю на кнопку с именем 'FormWriteAndClose'
		Иначе
			Если флаг с именем "ФиксированнаяAmountДоговора" равен "False" Тогда
				И я изменяю флаг с именем 'FixedSumДоговора' 
			И в поле с именем 'SumДоговора' я ввожу текст '[TheSum]'
			И я перехожу к закладке с именем 'GroupCalculations'
			И из выпадающего списка с именем 'ConditionОплаты' я выбираю по строке '[TheTermsOfPayment]'			
			И я нажимаю на кнопку с именем 'FormPostAndClose'	
		И я жду закрытия окна "* (Create) *" в течение 20 секунд

	* Закрываем формы
		Когда открылось окно "* (Counterparty)"
		И Я закрываю окно "* (Counterparty)"
		Тогда открылось окно "Counterparties"
		И Я закрываю окно "Counterparties"

Сценарий: Я создаю группу статей ДДС с именем 'TheItemGroupName'	

	* Открываем форму списка
		Если в панели разделов есть команда 'Планирование и контроль' Тогда	
			И В командном интерфейсе я выбираю "Планирование и контроль" "Cash flow items"
		Иначе
			И я открываю основную форму списка справочника 'CashFlowReportItems'
		Тогда открылось окно "Cash flow items"

	* Удаляем элемент	
		И я нажимаю на кнопку с именем 'FormFind'
		Тогда открылась форма с именем 'UniversalListFindExtForm'
		И из выпадающего списка с именем 'FieldSelector' я выбираю точное значение "Description"
		И в поле с именем 'Pattern' я ввожу текст '[TheItemGroupName]'
		И я меняю значение переключателя с именем 'CompareType' на "Exact match"
		И я нажимаю на кнопку с именем 'Find'
		И Пока в таблице 'List' количество строк 'больше' 0 Тогда
			* Ставим пометку на удаление
				Если в таблице 'List' текущая строка не помечена на удаление Тогда	
					И я выбираю пункт контекстного меню с именем 'ListContextMenuSetDeletionMark' на элементе формы с именем 'List'
					Тогда открылось окно "1C:Enterprise"
					И я нажимаю на кнопку с именем 'Button0'
			* Переименовываем
				И Я запоминаю значение выражения 'StrReplace(New UUID, "-", "")' в переменную 'UID'
				И в таблице 'List' я выбираю текущую строку
				Когда открылось окно "* (Cash flow items)"
				Тогда в поле с именем 'Description' я ввожу значение переменной 'UID'
				И я нажимаю на кнопку с именем 'FormWriteAndClose'
				И я жду закрытия окна "* (Cash flow items) *" в течение 20 секунд

	* Создаем элемент
		Тогда открылось окно "Cash flow items"
		И я нажимаю на кнопку с именем 'FormCreateFolder'
		Тогда открылось окно "Cash flow items (create folder)"
		И в поле с именем 'Description' я ввожу текст '[TheItemGroupName]'
		И я нажимаю на кнопку с именем 'FormWriteAndClose'
		И я жду закрытия окна "Cash flow items (create folder) *" в течение 20 секунд

	* Закрываем форму списка
		Когда открылось окно "Cash flow items"
		И Я закрываю окно "Cash flow items"

Сценарий: Я создаю статью ДДС с именем 'TheItemName' родителем 'TheItemParent'

	* Открываем форму списка
		Если в панели разделов есть команда 'Планирование и контроль' Тогда	
			И В командном интерфейсе я выбираю "Планирование и контроль" "Cash flow items"
		Иначе
			И я открываю основную форму списка справочника 'CashFlowReportItems'
		Тогда открылось окно "Cash flow items"
	
	* Удаляем элемент	
		И я нажимаю на кнопку с именем 'FormFind'
		Тогда открылась форма с именем 'UniversalListFindExtForm'
		И из выпадающего списка с именем 'FieldSelector' я выбираю точное значение "Description"
		И в поле с именем 'Pattern' я ввожу текст '[TheItemName]'
		И я меняю значение переключателя с именем 'CompareType' на "Exact match"
		И я нажимаю на кнопку с именем 'Find'
		И Пока в таблице 'List' количество строк 'больше' 0 Тогда
			* Ставим пометку на удаление
				Если в таблице 'List' текущая строка не помечена на удаление Тогда	
					И я выбираю пункт контекстного меню с именем 'ListContextMenuSetDeletionMark' на элементе формы с именем 'List'
					Тогда открылось окно "1C:Enterprise"
					И я нажимаю на кнопку с именем 'Button0'
			* Переименовываем
				И Я запоминаю значение выражения 'StrReplace(New UUID, "-", "")' в переменную 'UID'
				И в таблице 'List' я выбираю текущую строку
				Когда открылось окно "* (Cash flow item)"
				Тогда в поле с именем 'Description' я ввожу значение переменной 'UID'
				И я нажимаю на кнопку с именем 'FormWriteAndClose'
				И я жду закрытия окна "* (Cash flow item) *" в течение 20 секунд
		
	* Создаем элемент
		Тогда открылось окно "Cash flow items"
		И я нажимаю на кнопку с именем 'FormCreate'
		Тогда открылось окно "Cash flow item (create)"
		И в поле с именем 'Description' я ввожу текст '[TheItemName]'
		И из выпадающего списка с именем 'Parent' я выбираю по строке '[TheItemParent]'
		И я нажимаю на кнопку с именем 'FormWriteAndClose'
		И я жду закрытия окна "Cash flow item (create) *" в течение 20 секунд

	* Закрываем форму списка
		Когда открылось окно "Cash flow items"
		И Я закрываю окно "Cash flow items"	

Сценарий: Я создаю группу статей ДиР с именем 'TheItemGroupName'	

	* Открываем форму списка
		Если в панели разделов есть команда 'Планирование и контроль' Тогда	
			И В командном интерфейсе я выбираю "Планирование и контроль" "Income and expense items"
		Иначе
			И я открываю основную форму списка справочника 'IncomeAndExpenseItems'
		Тогда открылось окно "Income and expense items"

	* Удаляем элемент	
		И я нажимаю на кнопку с именем 'FormFind'
		Тогда открылась форма с именем 'UniversalListFindExtForm'
		И из выпадающего списка с именем 'FieldSelector' я выбираю точное значение "Description"
		И в поле с именем 'Pattern' я ввожу текст '[TheItemGroupName]'
		И я меняю значение переключателя с именем 'CompareType' на "Exact match"
		И я нажимаю на кнопку с именем 'Find'
		И Пока в таблице 'List' количество строк 'больше' 0 Тогда
			* Ставим пометку на удаление
				Если в таблице 'List' текущая строка не помечена на удаление Тогда	
					И я выбираю пункт контекстного меню с именем 'ListContextMenuSetDeletionMark' на элементе формы с именем 'List'
					Тогда открылось окно "1C:Enterprise"
					И я нажимаю на кнопку с именем 'Button0'
			* Переименовываем
				И Я запоминаю значение выражения 'StrReplace(New UUID, "-", "")' в переменную 'UID'
				И в таблице 'List' я выбираю текущую строку
				Когда открылось окно "* (Income and expense items)"
				Тогда в поле с именем 'Description' я ввожу значение переменной 'UID'
				И я нажимаю на кнопку с именем 'FormWriteAndClose'
				И я жду закрытия окна "* (Income and expense items) *" в течение 20 секунд

	* Создаем элемент
		Тогда открылось окно "Income and expense items"
		И я нажимаю на кнопку с именем 'FormCreateFolder'
		Тогда открылось окно "Income and expense items (create folder)"
		И в поле с именем 'Description' я ввожу текст '[TheItemGroupName]'
		И я нажимаю на кнопку с именем 'FormWriteAndClose'
		И я жду закрытия окна "Income and expense items (create folder) *" в течение 20 секунд

	* Закрываем форму списка
		Когда открылось окно "Income and expense items"
		И Я закрываю окно "Income and expense items"

Сценарий: Я создаю статью ДиР с именем 'TheItemName' родителем 'TheItemParent'

	* Открываем форму списка
		Если в панели разделов есть команда 'Планирование и контроль' Тогда	
			И В командном интерфейсе я выбираю "Планирование и контроль" "Income and expense items"'
		Иначе
			И я открываю основную форму списка справочника 'IncomeAndExpenseItems'
		Тогда открылось окно "Income and expense items"'
	
	* Удаляем элемент	
		И я нажимаю на кнопку с именем 'FormFind'
		Тогда открылась форма с именем 'UniversalListFindExtForm'
		И из выпадающего списка с именем 'FieldSelector' я выбираю точное значение "Description"
		И в поле с именем 'Pattern' я ввожу текст '[TheItemName]'
		И я меняю значение переключателя с именем 'CompareType' на "Exact match"
		И я нажимаю на кнопку с именем 'Find'
		И Пока в таблице 'List' количество строк 'больше' 0 Тогда
			* Ставим пометку на удаление
				Если в таблице 'List' текущая строка не помечена на удаление Тогда	
					И я выбираю пункт контекстного меню с именем 'ListContextMenuSetDeletionMark' на элементе формы с именем 'List'
					Тогда открылось окно "1C:Enterprise"
					И я нажимаю на кнопку с именем 'Button0'
			* Переименовываем
				И Я запоминаю значение выражения 'StrReplace(New UUID, "-", "")' в переменную 'UID'
				И в таблице 'List' я выбираю текущую строку
				Когда открылось окно "* (Income and expense item)"
				Тогда в поле с именем 'Description' я ввожу значение переменной 'UID'
				И я нажимаю на кнопку с именем 'FormWriteAndClose'
				И я жду закрытия окна "* (Income and expense item) *" в течение 20 секунд
		
	* Создаем элемент
		Тогда открылось окно "Income and expense items"'
		И я нажимаю на кнопку с именем 'FormCreate'
		Тогда открылось окно "Income and expense item (create)"
		И в поле с именем 'Description' я ввожу текст '[TheItemName]'
		И из выпадающего списка с именем 'Parent' я выбираю по строке '[TheItemParent]'
		И я нажимаю на кнопку с именем 'FormWriteAndClose'
		И я жду закрытия окна "Income and expense item (create) *" в течение 20 секунд

	* Закрываем форму списка
		Когда открылось окно "Income and expense items"'
		И Я закрываю окно "Income and expense items"'

Сценарий: Я создаю номенклатуру с именем 'TheProductName' родителем 'TheProductParent' видом номенклатуры 'TheProductKind' артикулом 'TheProductID'

	* Открываем список
		Если '$$ЭтоPerform$$' Тогда
			И В командном интерфейсе я выбираю "Quick menu" "Product range"		
		ИначеЕсли '$$IsCPM$$' Тогда
			И В командном интерфейсе я выбираю "Catalogs" "Product range"
		ИначеЕсли '$$IsERPCPM$$' Тогда
			И В командном интерфейсе я выбираю "Quick menu" "Product range"
			И я снимаю флаг с именем 'UseDisplayFilters'		
		Тогда открылось окно "Product range"

	* Удаляем текущий элемент
		Если '$$IsCPM$$' Тогда
			И я выбираю пункт контекстного меню с именем 'ListContextMenuFind' на элементе формы с именем 'List'
			Тогда открылась форма с именем 'UniversalListFindExtForm'
			И из выпадающего списка с именем 'FieldSelector' я выбираю точное значение "Description"
			И в поле с именем 'Pattern' я ввожу текст '[TheProductName]'
			И я меняю значение переключателя с именем 'CompareType' на "Exact match"
			И я нажимаю на кнопку с именем 'Find'
			Тогда открылось окно "Product range"
			И Пока в таблице 'List' количество строк 'больше' 0 Тогда
				* Ставим пометку на удаление
					Если в таблице 'List' текущая строка не помечена на удаление Тогда
						И я выбираю пункт контекстного меню с именем 'ListContextMenuSetDeletionMark' на элементе формы с именем 'List'
						Тогда открылось окно "1C:Enterprise"
						И я нажимаю на кнопку с именем 'Button0'
				* Перименовываем
					И Я запоминаю значение выражения 'StrReplace(New UUID, "-", "")' в переменную 'UID'
					И в таблице 'List' я выбираю текущую строку
					Когда открылось окно "* (Product range)"		
					Тогда в поле с именем 'Description' я ввожу значение переменной 'UID'
					И в поле с именем 'SKU' я ввожу текст ' '
					И я нажимаю на кнопку с именем 'FormWriteAndClose'
					И я жду закрытия окна "* (Product range)" в течение 20 секунд
		ИначеЕсли '$$IsERPCPM$$' Тогда
			И пауза 1
			И я нажимаю кнопку очистить у поля с именем 'SearchStringProducts'					
			И в поле с именем 'SearchStringProducts' я ввожу текст '[TheProductName]'
			И я нажимаю на кнопку с именем 'Find'				
			Если появилось окно с заголовком 'Search' в течение 1 секунд Тогда
				И я нажимаю на кнопку с именем 'Button0'
			Тогда открылось окно "Product range"
			И Пока в таблице 'ListAdvancedSearchProducts' количество строк 'больше' 0 Тогда
				* Ставим пометку на удаление
					Если в таблице 'ListAdvancedSearchProducts' текущая строка не помечена на удаление Тогда
						И я выбираю пункт контекстного меню с именем 'ListAdvancedSearchProductsContextMenuSetDeletionMark' на элементе формы с именем 'ListAdvancedSearchProducts'
						Тогда открылось окно "1C:Enterprise"
						И я нажимаю на кнопку с именем 'Button0'
				* Переименовываем
					И Я запоминаю значение выражения 'StrReplace(New UUID, "-", "")' в переменную 'UID'
					И в таблице 'ListAdvancedSearchProducts' я выбираю текущую строку
					Когда открылось окно "* (Product range)"
					И я перехожу к закладке с именем 'PageProductAttributes'
					Если появилось окно с заголовком 'Полезный совет' в течение 1 секунд Тогда
						И я нажимаю на кнопку с именем 'Button0'
					Когда открылось окно "* (Product range)"								
					Тогда в поле с именем 'Description' я ввожу значение переменной 'UID'
					И в поле с именем 'SKU' я ввожу текст ' '	
					И я нажимаю на кнопку с именем 'FillDescriptionForPrintFromTemplate'
					И я нажимаю на кнопку с именем 'FormWriteAndClose'
					И я жду закрытия окна "* (Product range)" в течение 20 секунд
					Если появилось окно с заголовком 'Search' в течение 1 секунд Тогда
						И я нажимаю на кнопку с именем 'Button0'

	* Создаем новый элемент
		Когда открылось окно "Product range"
		Если '$$IsCPM$$' Тогда			
			И я нажимаю на кнопку с именем 'FormCreate'
			Тогда открылось окно "Product range (create)"
			И в поле с именем 'Description' я ввожу текст '[TheProductName]'
			И в поле с именем 'SKU' я ввожу текст '[TheProductID]'
			И из выпадающего списка с именем 'Parent' я выбираю по строке '[TheProductParent]'
			И из выпадающего списка с именем 'UnitOfMeasure' я выбираю по строке "PCs"
			Если 'NOT $$ЭтоPerform$$' Тогда
				И из выпадающего списка с именем 'ProductKind' я выбираю по строке '[TheProductKind]'
		ИначеЕсли '$$IsERPCPM$$' Тогда
			И я нажимаю на кнопку с именем 'ListAdvancedSearchProductsCreate'
			Тогда открылось окно "Product range (create)"
			И из выпадающего списка с именем 'ProductKindОбязательныеFields' я выбираю по строке '[TheProductKind]'
			И я меняю значение переключателя с именем 'SettingВидимостиForms' на 'Show все'
			И в поле с именем 'Description' я ввожу текст '[TheProductName]'
			И в поле с именем 'SKU' я ввожу текст '[TheProductID]'			
		И я нажимаю на кнопку с именем 'FormWriteAndClose'
		И я жду закрытия окна "Product range (create) *" в течение 20 секунд

	* Закрываем список
		Когда открылось окно "Product range"
		Если '$$IsERPCPM$$' Тогда
			И я устанавливаю флаг с именем 'UseDisplayFilters'
		И Я закрываю окно "Product range"	

Сценарий: Я создаю вид номенклатуры с именем 'TheProductKindName'

	* Открываем список
		И В командном интерфейсе я выбираю "Catalogs" "Product range"
		Когда открылось окно "Product range"
		И В текущем окне я нажимаю кнопку командного интерфейса "Виды номенклатуры"

	* Удаляем текущий элемент		
		И я нажимаю на кнопку с именем 'FormFind'
		Тогда открылась форма с именем 'UniversalListFindExtForm'
		И из выпадающего списка с именем 'FieldSelector' я выбираю точное значение "Description"
		И в поле с именем 'Pattern' я ввожу текст '[TheProductKindName]'
		И я меняю значение переключателя с именем 'CompareType' на "Exact match"
		И я нажимаю на кнопку с именем 'Find'
		И Пока в таблице 'List' количество строк 'больше' 0 Тогда
			* Ставим пометку на удаление
				Если в таблице 'List' текущая строка не помечена на удаление Тогда
					И я выбираю пункт контекстного меню с именем 'ListContextMenuSetDeletionMark' на элементе формы с именем 'List'
					Тогда открылось окно "1C:Enterprise"
					И я нажимаю на кнопку с именем 'Button0'
			* Перименовываем
				И Я запоминаю значение выражения 'StrReplace(New UUID, "-", "")' в переменную 'UID'		
				И в таблице 'List' я выбираю текущую строку
				Когда открылось окно "* (Виды номенклатуры)"		
				Тогда в поле с именем 'Description' я ввожу значение переменной 'UID'
				И я нажимаю на кнопку с именем 'FormWriteAndClose'
				И я жду закрытия окна "* (Виды номенклатуры) *" в течение 20 секунд

	* Создаем новый элемент
		Когда открылось окно "Product range"
		И я нажимаю на кнопку с именем 'FormCreate'
		Тогда открылось окно "Виды номенклатуры (create)"
		И в поле с именем 'Description' я ввожу текст '[TheProductKindName]'
		И я меняю значение переключателя с именем 'CPM_ObjectTypePurchases' на 'Товар'
		И я нажимаю на кнопку с именем 'FormWriteAndClose'
		И я жду закрытия окна "Виды номенклатуры (create) *" в течение 20 секунд

	* Закрываем список
		Когда открылось окно "Product range"
		И Я закрываю окно "Product range"

Сценарий: Я создаю товарную категорию с именем 'TheProductCategoryName' видом номенклатуры 'TheProductKind'

	* Открываем список
		И В командном интерфейсе я выбираю "Корпоративные закупки" "Product categories"
		Тогда открылось окно "Product categories"

	* Найдем вид номенклатуры
		Если '$$IsCPM$$' Тогда
			И я нажимаю на кнопку с именем 'FormFind'
			Тогда открылась форма с именем 'UniversalListFindExtForm'
			И из выпадающего списка с именем 'FieldSelector' я выбираю точное значение "Description"
		Если '$$IsERPCPM$$' Тогда
			И я выбираю пункт контекстного меню с именем 'ListOfSpeciesНоменклатурыContextMenuFind' на элементе формы с именем 'ListOfSpeciesНоменклатуры'
			Тогда открылась форма с именем 'UniversalListFindExtForm'
			И из выпадающего списка с именем 'FieldSelector' я выбираю точное значение "Kind номенклатуры"
			И в поле с именем 'Pattern' я ввожу текст '[TheProductKind]'
			И я меняю значение переключателя с именем 'CompareType' на "Exact match"
			И я нажимаю на кнопку с именем 'Find'
			Тогда открылось окно "Product categories"
			И в таблице 'ListOfSpeciesНоменклатуры' количество строк 'равно' 1
			И в таблице 'List' я нажимаю на кнопку с именем 'ListFind'
			Тогда открылась форма с именем 'UniversalListFindExtForm'
			И из выпадающего списка с именем 'FieldSelector' я выбираю точное значение "Товарная категория"		

	* Удаляем текущий элемент 
		И в поле с именем 'Pattern' я ввожу текст '[TheProductCategoryName]'
		И я меняю значение переключателя с именем 'CompareType' на "Exact match"
		И я нажимаю на кнопку с именем 'Find'
		И Пока в таблице 'List' количество строк 'больше' 0 Тогда
			* Ставим пометку на удаление
				Если в таблице 'List' текущая строка не помечена на удаление Тогда
					И я выбираю пункт контекстного меню с именем 'ListContextMenuSetDeletionMark' на элементе формы с именем 'List'
					Тогда открылось окно "1C:Enterprise"
					И я нажимаю на кнопку с именем 'Button0'
			* Перименовываем 
				И Я запоминаю значение выражения 'StrReplace(New UUID, "-", "")' в переменную 'UID'
				И в таблице 'List' я выбираю текущую строку
				Когда открылось окно "* (Product categories)"
				Тогда в поле с именем 'Description' я ввожу значение переменной 'UID'
				И я нажимаю на кнопку с именем 'FormWriteAndClose'
				И я жду закрытия окна "* (Product categories) *" в течение 20 секунд

	* Создаем новый элемент
		Если '$$IsCPM$$' Тогда
			И я нажимаю на кнопку с именем 'FormCreate'
			И из выпадающего списка с именем 'ProductKind' я выбираю по строке '[TheProductKind]'		
		Если '$$IsERPCPM$$' Тогда
			И в таблице 'List' я нажимаю на кнопку с именем 'ListCreate'				
			И из выпадающего списка с именем 'Owner' я выбираю по строке '[TheProductKind]'
		Тогда открылось окно "Product categories (create) *"
		И в поле с именем 'Description' я ввожу текст '[TheProductCategoryName]'
		И из выпадающего списка с именем 'VATRate' я выбираю точное значение "20%"
		И из выпадающего списка с именем 'UnitOfMeasure' я выбираю по строке "PCs"					
		И я нажимаю на кнопку с именем 'FormWriteAndClose'
		И я жду закрытия окна "Product categories (create) *" в течение 20 секунд

	* Закрываем список
		Когда открылось окно "Product categories"
		И Я закрываю окно "Product categories"

Сценарий: Я создаю номенклатурную группу с именем 'TheProductGroupName'

	* Открываем список
		И я открываю основную форму списка справочника 'ProductRangeGroups'
		Тогда открылось окно "Product range groups"

	* Удаляем элемент
		И я нажимаю на кнопку с именем 'FormFind'
		Тогда открылась форма с именем 'UniversalListFindExtForm'
		И из выпадающего списка с именем 'FieldSelector' я выбираю точное значение "Description"
		И в поле с именем 'Pattern' я ввожу текст '[TheProductGroupName]'
		И я меняю значение переключателя с именем 'CompareType' на "Exact match"
		И я нажимаю на кнопку с именем 'Find'
		Тогда открылось окно "Product range groups"
		И Пока в таблице 'List' количество строк 'больше' 0 Тогда
			* Ставим пометку на удаление	
				Если в таблице 'List' текущая строка не помечена на удаление Тогда
					И я выбираю пункт контекстного меню с именем 'ListContextMenuSetDeletionMark' на элементе формы с именем 'List'
					Тогда открылось окно "1C:Enterprise"
					И я нажимаю на кнопку с именем 'Button0'
			* Переименовываем
				И Я запоминаю значение выражения 'StrReplace(New UUID, "-", "")' в переменную 'UID'
				И в таблице 'List' я выбираю текущую строку
				Тогда открылось окно "* (Product range group)"
				И в поле с именем 'Description' я ввожу значение переменной 'UID'
				И я нажимаю на кнопку с именем 'FormWriteAndClose'
				И я жду закрытия окна "* (Product range group) *" в течение 20 секунд
	
	* Создаем элементм
		И я нажимаю на кнопку с именем 'FormCreate'
		Тогда открылось окно "Product range group (create)"
		И в поле с именем 'Description' я ввожу текст '[TheProductGroupName]'
		И я нажимаю на кнопку с именем 'FormWriteAndClose'
		И я жду закрытия окна "Product range group (create) *" в течение 20 секунд

	* Закрываем список
		Когда открылось окно "Product range groups"
		И Я закрываю окно "Product range groups"

Сценарий: Я для номенклатуры с именем 'TheProductName' для реквизита 'TheAttributeName' выбираю значение 'TheValuesName' в группе 'TheGroupName' 

	* Открываем список
		Если '$$ЭтоPerform$$' Тогда
			И В командном интерфейсе я выбираю "Quick menu" "Product range"		
		ИначеЕсли '$$IsCPM$$' Тогда
			И В командном интерфейсе я выбираю "Catalogs" "Product range"
		ИначеЕсли '$$IsERPCPM$$' Тогда
			И В командном интерфейсе я выбираю "Quick menu" "Product range"
			И я снимаю флаг с именем 'UseDisplayFilters'		
		Тогда открылось окно "Product range"

	* Ищем текущий элемент
		Если '$$IsCPM$$' Тогда
			И я выбираю пункт контекстного меню с именем 'ListContextMenuFind' на элементе формы с именем 'List'
			Тогда открылась форма с именем 'UniversalListFindExtForm'
			И из выпадающего списка с именем 'FieldSelector' я выбираю точное значение "Description"
			И в поле с именем 'Pattern' я ввожу текст '[TheProductName]'
			И я меняю значение переключателя с именем 'CompareType' на "Exact match"
			И я нажимаю на кнопку с именем 'Find'
			Когда открылось окно "Product range"
			И в таблице 'List' я выбираю текущую строку

		ИначеЕсли '$$IsERPCPM$$' Тогда
			И пауза 1
			И я нажимаю кнопку очистить у поля с именем 'SearchStringProducts'					
			И в поле с именем 'SearchStringProducts' я ввожу текст '[TheProductName]'
			И я нажимаю на кнопку с именем 'Find'				
			Если появилось окно с заголовком 'Search' в течение 1 секунд Тогда
				И я нажимаю на кнопку с именем 'Button0'
			Когда открылось окно "Product range"
			И я устанавливаю флаг с именем 'UseDisplayFilters'					
			И в таблице 'ListAdvancedSearchProducts' я выбираю текущую строку
			Тогда открылось окно "* (Product range)"
			И я перехожу к закладке с именем 'PageProductAttributes'
			Если появилось окно с заголовком 'Полезный совет' в течение 1 секунд Тогда
				И я нажимаю на кнопку с именем 'Button0'

	* Устанавливаем реквизит		
		Тогда открылось окно "* (Product range)"
		Если 'NOT IsBlankString(\"[TheGroupName]\")' Тогда
			И я разворачиваю группу с именем '[TheGroupName]'
		Если 'IsBlankString(\"[TheValuesName]\")' Тогда
			И в поле с именем '[TheAttributeName]' я ввожу текст ''
		Иначе						
			И из выпадающего списка с именем '[TheAttributeName]' я выбираю по строке '[TheValuesName]'
		И я нажимаю на кнопку с именем 'FormWriteAndClose'
		И я жду закрытия окна "* (Product range) *" в течение 20 секунд

	* Закрываем формы
		Тогда открылось окно "Product range"
		И Я закрываю окно "Product range"

Сценарий: Я создаю внешнюю информационную базу с именем 'TheExternalInfobaseName' и типом 'TheExternalInfobaseType'

	* Открываем список
		И В командном интерфейсе я выбираю "Integration and master data management" "External infobases"

	* Удаляем текущий элемент	
		Тогда открылось окно "External infobases"
		И я нажимаю на кнопку с именем 'FormFind'
		Тогда открылась форма с именем 'UniversalListFindExtForm'
		И из выпадающего списка с именем 'FieldSelector' я выбираю точное значение "External infobase"
		И я меняю значение переключателя с именем 'CompareType' на "At beginning of line"
		И в поле с именем 'Pattern' я ввожу текст '[TheExternalInfobaseName]'
		И я нажимаю на кнопку с именем 'Find'
		Тогда открылось окно "External infobases"
		И Пока в таблице 'List' количество строк 'больше' 0 Тогда
			* Ставим пометку на удаление
				И я выбираю пункт контекстного меню с именем 'ListContextMenuSetDeletionMark' на элементе формы с именем 'List'
				Тогда открылось окно "1C:Enterprise"
				И я нажимаю на кнопку с именем 'Button0'
			* Перименовываем
				И Я запоминаю значение выражения 'StrReplace(New UUID, "-", "")' в переменную 'UID'	
				И в таблице 'List' я выбираю текущую строку
				Тогда открылось окно '[TheExternalInfobaseName] (External infobases)'
				И в поле с именем 'Description' я ввожу значение переменной 'UID'
				И я нажимаю на кнопку с именем 'WriteAndClose'
				И я жду закрытия окна '[TheExternalInfobaseName] (External infobases) *' в течение 20 секунд

	* Создаем новый элемент			
		И я нажимаю на кнопку с именем 'FormCreate'
		Тогда открылось окно "External infobases (create)"
		И в поле с именем 'Description' я ввожу текст '[TheExternalInfobaseName]'
		И из выпадающего списка с именем 'ExternalSourceType' я выбираю по строке '[TheExternalInfobaseType]'
		И в поле с именем 'NameBeginning' я ввожу текст '$DirectoryПроекта$'
		И я нажимаю на кнопку с именем 'WriteAndClose'
		И я жду закрытия окна "External infobases (create) *" в течение 20 секунд

	* Закрываем список
		Когда открылось окно "External infobases"
		И Я закрываю окно "External infobases"			
