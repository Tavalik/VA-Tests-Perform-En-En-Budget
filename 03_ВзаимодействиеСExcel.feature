#language: ru

@tree

Функционал: 03. Выгрузука бланков и загрузка экземпляров отчетов из Excel

Как Администратор я хочу 
проверить что выгрузка и загрузка из Excel работы 
чтобы загружать экземпляры отчетов из файлов

Контекст: 

	И я закрыл все окна клиентского приложения

Сценарий: 03.00 Определение типа приложения

	И я закрываю TestClient "CPM - Budget"
	И я подключаю TestClient "CPM - Budget" логин "Administrator" пароль ''
	Пусть Инициализация переменных

Сценарий: 03.01 Создание отчета с группами и 6 аналитиками

	И Я создаю вид отчета с именем "VA - ImportExcel" и родителем "VA - Report group"

	* Создаем строки отчета
		И Я открываю контруктор отчета с именем "VA - ImportExcel"
		И Я в конструкторе отчета добавляю строку с именем "Line_Synthetic_1"
		И Я в конструкторе отчета добавляю строку с именем "Group_Synthetic"
		И Я в конструкторе отчета добавляю строку с именем "Line_Synthetic_2"
		И Я в конструкторе отчета добавляю строку с именем "Group_Dimensions_0"
		И Я в конструкторе отчета добавляю строку с именем "Group_Dimensions_1_2"
		И Я в конструкторе отчета добавляю строку с именем "Line_Dimensions_1"
		И Я в конструкторе отчета добавляю строку с именем "Line_Dimensions_2"
		И Я в конструкторе отчета добавляю строку с именем "Group_Dimensions_6"
		И Я в конструкторе отчета добавляю строку с именем "Line_Dimensions_6"
		И Я в конструкторе отчета добавляю строку с именем "Group_Currency"
		И Я в конструкторе отчета добавляю строку с именем "Line_Dimensions_6_Currency"

	* Задаем иерархию строк
		И Я в конструкторе отчета в ячейке 'R6C1' меняю родителя у строки на "Group_Dimensions_0"
		И Я в конструкторе отчета в ячейке 'R9C1' меняю родителя у строки на "Group_Dimensions_0"
		И Я в конструкторе отчета в ячейке 'R12C1' меняю родителя у строки на "Group_Currency"
		И Я в конструкторе отчета в ячейке 'R11C1' меняю родителя у строки на "Group_Dimensions_6"
		И Я в конструкторе отчета в ячейке 'R12C1' меняю родителя у строки на "Group_Dimensions_6"
		И Я в конструкторе отчета в ячейке 'R12C1' меняю родителя у строки на "Group_Dimensions_1_2"
		И Я в конструкторе отчета в ячейке 'R12C1' меняю родителя у строки на "Group_Dimensions_1_2"
		И Я в конструкторе отчета в ячейке 'R4C1' меняю родителя у строки на "Group_Synthetic"
	
	* Создаем колонки отчета
		И Я в конструкторе отчета добавляю колонку с именем "Count"
		И Я в конструкторе отчета добавляю колонку с именем "Amount"

	* Вводим аналитики
		* Аналитика "Контрагенты"
			И Я в конструкторе отчета добавляю аналитику с кодом "VA0Counter" в ячейку 'R7C2' 	
			Тогда открылось окно "Report wizard"
			И я нажимаю на кнопку с именем 'CopyDimension'
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R8C2'
			И я нажимаю на кнопку с именем 'InsertDimension'
			И я нажимаю на кнопку с именем 'CopyDimension'
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R10C2'
			И я нажимаю на кнопку с именем 'InsertDimension'
			И я нажимаю на кнопку с именем 'CopyDimension'
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R12C2'
			И я нажимаю на кнопку с именем 'InsertDimension'
		* Аналитика "Договоры контрагентов"
			И Я в конструкторе отчета добавляю аналитику с кодом "VA0Contrac" в ячейку 'R8C3'
			Тогда открылось окно "Report wizard"
			И я нажимаю на кнопку с именем 'CopyDimension'
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R10C3'
			И я нажимаю на кнопку с именем 'InsertDimension'
			И я нажимаю на кнопку с именем 'CopyDimension'
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R12C3'
			И я нажимаю на кнопку с именем 'InsertDimension'
		* Аналитика "Товарные категории"
			И Я в конструкторе отчета добавляю аналитику с кодом "VA0ProCate" в ячейку 'R10C4'
			И я нажимаю на кнопку с именем 'CopyDimension'
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R12C4'
			И я нажимаю на кнопку с именем 'InsertDimension'
		* Аналитика "Номенклатура"
			И Я в конструкторе отчета добавляю аналитику с кодом "VA0Product" в ячейку 'R10C5'
			И я нажимаю на кнопку с именем 'CopyDimension'
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R12C5'
			И я нажимаю на кнопку с именем 'InsertDimension'
		* Аналитика "Статьи ДДС"
			И Я в конструкторе отчета добавляю аналитику с кодом "VA0CFItems" в ячейку 'R10C6'
			И я нажимаю на кнопку с именем 'CopyDimension'
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R12C6'
			И я нажимаю на кнопку с именем 'InsertDimension'
		* Аналитика "Статьи доходов и расходов"
			И Я в конструкторе отчета добавляю аналитику с кодом "VA0IEItems" в ячейку 'R10C7'
			И я нажимаю на кнопку с именем 'CopyDimension'
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R12C7'
			И я нажимаю на кнопку с именем 'InsertDimension'
		* Аналитка валюта
			Когда открылось окно "Report wizard"
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R12C8'
			И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке

	* Сравниваем результат
		Тогда табличный документ 'SpreadsheetFieldTemlate' равен:
			| 'String'                    | "Dimension 1" | "Dimension 2"           | "Dimension 3"        | "Dimension 4"  | "Dimension 5" | "Dimension 6"               | "Drilldown by currencies" | "Settings" |
			| "Line_Synthetic_1"        | ''            | ''                      | ''                   | ''             | ''            | ''                          | ''                     | ''          |
			| "Group_Synthetic"          | ''            | ''                      | ''                   | ''             | ''            | ''                          | ''                     | ''          |
			| "Line_Synthetic_2"        | ''            | ''                      | ''                   | ''             | ''            | ''                          | ''                     | ''          |
			| "Group_Dimensions_0"        | ''            | ''                      | ''                   | ''             | ''            | ''                          | ''                     | ''          |
			| "Group_Dimensions_1_2"      | ''            | ''                      | ''                   | ''             | ''            | ''                          | ''                     | ''          |
			| "Line_Dimensions_1"        | "Counterparties" | ''                      | ''                   | ''             | ''            | ''                          | ''                     | ''          |
			| "Line_Dimensions_2"        | "Counterparties" | "Counterparty contracts" | ''                   | ''             | ''            | ''                          | ''                     | ''          |
			| "Group_Dimensions_6"        | ''            | ''                      | ''                   | ''             | ''            | ''                          | ''                     | ''          |
			| "Line_Dimensions_6"        | "Counterparties" | "Counterparty contracts" | "Product categories" | "Product range" | "Cash flow items"  | "Income and expense items" | ''                     | ''          |
			| "Group_Currency"             | ''            | ''                      | ''                   | ''             | ''            | ''                          | ''                     | ''          |
			| "Line_Dimensions_6_Currency" | "Counterparties" | "Counterparty contracts" | "Product categories" | "Product range" | "Cash flow items"  | "Income and expense items" | '■'                    | ''          |

	* Настраиваем формулы расчета
		Когда открылось окно "Report wizard"
		И из выпадающего списка с именем 'WorkMode' я выбираю точное значение "Indicators calculation formulas"
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R3C2'
		И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R4C2'
		И я нажимаю на кнопку с именем 'ButtonSum'
		И я нажимаю на кнопку с именем 'WriteAndCollapse'
		Тогда открылось окно "Report wizard"
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R3C3'
		И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R4C3'
		И я нажимаю на кнопку с именем 'ButtonSum'
		И я нажимаю на кнопку с именем 'WriteAndCollapse'
		Тогда открылось окно "Report wizard"
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R5C2'
		И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R6C2'
		И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
		И я нажимаю на кнопку с именем 'ButtonPlus'
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R9C2'
		И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
		И я нажимаю на кнопку с именем 'WriteAndCollapse'
		Тогда открылось окно "Report wizard"
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R5C3'
		И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R6C3'
		И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
		И я нажимаю на кнопку с именем 'ButtonPlus'
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R9C3'
		И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
		И я нажимаю на кнопку с именем 'WriteAndCollapse'
		Тогда открылось окно "Report wizard"
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R6C2'
		И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R7C2'
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R7C2:R8C2'
		И я нажимаю на кнопку с именем 'ButtonSum'
		И я нажимаю на кнопку с именем 'WriteAndCollapse'
		Тогда открылось окно "Report wizard"
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R6C3'
		И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R7C3'
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R7C3:R8C3'
		И я нажимаю на кнопку с именем 'ButtonSum'
		И я нажимаю на кнопку с именем 'WriteAndCollapse'
		Тогда открылось окно "Report wizard"
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R9C2'
		И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R10C2'
		И я нажимаю на кнопку с именем 'ButtonSum'
		И я нажимаю на кнопку с именем 'WriteAndCollapse'
		Тогда открылось окно "Report wizard"
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R9C3'
		И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R10C3'
		И я нажимаю на кнопку с именем 'ButtonSum'
		И я нажимаю на кнопку с именем 'WriteAndCollapse'
		Тогда открылось окно "Report wizard"
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R11C2'
		И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R12C2'
		И я нажимаю на кнопку с именем 'ButtonSum'
		И я нажимаю на кнопку с именем 'WriteAndCollapse'
		Тогда открылось окно "Report wizard"
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R11C3'
		И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R12C3'
		И я нажимаю на кнопку с именем 'ButtonSum'
		И я нажимаю на кнопку с именем 'WriteAndCollapse'

	* Настраиваем тип информационной базы
		Когда открылось окно "Report wizard"
		И я нажимаю на кнопку открытия поля с именем 'ProcessingRule'
		Тогда открылось окно "VA - ImportExcel (Calculation rules)"
		И я нажимаю кнопку выбора у поля с именем 'DBType'
		И Я в списке "Infobase types" по полю "Description" ищу и выбираю элемент "Microsoft Excel files" "At beginning of line"
		И я нажимаю на кнопку с именем 'FormWriteAndClose'
		И я жду закрытия окна "VA - ImportExcel (Calculation rules) *" в течение 20 секунд

Сценарий: 03.02 Создание внешней информационной базы "VA - Import from Excel"

	И Я создаю внешнюю информационную базу "VA - Import from Excel" тип "Microsoft Excel files" каталог "$КаталогПроекта$\Макеты\03" тип хранилища ''

	* Тестируем механизм маски имени
		Тогда элемент формы с именем 'FullNameMask' стал равен "$КаталогПроекта$\Макеты\03\*.xls?"
		Когда открылось окно '$WindowTitle$'
		И я нажимаю на кнопку с именем 'NameStructureFill'
		Тогда таблица 'NameStructure' стала равной:
			| "Separator"  | "Key attribute" |
			| '\\'           | "Scenario period"   |
			| '\\'           | "Scenario"          |
			| '\\'           | "Company"       |
			| '\\'           | "Project"            |
			| '\\'           | "Report type"        |
		Тогда элемент формы с именем 'FullNameMask' стал равен "$КаталогПроекта$\Макеты\03\<Scenario period>\<Scenario>\<Company>\<Project>\<Report type>.xls?"
		Когда открылось окно '$WindowTitle$'
		И в таблице 'NameStructure' я перехожу к строке:
			| "Separator" | "Key attribute" |
			| '\\'          | "Scenario period"   |
		И я нажимаю на кнопку с именем 'NameStructureDelete'
		И я нажимаю на кнопку с именем 'NameStructureDelete'
		И я нажимаю на кнопку с именем 'NameStructureDelete'
		И я нажимаю на кнопку с именем 'NameStructureDelete'
		И я нажимаю на кнопку с именем 'NameStructureAdd'
		И в таблице 'NameStructure' из выпадающего списка с именем 'NameStructureStartElement' я выбираю точное значение "+"
		И в таблице 'NameStructure' из выпадающего списка с именем 'NameStructureItem' я выбираю точное значение "Company"
		И в таблице 'NameStructure' я отменяю редактирование строки
		Тогда элемент формы с именем 'FullNameMask' стал равен "$КаталогПроекта$\Макеты\03\<Report type>+<Company>.xls?"

	* Наставиваем элементы пути	
		Тогда открылось окно '$WindowTitle$'
		И я нажимаю на кнопку с именем 'OpenCompaniesFilesExchangeSettings'
		И Я добавляю элемент пути к файлам организаций для типа 'Organization' объект "Mercury LLC" значение "Mercury"
		И Я добавляю элемент пути к файлам организаций для типа 'ReportKind' объект "VA - ImportExcel" значение "ВА_ИмпортExcel"
		Тогда открылось окно "Company file path items: List form"
		И я нажимаю на кнопку с именем 'FormClose'

	* Записываем и закрываем элемент
		Тогда открылось окно '$WindowTitle$'
		И я нажимаю на кнопку с именем 'FormWriteAndClose'
		И я жду закрытия окна '$WindowTitle$' в течение 20 секунд

Сценарий: 03.03 Создание многопериодного бланка отчета и выгузка в Excel

	И Я Для вида отчета "VA - ImportExcel" создаю бланк для импорта по умолчанию

	* Заполняем имя листа
		Тогда открылось окно '$WindowTitle$'
		И в поле с именем 'SheetName' я ввожу текст 'TDSheet'
		И я нажимаю на кнопку с именем 'RecordButtonForm'

	* Сохраняем бланк
		Тогда открылось окно '$WindowTitle$'
		И я нажимаю на кнопку с именем 'ExportTemplate'
		Тогда открылось окно "Save report template"
		И из выпадающего списка с именем 'ExternalIB' я выбираю по строке "VA - Import from Excel"
		И в поле с именем 'UploadFileName' я ввожу текст "$КаталогПроекта$\Макеты\03\ВА_ИмпортExcel+Шаблон.xlsx"
		И из выпадающего списка с именем 'Periodicity' я выбираю точное значение "Month"
		И в поле с именем 'NumberOfPeriods' я ввожу текст '3'
		И я нажимаю на кнопку с именем 'FormExport'
		Тогда открылось окно '$WindowTitle$'
		И Я закрываю окно '$WindowTitle$'

	* Сравниваем файл
		И В командном интерфейсе я выбираю "Budgeting, reporting, and analysis" "Compare spreadsheet documents"
		Тогда открылось окно "Compare spreadsheet documents"
		И в поле с именем 'DocumentPath1' я ввожу текст "$КаталогПроекта$\Макеты\03\ВА_ИмпортExcel+Шаблон.xlsx"
		И в поле с именем 'DocumentPath2' я ввожу текст "$КаталогПроекта$\Макеты\03\ВА_ИмпортExcel_Шаблон.mxl"
		И я устанавливаю флаг с именем 'AreOnlyValuesCompared'
		И я устанавливаю флаг с именем 'ShouldCompareByTemplate'								
		И я нажимаю на кнопку с именем 'FormCompareDocuments'
		Тогда открылось окно "Documents are identical: Compare spreadsheet documents"
		И Я закрываю окно "Documents are identical: Compare spreadsheet documents"

	* Настраиваем сортировку
		И Я Для вида отчета "VA - ImportExcel" в бланке для группы раскрытия с адресом 'R18C1' меняю сортировку "Product range" "Description" на сортировку "Product range" "Product ID"
		И Я Для вида отчета "VA - ImportExcel" в бланке для группы раскрытия с адресом 'R21C1' меняю сортировку "Product range" "Description" на сортировку "Product range" "Product ID"	

Сценарий: 03.04 Создаем бланк сводной таблицы

	И Я для вида отчета "VA - ImportExcel" создаю бланк сводной таблицы по умолчанию с отборами

	И Я Для вида отчета "VA - ImportExcel" открываю бланк сводной таблицы по умолчанию

	* Настраиваем порядок аналитик
		Когда открылось окно '$WindowTitle$'
		И я нажимаю на кнопку с именем 'ShowTableSettingsByAxes'
		И Я в сводной таблице перемещаю аналитику с именем "Additional currencies" вверх
		И Я в сводной таблице перемещаю аналитику с именем "Income and expense items" вверх
		И Я в сводной таблице перемещаю аналитику с именем "Cash flow items" вверх
		И Я в сводной таблице перемещаю аналитику с именем "Product range" вверх
		И Я в сводной таблице перемещаю аналитику с именем "Product categories" вверх
		И Я в сводной таблице перемещаю аналитику с именем "Counterparty contracts" вверх
		И Я в сводной таблице перемещаю аналитику с именем "Counterparties" вверх

	* Настраиваем сортировку аналитики Номенклатура
		Когда открылось окно "Set up field location"
		И в таблице 'TableRows1' я перехожу к строке:
			| "Horizontally (in rows)" |
			| "Product range"               |
		И в таблице 'TableRows1' я выбираю текущую строку
		Тогда открылось окно "Dimension display parameters (Product range)"
		И я нажимаю кнопку выбора у поля с именем 'DCSettingsOrderSettings'
		Тогда открылось окно "Edit order"
		И в таблице 'Data' я выбираю текущую строку
		И в таблице 'Data' из выпадающего списка с именем 'DataField' я выбираю точное значение "Product range.Product ID"
		И в таблице 'Data' я завершаю редактирование строки
		И я нажимаю на кнопку с именем 'OK'
		Когда открылось окно "Dimension display parameters (Product range)"
		И элемент формы с именем 'DCSettingsOrderSettings' стал равен "Product range.Product ID"
		И элемент формы с именем 'ShouldSupportHierarchy1' стал равен 'No'
		И я нажимаю на кнопку с именем 'FormApply'

	* Настраиваем вывод аналитик
		Когда открылось окно "Set up field location"
		И я нажимаю на кнопку с именем 'DimensionsLayoutOption'
		И в меню формы я выбираю "Adjacent dimensions"
		И я изменяю флаг с именем 'TotalByColumns'
		И я нажимаю на кнопку с именем 'ButtonApply'
	
	* Записываем бланк
		Когда открылось окно '$WindowTitle$'
		И я нажимаю на кнопку с именем 'FormWriteAndClose'
		И я жду закрытия окна '$WindowTitle$' в течение 20 секунд

Сценарий: 03.05 Настраиваем способ заполнения отчета

	И Я создаю экземпляр отчета для вида отчета "VA - ImportExcel" сценарий "VA - Main scenario" период '1/1/2024' '3/31/2024' периодичность "Month" организация "Mercury LLC" проект '' аналитики '' '' '' '' '' '' 
	
	Тогда открылось окно '$WindowTitle$'
	И я нажимаю на кнопку с именем 'FormOpenSettings'
	Тогда открылось окно "Edit report settings"
	И я нажимаю на кнопку с именем 'OpenRulesSettings'
	Тогда открылось окно "Set up object filling rules for regulation VA - Main regulations"
	И в табличном документе 'CustomField' я перехожу к ячейке "R2C3"
	И в табличном документе 'CustomField' я делаю двойной клик на текущей ячейке
	Тогда открылось окно "Set up report filling rules"
	И из выпадающего списка с именем 'ReportGenerationMethod' я выбираю точное значение "Import"
	И из выпадающего списка с именем 'ExternalSource' я выбираю по строке "VA - Import from Excel"
	Тогда элемент формы с именем 'ImportTemplate' стал равен "VA - ImportExcel"				
	
	И я нажимаю на кнопку с именем 'FormWriteAndClose'"
	Тогда открылось окно "Set up object filling rules for regulation VA - Main regulations"
	И я нажимаю на кнопку с именем 'FormApplySettings'
	И Я закрываю окно "Set up object filling rules for regulation VA - Main regulations"
	Тогда открылось окно "Edit report settings"
	И я нажимаю на кнопку с именем 'FormApplyANDClose'

Сценарий: 03.06 Настройка прав для пользователя "Budgeting1"

	И Я добавляю право "Read, write" для вида отчета "VA - ImportExcel" пользователя "Budgeting1" по всем организациям
	И я закрываю TestClient "CPM - Budget"
	И я подключаю TestClient "CPM - Budget" логин "Budgeting1" пароль ''

Сценарий: 03.07 Создание экземпляра отчета - "VA - ImportExcel"	и загрузка из файла

	И Я создаю экземпляр отчета для вида отчета "VA - ImportExcel" сценарий "VA - Main scenario" период '1/1/2024' '3/31/2024' периодичность "Month" организация "Mercury LLC" проект '' аналитики '' '' '' '' '' '' 
		
	* Документ должен быть пуст
		Дано Табличный документ 'SpreadsheetFieldTemlate' равен макету "$КаталогПроекта$\Макеты\03\ВА_ИмпортExcel_Пустой.mxl"

	* Загружаем без файла
		Когда открылось окно '$WindowTitle$'
		И я нажимаю на кнопку с именем 'FormFillInUsingAnotherApproach'
		Когда открылось окно "Select method to calculate indicators"
		И из выпадающего списка с именем 'ReportGenerationMethod' я выбираю точное значение "Import"
		И я нажимаю на кнопку с именем 'FormSelect'
		Когда открылось окно '$WindowTitle$'
		Затем я жду, что в сообщениях пользователю будет подстрока "Imported file path not specified. Operation canceled." в течение 30 секунд
		И я очищаю окно сообщений пользователю
		Дано Табличный документ 'SpreadsheetFieldTemlate' равен макету "$КаталогПроекта$\Макеты\03\ВА_ИмпортExcel_Пустой.mxl"		

	* Загружаем ошибочный файл
		И я нажимаю на кнопку с именем 'FormFillInUsingAnotherApproach'		
		Когда открылось окно "Select method to calculate indicators"
		Тогда у элемента формы с именем 'ReportGenerationMethod' текст редактирования стал равен "Import"
		Тогда у элемента формы с именем 'ImportTemplate' текст редактирования стал равен "VA - ImportExcel"
		И в поле с именем 'PathToFile' я ввожу текст "$КаталогПроекта$\Макеты\03\ВА_ИмпортExcel+Error.xlsx"
		И я нажимаю на кнопку с именем 'FormSelect'		
		Когда открылось окно "Protocol"
		Тогда табличный документ 'SpreadsheetDocumentField' равен по шаблону:
			| "Errors"                                            |
			| "In file * no line * was found. Import was aborted." |
		И я закрываю окно "Protocol"
		Дано Табличный документ 'SpreadsheetFieldTemlate' равен макету "$КаталогПроекта$\Макеты\03\ВА_ИмпортExcel_Пустой.mxl"

	* Загружаем с файлом
		И я нажимаю на кнопку с именем 'FormFillInUsingAnotherApproach'		
		Когда открылось окно "Select method to calculate indicators"
		Тогда у элемента формы с именем 'ReportGenerationMethod' текст редактирования стал равен "Import"
		Тогда у элемента формы с именем 'ImportTemplate' текст редактирования стал равен "VA - ImportExcel"
		Тогда у элемента формы с именем 'ImportFile3' текст редактирования стал равен "ВА_ИмпортExcel+Error.xlsx"
		И я меняю значение переключателя с именем 'ImportApproach' на "File on hard drive"
		Тогда у элемента формы с именем 'PathToFile' текст редактирования стал равен "$КаталогПроекта$\Макеты\03\ВА_ИмпортExcel+Error.xlsx"
		И в поле с именем 'PathToFile' я ввожу текст "$КаталогПроекта$\Макеты\03\ВА_ИмпортExcel+Mercury.xlsx"
		И я нажимаю на кнопку с именем 'FormSelect'
		Когда открылось окно "Spreadsheet document import parameters"
		И таблица 'SheetsList' стала равной:
			| "Sheet name" | "Password protected" |
			| 'TDSheet'   | "No"             |
			| '2Sheet'    | "No"             |
		И в таблице 'SheetsList' я перехожу к строке:
			| "Sheet name" | "Password protected" |
			| 'TDSheet'   | "No"             |
		И я нажимаю на кнопку с именем 'OkCommand'
		Тогда открылось окно '$WindowTitle$'
		Дано Табличный документ 'SpreadsheetFieldTemlate' равен макету "$КаталогПроекта$\Макеты\03\ВА_ИмпортExcel_Меркурий.mxl"

	* Проверяем историю действий
		Тогда открылось окно '$WindowTitle$'
		И я нажимаю на кнопку с именем 'CancelApplyDetailed'
		Тогда открылось окно "Action history"
		Тогда таблица 'Transactions_' стала равной:
			| "Transaction presentation" |
			| "Import from MS Excel"     |
		И я нажимаю на кнопку с именем 'FormCancel'

	* Записываем документ	
		Тогда открылось окно '$WindowTitle$'
		И я нажимаю на кнопку с именем 'WriteAndClose'
		И я жду закрытия окна '$WindowTitle$' в течение 30 секунд

Сценарий: 03.08 Повторная загрузка данных из файла

	И Я открываю первый экземпляр отчета для вида отчета "VA - ImportExcel"
	Тогда Открылся экземпляр отчета для вида отчета "VA - ImportExcel" валюта 'RUB' организация "Mercury LLC" сценарий "VA - Main scenario" периодичность "Month" проект '' аналитики '' '' '' '' '' '' 
	
	* Очищаем показатели
		Тогда открылось окно '$WindowTitle$'
		И я нажимаю на кнопку с именем 'Edit'
		И я нажимаю на кнопку с именем 'Clear'
		Тогда открылось окно "1C:Enterprise"
		И я нажимаю на кнопку с именем 'Button0'
		Дано Табличный документ 'SpreadsheetFieldTemlate' равен макету "$КаталогПроекта$\Макеты\03\ВА_ИмпортExcel_Пустой.mxl"
		Тогда открылось окно '$WindowTitle$'
		И я нажимаю на кнопку с именем 'Write'	

	* Загружаем этот же файл еще раз
		И я нажимаю на кнопку с именем 'FormFillInUsingAnotherApproach'		
		Когда открылось окно "Select method to calculate indicators"
		И из выпадающего списка с именем 'ReportGenerationMethod' я выбираю точное значение "Import"
		И я меняю значение переключателя с именем 'ImportApproach' на "File on hard drive"
		Тогда у элемента формы с именем 'PathToFile' текст редактирования стал равен ""
		И в поле с именем 'PathToFile' я ввожу текст "$КаталогПроекта$\Макеты\03\ВА_ИмпортExcel+Mercury.xlsx"
		И я нажимаю на кнопку с именем 'FormSelect'
		Тогда открылось окно "1C:Enterprise"
		И я нажимаю на кнопку с именем 'Button1'
		Тогда открылось окно '$WindowTitle$'
		Дано Табличный документ 'SpreadsheetFieldTemlate' равен макету "$КаталогПроекта$\Макеты\03\ВА_ИмпортExcel_Пустой.mxl"				

	* Грузим файл повторно
		И я нажимаю на кнопку с именем 'FormFillInUsingAnotherApproach'
		Когда открылось окно "Select method to calculate indicators"
		И из выпадающего списка с именем 'ReportGenerationMethod' я выбираю точное значение "Import"
		И элемент формы с именем 'ImportApproach' стал равен 'FromCatalog'
		И элемент формы с именем 'ImportFile3' стал равен "ВА_ИмпортExcel+Mercury.xlsx"
		И элемент формы с именем 'ImportTemplate' стал равен "VA - ImportExcel"
		И я нажимаю на кнопку с именем 'FormSelect'
		Когда открылось окно "Select file version"
		И таблица 'SheetsList' стала равной:
			| "Document sheet" | "Password protected" |
			| 'TDSheet'        | "No"             |
			| '2Sheet'         | "No"             |
		И в таблице 'SheetsList' я перехожу к строке:
			| "Document sheet" | "Password protected" |
			| 'TDSheet'        | "No"             |
		И я нажимаю на кнопку с именем 'FormOK'
		Тогда открылось окно '$WindowTitle$'
		Дано Табличный документ 'SpreadsheetFieldTemlate' равен макету "$КаталогПроекта$\Макеты\03\ВА_ИмпортExcel_Меркурий.mxl"

	* Отменяем загрузку
		Тогда открылось окно '$WindowTitle$'
		И я нажимаю на кнопку с именем 'CancelAction'
		Дано Табличный документ 'SpreadsheetFieldTemlate' равен макету "$КаталогПроекта$\Макеты\03\ВА_ИмпортExcel_Пустой.mxl"

	* Рассчитываем по регламенту
		Тогда открылось окно '$WindowTitle$'
		И я нажимаю на кнопку с именем 'FormFillByDefault'
		Тогда открылось окно '$WindowTitle$'
		Дано Табличный документ 'SpreadsheetFieldTemlate' равен макету "$КаталогПроекта$\Макеты\03\ВА_ИмпортExcel_Меркурий.mxl"
		И я нажимаю на кнопку с именем 'Write'					

	* Вибираем второй файл
		И я нажимаю на кнопку с именем 'FormFillInUsingAnotherApproach'
		Когда открылось окно "Select method to calculate indicators"
		И я меняю значение переключателя с именем 'ImportApproach' на "File on hard drive"
		И в поле с именем 'PathToFile' я ввожу текст "$КаталогПроекта$\Макеты\03\ВА_ИмпортExcel+Mercury_2.xlsm"
		И я нажимаю на кнопку с именем 'FormSelect'
		Тогда открылось окно '$WindowTitle$'
		Дано Табличный документ 'SpreadsheetFieldTemlate' равен макету "$КаталогПроекта$\Макеты\03\ВА_ИмпортExcel_Меркурий_2.mxl"
	
	* Заполняем из внешней базы
		И я нажимаю на кнопку с именем 'FormFillInUsingAnotherApproach'
		Когда открылось окно "Select method to calculate indicators"
		И я меняю значение переключателя с именем 'ImportApproach' на "External infobase"
		И из выпадающего списка с именем 'UsedIBImport' я выбираю по строке "VA - Import from Excel"
		И я нажимаю на кнопку с именем 'FormSelect'
		Тогда открылось окно '$WindowTitle$'
		Дано Табличный документ 'SpreadsheetFieldTemlate' равен макету "$КаталогПроекта$\Макеты\03\ВА_ИмпортExcel_Меркурий.mxl"									

	* Откатывамем расчет
		Тогда открылось окно '$WindowTitle$'
		И я нажимаю на кнопку с именем 'CancelAction'
		Дано Табличный документ 'SpreadsheetFieldTemlate' равен макету "$КаталогПроекта$\Макеты\03\ВА_ИмпортExcel_Меркурий_2.mxl"		

	* Закрываем документ
		И я нажимаю на кнопку с именем 'WriteAndClose'
		И я жду закрытия окна '$WindowTitle$' в течение 20 секунд

Сценарий: 03.09 Создаем сводную таблицу

	* Открываем сводную таблицу
		И Я октрываю сводную таблицу отчета с именем "VA - ImportExcel"
		И Я устанавливаю отборы сводной таблицы: дата начала '1/1/2024', дата конца '3/31/2024', валюта 'RUB', сценарий "VA - Main scenario", организация "Mercury LLC"	

	* Сверяем таблицу
		Когда открылось окно '$WindowTitle$'
		Дано Табличный документ 'SpreadsheetFieldTemlate' равен макету "$КаталогПроекта$\Макеты\03\ВА_ИмпортExcel_Меркурий_2_СТ.mxl"

	* Загружаем без файла	
		Когда открылось окно '$WindowTitle$'
		И я нажимаю на кнопку с именем 'RecalculateOther'
		Тогда открылось окно "Select method to calculate indicators"
		И из выпадающего списка с именем 'ReportGenerationMethod' я выбираю точное значение "Import"
		И я нажимаю на кнопку с именем 'FormSelect'
		Когда открылось окно '$WindowTitle$'
		Затем я жду, что в сообщениях пользователю будет подстрока "Imported file path not specified. Operation canceled." в течение 30 секунд
		И я очищаю окно сообщений пользователю

	* Загружаем ошибочный файл
		Когда открылось окно '$WindowTitle$'
		И я нажимаю на кнопку с именем 'RecalculateOther'		
		Когда открылось окно "Select method to calculate indicators"
		Тогда у элемента формы с именем 'ReportGenerationMethod' текст редактирования стал равен "Import"
		Тогда у элемента формы с именем 'ImportTemplate' текст редактирования стал равен "VA - ImportExcel"
		И в поле с именем 'PathToFile' я ввожу текст "$КаталогПроекта$\Макеты\03\ВА_ИмпортExcel+Error.xlsx"
		И я нажимаю на кнопку с именем 'FormSelect'
		И я жду открытия окна "Protocol" в течение 20 секунд
		Тогда табличный документ 'SpreadsheetDocumentField' равен по шаблону:
			| "Errors"                                            |
			| "In file * no line * was found. Import was aborted." |
		И я закрываю окно "Protocol"
		Дано Табличный документ 'SpreadsheetFieldTemlate' равен макету "$КаталогПроекта$\Макеты\03\ВА_ИмпортExcel_Меркурий_2_СТ.mxl"	

	* Загружаем по регламенту
		Тогда открылось окно '$WindowTitle$'
		И я нажимаю на кнопку с именем 'RecalculateAccordingToRegulations'
		И я жду открытия формы '$WindowTitle$' в течение 30 секунд
		Дано Табличный документ 'SpreadsheetFieldTemlate' равен макету "$КаталогПроекта$\Макеты\03\ВА_ИмпортExcel_Меркурий_СТ.mxl"	

	* Откатываем изменения
		Тогда открылось окно '$WindowTitle$'
		И я нажимаю на кнопку с именем 'CancelAction'
		И я жду открытия формы '$WindowTitle$' в течение 30 секунд
		Дано Табличный документ 'SpreadsheetFieldTemlate' равен макету "$КаталогПроекта$\Макеты\03\ВА_ИмпортExcel_Меркурий_2_СТ.mxl"							

	* Загружаем по внешней информационной базе
		И я нажимаю на кнопку с именем 'RecalculateOther'		
		Когда открылось окно "Select method to calculate indicators"
		И я меняю значение переключателя с именем 'ImportApproach' на "External infobase"
		И из выпадающего списка с именем 'UsedIBImport' я выбираю по строке "VA - Import from Excel"
		И я нажимаю на кнопку с именем 'FormSelect'			
		И я жду открытия формы '$WindowTitle$' в течение 30 секунд
		Дано Табличный документ 'SpreadsheetFieldTemlate' равен макету "$КаталогПроекта$\Макеты\03\ВА_ИмпортExcel_Меркурий_СТ.mxl"	

	* Очищаем часть показателей
		Тогда открылось окно '$WindowTitle$'
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке "R10C9:R28C9"
		И я нажимаю на кнопку с именем 'ClearRange'
	
	* Загружаем с файлом
		И я нажимаю на кнопку с именем 'RecalculateOther'		
		Когда открылось окно "Select method to calculate indicators"
		И я меняю значение переключателя с именем 'ImportApproach' на "File on hard drive"
		И в поле с именем 'PathToFile' я ввожу текст "$КаталогПроекта$\Макеты\03\ВА_ИмпортExcel+Mercury_2.xlsm"
		И я нажимаю на кнопку с именем 'FormSelect'

	* Сверяем результат	
		И я жду открытия формы '$WindowTitle$' в течение 30 секунд
		Дано Табличный документ 'SpreadsheetFieldTemlate' равен макету "$КаталогПроекта$\Макеты\03\ВА_ИмпортExcel_Меркурий_2_СТ.mxl"

	* Проверяем историю действий
		Тогда открылось окно '$WindowTitle$'
		И я нажимаю на кнопку с именем 'CancelApplyDetailed'
		Тогда открылось окно "Action history"
		Тогда таблица 'Transactions_' стала равной:
			| "Transaction presentation" |
			| "Import from MS Excel"     |
			| "Clear cell range"  |
			| "Import from MS Excel"     |
		И я нажимаю на кнопку с именем 'FormCancel'

	* Записываем
		Тогда открылось окно '$WindowTitle$'
		И я нажимаю на кнопку с именем 'Apply'
		И я нажимаю на кнопку с именем 'UpdateTabData'
				
	* Сверяем результат	
		И я жду открытия формы '$WindowTitle$' в течение 20 секунд
		Дано Табличный документ 'SpreadsheetFieldTemlate' равен макету "$КаталогПроекта$\Макеты\03\ВА_ИмпортExcel_Меркурий_2_СТ.mxl"
