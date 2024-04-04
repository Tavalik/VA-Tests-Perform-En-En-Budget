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

Сценарий: Я Для вида отчета 'TheReportKindName' создаю бланк по умолчанию

	* Откроем вид отчета
		Если текущее окно имеет заголовок "[TheReportKindName] (Report types)" Тогда
			// Форма уже открыта
		Иначе
			И Я открываю вид отчета с именем '[TheReportKindName]'
	
	* Формируем Бланк экземпляра отчета
		Когда открылось окно "[TheReportKindName] (Report types)"
		И я перехожу к закладке с именем 'DefaultSettings'
		И я нажимаю на кнопку открытия поля с именем 'DefaultTemplateToDisplay'
		Тогда открылось окно "Template [TheReportKindName] report type: [TheReportKindName]"
		И я нажимаю на кнопку с именем 'CreateTemplateWithDesigner'
		Если открылось окно "1C:Enterprise" Тогда
			И я нажимаю на кнопку с именем 'Button0'		
		Тогда открылось окно "Report structure"
		И из выпадающего списка с именем 'TemplateOfReportsTemplatesAppearance' я выбираю по строке 'Classic'
		И я изменяю флаг с именем 'DisplayBankingDetails'
		И я нажимаю на кнопку с именем 'FormSelect'	

	* Записываем бланк	
		Тогда открылось окно "Template [TheReportKindName] report type: [TheReportKindName] *"
		И я нажимаю на кнопку с именем 'FormButtonWriteAndClose'
		И я жду закрытия окна "Template [TheReportKindName] report type: [TheReportKindName] *" в течение 20 секунд		

Сценарий: Я Для вида отчета 'TheReportKindName' в бланке для группы раскрытия с адресом 'TheCell' задаю сортировку 'TheSortingObject' 'TheSortingProperty'

	* Откроем вид отчета
		Если текущее окно имеет заголовок "[TheReportKindName] (Report types)" Тогда
			// Форма уже открыта
		Иначе
			И Я открываю вид отчета с именем '[TheReportKindName]'
	
	* Открываем бланк по умолчанию
		Когда открылось окно "[TheReportKindName] (Report types)"
		И я перехожу к закладке с именем 'DefaultSettings'
		И я нажимаю на кнопку открытия поля с именем 'DefaultTemplateToDisplay'
		Тогда открылось окно "Template [TheReportKindName] report type: [TheReportKindName]"

	* Добавляем сортировку
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке '[TheCell]'
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

Сценарий: Я Для вида отчета 'TheReportKindName' в бланке для группы раскрытия с адресом 'TheCell' меняю сортировку 'TheSortingIinitialObject' 'TheSortingIinitialProperty' на сортировку 'TheSortingObject' 'TheSortingProperty'

	* Откроем вид отчета
		Если текущее окно имеет заголовок "[TheReportKindName] (Report types)" Тогда
			// Форма уже открыта
		Иначе
			И Я открываю вид отчета с именем '[TheReportKindName]'
	
	* Открываем бланк по умолчанию
		Когда открылось окно "[TheReportKindName] (Report types)"
		И я перехожу к закладке с именем 'DefaultSettings'
		И я нажимаю на кнопку открытия поля с именем 'DefaultTemplateToDisplay'
		Тогда открылось окно "Template [TheReportKindName] report type: [TheReportKindName]"

	* Меняем сортировку
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке '[TheCell]'
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

Сценарий: Я Для вида отчета 'TheReportKindName' создаю бланк для импорта по умолчанию

	* Откроем вид отчета
		Если текущее окно имеет заголовок "[TheReportKindName] (Report types)" Тогда
			// Форма уже открыта
		Иначе
			И Я открываю вид отчета с именем '[TheReportKindName]'

	* Открываем бланк
		Тогда открылось окно "[TheReportKindName] (Report types)"
		И я перехожу к закладке с именем 'DefaultSettings'
		Когда открылось окно "[TheReportKindName] (Report types)"
		И я нажимаю на кнопку открытия поля с именем 'DefaultTemplateToImport'

	* Генерируем бланк
		Тогда Открылся бланк для вида отчета '[TheReportKindName]'
		И я нажимаю на кнопку с именем 'ShowIndicatorsPanel'
		И из выпадающего списка с именем 'TemplateToDisplay' я выбираю точное значение "To import and display"
		Тогда открылось окно "1C:Enterprise"
		И я нажимаю на кнопку с именем 'Button0'
		Тогда открылось окно "Report structure"
		И из выпадающего списка с именем 'TemplateOfReportsTemplatesAppearance' я выбираю по строке "Classic"
		И я снимаю флаг с именем 'DisplayBankingDetails'
		И я нажимаю на кнопку с именем 'FormSelect'

	* Записываем бланк
		Тогда открылось окно '$WindowTitle$'
		И я нажимаю на кнопку с именем 'RecordButtonForm'

Сценарий: Я Для вида отчета 'TheReportKindName' создаю бланк сводной таблицы по умолчанию с отборами 'TheFilter1' 'TheFilter2' 'TheFilter3'

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
	И я нажимаю на кнопку с именем 'select'
	Тогда открылось окно "Pivot table: *"
	И из выпадающего списка с именем 'DisplayCurrency' я выбираю по строке '[TheCurrency]'
	И из выпадающего списка с именем 'Item_Scenario' я выбираю по строке '[TheScenario]'
	И из выпадающего списка с именем 'Item_Organization' я выбираю по строке '[TheBusinessUnit]'
	И я нажимаю на кнопку с именем 'UpdateTabData1'
	И я жду открытия формы "Pivot table: *" в течение 20 секунд

Сценарий: Я открываю контруктор отчета с именем 'TheReportKindName'

	И Я нахожу в списке вид отчета с именем '[TheReportKindName]'
	И в таблице 'ReportKindList' я нажимаю на кнопку с именем 'DoOpenDesigner'

Сценарий: Я в конструкторе отчета добавляю строку с именем 'TheLineName' 

	Когда открылось окно "Report wizard*"
	И из выпадающего списка с именем 'WorkMode' я выбираю точное значение "Report structure"
	И я нажимаю на кнопку с именем 'RowsTreeAddRows'
	Тогда открылось окно "Adding new lines"
	И в таблице 'NewLines' я нажимаю на кнопку с именем 'NewLinesAdd'
	И в таблице 'NewLines' в поле с именем 'NewLinesDescription' я ввожу текст '[TheLineName]'
	И в таблице 'NewLines' я завершаю редактирование строки
	И я нажимаю на кнопку с именем 'OK'

Сценарий: Я в конструкторе отчета добавляю строки 

	Когда открылось окно "Report wizard*"
	И из выпадающего списка с именем 'WorkMode' я выбираю точное значение "Report structure"
	И я нажимаю на кнопку с именем 'RowsTreeAddRows'
	Тогда открылось окно "Adding new lines"

	И я заполняю таблицу 'NewLines' данными
		| 'Table' |

	И я нажимаю на кнопку с именем 'OK'

Сценарий: Я в конструкторе отчета добавляю колонку с именем 'TheColumnName' 

	Тогда открылось окно "Report wizard*"
	И из выпадающего списка с именем 'WorkMode' я выбираю точное значение "Report structure"
	И я нажимаю на кнопку с именем 'RowsTreeAddColumn'
	Тогда открылось окно "Adding new columns"
	И в таблице 'NewLines' я нажимаю на кнопку с именем 'NewLinesAdd'
	И в таблице 'NewLines' в поле с именем 'NewLinesDescription' я ввожу текст '[TheColumnName]'
	И в таблице 'NewLines' я завершаю редактирование строки
	И я нажимаю на кнопку с именем 'OK'

Сценарий: Я в конструкторе отчета добавляю колонки 

	Тогда открылось окно "Report wizard*"
	И из выпадающего списка с именем 'WorkMode' я выбираю точное значение "Report structure"
	И я нажимаю на кнопку с именем 'RowsTreeAddColumn'
	Тогда открылось окно "Adding new columns"

	И я заполняю таблицу 'NewLines' данными
		| 'Table' |

	И я нажимаю на кнопку с именем 'OK'

Сценарий: Я в конструкторе отчета добавляю аналитику с кодом 'TheDimensionCode' в ячейку 'TheCell' 

	Тогда открылось окно "Report wizard*"
	И из выпадающего списка с именем 'WorkMode' я выбираю точное значение "Indicator dimensions"
	И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке '[TheCell]'
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

Сценарий: Я в конструкторе отчета добавляю аналитику с наименованием 'TheDimensionName' в ячейку 'TheCell' 

	Тогда открылось окно "Report wizard*"
	И из выпадающего списка с именем 'WorkMode' я выбираю точное значение "Indicator dimensions"
	И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке '[TheCell]'
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

Сценарий: Я в конструкторе отчета в ячейке 'TheCell' меняю аналитику валюта 

	Тогда открылось окно "Report wizard*"
	И из выпадающего списка с именем 'WorkMode' я выбираю точное значение "Indicator dimensions"
	И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке '[TheCell]'
	И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
	Тогда открылось окно "Report wizard*"

Сценарий: Я в конструкторе отчета в ячейке 'TheCell' меняю родителя у строки на 'TheParentName'

	Тогда открылось окно "Report wizard*"
	И из выпадающего списка с именем 'WorkMode' я выбираю точное значение "Report structure"
	И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке '[TheCell]'
	И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
	Тогда открылось окно "* (Report lines)"
	И из выпадающего списка с именем 'Parent' я выбираю по строке '[TheParentName]'
	И я нажимаю на кнопку с именем 'FormWriteAndClose'
	И я жду закрытия окна "* (Report lines) *" в течение 20 секунд

Сценарий: Я в конструкторе отчета в ячейке 'TheCell' меняю свойство показателя 'TheProperty' на 'TheValue'

	Когда открылось окно "Report wizard*"
	И из выпадающего списка с именем 'WorkMode' я выбираю точное значение "Report structure"
	И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке '[TheCell]'
	И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
	Тогда открылось окно "* (Report indicators)"
	И Я для реквизита '[TheProperty]' устанавливаю значение '[TheValue]'										
	И я нажимаю на кнопку с именем 'FormWriteAndClose'
	И я жду закрытия окна "* (Report indicators)" в течение 20 секунд

Сценарий: Я в конструкторе отчета в ячейке 'TheCell' меняю свойства показателей 'TheProperty' на 'TheValue'

	Когда открылось окно "Report wizard*"
	И из выпадающего списка с именем 'WorkMode' я выбираю точное значение "Report structure"
	И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке '[TheCell]'
	И я выбираю пункт контекстного меню с именем 'SpreadsheetFieldTemlateContextMenuProperties' на элементе формы с именем 'SpreadsheetFieldTemlate'
	Тогда открылось окно "Bulk edit indicators"
	И я изменяю флаг с именем '[TheProperty]Change'
	И Я для реквизита '[TheProperty]' устанавливаю значение '[TheValue]'
	И я нажимаю на кнопку с именем 'FormWriteAndClose'

Сценарий: Я в конструкторе отчета в ячейке 'TheCell' проверяю свойство показателя 'TheProperty' на 'TheValue'

	Когда открылось окно "Report wizard*"	
	И из выпадающего списка с именем 'WorkMode' я выбираю точное значение "Report structure"		
	И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке '[TheCell]'
	И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
	Когда открылось окно "* (Report indicators)"
	И элемент формы с именем '[TheProperty]' стал равен '[TheValue]'	
	И Я закрываю окно "* (Report indicators)"

Сценарий: Я в конструкторе отчета для ячейки 'TheCell' настраиваю связь с показателем с кодом 'TheIndicatorCode' вида отчета 'TheReportKindName'

	Когда открылось окно "Report wizard*"
	И из выпадающего списка с именем 'WorkMode' я выбираю точное значение "Indicators calculation formulas"
	И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке '[TheCell]'
	И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке	
	И я нажимаю на кнопку с именем 'RefToIndicator1'
	И Я выбираю показатель с кодом '[TheIndicatorCode]' вида отчета '[TheReportKindName]'
	Тогда открылось окно "Report wizard *"
	И я нажимаю на кнопку с именем 'WriteAndCollapse'

Сценарий: Я в конструкторе отчета для ячейки 'TheCell' задаю формулу 'TheFormula'

	Когда открылось окно "Report wizard*"
	И из выпадающего списка с именем 'WorkMode' я выбираю точное значение "Indicators calculation formulas"

	И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке '[TheCell]'
	И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
	И в поле с именем 'TextDocumentFieldProcedure' я ввожу текст '[TheFormula]'
	
	И я нажимаю на кнопку с именем 'WriteAndCollapse'	

Сценарий: Я в конструкторе отчета для ячейки 'TheCell' задаю формулу копирования ячейки 'TheCell1'

	Когда открылось окно "Report wizard*"
	И из выпадающего списка с именем 'WorkMode' я выбираю точное значение "Indicators calculation formulas"

	И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке '[TheCell]'
	И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке

	И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке '[TheCell1]'
	И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
	
	И я нажимаю на кнопку с именем 'WriteAndCollapse'	

Сценарий: Я в конструкторе отчета для ячейки 'TheCell' задаю формулу суммирования ячейки 'TheCell1'

	Когда открылось окно "Report wizard*"
	И из выпадающего списка с именем 'WorkMode' я выбираю точное значение "Indicators calculation formulas"

	И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке '[TheCell]'
	И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке

	И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке '[TheCell1]'
	И я нажимаю на кнопку с именем 'ButtonSum'
	
	И я нажимаю на кнопку с именем 'WriteAndCollapse'

Сценарий: Я в конструкторе отчета для ячейки 'TheCell' задаю формулу сумма ячеек 'TheCell1' 'TheCell2' 'TheCell3' 'TheCell4' 'TheCell5'

	Когда открылось окно "Report wizard*"
	И из выпадающего списка с именем 'WorkMode' я выбираю точное значение "Indicators calculation formulas"

	И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке '[TheCell]'
	И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке

	И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке '[TheCell1]'
	И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
	И я нажимаю на кнопку с именем 'ButtonPlus'
	И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке '[TheCell2]'
	И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке

	Если 'NOT StrStartsWith("[TheCell3]", "[") AND NOT IsBlankString("[TheCell3]")' Тогда
		И я нажимаю на кнопку с именем 'ButtonPlus'
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке '[TheCell3]'
		И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке

	Если 'NOT StrStartsWith("[TheCell4]", "[") AND NOT IsBlankString("[TheCell3]")' Тогда
		И я нажимаю на кнопку с именем 'ButtonPlus'
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке '[TheCell4]'
		И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке	

	Если 'NOT StrStartsWith("[TheCell5]", "[") AND NOT IsBlankString("[TheCell3]")' Тогда
		И я нажимаю на кнопку с именем 'ButtonPlus'
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке '[TheCell5]'
		И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке	
	
	И я нажимаю на кнопку с именем 'WriteAndCollapse'	

Сценарий: Я в конструкторе отчета для ячейки 'TheCell' задаю формулу произведение ячеек 'TheCell1' 'TheCell2' 'TheCell3' 'TheCell4' 'TheCell5'

	Когда открылось окно "Report wizard*"
	И из выпадающего списка с именем 'WorkMode' я выбираю точное значение "Indicators calculation formulas"
	
	И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке '[TheCell]'
	И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке

	И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке '[TheCell1]'
	И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
	И я нажимаю на кнопку с именем 'ButtonMultiply'
	И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке '[TheCell2]'
	И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке

	Если 'NOT StrStartsWith("[TheCell3]", "[") AND NOT IsBlankString("[TheCell3]")' Тогда
		И я нажимаю на кнопку с именем 'ButtonMultiply'
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке '[TheCell3]'
		И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке

	Если 'NOT StrStartsWith("[TheCell4]", "[") AND NOT IsBlankString("[TheCell3]")' Тогда
		И я нажимаю на кнопку с именем 'ButtonMultiply'
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке '[TheCell4]'
		И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке	

	Если 'NOT StrStartsWith("[TheCell5]", "[") AND NOT IsBlankString("[TheCell3]")' Тогда
		И я нажимаю на кнопку с именем 'ButtonMultiply'
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке '[TheCell5]'
		И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке	
	
	И я нажимаю на кнопку с именем 'WriteAndCollapse'

Сценарий: Я вставляю из буфера обмена в макете

	И я очищаю окно сообщений пользователю		
	И я делаю 3 раз
		И я нажимаю на кнопку с именем 'InsertTemplateFromClipboard'
		Если в текущем окне есть сообщения пользователю Тогда
			И Пауза 3
		Иначе
			И я прерываю цикл

Сценарий: Я ввожу значение 'TheValue' в ячейку 'TheCell'

	И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке '[TheCell]'
	И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
	И в табличный документ 'SpreadsheetFieldTemlate' я ввожу текст '[TheValue]'

Сценарий: Я ввожу значение 'TheValue' с раскрытием показателей в ячейку 'TheCell'

	И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке '[TheCell]'
	И я нажимаю на кнопку с именем 'DisplayADrilldown'

	Тогда открылось окно "Drill down indicators: *"
	И в таблице 'IndicatorsDrilldown' я выбираю текущую строку
	И в таблице 'IndicatorsDrilldown' в поле с именем 'Value1' я ввожу текст '[TheValue]'
	И я нажимаю на кнопку с именем 'FormOKButton1'

	И я жду закрытия окна "Drill down indicators: *" в течение 20 секунд	

Сценарий: Я добавляю значения с раскрытием показателей в ячейку 'TheCell'

	И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке '[TheCell]'
	И я нажимаю на кнопку с именем 'DisplayADrilldown'
	
	Тогда открылось окно "Drill down indicators: *"
	Если элемент 'IndicatorsDrilldownPeriodsInColumns' доступен для редактирования Тогда
		Если у элемента формы с именем 'IndicatorsDrilldownPeriodsInColumns' не установлена пометка Тогда
			И в таблице 'IndicatorsDrilldown' я нажимаю на кнопку с именем 'IndicatorsDrilldownPeriodsInColumns'

	И я заполняю таблицу 'IndicatorsDrilldown' данными
		| 'Table' |

	И я нажимаю на кнопку с именем 'FormOKButton1'
	И я жду закрытия окна "Drill down indicators: *" в течение 20 секунд

Сценарий: Я ввожу комментарий 'TheComment' в ячейку 'TheCell'

	И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке '[TheCell]'
	И я нажимаю на кнопку с именем 'LeaveCommentToIndicator'

	Тогда открылось окно "Comments"
	И в поле с именем 'NewComment' я ввожу текст '[TheComment]'

	И я нажимаю на кнопку с именем 'WriteComment'

Сценарий: Я изменяю значение на 'TheValue' процентов в ячейке 'TheCell'

	И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке '[TheCell]'
	И я нажимаю на кнопку с именем 'ChangeIndicators'

	Тогда открылось окно "Change values"
	И я меняю значение переключателя с именем 'AdjustmentKind' на "Percentage"
	И в поле с именем 'ValueAdjustments' я ввожу текст '[TheValue]'
	И я нажимаю на кнопку с именем 'Apply'

Сценарий: Я изменяю значение на 'TheValue' в ячейке 'TheCell'

	И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке '[TheCell]'
	И я нажимаю на кнопку с именем 'ChangeIndicators'
	
	Тогда открылось окно "Change values"
	И я меняю значение переключателя с именем 'AdjustmentKind' на "Value"
	И в поле с именем 'ValueAdjustments' я ввожу текст '[TheValue]'
	И я нажимаю на кнопку с именем 'Apply'

Сценарий: Я создаю экземпляр отчета для вида отчета 'TheReportKind' сценарий 'TheScenario' период 'TheStartDate' 'TheEndDate' периодичность 'TheFrequency' организация 'TheBusinessUnit' проект 'TheProject' аналитики 'TheDimension1' 'TheDimension2' 'TheDimension3' 'TheDimension4' 'TheDimension5' 'TheDimension6' 

	* Откроем форму ключевых реквизитов
		Если текущее окно имеет заголовок "Specify key document attributes" Тогда
			// Форма уже открыта
		Иначе
			И В командном интерфейсе я выбираю "Budgeting, reporting, and analysis" "Report instances"
			Тогда открылось окно "Report instances"
			И я нажимаю кнопку очистить у поля с именем 'SavedSetting'
			И я нажимаю на кнопку с именем 'FormCreate'

	* Заполняем ключевые реквизиты
		Тогда открылось окно "Specify key document attributes"
		И из выпадающего списка с именем 'ReportKind' я выбираю по строке '[TheReportKind]'				
		И из выпадающего списка с именем 'Scenario' я выбираю по строке '[TheScenario]'
		И из выпадающего списка с именем 'Periodicity' я выбираю точное значение '[TheFrequency]'
		И я нажимаю на кнопку с именем 'ChangePeriod'
		Тогда открылось окно "Select period"
		И в поле с именем 'DateBegin' я ввожу текст '[TheStartDate]'
		И в поле с именем 'DateEnd' я ввожу текст '[TheEndDate]'
		И я нажимаю на кнопку с именем 'select'
		Тогда открылось окно "Specify key document attributes *"
		И я нажимаю кнопку выбора у поля с именем 'Organization'
		И Я выбираю организацию '[TheBusinessUnit]'
		Тогда открылось окно "Specify key document attributes *"
		Если 'NOT IsBlankString("[TheProject]")' Тогда
			И из выпадающего списка с именем 'Project' я выбираю по строке '[TheProject]'
		Если 'NOT IsBlankString("[TheDimension1]")' Тогда
			И из выпадающего списка с именем 'Dimension1' я выбираю по строке '[TheDimension1]'
		Если 'NOT IsBlankString("[TheDimension2]")' Тогда
			И из выпадающего списка с именем 'Dimension2' я выбираю по строке '[TheDimension2]'
		Если 'NOT IsBlankString("[TheDimension3]")' Тогда
			И из выпадающего списка с именем 'Dimension3' я выбираю по строке '[TheDimension3]'
		Если 'NOT IsBlankString("[TheDimension4]")' Тогда
			И из выпадающего списка с именем 'Dimension4' я выбираю по строке '[TheDimension4]'
		Если 'NOT IsBlankString("[TheDimension5]")' Тогда
			И из выпадающего списка с именем 'Dimension5' я выбираю по строке '[TheDimension5]'
		Если 'NOT IsBlankString("[TheDimension6]")' Тогда
			И из выпадающего списка с именем 'Dimension6' я выбираю по строке '[TheDimension6]'
		Когда открылось окно "Specify key document attributes *"
		И я нажимаю на кнопку с именем 'FormApplyAndClose'
		
		И Открылся экземпляр отчета для вида отчета '[TheReportKind]' валюта '*' организация '[TheBusinessUnit]' сценарий '[TheScenario]' периодичность '[TheFrequency]' проект '[TheProject]' аналитики '[TheDimension1]' '[TheDimension2]' '[TheDimension3]' '[TheDimension4]' '[TheDimension5]' '[TheDimension6]' 	

Сценарий: Я открываю первый экземпляр отчета для вида отчета 'TheReportKind'

	И Я нахожу в списке вид отчета с именем '[TheReportKind]'
	И в таблице 'ReportKindList' я нажимаю на кнопку с именем 'ReportKindListOpenInstancesList'
	Тогда открылось окно "Report instances"
	И в таблице 'List' я выбираю текущую строку

Сценарий: Я открываю экземпляр отчета по сохраненной настройке 'TheName'

	И В командном интерфейсе я выбираю "Budgeting, reporting, and analysis" "Report instances"
	Тогда открылось окно "Report instances"
	И я нажимаю кнопку выбора у поля с именем 'SavedSetting'
	И из выпадающего списка с именем 'SavedSetting' я выбираю точное значение '[TheName]'
	И в таблице 'List' я выбираю текущую строку

Сценарий: В экземпляре отчета я удалю все существующие версии

	И я нажимаю на кнопку с именем 'FormVersionsManagement'
	Тогда открылось окно "Indicator version management"
	И Пока в таблице 'List' количество строк ">" 0 Тогда
		И я нажимаю на кнопку с именем 'ListDeleteVersions'
		Если открылось окно "1C:Enterprise" Тогда
			И я нажимаю на кнопку с именем 'Button0'
		Если открылось окно "1C:Enterprise" Тогда
			И я нажимаю на кнопку с именем 'Button0'
	Тогда открылось окно "Indicator version management*"
	И Я закрываю окно "Indicator version management*"

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
	И я нажимаю на кнопку с именем 'select'
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

Сценарий: Я создаю шаблон универсального процесса с именем "TheName" режимом "TheMode"

	* Открываем форму справочника
		И В командном интерфейсе я выбираю "Budgeting, reporting, and analysis" "Templates of report preparation process"

	* Удаляем элемент
		И Я в списке "Universal process templates" по полю "Description" ищу элемент '[TheName]' "Exact match" 
		И Пока в таблице 'List' количество строк 'больше' 0 Тогда
			* Переименовываем
				И в таблице 'List' я выбираю текущую строку
				Тогда открылось окно "Editing process stages: [TheName]"
				И я нажимаю на кнопку с именем 'FormOpenProcessProperties'
				Когда открылось окно "[TheName] (Universal process template)"
				И Я запоминаю значение выражения 'StrReplace(New UUID, "-", "")' в переменную 'UID'
				И в поле с именем 'Description' я ввожу значение переменной 'UID'
				И я нажимаю на кнопку с именем 'FormWriteAndClose'
				И я жду закрытия окна "[TheName] (Universal process template) *" в течение 20 секунд
				Тогда открылось окно "Editing process stages: *"
				И Я закрываю окно "Editing process stages: *"

	* Создаем элемент
		Когда открылось окно "Universal process templates"
		И я нажимаю на кнопку с именем 'FormCreate'
		Тогда открылось окно "Universal process template (create)"		
		И в поле с именем 'Description' я ввожу текст '[TheName]'
		Когда открылось окно "Universal process template (create)"
		И из выпадающего списка с именем 'ProcessPurpose' я выбираю точное значение '[TheMode]'
		Когда открылось окно "Universal process template (create) *"
		И я нажимаю на кнопку с именем 'FormWriteAndClose'
		И я жду закрытия окна "Universal process template (create) *" в течение 20 секунд
		Тогда открылось окно "Editing process stages: *"
		И Я закрываю окно "Editing process stages: *"

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

Сценарий: Я открываю управление процессом подготовки отчетности для сценария 'TheScenario'

	И В командном интерфейсе я выбираю "Processes and approval" "Reporting preparation management"
	Тогда открылось окно "Reporting preparation management"
	И я нажимаю кнопку выбора у поля с именем 'PeriodManagement'
	И Я в списке "Reporting period management" по полю "Scenario" ищу и выбираю элемент '[TheScenario]' "Exact match" 
	Тогда открылось окно "Reporting preparation management"
	И в таблице 'StepsTree' я нажимаю на кнопку с именем 'StepsTreeExpandAll'

Сценарий: Я добавляю право 'TheRule' для вида отчета 'TheReportKind' пользователя 'TheUser' организации 'TheBusinessUnit' 

	И В командном интерфейсе я выбираю "Budgeting, reporting, and analysis" "Report type access matrix"
	Тогда открылось окно "Customizable reporting user access rights"
	И из выпадающего списка с именем 'FilterReportsTypes' я выбираю по строке '[TheReportKind]'	
	И из выпадающего списка с именем 'FilterUsers' я выбираю по строке '[TheUser]'
	И из выпадающего списка с именем 'FilterCompanies' я выбираю по строке '[TheBusinessUnit]'
	И я меняю значение переключателя с именем 'ShowInColumnsNumber' на 'companies'
	И я устанавливаю флаг с именем 'ShouldShowReportTemplates'
	
	И я нажимаю на кнопку с именем 'FormUpdateTable'
	И в табличном документе 'CustomField' я перехожу к ячейке 'DetailsReportKind'
	И в табличном документе 'CustomField' я делаю двойной клик на текущей ячейке
	Тогда открылось окно "Select access kind"
	И Я запоминаю значение выражения '[TheRule]' в переменную 'ТекущеRule'
	И в таблице 'List' я перехожу к строке:
		| "Reference"          |
		| '$ТекущеRule$' |
	И в таблице 'List' я выбираю текущую строку

	Тогда открылось окно "Customizable reporting user access rights *"
	И я нажимаю на кнопку с именем 'FormApplySettings'
	Тогда открылось окно "Customizable reporting user access rights"
	И я нажимаю на кнопку с именем 'RereadData'

	Когда открылось окно "Customizable reporting user access rights"
	И Я закрываю окно "Customizable reporting user access rights"

Сценарий: Я добавляю право 'TheRule' для вида отчета 'TheReportKind' пользователя 'TheUser' по всем организациям

	И В командном интерфейсе я выбираю "Budgeting, reporting, and analysis" "Report type access matrix"
	Тогда открылось окно "Customizable reporting user access rights"
	И из выпадающего списка с именем 'FilterReportsTypes' я выбираю по строке '[TheReportKind]'
	И из выпадающего списка с именем 'FilterUsers' я выбираю по строке '[TheUser]'
	И я нажимаю кнопку очистить у поля с именем 'FilterCompanies'		
	И я меняю значение переключателя с именем 'ShowInColumnsNumber' на 'companies'
	И я устанавливаю флаг с именем 'ShouldShowReportTemplates'

	И я нажимаю на кнопку с именем 'FormUpdateTable'
	И в табличном документе 'CustomField' я перехожу к ячейке 'ReportKind'
	И в табличном документе 'CustomField' я делаю двойной клик на текущей ячейке
	Тогда открылось окно "Set up access rights to report type"
	И в таблице 'RightsSettingsTable' я нажимаю на кнопку с именем 'RightsSettingsTableFillAccessRights'
	Тогда открылось окно "Select access kind"
	И Я запоминаю значение выражения '[TheRule]' в переменную 'ТекущеRule'
	И в таблице 'List' я перехожу к строке:
		| "Reference"          |
		| '$ТекущеRule$' |
	И в таблице 'List' я выбираю текущую строку
	Тогда открылось окно "Set up access rights to report type"
	И я нажимаю на кнопку с именем 'FormOK'

	Тогда открылось окно "Customizable reporting user access rights *"
	И я нажимаю на кнопку с именем 'FormApplySettings'
	Тогда открылось окно "Customizable reporting user access rights"
	И я нажимаю на кнопку с именем 'RereadData'

	Когда открылось окно "Customizable reporting user access rights"
	И Я закрываю окно "Customizable reporting user access rights"

Сценарий: Я создаю группу аналитических отчетов с кодом 'TheCode' именем 'TheName' родителем 'TheParent'

	* Открываем форму справочника
		И В командном интерфейсе я выбираю "Budgeting, reporting, and analysis" "Analytical reports"

	* Удаляем элемент
		И Я в списке "Analytical reports" по полю "Description" ищу элемент '[TheName]' "Exact match" 
		И Пока в таблице 'List' количество строк 'больше' 0 Тогда
			* Ставим пометку на удаление	
				И Я удаляю текущую строку в списке 'List'
			* Переименовываем
				И Я запоминаю значение выражения 'StrReplace(New UUID, "-", "")' в переменную 'UID'
				И в таблице 'List' я выбираю текущую строку
				Тогда открылось окно "* (Analytical reports)"
				И в поле с именем 'Description' я ввожу значение переменной 'UID'
				И я нажимаю кнопку очистить у поля с именем 'Code'
				Тогда открылось окно "1C:Enterprise"
				И я нажимаю на кнопку с именем 'Button0'				
				И в поле с именем 'Code' я ввожу значение переменной 'UID'
				И я нажимаю на кнопку с именем 'FormWriteAndClose'
				И я жду закрытия окна "* (Analytical reports) *" в течение 20 секунд
		И я выбираю пункт контекстного меню с именем 'ListContextMenuCancelSearch' на элементе формы с именем "List"

	* Создаем элемент
		Когда открылось окно "Analytical reports"
		И я нажимаю на кнопку с именем 'FormCreateFolder'
		Тогда открылось окно 'Аналитические отчеты (create folder)'
		И в поле с именем 'Description' я ввожу текст '[TheName]'
		И я нажимаю кнопку очистить у поля с именем 'Code'
		Тогда открылось окно "1C:Enterprise"
		И я нажимаю на кнопку с именем 'Button0'				
		И в поле с именем 'Code' я ввожу текст '[TheCode]'
		Если 'IsBlankString("[TheParent]")' Тогда
			И я нажимаю кнопку очистить у поля с именем 'Parent'
		Иначе
			И из выпадающего списка с именем 'Parent' я выбираю по строке '[TheParent]'									
		И я нажимаю на кнопку с именем 'FormWriteAndClose'
		И я жду закрытия окна 'Аналитические отчеты (create folder) *' в течение 20 секунд

Сценарий: Я создаю аналитический отчет с кодом 'TheCode' вид отчета 'TheReportKind' период 'ThePeriod' организация 'TheBusinessUnit' родитель 'TheParent'

	* Открываем форму справочника
		И В командном интерфейсе я выбираю "Budgeting, reporting, and analysis" "Analytical reports"

	* Удаляем элемент
		И Я в списке "Analytical reports" по полю "Description" ищу элемент '[TheReportKind] ([TheBusinessUnit])' "Exact match" 
		И Пока в таблице 'List' количество строк 'больше' 0 Тогда
			* Ставим пометку на удаление	
				И Я удаляю текущую строку в списке 'List'
			* Переименовываем
				И Я запоминаю значение выражения 'StrReplace(New UUID, "-", "")' в переменную 'UID'
				И в таблице 'List' я выбираю текущую строку
				Тогда открылось окно "* (Analytical report)"
				И в поле с именем 'Description' я ввожу значение переменной 'UID'
				И я нажимаю кнопку очистить у поля с именем 'Code'
				Тогда открылось окно "1C:Enterprise"
				И я нажимаю на кнопку с именем 'Button0'				
				И в поле с именем 'Code' я ввожу значение переменной 'UID'							
				И я нажимаю на кнопку с именем 'FormWriteAndClose'
				И я жду закрытия окна "* (Analytical report) *" в течение 20 секунд

	* Создаем элемент
		Когда открылось окно "Analytical reports"
		И я нажимаю на кнопку с именем 'FormCreate'
		Тогда открылось окно "Analytical report (create)"
		И в поле с именем 'Description' я ввожу текст '[TheReportKind] ([TheBusinessUnit])'
		И я нажимаю кнопку очистить у поля с именем 'Code'
		Тогда открылось окно "1C:Enterprise"
		И я нажимаю на кнопку с именем 'Button0'				
		И в поле с именем 'Code' я ввожу текст '[TheCode]'	
		Если 'IsBlankString("[TheParent]")' Тогда
			И я нажимаю кнопку очистить у поля с именем 'Parent'
		Иначе
			И из выпадающего списка с именем 'Parent' я выбираю по строке '[TheParent]'
		И я нажимаю на кнопку с именем 'FormWrite'

	* Настраиваем элемент	
		Когда открылось окно "[TheReportKind] ([TheBusinessUnit]) (Analytical report)"
		* Источник данных
			И я нажимаю кнопку выбора у поля с именем 'ReportDataSource'
			Тогда открылось окно "Select data type"
			И в таблице "" я выбираю текущую строку		
			Тогда открылось окно "Queries to infobase"
			И я нажимаю на кнопку с именем 'FormCreate'
			Тогда открылось окно "Query to infobase (create)"
			И в поле с именем 'Description' я ввожу текст '[TheReportKind] ([TheBusinessUnit])'
			И я нажимаю на кнопку с именем 'Write'
			Тогда открылось окно "[TheReportKind] ([TheBusinessUnit]) (Query to infobase)"
			И я перехожу к закладке с именем 'CaclSetup'
			И я нажимаю на кнопку с именем 'FormGetIndicatorsValues'
			И я нажимаю на кнопку с именем 'WriteAndClose'
			И я жду закрытия окна "[TheReportKind] ([TheBusinessUnit]) (Query to infobase)" в течение 20 секунд
			Тогда открылось окно "Queries to infobase"
			И в таблице 'List' я выбираю текущую строку
		Тогда открылось окно "[TheReportKind] ([TheBusinessUnit]) (Analytical report) *"
		И я нажимаю на кнопку с именем 'FormWrite'

	* Редактирование схемы	
		И я нажимаю на кнопку с именем 'EditSchemaOption'
		Тогда открылось окно "Analytical report structure settings ([TheReportKind] ([TheBusinessUnit]))"
		
		И в таблице 'RowsGroupingTableBoxPageTable' я нажимаю на кнопку с именем 'RowsGroupingTableBoxPageTableAddGroupField'
		И в таблице 'RowsGroupingTableBoxPageTable' из выпадающего списка с именем 'RowsGroupingTableBoxPageTableField' я выбираю точное значение "Company"
		И в таблице 'RowsGroupingTableBoxPageTable' из выпадающего списка с именем 'RowsGroupingTableBoxPageTableGroupType' я выбираю точное значение "Без иерархии"
		И в таблице 'RowsGroupingTableBoxPageTable' я нажимаю на кнопку с именем 'RowsGroupingTableBoxPageTableAddGroupField'
		И в таблице 'RowsGroupingTableBoxPageTable' из выпадающего списка с именем 'RowsGroupingTableBoxPageTableField' я выбираю точное значение "Report period"
		И в таблице 'RowsGroupingTableBoxPageTable' из выпадающего списка с именем 'RowsGroupingTableBoxPageTableGroupType' я выбираю точное значение "Без иерархии"
		
		И в таблице 'SelectedFieldsPageTable' я нажимаю на кнопку с именем 'SelectedFieldsPageTableAddSelectedField'
		И в таблице 'SelectedFieldsPageTable' из выпадающего списка с именем 'SelectedFieldsPageTableField' я выбираю точное значение "Indicator"
		И в таблице 'SelectedFieldsPageTable' я завершаю редактирование строки
		И в таблице 'SelectedFieldsPageTable' я нажимаю на кнопку с именем 'SelectedFieldsPageTableAddSelectedField'
		И в таблице 'SelectedFieldsPageTable' из выпадающего списка с именем 'SelectedFieldsPageTableField' я выбираю точное значение "Value"

		И я перехожу к закладке с именем 'FilterAndOrder'
		И в таблице 'TableBoxFilterPageWithoutParameters' я нажимаю на кнопку с именем 'TableBoxFilterPageWithoutParametersAddFilterItem'
		И в таблице 'TableBoxFilterPageWithoutParameters' из выпадающего списка с именем 'TableBoxFilterPageWithoutParametersLeftValue' я выбираю точное значение "Company"
		И в таблице 'TableBoxFilterPageWithoutParameters' из выпадающего списка с именем 'TableBoxFilterPageWithoutParametersComparisonType' я выбираю точное значение "Equal to"
		И в таблице 'TableBoxFilterPageWithoutParameters' я нажимаю кнопку выбора у реквизита с именем 'TableBoxFilterPageWithoutParametersRightValue'
		И Я выбираю организацию '[TheBusinessUnit]'
		Тогда открылось окно "Analytical report structure settings ([TheReportKind] ([TheBusinessUnit]))"
		И в таблице 'TableBoxFilterPageWithoutParameters' я нажимаю на кнопку с именем 'TableBoxFilterPageWithoutParametersAddFilterItem'
		И в таблице 'TableBoxFilterPageWithoutParameters' из выпадающего списка с именем 'TableBoxFilterPageWithoutParametersLeftValue' я выбираю точное значение "Report period"
		И в таблице 'TableBoxFilterPageWithoutParameters' из выпадающего списка с именем 'TableBoxFilterPageWithoutParametersComparisonType' я выбираю точное значение "Equal to"
		И в таблице 'TableBoxFilterPageWithoutParameters' я нажимаю кнопку выбора у реквизита с именем 'TableBoxFilterPageWithoutParametersRightValue'
		И Я в списке "Periods" по полю "Description" ищу и выбираю элемент '[ThePeriod]' "At beginning of line"
		Когда открылось окно "Analytical report structure settings ([TheReportKind] ([TheBusinessUnit]))"
		И в таблице 'TableBoxFilterPageWithoutParameters' я нажимаю на кнопку с именем 'TableBoxFilterPageWithoutParametersAddFilterItem'
		И в таблице 'TableBoxFilterPageWithoutParameters' из выпадающего списка с именем 'TableBoxFilterPageWithoutParametersLeftValue' я выбираю точное значение "Currency"
		И в таблице 'TableBoxFilterPageWithoutParameters' из выпадающего списка с именем 'TableBoxFilterPageWithoutParametersComparisonType' я выбираю точное значение "Equal to"
		И в таблице 'TableBoxFilterPageWithoutParameters' из выпадающего списка с именем 'TableBoxFilterPageWithoutParametersRightValue' я выбираю точное значение "RUB"
		И в таблице 'TableBoxFilterPageWithoutParameters' я завершаю редактирование строки
		Когда открылось окно "Analytical report structure settings ([TheReportKind] ([TheBusinessUnit]))"
		И в таблице "Filter" я нажимаю на кнопку с именем 'FilterAddFilterItem'
		И в таблице "Filter" из выпадающего списка с именем "FilterЛевоеValue" я выбираю по строке "Indicator.Report type"
		И в таблице "Filter" я активизирую поле с именем "FilterПравоеValue"
		И в таблице "Filter" я нажимаю кнопку выбора у реквизита с именем "FilterПравоеValue"
		Тогда открылось окно "Select data type"
		И в таблице "" я выбираю текущую строку
		И Я в списке "Report types" по полю "Description" ищу и выбираю элемент '[TheReportKind]' "At beginning of line"
		
		Когда открылось окно "Analytical report structure settings ([TheReportKind] ([TheBusinessUnit]))"
		И я перехожу к закладке с именем 'OrderPage'
		И в таблице 'Table_SortFields' я нажимаю на кнопку с именем 'Table_SortFieldsAddItemПорядка'
		И в таблице 'Table_SortFields' из выпадающего списка с именем 'Table_SortFieldsField' я выбираю по строке "Indicator.Line.Sequence number"
		И в таблице 'Table_SortFields' я завершаю редактирование строки
		И в таблице 'Table_SortFields' я нажимаю на кнопку с именем 'Table_SortFieldsAddItemПорядка'
		И в таблице 'Table_SortFields' из выпадающего списка с именем 'Table_SortFieldsField' я выбираю по строке "Indicator.Column.Sequence number"
		И в таблице 'Table_SortFields' я завершаю редактирование строки				
		
		И я нажимаю на кнопку с именем 'FormOK'

	Тогда открылось окно "[TheReportKind] ([TheBusinessUnit]) (Analytical report)"
	И я нажимаю на кнопку с именем 'FormWrite'
	И я устанавливаю флаг с именем 'CustomSettings'
	И я нажимаю на кнопку с именем 'FormWrite'

	Тогда открылось окно "[TheReportKind] ([TheBusinessUnit]) (Analytical report)"
	И я нажимаю на кнопку с именем 'EditSchemaOption'
	Тогда открылось окно "Analytical report structure settings ([TheReportKind] ([TheBusinessUnit]))"
	И я перехожу к закладке с именем 'OutputParametersPage'
	И в таблице "Table_Data parametersВывода" я перехожу к строке:
		| "Value" | "Use" | "Parameter"                               |
		| "Auto"     | "No"           | "Arrangement общих итогов to вертикали" |
	И в таблице 'Table_OutputParameters' я активизирую поле с именем 'Table_OutputParametersValue'
	И в таблице 'Table_OutputParameters' я выбираю текущую строку
	И в таблице 'Table_OutputParameters' из выпадающего списка с именем 'Table_OutputParametersValue' я выбираю точное значение "No"
	И в таблице 'Table_OutputParameters' я завершаю редактирование строки
	И я нажимаю на кнопку с именем 'FormOK'

	Тогда открылось окно "[TheReportKind] ([TheBusinessUnit]) (Analytical report)"
	И я нажимаю на кнопку с именем 'FormWriteAndClose'
	И я жду закрытия окна "[TheReportKind] ([TheBusinessUnit]) (Analytical report)" в течении 20 секунд

Сценарий: Я создаю шаблон корректировки значений показателей с имененм "TheName" и видами отчетов

	* Открываем форму справочника
		И В командном интерфейсе я выбираю "Budgeting, reporting, and analysis" "Indicator value adjustments templates"

	* Удаляем элемент
		И Я в списке "Indicator value adjustments templates" по полю "Description" ищу элемент '[TheName]' "Exact match" 
		И Пока в таблице 'List' количество строк 'больше' 0 Тогда
			* Ставим пометку на удаление	
				И Я удаляю текущую строку в списке 'List'
			* Переименовываем
				И Я запоминаю значение выражения 'StrReplace(New UUID, "-", "")' в переменную 'UID'
				И в таблице 'List' я выбираю текущую строку
				Тогда открылось окно "* (Indicator value adjustments templates)"
				И в поле с именем 'Description' я ввожу значение переменной 'UID'
				И я удаляю все строки таблицы 'UsedReportTypes'				
				И я нажимаю на кнопку с именем 'FormWriteAndClose'
				И я жду закрытия окна "* (Indicator value adjustments templates) *" в течение 20 секунд

	* Создаем элемент
		Когда открылось окно "Indicator value adjustments templates"
		И я нажимаю на кнопку с именем 'FormCreate'
		Тогда открылось окно "Indicator value adjustments templates (create)"		
		И я заполняю таблицу 'UsedReportTypes' данными
			|'Table'|
		И в поле с именем 'Description' я ввожу текст '[TheName]'
		Когда открылось окно "Indicator value adjustments templates (create) *"
		И я нажимаю на кнопку с именем 'FormWriteAndClose'
		И я жду закрытия окна "Indicator value adjustments templates (create) *" в течение 20 секунд
				
Сценарий: Для шаблона корректировки значений показателей с имененм "TheName" я заполняю таблицу корректировок значениями

	* Открываем форму справочника
		И В командном интерфейсе я выбираю "Budgeting, reporting, and analysis" "Indicator value adjustments templates"

	* Ищем элемент
		И Я в списке "Indicator value adjustments templates" по полю "Description" ищу и выбираю элемент '[TheName]' "Exact match" 

	* Заполнение
		И я заполняю таблицу 'TableOfAdjustments' данными
			|'Table'|

	* Сохраняем элемент
		Когда открылось окно "[TheName] (Indicator value adjustments templates) *"
		И я нажимаю на кнопку с именем 'FormWriteAndClose'
		И я жду закрытия окна "[TheName] (Indicator value adjustments templates) *" в течение 20 секунд

Сценарий: Я создаю корректировку значений показателей сценарий "TheScenario" период "TheStartDate" периодичность "TheFrequency" организация "TheBusinessUnit" значения

	И Я открываю новую корректировку значений показателей сценарий "[TheScenario]" период "[TheStartDate]" периодичность "[TheFrequency]" организация "[TheBusinessUnit]"

	И я заполняю таблицу 'TableOfAdjustments' данными
		|'Table'|
	
	Когда открылось окно "Indicator value adjustment (create) *"
	И я нажимаю на кнопку с именем 'FormPostAndClose'
	И я жду закрытия окна "Indicator value adjustment (create) *" в течение 20 секунд

Сценарий: Движения документа стали равны "ThePath"

	И я нажимаю на кнопку с именем 'FormDocumentRegisterRecords'
	Тогда открылось окно "Flat table of indicator values with attributes"
	И я жду когда в табличном документе 'ReportSpreadsheetDocument' заполнится ячейка 'R2C1' в течение 60 секунд
	Дано Табличный документ 'ReportSpreadsheetDocument' равен макету "[ThePath]" по шаблону
	И Я закрываю окно "Flat table of indicator values with attributes"

Сценарий: Я заполняю таблицу курсов в управлении периодом сценария

	И я перехожу к закладке с именем 'ExchangeRates'
	И в таблице 'RatesEditTable' я нажимаю на кнопку с именем 'RatesEditTableRatesTable_Update'
	И в таблице 'RatesEditTable' я нажимаю на кнопку с именем 'RatesEditTableRatesTable_Write'
	И в таблице 'RatesViewTable' я нажимаю на кнопку с именем 'RatesTable_ChangeModeWithoutSave'		
	* EUR
		И в таблице 'RatesEditTable' я перехожу к строке:
			| "Currency" | "Multiplier" | "Rate period"   |
			| 'EUR'    | '1.0000'    | "January 2024" |
		И в таблице 'RatesEditTable' я выбираю текущую строку
		И в таблице 'RatesEditTable' в поле с именем 'RatesEditTableRateAtPeriodStart_CurrentValue' я ввожу текст '90.7932'
		И в таблице 'RatesEditTable' в поле с именем 'RatesEditTableRateAtPeriodEnd_CurrentValue' я ввожу текст '92.2963'
		И в таблице 'RatesEditTable' в поле с именем 'RatesEditTableAverageRateForPeriod_CurrentValue' я ввожу текст '90.4971'
		И в таблице 'RatesEditTable' в поле с именем 'RatesEditTableAverageRateForPeriodCentralBank_CurrentValue' я ввожу текст '90.4537'
		И в таблице 'RatesEditTable' в поле с именем 'RatesEditTableAverageRateForPeriodIFRS_CurrentValue' я ввожу текст '91.5448'
		И в таблице 'RatesEditTable' в поле с именем 'RatesEditTableRateAtPreviousPeriodEnd_CurrentValue' я ввожу текст '0'
		И в таблице 'RatesEditTable' в поле с именем 'RatesEditTableAverageRateForPreviousPeriod_CurrentValue' я ввожу текст '0'
		И в таблице 'RatesEditTable' в поле с именем 'RatesEditTableAverageRateForPreviousPeriodCentralBank_CurrentValue' я ввожу текст '0'
		И в таблице 'RatesEditTable' я перехожу к строке:
			| "Currency" | "Multiplier" | "Rate period"    |
			| 'EUR'    | '1.0000'    | "February 2024" |
		И в таблице 'RatesEditTable' я выбираю текущую строку
		И в таблице 'RatesEditTable' в поле с именем 'RatesEditTableRateAtPeriodStart_CurrentValue' я ввожу текст '92.2963'
		И в таблице 'RatesEditTable' в поле с именем 'RatesEditTableRateAtPeriodEnd_CurrentValue' я ввожу текст '90.3743'
		И в таблице 'RatesEditTable' в поле с именем 'RatesEditTableAverageRateForPeriod_CurrentValue' я ввожу текст '89.9321'
		И в таблице 'RatesEditTable' в поле с именем 'RatesEditTableAverageRateForPeriodCentralBank_CurrentValue' я ввожу текст '90.0038'
		И в таблице 'RatesEditTable' в поле с именем 'RatesEditTableAverageRateForPeriodIFRS_CurrentValue' я ввожу текст '91.3353'
		И в таблице 'RatesEditTable' в поле с именем 'RatesEditTableRateAtPreviousPeriodEnd_CurrentValue' я ввожу текст '92.2963'
		И в таблице 'RatesEditTable' в поле с именем 'RatesEditTableAverageRateForPreviousPeriod_CurrentValue' я ввожу текст '90.4971'
		И в таблице 'RatesEditTable' в поле с именем 'RatesEditTableAverageRateForPreviousPeriodCentralBank_CurrentValue' я ввожу текст '90.4537'	
		И в таблице 'RatesEditTable' я перехожу к строке:
			| "Currency" | "Multiplier" | "Rate period" |
			| 'EUR'    | '1.0000'    | "March 2024" |
		И в таблице 'RatesEditTable' я выбираю текущую строку
		И в таблице 'RatesEditTable' в поле с именем 'RatesEditTableRateAtPeriodStart_CurrentValue' я ввожу текст '90.3743'
		И в таблице 'RatesEditTable' в поле с именем 'RatesEditTableRateAtPeriodEnd_CurrentValue' я ввожу текст '88.8821'
		И в таблице 'RatesEditTable' в поле с именем 'RatesEditTableAverageRateForPeriod_CurrentValue' я ввожу текст '88.6820'
		И в таблице 'RatesEditTable' в поле с именем 'RatesEditTableAverageRateForPeriodCentralBank_CurrentValue' я ввожу текст '88.7338'
		И в таблице 'RatesEditTable' в поле с именем 'RatesEditTableAverageRateForPeriodIFRS_CurrentValue' я ввожу текст '89.6282'
		И в таблице 'RatesEditTable' в поле с именем 'RatesEditTableRateAtPreviousPeriodEnd_CurrentValue' я ввожу текст '90.3743'
		И в таблице 'RatesEditTable' в поле с именем 'RatesEditTableAverageRateForPreviousPeriod_CurrentValue' я ввожу текст '89.9321'
		И в таблице 'RatesEditTable' в поле с именем 'RatesEditTableAverageRateForPreviousPeriodCentralBank_CurrentValue' я ввожу текст '90.0038'	
	* USD
		И в таблице 'RatesEditTable' я перехожу к строке:
			| "Currency" | "Multiplier" | "Rate period"   |
			| 'USD'    | '1.0000'    | "January 2024" |
		И в таблице 'RatesEditTable' я выбираю текущую строку
		И в таблице 'RatesEditTable' в поле с именем 'RatesEditTableRateAtPeriodStart_CurrentValue' я ввожу текст '73.8757'
		И в таблице 'RatesEditTable' в поле с именем 'RatesEditTableRateAtPeriodEnd_CurrentValue' я ввожу текст '76.2527'
		И в таблице 'RatesEditTable' в поле с именем 'RatesEditTableAverageRateForPeriod_CurrentValue' я ввожу текст '74.2204'
		И в таблице 'RatesEditTable' в поле с именем 'RatesEditTableAverageRateForPeriodCentralBank_CurrentValue' я ввожу текст '74.1489'
		И в таблице 'RatesEditTable' в поле с именем 'RatesEditTableAverageRateForPeriodIFRS_CurrentValue' я ввожу текст '75.0642'
		И в таблице 'RatesEditTable' в поле с именем 'RatesEditTableRateAtPreviousPeriodEnd_CurrentValue' я ввожу текст '0'
		И в таблице 'RatesEditTable' в поле с именем 'RatesEditTableAverageRateForPreviousPeriod_CurrentValue' я ввожу текст '0'
		И в таблице 'RatesEditTable' в поле с именем 'RatesEditTableAverageRateForPreviousPeriodCentralBank_CurrentValue' я ввожу текст '0'
		И в таблице 'RatesEditTable' я перехожу к строке:
			| "Currency" | "Multiplier" | "Rate period"    |
			| 'USD'    | '1.0000'    | "February 2024" |
		И в таблице 'RatesEditTable' я выбираю текущую строку
		И в таблице 'RatesEditTable' в поле с именем 'RatesEditTableRateAtPeriodStart_CurrentValue' я ввожу текст '76.2527'
		И в таблице 'RatesEditTable' в поле с именем 'RatesEditTableRateAtPeriodEnd_CurrentValue' я ввожу текст '74.4373'
		И в таблице 'RatesEditTable' в поле с именем 'RatesEditTableAverageRateForPeriod_CurrentValue' я ввожу текст '74.3747'
		И в таблице 'RatesEditTable' в поле с именем 'RatesEditTableAverageRateForPeriodCentralBank_CurrentValue' я ввожу текст '74.4435'
		И в таблице 'RatesEditTable' в поле с именем 'RatesEditTableAverageRateForPeriodIFRS_CurrentValue' я ввожу текст '75.3450'
		И в таблице 'RatesEditTable' в поле с именем 'RatesEditTableRateAtPreviousPeriodEnd_CurrentValue' я ввожу текст '76.2527'
		И в таблице 'RatesEditTable' в поле с именем 'RatesEditTableAverageRateForPreviousPeriod_CurrentValue' я ввожу текст '74.2204'
		И в таблице 'RatesEditTable' в поле с именем 'RatesEditTableAverageRateForPreviousPeriodCentralBank_CurrentValue' я ввожу текст '74.1489'	
		И в таблице 'RatesEditTable' я перехожу к строке:
			| "Currency" | "Multiplier" | "Rate period" |
			| 'USD'    | '1.0000'    | "March 2024" |
		И в таблице 'RatesEditTable' я выбираю текущую строку
		И в таблице 'RatesEditTable' в поле с именем 'RatesEditTableRateAtPeriodStart_CurrentValue' я ввожу текст '74.4373'
		И в таблице 'RatesEditTable' в поле с именем 'RatesEditTableRateAtPeriodEnd_CurrentValue' я ввожу текст '75.7023'
		И в таблице 'RatesEditTable' в поле с именем 'RatesEditTableAverageRateForPeriod_CurrentValue' я ввожу текст '74.4035'
		И в таблице 'RatesEditTable' в поле с именем 'RatesEditTableAverageRateForPeriodCentralBank_CurrentValue' я ввожу текст '74.3689'
		И в таблице 'RatesEditTable' в поле с именем 'RatesEditTableAverageRateForPeriodIFRS_CurrentValue' я ввожу текст '75.0698'
		И в таблице 'RatesEditTable' в поле с именем 'RatesEditTableRateAtPreviousPeriodEnd_CurrentValue' я ввожу текст '74.4373'
		И в таблице 'RatesEditTable' в поле с именем 'RatesEditTableAverageRateForPreviousPeriod_CurrentValue' я ввожу текст '74.3747'
		И в таблице 'RatesEditTable' в поле с именем 'RatesEditTableAverageRateForPreviousPeriodCentralBank_CurrentValue' я ввожу текст '74.4435'	
	И в таблице 'RatesEditTable' я завершаю редактирование строки
	И в таблице 'RatesEditTable' я нажимаю на кнопку с именем 'RatesEditTableRatesTable_Write'
