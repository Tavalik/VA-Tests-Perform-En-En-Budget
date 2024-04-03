#language: ru
@tree

Функционал: 19. Процесс подготовки отчетности

	Как Администратор я хочу
	чтобы процесс подготовки отчетности работал без ошибок

Контекст:

	И я закрыл все окна клиентского приложения

Сценарий: 19.00 Определение типа приложения

	И я закрываю TestClient "CPM - Budget"
	И я подключаю TestClient "CPM - Budget" логин "Administrator" пароль ''
	Пусть Инициализация переменных

Сценарий: 19.01 Создание группы видов отчетов "VA - Report preparation process (group)"

	И Я создаю группу видов отчетов с именем "VA - Report preparation process (group)" и родителем "VA - Report group"

Сценарий: 19.02 Создание вида отчета "VA - ProcessCount"

	* Создаем вид отчета
		И Я создаю вид отчета с именем "VA - ProcessCount" и родителем "VA - Report preparation process (group)"

	* Настраиваем структуру
		И я открываю контруктор отчета с именем "VA - ProcessCount"
		И Я в конструкторе отчета добавляю строку с именем "Goods"
		И Я в конструкторе отчета добавляю колонку с именем "Count"
		И Я в конструкторе отчета добавляю аналитику с кодом "VA0Product" в ячейку 'R2C2'
	
	* Создаем бланк
		И Я Для вида отчета "VA - ProcessCount" создаю бланк по умолчанию

Сценарий: 19.03 Создание вида отчета "VA - ProcessPrice"

	* Создаем вид отчета
		И Я создаю вид отчета с именем "VA - ProcessPrice" и родителем "VA - Report preparation process (group)"

	* Настраиваем структуру
		И я открываю контруктор отчета с именем "VA - ProcessPrice"
		И Я в конструкторе отчета добавляю строку с именем "Goods"
		И Я в конструкторе отчета добавляю колонку с именем "Price"
		И Я в конструкторе отчета добавляю аналитику с кодом "VA0Product" в ячейку 'R2C2'
	
	* Создаем бланк
		И Я Для вида отчета "VA - ProcessPrice" создаю бланк для импорта по умолчанию

Сценарий: 19.04 Создание внешней информационной базы "VA - ProcessImportPrice"

	И Я создаю внешнюю информационную базу "VA - ProcessImportPrice" тип "Microsoft Excel files" каталог "$КаталогПроекта$\Макеты\19" тип хранилища ''

	* Тестируем механизм маски имени
		И я нажимаю на кнопку с именем 'NameStructureAdd'
		И в таблице 'NameStructure' из выпадающего списка с именем 'NameStructureItem' я выбираю точное значение "Report type"
		И в таблице 'NameStructure' из выпадающего списка с именем 'NameStructureStartElement' я выбираю точное значение "+"
		И в таблице 'NameStructure' из выпадающего списка с именем 'NameStructureItem' я выбираю точное значение "Company"
		И в таблице 'NameStructure' я отменяю редактирование строки
		Тогда элемент формы с именем 'FullNameMask' стал равен "$КаталогПроекта$\Макеты\19\<Report type>+<Company>.xls?"

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

Сценарий: 19.05 Создание вида отчета "VA - ProcessAmount"

	* Создаем вид отчета
		И Я создаю вид отчета с именем "VA - ProcessAmount" и родителем "VA - Report preparation process (group)"

	* Настраиваем структуру
		И я открываю контруктор отчета с именем "VA - ProcessAmount"
		И Я в конструкторе отчета добавляю строку с именем "Goods"
		И Я в конструкторе отчета добавляю колонки
			| 'Description' |
			| "Count"   |
			| "Price"         |
			| "Amount"        |
		И Я в конструкторе отчета добавляю аналитику с кодом "VA0Product" в ячейку 'R2C2'
		
	* Настраиваем формулы
		И Я в конструкторе отчета для ячейки 'R2C2' настраиваю связь с показателем с кодом "Goods_Count" вида отчета "VA - ProcessCount"
		И Я в конструкторе отчета для ячейки 'R2C3' настраиваю связь с показателем с кодом "Goods_Price" вида отчета "VA - ProcessPrice"
		И Я в конструкторе отчета для ячейки 'R2C4' задаю формулу произведение ячеек 'R2C2' 'R2C3'

	* Закрываем конструктор
		Когда открылось окно "Report wizard"
		И Я закрываю окно "Report wizard"
		
	* Создаем бланк
		И Я Для вида отчета "VA - ProcessAmount" создаю бланк по умолчанию

Сценарий: 19.06 Создание процесса подготовки отчетности "VA - Report preparation process"

	И Я создаю шаблон универсального процесса с именем "VA - Report preparation process" режимом "Report preparation process"

Сценарий: 19.07 Создание копированием регламента "VA - Report preparation process"

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

	* Заполняем новый элемент	
		Тогда открылось окно "VA - Main regulations from *"
		И в поле с именем 'Description' я ввожу текст "VA - Report preparation process"
		И из выпадающего списка с именем 'ReportKind' я выбираю по строке "VA - Report preparation process (group)"
		И я устанавливаю флаг с именем 'UseProcess'
		И я нажимаю кнопку выбора у поля с именем 'ProcessTemplate'
		И Я в списке "Universal process templates" по полю "Description" ищу и выбираю элемент "VA - Report preparation process" "Exact match" 
		И я перехожу к закладке с именем 'PerimeterSetting'
		Тогда таблица 'GroupStructure' стала равной:
			| "Consolidating company\n/ Business unit" | "Primary currency" | "Additional currencies" | "Effective share, %" | "Company status for consolidation"        | "Company kind" | "Intercompany transactions exclusion method" |
			| "System LLC"                                            | "RUB"             | ""                      | "- "                  | "Group"                    | "VA - Package CFR"  | "- "                   |
			| "Mars LLC"                                               | "RUB"             | "EUR; USD"              | "100"                 | "Eliminating"             | "VA - Package CFR"  | "Eliminating"        |
			| "Venus LLC"                                             | "RUB"             | "EUR; USD"              | "100"                 | "Financial responsibility center"                       | "VA - Package CFR"  | "Financial responsibility center"                  |
			| "Earth LLC"                                              | "RUB"             | "USD"                   | "100"                 | "Financial responsibility center"                       | "VA - Package CFR"  | "Financial responsibility center"                  |
			| "Mercury LLC"                                           | "RUB"             | "EUR; USD"              | "50.000"              | "VA - Subsidiary" | "VA - Package CFR"  | "Balance and turnovers"    |
		Тогда открылось окно "VA - Main regulations from *"
		И я нажимаю на кнопку с именем 'FormWriteAndClose'
		И я жду закрытия окна "VA - Main regulations from *" в течение 20 секунд

Сценарий: 19.08 Тестируем кнопки создания процесса подготовки отчетности

	* Ищем элемент
		И В командном интерфейсе я выбираю "Budgeting, reporting, and analysis" "Templates of report preparation process"
		И Я в списке "Universal process templates" по полю "Description" ищу и выбираю элемент "VA - Report preparation process" "Exact match" 

	* Проверяем, что документ пустой
		Когда открылось окно "Editing process stages: VA - Report preparation process"
		И я нажимаю на кнопку с именем 'Edit'
		Тогда открылось окно "Select step"
		И в таблице 'List' количество строк 'равно' 0
		И элемент формы с именем 'ProcessTemplate' стал равен "VA - Report preparation process"
		И я закрываю окно "Select step"

	* Добавляем этап для удаления
		Когда открылось окно "Editing process stages: VA - Report preparation process"
		И я нажимаю на кнопку с именем 'AddStage_ReportPreparationProcessStep'
		Тогда открылось окно "Step of report preparation process (Universal process step)"
		И в поле с именем 'Description' я ввожу текст "Для удаления"
		И я нажимаю на кнопку с именем 'FormWriteAndClose'
		И я жду закрытия окна "Step of report preparation process (Universal process step) *" в течение 20 секунд

	* Копируем этап
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

Сценарий: 19.09 Настройка процесса подготовки отчетности

	* Ищем элемент
		И В командном интерфейсе я выбираю "Budgeting, reporting, and analysis" "Templates of report preparation process"
		И Я в списке "Universal process templates" по полю "Description" ищу и выбираю элемент "VA - Report preparation process" "Exact match" 

	* Этап для "ВА - ПроцессКоличество"
		Когда открылось окно "Editing process stages: VA - Report preparation process"
		И я нажимаю на кнопку с именем 'AddStage_ReportPreparationProcessStep'
		Тогда открылось окно "Step of report preparation process (Universal process step)"
		И в поле с именем 'Description' я ввожу текст "Manual filling - \"VA - ProcessCount\""
		* Документы
			И в таблице 'GeneratedDocuments_' я нажимаю на кнопку с именем 'GeneratedDocuments_Add'
			И в таблице 'GeneratedDocuments_' я нажимаю кнопку выбора у реквизита с именем 'DocumentsToGenerateDBDocument'
			И Я в списке "Infobase documents" по полю "Document" ищу и выбираю элемент "Report instance" "At beginning of line"
			И в таблице 'GeneratedDocuments_' из выпадающего списка с именем 'GeneratedDocumentsDocumentTemplate' я выбираю по строке "VA - ProcessCount"
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
			Тогда открылось окно "1C:Enterprise"
			И я нажимаю на кнопку с именем 'Button0'
			* Меркурий
				Тогда открылось окно "Set up object filling rules for regulation VA - Report preparation process"
				Тогда табличный документ 'CustomField' равен:
					| "Company / Object" | ''                    | "VA - ProcessCount"        |
					| "Mercury LLC"         | "Display report"  | "VA - ProcessCount"        |
					| ''                     | "Processing rule"   | "VA - ProcessCount"        |
					| ''                     | "Check rule"    | "VA - ProcessCount"        |
					| ''                     | "Generation method" | "By processing rule"          |
					| ''                     | "Object currency"      | "From regulation: RUB (USD, EUR)" |
					| "Venus LLC"           | "Display report"  | "VA - ProcessCount"        |
					| ''                     | "Processing rule"   | "VA - ProcessCount"        |
					| ''                     | "Check rule"    | "VA - ProcessCount"        |
					| ''                     | "Generation method" | "By processing rule"          |
					| ''                     | "Object currency"      | "From regulation: RUB (USD, EUR)" |
				И в табличном документе 'CustomField' я перехожу к ячейке 'R5C3'
				И в табличном документе 'CustomField' я делаю двойной клик на текущей ячейке
				Тогда открылось окно "Set up report filling rules"
				И из выпадающего списка с именем 'ReportGenerationMethod' я выбираю точное значение "Manual filling"
				И я нажимаю на кнопку с именем 'FormWriteAndClose'
			* Венера
				Тогда открылось окно "Set up object filling rules for regulation VA - Report preparation process"
				И в табличном документе 'CustomField' я перехожу к ячейке 'R10C3'
				И в табличном документе 'CustomField' я делаю двойной клик на текущей ячейке
				Тогда открылось окно "Set up report filling rules"
				И из выпадающего списка с именем 'ReportGenerationMethod' я выбираю точное значение "Manual filling"
				И я нажимаю на кнопку с именем 'FormWriteAndClose'
			* Применение настроек
				Тогда открылось окно "Set up object filling rules for regulation VA - Report preparation process"
				Тогда табличный документ 'CustomField' равен:
					| "Company / Object" | ''                    | "VA - ProcessCount"        |
					| "Mercury LLC"         | "Display report"  | "VA - ProcessCount"        |
					| ''                     | "Processing rule"   | "VA - ProcessCount"        |
					| ''                     | "Check rule"    | "VA - ProcessCount"        |
					| ''                     | "Generation method" | "Manual filling"             |
					| ''                     | "Object currency"      | "From regulation: RUB (USD, EUR)" |
					| "Venus LLC"           | "Display report"  | "VA - ProcessCount"        |
					| ''                     | "Processing rule"   | "VA - ProcessCount"        |
					| ''                     | "Check rule"    | "VA - ProcessCount"        |
					| ''                     | "Generation method" | "Manual filling"             |
					| ''                     | "Object currency"      | "From regulation: RUB (USD, EUR)" |
				И я нажимаю на кнопку с именем 'FormApplySettings'
				И Я закрываю окно "Set up object filling rules for regulation VA - Report preparation process"
		* Сохранение
			Тогда открылось окно "* (Universal process step)"
			И я нажимаю на кнопку с именем 'FormWriteAndClose'
			И я жду закрытия окна "* (Universal process step)" в течение 20 секунд
				
	* Этап для "ВА - ПроцессЦена"
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
			Тогда открылось окно "1C:Enterprise"
			И я нажимаю на кнопку с именем 'Button0'			
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
				И в табличном документе 'CustomField' я перехожу к ячейке 'R10C3'
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

	* Этап для "ВА - ПроцессСумма"
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
			Тогда открылось окно "1C:Enterprise"
			И я нажимаю на кнопку с именем 'Button0'			
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

	* Этап консолидации для "ВА - ПроцессСумма"
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
			Тогда открылось окно "1C:Enterprise"
			И я нажимаю на кнопку с именем 'Button0'			
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
		И Я в списке "Select initial link step" по полю "Description" ищу и выбираю элемент "Manual filling - \"VA - ProcessCount\"" "Exact match"
		И Я в списке "Select end link step" по полю "Description" ищу и выбираю элемент "Calculation by rule - \"VA - ProcessAmount\"" "Exact match"
		И я нажимаю на кнопку с именем 'AddLink'
		И Я в списке "Select initial link step" по полю "Description" ищу и выбираю элемент "Import - \"VA - ProcessPrice\"" "Exact match"
		И Я в списке "Select end link step" по полю "Description" ищу и выбираю элемент "Calculation by rule - \"VA - ProcessAmount\"" "Exact match"
		И я нажимаю на кнопку с именем 'AddLink'
		И Я в списке "Select initial link step" по полю "Description" ищу и выбираю элемент "Calculation by rule - \"VA - ProcessAmount\"" "Exact match"
		И Я в списке "Select end link step" по полю "Description" ищу и выбираю элемент "Consolidation - \"VA - ProcessAmount\"" "Exact match"		

Сценарий: 19.10 Создание сценария

	И Я создаю сценарий с именем "VA - Report preparation process"

Сценарий: 19.11 Создание документа управления отчетным периодом		

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
			И в поле с именем 'DateBegin' я ввожу текст '1/1/2024'
			И я перехожу к следующему реквизиту
			И в поле с именем 'DateEnd' я ввожу текст '3/31/2024'
			И я нажимаю на кнопку с именем 'select'
			Тогда открылось окно "Reporting period management (create) *"
			И из выпадающего списка с именем 'OrganizationalStructureVersion' я выбираю по строке "VA - Report preparation process"
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
		* Управление лимитами
			Когда открылось окно '$WindowTitle$'
			И я нажимаю на кнопку с именем 'FormGoForward'
		* Настройка отчетов
			Тогда открылось окно '$WindowTitle$'
			И я нажимаю на кнопку с именем 'ReportReconciliationByDefaultInBulk'
			Когда открылось окно "Set up object filling rules for regulation VA - Report preparation process"
			И Я закрываю окно "Set up object filling rules for regulation VA - Report preparation process"			
			Тогда открылось окно '$WindowTitle$'
			И я нажимаю на кнопку с именем 'ReportReconciliationByDefaultIndividual'
			Тогда открылось окно "Set up object filling rules for regulation VA - Report preparation process by scenario VA - Report preparation process for period January *"
			И Я закрываю окно "Set up object filling rules for regulation VA - Report preparation process by scenario VA - Report preparation process for period January *"
		* Процесс
			Когда открылось окно '$WindowTitle$'
			И я нажимаю на кнопку с именем 'FormGoForward'
			И элемент формы с именем 'StartProcess' доступен
			И элемент формы с именем 'TerminateProcess' не доступен
			И элемент формы с именем 'Group_ProcessProgressManagementTable' не доступен
			И я нажимаю на кнопку с именем 'StartProcess'
			Когда открылось окно "1C:Enterprise"
			И я нажимаю на кнопку с именем 'Button0'
			И Я запоминаю значение выражения 'Format(CurrentDate() - 864000, "DF=MM/dd/yy")' в переменную 'ProcessStartDate'
			И в поле с именем 'ProcessStartDate' я ввожу значение переменной '$ProcessStartDate$'
			И я нажимаю на кнопку с именем 'StartProcess'
			Когда открылось окно "1C:Enterprise"
			И я нажимаю на кнопку с именем 'Button0'
			И элемент формы с именем 'StartProcess' не доступен
			И элемент формы с именем 'TerminateProcess' доступен
			И элемент формы с именем 'Group_ProcessProgressManagementTable' доступен
			И я жду открытия окна '$WindowTitle$' в течение 20 секунд	
		* Кнопки открытия обработок управления процессом
			* Управление процессом подготовки отчетности
				Тогда открылось окно '$WindowTitle$'
				И я нажимаю на кнопку с именем 'ProcessesManagementReportPreparation'
				Тогда открылось окно "Reporting preparation management"
				Тогда элемент формы с именем 'PeriodManagement' стал равен '$WindowTitle$'
				И я перехожу к закладке с именем 'PageTransactionTree'
				Тогда таблица 'StepsTree' стала равной:
					| "Step / Company"                             | "Step state" |
					| "Manual filling - \"VA - ProcessCount\"" | "Not active"      |
					| "Import - \"VA - ProcessPrice\""                  | "Not active"      |
					| "Calculation by rule - \"VA - ProcessAmount\""      | "Not active"      |
					| "Consolidation - \"VA - ProcessAmount\""           | "Not active"      |
				И Я закрываю окно "Reporting preparation management"
			* Матрица отчетов
				Тогда открылось окно '$WindowTitle$'
				И я нажимаю на кнопку с именем 'ReportsMatrix'
				Тогда открылось окно "Report instance matrix"
				И я нажимаю на кнопку с именем 'FormSettings'
				И из выпадающего списка с именем 'SettingsComposerUserSettingsItem1Value' я выбираю точное значение "Yes"
				И из выпадающего списка с именем 'SettingsComposerUserSettingsItem2Value' я выбираю точное значение "Yes"
				И я нажимаю на кнопку с именем 'FormFormulate'
				Тогда табличный документ 'Result' равен макету "Макеты\19\ВА_ПроцессПодготовкиОтчетности_МатрицаОтчетов1_En.mxl"	
				И Я закрываю окно "Report instance matrix"	
		* Сохраняем документ						
			И я нажимаю на кнопку с именем 'FormGoForward'
			И я нажимаю на кнопку с именем 'FormClose'

	* Кнопки открытия обработок управления процессом		
		* Управление процессом подготовки отчетности
			Когда открылось окно "Reporting period management"
			И я нажимаю на кнопку с именем 'FormProcessesManagementReportPreparation'
			Тогда открылось окно "Reporting preparation management"
			Тогда элемент формы с именем 'PeriodManagement' стал равен '$WindowTitle$'
			Тогда таблица 'StepsTree' стала равной:
				| "Step / Company"                             | "Step state" |
				| "Manual filling - \"VA - ProcessCount\"" | "Not active"      |
				| "Import - \"VA - ProcessPrice\""                  | "Not active"      |
				| "Calculation by rule - \"VA - ProcessAmount\""      | "Not active"      |
				| "Consolidation - \"VA - ProcessAmount\""           | "Not active"      |
			И Я закрываю окно "Reporting preparation management"
		* Матрица отчетов
			Когда открылось окно "Reporting period management"
			И я нажимаю на кнопку с именем 'FormReportInstancesMatrix'
			Когда открылось окно "Report instance matrix"
			Тогда табличный документ 'Result' равен макету "Макеты\19\ВА_ПроцессПодготовкиОтчетности_МатрицаОтчетов1_En.mxl"
			И Я закрываю окно "Report instance matrix"

	* Закрытие формы
		Когда открылось окно "Reporting period management"
		И Я закрываю окно "Reporting period management"	

Сценарий: 19.12 Ручное заполнение - "VA - ProcessCount"

	И Я открываю управление процессом подготовки отчетности для сценария "VA - Report preparation process"

	* Останавливаем и запускаем процесс
		Когда открылось окно "Reporting preparation management"
		Если у элемента формы с именем 'StepsTreeOutputMessages' не установлена пометка Тогда
			И я нажимаю на кнопку с именем 'StepsTreeOutputMessages'
		Если у элемента формы с именем 'ShowTransactionTree' не установлена пометка Тогда
			И я нажимаю на кнопку с именем 'ShowTransactionTree'
		И элемент формы с именем 'LabelProcessState' стал равен "The report preparation process is started on *" по шаблону
		И я нажимаю на кнопку с именем 'StopProcess'
		Когда открылось окно "1C:Enterprise"
		И я нажимаю на кнопку с именем 'Button0'
		И элемент формы с именем 'LabelProcessState' стал равен "The report preparation process is not started"
		И я нажимаю на кнопку с именем 'StartProcess'
		Когда открылось окно "1C:Enterprise"
		И я нажимаю на кнопку с именем 'Button0'
		И элемент формы с именем 'LabelProcessState' стал равен "The report preparation process is started on *" по шаблону
		И я перехожу к закладке с именем 'PageTransactionTree'
		Тогда таблица 'StepsTree' содержит "11" строк из списка:
			| "Step / Company"                             | "Relevant step"                                | "Step state" | "End date (planned)" | "End date (actual)" | "Remaining / Variance" |
			| "Manual filling - \"VA - ProcessCount\"" | ""                                               | "Not active"      | ""                      | ""                      | ""                      |
			| "Mercury LLC"                                   | "Manual filling - \"VA - ProcessCount\"" | "Not active"      | ""                      | ""                      | ""                      |
			| "Venus LLC"                                     | "Manual filling - \"VA - ProcessCount\"" | "Not active"      | ""                      | ""                      | ""                      |
			| "Import - \"VA - ProcessPrice\""                  | ""                                               | "Not active"      | ""                      | ""                      | ""                      |
			| "Mercury LLC"                                   | "Import - \"VA - ProcessPrice\""                  | "Not active"      | ""                      | ""                      | ""                      |
			| "Venus LLC"                                     | "Import - \"VA - ProcessPrice\""                  | "Not active"      | ""                      | ""                      | ""                      |
			| "Calculation by rule - \"VA - ProcessAmount\""      | ""                                               | "Not active"      | ""                      | ""                      | ""                      |
			| "Mercury LLC"                                   | "Manual filling - \"VA - ProcessCount\"" | "Not active"      | ""                      | ""                      | ""                      |
			| "Venus LLC"                                     | "Manual filling - \"VA - ProcessCount\"" | "Not active"      | ""                      | ""                      | ""                      |
			| "Consolidation - \"VA - ProcessAmount\""           | ""                                               | "Not active"      | ""                      | ""                      | ""                      |
			| "System LLC"                                    | "Manual filling - \"VA - ProcessCount\"" | "Not active"      | ""                      | ""                      | ""                      |

	* Заполняем по оганизации Меркурий
		И в таблице 'StepsTree' я перехожу к строке:
			| "Step / Company"                             |
			| "Manual filling - \"VA - ProcessCount\"" |
		И я выбираю пункт контекстного меню с именем 'StepsTreeContextMenuCreateStepDocuments' на элементе формы с именем 'StepsTree'
		И в таблице 'TransactionsTree' я перехожу к строке:
			| "Document template / Company" |
			| "Mercury LLC"                   |
		И в таблице 'TransactionsTree' я активизирую поле с именем 'TransactionsTreeCompanyDocumentTemplate'
		И в таблице 'TransactionsTree' я выбираю текущую строку
		
		И Открылся экземпляр отчета для вида отчета "VA - ProcessCount" валюта 'RUB' организация "Mercury LLC" сценарий "VA - Report preparation process" периодичность "Month" проект '' аналитики '' '' '' '' '' '' 
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
			Тогда открылось окно "Reporting preparation management"
			И в таблице 'TransactionsTree' я активизирую поле с именем 'OperationTreeState'
			И в таблице 'TransactionsTree' я выбираю текущую строку
			Тогда открылось окно "Report states"
			И в таблице 'List' я перехожу к строке:
				| "Reference"    |
				| "Confirmed" |
			И в таблице 'List' я выбираю текущую строку
	
	* Заполняем по оганизации Венера
		Тогда открылось окно "Reporting preparation management"	
		И в таблице 'TransactionsTree' я перехожу к строке:
			| "Document template / Company" |
			| "Venus LLC"             |
		И в таблице 'TransactionsTree' я активизирую поле с именем 'TransactionsTreeCompanyDocumentTemplate'	
		И в таблице 'TransactionsTree' я выбираю текущую строку
			
		И Открылся экземпляр отчета для вида отчета "VA - ProcessCount" валюта 'RUB' организация "Venus LLC" сценарий "VA - Report preparation process" периодичность "Month" проект '' аналитики '' '' '' '' '' '' 
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
				|"The \"Report instance *\" document is used in the \"Manual filling - \"VA - ProcessCount\"\" report preparation step with the \"Completed\" state.\nTo edit the document, open the specified step of the report preparation process."|
			И Я закрываю окно '$WindowTitle$'

	* Проверяем результат
		Когда открылось окно "Reporting preparation management"
		И я нажимаю на кнопку с именем 'GenerateReport'				
		И в таблице 'StepsTree' я перехожу к строке:
			| "Step / Company"                             | "Step state" |
			| "Manual filling - \"VA - ProcessCount\"" | "Completed"        |
		Тогда таблица 'TransactionsTree' содержит '3' строк из списка:
			| "Document template / Company" | "State" |
			| "VA - ProcessCount"   | "Confirmed" |
			| "Venus LLC"               | "Confirmed" |
			| "Mercury LLC"             | "Confirmed" |
		
	* Отменяем утверждение
		Когда открылось окно "Reporting preparation management"
		И в таблице 'StepsTree' я перехожу к строке:
			| "Step / Company"                             | "Step state" |
			| "Manual filling - \"VA - ProcessCount\"" | "Completed"        |
		И я выбираю пункт контекстного меню с именем 'StepsTreeContextMenuCancelStepProcessing' на элементе формы с именем 'StepsTree'
		Тогда открылось окно "Cancel the step processing for the companies:"
		И в таблице 'ScenariosPeriodsTable' я нажимаю на кнопку с именем 'ScenariosPeriodsTableCheckAll'				
		И я нажимаю на кнопку с именем 'Execute'
		Тогда таблица 'TransactionsTree' содержит '3' строк из списка:
			| "Document template / Company" | "State" |
			| "VA - ProcessCount"   | "Draft"  |
			| "Venus LLC"               | "Draft"  |
			| "Mercury LLC"             | "Draft"  |

	* Утверждаем снова
		Когда открылось окно "Reporting preparation management"
		И в таблице 'StepsTree' я перехожу к строке:
			| "Step / Company"                             | "Step state" |
			| "Manual filling - \"VA - ProcessCount\"" | "Not active"      |
		И я выбираю пункт контекстного меню с именем 'StepsTreeContextMenuFinishStageProcessing' на элементе формы с именем 'StepsTree'
		Тогда открылось окно "Complete the step processing for the companies:"
		И в таблице 'ScenariosPeriodsTable' я нажимаю на кнопку с именем 'ScenariosPeriodsTableCheckAll'
		И я изменяю флаг с именем 'ShouldFillDocuments'
		И я нажимаю на кнопку с именем 'Execute'
		Тогда в логе сообщений TestClient есть строка по шаблону "For the \"Report instance *\" document, the \"Manual filling\" generation method is set. Cannot set the document to the \"Confirmed\" state."
		И я очищаю окно сообщений пользователю		
		
	* Утверждаем вручную
		Когда открылось окно "Reporting preparation management"
		И в таблице 'TransactionsTree' я перехожу к строке:
			| "Document template / Company"  | "State" |
			| "Mercury LLC"            | "Draft"  |
		И в таблице 'TransactionsTree' я активизирую поле с именем 'OperationTreeState'
		И в таблице 'TransactionsTree' я выбираю текущую строку	
		Тогда открылось окно "Report states"
		И в таблице 'List' я перехожу к строке:
			| "Reference"    |
			| "Confirmed" |
		И в таблице "List" я выбираю текущую строку
		И в таблице 'TransactionsTree' я перехожу к строке:
			| "Document template / Company" | "State" |
			| "Venus LLC"             | "Draft"  |
		И в таблице 'TransactionsTree' я активизирую поле с именем 'OperationTreeState'
		И в таблице 'TransactionsTree' я выбираю текущую строку	
		Тогда открылось окно "Report states"
		И в таблице 'List' я перехожу к строке:
			| "Reference"    |
			| "Confirmed" |
		И в таблице "List" я выбираю текущую строку
		И в таблице 'StepsTree' я перехожу к строке:
			| "Step / Company"                             | "Step state" |
			| "Manual filling - \"VA - ProcessCount\"" | "Completed"        |
		Тогда таблица 'TransactionsTree' содержит '3' строк из списка:
			| "Document template / Company" | "State" |
			| "VA - ProcessCount"   | "Confirmed" |
			| "Venus LLC"               | "Confirmed" |
			| "Mercury LLC"             | "Confirmed" |

Сценарий: 19.13 Расчет по правилу - "VA - ProcessAmount"

	И Я открываю управление процессом подготовки отчетности для сценария "VA - Report preparation process"

	* Попытаем начать обработку этапа
		Когда открылось окно "Reporting preparation management"
		И в таблице 'StepsTree' я перехожу к строке:
			| "Step / Company"                        | "Step state" |
			| "Calculation by rule - \"VA - ProcessAmount\"" | "Not active"      |
		И я нажимаю на кнопку с именем 'StartStageProcessing'
		Тогда открылось окно "Start the step processing for the companies:"
		И я нажимаю на кнопку с именем 'Execute'
		Тогда в логе сообщений TestClient есть строки:
			|"Cannot start processing the \"Calculation by rule - \"VA - ProcessAmount\"\" step as there is an uncompleted subordinate step: \"Import - \"VA - ProcessPrice\"\""|
			
	* Попытаемся завершить этап
		И я выбираю пункт контекстного меню с именем 'StepsTreeContextMenuFinishStageProcessing' на элементе формы с именем 'StepsTree'
		Тогда открылось окно "Complete the step processing for the companies:"
		И я изменяю флаг с именем 'ShouldFillDocuments'
		И я нажимаю на кнопку с именем 'Execute'
		Тогда в логе сообщений TestClient есть строки:
			|"Cannot complete the \"Calculation by rule - \"VA - ProcessAmount\"\" step as there is an uncompleted subordinate step: \"Import - \"VA - ProcessPrice\"\""|

	* Проверим, что таблица не поменялась
		И в таблице 'StepsTree' я нажимаю на кнопку с именем 'StepsTreeCollapseAll'
		Тогда таблица 'StepsTree' стала равной:
			| "Step / Company"                             | "Step state" |
			| "Manual filling - \"VA - ProcessCount\"" | "Completed"        |
			| "Import - \"VA - ProcessPrice\""                  | "Not active"      |
			| "Calculation by rule - \"VA - ProcessAmount\""      | "Not active"      |
			| "Consolidation - \"VA - ProcessAmount\""           | "Not active"      |
					
Сценарий: 19.14 Импорт - "VA - ProcessPrice"	

	И Я открываю управление процессом подготовки отчетности для сценария "VA - Report preparation process"

	* Начинаем обработку этапа
		И в таблице 'StepsTree' я перехожу к строке:
			| "Step / Company"            | "Step state" |
			| "Import - \"VA - ProcessPrice\"" | "Not active"      |
		Тогда таблица 'TransactionsTree' содержит "3" строк из списка:
			| "Document template / Company" | "State" |
			| "VA - ProcessPrice"         | "Draft"  |
			| "Venus LLC"               | "Draft"  |
			| "Mercury LLC"             | "Draft"  |
		Когда открылось окно "Reporting preparation management"
		И я нажимаю на кнопку с именем 'StartStageProcessing'
		Тогда открылось окно "Start the step processing for the companies:"
		И я нажимаю на кнопку с именем 'Execute'
		И я жду открытия окна "Reporting preparation management" в течение 20 секунд

	* Проверяем, по организации Меркурий отчет должен быть заполнен
		И в таблице 'StepsTree' я перехожу к строке:
			| "Step / Company"            | "Step state" |
			| "Import - \"VA - ProcessPrice\"" | "Processing"     |
		И в таблице 'TransactionsTree' я перехожу к строке:
			| "Document template / Company" |
			| "Mercury LLC"           |
		И в таблице 'TransactionsTree' я активизирую поле с именем 'TransactionsTreeCompanyDocumentTemplate'
		И в таблице 'TransactionsTree' я выбираю текущую строку
		И Открылся экземпляр отчета для вида отчета "VA - ProcessPrice" валюта 'RUB' организация "Mercury LLC" сценарий "VA - Report preparation process" периодичность "Month" проект '' аналитики '' '' '' '' '' '' 
		Тогда табличный документ 'SpreadsheetFieldTemlate' равен:			
			| "VA - ProcessPrice" | ''                             | ''                     | ''               | ''                | ''             |
			| ''                 | ''                             | ''                     | ''               | ''                | ''             |
			| ''                 | "Product range_Description"    | "Product range_SKU" | "January 2024" | "February 2024" | "March 2024" |
			| ''                 | ''                             | ''                     | "Price"           | "Price"            | "Price"         |
			| "Goods"           | ''                             | ''                     | '5,250,000'      | '5,400,000'       | '5,550,000'    |
			| ''                 | "1C:ERP. Corporate performance management" | '2900001970198'        | '1,950,000'      | '2,000,000'       | '2,050,000'    |
			| ''                 | "2C:Corporation"                | '2900001871419'        | '2,050,000'      | '2,100,000'       | '2,150,000'    |
			| ''                 | "5C:Corporate performance management"    | '2900001871389'        | '1,250,000'      | '1,300,000'       | '1,350,000'    |
		Когда открылось окно '$WindowTitle$'
		И из выпадающего списка с именем 'StatusOfObject' я выбираю точное значение "Confirmed"
		И Я закрываю окно '$WindowTitle$'
								
	* Заполняем из формы управления процессом по организации Венера
		Когда открылось окно "Reporting preparation management"
		И я выбираю пункт контекстного меню с именем 'StepsTreeContextMenuStartStageProcessing' на элементе формы с именем 'StepsTree'
		Тогда открылось окно "Start the step processing for the companies:"
		И я нажимаю на кнопку с именем 'FormCancel'
		Тогда открылось окно "Reporting preparation management"
		И я выбираю пункт контекстного меню с именем 'StepsTreeContextMenuFinishStageProcessing' на элементе формы с именем 'StepsTree'
		Тогда открылось окно "Complete the step processing for the companies:"
		И в таблице 'ScenariosPeriodsTable' я нажимаю на кнопку с именем 'ScenariosPeriodsTableUncheckAll'
		И в таблице 'ScenariosPeriodsTable' я перехожу к строке:
			| "Selected" | "Company" |
			| "No"    | "Venus LLC"  |
		И в таблице 'ScenariosPeriodsTable' я устанавливаю флаг с именем 'ScenariosPeriodsTableSelected'
		И в таблице 'ScenariosPeriodsTable' я завершаю редактирование строки				
		И я нажимаю на кнопку с именем 'Execute'
		Тогда таблица 'TransactionsTree' содержит '3' строк из списка:
			| "Document template / Company" | "State" |
			| "VA - ProcessPrice"         | "Confirmed" |
			| "Venus LLC"               | "Confirmed" |
			| "Mercury LLC"             | "Confirmed" |

	* Сравниваем результат по организации Венера
		И в таблице 'TransactionsTree' я перехожу к строке:
			| "Document template / Company" |
			| "Venus LLC"             |
		И в таблице 'TransactionsTree' я активизирую поле с именем 'TransactionsTreeCompanyDocumentTemplate'
		И в таблице 'TransactionsTree' я выбираю текущую строку	
		И Открылся экземпляр отчета для вида отчета "VA - ProcessPrice" валюта 'RUB' организация "Venus LLC" сценарий "VA - Report preparation process" периодичность "Month" проект '' аналитики '' '' '' '' '' ''
		Тогда табличный документ 'SpreadsheetFieldTemlate' равен:
			| "VA - ProcessPrice" | ''                                                               | ''                     | ''               | ''                | ''             |
			| ''                 | ''                                                               | ''                     | ''               | ''                | ''             |
			| ''                 | "Product range_Description"                                      | "Product range_SKU" | "January 2024" | "February 2024" | "March 2024" |
			| ''                 | ''                                                               | ''                     | "Price"           | "Price"            | "Price"         |
			| "Goods"           | ''                                                               | ''                     | '780,000'        | '835,000'         | '890,000'      |
			| ''                 | "3C:Enterprise 8 CORP. Client license for 100 users" | '4601546106674'        | '600,000'        | '650,000'         | '700,000'      |
			| ''                 | "4C:Enterprise 8.3 CORP. Server License (x86-64)"           | '2900001916059'        | '180,000'        | '185,000'         | '190,000'      |
		И я нажимаю на кнопку с именем 'Write'
		Тогда открылось окно "1C:Enterprise"
		И я нажимаю на кнопку с именем 'OK'
		Тогда в логе сообщений TestClient есть строки по шаблону:
			|"The \"Report instance *\" document is used in the \"Import - \"VA - ProcessPrice\"\" report preparation step with the \"Completed\" state.\nTo edit the document, open the specified step of the report preparation process."|
		И Я закрываю окно '$WindowTitle$'	

	* Проверяем состояние дерева этапов
		И в таблице 'StepsTree' я нажимаю на кнопку с именем 'StepsTreeCollapseAll'
		Тогда таблица 'StepsTree' стала равной:
			| "Step / Company"                             | "Step state" |
			| "Manual filling - \"VA - ProcessCount\"" | "Completed"        |
			| "Import - \"VA - ProcessPrice\""                  | "Completed"        |
			| "Calculation by rule - \"VA - ProcessAmount\""      | "Not active"      |
			| "Consolidation - \"VA - ProcessAmount\""           | "Not active"      |
			
Сценарий: 19.15 Консолидация - "VA - ProcessAmount"

	И Я открываю управление процессом подготовки отчетности для сценария "VA - Report preparation process"	

	* Отменяем обработку этапов
		И в таблице 'StepsTree' я перехожу к строке:
			| "Step / Company"                        |
			| "Calculation by rule - \"VA - ProcessAmount\"" |
		И я выбираю пункт контекстного меню с именем 'StepsTreeContextMenuCancelStepProcessing' на элементе формы с именем 'StepsTree'
		Тогда открылось окно "Cancel the step processing for the companies:"
		И я нажимаю на кнопку с именем 'Execute'
		И в таблице 'StepsTree' я перехожу к строке:
			| "Step / Company"                   |
			| "Consolidation - \"VA - ProcessAmount\"" |
		И я выбираю пункт контекстного меню с именем 'StepsTreeContextMenuCancelStepProcessing' на элементе формы с именем 'StepsTree'
		Тогда открылось окно "Cancel the step processing for the companies:"
		И я нажимаю на кнопку с именем 'Execute'

	* Заполняем без утверждения		
		Когда открылось окно "Reporting preparation management"
		И я выбираю пункт контекстного меню с именем 'StepsTreeContextMenuProcessStagesUpToCurrent' на элементе формы с именем 'StepsTree'
		Тогда таблица 'TransactionsTree' стала равной:
			| "Document template / Company" | "State" |
			| "VA - ProcessAmount"        | "Draft"  |
			| "System LLC"              | "Draft"  |

	* Заполняем с утрверждением
		Когда открылось окно "Reporting preparation management"
		И я выбираю пункт контекстного меню с именем 'StepsTreeContextMenuProcessAndCompleteStagesUpToCurrent' на элементе формы с именем 'StepsTree'
		И в таблице 'StepsTree' я нажимаю на кнопку с именем 'StepsTreeCollapseAll'
		Тогда таблица 'StepsTree' стала равной:
			| "Step / Company"                             | "Step state" |
			| "Manual filling - \"VA - ProcessCount\"" | "Completed"        |
			| "Import - \"VA - ProcessPrice\""                  | "Completed"        |
			| "Calculation by rule - \"VA - ProcessAmount\""      | "Completed"        |
			| "Consolidation - \"VA - ProcessAmount\""           | "Completed"        |

	* Проверяем статусы "ВА - ПроцессСумма"
		И в таблице 'StepsTree' я перехожу к строке:
			| "Step / Company"                        | "Step state" |
			| "Calculation by rule - \"VA - ProcessAmount\"" | "Completed"        |
		Тогда таблица 'TransactionsTree' содержит '3' строк из списка:
			| "Document template / Company" | "State" |
			| "VA - ProcessAmount"        | "Confirmed" |
			| "Venus LLC"               | "Confirmed" |
			| "Mercury LLC"             | "Confirmed" |

	* Проверяем статусы "ВА - ПроцессСумма"
		И в таблице 'StepsTree' я перехожу к строке:
			| "Step / Company"                   | "Step state" |
			| "Consolidation - \"VA - ProcessAmount\"" | "Completed"        |
		Тогда таблица 'TransactionsTree' стала равной:
			| "Document template / Company" | "State" |
			| "VA - ProcessAmount"        | "Confirmed" |
			| "System LLC"              | "Confirmed" |
		И в таблице 'TransactionsTree' я перехожу к строке:
			| "Document template / Company" | "State" |
			| "System LLC"              | "Confirmed" |
		И в таблице 'TransactionsTree' я активизирую поле с именем 'TransactionsTreeCompanyDocumentTemplate'
		И в таблице 'TransactionsTree' я выбираю текущую строку
		
	* Сверяем итоговый отчет
		И Открылся экземпляр отчета для вида отчета "VA - ProcessAmount" валюта 'RUB' организация "System LLC" сценарий "VA - Report preparation process" периодичность "Month" проект '' аналитики '' '' '' '' '' ''									
		Тогда табличный документ 'SpreadsheetFieldTemlate' равен:
			| "VA - ProcessAmount"                                               | ''               | ''          | ''           | ''                | ''          | ''           | ''             | ''          | ''            | ''           | ''           | ''            |
			| ''                                                                | ''               | ''          | ''           | ''                | ''          | ''           | ''             | ''          | ''            | ''           | ''           | ''            |
			| ''                                                                | "January 2024" | ''          | ''           | "February 2024" | ''          | ''           | "March 2024" | ''          | ''            | "TOTAL"      | ''           | ''            |
			| ''                                                                | "Count"     | "Price"      | "Amount"      | "Count"      | "Price"      | "Amount"      | "Count"   | "Price"      | "Amount"       | "Count" | "Price"       | "Amount"       |
			| "Goods"                                                          | '60'             | '3,405,000' | '36,100,000' | '120'             | '3,535,000' | '74,900,000' | '180'          | '3,665,000' | '116,400,000' | '360'        | '10,605,000' | '227,400,000' |
			| "1C:ERP. Corporate performance management "                                   | '5'              | '975,000'   | '4,875,000'  | '10'              | '1,000,000' | '10,000,000' | '15'           | '1,025,000' | '15,375,000'  | '30'         | '3,000,000'  | '30,250,000'  |
			| "2C:Corporation "                                                  | '15'             | '1,025,000' | '15,375,000' | '30'              | '1,050,000' | '31,500,000' | '45'           | '1,075,000' | '48,375,000'  | '90'         | '3,150,000'  | '95,250,000'  |
			| "3C:Enterprise 8 CORP. Client license for 100 users " | '10'             | '600,000'   | '6,000,000'  | '20'              | '650,000'   | '13,000,000' | '30'           | '700,000'   | '21,000,000'  | '60'         | '1,950,000'  | '40,000,000'  |
			| "4C:Enterprise 8.3 CORP. Server License (x86-64) "           | '20'             | '180,000'   | '3,600,000'  | '40'              | '185,000'   | '7,400,000'  | '60'           | '190,000'   | '11,400,000'  | '120'        | '555,000'    | '22,400,000'  |
			| "5C:Corporate performance management "                                      | '10'             | '625,000'   | '6,250,000'  | '20'              | '650,000'   | '13,000,000' | '30'           | '675,000'   | '20,250,000'  | '60'         | '1,950,000'  | '39,500,000'  |
		
Сценарий: 19.16 Проверяем, что процесс завершен

	* Ищем нужный документ
		И В командном интерфейсе я выбираю "Budgeting, reporting, and analysis" "Reporting period management"
		Тогда открылось окно "Reporting period management"
		И Я в списке "Reporting period management" по полю "Scenario" ищу элемент "VA - Report preparation process" "Exact match" 

	* Открываем управление процессом из списка
		Тогда открылось окно "Reporting period management"
		И я нажимаю на кнопку с именем 'FormProcessesManagementReportPreparation'
		Тогда открылось окно "Reporting preparation management"
		И таблица 'StepsTree' стала равной:
			| "Step / Company"                             | "Step state" |
			| "Manual filling - \"VA - ProcessCount\"" | "Completed"        |
			| "Import - \"VA - ProcessPrice\""                  | "Completed"        |
			| "Calculation by rule - \"VA - ProcessAmount\""      | "Completed"        |
			| "Consolidation - \"VA - ProcessAmount\""           | "Completed"        |
		Тогда таблица 'TransactionsTree' стала равной:
			| "Document template / Company" | "State" |
			| "VA - ProcessCount"   | "Confirmed" |
			| "Mercury LLC"             | "Confirmed" |
			| "Venus LLC"               | "Confirmed" |
		И элемент формы с именем 'LabelProcessState' стал равен "The report preparation process is completed on *" по шаблону
		И Я закрываю окно "Reporting preparation management"

	* Открываем документ
		Тогда открылось окно "Reporting period management"
		И в таблице 'List' я выбираю текущую строку
		Тогда Открылся документ управления периодом для сценария "VA - Report preparation process" периодичность "Month"
		
	* Проверяем состояние процесса
		И в таблице 'Contents' я перехожу к строке:
			| 'Description'                  |
			| "Report preparation process" |
		И я перехожу к закладке с именем 'ProcessSetup'
		И элемент формы с именем 'StartProcess' доступен
		И элемент формы с именем 'TerminateProcess' не доступен
		И элемент формы с именем 'Group_ProcessProgressManagementTable' не доступен

	* Запускаем и останавливаем процесс
		И я нажимаю на кнопку с именем 'StartProcess'
		И я нажимаю на кнопку с именем 'TerminateProcess'
				
	
		
