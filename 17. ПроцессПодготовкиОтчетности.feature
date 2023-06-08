#language: ru

@tree

Функционал: 17. Процесс подготовки отчетности

Как Администратор я хочу
чтобы процесс подготовки отчетности работал без ошибок

Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий

Сценарий: 17.00 Определение типа приложения

	Пусть Инициализация переменных

Сценарий: 17.01 Создание группы видов отчетов "VA - Report preparation process (группа)"

	И Я создаю группу видов отчетов с именем "VA - Report preparation process (группа)" и родителем "VA - Report group"

Сценарий: 17.02 Создание вида отчета "VA - ProcessQuantity"

	* Создаем вид отчета
		И Я создаю вид отчета с именем "VA - ProcessQuantity" и родителем "VA - Report preparation process (группа)"

	* Настраиваем структуру
		И я открываю контруктор отчета с именем "VA - ProcessQuantity"
		И Я в конструкторе отчета добавляю строку с именем "Goods"
		И Я в конструкторе отчета добавляю колонку с именем "Quantity"
		И Я в конструкторе отчета добавляю аналитику с кодом "VA0Product" в ячейку 'R2C2'
	
	* Создаем бланк
		И Я Для вида отчета "VA - ProcessQuantity" создаю бланк по умолчанию

Сценарий: 17.03 Создание вида отчета "VA - ProcessPrice"

	* Создаем вид отчета
		И Я создаю вид отчета с именем "VA - ProcessPrice" и родителем "VA - Report preparation process (группа)"

	* Настраиваем структуру
		И я открываю контруктор отчета с именем "VA - ProcessPrice"
		И Я в конструкторе отчета добавляю строку с именем "Goods"
		И Я в конструкторе отчета добавляю колонку с именем "Price"
		И Я в конструкторе отчета добавляю аналитику с кодом "VA0Product" в ячейку 'R2C2'
	
	* Создаем бланк
		И Я Для вида отчета "VA - ProcessPrice" создаю бланк для импорта по умолчанию

Сценарий: 17.04 Создание внешней информационной базы "VA - ProcessImportPrice"

	И Я создаю внешнюю информационную базу "VA - ProcessImportPrice" тип 'Microsoft Excel files' каталог '$DirectoryПроекта$\Templates' тип хранилища ''

	* Тестируем механизм маски имени
		И я нажимаю на кнопку с именем 'NameStructureAdd'
		И в таблице 'NameStructure' из выпадающего списка с именем 'NameStructureItem' я выбираю точное значение "Report type"
		И в таблице 'NameStructure' из выпадающего списка с именем 'NameStructureStartElement' я выбираю точное значение "+"
		И в таблице 'NameStructure' из выпадающего списка с именем 'NameStructureItem' я выбираю точное значение "Company"
		И в таблице "StructureИмени" я отменяю редактирование строки
		Тогда элемент формы с именем 'FullNameMask' стал равен "$КаталогПроекта$\Макеты\<Report type>+<Company>.xls?"

	* Наставиваем элементы пути	
		Тогда открылось окно '$WindowTitle$'
		И я нажимаю на кнопку с именем 'OpenCompaniesFilesExchangeSettings'
		И Я добавляю элемент пути к файлам организаций для типа "Company" объект "Mercury LLC" значение "Mercury"
		И Я добавляю элемент пути к файлам организаций для типа "Company" объект "Venus LLC" значение "Venus"
		И Я добавляю элемент пути к файлам организаций для типа "ВидОтчета" объект "VA - ProcessPrice" значение "VA_ProcessPrice"
		Тогда открылось окно "Company file path items: List form"
		И я нажимаю на кнопку с именем 'FormClose'

	* Записываем и закрываем элемент
		Тогда открылось окно '$WindowTitle$'
		И я нажимаю на кнопку с именем 'FormWriteAndClose'
		И я жду закрытия окна '$WindowTitle$' в течение 20 секунд

Сценарий: 17.05 Создание вида отчета "VA - ProcessAmount"

	* Создаем вид отчета
		И Я создаю вид отчета с именем "VA - ProcessAmount" и родителем "VA - Report preparation process (группа)"

	* Настраиваем структуру
		И я открываю контруктор отчета с именем "VA - ProcessAmount"
		И Я в конструкторе отчета добавляю строку с именем "Goods"
		И Я в конструкторе отчета добавляю колонки
			| "Description" |
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
			И Я запоминаю значение выражения '"Delete_" + StrReplace(New UUID, "-", "")' в переменную 'UID'
			И в таблице 'List' я выбираю текущую строку
			Тогда Открылся регламент подготовки отчетности "VA - Report preparation process"
			И я перехожу к закладке с именем 'GroupMainPage'			
			* Удаляем процесс
				И я нажимаю на кнопку с именем 'ShowProcessTemplate'
				Тогда открылось окно 'Edit этапов процесса: DimenKind - Process_ подготовки отчетности'
				И я нажимаю на кнопку с именем 'FormOpenPropertiesПроцесса'
				Тогда открылось окно 'DimenKind - Process_ подготовки отчетности (Universal process template)'
				И в поле с именем 'Description' я ввожу значение переменной 'UID'
				И я нажимаю на кнопку с именем 'FormSetDeletionMark'
				Тогда открылось окно "1C:Enterprise"
				И я нажимаю на кнопку с именем 'Button0'
				И я нажимаю на кнопку с именем 'FormWriteAndClose'
				И я жду закрытия окна 'DimenKind - Process_ подготовки отчетности (Universal process template) *' в течение 20 секунд
				Тогда открылось окно 'Edit этапов процесса: DimenKind - Process_ подготовки отчетности'
				И Я закрываю окно 'Edit этапов процесса: DimenKind - Process_ подготовки отчетности'
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
		Тогда открылось окно "VA - Main regulations from * (Создание)"
		И в поле с именем 'Description' я ввожу текст "VA - Report preparation process"
		И из выпадающего списка с именем 'ReportKind' я выбираю по строке "VA - Report preparation process (группа)"
		* Создаем процесс
			И я устанавливаю флаг с именем 'UseProcess'
			И я нажимаю на кнопку с именем 'ShowProcessTemplate'
			Тогда открылось окно "1C:Enterprise"
			И я нажимаю на кнопку с именем 'Button0'
			Тогда открылось окно "Enter a process template name"
			И в поле с именем 'InputFld' я ввожу текст "VA - Report preparation process"
			И я нажимаю на кнопку с именем 'OK'
			Тогда открылось окно "Edit этапов процесса: VA - Report preparation process"
			И я нажимаю на кнопку с именем 'FormOpenPropertiesПроцесса'
			* Проверяем заполнение
				Тогда элемент формы с именем 'ProcessPurpose' стал равен "Report preparation process"
				И элемент формы с именем "Description" стал равен 'DimenKind - Process_ подготовки отчетности'
				И таблица "ParametersПроцесса" стала равной:
					| 'Predefined' | 'KeyAttribute_' | 'Code Parameters_'              | 'Name Parameters_'                | 'Type Parameters_'                | 'Value по byDefault' |
					| 'Yes'               | 'Yes'       | 'AccountingPeriodManagement' | 'Управление отчетным периодом' | 'Управление отчетным периодом' | ''                      |
					| 'Yes'               | 'No'      | 'ProcessInitiator'          | 'Initiator процесса'           | 'User'                 | ''                      |
				И элемент формы с именем "Parent" стал равен ''
				И элемент формы с именем "СвязанныйRegulation" стал равен 'DimenKind - Process_ подготовки отчетности'
				Когда открылось окно 'DimenKind - Process_ подготовки отчетности (Universal process template)'
				И Я закрываю окно 'DimenKind - Process_ подготовки отчетности (Universal process template)'
			Тогда открылось окно 'Edit этапов процесса: DimenKind - Process_ подготовки отчетности'
			И Я закрываю окно 'Edit этапов процесса: DimenKind - Process_ подготовки отчетности'
			Тогда открылось окно 'DimenKind - Process_ подгdatedовки datedчетности dated * (Regulation for preparing reports)'
			И я нажимаю на кнопку с именем 'FormWriteAndClose'
			И я жду закрытия окна 'DimenKind - Process_ подгdatedовки datedчетности dated * (Regulation for preparing reports)' в течение 20 секунд

Сценарий: 17.07 Тестируем кнопки управления процессом

	* Ищем элемент
		И В командном интерфейсе я выбираю "Processes and approval" "Process templates"
		Когда открылось окно 'Templates универсальных процессов'
		И я нажимаю на кнопку с именем 'FormFind'
		Тогда открылось окно 'Find'
		И из выпадающего списка с именем "FieldSelector" я выбираю точное значение 'Description'
		И в поле с именем 'Pattern' я ввожу текст 'DimenKind - Process_ подготовки отчетности'
		И я меняю значение переключателя с именем 'CompareType' на 'On точному совпадению'
		И я нажимаю на кнопку с именем 'Find'
		И в таблице 'List' количество строк 'равно' 1
		И в таблице 'List' я выбираю текущую строку

	* Проверяем, что документ пустой
		Когда открылось окно 'Edit этапов процесса: DimenKind - Process_ подготовки отчетности'
		И я нажимаю на кнопку с именем 'Edit'
		Тогда открылось окно 'Выберите этап'
		И в таблице "List" количество строк "равно" 0
		И элемент формы с именем "TemplateПроцесса" стал равен 'DimenKind - Process_ подготовки отчетности'
		И я закрываю окно 'Выберите этап'

	* Добавляем процесс для удаления
		Когда открылось окно 'Edit этапов процесса: DimenKind - Process_ подготовки отчетности'
		И я нажимаю на кнопку с именем 'AddStage_ReportPreparationProcessStep'
		Тогда открылось окно 'Stage процесса подготовки отчетности (Universal process step)'
		И в поле с именем 'Description' я ввожу текст 'For удаления'
		И я нажимаю на кнопку с именем 'FormWriteAndClose'
		И я жду закрытия окна 'Stage процесса подготовки отчетности (Universal process step) *' в течение 20 секунд

	* Копируем процесс
		Когда открылось окно 'Edit этапов процесса: DimenKind - Process_ подготовки отчетности'
		И я нажимаю на кнопку с именем 'Copy'
		И Я в списке 'Выберите этап' по полю 'Description' ищу и выбираю элемент 'For удаления' 'On точному совпадению'		
		Тогда открылось окно 'Stage универсального процесса (Create)'
		И в поле с именем 'Description' я ввожу текст 'Copy для удаления'
		И я нажимаю на кнопку с именем 'FormWriteAndClose'
		И я жду закрытия окна 'Stage универсального процесса (Create) *' в течение 20 секунд	

	* Изменяем процесс
		Когда открылось окно 'Edit этапов процесса: DimenKind - Process_ подготовки отчетности'
		И я нажимаю на кнопку с именем 'Edit'
		И Я в списке 'Выберите этап' по полю 'Description' ищу и выбираю элемент 'Copy для удаления' 'On точному совпадению'		
		Когда открылось окно 'Copy для удаления (Universal process step)'
		И в поле с именем 'Description' я ввожу текст 'Отредактированная копия для удаления'
		И я нажимаю на кнопку с именем 'FormWriteAndClose'
		И я жду закрытия окна 'Copy для удаления (Universal process step) *' в течение 20 секунд	

	* Настраиваем связь
		Когда открылось окно 'Edit этапов процесса: DimenKind - Process_ подготовки отчетности'
		И я нажимаю на кнопку с именем 'AddLink'
		И Я в списке 'Выберите начальный этап связи' по полю 'Description' ищу и выбираю элемент 'For удаления' 'On точному совпадению'
		И Я в списке 'Выберите конечный этап связи' по полю 'Description' ищу и выбираю элемент 'Отредактированная копия для удаления' 'On точному совпадению'		

	* Удаляем связь
		Когда открылось окно 'Edit этапов процесса: DimenKind - Process_ подготовки отчетности'
		И я нажимаю на кнопку с именем 'DeleteLink'
		И Я в списке 'Выберите начальный этап связи' по полю 'Description' ищу и выбираю элемент 'For удаления' 'On точному совпадению'
		И Я в списке 'Выберите конечный этап связи' по полю 'Description' ищу и выбираю элемент 'Отредактированная копия для удаления' 'On точному совпадению'

	* Удаляем процесс
		Тогда открылось окно 'Edit этапов процесса: DimenKind - Process_ подготовки отчетности'
		И я нажимаю на кнопку с именем 'MarkToDelete'
		И Я в списке 'Выберите этап' по полю 'Description' ищу и выбираю элемент 'Отредактированная копия для удаления' 'On точному совпадению'					
		Тогда открылось окно "1C:Enterprise"
		И я нажимаю на кнопку с именем 'Button0'

	* Удаляем процесс
		Тогда открылось окно 'Edit этапов процесса: DimenKind - Process_ подготовки отчетности'
		И я нажимаю на кнопку с именем 'MarkToDelete'
		И Я в списке 'Выберите этап' по полю 'Description' ищу и выбираю элемент 'For удаления' 'On точному совпадению'
		Тогда открылось окно "1C:Enterprise"
		И я нажимаю на кнопку с именем 'Button0'

	* Проверяем, что документ пустой
		Когда открылось окно 'Edit этапов процесса: DimenKind - Process_ подготовки отчетности'
		И я нажимаю на кнопку с именем 'MarkToDelete'
		Тогда открылось окно 'Выберите этап'
		И в таблице "List" количество строк "равно" 0
		И элемент формы с именем "TemplateПроцесса" стал равен 'DimenKind - Process_ подготовки отчетности'
		И я закрываю окно 'Выберите этап'		

Сценарий: 17.08 Настройка процесса

	* Ищем элемент
		И В командном интерфейсе я выбираю "Processes and approval" "Process templates"
		Когда открылось окно 'Templates универсальных процессов'
		И я нажимаю на кнопку с именем 'FormFind'
		Тогда открылось окно 'Find'
		И из выпадающего списка с именем "FieldSelector" я выбираю точное значение 'Description'
		И в поле с именем 'Pattern' я ввожу текст 'DimenKind - Process_ подготовки отчетности'
		И я меняю значение переключателя с именем 'CompareType' на 'On точному совпадению'
		И я нажимаю на кнопку с именем 'Find'
		И в таблице 'List' количество строк 'равно' 1
		И в таблице 'List' я выбираю текущую строку

	* Настриваем процесс для "ВА - ПроцессКоличество"
		Когда открылось окно 'Edit этапов процесса: DimenKind - Process_ подготовки отчетности'
		И я нажимаю на кнопку с именем 'AddStage_ReportPreparationProcessStep'
		Тогда открылось окно 'Stage процесса подготовки отчетности (Universal process step)'
		И в поле с именем 'Description' я ввожу текст 'Ручное заполнение - \"DimenKind - Process_Count\"'
		* Документы
			И в таблице "ФормируемыеDocuments" я нажимаю на кнопку с именем 'GeneratedDocuments_Add'
			И в таблице "ФормируемыеDocuments" я нажимаю кнопку выбора у реквизита с именем "ФормируемыеDocumentsDocumentБД"
			И Я в списке 'Documents IB' по полю 'Document' ищу и выбираю элемент 'Instance Report_' 'On началу строки'
			И в таблице "ФормируемыеDocuments" из выпадающего списка с именем "ФормируемыеDocumentsTemplateДокумента" я выбираю по строке 'DimenKind - Process_Count'
		* Организации
			И я перехожу к закладке с именем "Page_ОрганизационныеЕдиницыFilter"
			И в таблице "ОрганизационныеЕдиницыFilterDCSSettingsFilter" я нажимаю на кнопку с именем 'BusinessUnitsFilterDCSSettingsFilterAddFilterItem'
			И в таблице "ОрганизационныеЕдиницыFilterDCSSettingsFilter" из выпадающего списка с именем "ОрганизационныеЕдиницыFilterDCSSettingsFilterЛевоеValue" я выбираю точное значение 'Организационная единица'
			И в таблице "ОрганизационныеЕдиницыFilterDCSSettingsFilter" из выпадающего списка с именем "ОрганизационныеЕдиницыFilterDCSSettingsFilterKindСравнения" я выбираю точное значение 'IN List_SSLy'
			И в таблице "ОрганизационныеЕдиницыFilterDCSSettingsFilter" я нажимаю кнопку выбора у реквизита с именем "ОрганизационныеЕдиницыFilterDCSSettingsFilterПравоеValue"
			Тогда открылось окно 'List Values_'
			И я нажимаю на кнопку с именем 'Add'
			И в таблице "ValueList" из выпадающего списка с именем "Value" я выбираю по строке 'Mercury LLC'
			И я нажимаю на кнопку с именем 'Add'
			И в таблице "ValueList" из выпадающего списка с именем "Value" я выбираю по строке 'Венера LLC'
			И я нажимаю на кнопку с именем 'OK'
			Тогда открылось окно 'Stage процесса подготовки отчетности (Universal process step) *'
		* Настройки регламента
			И я перехожу к закладке с именем "Page_SettingsРегламента"
			И я нажимаю на кнопку с именем 'SetupAutofillRules'			
			* Меркурий
				Тогда открылось окно 'Setting Rules_ заполнения Objects_ для регламента DimenKind - Process_ подготовки отчетности'
				И в табличном документе 'FieldSettings' я перехожу к ячейке "R5C3"
				И в табличном документе 'FieldSettings' я делаю двойной клик на текущей ячейке
				Тогда открылось окно 'Setting Rules_ заполнения Reports_'
				И из выпадающего списка с именем "MethodФормированияОтчета" я выбираю точное значение 'Ручное заполнение'
				И я нажимаю на кнопку с именем 'FormWriteAndClose'
			* Венера
				Тогда открылось окно 'Setting Rules_ заполнения Objects_ для регламента DimenKind - Process_ подготовки отчетности'
				И в табличном документе 'FieldSettings' я перехожу к ячейке "R12C3"
				И в табличном документе 'FieldSettings' я делаю двойной клик на текущей ячейке
				Тогда открылось окно 'Setting Rules_ заполнения Reports_'
				И из выпадающего списка с именем "MethodФормированияОтчета" я выбираю точное значение 'Ручное заполнение'
				И я нажимаю на кнопку с именем 'FormWriteAndClose'
			* Применение настроек
				Тогда открылось окно 'Setting Rules_ заполнения Objects_ для регламента DimenKind - Process_ подготовки отчетности'
				И я нажимаю на кнопку с именем 'FormApplySettings'
				И Я закрываю окно 'Setting Rules_ заполнения Objects_ для регламента DimenKind - Process_ подготовки отчетности'
		* Сохранение
			Тогда открылось окно '* (Universal process step)'
			И я нажимаю на кнопку с именем 'FormWriteAndClose'
			И я жду закрытия окна '* (Universal process step)' в течение 20 секунд
				
	* Настриваем процесс для "ВА - ПроцессЦена"
		Когда открылось окно 'Edit этапов процесса: DimenKind - Process_ подготовки отчетности'
		И я нажимаю на кнопку с именем 'AddStage_ReportPreparationProcessStep'
		Тогда открылось окно 'Stage процесса подготовки отчетности (Universal process step)'
		И в поле с именем 'Description' я ввожу текст 'Import - \"DimenKind - Process_Price\"'				
		* Документы
			И в таблице "ФормируемыеDocuments" я нажимаю на кнопку с именем 'GeneratedDocuments_Add'
			И в таблице "ФормируемыеDocuments" я нажимаю кнопку выбора у реквизита с именем "ФормируемыеDocumentsDocumentБД"
			И Я в списке 'Documents IB' по полю 'Document' ищу и выбираю элемент 'Instance Report_' 'On началу строки'
			И в таблице "ФормируемыеDocuments" из выпадающего списка с именем "ФормируемыеDocumentsTemplateДокумента" я выбираю по строке 'DimenKind - Process_Price'
		* Организации
			И я перехожу к закладке с именем "Page_ОрганизационныеЕдиницыFilter"
			И в таблице "ОрганизационныеЕдиницыFilterDCSSettingsFilter" я нажимаю на кнопку с именем 'BusinessUnitsFilterDCSSettingsFilterAddFilterItem'
			И в таблице "ОрганизационныеЕдиницыFilterDCSSettingsFilter" из выпадающего списка с именем "ОрганизационныеЕдиницыFilterDCSSettingsFilterЛевоеValue" я выбираю точное значение 'Организационная единица'
			И в таблице "ОрганизационныеЕдиницыFilterDCSSettingsFilter" из выпадающего списка с именем "ОрганизационныеЕдиницыFilterDCSSettingsFilterKindСравнения" я выбираю точное значение 'IN List_SSLy'
			И в таблице "ОрганизационныеЕдиницыFilterDCSSettingsFilter" я нажимаю кнопку выбора у реквизита с именем "ОрганизационныеЕдиницыFilterDCSSettingsFilterПравоеValue"
			Тогда открылось окно 'List Values_'
			И я нажимаю на кнопку с именем 'Add'
			И в таблице "ValueList" из выпадающего списка с именем "Value" я выбираю по строке 'Mercury LLC'
			И я нажимаю на кнопку с именем 'Add'
			И в таблице "ValueList" из выпадающего списка с именем "Value" я выбираю по строке 'Венера LLC'
			И я нажимаю на кнопку с именем 'OK'
			Тогда открылось окно 'Stage процесса подготовки отчетности (Universal process step) *'
		* Настройки регламента
			И я перехожу к закладке с именем "Page_SettingsРегламента"
			И я нажимаю на кнопку с именем 'SetupAutofillRules'			
			* Меркурий
				Тогда открылось окно 'Setting Rules_ заполнения Objects_ для регламента DimenKind - Process_ подготовки отчетности'
				И в табличном документе 'FieldSettings' я перехожу к ячейке "R5C3"
				И в табличном документе 'FieldSettings' я делаю двойной клик на текущей ячейке
				Тогда открылось окно 'Setting Rules_ заполнения Reports_'
				* Настраиваем тип информационной базы
					И я нажимаю на кнопку открытия поля с именем "RuleData processors"
					Тогда открылось окно 'DimenKind - Process_Price (Calculation rules)'
					И из выпадающего списка с именем "TypeБД" я выбираю точное значение 'Microsoft Excel files'
					И я нажимаю на кнопку с именем 'FormWriteAndClose'
					И я жду закрытия окна 'DimenKind - Process_Price (Calculation rules) *' в течение 20 секунд
				* Проверяем тип информационной базы
					Тогда открылось окно 'Setting Rules_ заполнения Reports_'
					И из выпадающего списка с именем "MethodФормированияОтчета" я выбираю точное значение 'Import'
					И из выпадающего списка с именем "RuleData processors" я выбираю по строке 'DimenKind - Process_Price'
					И из выпадающего списка с именем "ВнешнийSource" я выбираю по строке 'DimenKind - Process_ImportPrice'
					И элемент формы с именем "TemplateИмпорта" стал равен 'DimenKind - Process_Price'
				И я нажимаю на кнопку с именем 'FormWriteAndClose'
			* Венера
				Тогда открылось окно 'Setting Rules_ заполнения Objects_ для регламента DimenKind - Process_ подготовки отчетности'
				И в табличном документе 'FieldSettings' я перехожу к ячейке "R12C3"
				И в табличном документе 'FieldSettings' я делаю двойной клик на текущей ячейке
				Тогда открылось окно 'Setting Rules_ заполнения Reports_'
				И из выпадающего списка с именем "MethodФормированияОтчета" я выбираю точное значение 'Import'
				И из выпадающего списка с именем "ВнешнийSource" я выбираю по строке 'DimenKind - Process_ImportPrice'
				И я нажимаю на кнопку с именем 'FormWriteAndClose'
			* Применение настроек
				Тогда открылось окно 'Setting Rules_ заполнения Objects_ для регламента DimenKind - Process_ подготовки отчетности'
				И я нажимаю на кнопку с именем 'FormApplySettings'
				И Я закрываю окно 'Setting Rules_ заполнения Objects_ для регламента DimenKind - Process_ подготовки отчетности'
		* Сохранение
			Тогда открылось окно '* (Universal process step)'
			И я нажимаю на кнопку с именем 'FormWriteAndClose'
			И я жду закрытия окна '* (Universal process step)' в течение 20 секунд

	* Настриваем процесс для "ВА - ПроцессСумма"
		Когда открылось окно 'Edit этапов процесса: DimenKind - Process_ подготовки отчетности'
		И я нажимаю на кнопку с именем 'AddStage_ReportPreparationProcessStep'
		Тогда открылось окно 'Stage процесса подготовки отчетности (Universal process step)'
		И в поле с именем 'Description' я ввожу текст 'Calculation по правилу - \"DimenKind - Process_Sum\"'
		* Документы
			И в таблице "ФормируемыеDocuments" я нажимаю на кнопку с именем 'GeneratedDocuments_Add'
			И в таблице "ФормируемыеDocuments" я нажимаю кнопку выбора у реквизита с именем "ФормируемыеDocumentsDocumentБД"
			И Я в списке 'Documents IB' по полю 'Document' ищу и выбираю элемент 'Instance Report_' 'On началу строки'
			И в таблице "ФормируемыеDocuments" из выпадающего списка с именем "ФормируемыеDocumentsTemplateДокумента" я выбираю по строке 'DimenKind - Process_Sum'
		* Организации
			И я перехожу к закладке с именем "Page_ОрганизационныеЕдиницыFilter"
			И в таблице "ОрганизационныеЕдиницыFilterDCSSettingsFilter" я нажимаю на кнопку с именем 'BusinessUnitsFilterDCSSettingsFilterAddFilterItem'
			И в таблице "ОрганизационныеЕдиницыFilterDCSSettingsFilter" из выпадающего списка с именем "ОрганизационныеЕдиницыFilterDCSSettingsFilterЛевоеValue" я выбираю точное значение 'Организационная единица'
			И в таблице "ОрганизационныеЕдиницыFilterDCSSettingsFilter" из выпадающего списка с именем "ОрганизационныеЕдиницыFilterDCSSettingsFilterKindСравнения" я выбираю точное значение 'IN List_SSLy'
			И в таблице "ОрганизационныеЕдиницыFilterDCSSettingsFilter" я нажимаю кнопку выбора у реквизита с именем "ОрганизационныеЕдиницыFilterDCSSettingsFilterПравоеValue"
			Тогда открылось окно 'List Values_'
			И я нажимаю на кнопку с именем 'Add'
			И в таблице "ValueList" из выпадающего списка с именем "Value" я выбираю по строке 'Mercury LLC'
			И я нажимаю на кнопку с именем 'Add'
			И в таблице "ValueList" из выпадающего списка с именем "Value" я выбираю по строке 'Венера LLC'
			И я нажимаю на кнопку с именем 'OK'
			Тогда открылось окно 'Stage процесса подготовки отчетности (Universal process step) *'
		* Настройки регламента
			И я перехожу к закладке с именем "Page_SettingsРегламента"
			И я нажимаю на кнопку с именем 'SetupAutofillRules'			
			* Меркурий
				Тогда открылось окно 'Setting Rules_ заполнения Objects_ для регламента DimenKind - Process_ подготовки отчетности'
				И в табличном документе 'FieldSettings' я перехожу к ячейке "R5C3"
				И в табличном документе 'FieldSettings' я делаю двойной клик на текущей ячейке
				Тогда открылось окно 'Setting Rules_ заполнения Reports_'
				И из выпадающего списка с именем "MethodФормированияОтчета" я выбираю точное значение 'On правилу обработки'
				И я нажимаю на кнопку с именем 'FormWriteAndClose'
			* Применение настроек
				Тогда открылось окно 'Setting Rules_ заполнения Objects_ для регламента DimenKind - Process_ подготовки отчетности'
				И я нажимаю на кнопку с именем 'FormApplySettings'
				И Я закрываю окно 'Setting Rules_ заполнения Objects_ для регламента DimenKind - Process_ подготовки отчетности'
		* Сохранение
			Тогда открылось окно '* (Universal process step)'
			И я нажимаю на кнопку с именем 'FormWriteAndClose'
			И я жду закрытия окна '* (Universal process step)' в течение 20 секунд

	* Настриваем процесс консолидации для "ВА - ПроцессСумма"
		Когда открылось окно 'Edit этапов процесса: DimenKind - Process_ подготовки отчетности'
		И я нажимаю на кнопку с именем 'AddStage_ReportPreparationProcessStep'
		Тогда открылось окно 'Stage процесса подготовки отчетности (Universal process step)'
		И в поле с именем 'Description' я ввожу текст 'Consolidation - \"DimenKind - Process_Sum\"'
		И из выпадающего списка с именем "TypeОрганизационнойЕдиницы" я выбираю точное значение 'Consolidating'
		* Документы
			И в таблице "ФормируемыеDocuments" я нажимаю на кнопку с именем 'GeneratedDocuments_Add'
			И в таблице "ФормируемыеDocuments" я нажимаю кнопку выбора у реквизита с именем "ФормируемыеDocumentsDocumentБД"
			И Я в списке 'Documents IB' по полю 'Document' ищу и выбираю элемент 'Instance Report_' 'On началу строки'
			И в таблице "ФормируемыеDocuments" из выпадающего списка с именем "ФормируемыеDocumentsTemplateДокумента" я выбираю по строке 'DimenKind - Process_Sum'
		* Организации
			И я перехожу к закладке с именем "Page_ОрганизационныеЕдиницыFilter"
			И в таблице "ОрганизационныеЕдиницыFilterDCSSettingsFilter" я нажимаю на кнопку с именем 'BusinessUnitsFilterDCSSettingsFilterAddFilterItem'
			И в таблице "ОрганизационныеЕдиницыFilterDCSSettingsFilter" из выпадающего списка с именем "ОрганизационныеЕдиницыFilterDCSSettingsFilterЛевоеValue" я выбираю точное значение 'Организационная единица'
			И в таблице "ОрганизационныеЕдиницыFilterDCSSettingsFilter" из выпадающего списка с именем "ОрганизационныеЕдиницыFilterDCSSettingsFilterKindСравнения" я выбираю точное значение 'Equal'
			И в таблице "ОрганизационныеЕдиницыFilterDCSSettingsFilter" из выпадающего списка с именем "ОрганизационныеЕдиницыFilterDCSSettingsFilterПравоеValue" я выбираю по строке 'Система LLC'
		* Настройки регламента
			И я перехожу к закладке с именем "Page_SettingsРегламента"
			И я нажимаю на кнопку с именем 'SetupAutofillRules'			
			* Система
				Тогда открылось окно 'Setting Rules_ заполнения Objects_ для регламента DimenKind - Process_ подготовки отчетности'
				И в табличном документе 'FieldSettings' я перехожу к ячейке "R5C3"
				И в табличном документе 'FieldSettings' я делаю двойной клик на текущей ячейке
				Тогда открылось окно 'Setting Rules_ заполнения Reports_'
				И выпадающий список с именем 'ReportGenerationMethod' стал равен:
					| "Manual filling"                          |
					| "By processing rule"                       |
					| "Consolidate perimeter (IFRS)"            |
					| "Consolidate perimeter (Proportionally)" |
					| "Import"                                     |
					| "Collapse by dimensions"                     |
					| "Collapse by period"                        |
				И из выпадающего списка с именем "MethodФормированияОтчета" я выбираю точное значение 'Consolidate периметр (Proportionally)'
				И я нажимаю на кнопку с именем 'FormWriteAndClose'
			* Применение настроек
				Тогда открылось окно 'Setting Rules_ заполнения Objects_ для регламента DimenKind - Process_ подготовки отчетности'
				И я нажимаю на кнопку с именем 'FormApplySettings'
				И Я закрываю окно 'Setting Rules_ заполнения Objects_ для регламента DimenKind - Process_ подготовки отчетности'
		* Сохранение
			Тогда открылось окно '* (Universal process step)'
			И я нажимаю на кнопку с именем 'FormWriteAndClose'
			И я жду закрытия окна '* (Universal process step)' в течение 20 секунд
						
	* Настраиваем связи
		Когда открылось окно 'Edit этапов процесса: DimenKind - Process_ подготовки отчетности'
		И я нажимаю на кнопку с именем 'AddLink'
		И Я в списке 'Выберите начальный этап связи' по полю 'Description' ищу и выбираю элемент 'Ручное заполнение - \"DimenKind - Process_Count\"' 'On точному совпадению'
		И Я в списке 'Выберите конечный этап связи' по полю 'Description' ищу и выбираю элемент 'Calculation по правилу - \"DimenKind - Process_Sum\"' 'On точному совпадению'
		И я нажимаю на кнопку с именем 'AddLink'
		И Я в списке 'Выберите начальный этап связи' по полю 'Description' ищу и выбираю элемент 'Import - \"DimenKind - Process_Price\"' 'On точному совпадению'
		И Я в списке 'Выберите конечный этап связи' по полю 'Description' ищу и выбираю элемент 'Calculation по правилу - \"DimenKind - Process_Sum\"' 'On точному совпадению'
		И я нажимаю на кнопку с именем 'AddLink'
		И Я в списке 'Выберите начальный этап связи' по полю 'Description' ищу и выбираю элемент 'Calculation по правилу - \"DimenKind - Process_Sum\"' 'On точному совпадению'
		И Я в списке 'Выберите конечный этап связи' по полю 'Description' ищу и выбираю элемент 'Consolidation - \"DimenKind - Process_Sum\"' 'On точному совпадению'		

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
			Тогда открылось окно '1C:Предприятие'
			И я нажимаю на кнопку с именем 'Button0'
		* Валюты
			И я жду открытия окна 'January * G. (Periodicity: Month) <DimenKind - Process_ подGотовки отчетности>' в течении 30 секунд
			И я запоминаю заголовок текущего окна как "TitleОкна"			
			И в таблице "TableРедактированияКурсов" я нажимаю на кнопку с именем 'RatesEditTableRatesTable_Update'
			И в таблице "TableРедактированияКурсов" я нажимаю на кнопку с именем 'RatesEditTableRatesTable_Write'
			И я нажимаю на кнопку с именем 'FormGoForward'
			Тогда открылось окно '1C:Предприятие'
			И я нажимаю на кнопку с именем 'Button0'
		* Настройка отчетов
			Тогда открылось окно '$WindowTitle$'
			И я нажимаю на кнопку с именем 'ReportReconciliationByDefaultInBulk'
			Когда открылось окно 'Setting Rules_ заполнения Objects_ для регламента DimenKind - Process_ подготовки отчетности'
			Тогда табличный документ "FieldSettings" равен:
				| 'Organization \ Object' | ''                    | 'DimenKind - Process_Sum'                          | 'DimenKind - Process_Count'        | 'DimenKind - Process_Price'                                                    |
				| 'Система LLC'          | 'Representation Report_'  | 'DimenKind - Process_Sum'                          | ''                              | ''                                                                    |
				| ''                     | 'Rule Calculation'     | 'DimenKind - Process_Sum'                          | ''                              | ''                                                                    |
				| ''                     | 'Rule проверки'    | 'DimenKind - Process_Sum'                          | ''                              | ''                                                                    |
				| ''                     | 'Method формирования' | 'Consolidate периметр (Proportionally)' | ''                              | ''                                                                    |
				| ''                     | 'Rule Import2'     | ''                                           | ''                              | ''                                                                    |
				| ''                     | 'Currency Object_ '     | 'From регламента: RUB'                         | ''                              | ''                                                                    |
				| ''                     | 'Template трансляции'   | ''                                           | ''                              | ''                                                                    |
				| 'Mercury LLC'         | 'Representation Report_'  | 'DimenKind - Process_Sum'                          | 'DimenKind - Process_Count'        | 'DimenKind - Process_Price'                                                    |
				| ''                     | 'Rule Calculation'     | 'DimenKind - Process_Sum'                          | 'DimenKind - Process_Count'        | 'DimenKind - Process_Price'                                                    |
				| ''                     | 'Rule проверки'    | 'DimenKind - Process_Sum'                          | 'DimenKind - Process_Count'        | 'DimenKind - Process_Price'                                                    |
				| ''                     | 'Method формирования' | 'On правилу обработки'                       | 'Ручное заполнение'             | 'Import\nOuter IB: DimenKind - Process_ImportPrice\n(Microsoft Excel files)' |
				| ''                     | 'Rule Import2'     | ''                                           | ''                              | ''                                                                    |
				| ''                     | 'Currency Object_ '     | 'From регламента: RUB (EUR, USD)'              | 'From регламента: RUB (EUR, USD)' | 'From регламента: RUB (EUR, USD)'                                       |
				| ''                     | 'Template трансляции'   | ''                                           | ''                              | ''                                                                    |
				| 'Венера LLC'           | 'Representation Report_'  | 'DimenKind - Process_Sum'                          | 'DimenKind - Process_Count'        | 'DimenKind - Process_Price'                                                    |
				| ''                     | 'Rule Calculation'     | 'DimenKind - Process_Sum'                          | 'DimenKind - Process_Count'        | 'DimenKind - Process_Price'                                                    |
				| ''                     | 'Rule проверки'    | 'DimenKind - Process_Sum'                          | 'DimenKind - Process_Count'        | 'DimenKind - Process_Price'                                                    |
				| ''                     | 'Method формирования' | ''                                           | 'Ручное заполнение'             | 'Import\nOuter IB: DimenKind - Process_ImportPrice\n(Microsoft Excel files)' |
				| ''                     | 'Rule Import2'     | ''                                           | ''                              | ''                                                                    |
				| ''                     | 'Currency Object_ '     | 'From регламента: RUB (EUR, USD)'              | 'From регламента: RUB (EUR, USD)' | 'From регламента: RUB (EUR, USD)'                                       |
				| ''                     | 'Template трансляции'   | ''                                           | ''                              | ''                                                                    |
			И Я закрываю окно 'Setting Rules_ заполнения Objects_ для регламента DimenKind - Process_ подготовки отчетности'			
			Тогда открылось окно '$WindowTitle$'
			И я нажимаю на кнопку с именем 'ReportReconciliationByDefaultIndividual'
			Тогда открылось окно 'Setting Rules_ For_полнения Objects_ для реGламента DimenKind - Process_ подGотовки отчетности по сценарию DimenKind - Process_ подGотовки отчетности For_ период January * G.'
			Тогда табличный документ "FieldSettings" равен:
				| 'Organization \ Object' | ''                    | 'DimenKind - Process_Sum'                          | 'DimenKind - Process_Count'        | 'DimenKind - Process_Price'                                                    |
				| 'Система LLC'          | 'Representation Report_'  | 'DimenKind - Process_Sum'                          | ''                              | ''                                                                    |
				| ''                     | 'Rule Calculation'     | 'DimenKind - Process_Sum'                          | ''                              | ''                                                                    |
				| ''                     | 'Rule проверки'    | 'DimenKind - Process_Sum'                          | ''                              | ''                                                                    |
				| ''                     | 'Method формирования' | 'Consolidate периметр (Proportionally)' | ''                              | ''                                                                    |
				| ''                     | 'Rule Import2'     | ''                                           | ''                              | ''                                                                    |
				| ''                     | 'Currency Object_ '     | 'From регламента: RUB'                         | ''                              | ''                                                                    |
				| ''                     | 'Template трансляции'   | ''                                           | ''                              | ''                                                                    |
				| 'Mercury LLC'         | 'Representation Report_'  | 'DimenKind - Process_Sum'                          | 'DimenKind - Process_Count'        | 'DimenKind - Process_Price'                                                    |
				| ''                     | 'Rule Calculation'     | 'DimenKind - Process_Sum'                          | 'DimenKind - Process_Count'        | 'DimenKind - Process_Price'                                                    |
				| ''                     | 'Rule проверки'    | 'DimenKind - Process_Sum'                          | 'DimenKind - Process_Count'        | 'DimenKind - Process_Price'                                                    |
				| ''                     | 'Method формирования' | 'On правилу обработки'                       | 'Ручное заполнение'             | 'Import\nOuter IB: DimenKind - Process_ImportPrice\n(Microsoft Excel files)' |
				| ''                     | 'Rule Import2'     | ''                                           | ''                              | ''                                                                    |
				| ''                     | 'Currency Object_ '     | 'From регламента: RUB (EUR, USD)'              | 'From регламента: RUB (EUR, USD)' | 'From регламента: RUB (EUR, USD)'                                       |
				| ''                     | 'Template трансляции'   | ''                                           | ''                              | ''                                                                    |
				| 'Венера LLC'           | 'Representation Report_'  | 'DimenKind - Process_Sum'                          | 'DimenKind - Process_Count'        | 'DimenKind - Process_Price'                                                    |
				| ''                     | 'Rule Calculation'     | 'DimenKind - Process_Sum'                          | 'DimenKind - Process_Count'        | 'DimenKind - Process_Price'                                                    |
				| ''                     | 'Rule проверки'    | 'DimenKind - Process_Sum'                          | 'DimenKind - Process_Count'        | 'DimenKind - Process_Price'                                                    |
				| ''                     | 'Method формирования' | ''                                           | 'Ручное заполнение'             | 'Import\nOuter IB: DimenKind - Process_ImportPrice\n(Microsoft Excel files)' |
				| ''                     | 'Rule Import2'     | ''                                           | ''                              | ''                                                                    |
				| ''                     | 'Currency Object_ '     | 'From регламента: RUB (EUR, USD)'              | 'From регламента: RUB (EUR, USD)' | 'From регламента: RUB (EUR, USD)'                                       |
				| ''                     | 'Template трансляции'   | ''                                           | ''                              | ''                                                                    |
			И Я закрываю окно 'Setting Rules_ For_полнения Objects_ для реGламента DimenKind - Process_ подGотовки отчетности по сценарию DimenKind - Process_ подGотовки отчетности For_ период January * G.'
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
		И в таблице "TreeSteps" я перехожу к строке:
			| 'Stage/Organization'                             |
			| 'Ручное заполнение - "DimenKind - Process_Count"' |
		И я выбираю пункт контекстного меню с именем 'StepsTreeContextMenuCancelStepProcessing' на элементе формы с именем "TreeSteps"
		Тогда открылось окно 'Cancel обработку этапа для следующих организаций:'
		И я нажимаю на кнопку с именем 'Execute'
		И я жду открытия окна "Report preparation management (table)" в течение 20 секунд

	* Заполняем по оганизации Меркурий
		И в таблице "TreeOperations" я перехожу к строке:
			| 'Kind Report_/Organization' |
			| 'Mercury LLC'           |
		И в таблице "TreeOperations" я активизирую поле с именем "TreeOperationsCompanyВидОтчета"
		И в таблице "TreeOperations" я выбираю текущую строку
		
		И Открылся экземпляр отчета для вида отчета "VA - ProcessQuantity" валюта 'RUB' организация 'Mercury LLC' сценарий 'DimenKind - Process_ подготовки отчетности' периодичность 'Month' проект '' аналитики '' '' '' '' '' '' 
		И В экземпляре отчета я удалю все существующие версии
		И я нажимаю на кнопку с именем 'EnableEdit'		
		И Я добавляю значения с раскрытием показателей в ячейку 'R6C1'
			| 'Products'                 | 'Period_1_Value1' | 'Period_2_Value1' | 'Period_3_Value1' |
			| '1C:ERP. Управление холдингом' | '10.00000'           | '20.00000'           | '30.00000'           |
			| '1C:Управление холдингом 8'    | '20.00000'           | '40.00000'           | '60.00000'           |			
			| '1C:Corporation'                | '30.00000'           | '60.00000'           | '90.00000'           |
		Когда открылось окно '$WindowTitle$'
		И я нажимаю на кнопку с именем 'WriteAndClose'
		И я жду закрытия окна '$WindowTitle$' в течение 20 секунд

		* Утверждаем из формы управления процессом
			Тогда открылось окно 'Управление процессом подготовки отчетности (таблица)'
			И в таблице "TreeOperations" я активизирую поле с именем "TreeOperationsState"
			И в таблице "TreeOperations" я выбираю текущую строку
			Тогда открылось окно 'States1 Reports_'
			И в таблице "List" я перехожу к строке:
				| 'Ref'    |
				| 'Upholded' |
			И в таблице "List" я выбираю текущую строку
	
	* Заполняем по оганизации Венера
		Тогда открылось окно 'Управление процессом подготовки отчетности (таблица)'	
		И в таблице "TreeOperations" я перехожу к строке:
			| 'Kind Report_/Organization' |
			| 'Венера LLC'             |
		И в таблице "TreeOperations" я активизирую поле с именем "TreeOperationsCompanyВидОтчета"	
		И в таблице "TreeOperations" я выбираю текущую строку
			
		И Открылся экземпляр отчета для вида отчета "VA - ProcessQuantity" валюта 'RUB' организация 'Венера LLC' сценарий 'DimenKind - Process_ подготовки отчетности' периодичность 'Month' проект '' аналитики '' '' '' '' '' '' 
		И В экземпляре отчета я удалю все существующие версии
		И я нажимаю на кнопку с именем 'EnableEdit'	
		И Я добавляю значения с раскрытием показателей в ячейку 'R6C1'
			| 'Products'                                                   | 'Period_1_Value1' | 'Period_2_Value1' | 'Period_3_Value1' |
			| '1C:Предприятие 8 CORP. Клиентская лицензия to1 100 рабочих мест' | '10.00000'           | '20.00000'           | '30.00000'           |
			| '1C:Предприятие 8.3 CORP. ILicenseInfo to1 сервер (x86-64)'           | '20.00000'           | '40.00000'           | '60.00000'           |			

		* Утверждаем из формы документа	
			Когда открылось окно '$WindowTitle$'
			И из выпадающего списка с именем "StatusОбъекта" я выбираю точное значение 'Upholded'
			Тогда открылось окно '1C:Предприятие'
			И я нажимаю на кнопку с именем 'Button0'
			И я жду открытия окна '$WindowTitle$' в течение 20 секунд
			И я нажимаю на кнопку с именем 'WriteAndClose'
			Тогда открылось окно '1C:Предприятие'
			И я нажимаю на кнопку с именем 'OK'
			Тогда в логе сообщений TestClient есть строки по шаблону:
				|'Document * Not Maybe be записан:\n- Stage процесса Ручное заполNotние - "DimenKind - Process_Count" использует вид Report_ DimenKind - Process_Count и находится в состоянии "Closed".'|
			И Я закрываю окно '$WindowTitle$'

	* Проверяем результат
		Когда открылось окно 'Управление процессом подготовки отчетности (таблица)'
		И я нажимаю на кнопку с именем 'GenerateReport'				
		И в таблице "TreeSteps" я перехожу к строке:
			| 'Stage/Organization'                             | 'State этапа' |
			| 'Ручное заполнение - "DimenKind - Process_Count"' | 'Completed'        |
		Тогда таблица "TreeOperations" стала равной:
			| 'Kind Report_/Organization' | 'State' |
			| 'DimenKind - Process_Count' | 'Upholded' |
			| 'Система LLC'            | 'Upholded' |
			| 'Венера LLC'             | 'Upholded' |
			| 'Mercury LLC'           | 'Upholded' |		
		
	* Отменяем утверждение
		Когда открылось окно 'Управление процессом подготовки отчетности (таблица)'
		И в таблице "TreeSteps" я перехожу к строке:
			| 'Stage/Organization'                             | 'State этапа' |
			| 'Ручное заполнение - "DimenKind - Process_Count"' | 'Completed'        |
		И я выбираю пункт контекстного меню с именем 'StepsTreeContextMenuCancelStepProcessing' на элементе формы с именем "TreeSteps"
		Тогда открылось окно 'Cancel обработку этапа для следующих организаций:'
		И я нажимаю на кнопку с именем 'Execute'
		Тогда таблица "TreeOperations" стала равной:
			| 'Kind Report_/Organization' | 'State' |
			| 'DimenKind - Process_Count' | 'Draft'  |
			| 'Система LLC'            | 'Draft'  |
			| 'Венера LLC'             | 'Draft'  |
			| 'Mercury LLC'           | 'Draft'  |

	* Утверждаем снова
		Когда открылось окно 'Управление процессом подготовки отчетности (таблица)'
		И в таблице "TreeSteps" я перехожу к строке:
			| 'Stage/Organization'                             | 'State этапа' |
			| 'Ручное заполнение - "DimenKind - Process_Count"' | 'Not активен'      |
		И я выбираю пункт контекстного меню с именем 'StepsTreeContextMenuSetStepStateClosed' на элементе формы с именем "TreeSteps"
		Тогда открылось окно 'Close этап для следующих организаций:'
		И я изменяю флаг с именем 'ShouldFillDocuments'
		И я нажимаю на кнопку с именем 'Execute'
		Тогда таблица "TreeOperations" стала равной:
			| 'Kind Report_/Organization' | 'State' |
			| 'DimenKind - Process_Count' | 'Upholded' |
			| 'Система LLC'            | 'Upholded' |
			| 'Венера LLC'             | 'Upholded' |
			| 'Mercury LLC'           | 'Upholded' |		
					
Сценарий: 17.11 Импорт - "VA - ProcessPrice"	

	И Я открываю управление процессом подготовки отчетности для сценария "VA - Report preparation process"

	* Отменяем этап
		И в таблице "TreeSteps" я перехожу к строке:
			| 'Stage/Organization'            |
			| 'Import - "DimenKind - Process_Price"' |
		И я выбираю пункт контекстного меню с именем 'StepsTreeContextMenuCancelStepProcessing' на элементе формы с именем "TreeSteps"
		Тогда открылось окно 'Cancel обработку этапа для следующих организаций:'
		И я нажимаю на кнопку с именем 'Execute'
		И я жду открытия окна "Report preparation management (table)" в течение 20 секунд

	* Заполняем по оганизации Меркурий
		* Находим строку	
			И в таблице "TreeOperations" я перехожу к строке:
				| 'Kind Report_/Organization' |
				| 'Mercury LLC'           |
			И в таблице "TreeOperations" я активизирую поле с именем "TreeOperationsCompanyВидОтчета"
			И в таблице "TreeOperations" я выбираю текущую строку
		* Заполняем и записываем отчет
			И Открылся экземпляр отчета для вида отчета "VA - ProcessPrice" валюта 'RUB' организация 'Mercury LLC' сценарий 'DimenKind - Process_ подготовки отчетности' периодичность 'Month' проект '' аналитики '' '' '' '' '' '' 
			И я нажимаю на кнопку с именем 'FormFillByDefault'
			Тогда табличный документ "FieldТабличногоДокументаTemplate" равен:
				| 'DimenKind - Process_Price' | ''                             | ''               | ''                | ''             |
				| ''                 | ''                             | ''               | ''                | ''             |
				| ''                 | 'Products'                 | 'January 2021 G.' | 'February 2021 G.' | 'March 2021 G.' |
				| ''                 | ''                             | 'Price'           | 'Price'            | 'Price'         |
				| 'Goods'           | ''                             | '5,250,000'      | '5,400,000'       | '5,550,000'    |
				| ''                 | '1C:ERP. Управление холдингом' | '1,950,000'      | '2,000,000'       | '2,050,000'    |
				| ''                 | '1C:Corporation'                | '2,050,000'      | '2,100,000'       | '2,150,000'    |
				| ''                 | '1C:Управление холдингом 8'    | '1,250,000'      | '1,300,000'       | '1,350,000'    |
			Когда открылось окно '$WindowTitle$'
			И я нажимаю на кнопку с именем 'WriteAndClose'
			И я жду закрытия окна '$WindowTitle$' в течение 20 секунд
								
	* Заполняем из формы управления процессом
		И я выбираю пункт контекстного меню с именем 'StepsTreeContextMenuSetStepStateToOpen' на элементе формы с именем "TreeSteps"
		Тогда открылось окно 'Open этап для следующих организаций:'
		И я нажимаю на кнопку с именем 'FormCancel'
		Тогда открылось окно 'Управление процессом подготовки отчетности (таблица)'
		И я выбираю пункт контекстного меню с именем 'StepsTreeContextMenuSetStepStateClosed' на элементе формы с именем "TreeSteps"
		Тогда открылось окно 'Close этап для следующих организаций:'
		И я нажимаю на кнопку с именем 'Execute'
		Тогда таблица "TreeOperations" стала равной:
			| 'Kind Report_/Organization' | 'State' |
			| 'DimenKind - Process_Price'       | 'Upholded' |
			| 'Система LLC'            | 'Upholded' |
			| 'Венера LLC'             | 'Upholded' |
			| 'Mercury LLC'           | 'Upholded' |
		* Сравниваем результат
			* По организации Меркурий
				И в таблице "TreeOperations" я перехожу к строке:
					| 'Kind Report_/Organization' |
					| 'Mercury LLC'           |
				И в таблице "TreeOperations" я активизирую поле с именем "TreeOperationsCompanyВидОтчета"
				И в таблице "TreeOperations" я выбираю текущую строку	
				И Открылся экземпляр отчета для вида отчета "VA - ProcessPrice" валюта 'RUB' организация 'Mercury LLC' сценарий 'DimenKind - Process_ подготовки отчетности' периодичность 'Month' проект '' аналитики '' '' '' '' '' ''
				Тогда табличный документ "FieldТабличногоДокументаTemplate" равен:
					| 'DimenKind - Process_Price' | ''                             | ''               | ''                | ''             |
					| ''                 | ''                             | ''               | ''                | ''             |
					| ''                 | 'Products'                 | 'January 2021 G.' | 'February 2021 G.' | 'March 2021 G.' |
					| ''                 | ''                             | 'Price'           | 'Price'            | 'Price'         |
					| 'Goods'           | ''                             | '5,250,000'      | '5,400,000'       | '5,550,000'    |
					| ''                 | '1C:ERP. Управление холдингом' | '1,950,000'      | '2,000,000'       | '2,050,000'    |
					| ''                 | '1C:Corporation'                | '2,050,000'      | '2,100,000'       | '2,150,000'    |
					| ''                 | '1C:Управление холдингом 8'    | '1,250,000'      | '1,300,000'       | '1,350,000'    |
				Когда открылось окно '$WindowTitle$'
				И я нажимаю на кнопку с именем 'Write'
				Тогда открылось окно '1C:Предприятие'
				И я нажимаю на кнопку с именем 'OK'
				Тогда в логе сообщений TestClient есть строки по шаблону:
					|'Document * Not Maybe be записан:\n- Stage процесса Import - "DimenKind - Process_Price" использует вид Report_ DimenKind - Process_Price и находится в состоянии "Closed".'|
				И Я закрываю окно '$WindowTitle$'			
			* По организации Венера
				И в таблице "TreeOperations" я перехожу к строке:
					| 'Kind Report_/Organization' |
					| 'Венера LLC'             |
				И в таблице "TreeOperations" я активизирую поле с именем "TreeOperationsCompanyВидОтчета"
				И в таблице "TreeOperations" я выбираю текущую строку	
				И Открылся экземпляр отчета для вида отчета "VA - ProcessPrice" валюта 'RUB' организация 'Венера LLC' сценарий 'DimenKind - Process_ подготовки отчетности' периодичность 'Month' проект '' аналитики '' '' '' '' '' ''
				Тогда табличный документ "FieldТабличногоДокументаTemplate" равен:
					| 'DimenKind - Process_Price' | ''                                                               | ''               | ''                | ''             |
					| ''                 | ''                                                               | ''               | ''                | ''             |
					| ''                 | 'Products'                                                   | 'January 2021 G.' | 'February 2021 G.' | 'March 2021 G.' |
					| ''                 | ''                                                               | 'Price'           | 'Price'            | 'Price'         |
					| 'Goods'           | ''                                                               | '780,000'        | '835,000'         | '890,000'      |
					| ''                 | '1C:Предприятие 8 CORP. Клиентская лицензия to1 100 рабочих мест' | '600,000'        | '650,000'         | '700,000'      |
					| ''                 | '1C:Предприятие 8.3 CORP. ILicenseInfo to1 сервер (x86-64)'           | '180,000'        | '185,000'         | '190,000'      |
				И Я закрываю окно '$WindowTitle$'							
			
Сценарий: 17.12 Консолидация - "VA - ProcessAmount"

	И Я открываю управление процессом подготовки отчетности для сценария "VA - Report preparation process"	

	* Отменяем обработку этапов
		И в таблице "TreeSteps" я перехожу к строке:
			| 'Stage/Organization'                        |
			| 'Calculation по правилу - "DimenKind - Process_Sum"' |
		И я выбираю пункт контекстного меню с именем 'StepsTreeContextMenuCancelStepProcessing' на элементе формы с именем "TreeSteps"
		Тогда открылось окно 'Cancel обработку этапа для следующих организаций:'
		И я нажимаю на кнопку с именем 'Execute'
		И в таблице "TreeSteps" я перехожу к строке:
			| 'Stage/Organization'                   |
			| 'Consolidation - "DimenKind - Process_Sum"' |
		И я выбираю пункт контекстного меню с именем 'StepsTreeContextMenuCancelStepProcessing' на элементе формы с именем "TreeSteps"
		Тогда открылось окно 'Cancel обработку этапа для следующих организаций:'
		И я нажимаю на кнопку с именем 'Execute'

	* Заполняем без утверждения		
		И я выбираю пункт контекстного меню с именем 'StepsTreeContextMenuFillUpToCurrentStep' на элементе формы с именем "TreeSteps"
		Тогда таблица "TreeOperations" стала равной:
			| 'Kind Report_/Organization' | 'State' |
			| 'DimenKind - Process_Sum'      | 'Draft'  |

	* Заполняем с утрверждением
		И я выбираю пункт контекстного меню с именем 'StepsTreeContextMenuPerformProcessTillThisStep' на элементе формы с именем "TreeSteps"
		Тогда таблица "TreeSteps" стала равной:
			| 'Stage/Organization'                             | 'State этапа' |
			| 'Ручное заполнение - "DimenKind - Process_Count"' | 'Completed'        |
			| 'Import - "DimenKind - Process_Price"'                  | 'Completed'        |
			| 'Calculation по правилу - "DimenKind - Process_Sum"'      | 'Completed'        |
			| 'Consolidation - "DimenKind - Process_Sum"'           | 'Completed'        |
		
	* Проверяем статусы "ВА - ПроцессСумма"
		И в таблице "TreeSteps" я перехожу к строке:
			| 'Stage/Organization'                        | 'State этапа' |
			| 'Calculation по правилу - "DimenKind - Process_Sum"' | 'Completed'        |
		Тогда таблица "TreeOperations" стала равной:
			| 'Kind Report_/Organization' | 'State' |
			| 'DimenKind - Process_Sum'      | 'Upholded' |
			| 'Система LLC'            | 'Upholded' |
			| 'Венера LLC'             | 'Upholded' |
			| 'Mercury LLC'           | 'Upholded' |

	* Проверяем статусы "ВА - ПроцессСумма"
		И в таблице "TreeSteps" я перехожу к строке:
			| 'Stage/Organization'                   | 'State этапа' |
			| 'Consolidation - "DimenKind - Process_Sum"' | 'Completed'        |
		Тогда таблица "TreeOperations" стала равной:
			| 'Kind Report_/Organization' | 'State' |
			| 'DimenKind - Process_Sum'      | 'Upholded' |
		И в таблице "TreeOperations" я активизирую поле с именем "TreeOperationsCompanyВидОтчета"
		И в таблице "TreeOperations" я выбираю текущую строку
		
	* Сверяем итоговый отчет
		И Открылся экземпляр отчета для вида отчета "VA - ProcessAmount" валюта 'RUB' организация 'Система LLC' сценарий 'DimenKind - Process_ подготовки отчетности' периодичность 'Month' проект '' аналитики '' '' '' '' '' ''									
		Тогда табличный документ "FieldТабличногоДокументаTemplate" равен:
			| 'DimenKind - Process_Sum'                                               | ''               | ''          | ''           | ''                | ''          | ''           | ''             | ''          | ''            | ''           | ''           | ''            |
			| ''                                                                | ''               | ''          | ''           | ''                | ''          | ''           | ''             | ''          | ''            | ''           | ''           | ''            |
			| ''                                                                | 'January 2021 G.' | ''          | ''           | 'February 2021 G.' | ''          | ''           | 'March 2021 G.' | ''          | ''            | 'TOTAL'      | ''           | ''            |
			| ''                                                                | 'Count'     | 'Price'      | 'Sum'      | 'Count'      | 'Price'      | 'Sum'      | 'Count'   | 'Price'      | 'Sum'       | 'Count' | 'Price'       | 'Sum'       |
			| 'Goods'                                                          | '60'             | '3,405,000' | '36,100,000' | '120'             | '3,535,000' | '74,900,000' | '180'          | '3,665,000' | '116,400,000' | '360'        | '10,605,000' | '227,400,000' |
			| '1C:ERP. Управление холдингом '                                   | '5'              | '975,000'   | '4,875,000'  | '10'              | '1,000,000' | '10,000,000' | '15'           | '1,025,000' | '15,375,000'  | '30'         | '3,000,000'  | '30,250,000'  |
			| '1C:Corporation '                                                  | '15'             | '1,025,000' | '15,375,000' | '30'              | '1,050,000' | '31,500,000' | '45'           | '1,075,000' | '48,375,000'  | '90'         | '3,150,000'  | '95,250,000'  |
			| '1C:Предприятие 8 CORP. Клиентская лицензия to1 100 рабочих мест ' | '10'             | '600,000'   | '6,000,000'  | '20'              | '650,000'   | '13,000,000' | '30'           | '700,000'   | '21,000,000'  | '60'         | '1,950,000'  | '40,000,000'  |
			| '1C:Предприятие 8.3 CORP. ILicenseInfo to1 сервер (x86-64) '           | '20'             | '180,000'   | '3,600,000'  | '40'              | '185,000'   | '7,400,000'  | '60'           | '190,000'   | '11,400,000'  | '120'        | '555,000'    | '22,400,000'  |
			| '1C:Управление холдингом 8 '                                      | '10'             | '625,000'   | '6,250,000'  | '20'              | '650,000'   | '13,000,000' | '30'           | '675,000'   | '20,250,000'  | '60'         | '1,950,000'  | '39,500,000'  |
		
Сценарий: 17.13 Останавливаем процесс

	* Ищем нужный документ
		Когда В панели разделов я выбираю 'Budgeting, отчетность и анализ'
		И В командном интерфейсе я выбираю 'Budgeting, отчетность и анализ' 'Управление отчетным периодом'
		Тогда открылось окно 'Управление отчетным периодом'
		И Я в списке 'Управление отчетным периодом' по полю 'Scenario' ищу и выбираю элемент 'DimenKind - Process_ подготовки отчетности' 'On точному совпадению' 
		Тогда Открылся документ управления периодом для сценария 'DimenKind - Process_ подготовки отчетности' периодичность 'Month'
		
	* Останавливаем процесс	
		И в таблице "Contents" я перехожу к строке:
			| 'Description'             |
			| 'Process_, отчеты и лимиты' |
		И я перехожу к закладке с именем "SettingПроцесса"
		И я нажимаю на кнопку с именем 'ProcessManagement_StopProcess1'
		И я жду открытия окна '$WindowTitle$' в течение 20 секунд
		Тогда в логе сообщений TestClient есть строки:
			|'Process is terminated'|
		
	* Проверяем результат
		И я нажимаю на кнопку с именем 'ProcessManagement_Document3'
		Тогда открылось окно 'Управление процессом подготовки отчетности (таблица)'
		И в таблице "TreeSteps" я перехожу к строке:
			| 'Stage/Organization'                             |
			| 'Ручное заполнение - "DimenKind - Process_Count"' |
		Тогда таблица "TreeOperations" стала равной:
			| 'Kind Report_/Organization' | 'State'                |
			| 'DimenKind - Process_Count' | 'Verified, to1 утверждении' |
			| 'Система LLC'            | 'Verified, to1 утверждении' |
			| 'Венера LLC'             | 'Verified, to1 утверждении' |
			| 'Mercury LLC'           | 'Verified, to1 утверждении' |
		И Я закрываю окно 'Управление процессом подготовки отчетности (таблица)'
		
	* Закрываем окна
		Тогда открылось окно '$WindowTitle$'
		И Я закрываю окно '$WindowTitle$'
				
				
							
			
	
				
