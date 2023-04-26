#language: ru

@ExportScenarios
@IgnoreOnCIMainBuild

Функционал: Экспортные сценарии для работы с подсистемой 'Budgeting'

Сценарий: Я для вида отчета 'TheReportKindName' изменяю флаг 'TheFlagName' 

	И Я открываю вид отчета с именем '[TheReportKindName]'

	И я изменяю флаг с именем '[TheFlagName]'
	И я нажимаю на кнопку с именем 'FormWriteAndClose'
	И я жду закрытия окна "[TheReportKindName] (Report types)" в течение 20 секунд	

	Тогда открылось окно "Report types and templates"
	И я закрываю окно "Report types and templates"

Сценарий: Я открываю контруктор отчета с именем 'TheReportKindName'

	И Я нахожу в списке вид отчета с именем '[TheReportKindName]'
	И в таблице 'ReportKindList' я нажимаю на кнопку с именем 'DoOpenDesigner'

Сценарий: Я в конструкторе отчета добавляю строку с именем 'TheLineName' 

	Когда открылось окно "Edit tree*"
	И из выпадающего списка с именем 'WorkMode' я выбираю точное значение "Report structure"
	И я нажимаю на кнопку с именем 'RowsTreeAddRows'
	Тогда открылось окно "Adding new lines"
	И в таблице 'NewLines' я нажимаю на кнопку с именем 'NewLinesAdd'
	И в таблице 'NewLines' в поле с именем 'NewLinesDescription' я ввожу текст '[TheLineName]'
	И в таблице 'NewLines' я завершаю редактирование строки
	И я нажимаю на кнопку с именем 'OK'

Сценарий: Я в конструкторе отчета добавляю колонку с именем 'TheColumnName' 

	Тогда открылось окно "Edit tree*"
	И из выпадающего списка с именем 'WorkMode' я выбираю точное значение "Report structure"
	И я нажимаю на кнопку с именем 'RowsTreeAddColumn'
	Тогда открылось окно "Adding new columns"
	И в таблице 'NewLines' я нажимаю на кнопку с именем 'NewLinesAdd'
	И в таблице 'NewLines' в поле с именем 'NewLinesDescription' я ввожу текст '[TheColumnName]'
	И в таблице 'NewLines' я завершаю редактирование строки
	И я нажимаю на кнопку с именем 'OK'

Сценарий: Я в конструкторе отчета добавляю аналитику с кодом 'TheDimensionCode' в ячейку 'TheCellAddress' 

	Тогда открылось окно "Edit tree*"
	И из выпадающего списка с именем 'WorkMode' я выбираю точное значение "Indicator dimensions"
	И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке '[TheCellAddress]'
	И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
	Тогда открылось окно "Dimension types (corporate)"
	И я нажимаю на кнопку с именем 'FormFind'
	Тогда открылась форма с именем 'UniversalListFindExtForm'
	И из выпадающего списка с именем 'FieldSelector' я выбираю точное значение "Code"
	И я меняю значение переключателя с именем 'CompareType' на "Exact match"
	И в поле с именем 'Pattern' я ввожу текст '[TheDimensionCode]'
	И я нажимаю на кнопку с именем 'Find'
	Тогда открылось окно "Dimension types (corporate)"
	И в таблице 'List' я выбираю текущую строку

Сценарий: Я в конструкторе отчета добавляю аналитику с наименованием 'TheDimensionName' в ячейку 'TheCellAddress' 

	Тогда открылось окно "Edit tree*"
	И из выпадающего списка с именем 'WorkMode' я выбираю точное значение "Indicator dimensions"
	И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке '[TheCellAddress]'
	И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
	Тогда открылось окно "Dimension types (corporate)"
	И я нажимаю на кнопку с именем 'FormFind'
	Тогда открылась форма с именем 'UniversalListFindExtForm'
	И из выпадающего списка с именем 'FieldSelector' я выбираю точное значение "Description"
	И я меняю значение переключателя с именем 'CompareType' на "Exact match"
	И в поле с именем 'Pattern' я ввожу текст '[TheDimensionCode]'
	И я нажимаю на кнопку с именем 'Find'
	Тогда открылось окно "Dimension types (corporate)"
	И в таблице 'List' я выбираю текущую строку	

Сценарий: Я в конструкторе отчета в ячейке 'TheCell' я меняю родителя у строки на 'TheParentName'

	Тогда открылось окно "Edit tree*"
	И из выпадающего списка с именем 'WorkMode' я выбираю точное значение "Report structure"
	И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке '[TheCell]'
	И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
	Тогда открылось окно "* (Report lines)"
	И из выпадающего списка с именем 'Parent' я выбираю по строке '[TheParentName]'
	И я нажимаю на кнопку с именем 'FormWriteAndClose'
	И я жду закрытия окна "* (Report lines) *" в течение 20 секунд

Сценарий: Я в конструкторе отчета в ячейке 'TheCell' я меняю свойство показателя 'TheProperty' на 'TheValue'

	Когда открылось окно "Edit tree*"
	И из выпадающего списка с именем 'WorkMode' я выбираю точное значение "Report structure"
	И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке '[TheCell]'
	И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
	Тогда открылось окно "* (Report indicators)"
	И Я для реквизита '[TheProperty]' устанавливаю значение '[TheValue]'										
	И я нажимаю на кнопку с именем 'FormWriteAndClose'
	И я жду закрытия окна "* (Report indicators)" в течение 20 секунд

Сценарий: Я в конструкторе отчета в ячейке 'TheCell' я меняю свойства показателей 'TheProperty' на 'TheValue'

	Когда открылось окно "Edit tree*"
	И из выпадающего списка с именем 'WorkMode' я выбираю точное значение "Report structure"
	И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке '[TheCell]'
	И я выбираю пункт контекстного меню с именем 'SpreadsheetFieldTemlateContextMenuProperties' на элементе формы с именем 'SpreadsheetFieldTemlate'
	Тогда открылось окно "Bulk edit indicators"
	И я изменяю флаг с именем '[TheProperty]Change'
	И Я для реквизита '[TheProperty]' устанавливаю значение '[TheValue]'
	И я нажимаю на кнопку с именем 'FormWriteAndClose'

Сценарий: Я октрываю сводную таблицу отчета с именем 'TheReportKindName'

	И Я нахожу в списке вид отчета с именем '[TheReportKindName]'

	Когда открылось окно "Report types and templates"
	И я запоминаю строку '[TheReportKindName]' в переменную 'ReportKindName'
	И в таблице 'List' я перехожу к строке по шаблону:
		| "Description"                       |
		| '$ReportKindName$ (pivot table)' |
	И я нажимаю на кнопку с именем 'SwitchToDataDisplayMode'
	И я жду открытия формы "Pivot table: *" в течение 30 секунд

	И Открылась сводная таблица для вида отчета 'TheReportKindName'	
		
Сценарий: Я устанавливаю отбор сводной таблицы 'TheFilterName' со значением 'TheFilterValue'

	Когда открылось окно "Pivot table: *"
	И я нажимаю на гиперссылку с именем 'FilterHeading'
	И я жду открытия формы "Pivot table: *" в течение 20 секунд
	Если элемент '[TheFilterName]' присутствует на форме Тогда
		И из выпадающего списка с именем '[TheFilterName]' я выбираю по строке '[TheFilterValue]'
		И я нажимаю на кнопку с именем 'UpdateTabData1'
	ИначеЕсли элемент 'Item_[TheFilterName]' присутствует на форме Тогда
		И из выпадающего списка с именем 'Item_[TheFilterName]' я выбираю по строке '[TheFilterValue]'
		И я нажимаю на кнопку с именем 'UpdateTabData1'	
	И я жду открытия формы "Pivot table: *" в течение 20 секунд

Сценарий: Я устанавливаю отборы сводной таблицы: дата начала 'TheStartDate', дата конца 'TheEndDate', валюта 'TheCurrency', сценарий 'TheScenario', организация 'TheBusinessUnit'	

	Когда открылось окно "Pivot table: *"
	И я нажимаю на гиперссылку с именем 'FilterHeading'
	И я нажимаю на кнопку с именем 'ChangePeriod'
	Тогда открылось окно "Select period"
	И в поле с именем 'DateBegin' я ввожу текст '[TheStartDate]'
	И я перехожу к следующему реквизиту
	И в поле с именем 'DateEnd' я ввожу текст '[TheEndDate]'
	И я нажимаю на кнопку с именем 'Select'
	Тогда открылось окно "Pivot table: *"
	И из выпадающего списка с именем 'DisplayCurrency' я выбираю по строке '[TheCurrency]'
	И из выпадающего списка с именем 'Item_Scenario' я выбираю по строке '[TheScenario]'
	И из выпадающего списка с именем 'Item_Organization' я выбираю по строке '[TheBusinessUnit]'
	И я нажимаю на кнопку с именем 'UpdateTabData1'
	И я жду открытия формы "Pivot table: *" в течение 20 секунд

Сценарий: Я Для вида отчета 'TheReportKindName' я создаю бланк для импорта по умолчанию

	* Откроем вид отчета
		Если текущее окно имеет заголовок "[TheReportKindName] (Report types)" Тогда
			// Форма уже открыта
		Иначе
			И Я открываю вид отчета с именем '[TheReportKindName]'

	* Создаем Бланк экземпляра отчета
		Тогда открылось окно "[TheReportKindName] (Report types)"
		И я перехожу к закладке с именем 'DefaultSettings'
		Когда открылось окно "[TheReportKindName] (Report types)"
		И я нажимаю на кнопку открытия поля с именем 'DefaultTemplateToImport'
		Тогда открылось окно "Template [TheReportKindName] report type: [TheReportKindName]"
		И я нажимаю на кнопку с именем 'FormWand'
		Тогда открылось окно "What to do?"
		И я нажимаю на кнопку с именем 'CreateNewTemplate1'
		И я нажимаю на кнопку с именем 'CommandRegenerateTemplate'
		Тогда открылось окно "Template [TheReportKindName] report type: [TheReportKindName] *"
		И я нажимаю на кнопку с именем 'FormWriteAndClose'
		И я жду закрытия окна "Template [TheReportKindName] report type: [TheReportKindName] *" в течение 5 секунд

Сценарий: Я Для вида отчета 'TheReportKindName' я создаю бланк по умолчанию

	* Откроем вид отчета
		Если текущее окно имеет заголовок "[TheReportKindName] (Report types)" Тогда
			// Форма уже открыта
		Иначе
			И Я открываю вид отчета с именем '[TheReportKindName]'
	
	* Формируем Бланк экземпляра отчета
		Когда открылось окно "[TheReportKindName] (Report types)"
		И я перехожу к закладке с именем 'DefaultSettings'
		И я нажимаю на кнопку открытия поля с именем 'DefaultTemplateToDisplayMultiperiod'
		Тогда открылось окно "Template [TheReportKindName] report type: [TheReportKindName]"
		И я нажимаю на кнопку с именем 'FormCreateImportTemplate'
		Тогда открылось окно "1C:Enterprise"
		И я нажимаю на кнопку с именем 'Button0'
		Тогда открылось окно "Report structure"
		Если поле с именем 'TemplateOfReportsTemplatesAppearance' существует тогда
			И из выпадающего списка с именем 'TemplateOfReportsTemplatesAppearance' я выбираю по строке "Classic"
		Если поле с именем 'DisplayBankingDetails' существует тогда
			И я изменяю флаг с именем 'DisplayBankingDetails'
		И я нажимаю на кнопку с именем 'FormSelect'	

	* Записываем бланк	
		Тогда открылось окно "Template [TheReportKindName] report type: [TheReportKindName] *"
		И я нажимаю на кнопку с именем 'FormButtonWriteAndClose'
		И я жду закрытия окна "Template [TheReportKindName] report type: [TheReportKindName] *" в течение 20 секунд		

Сценарий: Я Для вида отчета 'TheReportKindName' в бланке для группы раскрытия с адресом 'TheCellAddress' задаю сортировку 'TheSortingObject' 'TheSortingProperty'

	* Откроем вид отчета
		Если текущее окно имеет заголовок "[TheReportKindName] (Report types)" Тогда
			// Форма уже открыта
		Иначе
			И Я открываю вид отчета с именем '[TheReportKindName]'
	
	* Открываем бланк по умолчанию
		Когда открылось окно "[TheReportKindName] (Report types)"
		И я перехожу к закладке с именем 'DefaultSettings'
		И я нажимаю на кнопку открытия поля с именем 'DefaultTemplateToDisplayMultiperiod'
		Тогда открылось окно "Template [TheReportKindName] report type: [TheReportKindName]"

	* Добавляем сортировку
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке '[TheCellAddress]'
		И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
		Тогда открылось окно "Set up dimension drilldown area"
		И я перехожу к закладке с именем 'SectionSort'
		И в таблице 'SettingsComposerSettingsOrder' я выбираю текущую строку
		И в таблице 'SettingsComposerSettingsOrder' из выпадающего списка с именем 'SettingsComposerSettingsOrderField' я выбираю по строке '[TheSortingObject].[TheSortingProperty]'
		И в таблице 'SettingsComposerSettingsOrder' я завершаю редактирование строки
		И я нажимаю на кнопку с именем 'Apply'
				
	* Записываем бланк	
		Тогда открылось окно "Template [TheReportKindName] report type: [TheReportKindName] *"
		И я нажимаю на кнопку с именем 'FormButtonWriteAndClose'
		И я жду закрытия окна "Template [TheReportKindName] report type: [TheReportKindName] *" в течение 20 секунд

Сценарий: Я Для вида отчета 'TheReportKindName' в бланке для группы раскрытия с адресом 'TheCellAddress' меняю сортировку 'TheSortingIinitialObject' 'TheSortingIinitialProperty' на сортировку 'TheSortingObject' 'TheSortingProperty'

	* Откроем вид отчета
		Если текущее окно имеет заголовок "[TheReportKindName] (Report types)" Тогда
			// Форма уже открыта
		Иначе
			И Я открываю вид отчета с именем '[TheReportKindName]'
	
	* Открываем бланк по умолчанию
		Когда открылось окно "[TheReportKindName] (Report types)"
		И я перехожу к закладке с именем 'DefaultSettings'
		И я нажимаю на кнопку открытия поля с именем 'DefaultTemplateToDisplayMultiperiod'
		Тогда открылось окно "Template [TheReportKindName] report type: [TheReportKindName]"

	* Меняем сортировку
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке '[TheCellAddress]'
		И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
		Тогда открылось окно "Set up dimension drilldown area"
		И я перехожу к закладке с именем 'SectionSort'
		И Я запоминаю в переменную 'SortingIinitial' значение '[TheSortingIinitialObject].[TheSortingIinitialProperty]'
		И в таблице 'SettingsComposerSettingsOrder' я перехожу к строке:
			| "Field"              |
			| '$SortingIinitial$' |
		И в таблице 'SettingsComposerSettingsOrder' из выпадающего списка с именем 'SettingsComposerSettingsOrderField' я выбираю точное значение '[TheSortingObject].[TheSortingProperty]'
		И в таблице 'SettingsComposerSettingsOrder' я завершаю редактирование строки
		И я нажимаю на кнопку с именем 'Apply'
				
	* Записываем бланк	
		Тогда открылось окно "Template [TheReportKindName] report type: [TheReportKindName] *"
		И я нажимаю на кнопку с именем 'FormButtonWriteAndClose'
		И я жду закрытия окна "Template [TheReportKindName] report type: [TheReportKindName] *" в течение 20 секунд		

Сценарий: Я Для вида отчета 'TheReportKindName' я создаю бланк сводной таблицы по умолчанию с отборами 'TheFilter1' 'TheFilter2' 'TheFilter3'

	* Откроем Бланк сводной таблиц
		И Я Для вида отчета '[TheReportKindName]' открываю бланк сводной таблицы по умолчанию
		И я нажимаю на кнопку с именем 'ShowListOfRows'
		Тогда открылось окно "Set up line list"
		И я нажимаю на кнопку с именем 'MoveLeftAll'
		И я нажимаю на кнопку с именем 'ApplyTheChanges'
		Тогда открылось окно '$WindowTitle$ *'
		И я нажимаю на кнопку с именем 'ShowListOfColumns'
		Тогда открылось окно "Set up column list"
		И в таблице 'PivotTableColumnsListSettings' я нажимаю на кнопку с именем 'PivotTableColumnsListSettingsPopulateColumns'
		И я нажимаю на кнопку с именем 'FormApply'
		Тогда открылось окно '$WindowTitle$ *'
		И я нажимаю на кнопку с именем 'ShowTableSettingsByAxes'
		Тогда открылось окно "Set up field location"
		И я запоминаю строку '[TheFilter1]' в переменную 'FieldName'
		Если в таблице 'TableAvailableFields' есть строка Тогда
			| "Available dimensions" |
			| '$FieldName$'           |
			И в таблице 'TableAvailableFields' я перехожу к строке:
				| "Available dimensions" |
				| '$FieldName$'           |
			И я выбираю пункт контекстного меню с именем 'TableAvailableFieldsContextMenuMoveToFilters' на элементе формы с именем 'TableAvailableFields'
		И я запоминаю строку '[TheFilter2]' в переменную 'FieldName'	
		Если в таблице 'TableAvailableFields' есть строка Тогда
			| "Available dimensions" |
			| '$FieldName$'           |
			И в таблице 'TableAvailableFields' я перехожу к строке:
				| "Available dimensions" |
				| '$FieldName$'           |
			И я выбираю пункт контекстного меню с именем 'TableAvailableFieldsContextMenuMoveToFilters' на элементе формы с именем 'TableAvailableFields'
		И я запоминаю строку '[TheFilter3]' в переменную 'FieldName'	
		Если в таблице 'TableAvailableFields' есть строка Тогда
			| "Available dimensions" |
			| '$FieldName$'           |
			И в таблице 'TableAvailableFields' я перехожу к строке:
				| "Available dimensions" |
				| '$FieldName$'           |
			И я выбираю пункт контекстного меню с именем 'TableAvailableFieldsContextMenuMoveToFilters' на элементе формы с именем 'TableAvailableFields'		
		И Пока в таблице 'TableAvailableFields' количество строк 'больше' 0 Тогда
			И я выбираю пункт контекстного меню с именем 'TableAvailableFieldsContextMenuMoveToRows' на элементе формы с именем 'TableAvailableFields'
		И я запоминаю строку "Project" в переменную 'FieldName'
		Если '"[TheFilter1]" <> "$FieldName$" AND "[TheFilter2]" <> "$FieldName$" AND "[TheFilter3]" <> "$FieldName$"' Тогда
			Когда открылось окно "Set up field location"
			И в таблице 'TableRows1' я перехожу к строке:
				| "Horizontally (in rows)" |
				| "Project"                     |
			И я выбираю пункт контекстного меню с именем 'TableRows1ContextMenuMoveToAvailableFields' на элементе формы с именем 'TableRows1'
			
		И я нажимаю на кнопку с именем 'RowsMoveUp'
		И я нажимаю на кнопку с именем 'RowsMoveDown'
		И я нажимаю на кнопку с именем 'DimensionsLayoutOption'
		И в меню формы я выбираю "Hierarchical dimensions"
		И я устанавливаю флаг с именем 'TotalByColumns'
		И в таблице 'ColumnsTable' я перехожу к строке:
			| "Vertically (in columns)" |
			| "Report columns"           |
		И я нажимаю на кнопку с именем 'ColumnsMoveUp'
		И я нажимаю на кнопку с именем 'ColumnsMoveDown'
		И я нажимаю на кнопку с именем 'ButtonApply'
		
		Тогда открылось окно '$WindowTitle$ *'		
		И я нажимаю на кнопку с именем 'ShowPeriodsSettings'
		И я нажимаю на кнопку с именем 'FormApply'

	* Сохраняем
		Тогда открылось окно '$WindowTitle$ *'
		И я нажимаю на кнопку с именем 'FormWriteAndClose'
		И я жду закрытия окна '$WindowTitle$ *' в течение 20 секунд

Сценарий: Я для регламента 'TheRegulationName' изменяю флаг 'TheFlagName'

	И В командном интерфейсе я выбираю "Budgeting, reporting, and analysis" "Regulations for preparing reports"
	Тогда открылось окно "Regulations for preparing reports"
	И я нажимаю на кнопку с именем 'FormFind'
	Тогда открылось окно "Find"
	И из выпадающего списка с именем 'FieldSelector' я выбираю точное значение "Description"
	И в поле с именем 'Pattern' я ввожу текст '[TheRegulationName]'
	И я меняю значение переключателя с именем 'CompareType' на "Exact match"
	И я нажимаю на кнопку с именем 'Find'
	Тогда открылось окно "Regulations for preparing reports"
	И в таблице 'List' я выбираю текущую строку
	Тогда Открылся регламент подготовки отчетности 'TheRegulationName'
	И я перехожу к закладке с именем 'GroupMainPage'
	И я изменяю флаг с именем '[TheFlagName]'
	И я нажимаю на кнопку с именем 'FormWriteAndClose'
	И я жду закрытия окна '$WindowTitle$' в течение 20 секунд

Сценарий: Я вставляю из буфера обмена в макете

	И я очищаю окно сообщений пользователю		
	И я делаю 3 раз
		И я нажимаю на кнопку с именем 'InsertTemplateFromClipboard'
		Если в текущем окне есть сообщения пользователю Тогда
			И Пауза 3
		Иначе
			И я прерываю цикл

Сценарий: Я ввожу значение 'TheValue' в ячейку 'TheCellAddress'

	И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке '[TheCellAddress]'
	И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
	И в табличный документ 'SpreadsheetFieldTemlate' я ввожу текст '[TheValue]'

Сценарий: Я ввожу значение 'TheValue' с раскрытием показателей в ячейку 'TheCellAddress'

	И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке '[TheCellAddress]'
	И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке

	Тогда открылось окно "Drill down indicators: *"
	И в таблице 'IndicatorsDrilldown' я выбираю текущую строку
	И в таблице 'IndicatorsDrilldown' в поле с именем 'Value1' я ввожу текст '[TheValue]'
	И я нажимаю на кнопку с именем 'FormOKButton1'

	И я жду закрытия окна "Drill down indicators: *" в течение 20 секунд	

Сценарий: Я изменяю значение на 'TheValue' процентов в ячейке 'TheCellAddress'

	И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке '[TheCellAddress]'
	И я нажимаю на кнопку с именем 'ChangeIndicators'
	Тогда открылось окно "Change values"
	И я меняю значение переключателя с именем 'AdjustmentKind' на "Percentage"
	И в поле с именем 'ValueAdjustments' я ввожу текст '[TheValue]'
	И я нажимаю на кнопку с именем 'Apply'

Сценарий: Я изменяю значение на 'TheValue' в ячейке 'TheCellAddress'

	И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке '[TheCellAddress]'
	И я нажимаю на кнопку с именем 'ChangeIndicators'
	Тогда открылось окно "Change values"
	И я меняю значение переключателя с именем 'AdjustmentKind' на "Value"
	И в поле с именем 'ValueAdjustments' я ввожу текст '[TheValue]'
	И я нажимаю на кнопку с именем 'Apply'

Сценарий: Я добавляю значения с раскрытием показателей в ячейку 'TheCellAddress'

	И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке '[TheCellAddress]'
	И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
	
	Тогда открылось окно "Drill down indicators: *"
	Если элемент 'IndicatorsDrilldownPeriodsInColumns' доступен для редактирования Тогда
		И в таблице 'IndicatorsDrilldown' я нажимаю на кнопку с именем 'IndicatorsDrilldownPeriodsInColumns'

	И я заполняю таблицу 'IndicatorsDrilldown' данными
		| 'Table' |

	И я нажимаю на кнопку с именем 'FormOKButton1'
	И я жду закрытия окна "Drill down indicators: *" в течение 20 секунд

Сценарий: Я создаю экземпляр отчета для вида отчета 'TheReportKind' сценарий 'TheScenario' период 'TheStartDate' 'TheEndDate' периодичность 'TheFrequency' организация 'TheBusinessUnit' проект 'TheProject' аналитики 'TheDimension1' 'TheDimension2' 'TheDimension3' 'TheDimension4' 'TheDimension5' 'TheDimension6' 

	* Откроем форму ключевых реквизитов
		Если текущее окно имеет заголовок "Specify document key attributes" Тогда
			// Форма уже открыта
		Иначе
			И В командном интерфейсе я выбираю "Budgeting, reporting, and analysis" "Report instances"
			Тогда открылось окно "Report instances"
			И я нажимаю на кнопку с именем 'FormCreate'

	* Заполняем ключевые реквизиты
		Тогда открылось окно "Specify document key attributes"
		И из выпадающего списка с именем 'ReportKind' я выбираю по строке '[TheReportKind]'				
		И из выпадающего списка с именем 'Scenario' я выбираю по строке '[TheScenario]'
		И из выпадающего списка с именем 'Periodicity' я выбираю точное значение '[TheFrequency]'
		И я нажимаю на кнопку с именем 'ChangePeriod'
		Тогда открылось окно "Select period"
		И в поле с именем 'DateBegin' я ввожу текст '[TheStartDate]'
		И в поле с именем 'DateEnd' я ввожу текст '[TheEndDate]'
		И я нажимаю на кнопку с именем 'Select'
		Тогда открылось окно "Specify document key attributes"
		И я нажимаю кнопку выбора у поля с именем 'Organization'
		Когда открылось окно "Business unit*"
		И я выбираю пункт контекстного меню с именем 'ListContextMenuFind' на элементе формы с именем 'List'
		Тогда открылась форма с именем 'UniversalListFindExtForm'
		Если '$$IsCPM$$' Тогда
			И из выпадающего списка с именем 'FieldSelector' я выбираю точное значение "Name in the application"
		Если '$$IsERPCPM$$' Тогда
			И из выпадающего списка с именем 'FieldSelector' я выбираю точное значение "Рабочее наименование"				
		И в поле с именем 'Pattern' я ввожу текст '[TheBusinessUnit]'
		И я меняю значение переключателя с именем 'CompareType' на "Exact match"
		И я нажимаю на кнопку с именем 'Find'
		Тогда открылось окно "Business unit*"
		И в таблице 'List' я выбираю текущую строку
		Тогда открылось окно "Specify document key attributes"
		Если 'NOT IsBlankString("[TheProject]")' Тогда
			И из выпадающего списка с именем 'Project' я выбираю по строке '[TheProject]'
		Если 'NOT IsBlankString("[TheDimension1]")' Тогда
			И из выпадающего списка с именем 'ReportDimension1' я выбираю по строке '[TheDimension1]'
		Если 'NOT IsBlankString("[TheDimension2]")' Тогда
			И из выпадающего списка с именем 'ReportDimension2' я выбираю по строке '[TheDimension2]'
		Если 'NOT IsBlankString("[TheDimension3]")' Тогда
			И из выпадающего списка с именем 'ReportDimension3' я выбираю по строке '[TheDimension3]'
		Если 'NOT IsBlankString("[TheDimension4]")' Тогда
			И из выпадающего списка с именем 'ReportDimension4' я выбираю по строке '[TheDimension4]'
		Если 'NOT IsBlankString("[TheDimension5]")' Тогда
			И из выпадающего списка с именем 'ReportDimension1' я выбираю по строке '[TheDimension5]'
		Если 'NOT IsBlankString("[TheDimension6]")' Тогда
			И из выпадающего списка с именем 'ReportDimension1' я выбираю по строке '[TheDimension6]'
		Когда открылось окно "Specify document key attributes"
		И я нажимаю на кнопку с именем 'OKButton'
		
		И Открылся экземпляр отчета для вида отчета '[TheReportKind]' валюта '*' организация '[TheBusinessUnit]' сценарий '[TheScenario]' периодичность '[TheFrequency]' проект '[TheProject]' аналитики '[TheDimension1]' '[TheDimension2]' '[TheDimension3]' '[TheDimension4]' '[TheDimension5]' '[TheDimension6]' 	

Сценарий: Я открываю первый экземпляр отчета для вида отчета 'TheReportKind'

	И Я нахожу в списке вид отчета с именем '[TheReportKind]'
	И в таблице 'ReportKindList' я нажимаю на кнопку с именем 'ReportKindListOpenInstancesList'
	Тогда открылось окно "Report instances"
	И в таблице 'List' я выбираю текущую строку

Сценарий: Я создаю документ управления периодом со сценарием 'TheScenario' регламентом 'TheRegulation' периодичностью 'TheFrequency' датой начала 'TheDateBegin' датой окончания 'TheDateEnd'

	И В командном интерфейсе я выбираю "Budgeting, reporting, and analysis" "Reporting period management"
	Тогда открылось окно "Reporting period management"
	И я нажимаю на кнопку с именем 'FormCreate'
	Тогда открылось окно "Reporting period management (create)"
	И из выпадающего списка с именем 'Scenario' я выбираю по строке '[TheScenario]'
	И из выпадающего списка с именем 'ScenarioFrequency' я выбираю точное значение '[TheFrequency]'
	И я нажимаю на кнопку с именем 'ChangePeriod'
	Тогда открылось окно "Select period"
	И в поле с именем 'DateBegin' я ввожу текст '[TheDateBegin]'
	И я перехожу к следующему реквизиту
	И в поле с именем 'DateEnd' я ввожу текст '[TheDateEnd]'
	И я нажимаю на кнопку с именем 'Select'
	Тогда открылось окно "Reporting period management (create) *"
	И из выпадающего списка с именем 'OrganizationalStructureVersion' я выбираю по строке '[TheRegulation]'
	И я нажимаю на кнопку с именем 'FormGoForward'
	Тогда открылось окно "1C:Enterprise"
	И я нажимаю на кнопку с именем 'Button0'
	И я запоминаю заголовок формы в переменную 'FormCaption'
	Тогда открылось окно '$FormCaption$'
	И в таблице 'RatesEditTable' я нажимаю на кнопку с именем 'RatesEditTableRatesTable_Update'
	И я нажимаю на кнопку с именем 'FormGoForward'
	Тогда открылось окно "1C:Enterprise"
	И я нажимаю на кнопку с именем 'Button0'		
	Когда открылось окно '$FormCaption$'
	И я нажимаю на кнопку с именем 'FormGoForward'
	Тогда открылось окно '$FormCaption$'
	И я нажимаю на кнопку с именем 'FormClose'

Сценарий: Я в сводной таблице перемещаю аналитику с именем 'TheDimensionName' вверх

	Тогда открылось окно "Set up field location"
	И Я запоминаю значение выражения '[TheDimensionName]' в переменную "DimensionName"
	
	И в таблице 'TableRows1' я перехожу к строке:
		| "Horizontally (in rows)" |
		| '$DimensionName$'      |
	
	И я нажимаю на кнопку с именем 'RowsMoveUp'
	И я нажимаю на кнопку с именем 'RowsMoveUp'
	И я нажимаю на кнопку с именем 'RowsMoveUp'
	И я нажимаю на кнопку с именем 'RowsMoveUp'
	И я нажимаю на кнопку с именем 'RowsMoveUp'
	И я нажимаю на кнопку с именем 'RowsMoveUp'
