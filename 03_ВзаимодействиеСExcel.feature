#language: ru

@tree

Функционал: 03. Выгрузука бланков и загрузка экземпляров отчетов из Excel

Как Администратор я хочу 
проверить что выгрузка и загрузка из Excel работы 
чтобы загружать экземпляры отчетов из файлов

Контекст: 

	И я подключаю TestClient "CPM - Budget" логин "Administrator" пароль ''
	И я закрыл все окна клиентского приложения

Сценарий: 03.00 Определение типа приложения

	Пусть Инициализация переменных

Сценарий: 03.01 Создание внешней информационной базы

	И Я создаю внешнюю информационную базу с именем "VA - Import from Excel" и типом 'Файлы Microsoft Excel'

Сценарий: 03.02 Создание отчета с группами и 6 аналитиками

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
		И Я в конструкторе отчета в ячейке 'R6C1' я меняю родителя у строки на "Group_Dimensions_0"
		И Я в конструкторе отчета в ячейке 'R9C1' я меняю родителя у строки на "Group_Dimensions_0"
		И Я в конструкторе отчета в ячейке 'R12C1' я меняю родителя у строки на "Group_Currency"
		И Я в конструкторе отчета в ячейке 'R11C1' я меняю родителя у строки на "Group_Dimensions_6"
		И Я в конструкторе отчета в ячейке 'R12C1' я меняю родителя у строки на "Group_Dimensions_6"
		И Я в конструкторе отчета в ячейке 'R12C1' я меняю родителя у строки на "Group_Dimensions_1_2"
		И Я в конструкторе отчета в ячейке 'R12C1' я меняю родителя у строки на "Group_Dimensions_1_2"
		И Я в конструкторе отчета в ячейке 'R4C1' я меняю родителя у строки на "Group_Synthetic"
	
	* Создаем колонки отчета
		И Я в конструкторе отчета добавляю колонку с именем "Quantity"
		И Я в конструкторе отчета добавляю колонку с именем "Amount"

	* Вводим аналитики
		* Аналитика "Контрагенты"
			И Я в конструкторе отчета добавляю аналитику с кодом "VA0Counter" в ячейку 'R7C2' 	
			Тогда открылось окно "Edit tree"
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
			Тогда открылось окно "Edit tree"
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
			Когда открылось окно "Edit tree"
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
		Когда открылось окно "Edit tree"
		И из выпадающего списка с именем 'WorkMode' я выбираю точное значение "Indicators calculation formulas"
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R3C2'
		И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R4C2'
		И я нажимаю на кнопку с именем 'ButtonSum'
		И я нажимаю на кнопку с именем 'WriteAndCollapse'
		Тогда открылось окно "Edit tree"
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R3C3'
		И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R4C3'
		И я нажимаю на кнопку с именем 'ButtonSum'
		И я нажимаю на кнопку с именем 'WriteAndCollapse'
		Тогда открылось окно "Edit tree"
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R5C2'
		И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R6C2'
		И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
		И я нажимаю на кнопку с именем 'ButtonPlus'
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R9C2'
		И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
		И я нажимаю на кнопку с именем 'WriteAndCollapse'
		Тогда открылось окно "Edit tree"
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R5C3'
		И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R6C3'
		И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
		И я нажимаю на кнопку с именем 'ButtonPlus'
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R9C3'
		И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
		И я нажимаю на кнопку с именем 'WriteAndCollapse'
		Тогда открылось окно "Edit tree"
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R6C2'
		И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R7C2'
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R7C2:R8C2'
		И я нажимаю на кнопку с именем 'ButtonSum'
		И я нажимаю на кнопку с именем 'WriteAndCollapse'
		Тогда открылось окно "Edit tree"
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R6C3'
		И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R7C3'
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R7C3:R8C3'
		И я нажимаю на кнопку с именем 'ButtonSum'
		И я нажимаю на кнопку с именем 'WriteAndCollapse'
		Тогда открылось окно "Edit tree"
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R9C2'
		И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R10C2'
		И я нажимаю на кнопку с именем 'ButtonSum'
		И я нажимаю на кнопку с именем 'WriteAndCollapse'
		Тогда открылось окно "Edit tree"
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R9C3'
		И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R10C3'
		И я нажимаю на кнопку с именем 'ButtonSum'
		И я нажимаю на кнопку с именем 'WriteAndCollapse'
		Тогда открылось окно "Edit tree"
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R11C2'
		И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R12C2'
		И я нажимаю на кнопку с именем 'ButtonSum'
		И я нажимаю на кнопку с именем 'WriteAndCollapse'
		Тогда открылось окно "Edit tree"
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R11C3'
		И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R12C3'
		И я нажимаю на кнопку с именем 'ButtonSum'
		И я нажимаю на кнопку с именем 'WriteAndCollapse'

Сценарий: 03.03 Создание многопериодного бланка отчета и выгузка в Excel

	* Найдем вид отчета
		И Я нахожу в списке вид отчета с именем "VA - ImportExcel"
		Тогда открылось окно "Report types and templates"
		И в таблице 'List' я перехожу к строке:
			| "Description"     |
			| "VA - ImportExcel" |
		И в таблице 'List' я активизирую поле с именем 'Description'
		И в таблице 'List' я выбираю текущую строку

	* Создаем бланк
		Тогда Открылся бланк для вида отчета "VA - ImportExcel"
		И я запоминаю текущее окно как 'WindowTitle'
		И я нажимаю на кнопку с именем 'ShowIndicatorsPanel'
		И из выпадающего списка с именем 'TemplateToDisplay' я выбираю точное значение "To import and display"
		Тогда открылось окно "1C:Enterprise"
		И я нажимаю на кнопку с именем 'Button0'
		Тогда открылось окно "Report structure"
		И из выпадающего списка с именем 'TemplateOfReportsTemplatesAppearance' я выбираю по строке "Classic"
		И я снимаю флаг с именем 'DisplayBankingDetails'
		И я нажимаю на кнопку с именем 'FormSelect'

	* Записываем бланк
		Тогда открылось окно '$WindowTitle$ *'
		И я нажимаю на кнопку с именем 'RecordButtonForm'

	* Сохраняем бланк
		Тогда открылось окно '$WindowTitle$'
		И я нажимаю на кнопку с именем 'StartExport'
		Тогда открылось окно "Save report template"
		И из выпадающего списка с именем 'ExternalIB' я выбираю по строке "VA - Import from Excel"
		И в поле с именем 'UploadFileName' я ввожу текст '$КаталогПроекта$\Макеты\ВА_ИмпортExcel_Шаблон.xlsx'
		И из выпадающего списка с именем 'Periodicity' я выбираю точное значение "Month"
		И в поле с именем 'NumberOfPeriods' я ввожу текст '3'
		И я нажимаю на кнопку с именем 'FormExport'
		Тогда открылось окно '$WindowTitle$'
		И Я закрываю окно '$WindowTitle$'
		Когда открылось окно "Report types and templates"
		И Я закрываю окно "Report types and templates"

	* Сравниваем файл
		И В командном интерфейсе я выбираю "Budgeting, reporting, and analysis" "Compare spreadsheet documents"
		Тогда открылось окно "Compare spreadsheet documents"
		И в поле с именем 'DocumentPath1' я ввожу текст '$КаталогПроекта$\Макеты\ВА_ИмпортExcel_Шаблон.xlsx'
		И в поле с именем 'DocumentPath2' я ввожу текст '$КаталогПроекта$\Макеты\ВА_ИмпортExcel_Шаблон.mxl'
		И я устанавливаю флаг с именем 'AreOnlyValuesCompared'
		И я устанавливаю флаг с именем 'ShouldCompareByTemplate'								
		И я нажимаю на кнопку с именем 'FormCompareDocuments'
		Тогда открылось окно "Documents are identical: Compare spreadsheet documents"
		И Я закрываю окно "Documents are identical: Compare spreadsheet documents"

	* Настраиваем сортировку
		И Я Для вида отчета "VA - ImportExcel" в бланке для группы раскрытия с адресом 'R18C1' меняю сортировку "Product range" "Description" на сортировку "Product range" "Product ID"
		И Я Для вида отчета "VA - ImportExcel" в бланке для группы раскрытия с адресом 'R21C1' меняю сортировку "Product range" "Description" на сортировку "Product range" "Product ID"	

Сценарий: 03.04 Создание экземпляра отчета - "VA - ImportExcel"	и загрузка из файла

	И Я создаю экземпляр отчета для вида отчета "VA - ImportExcel" сценарий "VA - Main scenario" период '1/1/2021' '3/31/2021' периодичность "Month" организация "Mercury LLC" проект '' аналитики '' '' '' '' '' '' 
		
	* Документ должен быть пуст
		Тогда табличный документ 'SpreadsheetFieldTemlate' равен:
			| "VA - ImportExcel"          | ''            | ''                      | ''                   | ''             | ''           | ''                          | ''       | ''               | ''      | ''                | ''      | ''             | ''      |
			| ''                          | ''            | ''                      | ''                   | ''             | ''           | ''                          | ''       | ''               | ''      | ''                | ''      | ''             | ''      |
			| ''                          | "Counterparties" | "Counterparty contracts" | "Product categories" | "Product range" | "Cash flow items" | "Income and expense items" | "Currencies" | "January 2021" | ''      | "February 2021" | ''      | "March 2021" | ''      |
			| ''                          | ''            | ''                      | ''                   | ''             | ''           | ''                          | ''       | "Quantity"     | "Amount" | "Quantity"      | "Amount" | "Quantity"   | "Amount" |
			| "Line_Synthetic_1"        | ''            | ''                      | ''                   | ''             | ''           | ''                          | ''       | '0'              | '0'     | '0'               | '0'     | '0'            | '0'     |
			| "Group_Synthetic"          | ''            | ''                      | ''                   | ''             | ''           | ''                          | ''       | '0'              | '0'     | '0'               | '0'     | '0'            | '0'     |
			| "Line_Synthetic_2"        | ''            | ''                      | ''                   | ''             | ''           | ''                          | ''       | '0'              | '0'     | '0'               | '0'     | '0'            | '0'     |
			| "Group_Dimensions_0"        | ''            | ''                      | ''                   | ''             | ''           | ''                          | ''       | '0'              | '0'     | '0'               | '0'     | '0'            | '0'     |
			| "Group_Dimensions_1_2"      | ''            | ''                      | ''                   | ''             | ''           | ''                          | ''       | '0'              | '0'     | '0'               | '0'     | '0'            | '0'     |
			| "Line_Dimensions_1"        | ''            | ''                      | ''                   | ''             | ''           | ''                          | ''       | '0'              | '0'     | '0'               | '0'     | '0'            | '0'     |
			| "Line_Dimensions_2"        | ''            | ''                      | ''                   | ''             | ''           | ''                          | ''       | '0'              | '0'     | '0'               | '0'     | '0'            | '0'     |
			| "Group_Dimensions_6"        | ''            | ''                      | ''                   | ''             | ''           | ''                          | ''       | '0'              | '0'     | '0'               | '0'     | '0'            | '0'     |
			| "Line_Dimensions_6"        | ''            | ''                      | ''                   | ''             | ''           | ''                          | ''       | '0'              | '0'     | '0'               | '0'     | '0'            | '0'     |
			| "Group_Currency"             | ''            | ''                      | ''                   | ''             | ''           | ''                          | ''       | '0'              | '0'     | '0'               | '0'     | '0'            | '0'     |
			| "Line_Dimensions_6_Currency" | ''            | ''                      | ''                   | ''             | ''           | ''                          | ''       | '0'              | '0'     | '0'               | '0'     | '0'            | '0'     |

	* Загружаем без файла
		Когда открылось окно '$WindowTitle$'
		И я нажимаю на кнопку с именем 'FormFillInUsingAnotherApproach'
		Когда открылось окно "Select method to calculate indicators"
		И из выпадающего списка с именем 'ReportGenerationMethod' я выбираю точное значение "Import"
		И я нажимаю на кнопку с именем 'FormSelect'
		Когда открылось окно '$WindowTitle$'
		Затем я жду, что в сообщениях пользователю будет подстрока "Imported file path not specified. Operation canceled." в течение 30 секунд
		И я очищаю окно сообщений пользователю		

	* Загружаем с файлом
		И я нажимаю на кнопку с именем 'FormFillInUsingAnotherApproach'		
		Когда открылось окно "Select method to calculate indicators"
		Тогда у элемента формы с именем 'ReportGenerationMethod' текст редактирования стал равен "Import"
		Тогда у элемента формы с именем 'ImportTemplate' текст редактирования стал равен "VA - ImportExcel"
		И в поле с именем 'PathToFile' я ввожу текст "$КаталогПроекта$\Макеты\ВА_ИмпортExcel_Меркурий_En.xlsx"
		И я нажимаю на кнопку с именем 'FormSelect'				
		Тогда открылось окно '$WindowTitle$'
		Дано Табличный документ 'SpreadsheetFieldTemlate' равен макету '\\Макеты\ВА_ИмпортExcel_Меркурий.mxl'

	* Проверяем историю действий
		Тогда открылось окно '$WindowTitle$'
		И я нажимаю на кнопку с именем 'CancelApplyDetailed'
		Тогда открылось окно "Action history"
		Тогда таблица 'Transactions_' стала равной:
			| "Transaction presentation" |
			| "Fill by regulation" |
			| "Import from MS Excel"     |
		И я нажимаю на кнопку с именем 'FormCancel'

	* Записываем документ	
		Тогда открылось окно '$WindowTitle$'
		И я нажимаю на кнопку с именем 'WriteAndClose'
		И я жду закрытия окна '$WindowTitle$' в течение 30 секунд

Сценарий: 03.05 Повторная загрузка данных из файла

	И Я открываю первый экземпляр отчета для вида отчета "VA - ImportExcel"
	Тогда Открылся экземпляр отчета для вида отчета "VA - ImportExcel" валюта 'RUB' организация "Mercury LLC" сценарий "VA - Main scenario" периодичность "Month" проект '' аналитики '' '' '' '' '' '' 
	
	* Очищаем показатели
		Тогда открылось окно '$WindowTitle$'
		И я нажимаю на кнопку с именем 'Edit'
		И я нажимаю на кнопку с именем 'Clear'
		Тогда открылось окно "1C:Enterprise"
		И я нажимаю на кнопку с именем 'Button0'
		Тогда открылось окно '$WindowTitle$'
		И я нажимаю на кнопку с именем 'Write'				

	* Грузим файл повторно
		И я нажимаю на кнопку с именем 'FormFillInUsingAnotherApproach'
		Когда открылось окно "Select method to calculate indicators"
		И из выпадающего списка с именем 'ReportGenerationMethod' я выбираю точное значение "Import"
		И элемент формы с именем 'ImportApproach' стал равен 'FromCatalog'
		И элемент формы с именем 'ImportFile3' стал равен 'DimenKind_ImportExcel_Mercury*' по шаблону
		И элемент формы с именем 'ImportTemplate' стал равен "VA - ImportExcel"
		И я нажимаю на кнопку с именем 'FormSelect'
		Когда открылось окно "Select file version"
		И таблица 'SheetsList' стала равной:
			| "Document sheet" | "Password protected" |
			| 'TDSheet'        | "No"             |
		И я нажимаю на кнопку с именем 'FormOK'

	* Сверяем результат			
		Тогда открылось окно '$WindowTitle$'
		Дано Табличный документ 'SpreadsheetFieldTemlate' равен макету '\\Макеты\ВА_ИмпортExcel_Меркурий.mxl'
		И я нажимаю на кнопку с именем 'Write'

	* Вибираем второй файл
		И я нажимаю на кнопку с именем 'FormFillInUsingAnotherApproach'
		Когда открылось окно "Select method to calculate indicators"	
		И я меняю значение переключателя с именем 'ImportApproach' на "on hard drive"						
		И в поле с именем 'PathToFile' я ввожу текст "$КаталогПроекта$\Макеты\ВА_ИмпортExcel_Меркурий_2_En.xlsm"
		И я нажимаю на кнопку с именем 'FormSelect'

	* Сверяем результат	
		Дано Табличный документ 'SpreadsheetFieldTemlate' равен макету '\\Макеты\ВА_ИмпортExcel_Меркурий_2.mxl'	
	
	* Закрываем документ
		И я нажимаю на кнопку с именем 'WriteAndClose'
		И я жду закрытия окна '$WindowTitle$' в течение 20 секунд

Сценарий: 03.06 Создаем бланк сводной таблицы

	И Я для вида отчета "VA - ImportExcel" я создаю бланк сводной таблицы по умолчанию с отборами

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

Сценарий: 03.07 Создаем сводную таблицу

	* Открываем сводную таблицу
		И Я октрываю сводную таблицу отчета с именем "VA - ImportExcel"
		И Я устанавливаю отборы сводной таблицы: дата начала '1/1/2021', дата конца '3/31/2021', валюта 'RUB', сценарий "VA - Main scenario", организация "Mercury LLC"	

	Когда открылось окно '$WindowTitle$'
	Дано Табличный документ 'SpreadsheetFieldTemlate' равен макету '\\Макеты\ВА_ИмпортExcel_Меркурий_2_СТ.mxl'

	* Загружаем без файла	
		Когда открылось окно '$WindowTitle$'
		И я нажимаю на кнопку с именем 'RecalculateOther'
		Тогда открылось окно "Select method to calculate indicators"
		И из выпадающего списка с именем 'ReportGenerationMethod' я выбираю точное значение "Import"
		И я нажимаю на кнопку с именем 'FormSelect'
		Когда открылось окно '$WindowTitle$'
		Затем я жду, что в сообщениях пользователю будет подстрока "Imported file path not specified. Operation canceled." в течение 30 секунд
		И я очищаю окно сообщений пользователю

	* Загружаем с файлом
		И я нажимаю на кнопку с именем 'RecalculateOther'		
		Когда открылось окно "Select method to calculate indicators"
		Тогда у элемента формы с именем 'ReportGenerationMethod' текст редактирования стал равен "Import"
		Тогда у элемента формы с именем 'ImportTemplate' текст редактирования стал равен "VA - ImportExcel"
		И в поле с именем 'PathToFile' я ввожу текст "$КаталогПроекта$\Макеты\ВА_ИмпортExcel_Меркурий_En.xlsx"
		И я нажимаю на кнопку с именем 'FormSelect'				
		
	* Проверяем историю действий
		И я жду открытия формы '$WindowTitle$' в течение 20 секунд
		И я нажимаю на кнопку с именем 'CancelApplyDetailed'
		Тогда открылось окно "Action history"
		Тогда таблица 'Transactions_' стала равной:
			| "Transaction presentation" |
			| "Fill by regulation" |
			| "Import from MS Excel"     |
		И я нажимаю на кнопку с именем 'FormCancel'

	* Сверяем результат	
		Тогда открылось окно '$WindowTitle$'
		Дано Табличный документ 'SpreadsheetFieldTemlate' равен макету '\\Макеты\ВА_ИмпортExcel_Меркурий_СТ.mxl'

	* Загружаем файл еще раз
		Тогда открылось окно '$WindowTitle$'
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке "R10C9:R28C9"
		И я нажимаю на кнопку с именем 'ClearRange'
		И я нажимаю на кнопку с именем 'RecalculateOther'
		Тогда открылось окно "Select method to calculate indicators"
		И я нажимаю на кнопку с именем 'FormSelect'
		Тогда открылось окно "Select file version"
		И я нажимаю на кнопку с именем 'FormOK'				

	* Записываем
		Тогда открылось окно '$WindowTitle$'
		И я нажимаю на кнопку с именем 'Apply'
		И я нажимаю на кнопку с именем 'UpdateTabData'
				
	* Сверяем результат	
		И я жду открытия формы '$WindowTitle$' в течение 20 секунд
		Дано Табличный документ 'SpreadsheetFieldTemlate' равен макету '\\Макеты\ВА_ИмпортExcel_Меркурий_СТ.mxl'
