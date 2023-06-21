﻿#language: ru

@tree

Функционал: 17. Процесс подготовки отчетности

Как Администратор я хочу
чтобы процесс подготовки отчетности работал без ошибок

Контекст:

	И я подключаю TestClient "CPM - Budget" логин "Administrator" пароль ''	
	И я закрыл все окна клиентского приложения

Сценарий: 17.00 Определение типа приложения

	Пусть Инициализация переменных

Сценарий: 17.01 Создание группы видов отчетов "VA - Report preparation process (group)"

	И Я создаю группу видов отчетов с именем "VA - Report preparation process (group)" и родителем "VA - Report group"

Сценарий: 17.02 Создание вида отчета "VA - ProcessQuantity"

	* Создаем вид отчета
		И Я создаю вид отчета с именем "VA - ProcessQuantity" и родителем "VA - Report preparation process (group)"

	* Настраиваем структуру
		И я открываю контруктор отчета с именем "VA - ProcessQuantity"
		И Я в конструкторе отчета добавляю строку с именем "Goods"
		И Я в конструкторе отчета добавляю колонку с именем "Quantity"
		И Я в конструкторе отчета добавляю аналитику с кодом "VA0Product" в ячейку 'R2C2'
	
	* Создаем бланк
		И Я Для вида отчета "VA - ProcessQuantity" создаю бланк по умолчанию

Сценарий: 17.03 Создание вида отчета "VA - ProcessPrice"

	* Создаем вид отчета
		И Я создаю вид отчета с именем "VA - ProcessPrice" и родителем "VA - Report preparation process (group)"

	* Настраиваем структуру
		И я открываю контруктор отчета с именем "VA - ProcessPrice"
		И Я в конструкторе отчета добавляю строку с именем "Goods"
		И Я в конструкторе отчета добавляю колонку с именем "Price"
		И Я в конструкторе отчета добавляю аналитику с кодом "VA0Product" в ячейку 'R2C2'
	
	* Создаем бланк
		И Я Для вида отчета "VA - ProcessPrice" создаю бланк для импорта по умолчанию

Сценарий: 17.04 Создание внешней информационной базы "VA - ProcessImportPrice"

	И Я создаю внешнюю информационную базу "VA - ProcessImportPrice" тип "Microsoft Excel files" каталог "$КаталогПроекта$\Макеты" тип хранилища ''

	* Тестируем механизм маски имени
		И я нажимаю на кнопку с именем 'NameStructureAdd'
		И в таблице 'NameStructure' из выпадающего списка с именем 'NameStructureItem' я выбираю точное значение "Report type"
		И в таблице 'NameStructure' из выпадающего списка с именем 'NameStructureStartElement' я выбираю точное значение "+"
		И в таблице 'NameStructure' из выпадающего списка с именем 'NameStructureItem' я выбираю точное значение "Company"
		И в таблице 'NameStructure' я отменяю редактирование строки
		Тогда элемент формы с именем 'FullNameMask' стал равен "$КаталогПроекта$\Макеты\<Report type>+<Company>.xls?"

	* Наставиваем элементы пути	
		Тогда открылось окно '$WindowTitle$'
		И я нажимаю на кнопку с именем 'OpenCompaniesFilesExchangeSettings'
		И Я добавляю элемент пути к файлам организаций для типа 'Organization' объект "Mercury LLC" значение "Mercury"
		И Я добавляю элемент пути к файлам организаций для типа 'Organization' объект "Venus LLC" значение "Venus"
		И Я добавляю элемент пути к файлам организаций для типа 'ReportKind' объект "VA - ProcessPrice" значение "ВА_ПроцессЦена"
		Тогда открылось окно "Company file path items: List form"
		И я нажимаю на кнопку с именем 'FormClose'

	* Записываем и закрываем элемент
		Тогда открылось окно '$WindowTitle$'
		И я нажимаю на кнопку с именем 'FormWriteAndClose'
		И я жду закрытия окна '$WindowTitle$' в течение 20 секунд

Сценарий: 17.05 Создание вида отчета "VA - ProcessAmount"

	* Создаем вид отчета
		И Я создаю вид отчета с именем "VA - ProcessAmount" и родителем "VA - Report preparation process (group)"

	* Настраиваем структуру
		И я открываю контруктор отчета с именем "VA - ProcessAmount"
		И Я в конструкторе отчета добавляю строку с именем "Goods"
		И Я в конструкторе отчета добавляю колонки
			| 'Description' |
			| "Quantity"   |
			| "Price"         |
			| "Amount"        |
		И Я в конструкторе отчета добавляю аналитику с кодом "VA0Product" в ячейку 'R2C2'
		
	* Настраиваем формулы
		И Я в конструкторе отчета для ячейки 'R2C2' настраиваю связь с покзателем с кодом "Goods_Quantity" вида отчета "VA - ProcessQuantity"
		И Я в конструкторе отчета для ячейки 'R2C3' настраиваю связь с покзателем с кодом "Goods_Price" вида отчета "VA - ProcessPrice"
		И Я в конструкторе отчета для ячейки 'R2C4' задаю формулу произведение ячеек 'R2C2' 'R2C3'

	* Закрываем конструктор
		Когда открылось окно "Edit tree"
		И Я закрываю окно "Edit tree"
		
	* Создаем бланк
		И Я Для вида отчета "VA - ProcessAmount" создаю бланк по умолчанию

Сценарий: 17.06 Создание регламента и процесса подготовки отчетности "VA - Report preparation process"

	* Открываем регламент
		И В командном интерфейсе я выбираю "Budgeting, reporting, and analysis" "Regulations for preparing reports"

	* Удаляем текущий элемент	
		Тогда открылось окно "Regulations for preparing reports"
		И я нажимаю на кнопку с именем 'FormFind'
		Тогда открылась форма с именем 'UniversalListFindExtForm'
		И из выпадающего списка с именем 'FieldSelector' я выбираю точное значение "Description"
		И я меняю значение переключателя с именем 'CompareType' на "Exact match"
		И в поле с именем 'Pattern' я ввожу текст "VA - Report preparation process"
		И я нажимаю на кнопку с именем 'Find'
		И Пока в таблице 'List' количество строк 'больше' 0 Тогда
			И Я запоминаю значение выражения 'StrReplace(New UUID, "-", "")' в переменную 'UID'
			И в таблице 'List' я выбираю текущую строку
			Тогда Открылся регламент подготовки отчетности "VA - Report preparation process"
			И я перехожу к закладке с именем 'GroupMainPage'			
			* Удаляем процесс
				И я нажимаю на кнопку с именем 'ShowProcessTemplate'
				Тогда открылось окно "Editing process stages: VA - Report preparation process"
				И я нажимаю на кнопку с именем 'FormOpenProcessProperties'
				Тогда открылось окно "VA - Report preparation process (Universal process template)"
				И в поле с именем 'Description' я ввожу значение переменной 'UID'
				И я нажимаю на кнопку с именем 'FormSetDeletionMark'
				Тогда открылось окно "1C:Enterprise"
				И я нажимаю на кнопку с именем 'Button0'
				И я нажимаю на кнопку с именем 'FormWriteAndClose'
				И я жду закрытия окна "VA - Report preparation process (Universal process template) *" в течение 20 секунд
				Тогда открылось окно "Editing process stages: VA - Report preparation process"
				И Я закрываю окно "Editing process stages: VA - Report preparation process"
			Когда открылось окно '$WindowTitle$'
			И в поле с именем 'Description' я ввожу значение переменной 'UID'
			И я нажимаю на кнопку с именем 'FormSetDeletionMark'
			Тогда открылось окно "1C:Enterprise"
			И я нажимаю на кнопку с именем 'Button0'
			И я нажимаю на кнопку с именем 'FormWriteAndClose'
			И я жду закрытия окна '$WindowTitle$' в течение 20 секунд

	* Находим элемент копирования
		Тогда открылось окно "Regulations for preparing reports"
		И я нажимаю на кнопку с именем 'FormFind'
		Тогда открылась форма с именем 'UniversalListFindExtForm'
		И из выпадающего списка с именем 'FieldSelector' я выбираю точное значение "Description"
		И я меняю значение переключателя с именем 'CompareType' на "Exact match"
		И в поле с именем 'Pattern' я ввожу текст "VA - Main regulations"
		И я нажимаю на кнопку с именем 'Find'
		И в таблице 'List' количество строк 'равно' 1
		И я нажимаю на кнопку с именем 'FormCopy'
		Тогда открылось окно "VA - Main regulations from *"
		И в поле с именем 'Description' я ввожу текст "VA - Report preparation process"
		И из выпадающего списка с именем 'ReportKind' я выбираю по строке "VA - Report preparation process (group)"
		* Создаем процесс
			И я устанавливаю флаг с именем 'UseProcess'
			И я нажимаю на кнопку с именем 'ShowProcessTemplate'
			Тогда открылось окно "1C:Enterprise"
			И я нажимаю на кнопку с именем 'Button0'
			Тогда открылось окно "Enter a process template name"
			И в поле с именем 'InputFld' я ввожу текст "VA - Report preparation process"
			И я нажимаю на кнопку с именем 'OK'
			Тогда открылось окно "Editing process stages: VA - Report preparation process"
			И я нажимаю на кнопку с именем 'FormOpenProcessProperties'
			* Проверяем заполнение
				Тогда элемент формы с именем 'ProcessPurpose' стал равен "Report preparation process"
				И элемент формы с именем 'Description' стал равен "VA - Report preparation process"
				И таблица 'ProcessParameters' стала равной:
					| "Predefined" | "Key" | "Parameter code"              | "Parameter name"                | "Parameter type"                | "Default value" |
					| "Yes"               | "Yes"       | 'УправлениеОтчетнымПериодом' | "Reporting period management" | "Reporting period management" | ""                      |
					| "Yes"               | "No"      | 'ИнициаторПроцесса'          | "Process initiator"           | "User"                 | ""                      |
				И элемент формы с именем 'Parent' стал равен ''
				И элемент формы с именем 'LinkedRegulation' стал равен "VA - Report preparation process"
				Когда открылось окно "VA - Report preparation process (Universal process template)"
				И Я закрываю окно "VA - Report preparation process (Universal process template)"
			Тогда открылось окно "Editing process stages: VA - Report preparation process"
			И Я закрываю окно "Editing process stages: VA - Report preparation process"
			Тогда открылось окно "VA - Report preparation process from * (Regulation for preparing reports)"
			И я нажимаю на кнопку с именем 'FormWriteAndClose'
			И я жду закрытия окна "VA - Report preparation process from * (Regulation for preparing reports)" в течение 20 секунд

Сценарий: 17.07 Тестируем кнопки управления процессом

	* Ищем элемент
		И В командном интерфейсе я выбираю "Processes and approval" "Process templates"
		Когда открылось окно "Universal process templates"
		И я нажимаю на кнопку с именем 'FormFind'
		Тогда открылось окно "Find"
		И из выпадающего списка с именем 'FieldSelector' я выбираю точное значение "Description"
		И в поле с именем 'Pattern' я ввожу текст "VA - Report preparation process"
		И я меняю значение переключателя с именем 'CompareType' на "Exact match"
		И я нажимаю на кнопку с именем 'Find'
		И в таблице 'List' количество строк 'равно' 1
		И в таблице 'List' я выбираю текущую строку

	* Проверяем, что документ пустой
		Когда открылось окно "Editing process stages: VA - Report preparation process"
		И я нажимаю на кнопку с именем 'Edit'
		Тогда открылось окно "Select step"
		И в таблице 'List' количество строк 'равно' 0
		И элемент формы с именем 'ProcessTemplate' стал равен "VA - Report preparation process"
		И я закрываю окно "Select step"

	* Добавляем процесс для удаления
		Когда открылось окно "Editing process stages: VA - Report preparation process"
		И я нажимаю на кнопку с именем 'AddStage_ReportPreparationProcessStep'
		Тогда открылось окно "Step of report preparation process (Universal process step)"
		И в поле с именем 'Description' я ввожу текст "Для удаления"
		И я нажимаю на кнопку с именем 'FormWriteAndClose'
		И я жду закрытия окна "Step of report preparation process (Universal process step) *" в течение 20 секунд

	* Копируем процесс
		Когда открылось окно "Editing process stages: VA - Report preparation process"
		И я нажимаю на кнопку с именем 'Copy'
		И Я в списке "Select step" по полю "Description" ищу и выбираю элемент "Для удаления" "Exact match"		
		Тогда открылось окно "Universal process step (Create)"
		И в поле с именем 'Description' я ввожу текст "Копия для удаления"
		И я нажимаю на кнопку с именем 'FormWriteAndClose'
		И я жду закрытия окна "Universal process step (Create) *" в течение 20 секунд	

	* Изменяем процесс
		Когда открылось окно "Editing process stages: VA - Report preparation process"
		И я нажимаю на кнопку с именем 'Edit'
		И Я в списке "Select step" по полю "Description" ищу и выбираю элемент "Копия для удаления" "Exact match"		
		Когда открылось окно "Копия для удаления (Universal process step)"
		И в поле с именем 'Description' я ввожу текст "Отредактированная copy для удаления"
		И я нажимаю на кнопку с именем 'FormWriteAndClose'
		И я жду закрытия окна "Копия для удаления (Universal process step) *" в течение 20 секунд	

	* Настраиваем связь
		Когда открылось окно "Editing process stages: VA - Report preparation process"
		И я нажимаю на кнопку с именем 'AddLink'
		И Я в списке "Select initial link step" по полю "Description" ищу и выбираю элемент "Для удаления" "Exact match"
		И Я в списке "Select end link step" по полю "Description" ищу и выбираю элемент "Отредактированная copy для удаления" "Exact match"		

	* Удаляем связь
		Когда открылось окно "Editing process stages: VA - Report preparation process"
		И я нажимаю на кнопку с именем 'DeleteLink'
		И Я в списке "Select initial link step" по полю "Description" ищу и выбираю элемент "Для удаления" "Exact match"
		И Я в списке "Select end link step" по полю "Description" ищу и выбираю элемент "Отредактированная copy для удаления" "Exact match"

	* Удаляем процесс
		Тогда открылось окно "Editing process stages: VA - Report preparation process"
		И я нажимаю на кнопку с именем 'MarkToDelete'
		И Я в списке "Select step" по полю "Description" ищу и выбираю элемент "Отредактированная copy для удаления" "Exact match"					
		Тогда открылось окно "1C:Enterprise"
		И я нажимаю на кнопку с именем 'Button0'

	* Удаляем процесс
		Тогда открылось окно "Editing process stages: VA - Report preparation process"
		И я нажимаю на кнопку с именем 'MarkToDelete'
		И Я в списке "Select step" по полю "Description" ищу и выбираю элемент "Для удаления" "Exact match"
		Тогда открылось окно "1C:Enterprise"
		И я нажимаю на кнопку с именем 'Button0'

	* Проверяем, что документ пустой
		Когда открылось окно "Editing process stages: VA - Report preparation process"
		И я нажимаю на кнопку с именем 'MarkToDelete'
		Тогда открылось окно "Select step"
		И в таблице 'List' количество строк 'равно' 0
		И элемент формы с именем 'ProcessTemplate' стал равен "VA - Report preparation process"
		И я закрываю окно "Select step"		

Сценарий: 17.08 Настройка процесса

	* Ищем элемент
		И В командном интерфейсе я выбираю "Processes and approval" "Process templates"
		Когда открылось окно "Universal process templates"
		И я нажимаю на кнопку с именем 'FormFind'
		Тогда открылось окно "Find"
		И из выпадающего списка с именем 'FieldSelector' я выбираю точное значение "Description"
		И в поле с именем 'Pattern' я ввожу текст "VA - Report preparation process"
		И я меняю значение переключателя с именем 'CompareType' на "Exact match"
		И я нажимаю на кнопку с именем 'Find'
		И в таблице 'List' количество строк 'равно' 1
		И в таблице 'List' я выбираю текущую строку

	* Настриваем процесс для "ВА - ПроцессКоличество"
		Когда открылось окно "Editing process stages: VA - Report preparation process"
		И я нажимаю на кнопку с именем 'AddStage_ReportPreparationProcessStep'
		Тогда открылось окно "Step of report preparation process (Universal process step)"
		И в поле с именем 'Description' я ввожу текст "Manual filling - \"VA - ProcessQuantity\""
		* Документы
			И в таблице 'GeneratedDocuments_' я нажимаю на кнопку с именем 'GeneratedDocuments_Add'
			И в таблице 'GeneratedDocuments_' я нажимаю кнопку выбора у реквизита с именем 'DocumentsToGenerateDBDocument'
			И Я в списке "Infobase documents" по полю "Document" ищу и выбираю элемент "Report instance" "At beginning of line"
			И в таблице 'GeneratedDocuments_' из выпадающего списка с именем 'GeneratedDocumentsDocumentTemplate' я выбираю по строке "VA - ProcessQuantity"
		* Организации
			И я перехожу к закладке с именем 'Page_BusinessUnitsFilter'
			И в таблице 'BusinessUnitsFilterDCSSettingsFilter' я нажимаю на кнопку с именем 'BusinessUnitsFilterDCSSettingsFilterAddFilterItem'
			И в таблице 'BusinessUnitsFilterDCSSettingsFilter' из выпадающего списка с именем 'BusinessUnitsFilterDCSSettingsFilterLeftValue' я выбираю точное значение "Business unit"
			И в таблице 'BusinessUnitsFilterDCSSettingsFilter' из выпадающего списка с именем 'BusinessUnitsFilterDCSSettingsFilterComparisonType' я выбираю точное значение "In list"
			И в таблице 'BusinessUnitsFilterDCSSettingsFilter' я нажимаю кнопку выбора у реквизита с именем 'BusinessUnitsFilterDCSSettingsFilterRightValue'
			Тогда открылось окно "Value list"
			И я нажимаю на кнопку с именем 'Add'
			И в таблице 'ValueList' из выпадающего списка с именем 'value' я выбираю по строке "Mercury LLC"
			И я нажимаю на кнопку с именем 'Add'
			И в таблице 'ValueList' из выпадающего списка с именем 'value' я выбираю по строке "Venus LLC"
			И я нажимаю на кнопку с именем 'OK'
			Тогда открылось окно "Step of report preparation process (Universal process step) *"
		* Настройки регламента
			И я перехожу к закладке с именем 'Page_RegulationSettings'
			И я нажимаю на кнопку с именем 'SetupAutofillRules'			
			* Меркурий
				Тогда открылось окно "Set up object filling rules for regulation VA - Report preparation process"
				И в табличном документе 'CustomField' я перехожу к ячейке 'R5C3'
				И в табличном документе 'CustomField' я делаю двойной клик на текущей ячейке
				Тогда открылось окно "Set up report filling rules"
				И из выпадающего списка с именем 'ReportGenerationMethod' я выбираю точное значение "Manual filling"
				И я нажимаю на кнопку с именем 'FormWriteAndClose'
			* Венера
				Тогда открылось окно "Set up object filling rules for regulation VA - Report preparation process"
				И в табличном документе 'CustomField' я перехожу к ячейке 'R12C3'
				И в табличном документе 'CustomField' я делаю двойной клик на текущей ячейке
				Тогда открылось окно "Set up report filling rules"
				И из выпадающего списка с именем 'ReportGenerationMethod' я выбираю точное значение "Manual filling"
				И я нажимаю на кнопку с именем 'FormWriteAndClose'
			* Применение настроек
				Тогда открылось окно "Set up object filling rules for regulation VA - Report preparation process"
				И я нажимаю на кнопку с именем 'FormApplySettings'
				И Я закрываю окно "Set up object filling rules for regulation VA - Report preparation process"
		* Сохранение
			Тогда открылось окно "* (Universal process step)"
			И я нажимаю на кнопку с именем 'FormWriteAndClose'
			И я жду закрытия окна "* (Universal process step)" в течение 20 секунд
				
	* Настриваем процесс для "ВА - ПроцессЦена"
		Когда открылось окно "Editing process stages: VA - Report preparation process"
		И я нажимаю на кнопку с именем 'AddStage_ReportPreparationProcessStep'
		Тогда открылось окно "Step of report preparation process (Universal process step)"
		И в поле с именем 'Description' я ввожу текст "Import - \"VA - ProcessPrice\""				
		* Документы
			И в таблице 'GeneratedDocuments_' я нажимаю на кнопку с именем 'GeneratedDocuments_Add'
			И в таблице 'GeneratedDocuments_' я нажимаю кнопку выбора у реквизита с именем 'DocumentsToGenerateDBDocument'
			И Я в списке "Infobase documents" по полю "Document" ищу и выбираю элемент "Report instance" "At beginning of line"
			И в таблице 'GeneratedDocuments_' из выпадающего списка с именем 'GeneratedDocumentsDocumentTemplate' я выбираю по строке "VA - ProcessPrice"
		* Организации
			И я перехожу к закладке с именем 'Page_BusinessUnitsFilter'
			И в таблице 'BusinessUnitsFilterDCSSettingsFilter' я нажимаю на кнопку с именем 'BusinessUnitsFilterDCSSettingsFilterAddFilterItem'
			И в таблице 'BusinessUnitsFilterDCSSettingsFilter' из выпадающего списка с именем 'BusinessUnitsFilterDCSSettingsFilterLeftValue' я выбираю точное значение "Business unit"
			И в таблице 'BusinessUnitsFilterDCSSettingsFilter' из выпадающего списка с именем 'BusinessUnitsFilterDCSSettingsFilterComparisonType' я выбираю точное значение "In list"
			И в таблице 'BusinessUnitsFilterDCSSettingsFilter' я нажимаю кнопку выбора у реквизита с именем 'BusinessUnitsFilterDCSSettingsFilterRightValue'
			Тогда открылось окно "Value list"
			И я нажимаю на кнопку с именем 'Add'
			И в таблице 'ValueList' из выпадающего списка с именем 'value' я выбираю по строке "Mercury LLC"
			И я нажимаю на кнопку с именем 'Add'
			И в таблице 'ValueList' из выпадающего списка с именем 'value' я выбираю по строке "Venus LLC"
			И я нажимаю на кнопку с именем 'OK'
			Тогда открылось окно "Step of report preparation process (Universal process step) *"
		* Настройки регламента
			И я перехожу к закладке с именем 'Page_RegulationSettings'
			И я нажимаю на кнопку с именем 'SetupAutofillRules'			
			* Меркурий
				Тогда открылось окно "Set up object filling rules for regulation VA - Report preparation process"
				И в табличном документе 'CustomField' я перехожу к ячейке 'R5C3'
				И в табличном документе 'CustomField' я делаю двойной клик на текущей ячейке
				Тогда открылось окно "Set up report filling rules"
				* Настраиваем тип информационной базы
					И я нажимаю на кнопку открытия поля с именем 'ProcessingRule'
					Тогда открылось окно "VA - ProcessPrice (Calculation rules)"
					И из выпадающего списка с именем 'DBType' я выбираю точное значение "Microsoft Excel files"
					И я нажимаю на кнопку с именем 'FormWriteAndClose'
					И я жду закрытия окна "VA - ProcessPrice (Calculation rules) *" в течение 20 секунд
				* Проверяем тип информационной базы
					Тогда открылось окно "Set up report filling rules"
					И из выпадающего списка с именем 'ReportGenerationMethod' я выбираю точное значение "Import"
					И из выпадающего списка с именем 'ProcessingRule' я выбираю по строке "VA - ProcessPrice"
					И из выпадающего списка с именем 'ExternalSource' я выбираю по строке "VA - ProcessImportPrice"
					И элемент формы с именем 'ImportTemplate' стал равен "VA - ProcessPrice"
				И я нажимаю на кнопку с именем 'FormWriteAndClose'
			* Венера
				Тогда открылось окно "Set up object filling rules for regulation VA - Report preparation process"
				И в табличном документе 'CustomField' я перехожу к ячейке 'R12C3'
				И в табличном документе 'CustomField' я делаю двойной клик на текущей ячейке
				Тогда открылось окно "Set up report filling rules"
				И из выпадающего списка с именем 'ReportGenerationMethod' я выбираю точное значение "Import"
				И из выпадающего списка с именем 'ExternalSource' я выбираю по строке "VA - ProcessImportPrice"
				И я нажимаю на кнопку с именем 'FormWriteAndClose'
			* Применение настроек
				Тогда открылось окно "Set up object filling rules for regulation VA - Report preparation process"
				И я нажимаю на кнопку с именем 'FormApplySettings'
				И Я закрываю окно "Set up object filling rules for regulation VA - Report preparation process"
		* Сохранение
			Тогда открылось окно "* (Universal process step)"
			И я нажимаю на кнопку с именем 'FormWriteAndClose'
			И я жду закрытия окна "* (Universal process step)" в течение 20 секунд

	* Настриваем процесс для "ВА - ПроцессСумма"
		Когда открылось окно "Editing process stages: VA - Report preparation process"
		И я нажимаю на кнопку с именем 'AddStage_ReportPreparationProcessStep'
		Тогда открылось окно "Step of report preparation process (Universal process step)"
		И в поле с именем 'Description' я ввожу текст "Calculation by rule - \"VA - ProcessAmount\""
		* Документы
			И в таблице 'GeneratedDocuments_' я нажимаю на кнопку с именем 'GeneratedDocuments_Add'
			И в таблице 'GeneratedDocuments_' я нажимаю кнопку выбора у реквизита с именем 'DocumentsToGenerateDBDocument'
			И Я в списке "Infobase documents" по полю "Document" ищу и выбираю элемент "Report instance" "At beginning of line"
			И в таблице 'GeneratedDocuments_' из выпадающего списка с именем 'GeneratedDocumentsDocumentTemplate' я выбираю по строке "VA - ProcessAmount"
		* Организации
			И я перехожу к закладке с именем 'Page_BusinessUnitsFilter'
			И в таблице 'BusinessUnitsFilterDCSSettingsFilter' я нажимаю на кнопку с именем 'BusinessUnitsFilterDCSSettingsFilterAddFilterItem'
			И в таблице 'BusinessUnitsFilterDCSSettingsFilter' из выпадающего списка с именем 'BusinessUnitsFilterDCSSettingsFilterLeftValue' я выбираю точное значение "Business unit"
			И в таблице 'BusinessUnitsFilterDCSSettingsFilter' из выпадающего списка с именем 'BusinessUnitsFilterDCSSettingsFilterComparisonType' я выбираю точное значение "In list"
			И в таблице 'BusinessUnitsFilterDCSSettingsFilter' я нажимаю кнопку выбора у реквизита с именем 'BusinessUnitsFilterDCSSettingsFilterRightValue'
			Тогда открылось окно "Value list"
			И я нажимаю на кнопку с именем 'Add'
			И в таблице 'ValueList' из выпадающего списка с именем 'value' я выбираю по строке "Mercury LLC"
			И я нажимаю на кнопку с именем 'Add'
			И в таблице 'ValueList' из выпадающего списка с именем 'value' я выбираю по строке "Venus LLC"
			И я нажимаю на кнопку с именем 'OK'
			Тогда открылось окно "Step of report preparation process (Universal process step) *"
		* Настройки регламента
			И я перехожу к закладке с именем 'Page_RegulationSettings'
			И я нажимаю на кнопку с именем 'SetupAutofillRules'			
			* Меркурий
				Тогда открылось окно "Set up object filling rules for regulation VA - Report preparation process"
				И в табличном документе 'CustomField' я перехожу к ячейке 'R5C3'
				И в табличном документе 'CustomField' я делаю двойной клик на текущей ячейке
				Тогда открылось окно "Set up report filling rules"
				И из выпадающего списка с именем 'ReportGenerationMethod' я выбираю точное значение "By processing rule"
				И я нажимаю на кнопку с именем 'FormWriteAndClose'
			* Применение настроек
				Тогда открылось окно "Set up object filling rules for regulation VA - Report preparation process"
				И я нажимаю на кнопку с именем 'FormApplySettings'
				И Я закрываю окно "Set up object filling rules for regulation VA - Report preparation process"
		* Сохранение
			Тогда открылось окно "* (Universal process step)"
			И я нажимаю на кнопку с именем 'FormWriteAndClose'
			И я жду закрытия окна "* (Universal process step)" в течение 20 секунд

	* Настриваем процесс консолидации для "ВА - ПроцессСумма"
		Когда открылось окно "Editing process stages: VA - Report preparation process"
		И я нажимаю на кнопку с именем 'AddStage_ReportPreparationProcessStep'
		Тогда открылось окно "Step of report preparation process (Universal process step)"
		И в поле с именем 'Description' я ввожу текст "Consolidation - \"VA - ProcessAmount\""
		И из выпадающего списка с именем 'BusinessUnitType' я выбираю точное значение "Consolidating"
		* Документы
			И в таблице 'GeneratedDocuments_' я нажимаю на кнопку с именем 'GeneratedDocuments_Add'
			И в таблице 'GeneratedDocuments_' я нажимаю кнопку выбора у реквизита с именем 'DocumentsToGenerateDBDocument'
			И Я в списке "Infobase documents" по полю "Document" ищу и выбираю элемент "Report instance" "At beginning of line"
			И в таблице 'GeneratedDocuments_' из выпадающего списка с именем 'GeneratedDocumentsDocumentTemplate' я выбираю по строке "VA - ProcessAmount"
		* Организации
			И я перехожу к закладке с именем 'Page_BusinessUnitsFilter'
			И в таблице 'BusinessUnitsFilterDCSSettingsFilter' я нажимаю на кнопку с именем 'BusinessUnitsFilterDCSSettingsFilterAddFilterItem'
			И в таблице 'BusinessUnitsFilterDCSSettingsFilter' из выпадающего списка с именем 'BusinessUnitsFilterDCSSettingsFilterLeftValue' я выбираю точное значение "Business unit"
			И в таблице 'BusinessUnitsFilterDCSSettingsFilter' из выпадающего списка с именем 'BusinessUnitsFilterDCSSettingsFilterComparisonType' я выбираю точное значение "Equal to"
			И в таблице 'BusinessUnitsFilterDCSSettingsFilter' из выпадающего списка с именем 'BusinessUnitsFilterDCSSettingsFilterRightValue' я выбираю по строке "System LLC"
		* Настройки регламента
			И я перехожу к закладке с именем 'Page_RegulationSettings'
			И я нажимаю на кнопку с именем 'SetupAutofillRules'			
			* Система
				Тогда открылось окно "Set up object filling rules for regulation VA - Report preparation process"
				И в табличном документе 'CustomField' я перехожу к ячейке 'R5C3'
				И в табличном документе 'CustomField' я делаю двойной клик на текущей ячейке
				Тогда открылось окно "Set up report filling rules"
				И выпадающий список с именем 'ReportGenerationMethod' стал равен:
					| "Manual filling"                          |
					| "By processing rule"                       |
					| "Consolidate perimeter (IFRS)"            |
					| "Consolidate perimeter (Proportionally)" |
					| "Import"                                     |
					| "Collapse by dimensions"                     |
					| "Collapse by period"                        |
				И из выпадающего списка с именем 'ReportGenerationMethod' я выбираю точное значение "Consolidate perimeter (Proportionally)"
				И я нажимаю на кнопку с именем 'FormWriteAndClose'
			* Применение настроек
				Тогда открылось окно "Set up object filling rules for regulation VA - Report preparation process"
				И я нажимаю на кнопку с именем 'FormApplySettings'
				И Я закрываю окно "Set up object filling rules for regulation VA - Report preparation process"
		* Сохранение
			Тогда открылось окно "* (Universal process step)"
			И я нажимаю на кнопку с именем 'FormWriteAndClose'
			И я жду закрытия окна "* (Universal process step)" в течение 20 секунд
						
	* Настраиваем связи
		Когда открылось окно "Editing process stages: VA - Report preparation process"
		И я нажимаю на кнопку с именем 'AddLink'
		И Я в списке "Select initial link step" по полю "Description" ищу и выбираю элемент "Manual filling - \"VA - ProcessQuantity\"" "Exact match"
		И Я в списке "Select end link step" по полю "Description" ищу и выбираю элемент "Calculation by rule - \"VA - ProcessAmount\"" "Exact match"
		И я нажимаю на кнопку с именем 'AddLink'
		И Я в списке "Select initial link step" по полю "Description" ищу и выбираю элемент "Import - \"VA - ProcessPrice\"" "Exact match"
		И Я в списке "Select end link step" по полю "Description" ищу и выбираю элемент "Calculation by rule - \"VA - ProcessAmount\"" "Exact match"
		И я нажимаю на кнопку с именем 'AddLink'
		И Я в списке "Select initial link step" по полю "Description" ищу и выбираю элемент "Calculation by rule - \"VA - ProcessAmount\"" "Exact match"
		И Я в списке "Select end link step" по полю "Description" ищу и выбираю элемент "Consolidation - \"VA - ProcessAmount\"" "Exact match"		

Сценарий: 17.09 Созданеие сценария и документа управления отчетным периодом

	* Создаем сценарий
		И Я создаю сценарий с именем "VA - Report preparation process"

	* Создаем новый документ управления отчетным периодом
		* Основная вкладка
			И В командном интерфейсе я выбираю "Budgeting, reporting, and analysis" "Reporting period management"
			Тогда открылось окно "Reporting period management"
			И я нажимаю на кнопку с именем 'FormCreate'
			Тогда открылось окно "Reporting period management (create)"
			И из выпадающего списка с именем 'Scenario' я выбираю по строке "VA - Report preparation process"
			И из выпадающего списка с именем 'ScenarioFrequency' я выбираю точное значение "Month"
			И я нажимаю на кнопку с именем 'ChangePeriod'
			Тогда открылось окно "Select period"
			И в поле с именем 'DateBegin' я ввожу текст '1/1/2021'
			И я перехожу к следующему реквизиту
			И в поле с именем 'DateEnd' я ввожу текст '3/31/2021'
			И я нажимаю на кнопку с именем 'select'
			Тогда открылось окно "Reporting period management (create) *"
			И из выпадающего списка с именем 'OrganizationalStructureVersion' я выбираю по строке "VA - Report preparation process"
			И в поле с именем 'ProcessStartDate' я ввожу текст '01.01.2021  12:00:00 AM'
			И я нажимаю на кнопку с именем 'FormGoForward'
			Тогда открылось окно "1C:Enterprise"
			И я нажимаю на кнопку с именем 'Button0'
		* Валюты
			И я жду открытия окна "January * (Frequency: Month) <VA - Report preparation process>" в течении 30 секунд
			И я запоминаю заголовок текущего окна как 'WindowTitle'			
			И в таблице 'RatesEditTable' я нажимаю на кнопку с именем 'RatesEditTableRatesTable_Update'
			И в таблице 'RatesEditTable' я нажимаю на кнопку с именем 'RatesEditTableRatesTable_Write'
			И я нажимаю на кнопку с именем 'FormGoForward'
			Тогда открылось окно "1C:Enterprise"
			И я нажимаю на кнопку с именем 'Button0'
		* Настройка отчетов
			Тогда открылось окно '$WindowTitle$'
			И я нажимаю на кнопку с именем 'ReportReconciliationByDefaultInBulk'
			Когда открылось окно "Set up object filling rules for regulation VA - Report preparation process"
			Тогда табличный документ 'CustomField' равен:
				| "Company / Object" | ''                    | "VA - ProcessAmount"                          | "VA - ProcessQuantity"        | "VA - ProcessPrice"                                                    |
				| "System LLC"           | "Display report"  | "VA - ProcessAmount"                          | ''                              | ''                                                                    |
				| ''                      | "Calculation rule"     | "VA - ProcessAmount"                          | ''                              | ''                                                                    |
				| ''                      | "Check rule"    | "VA - ProcessAmount"                          | ''                              | ''                                                                    |
				| ''                      | "Generation method" | "Consolidate perimeter (Proportionally)" | ''                              | ''                                                                    |
				| ''                      | "Import rule"     | ''                                           | ''                              | ''                                                                    |
				| ''                      | "Object currency"      | "From regulation: RUB"                         | ''                              | ''                                                                    |
				| ''                      | "Translation template"   | ''                                           | ''                              | ''                                                                    |
				| "Mercury LLC"          | "Display report"  | "VA - ProcessAmount"                          | "VA - ProcessQuantity"        | "VA - ProcessPrice"                                                    |
				| ''                      | "Calculation rule"     | "VA - ProcessAmount"                          | "VA - ProcessQuantity"        | "VA - ProcessPrice"                                                    |
				| ''                      | "Check rule"    | "VA - ProcessAmount"                          | "VA - ProcessQuantity"        | "VA - ProcessPrice"                                                    |
				| ''                      | "Generation method" | "By processing rule"                       | "Manual filling"             | "Import\nExternal infobase: VA - ProcessImportPrice\n(Microsoft Excel files)" |
				| ''                      | "Import rule"     | ''                                           | ''                              | ''                                                                    |
				| ''                      | "Object currency"      | "From regulation: RUB (EUR, USD)"              | "From regulation: RUB (EUR, USD)" | "From regulation: RUB (EUR, USD)"                                       |
				| ''                      | "Translation template"   | ''                                           | ''                              | ''                                                                    |
				| "Venus LLC"            | "Display report"  | "VA - ProcessAmount"                          | "VA - ProcessQuantity"        | "VA - ProcessPrice"                                                    |
				| ''                      | "Calculation rule"     | "VA - ProcessAmount"                          | "VA - ProcessQuantity"        | "VA - ProcessPrice"                                                    |
				| ''                      | "Check rule"    | "VA - ProcessAmount"                          | "VA - ProcessQuantity"        | "VA - ProcessPrice"                                                    |
				| ''                      | "Generation method" | ''                                           | "Manual filling"             | "Import\nExternal infobase: VA - ProcessImportPrice\n(Microsoft Excel files)" |
				| ''                      | "Import rule"     | ''                                           | ''                              | ''                                                                    |
				| ''                      | "Object currency"      | "From regulation: RUB (EUR, USD)"              | "From regulation: RUB (EUR, USD)" | "From regulation: RUB (EUR, USD)"                                       |
				| ''                      | "Translation template"   | ''                                           | ''                              | ''                                                                    |
			И Я закрываю окно "Set up object filling rules for regulation VA - Report preparation process"			
			Тогда открылось окно '$WindowTitle$'
			И я нажимаю на кнопку с именем 'ReportReconciliationByDefaultIndividual'
			Тогда открылось окно "Set up object filling rules for regulation VA - Report preparation process by scenario VA - Report preparation process for period January *"
			Тогда табличный документ 'CustomField' равен:
				| "Company / Object" | ''                    | "VA - ProcessAmount"                          | "VA - ProcessQuantity"        | "VA - ProcessPrice"                                                    |
				| "System LLC"           | "Display report"  | "VA - ProcessAmount"                          | ''                              | ''                                                                    |
				| ''                      | "Calculation rule"     | "VA - ProcessAmount"                          | ''                              | ''                                                                    |
				| ''                      | "Check rule"    | "VA - ProcessAmount"                          | ''                              | ''                                                                    |
				| ''                      | "Generation method" | "Consolidate perimeter (Proportionally)" | ''                              | ''                                                                    |
				| ''                      | "Import rule"     | ''                                           | ''                              | ''                                                                    |
				| ''                      | "Object currency"      | "From regulation: RUB"                         | ''                              | ''                                                                    |
				| ''                      | "Translation template"   | ''                                           | ''                              | ''                                                                    |
				| "Mercury LLC"          | "Display report"  | "VA - ProcessAmount"                          | "VA - ProcessQuantity"        | "VA - ProcessPrice"                                                    |
				| ''                      | "Calculation rule"     | "VA - ProcessAmount"                          | "VA - ProcessQuantity"        | "VA - ProcessPrice"                                                    |
				| ''                      | "Check rule"    | "VA - ProcessAmount"                          | "VA - ProcessQuantity"        | "VA - ProcessPrice"                                                    |
				| ''                      | "Generation method" | "By processing rule"                       | "Manual filling"             | "Import\nExternal infobase: VA - ProcessImportPrice\n(Microsoft Excel files)" |
				| ''                      | "Import rule"     | ''                                           | ''                              | ''                                                                    |
				| ''                      | "Object currency"      | "From regulation: RUB (EUR, USD)"              | "From regulation: RUB (EUR, USD)" | "From regulation: RUB (EUR, USD)"                                       |
				| ''                      | "Translation template"   | ''                                           | ''                              | ''                                                                    |
				| "Venus LLC"            | "Display report"  | "VA - ProcessAmount"                          | "VA - ProcessQuantity"        | "VA - ProcessPrice"                                                    |
				| ''                      | "Calculation rule"     | "VA - ProcessAmount"                          | "VA - ProcessQuantity"        | "VA - ProcessPrice"                                                    |
				| ''                      | "Check rule"    | "VA - ProcessAmount"                          | "VA - ProcessQuantity"        | "VA - ProcessPrice"                                                    |
				| ''                      | "Generation method" | ''                                           | "Manual filling"             | "Import\nExternal infobase: VA - ProcessImportPrice\n(Microsoft Excel files)" |
				| ''                      | "Import rule"     | ''                                           | ''                              | ''                                                                    |
				| ''                      | "Object currency"      | "From regulation: RUB (EUR, USD)"              | "From regulation: RUB (EUR, USD)" | "From regulation: RUB (EUR, USD)"                                       |
				| ''                      | "Translation template"   | ''                                           | ''                              | ''                                                                    |
			И Я закрываю окно "Set up object filling rules for regulation VA - Report preparation process by scenario VA - Report preparation process for period January *"
		* Процесс
			Когда открылось окно '$WindowTitle$'
			И я нажимаю на кнопку с именем 'FormGoForward'
			И я нажимаю на кнопку с именем 'StartProcess1'
			И я жду открытия окна '$WindowTitle$' в течение 20 секунд			
			И я нажимаю на кнопку с именем 'FormGoForward'
			И я нажимаю на кнопку с именем 'FormClose'

Сценарий: 17.10 Ручное заполнение - "VA - ProcessQuantity"

	И Я открываю управление процессом подготовки отчетности для сценария "VA - Report preparation process"

	* Отменяем этап
		И в таблице 'StepsTree' я перехожу к строке:
			| "Step/Company"                               |
			| "Manual filling - \"VA - ProcessQuantity\"" |
		И я выбираю пункт контекстного меню с именем 'StepsTreeContextMenuCancelStepProcessing' на элементе формы с именем 'StepsTree'
		Тогда открылось окно "Cancel step processing for companies:"
		И я нажимаю на кнопку с именем 'Execute'
		И я жду открытия окна "Report preparation management (table)" в течение 20 секунд

	* Заполняем по оганизации Меркурий
		И в таблице 'TransactionsTree' я перехожу к строке:
			| "Report type/Company" |
			| "Mercury LLC"           |
		И в таблице 'TransactionsTree' я активизирую поле с именем 'OperationTreeCompanyReportKind'
		И в таблице 'TransactionsTree' я выбираю текущую строку
		
		И Открылся экземпляр отчета для вида отчета "VA - ProcessQuantity" валюта 'RUB' организация "Mercury LLC" сценарий "VA - Report preparation process" периодичность "Month" проект '' аналитики '' '' '' '' '' '' 
		И В экземпляре отчета я удалю все существующие версии
		И я нажимаю на кнопку с именем 'EnableEdit'		
		И Я добавляю значения с раскрытием показателей в ячейку 'R6C1'
			| "Product range"                 | 'Period_1_Value1' | 'Period_2_Value1' | 'Period_3_Value1' |
			| "1C:ERP. Corporate performance management" | '10.00000'           | '20.00000'           | '30.00000'           |
			| "5C:Corporate performance management"    | '20.00000'           | '40.00000'           | '60.00000'           |			
			| "2C:Corporation"                | '30.00000'           | '60.00000'           | '90.00000'           |
		Когда открылось окно '$WindowTitle$'
		И я нажимаю на кнопку с именем 'WriteAndClose'
		И я жду закрытия окна '$WindowTitle$' в течение 20 секунд

		* Утверждаем из формы управления процессом
			Тогда открылось окно "Report preparation management (table)"
			И в таблице 'TransactionsTree' я активизирую поле с именем 'OperationTreeState'
			И в таблице 'TransactionsTree' я выбираю текущую строку
			Тогда открылось окно "Report states"
			И в таблице 'List' я перехожу к строке:
				| "Reference"    |
				| "Confirmed" |
			И в таблице 'List' я выбираю текущую строку
	
	* Заполняем по оганизации Венера
		Тогда открылось окно "Report preparation management (table)"	
		И в таблице 'TransactionsTree' я перехожу к строке:
			| "Report type/Company" |
			| "Venus LLC"             |
		И в таблице 'TransactionsTree' я активизирую поле с именем 'OperationTreeCompanyReportKind'	
		И в таблице 'TransactionsTree' я выбираю текущую строку
			
		И Открылся экземпляр отчета для вида отчета "VA - ProcessQuantity" валюта 'RUB' организация "Venus LLC" сценарий "VA - Report preparation process" периодичность "Month" проект '' аналитики '' '' '' '' '' '' 
		И В экземпляре отчета я удалю все существующие версии
		И я нажимаю на кнопку с именем 'EnableEdit'	
		И Я добавляю значения с раскрытием показателей в ячейку 'R6C1'
			| "Product range"                                                   | 'Period_1_Value1' | 'Period_2_Value1' | 'Period_3_Value1' |
			| "3C:Enterprise 8 CORP. Client license for 100 users" | '10.00000'           | '20.00000'           | '30.00000'           |
			| "4C:Enterprise 8.3 CORP. Server License (x86-64)"           | '20.00000'           | '40.00000'           | '60.00000'           |			

		* Утверждаем из формы документа	
			Когда открылось окно '$WindowTitle$'
			И из выпадающего списка с именем 'StatusOfObject' я выбираю точное значение "Confirmed"
			Тогда открылось окно "1C:Enterprise"
			И я нажимаю на кнопку с именем 'Button0'
			И я жду открытия окна '$WindowTitle$' в течение 20 секунд
			И я нажимаю на кнопку с именем 'WriteAndClose'
			Тогда открылось окно "1C:Enterprise"
			И я нажимаю на кнопку с именем 'OK'
			Тогда в логе сообщений TestClient есть строки по шаблону:
				|"Cannot save document *:\n- Process step Manual filling - \"VA - ProcessQuantity\" uses the report type VA - ProcessQuantity and is in status \"Closed\"."|
			И Я закрываю окно '$WindowTitle$'

	* Проверяем результат
		Когда открылось окно "Report preparation management (table)"
		И я нажимаю на кнопку с именем 'GenerateReport'				
		И в таблице 'StepsTree' я перехожу к строке:
			| "Step/Company"                               | "Step state" |
			| "Manual filling - \"VA - ProcessQuantity\"" | "Completed"        |
		Тогда таблица 'TransactionsTree' содержит '4' строк из списка:
			| "Report type/Company" | "State" |
			| "VA - ProcessQuantity" | "Confirmed" |
			| "System LLC"            | "Confirmed" |
			| "Venus LLC"             | "Confirmed" |
			| "Mercury LLC"           | "Confirmed" |		
		
	* Отменяем утверждение
		Когда открылось окно "Report preparation management (table)"
		И в таблице 'StepsTree' я перехожу к строке:
			| "Step/Company"                               | "Step state" |
			| "Manual filling - \"VA - ProcessQuantity\"" | "Completed"        |
		И я выбираю пункт контекстного меню с именем 'StepsTreeContextMenuCancelStepProcessing' на элементе формы с именем 'StepsTree'
		Тогда открылось окно "Cancel step processing for companies:"
		И я нажимаю на кнопку с именем 'Execute'
		Тогда таблица 'TransactionsTree' содержит '4' строк из списка:
			| "Report type/Company" | "State" |
			| "VA - ProcessQuantity" | "Draft"  |
			| "System LLC"            | "Draft"  |
			| "Venus LLC"             | "Draft"  |
			| "Mercury LLC"           | "Draft"  |

	* Утверждаем снова
		Когда открылось окно "Report preparation management (table)"
		И в таблице 'StepsTree' я перехожу к строке:
			| "Step/Company"                               | "Step state" |
			| "Manual filling - \"VA - ProcessQuantity\"" | "Not active"      |
		И я выбираю пункт контекстного меню с именем 'StepsTreeContextMenuSetStepStateClosed' на элементе формы с именем 'StepsTree'
		Тогда открылось окно "Close stage for companies:"
		И я изменяю флаг с именем 'ShouldFillDocuments'
		И я нажимаю на кнопку с именем 'Execute'
		Тогда таблица 'TransactionsTree' содержит '4' строк из списка:
			| "Report type/Company" | "State" |
			| "VA - ProcessQuantity" | "Confirmed" |
			| "System LLC"            | "Confirmed" |
			| "Venus LLC"             | "Confirmed" |
			| "Mercury LLC"           | "Confirmed" |		
					
Сценарий: 17.11 Импорт - "VA - ProcessPrice"	

	И Я открываю управление процессом подготовки отчетности для сценария "VA - Report preparation process"

	* Отменяем этап
		И в таблице 'StepsTree' я перехожу к строке:
			| "Step/Company"              |
			| "Import - \"VA - ProcessPrice\"" |
		И я выбираю пункт контекстного меню с именем 'StepsTreeContextMenuCancelStepProcessing' на элементе формы с именем 'StepsTree'
		Тогда открылось окно "Cancel step processing for companies:"
		И я нажимаю на кнопку с именем 'Execute'
		И я жду открытия окна "Report preparation management (table)" в течение 20 секунд

	* Заполняем по оганизации Меркурий
		* Находим строку	
			И в таблице 'TransactionsTree' я перехожу к строке:
				| "Report type/Company" |
				| "Mercury LLC"           |
			И в таблице 'TransactionsTree' я активизирую поле с именем 'OperationTreeCompanyReportKind'
			И в таблице 'TransactionsTree' я выбираю текущую строку
		* Заполняем и записываем отчет
			И Открылся экземпляр отчета для вида отчета "VA - ProcessPrice" валюта 'RUB' организация "Mercury LLC" сценарий "VA - Report preparation process" периодичность "Month" проект '' аналитики '' '' '' '' '' '' 
			И я нажимаю на кнопку с именем 'FormFillByDefault'
			Тогда табличный документ 'SpreadsheetFieldTemlate' равен:
				| "VA - ProcessPrice" | ''                             | ''               | ''                | ''             |
				| ''                 | ''                             | ''               | ''                | ''             |
				| ''                 | "Product range"                 | "January 2021" | "February 2021" | "March 2021" |
				| ''                 | ''                             | "Price"           | "Price"            | "Price"         |
				| "Goods"           | ''                             | '5,250,000'      | '5,400,000'       | '5,550,000'    |
				| ''                 | "1C:ERP. Corporate performance management" | '1,950,000'      | '2,000,000'       | '2,050,000'    |
				| ''                 | "2C:Corporation"                | '2,050,000'      | '2,100,000'       | '2,150,000'    |
				| ''                 | "5C:Corporate performance management"    | '1,250,000'      | '1,300,000'       | '1,350,000'    |
			Когда открылось окно '$WindowTitle$'
			И я нажимаю на кнопку с именем 'WriteAndClose'
			И я жду закрытия окна '$WindowTitle$' в течение 20 секунд
								
	* Заполняем из формы управления процессом
		И я выбираю пункт контекстного меню с именем 'StepsTreeContextMenuSetStepStateToOpen' на элементе формы с именем 'StepsTree'
		Тогда открылось окно "Open stage for companies:"
		И я нажимаю на кнопку с именем 'FormCancel'
		Тогда открылось окно "Report preparation management (table)"
		И я выбираю пункт контекстного меню с именем 'StepsTreeContextMenuSetStepStateClosed' на элементе формы с именем 'StepsTree'
		Тогда открылось окно "Close stage for companies:"
		И я нажимаю на кнопку с именем 'Execute'
		Тогда таблица 'TransactionsTree' содержит '4' строк из списка:
			| "Report type/Company" | "State" |
			| "VA - ProcessPrice"       | "Confirmed" |
			| "System LLC"            | "Confirmed" |
			| "Venus LLC"             | "Confirmed" |
			| "Mercury LLC"           | "Confirmed" |
		* Сравниваем результат
			* По организации Меркурий
				И в таблице 'TransactionsTree' я перехожу к строке:
					| "Report type/Company" |
					| "Mercury LLC"           |
				И в таблице 'TransactionsTree' я активизирую поле с именем 'OperationTreeCompanyReportKind'
				И в таблице 'TransactionsTree' я выбираю текущую строку	
				И Открылся экземпляр отчета для вида отчета "VA - ProcessPrice" валюта 'RUB' организация "Mercury LLC" сценарий "VA - Report preparation process" периодичность "Month" проект '' аналитики '' '' '' '' '' ''
				Тогда табличный документ 'SpreadsheetFieldTemlate' равен:
					| "VA - ProcessPrice" | ''                             | ''               | ''                | ''             |
					| ''                 | ''                             | ''               | ''                | ''             |
					| ''                 | "Product range"                 | "January 2021" | "February 2021" | "March 2021" |
					| ''                 | ''                             | "Price"           | "Price"            | "Price"         |
					| "Goods"           | ''                             | '5,250,000'      | '5,400,000'       | '5,550,000'    |
					| ''                 | "1C:ERP. Corporate performance management" | '1,950,000'      | '2,000,000'       | '2,050,000'    |
					| ''                 | "2C:Corporation"                | '2,050,000'      | '2,100,000'       | '2,150,000'    |
					| ''                 | "5C:Corporate performance management"    | '1,250,000'      | '1,300,000'       | '1,350,000'    |
				Когда открылось окно '$WindowTitle$'
				И я нажимаю на кнопку с именем 'Write'
				Тогда открылось окно "1C:Enterprise"
				И я нажимаю на кнопку с именем 'OK'
				Тогда в логе сообщений TestClient есть строки по шаблону:
					|"Cannot save document *:\n- Process step Import - \"VA - ProcessPrice\" uses the report type VA - ProcessPrice and is in status \"Closed\"."|
				И Я закрываю окно '$WindowTitle$'			
			* По организации Венера
				И в таблице 'TransactionsTree' я перехожу к строке:
					| "Report type/Company" |
					| "Venus LLC"             |
				И в таблице 'TransactionsTree' я активизирую поле с именем 'OperationTreeCompanyReportKind'
				И в таблице 'TransactionsTree' я выбираю текущую строку	
				И Открылся экземпляр отчета для вида отчета "VA - ProcessPrice" валюта 'RUB' организация "Venus LLC" сценарий "VA - Report preparation process" периодичность "Month" проект '' аналитики '' '' '' '' '' ''
				Тогда табличный документ 'SpreadsheetFieldTemlate' равен:
					| "VA - ProcessPrice" | ''                                                               | ''               | ''                | ''             |
					| ''                 | ''                                                               | ''               | ''                | ''             |
					| ''                 | "Product range"                                                   | "January 2021" | "February 2021" | "March 2021" |
					| ''                 | ''                                                               | "Price"           | "Price"            | "Price"         |
					| "Goods"           | ''                                                               | '780,000'        | '835,000'         | '890,000'      |
					| ''                 | "3C:Enterprise 8 CORP. Client license for 100 users" | '600,000'        | '650,000'         | '700,000'      |
					| ''                 | "4C:Enterprise 8.3 CORP. Server License (x86-64)"           | '180,000'        | '185,000'         | '190,000'      |
				И Я закрываю окно '$WindowTitle$'							
			
Сценарий: 17.12 Консолидация - "VA - ProcessAmount"

	И Я открываю управление процессом подготовки отчетности для сценария "VA - Report preparation process"	

	* Отменяем обработку этапов
		И в таблице 'StepsTree' я перехожу к строке:
			| "Step/Company"                          |
			| "Calculation by rule - \"VA - ProcessAmount\"" |
		И я выбираю пункт контекстного меню с именем 'StepsTreeContextMenuCancelStepProcessing' на элементе формы с именем 'StepsTree'
		Тогда открылось окно "Cancel step processing for companies:"
		И я нажимаю на кнопку с именем 'Execute'
		И в таблице 'StepsTree' я перехожу к строке:
			| "Step/Company"                     |
			| "Consolidation - \"VA - ProcessAmount\"" |
		И я выбираю пункт контекстного меню с именем 'StepsTreeContextMenuCancelStepProcessing' на элементе формы с именем 'StepsTree'
		Тогда открылось окно "Cancel step processing for companies:"
		И я нажимаю на кнопку с именем 'Execute'

	* Заполняем без утверждения		
		И я выбираю пункт контекстного меню с именем 'StepsTreeContextMenuFillUpToCurrentStep' на элементе формы с именем 'StepsTree'
		Тогда таблица 'TransactionsTree' стала равной:
			| "Report type/Company" | "State" |
			| "VA - ProcessAmount"      | "Draft"  |

	* Заполняем с утрверждением
		И я выбираю пункт контекстного меню с именем 'StepsTreeContextMenuPerformProcessTillThisStep' на элементе формы с именем 'StepsTree'
		Тогда таблица 'StepsTree' стала равной:
			| "Step/Company"                               | "Step state" |
			| "Manual filling - \"VA - ProcessQuantity\"" | "Completed"        |
			| "Import - \"VA - ProcessPrice\""                  | "Completed"        |
			| "Calculation by rule - \"VA - ProcessAmount\""      | "Completed"        |
			| "Consolidation - \"VA - ProcessAmount\""           | "Completed"        |
		
	* Проверяем статусы "ВА - ПроцессСумма"
		И в таблице 'StepsTree' я перехожу к строке:
			| "Step/Company"                          | "Step state" |
			| "Calculation by rule - \"VA - ProcessAmount\"" | "Completed"        |
		Тогда таблица 'TransactionsTree' содержит '4' строк из списка:
			| "Report type/Company" | "State" |
			| "VA - ProcessAmount"      | "Confirmed" |
			| "System LLC"            | "Confirmed" |
			| "Venus LLC"             | "Confirmed" |
			| "Mercury LLC"           | "Confirmed" |

	* Проверяем статусы "ВА - ПроцессСумма"
		И в таблице 'StepsTree' я перехожу к строке:
			| "Step/Company"                     | "Step state" |
			| "Consolidation - \"VA - ProcessAmount\"" | "Completed"        |
		Тогда таблица 'TransactionsTree' стала равной:
			| "Report type/Company" | "State" |
			| "VA - ProcessAmount"      | "Confirmed" |
		И в таблице 'TransactionsTree' я активизирую поле с именем 'OperationTreeCompanyReportKind'
		И в таблице 'TransactionsTree' я выбираю текущую строку
		
	* Сверяем итоговый отчет
		И Открылся экземпляр отчета для вида отчета "VA - ProcessAmount" валюта 'RUB' организация "System LLC" сценарий "VA - Report preparation process" периодичность "Month" проект '' аналитики '' '' '' '' '' ''									
		Тогда табличный документ 'SpreadsheetFieldTemlate' равен:
			| "VA - ProcessAmount"                                               | ''               | ''          | ''           | ''                | ''          | ''           | ''             | ''          | ''            | ''           | ''           | ''            |
			| ''                                                                | ''               | ''          | ''           | ''                | ''          | ''           | ''             | ''          | ''            | ''           | ''           | ''            |
			| ''                                                                | "January 2021" | ''          | ''           | "February 2021" | ''          | ''           | "March 2021" | ''          | ''            | "TOTAL"      | ''           | ''            |
			| ''                                                                | "Quantity"     | "Price"      | "Amount"      | "Quantity"      | "Price"      | "Amount"      | "Quantity"   | "Price"      | "Amount"       | "Quantity" | "Price"       | "Amount"       |
			| "Goods"                                                          | '60'             | '3,405,000' | '36,100,000' | '120'             | '3,535,000' | '74,900,000' | '180'          | '3,665,000' | '116,400,000' | '360'        | '10,605,000' | '227,400,000' |
			| "1C:ERP. Corporate performance management "                                   | '5'              | '975,000'   | '4,875,000'  | '10'              | '1,000,000' | '10,000,000' | '15'           | '1,025,000' | '15,375,000'  | '30'         | '3,000,000'  | '30,250,000'  |
			| "2C:Corporation "                                                  | '15'             | '1,025,000' | '15,375,000' | '30'              | '1,050,000' | '31,500,000' | '45'           | '1,075,000' | '48,375,000'  | '90'         | '3,150,000'  | '95,250,000'  |
			| "3C:Enterprise 8 CORP. Client license for 100 users " | '10'             | '600,000'   | '6,000,000'  | '20'              | '650,000'   | '13,000,000' | '30'           | '700,000'   | '21,000,000'  | '60'         | '1,950,000'  | '40,000,000'  |
			| "4C:Enterprise 8.3 CORP. Server License (x86-64) "           | '20'             | '180,000'   | '3,600,000'  | '40'              | '185,000'   | '7,400,000'  | '60'           | '190,000'   | '11,400,000'  | '120'        | '555,000'    | '22,400,000'  |
			| "5C:Corporate performance management "                                      | '10'             | '625,000'   | '6,250,000'  | '20'              | '650,000'   | '13,000,000' | '30'           | '675,000'   | '20,250,000'  | '60'         | '1,950,000'  | '39,500,000'  |
		
Сценарий: 17.13 Останавливаем процесс

	* Ищем нужный документ
		И В командном интерфейсе я выбираю "Budgeting, reporting, and analysis" "Reporting period management"
		Тогда открылось окно "Reporting period management"
		И Я в списке "Reporting period management" по полю "Scenario" ищу и выбираю элемент "VA - Report preparation process" "Exact match" 
		Тогда Открылся документ управления периодом для сценария "VA - Report preparation process" периодичность "Month"
		
	* Останавливаем процесс	
		И в таблице 'Contents' я перехожу к строке:
			| 'Description'             |
			| "Process, reports, and limits" |
		И я перехожу к закладке с именем 'ProcessSetup'
		И я нажимаю на кнопку с именем 'ProcessManagement_StopProcess1'
		И я жду открытия окна '$WindowTitle$' в течение 20 секунд
		Тогда в логе сообщений TestClient есть строки:
			|"Process is terminated"|
		
	* Проверяем результат
		И я нажимаю на кнопку с именем 'ProcessManagement_Document3'
		Тогда открылось окно "Report preparation management (table)"
		И в таблице 'StepsTree' я перехожу к строке:
			| "Step/Company"                               |
			| "Manual filling - \"VA - ProcessQuantity\"" |
		Тогда таблица 'TransactionsTree' содержит '4' строк из списка:
			| "Report type/Company" | "State"                |
			| "VA - ProcessQuantity" | "Checked, pending approval" |
			| "System LLC"            | "Checked, pending approval" |
			| "Venus LLC"             | "Checked, pending approval" |
			| "Mercury LLC"           | "Checked, pending approval" |
		И Я закрываю окно "Report preparation management (table)"
		
	* Закрываем окна
		Тогда открылось окно '$WindowTitle$'
		И Я закрываю окно '$WindowTitle$'
				
				
							
			
	
				
