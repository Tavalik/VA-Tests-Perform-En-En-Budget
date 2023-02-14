#language: ru

@tree

Функционал: 03. Выгрузука бланков и загрузка экземпляров отчетов из Excel

Как Администратор я хочу 
проверить что выгрузка и загрузка из Excel работы 
чтобы загружать экземпляры отчетов из файлов

Контекст: 

	И я подключаю TestClient 'CPM - Budgeting' логин "Administrator" пароль ''
	И я закрыл все окна клиентского приложения

Сценарий: 03.00 Определение типа приложения

	Пусть Инициализация переменных

Сценарий: 03.01 Создание внешней информационной базы

	И Я создаю внешнюю информационную базу с именем 'VA - Import from Excel' и типом "Microsoft Excel files"

Сценарий: 03.02 Создание отчета с группами и 6 аналитиками

	И Я создаю вид отчета с именем 'VA - ImportExcel' и родителем 'VA - Report group'
	
	* Создаем строки отчета
		И Я открываю контруктор отчета с именем 'VA - ImportExcel'
		И Я в конструкторе отчета добавляю строку с именем 'String_Synthetic_1'
		И Я в конструкторе отчета добавляю строку с именем 'Group_Synthetic'
		И Я в конструкторе отчета добавляю строку с именем 'String_Synthetic_2'
		И Я в конструкторе отчета добавляю строку с именем 'Group_Dimensions_0'
		И Я в конструкторе отчета добавляю строку с именем 'Group_Dimensions_1_2'
		И Я в конструкторе отчета добавляю строку с именем 'String_Dimensions_1'
		И Я в конструкторе отчета добавляю строку с именем 'String_Dimensions_2'
		И Я в конструкторе отчета добавляю строку с именем 'Group_Dimensions_6'
		И Я в конструкторе отчета добавляю строку с именем 'String_Dimensions_6'
		И Я в конструкторе отчета добавляю строку с именем 'Group_Currency'
		И Я в конструкторе отчета добавляю строку с именем 'String_Dimensions_6_Currency'

	* Задаем иерархию строк
		И Я в конструкторе отчета в ячейке 'R6C1' я меняю родителя у строки на 'Group_Dimensions_0'
		И Я в конструкторе отчета в ячейке 'R9C1' я меняю родителя у строки на 'Group_Dimensions_0'
		И Я в конструкторе отчета в ячейке 'R12C1' я меняю родителя у строки на 'Group_Currency'
		И Я в конструкторе отчета в ячейке 'R11C1' я меняю родителя у строки на 'Group_Dimensions_6'
		И Я в конструкторе отчета в ячейке 'R12C1' я меняю родителя у строки на 'Group_Dimensions_6'
		И Я в конструкторе отчета в ячейке 'R12C1' я меняю родителя у строки на 'Group_Dimensions_1_2'
		И Я в конструкторе отчета в ячейке 'R12C1' я меняю родителя у строки на 'Group_Dimensions_1_2'
		И Я в конструкторе отчета в ячейке 'R4C1' я меняю родителя у строки на 'Group_Synthetic'
	
	* Создаем колонки отчета
		И Я в конструкторе отчета добавляю колонку с именем 'Count'
		И Я в конструкторе отчета добавляю колонку с именем 'Sum'

	* Вводим аналитики
		* Аналитика 'Контрагенты'
			И Я в конструкторе отчета добавляю аналитику с кодом 'VA0Counter' в ячейку 'R7C2' 	
			Тогда открылось окно "Edit tree"
			И я нажимаю на кнопку с именем 'CopyDimension'
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R8C2'
			И я нажимаю на кнопку с именем 'InsertDim'
			И я нажимаю на кнопку с именем 'CopyDimension'
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R10C2'
			И я нажимаю на кнопку с именем 'InsertDim'
			И я нажимаю на кнопку с именем 'CopyDimension'
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R12C2'
			И я нажимаю на кнопку с именем 'InsertDim'
		* Аналитика 'Договоры контрагентов'
			И Я в конструкторе отчета добавляю аналитику с кодом 'VA0Contrac' в ячейку 'R8C3'
			Тогда открылось окно "Edit tree"
			И я нажимаю на кнопку с именем 'CopyDimension'
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R10C3'
			И я нажимаю на кнопку с именем 'InsertDim'
			И я нажимаю на кнопку с именем 'CopyDimension'
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R12C3'
			И я нажимаю на кнопку с именем 'InsertDim'
		* Аналитика 'Товарные категории'
			И Я в конструкторе отчета добавляю аналитику с кодом 'VA0ProCate' в ячейку 'R10C4'
			И я нажимаю на кнопку с именем 'CopyDimension'
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R12C4'
			И я нажимаю на кнопку с именем 'InsertDim'
		* Аналитика 'Номенклатура'
			И Я в конструкторе отчета добавляю аналитику с кодом 'VA0Product' в ячейку 'R10C5'
			И я нажимаю на кнопку с именем 'CopyDimension'
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R12C5'
			И я нажимаю на кнопку с именем 'InsertDim'
		* Аналитика 'Статьи ДДС'
			И Я в конструкторе отчета добавляю аналитику с кодом 'VA0CFItems' в ячейку 'R10C6'
			И я нажимаю на кнопку с именем 'CopyDimension'
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R12C6'
			И я нажимаю на кнопку с именем 'InsertDim'
		* Аналитика 'Статьи доходов и расходов'
			И Я в конструкторе отчета добавляю аналитику с кодом 'VA0IEItems' в ячейку 'R10C7'
			И я нажимаю на кнопку с именем 'CopyDimension'
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R12C7'
			И я нажимаю на кнопку с именем 'InsertDim'
		* Аналитка валюта
			Когда открылось окно "Edit tree"
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R12C8'
			И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке

	* Сравниваем результат
		Тогда табличный документ 'SpreadsheetFieldTemlate' равен:
			| 'String'                    | "Dimension 1" | "Dimension 2"           | "Dimension 3"        | "Dimension 4"  | "Dimension 5" | "Dimension 6"               | "Drilldown by currencies" | "Settings" |
			| 'String_Synthetic_1'        | ''            | ''                      | ''                   | ''             | ''            | ''                          | ''                     | ''          |
			| 'Group_Synthetic'          | ''            | ''                      | ''                   | ''             | ''            | ''                          | ''                     | ''          |
			| 'String_Synthetic_2'        | ''            | ''                      | ''                   | ''             | ''            | ''                          | ''                     | ''          |
			| 'Group_Dimensions_0'        | ''            | ''                      | ''                   | ''             | ''            | ''                          | ''                     | ''          |
			| 'Group_Dimensions_1_2'      | ''            | ''                      | ''                   | ''             | ''            | ''                          | ''                     | ''          |
			| 'String_Dimensions_1'        | 'Counterparties' | ''                      | ''                   | ''             | ''            | ''                          | ''                     | ''          |
			| 'String_Dimensions_2'        | 'Counterparties' | 'Contracts' | ''                   | ''             | ''            | ''                          | ''                     | ''          |
			| 'Group_Dimensions_6'        | ''            | ''                      | ''                   | ''             | ''            | ''                          | ''                     | ''          |
			| 'String_Dimensions_6'        | 'Counterparties' | 'Contracts' | 'Product categories' | 'Products' | 'Cash flow items'  | 'Income and expense items' | ''                     | ''          |
			| 'Group_Currency'             | ''            | ''                      | ''                   | ''             | ''            | ''                          | ''                     | ''          |
			| 'String_Dimensions_6_Currency' | 'Counterparties' | 'Contracts' | 'Product categories' | 'Products' | 'Cash flow items'  | 'Income and expense items' | '■'                    | ''          |

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
		И Я нахожу в списке вид отчета с именем 'VA - ImportExcel'
		Тогда открылось окно "Report kinds and templates"
		И в таблице 'List' я перехожу к строке:
			| "Description"     |
			| 'VA - ImportExcel' |
		И в таблице 'List' я активизирую поле с именем 'Description'
		И в таблице 'List' я выбираю текущую строку

	* Создаем бланк
		Тогда Открылся бланк для вида отчета 'VA - ImportExcel'
		И я запоминаю текущее окно как 'WindowTitle'
		И я нажимаю на кнопку с именем 'ShowIndicatorsPanel'
		И из выпадающего списка с именем 'TemplateToDisplay' я выбираю точное значение "To import and display"
		Тогда открылось окно "1C:Enterprise"
		И я нажимаю на кнопку с именем 'Button0'
		Тогда открылось окно "Report structure"
		И из выпадающего списка с именем 'ReportsTemplatesAppearanceTemplate' я выбираю по строке "Classic"
		И я снимаю флаг с именем 'ShouldShowAttributes'
		И я нажимаю на кнопку с именем 'FormSelect'

	* Настраиваем сортировку
		Когда открылось окно '$WindowTitle$ *'
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R18C1'
		И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
		Тогда открылось окно "Dimension drill-down area settings"
		И я перехожу к закладке с именем 'SectionSort'
		И в таблице 'SettingsComposerSettingsOrder' я перехожу к строке:
			| "Field"                      |
			| 'Products.Description' |
		И в таблице 'SettingsComposerSettingsOrder' из выпадающего списка с именем 'SettingsComposerSettingsOrderField' я выбираю точное значение 'Products.Product ID'
		И в таблице 'SettingsComposerSettingsOrder' я завершаю редактирование строки
		И я нажимаю на кнопку с именем 'Apply'
		Когда открылось окно '$WindowTitle$ *'
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R21C1'
		И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
		Тогда открылось окно "Dimension drill-down area settings"
		И я перехожу к закладке с именем 'SectionSort'
		И в таблице 'SettingsComposerSettingsOrder' я перехожу к строке:
			| "Field"                      |
			| 'Products.Description' |
		И в таблице 'SettingsComposerSettingsOrder' из выпадающего списка с именем 'SettingsComposerSettingsOrderField' я выбираю точное значение 'Products.Product ID'
		И в таблице 'SettingsComposerSettingsOrder' я завершаю редактирование строки
		И я нажимаю на кнопку с именем 'Apply'

	* Записываем бланк
		Тогда открылось окно '$WindowTitle$ *'
		И я нажимаю на кнопку с именем 'FormButtonWrite'

	* Сохраняем бланк
		Тогда открылось окно '$WindowTitle$'
		И я нажимаю на кнопку с именем 'Export'
		Тогда открылось окно "Save report template"
		И из выпадающего списка с именем 'ExternalIB' я выбираю по строке 'VA - Import from Excel'
		И в поле с именем 'ExportFileName' я ввожу текст '$КаталогПроекта$\Макеты\ВА_ИмпортExcel_Шаблон.xlsx'
		И из выпадающего списка с именем 'Periodicity' я выбираю точное значение "Month"
		И в поле с именем 'PeriodCount' я ввожу текст '3'
		И я нажимаю на кнопку с именем 'FormExport'
		Тогда открылось окно '$WindowTitle$'
		И Я закрываю окно '$WindowTitle$'
		Когда открылось окно "Report kinds and templates"
		И Я закрываю окно "Report kinds and templates"

	* Сравниваем файл
		И В командном интерфейсе я выбираю "Budgeting, reporting, and analysis" "Compare spreadsheet documents"
		Тогда открылось окно "Compare spreadsheet documents"
		И в поле с именем 'DocumentPath1' я ввожу текст '$КаталогПроекта$\Макеты\ВА_ИмпортExcel_Шаблон.xlsx'
		И в поле с именем 'DocumentPath2' я ввожу текст '$КаталогПроекта$\Макеты\ВА_ИмпортExcel_Шаблон.mxl'
		И я устанавливаю флаг с именем 'AreOnlyValuesCompared'
		И я устанавливаю флаг с именем 'ShouldCompareByTemplate'								
		И я нажимаю на кнопку с именем 'FormCompareDocs'
		Тогда открылось окно "Documents are identical: Compare spreadsheet documents"
		И Я закрываю окно "Documents are identical: Compare spreadsheet documents"

Сценарий: 03.04 Создание экземпляра отчета - 'VA - ImportExcel'	и загрузка из файла

	И Я создаю экземпляр отчета для вида отчета 'VA - ImportExcel' сценарий 'VA - Main scenario' период '1/1/2021' '3/31/2021' периодичность "Month" организация 'Mercury LLC' проект '' аналитики '' '' '' '' '' '' 
	И я запоминаю текущее окно как 'WindowTitle'
		
	* Документ должен быть пуст
		Тогда табличный документ 'SpreadsheetFieldTemlate' равен:
			| 'VA - ImportExcel'          | ''                         | ''                                   | ''                                | ''                          | ''                        | ''                                       | ''                    | ''               | ''      | ''                | ''      | ''             | ''      |
			| ''                          | ''                         | ''                                   | ''                                | ''                          | ''                        | ''                                       | ''                    | ''               | ''      | ''                | ''      | ''             | ''      |
			| ''                          | 'Counterparties_Description' | 'Contracts_Description' | 'Product categories_Description' | 'Products_Description' | 'Cash flow items_Description' | 'Income and expense items_Description' | 'Currencies_Description' | 'January 2021' | ''      | 'February 2021' | ''      | 'March 2021' | ''      |
			| ''                          | ''                         | ''                                   | ''                                | ''                          | ''                        | ''                                       | ''                    | 'Count'     | 'Sum' | 'Count'      | 'Sum' | 'Count'   | 'Sum' |
			| 'String_Synthetic_1'        | ''                         | ''                                   | ''                                | ''                          | ''                        | ''                                       | ''                    | '0'              | '0'     | '0'               | '0'     | '0'            | '0'     |
			| 'Group_Synthetic'          | ''                         | ''                                   | ''                                | ''                          | ''                        | ''                                       | ''                    | '0'              | '0'     | '0'               | '0'     | '0'            | '0'     |
			| 'String_Synthetic_2'        | ''                         | ''                                   | ''                                | ''                          | ''                        | ''                                       | ''                    | '0'              | '0'     | '0'               | '0'     | '0'            | '0'     |
			| 'Group_Dimensions_0'        | ''                         | ''                                   | ''                                | ''                          | ''                        | ''                                       | ''                    | '0'              | '0'     | '0'               | '0'     | '0'            | '0'     |
			| 'Group_Dimensions_1_2'      | ''                         | ''                                   | ''                                | ''                          | ''                        | ''                                       | ''                    | '0'              | '0'     | '0'               | '0'     | '0'            | '0'     |
			| 'String_Dimensions_1'        | ''                         | ''                                   | ''                                | ''                          | ''                        | ''                                       | ''                    | '0'              | '0'     | '0'               | '0'     | '0'            | '0'     |
			| 'String_Dimensions_2'        | ''                         | ''                                   | ''                                | ''                          | ''                        | ''                                       | ''                    | '0'              | '0'     | '0'               | '0'     | '0'            | '0'     |
			| 'Group_Dimensions_6'        | ''                         | ''                                   | ''                                | ''                          | ''                        | ''                                       | ''                    | '0'              | '0'     | '0'               | '0'     | '0'            | '0'     |
			| 'String_Dimensions_6'        | ''                         | ''                                   | ''                                | ''                          | ''                        | ''                                       | ''                    | '0'              | '0'     | '0'               | '0'     | '0'            | '0'     |
			| 'Group_Currency'             | ''                         | ''                                   | ''                                | ''                          | ''                        | ''                                       | ''                    | '0'              | '0'     | '0'               | '0'     | '0'            | '0'     |
			| 'String_Dimensions_6_Currency' | ''                         | ''                                   | ''                                | ''                          | ''                        | ''                                       | ''                    | '0'              | '0'     | '0'               | '0'     | '0'            | '0'     |

	* Загружаем из шаблона
		Когда открылось окно '$WindowTitle$'
		И я нажимаю на кнопку с именем 'FormFillInUsingAnotherApproach'
		Тогда открылось окно "Select a filling method"
		И я перехожу к закладке с именем 'GroupPageImportFromFile'
		Если '$$LanguageИнтерфейса$$ = "Ru"' Тогда
			И в поле с именем 'PathToFile' я ввожу текст '$DirectoryПроекта$\Templates\VA_ImportExcel_Mercury.xlsx'
		Если '$$LanguageИнтерфейса$$ = "En"' Тогда
			И в поле с именем 'PathToFile' я ввожу текст '$КаталогПроекта$\Макеты\ВА_ИмпортExcel_Меркурий_En_En.xlsx'
		Тогда открылось окно "Select a filling method"
		И я нажимаю на кнопку с именем 'FillReport'
		Тогда открылось окно '$WindowTitle$'
		Дано Табличный документ 'SpreadsheetFieldTemlate' равен макету '\\Макеты\ВА_ИмпортExcel_Меркурий.mxl'	
		И я нажимаю на кнопку с именем 'WriteAndClose'
		И я жду закрытия окна '$WindowTitle$' в течение 20 секунд

Сценарий: 03.05 Повторная загрузка данных из файла

	И Я открываю первый экземпляр отчета для вида отчета 'VA - ImportExcel'
	Тогда Открылся экземпляр отчета для вида отчета 'VA - ImportExcel' валюта 'RUB' организация 'Mercury LLC' сценарий 'VA - Main scenario' периодичность "Month" проект '' аналитики '' '' '' '' '' '' 
	И я запоминаю текущее окно как 'WindowTitle'
	
	И я нажимаю на кнопку с именем 'EnableEdit'
	И я нажимаю на кнопку с именем 'FormFillInUsingAnotherApproach'
	Тогда открылось окно "Select a filling method"
	И я перехожу к закладке с именем 'GroupPageImportFromFile'
	Если '$$LanguageИнтерфейса$$ = "Ru"' Тогда
		И в поле с именем 'PathToFile' я ввожу текст '$DirectoryПроекта$\Templates\VA_ImportExcel_Mercury_2.xlsx'
	Если '$$LanguageИнтерфейса$$ = "En"' Тогда
		И в поле с именем 'PathToFile' я ввожу текст '$КаталогПроекта$\Макеты\ВА_ИмпортExcel_Меркурий_2_En_En.xlsx'	
	Тогда открылось окно "Select a filling method"
	И я нажимаю на кнопку с именем 'FillReport'
	Тогда открылось окно '$WindowTitle$ *'
	Дано Табличный документ 'SpreadsheetFieldTemlate' равен макету '\\Макеты\ВА_ИмпортExcel_Меркурий_2.mxl'	
	И я нажимаю на кнопку с именем 'WriteAndClose'
	И я жду закрытия окна '$WindowTitle$ *' в течение 20 секунд

	Тогда открылось окно "Report instances"
	И в таблице 'List' я выбираю текущую строку
	Тогда открылось окно '$WindowTitle$'
	И я нажимаю на кнопку с именем 'EnableEdit'
	И я нажимаю на кнопку с именем 'FormFillInUsingAnotherApproach'
	Тогда открылось окно "Select a filling method"
	И я перехожу к закладке с именем 'GroupPageImportFromFile'
	Если '$$LanguageИнтерфейса$$ = "Ru"' Тогда
		И в поле с именем 'PathToFile' я ввожу текст '$DirectoryПроекта$\Templates\VA_ImportExcel_Mercury.xlsx'
	Если '$$LanguageИнтерфейса$$ = "En"' Тогда
		И в поле с именем 'PathToFile' я ввожу текст '$КаталогПроекта$\Макеты\ВА_ИмпортExcel_Меркурий_En_En.xlsx'	
	Тогда открылось окно "Select a filling method"
	И я нажимаю на кнопку с именем 'FillReport'
	Тогда открылось окно '$WindowTitle$ *'
	Дано Табличный документ 'SpreadsheetFieldTemlate' равен макету '\\Макеты\ВА_ИмпортExcel_Меркурий.mxl'	
	И я нажимаю на кнопку с именем 'WriteAndClose'
	И я жду закрытия окна '$WindowTitle$ *' в течение 20 секунд
		
