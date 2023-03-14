﻿#language: ru

@tree

Функционал: 07. Работа с нечисловыми показателями 

Как Администратор я хочу
Проверить что виды отчетов с нечисловыми показателями расчитываются и записываются

Контекст: 

	И я подключаю TestClient "CPM - Budget" логин "Administrator" пароль ''	
	И я закрыл все окна клиентского приложения

Сценарий: 07.00 Определение типа приложения

	Пусть Инициализация переменных

Сценарий: 07.01 Создание группы отчетов "VA - Non-Numbers and Groupings (группа)"

	И Я создаю группу видов отчетов с именем "VA - Non-Numbers and Groupings (группа)" и родителем "VA - Report group"

Сценарий: 07.02 Создание вида отчета "VA - Non-Numbers (source)"

	И Я создаю вид отчета с именем "VA - Non-Numbers (source)" и родителем "VA - Non-Numbers and Groupings (группа)"
	
	И Я открываю вид отчета с именем "VA - Non-Numbers (source)"
	И я устанавливаю флаг с именем 'ProjectSeparation'		
	И я перехожу к закладке с именем 'DimensionsOfReport'
	И из выпадающего списка с именем 'DimensionType1' я выбираю по строке "VA0CFItems"				
	И я нажимаю на кнопку с именем 'FormButtonWrite'
	Когда открылось окно "Data restructuring"
	И я нажимаю на кнопку с именем 'FormOK'

	И я нажимаю на кнопку с именем 'EditTree'
	Когда открылось окно "Edit tree"

	И Я в конструкторе отчета добавляю строку с именем "Goods"

	И Я в конструкторе отчета добавляю колонку с именем "Price"
	И Я в конструкторе отчета добавляю колонку с именем "DateInflow"
	И Я в конструкторе отчета добавляю колонку с именем "IncludeInPrice"
	И Я в конструкторе отчета добавляю колонку с именем "Product ID"	

	И я в конструкторе отчета в ячейке 'R2C2' я меняю свойство показателя 'PeriodTotalCalcMethod' на "Total by period is not calculated"
	И я в конструкторе отчета в ячейке 'R2C2' я меняю свойство показателя 'TotalType' на "Average"
	И я в конструкторе отчета в ячейке 'R2C3' я меняю свойство показателя 'ValueType' на "Date"
	И я в конструкторе отчета в ячейке 'R2C3' я меняю свойство показателя 'TotalType' на "Minimum"
	И я в конструкторе отчета в ячейке 'R2C4' я меняю свойство показателя 'ValueType' на "Boolean"
	И я в конструкторе отчета в ячейке 'R2C4' я меняю свойство показателя 'PeriodTotalCalcMethod' на "Total by period is not calculated"		
	И я в конструкторе отчета в ячейке 'R2C4' я меняю свойство показателя 'TotalType' на "Cannot calculate the total by group drilldown"
	И я в конструкторе отчета в ячейке 'R2C5' я меняю свойство показателя 'ValueType' на "Line"
	И я в конструкторе отчета в ячейке 'R2C5' я меняю свойство показателя 'PeriodTotalCalcMethod' на "Total by period is not calculated"

	И Я в конструкторе отчета добавляю аналитику с кодом "VA0Product" в ячейку 'R2C3'

	И Я Для вида отчета "VA - Non-Numbers (source)" я создаю бланк по умолчанию
	И Я Для вида отчета "VA - Non-Numbers (source)" в бланке для группы раскрытия с адресом 'R8C1' задаю сортировку "Product range" "Product ID"

Сценарий: 07.03 Создание экземпляра отчета - "VA - Non-Numbers (source)" 

	И Я создаю экземпляр отчета для вида отчета "VA - Non-Numbers (source)" сценарий "VA - Main scenario" период '1/1/2021' '3/31/2021' периодичность "Month" организация "Mercury LLC" проект "VA - Main project" аналитики "3Software sale" '' '' '' '' '' 

	* Документ должен быть пустой
		Тогда табличный документ 'SpreadsheetFieldTemlate' равен:
			| "VA - Non-Numbers (source)" | ''               | ''                | ''               | ''        | ''                | ''                | ''               | ''        | ''             | ''                | ''               | ''        | ''      | ''                | ''               | ''        |
			| ''                                      | ''               | ''                | ''               | ''        | ''                | ''                | ''               | ''        | ''             | ''                | ''               | ''        | ''      | ''                | ''               | ''        |
			| ''                                      | "January 2021" | ''                | ''               | ''        | "February 2021" | ''                | ''               | ''        | "March 2021" | ''                | ''               | ''        | "TOTAL" | ''                | ''               | ''        |
			| ''                                      | "Price"           | "DateInflow" | "IncludeInPrice" | "Product ID" | "Price"            | "DateInflow" | "IncludeInPrice" | "Product ID" | "Price"         | "DateInflow" | "IncludeInPrice" | "Product ID" | "Price"  | "DateInflow" | "IncludeInPrice" | "Product ID" |
			| "Goods"                                | '0'              | ''                | "No"            | ''        | '0'               | ''                | "No"            | ''        | '0'            | ''                | "No"            | ''        | '0'     | ''                | "No"            | ''        |

	* Вводим значения показателей
		* Ввод цены
			И Я добавляю значения с раскрытием показателей в ячейку 'R6C2'
				| "VA0Product"                                                     | 'Value'        |
				| "4C:Enterprise 8.3 CORP. Server License (x86-64)"           | '180,000.00000'   |
				| "3C:Enterprise 8 CORP. Client license for 100 users" | '600,000.00000'   |
				| "5C:Corporate performance management"                                      | '1,250,000.00000' |
				| "2C:Corporation"                                                  | '2,050,000.00000' |
				| "1C:ERP. Corporate performance management"                                   | '1,950,000.00000' |
		* Ввод даты поступления в ячейке
			И Я ввожу значение '1/1/2021' в ячейку 'R7C3'
			И Я ввожу значение '2/1/2021' в ячейку 'R8C3'
			И Я ввожу значение '3/1/2021' в ячейку 'R9C3'
			И Я ввожу значение '4/1/2021' в ячейку 'R10C3'
			И Я ввожу значение '5/1/2021' в ячейку 'R11C3'
		* Ввод флага включение в прайс в ячейке
			И Я ввожу значение "Yes" в ячейку 'R7C4'
			И Я ввожу значение "Yes" в ячейку 'R8C4'
			И Я ввожу значение "Yes" в ячейку 'R9C4'
			И Я ввожу значение "Yes" в ячейку 'R10C4'
			И Я ввожу значение "Yes" в ячейку 'R11C4'
		* Ввод артикула в ячейке
			И Я ввожу значение '000001' в ячейку 'R7C5'
			И Я ввожу значение '000002' в ячейку 'R8C5'
			И Я ввожу значение '000003' в ячейку 'R9C5'
			И Я ввожу значение '000004' в ячейку 'R10C5'
			И Я ввожу значение '000005' в ячейку 'R11C5'
		* Ввод цены в ячейке
			И Я ввожу значение '2,145,000.00000' в ячейку 'R7C6'
			И Я ввожу значение '2,255,000.00000' в ячейку 'R8C6'
			И Я ввожу значение '198,000.00000' в ячейку 'R9C6'
			И Я ввожу значение '660,000.00000' в ячейку 'R10C6'
			И Я ввожу значение '1,375,000.00000' в ячейку 'R11C6'
		* Ввод даты поступления в форме
			И Я добавляю значения с раскрытием показателей в ячейку 'R6C7'
				| "VA0Product"                   | 'Value'   |
				| "5C:Corporate performance management"    | '5/2/2021' |
				| "1C:ERP. Corporate performance management" | '1/2/2021' |
		* Ввод флага включение в прайс в форме
			И Я добавляю значения с раскрытием показателей в ячейку 'R6C8'
				| "VA0Product"                   | 'Value' |
				| "5C:Corporate performance management"    | "Yes"       |
				| "1C:ERP. Corporate performance management" | "Yes"       |
				| "2C:Corporation"                | "No"      |
		* Ввод артикула в форме
			И Я добавляю значения с раскрытием показателей в ячейку 'R6C9'
				| "VA0Product"                   | 'Value' |
				| "1C:ERP. Corporate performance management" | '2000001'  |
				| "5C:Corporate performance management"    | '2000005'  |			
		* Копирование показателей
			Когда открылось окно '$WindowTitle$'
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R7C6:R11C6'
			И я нажимаю на кнопку с именем 'SpreadsheetFieldTemplateCopyDataOnRow'
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R7C7:R11C7'
			И я нажимаю на кнопку с именем 'SpreadsheetFieldTemplateCopyDataOnRow'
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R7C8:R11C8'
			И я нажимаю на кнопку с именем 'SpreadsheetFieldTemplateCopyDataOnRow'
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R7C9:R11C9'
			И я нажимаю на кнопку с именем 'SpreadsheetFieldTemplateCopyDataOnRow'

	* Сравниваем итоговый документ
		Когда открылось окно '$WindowTitle$'
		Тогда табличный документ 'SpreadsheetFieldTemlate' равен:
			| "VA - Non-Numbers (source)"                           | ''               | ''                | ''               | ''        | ''                | ''                | ''               | ''        | ''             | ''                | ''               | ''        | ''      | ''                | ''               | ''        |
			| ''                                                                | ''               | ''                | ''               | ''        | ''                | ''                | ''               | ''        | ''             | ''                | ''               | ''        | ''      | ''                | ''               | ''        |
			| ''                                                                | "January 2021" | ''                | ''               | ''        | "February 2021" | ''                | ''               | ''        | "March 2021" | ''                | ''               | ''        | "TOTAL" | ''                | ''               | ''        |
			| ''                                                                | "Price"           | "DateInflow" | "IncludeInPrice" | "Product ID" | "Price"            | "DateInflow" | "IncludeInPrice" | "Product ID" | "Price"         | "DateInflow" | "IncludeInPrice" | "Product ID" | "Price"  | "DateInflow" | "IncludeInPrice" | "Product ID" |
			| "Goods"                                                          | '1,206,000'      | '1/1/2021'      | "No"            | ''        | '1,326,600'       | '1/2/2021'      | "No"            | ''        | '1,326,600'    | '1/2/2021'      | "No"            | ''        | '0'     | '1/1/2021'      | "No"            | ''        |
			| "5C:Corporate performance management "                                      | '1,250,000'      | '1/1/2021'      | "Yes"             | '000001'  | '2,145,000'       | '5/2/2021'      | "Yes"             | '2000005' | '2,145,000'    | '5/2/2021'      | "Yes"             | '2000005' | '0'     | '1/1/2021'      | "No"            | ''        |
			| "2C:Corporation "                                                  | '2,050,000'      | '2/1/2021'      | "Yes"             | '000002'  | '2,255,000'       | ''                | "No"            | ''        | '2,255,000'    | ''                | "No"            | ''        | '0'     | '2/1/2021'      | "No"            | ''        |
			| "4C:Enterprise 8.3 CORP. Server License (x86-64) "           | '180,000'        | '3/1/2021'      | "Yes"             | '000003'  | '198,000'         | ''                | "No"            | ''        | '198,000'      | ''                | "No"            | ''        | '0'     | '3/1/2021'      | "No"            | ''        |
			| "1C:ERP. Corporate performance management "                                   | '1,950,000'      | '4/1/2021'      | "Yes"             | '000004'  | '660,000'         | '1/2/2021'      | "Yes"             | '2000001' | '660,000'      | '1/2/2021'      | "Yes"             | '2000001' | '0'     | '1/2/2021'      | "No"            | ''        |
			| "3C:Enterprise 8 CORP. Client license for 100 users " | '600,000'        | '5/1/2021'      | "Yes"             | '000005'  | '1,375,000'       | ''                | "No"            | ''        | '1,375,000'    | ''                | "No"            | ''        | '0'     | '5/1/2021'      | "No"            | ''        |

	* Записываем документ	
		Когда открылось окно '$WindowTitle$'
		И я нажимаю на кнопку с именем 'WriteAndClose'
		И я жду закрытия окна '$WindowTitle$' в течение 20 секунд			

Сценарий: 07.04 Создание вида отчета "VA - Non-Numbers (recipient)"

	И Я создаю вид отчета с именем "VA - Non-Numbers (recipient)" и родителем "VA - Non-Numbers and Groupings (группа)"
	
	И Я открываю вид отчета с именем "VA - Non-Numbers (recipient)"
	И я устанавливаю флаг с именем 'ProjectSeparation'		
	И я перехожу к закладке с именем 'DimensionsOfReport'
	И из выпадающего списка с именем 'DimensionType1' я выбираю по строке "VA0CFItems"				
	И я нажимаю на кнопку с именем 'FormButtonWrite'
	Когда открылось окно "Data restructuring"
	И я нажимаю на кнопку с именем 'FormOK'

	И я нажимаю на кнопку с именем 'EditTree'
	Когда открылось окно "Edit tree"

	И Я в конструкторе отчета добавляю строку с именем "Goods"
	И Я в конструкторе отчета добавляю строку с именем "Formulas"
	И Я в конструкторе отчета добавляю строку с именем "Source"

	И Я в конструкторе отчета добавляю колонку с именем "Price"
	И Я в конструкторе отчета добавляю колонку с именем "DateInflow"
	И Я в конструкторе отчета добавляю колонку с именем "IncludeInPrice"
	И Я в конструкторе отчета добавляю колонку с именем "Product ID"

	И я в конструкторе отчета в ячейке 'R2C3:R4C3' я меняю свойства показателей 'ValueType' на "Date"
	И я в конструкторе отчета в ячейке 'R2C4:R4C4' я меняю свойства показателей 'ValueType' на "Boolean"
	И я в конструкторе отчета в ячейке 'R2C5:R4C5' я меняю свойства показателей 'ValueType' на "Line"

	И Я в конструкторе отчета добавляю аналитику с кодом "VA0Product" в ячейку 'R2C3'
	Когда открылось окно "Edit tree"
	И я нажимаю на кнопку с именем 'CopyAndShiftDown1'
					
	* Устанавливаем формулы расчета
		Когда открылось окно "Edit tree"
		И из выпадающего списка с именем 'WorkMode' я выбираю точное значение "Indicators calculation formulas"
		* Товары
			* Цена			
				И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R2C2'
				И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
				И я нажимаю на кнопку с именем 'RefToIndicator1'
				И Я выбираю показатель с кодом "Goods_Price" вида отчета "VA - Non-Numbers (source)"
				Тогда открылось окно "Edit tree *"
				И я нажимаю на кнопку с именем 'WriteAndCollapse'
			* ДатаПоступления		
				Тогда открылось окно "Edit tree"
				И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R2C3'
				И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
				И я нажимаю на кнопку с именем 'AddOperand1'
				Тогда открылось окно "Data sources"
				И я нажимаю на кнопку с именем 'FormCreate'
				Тогда открылось окно "Data source (create)"
				И из выпадающего списка с именем 'ReportTypeFilter' я выбираю по строке "VA - Non-Numbers (source)"
				И я нажимаю кнопку выбора у поля с именем 'IndicatorFilter'
				И Я выбираю показатель с кодом "Goods_DateInflow"
				Тогда открылось окно "Data source (create) *"
				И я нажимаю на кнопку с именем 'FormWriteAndClose'
				И я жду закрытия окна "Data source (create) *" в течение 20 секунд
				Тогда открылось окно "Data sources"
				И в таблице 'List' я выбираю текущую строку
				Тогда открылось окно "Edit tree *"
				И я нажимаю на кнопку с именем 'WriteAndCollapse'
			* ВключатьВПрайс			
				Тогда открылось окно "Edit tree"
				И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R2C4'
				И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
				И я нажимаю на кнопку с именем 'RefToIndicator1'
				И Я выбираю показатель с кодом "Goods_IncludeInPrice" вида отчета "VA - Non-Numbers (source)"
				Тогда открылось окно "Edit tree *"
				И я нажимаю на кнопку с именем 'WriteAndCollapse'
			* Артикул
				Тогда открылось окно "Edit tree"
				И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R2C5'
				И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
				И я нажимаю на кнопку с именем 'RefToIndicator1'
				И Я выбираю показатель с кодом "Goods_ProductID" вида отчета "VA - Non-Numbers (source)"
				Тогда открылось окно "Edit tree *"
				И я нажимаю на кнопку с именем 'WriteAndCollapse'
		* Формулы
			* Цена
				* Добавляем источники
					Когда открылось окно "Edit tree"
					И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R3C2'
					И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
					И я нажимаю на кнопку с именем 'AddOperand1'
					Тогда открылось окно "Data sources"
					И я нажимаю на кнопку с именем 'FormCreate'
					Тогда открылось окно "Data source (create)"
					И из выпадающего списка с именем 'ReportTypeFilter' я выбираю по строке "VA - Non-Numbers (source)"
					И я нажимаю кнопку выбора у поля с именем 'IndicatorFilter'
					И Я выбираю показатель с кодом "Goods_Price"
					Тогда открылось окно "Data source (create) *"
					И я нажимаю на кнопку с именем 'FormWriteAndClose'
					И я жду закрытия окна "Data source (create) *" в течение 20 секунд
					Тогда открылось окно "Data sources"
					И я нажимаю на кнопку с именем 'FormCreate'
					Тогда открылось окно "Data source (create)"
					И из выпадающего списка с именем 'ReportTypeFilter' я выбираю точное значение "VA - Non-Numbers (source)"
					И я нажимаю кнопку выбора у поля с именем 'IndicatorFilter'
					И Я выбираю показатель с кодом "Goods_IncludeInPrice"
					Тогда открылось окно "Data source (create) *"
					И я нажимаю на кнопку с именем 'FormWriteAndClose'
					И я жду закрытия окна "Data source (create) *" в течение 20 секунд
					Тогда открылось окно "Data sources"
					И Я закрываю окно "Data sources"
				* Вводим формулу
					Когда открылось окно "Edit tree"
					И в поле с именем 'TextDocumentFieldProcedure' я ввожу текст " ?([VANonNumbersSource_Goods_IncludeInPrice01],[VANonNumbersSource_Goods_Price01],-1) "
					И я нажимаю на кнопку с именем 'WriteAndCollapse'
			* ДатаПоступления
				* Добавляем источники
					Когда открылось окно "Edit tree"
					И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R3C3'
					И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
					И я нажимаю на кнопку с именем 'AddOperand1'					
					Тогда открылось окно "Data sources"
					И я нажимаю на кнопку с именем 'FormCreate'
					Тогда открылось окно "Data source (create)"
					И из выпадающего списка с именем 'ReportTypeFilter' я выбираю по строке "VA - Non-Numbers (source)"
					И я нажимаю кнопку выбора у поля с именем 'IndicatorFilter'
					И Я выбираю показатель с кодом "Goods_DateInflow"
					Тогда открылось окно "Data source (create) *"
					И я нажимаю на кнопку с именем 'FormWriteAndClose'
					И я жду закрытия окна "Data source (create) *" в течение 20 секунд
					Тогда открылось окно "Data sources"
					И в таблице 'List' я выбираю текущую строку
				* Вводим формулу
					Тогда открылось окно "Edit tree *"
					И в поле с именем 'TextDocumentFieldProcedure' я ввожу текст "[VANonNumbersSource_Goods_DateInflow01] + 86400"
					И я нажимаю на кнопку с именем 'WriteAndCollapse'
			* ВключатьВПрайс
				* Добавляем источники
					Когда открылось окно "Edit tree"
					И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R3C4'
					И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
					И я нажимаю на кнопку с именем 'AddOperand1'
					Тогда открылось окно "Data sources"
					И я нажимаю на кнопку с именем 'FormCreate'
					Тогда открылось окно "Data source (create)"
					И из выпадающего списка с именем 'ReportTypeFilter' я выбираю по строке "VA - Non-Numbers (source)"
					И я нажимаю кнопку выбора у поля с именем 'IndicatorFilter'
					И Я выбираю показатель с кодом "Goods_IncludeInPrice"
					Тогда открылось окно "Data source (create) *"
					И я нажимаю на кнопку с именем 'FormWriteAndClose'
					И я жду закрытия окна "Data source (create) *" в течение 20 секунд
					Тогда открылось окно "Data sources"
					И в таблице 'List' я выбираю текущую строку
				* Вводим формулу
					Тогда открылось окно "Edit tree *"
					И я нажимаю на кнопку с именем 'ArbitraryCode'
					И в поле с именем 'TextDocumentFieldProcedure' я ввожу текст "Result = NOT [VANonNumbersSource_Goods_IncludeInPrice02]"
					И я нажимаю на кнопку с именем 'WriteAndCollapse'
			* Артикул
				* Добавляем источники
					Когда открылось окно "Edit tree"
					И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R3C5'
					И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
					И я нажимаю на кнопку с именем 'RefToIndicator1'
					И Я выбираю показатель с кодом "Goods_ProductID" вида отчета "VA - Non-Numbers (source)"
					Тогда открылось окно "Edit tree *"
					И я нажимаю на кнопку с именем 'WriteFormula'
				* Вводим формулу
					Тогда открылось окно "Edit tree"
					И я нажимаю на кнопку с именем 'ArbitraryCode'
					И в поле с именем 'TextDocumentFieldProcedure' я ввожу текст 
						|"tString = [VANonNumbersSource_Goods_ProductID01];"|
						|'Result = "";'|
						|'For Cnt = 1 To StrLen(tString) Do'|
						|' Result = Сред(tString, Cnt, 1) + Result;'|
						|'EndDo; '|
					И я нажимаю на кнопку с именем 'WriteAndCollapse'	
		* Источник
			* Цена
				Когда открылось окно "Edit tree"
				И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R4C2'
				И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
				И я нажимаю на кнопку с именем 'AddOperand1'
				Тогда открылось окно "Data sources"
				И я нажимаю на кнопку с именем 'FormCreate'
				Тогда открылось окно "Data source (create)"
				И из выпадающего списка с именем 'ReceiptOption' я выбираю точное значение "Current infobase information register"
				И из выпадающего списка с именем 'DBInformationRegister' я выбираю по строке 'ProductPrices'
				И из выпадающего списка с именем 'SliceType' я выбираю точное значение "Slice of the last ones"
				И я перехожу к закладке с именем 'FiltersPage'
				И в таблице 'FieldsTreeDB' я разворачиваю текущую строку
				Если '$$IsCPM$$' Тогда 									
					И в таблице 'FieldsTreeDB' я перехожу к строке:
						| "Field"    |
						| "Price type" |
					И я нажимаю на кнопку с именем 'AddConditionItem'
					И в таблице 'TreeOfFilterParametersDB' я перехожу к строке:
						| "Field"      |
						| "[Price type]" |
				Если '$$IsERPCPM$$' Тогда
					И в таблице 'FieldsTreeDB' я перехожу к строке:
						| "Field"    |
						| 'Kind цены' |
					И я нажимаю на кнопку с именем 'AddConditionItem'
					И в таблице 'TreeOfFilterParametersDB' я перехожу к строке:
						| "Field"   |
						| 'KindЦены' | 
				И в таблице 'TreeOfFilterParametersDB' я активизирую поле с именем 'ParameterCalculationMethod'
				И в таблице 'TreeOfFilterParametersDB' я выбираю текущую строку
				И в таблице 'TreeOfFilterParametersDB' из выпадающего списка с именем 'ParameterCalculationMethod' я выбираю точное значение "Fixed value"
				И в таблице 'TreeOfFilterParametersDB' я активизирую поле с именем 'DefiningMethodClarification'
				И в таблице 'TreeOfFilterParametersDB' из выпадающего списка с именем 'DefiningMethodClarification' я выбираю по строке "VA - Products"										
				И я нажимаю на кнопку с именем 'FormWriteAndClose'
				И я жду закрытия окна "Data source (create) *" в течение 20 секунд
				Тогда открылось окно "Data sources"
				И в таблице 'List' я выбираю текущую строку
				Тогда открылось окно "Edit tree *"
				И я нажимаю на кнопку с именем 'WriteAndCollapse'
			* ДатаПоступления
				Когда открылось окно "Edit tree"
				И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R4C3'
				И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
				И я нажимаю на кнопку с именем 'AddOperand1'
				Тогда открылось окно "Data sources"
				И я нажимаю на кнопку с именем 'FormCreate'
				Тогда открылось окно "Data source (create)"
				И из выпадающего списка с именем 'ReceiptOption' я выбираю точное значение "Arbitrary query to current infobase"
				Если '$$IsCPM$$' Тогда 
					И в поле с именем 'QueryTextForm' я ввожу текст 
						|'SELECT'|
						|' BEGINOFPERIOD(ProductPrices.Period, MONTH) AS Period,'|
						|' MAX(DATEADD(BEGINOFPERIOD(ProductPrices.Period, MONTH), DAY, 3)) AS Date,'|
						|' ProductPrices.Products AS Products'|
						|'FROM'|
						|' InformationRegister.ProductPrices AS ProductPrices'|
						|'WHERE'|
						|' ProductPrices.PricesType = &PricesType'|
						|''|
						|'GROUP BY'|
						|' ProductPrices.Products,'|
						|' BEGINOFPERIOD(ProductPrices.Period, MONTH) '|
				Если '$$IsERPCPM$$' Тогда
					И в поле с именем 'QueryTextForm' я ввожу текст 
						|'SELECT'|
						|' BEGINOFPERIOD(ProductPrices.Period, MONTH) AS Period,'|
						|' MAX(DATEADD(BEGINOFPERIOD(ProductPrices.Period, MONTH), DAY, 3)) AS Date,'|
						|' ProductPrices.Products AS Products'|
						|'FROM'|
						|' InformationRegister.ProductPrices AS ProductPrices'|
						|'WHERE'|
						|' ProductPrices.KindЦены = &PricesType'|
						|''|
						|'GROUP BY'|
						|' ProductPrices.Products,'|
						|' BEGINOFPERIOD(ProductPrices.Period, MONTH) '|
				И я нажимаю на кнопку с именем 'EditQueryText'
				И я перехожу к закладке с именем 'DimensionsMap'
				И в таблице 'FieldsTreeDB' я разворачиваю строку:
					| "Field"                     |
					| "Data source fields(3)" |
				И в таблице 'FieldsTreeDB' я перехожу к строке:
					| "Field" |
					| 'Date' |
				И в таблице 'MappingTable' я перехожу к строке:
					| "Destination dimension" | "Column name" | "Filling method" |
					| 'Value'            | '[Period]'    | "Source field"    |
				И в таблице 'MappingTable' я активизирую поле с именем 'MapTableDBAlias'
				И я выбираю пункт контекстного меню с именем 'ButtonUnmap' на элементе формы с именем 'MappingTable'
				И я выбираю пункт контекстного меню с именем 'ButtonMapDimensions' на элементе формы с именем 'MappingTable'
				И я перехожу к закладке с именем 'FiltersPage'
				И в таблице 'TreeOfFilterParametersDB' я активизирую поле с именем 'ParameterCalculationMethod'
				И в таблице 'TreeOfFilterParametersDB' я выбираю текущую строку
				И в таблице 'TreeOfFilterParametersDB' из выпадающего списка с именем 'ParameterCalculationMethod' я выбираю точное значение "Fixed value"
				И в таблице 'TreeOfFilterParametersDB' я активизирую поле с именем 'DefiningMethodClarification'
				И в таблице 'TreeOfFilterParametersDB' из выпадающего списка с именем 'DefiningMethodClarification' я выбираю по строке "VA - Products"
				И в таблице 'TreeOfFilterParametersDB' я завершаю редактирование строки
				Когда открылось окно "Data source (create) *"
				И я нажимаю на кнопку с именем 'FormWriteAndClose'
				И я жду закрытия окна "Data source (create) *" в течение 20 секунд
				Тогда открылось окно "Data sources"
				И в таблице 'List' я выбираю текущую строку
				Тогда открылось окно "Edit tree *"
				И я нажимаю на кнопку с именем 'WriteAndCollapse'
			* ВключатьВПрайс
				Когда открылось окно "Edit tree"
				И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R4C4'
				И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
				И я нажимаю на кнопку с именем 'AddOperand1'
				Тогда открылось окно "Data sources"
				И я нажимаю на кнопку с именем 'FormCreate'
				Тогда открылось окно "Data source (create)"
				И из выпадающего списка с именем 'ReceiptOption' я выбираю точное значение "Arbitrary query to current infobase"
				И я изменяю флаг с именем 'ShouldUseMultiperiodContext'
				Если '$$ЭтоPerform$$' Тогда
					И в поле с именем 'QueryTextForm' я ввожу текст 
						|'SELECT'|
						|' Products.Ref IN(&CorporatePerformanceManagement) AS ЭтоУх,'|
						|' Products.Ref AS Ref'|
						|'FROM'|
						|' Catalog.Products AS Products'|
						|'WHERE'|
						|' Products.Parent = &ProductKind'|
						|' AND NOT Products.IsFolder'|
				Иначе
					И в поле с именем 'QueryTextForm' я ввожу текст 
						|'SELECT'|
						|' Products.Ref IN(&CorporatePerformanceManagement) AS ЭтоУх,'|
						|' Products.Ref AS Ref'|
						|'FROM'|
						|' Catalog.Products AS Products'|
						|'WHERE'|
						|' Products.ProductKind = &ProductKind'|
						|' AND NOT Products.IsFolder'|
				И я нажимаю на кнопку с именем 'EditQueryText'
				И я перехожу к закладке с именем 'DimensionsMap'
				И я перехожу к закладке с именем 'FiltersPage'				
				И в таблице 'TreeOfFilterParametersDB' я перехожу к строке:
					| "Field"              |
					| '[ProductKind]' |
				И в таблице 'TreeOfFilterParametersDB' я активизирую поле с именем 'ParameterCalculationMethod'
				И в таблице 'TreeOfFilterParametersDB' я выбираю текущую строку
				И в таблице 'TreeOfFilterParametersDB' из выпадающего списка с именем 'ParameterCalculationMethod' я выбираю точное значение "Fixed value"
				И в таблице 'TreeOfFilterParametersDB' я активизирую поле с именем 'DefiningMethodClarification'
				И в таблице 'TreeOfFilterParametersDB' я нажимаю кнопку выбора у реквизита с именем 'DefiningMethodClarification'
				Если '$$ЭтоPerform$$' Тогда
					Когда открылось окно "Product range"
					И Я закрываю окно "Product range"
				Если '$$IsERPCPM$$' Тогда
					Когда открылось окно "Виды номенклатуры"
					И Я закрываю окно "Виды номенклатуры"
				И в таблице 'TreeOfFilterParametersDB' из выпадающего списка с именем 'DefiningMethodClarification' я выбираю по строке "VA - Products"
				И в таблице 'TreeOfFilterParametersDB' я завершаю редактирование строки
				И в таблице 'TreeOfFilterParametersDB' я перехожу к строке:
					| "Field"                  |
					| '[CorporatePerformanceManagement]' |
				И в таблице 'TreeOfFilterParametersDB' я активизирую поле с именем 'ParameterCalculationMethod'
				И в таблице 'TreeOfFilterParametersDB' я выбираю текущую строку
				И в таблице 'TreeOfFilterParametersDB' из выпадающего списка с именем 'ParameterCalculationMethod' я выбираю точное значение "Fixed value list"
				И в таблице 'TreeOfFilterParametersDB' я активизирую поле с именем 'DefiningMethodClarification'
				И в таблице 'TreeOfFilterParametersDB' я нажимаю кнопку выбора у реквизита с именем 'DefiningMethodClarification'
				Тогда открылось окно "Edit value list*"
				И в таблице 'ValueList' я нажимаю на кнопку с именем 'ValueListAdd'
				Тогда открылось окно "Product range"
				И я нажимаю на кнопку с именем 'FormFind'
				Тогда открылась форма с именем 'UniversalListFindExtForm'
				И я меняю значение переключателя с именем 'CompareType' на "Exact match"
				И в поле с именем 'Pattern' я ввожу текст "5C:Corporate performance management"
				И я нажимаю на кнопку с именем 'Find'
				Тогда открылось окно "Product range"
				И в таблице 'List' я выбираю текущую строку
				Тогда открылось окно "Edit value list*"
				И в таблице 'ValueList' я завершаю редактирование строки
				И в таблице 'ValueList' я нажимаю на кнопку с именем 'ValueListAdd'
				Тогда открылось окно "Product range"
				И я нажимаю на кнопку с именем 'FormFind'
				Тогда открылась форма с именем 'UniversalListFindExtForm'
				И я меняю значение переключателя с именем 'CompareType' на "Exact match"
				И в поле с именем 'Pattern' я ввожу текст "1C:ERP. Corporate performance management"
				И я нажимаю на кнопку с именем 'Find'
				Тогда открылось окно "Product range"
				И в таблице 'List' я выбираю текущую строку
				Тогда открылось окно "Edit value list*"
				И в таблице 'ValueList' я завершаю редактирование строки
				И я нажимаю на кнопку с именем 'OK'
				Тогда открылось окно "Data source (create) *"
				И в таблице 'TreeOfFilterParametersDB' я завершаю редактирование строки
				И я нажимаю на кнопку с именем 'FormWriteAndClose'
				И я жду закрытия окна "Data source (create) *" в течение 20 секунд
				Тогда открылось окно "Data sources"
				И в таблице 'List' я выбираю текущую строку
				Тогда открылось окно "Edit tree *"
				И я нажимаю на кнопку с именем 'WriteAndCollapse'
			* Артикул
				Когда открылось окно "Edit tree"
				И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R4C5'
				И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
				И я нажимаю на кнопку с именем 'AddOperand1'
				Тогда открылось окно "Data sources"
				И я нажимаю на кнопку с именем 'FormCreate'
				Тогда открылось окно "Data source (create)"
				И из выпадающего списка с именем 'ReceiptOption' я выбираю точное значение "Current infobase catalog"
				И я нажимаю кнопку выбора у поля с именем 'DBObjects'
				И Я в списке "Infobase catalogs" по полю "Catalog" ищу элемент "Product range" "At beginning of line"
				Если '$$IsCPM$$' Тогда
					Если в таблице 'FieldsTreeDB' количество строк 'равно' 1 Тогда
						И в таблице 'FieldsTreeDB' я разворачиваю текущую строку
					И в таблице 'FieldsTreeDB' я перехожу к строке:
						| "Field"    |
						| "Product ID" |
				Если '$$IsERPCPM$$' Тогда
					И в таблице 'FieldsTreeDB' я перехожу к строке:
						| "Field"     |
						| 'ProductID ' |			
				И в таблице 'MappingTable' я перехожу к строке:
					| "Destination dimension" | "Column name" | "Filling method" |
					| 'Value'            | "[Code]"       | "Source field"    |
				И в таблице 'MappingTable' я активизирую поле с именем 'MapTableDBAlias'
				И я выбираю пункт контекстного меню с именем 'ButtonUnmap' на элементе формы с именем 'MappingTable'
				И я выбираю пункт контекстного меню с именем 'ButtonMapDimensions' на элементе формы с именем 'MappingTable'
				И я перехожу к закладке с именем 'FiltersPage'
				И Пока в таблице 'TreeOfFilterParametersDB' количество строк 'больше' 0 Тогда
					И я нажимаю на кнопку с именем 'TreeOfFilterParametersDBDelete'
				Если '$$IsCPM$$' Тогда
					И в таблице 'FieldsTreeDB' я перехожу к строке:
						| "Field"                  |
						| "Product range group" |
					И я нажимаю на кнопку с именем 'AddConditionItem'
					И в таблице 'TreeOfFilterParametersDB' я перехожу к строке:
						| "Field"                    |
						| "[Product range group]" |
					И в таблице 'TreeOfFilterParametersDB' я активизирую поле с именем 'ParameterCalculationMethod'
					И в таблице 'TreeOfFilterParametersDB' я выбираю текущую строку
					И в таблице 'TreeOfFilterParametersDB' из выпадающего списка с именем 'ParameterCalculationMethod' я выбираю точное значение "Fixed value"
					И в таблице 'TreeOfFilterParametersDB' я активизирую поле с именем 'DefiningMethodClarification'
					И в таблице 'TreeOfFilterParametersDB' из выпадающего списка с именем 'DefiningMethodClarification' я выбираю по строке "VA - Product range group"
				Если '$$IsERPCPM$$' Тогда
					И в таблице 'FieldsTreeDB' я перехожу к строке:
						| "Field"             |
						| 'Kind номенклатуры' |
					И я нажимаю на кнопку с именем 'AddConditionItem'
					И в таблице 'TreeOfFilterParametersDB' я перехожу к строке:
						| "Field"            |
						| 'ProductKind' |
					И в таблице 'TreeOfFilterParametersDB' я активизирую поле с именем 'ParameterCalculationMethod'
					И в таблице 'TreeOfFilterParametersDB' я выбираю текущую строку
					И в таблице 'TreeOfFilterParametersDB' из выпадающего списка с именем 'ParameterCalculationMethod' я выбираю точное значение "Fixed value"
					И в таблице 'TreeOfFilterParametersDB' я активизирую поле с именем 'DefiningMethodClarification'
					И в таблице 'TreeOfFilterParametersDB' из выпадающего списка с именем 'DefiningMethodClarification' я выбираю по строке "VA - Products"
				И я нажимаю на кнопку с именем 'FormWriteAndClose'
				И я жду закрытия окна "Data source (create) *" в течение 20 секунд
				Тогда открылось окно "Data sources"
				И в таблице 'List' я выбираю текущую строку
				Тогда открылось окно "Edit tree *"
				И я нажимаю на кнопку с именем 'WriteAndCollapse'	
				Когда открылось окно "Edit tree"
				И Я закрываю окно "Edit tree"																

	И Я Для вида отчета "VA - Non-Numbers (recipient)" я создаю бланк по умолчанию
	И Я Для вида отчета "VA - Non-Numbers (recipient)" в бланке для группы раскрытия с адресом 'R8C1' задаю сортировку "Product range" "Product ID"
	И Я Для вида отчета "VA - Non-Numbers (recipient)" в бланке для группы раскрытия с адресом 'R10C1' задаю сортировку "Product range" "Product ID"
	И Я Для вида отчета "VA - Non-Numbers (recipient)" в бланке для группы раскрытия с адресом 'R12C1' задаю сортировку "Product range" "Product ID"

Сценарий: 07.05 Создание экземпляра отчета - "VA - Non-Numbers (recipient)"  

	И Я создаю экземпляр отчета для вида отчета "VA - Non-Numbers (recipient)" сценарий "VA - Main scenario" период '1/1/2021' '3/31/2021' периодичность "Month" организация "Mercury LLC" проект "VA - Main project" аналитики "3Software sale" '' '' '' '' '' 

	* Рассчитываем документ и сравниваем итоговый документ
		И я нажимаю на кнопку с именем 'FormFillByDefault'
		Тогда табличный документ 'SpreadsheetFieldTemlate' равен:
			| "VA - Non-Numbers (recipient)"                           | ''               | ''                | ''               | ''              | ''                | ''                | ''               | ''              | ''             | ''                | ''               | ''              | ''           | ''                | ''               | ''        |
			| ''                                                                | ''               | ''                | ''               | ''              | ''                | ''                | ''               | ''              | ''             | ''                | ''               | ''              | ''           | ''                | ''               | ''        |
			| ''                                                                | "January 2021" | ''                | ''               | ''              | "February 2021" | ''                | ''               | ''              | "March 2021" | ''                | ''               | ''              | "TOTAL"      | ''                | ''               | ''        |
			| ''                                                                | "Price"           | "DateInflow" | "IncludeInPrice" | "Product ID"       | "Price"            | "DateInflow" | "IncludeInPrice" | "Product ID"       | "Price"         | "DateInflow" | "IncludeInPrice" | "Product ID"       | "Price"       | "DateInflow" | "IncludeInPrice" | "Product ID" |
			| "Goods"                                                          | '6,030,000'      | '5/1/2021'      | "Yes"             | ''              | '6,633,000'       | '5/2/2021'      | "Yes"             | ''              | '6,633,000'    | '5/2/2021'      | "Yes"             | ''              | '19,296,000' | '5/2/2021'      | "Yes"             | ''        |
			| "5C:Corporate performance management "                                      | '1,250,000'      | '1/1/2021'      | "Yes"             | '000001'        | '2,145,000'       | '5/2/2021'      | "Yes"             | '2000005'       | '2,145,000'    | '5/2/2021'      | "Yes"             | '2000005'       | '5,540,000'  | '5/2/2021'      | "Yes"             | ''        |
			| "2C:Corporation "                                                  | '2,050,000'      | '2/1/2021'      | "Yes"             | '000002'        | '2,255,000'       | ''                | "No"            | ''              | '2,255,000'    | ''                | "No"            | ''              | '6,560,000'  | '2/1/2021'      | "Yes"             | ''        |
			| "4C:Enterprise 8.3 CORP. Server License (x86-64) "           | '180,000'        | '3/1/2021'      | "Yes"             | '000003'        | '198,000'         | ''                | "No"            | ''              | '198,000'      | ''                | "No"            | ''              | '576,000'    | '3/1/2021'      | "Yes"             | ''        |
			| "1C:ERP. Corporate performance management "                                   | '1,950,000'      | '4/1/2021'      | "Yes"             | '000004'        | '660,000'         | '1/2/2021'      | "Yes"             | '2000001'       | '660,000'      | '1/2/2021'      | "Yes"             | '2000001'       | '3,270,000'  | '4/1/2021'      | "Yes"             | ''        |
			| "3C:Enterprise 8 CORP. Client license for 100 users " | '600,000'        | '5/1/2021'      | "Yes"             | '000005'        | '1,375,000'       | ''                | "No"            | ''              | '1,375,000'    | ''                | "No"            | ''              | '3,350,000'  | '5/1/2021'      | "Yes"             | ''        |
			| "Formulas"                                                         | '6,030,000'      | '5/2/2021'      | "No"            | ''              | '2,804,997'       | '5/3/2021'      | "Yes"             | ''              | '2,804,997'    | '5/3/2021'      | "No"            | ''              | '11,639,994' | '5/3/2021'      | "Yes"             | ''        |
			| "5C:Corporate performance management "                                      | '1,250,000'      | '1/2/2021'      | "No"            | '100000'        | '2,145,000'       | '5/3/2021'      | "No"            | '5000002'       | '2,145,000'    | '5/3/2021'      | "No"            | '5000002'       | '5,540,000'  | '5/3/2021'      | "No"            | ''        |
			| "2C:Corporation "                                                  | '2,050,000'      | '2/2/2021'      | "No"            | '200000'        | '-1'              | ''                | "Yes"             | ''              | '-1'           | ''                | "No"            | ''              | '2,049,998'  | '2/2/2021'      | "Yes"             | ''        |
			| "4C:Enterprise 8.3 CORP. Server License (x86-64) "           | '180,000'        | '3/2/2021'      | "No"            | '300000'        | '-1'              | ''                | "No"            | ''              | '-1'           | ''                | "No"            | ''              | '179,998'    | '3/2/2021'      | "No"            | ''        |
			| "1C:ERP. Corporate performance management "                                   | '1,950,000'      | '4/2/2021'      | "No"            | '400000'        | '660,000'         | '1/3/2021'      | "No"            | '1000002'       | '660,000'      | '1/3/2021'      | "No"            | '1000002'       | '3,270,000'  | '4/2/2021'      | "No"            | ''        |
			| "3C:Enterprise 8 CORP. Client license for 100 users " | '600,000'        | '5/2/2021'      | "No"            | '500000'        | '-1'              | ''                | "No"            | ''              | '-1'           | ''                | "No"            | ''              | '599,998'    | '5/2/2021'      | "No"            | ''        |
			| "Source"                                                        | '6,030,000'      | '1/4/2021'      | "Yes"             | ''              | '6,633,000'       | '2/4/2021'      | "Yes"             | ''              | '7,495,400'    | '3/4/2021'      | "Yes"             | ''              | '20,158,400' | '3/4/2021'      | "Yes"             | ''        |
			| "5C:Corporate performance management "                                      | '1,250,000'      | '1/4/2021'      | "Yes"             | '2900001871389' | '1,375,000'       | '2/4/2021'      | "Yes"             | '2900001871389' | '1,553,800'    | '3/4/2021'      | "Yes"             | '2900001871389' | '4,178,800'  | '3/4/2021'      | "Yes"             | ''        |
			| "2C:Corporation "                                                  | '2,050,000'      | '1/4/2021'      | "No"            | '2900001871419' | '2,255,000'       | '2/4/2021'      | "No"            | '2900001871419' | '2,548,200'    | '3/4/2021'      | "No"            | '2900001871419' | '6,853,200'  | '3/4/2021'      | "No"            | ''        |
			| "4C:Enterprise 8.3 CORP. Server License (x86-64) "           | '180,000'        | '1/4/2021'      | "No"            | '2900001916059' | '198,000'         | '2/4/2021'      | "No"            | '2900001916059' | '223,700'      | '3/4/2021'      | "No"            | '2900001916059' | '601,700'    | '3/4/2021'      | "No"            | ''        |
			| "1C:ERP. Corporate performance management "                                   | '1,950,000'      | '1/4/2021'      | "Yes"             | '2900001970198' | '2,145,000'       | '2/4/2021'      | "Yes"             | '2900001970198' | '2,423,900'    | '3/4/2021'      | "Yes"             | '2900001970198' | '6,518,900'  | '3/4/2021'      | "Yes"             | ''        |
			| "3C:Enterprise 8 CORP. Client license for 100 users " | '600,000'        | '1/4/2021'      | "No"            | '4601546106674' | '660,000'         | '2/4/2021'      | "No"            | '4601546106674' | '745,800'      | '3/4/2021'      | "No"            | '4601546106674' | '2,005,800'  | '3/4/2021'      | "No"            | ''        |
	
	* Еще раз рассчитываем и сравниваем документ, результат не должен поменяться
		Когда открылось окно '$WindowTitle$'
		И я нажимаю на кнопку с именем 'FormFillByDefault'
		Тогда табличный документ 'SpreadsheetFieldTemlate' равен:
			| "VA - Non-Numbers (recipient)"                           | ''               | ''                | ''               | ''              | ''                | ''                | ''               | ''              | ''             | ''                | ''               | ''              | ''           | ''                | ''               | ''        |
			| ''                                                                | ''               | ''                | ''               | ''              | ''                | ''                | ''               | ''              | ''             | ''                | ''               | ''              | ''           | ''                | ''               | ''        |
			| ''                                                                | "January 2021" | ''                | ''               | ''              | "February 2021" | ''                | ''               | ''              | "March 2021" | ''                | ''               | ''              | "TOTAL"      | ''                | ''               | ''        |
			| ''                                                                | "Price"           | "DateInflow" | "IncludeInPrice" | "Product ID"       | "Price"            | "DateInflow" | "IncludeInPrice" | "Product ID"       | "Price"         | "DateInflow" | "IncludeInPrice" | "Product ID"       | "Price"       | "DateInflow" | "IncludeInPrice" | "Product ID" |
			| "Goods"                                                          | '6,030,000'      | '5/1/2021'      | "Yes"             | ''              | '6,633,000'       | '5/2/2021'      | "Yes"             | ''              | '6,633,000'    | '5/2/2021'      | "Yes"             | ''              | '19,296,000' | '5/2/2021'      | "Yes"             | ''        |
			| "5C:Corporate performance management "                                      | '1,250,000'      | '1/1/2021'      | "Yes"             | '000001'        | '2,145,000'       | '5/2/2021'      | "Yes"             | '2000005'       | '2,145,000'    | '5/2/2021'      | "Yes"             | '2000005'       | '5,540,000'  | '5/2/2021'      | "Yes"             | ''        |
			| "2C:Corporation "                                                  | '2,050,000'      | '2/1/2021'      | "Yes"             | '000002'        | '2,255,000'       | ''                | "No"            | ''              | '2,255,000'    | ''                | "No"            | ''              | '6,560,000'  | '2/1/2021'      | "Yes"             | ''        |
			| "4C:Enterprise 8.3 CORP. Server License (x86-64) "           | '180,000'        | '3/1/2021'      | "Yes"             | '000003'        | '198,000'         | ''                | "No"            | ''              | '198,000'      | ''                | "No"            | ''              | '576,000'    | '3/1/2021'      | "Yes"             | ''        |
			| "1C:ERP. Corporate performance management "                                   | '1,950,000'      | '4/1/2021'      | "Yes"             | '000004'        | '660,000'         | '1/2/2021'      | "Yes"             | '2000001'       | '660,000'      | '1/2/2021'      | "Yes"             | '2000001'       | '3,270,000'  | '4/1/2021'      | "Yes"             | ''        |
			| "3C:Enterprise 8 CORP. Client license for 100 users " | '600,000'        | '5/1/2021'      | "Yes"             | '000005'        | '1,375,000'       | ''                | "No"            | ''              | '1,375,000'    | ''                | "No"            | ''              | '3,350,000'  | '5/1/2021'      | "Yes"             | ''        |
			| "Formulas"                                                         | '6,030,000'      | '5/2/2021'      | "No"            | ''              | '2,804,997'       | '5/3/2021'      | "Yes"             | ''              | '2,804,997'    | '5/3/2021'      | "No"            | ''              | '11,639,994' | '5/3/2021'      | "Yes"             | ''        |
			| "5C:Corporate performance management "                                      | '1,250,000'      | '1/2/2021'      | "No"            | '100000'        | '2,145,000'       | '5/3/2021'      | "No"            | '5000002'       | '2,145,000'    | '5/3/2021'      | "No"            | '5000002'       | '5,540,000'  | '5/3/2021'      | "No"            | ''        |
			| "2C:Corporation "                                                  | '2,050,000'      | '2/2/2021'      | "No"            | '200000'        | '-1'              | ''                | "Yes"             | ''              | '-1'           | ''                | "No"            | ''              | '2,049,998'  | '2/2/2021'      | "Yes"             | ''        |
			| "4C:Enterprise 8.3 CORP. Server License (x86-64) "           | '180,000'        | '3/2/2021'      | "No"            | '300000'        | '-1'              | ''                | "No"            | ''              | '-1'           | ''                | "No"            | ''              | '179,998'    | '3/2/2021'      | "No"            | ''        |
			| "1C:ERP. Corporate performance management "                                   | '1,950,000'      | '4/2/2021'      | "No"            | '400000'        | '660,000'         | '1/3/2021'      | "No"            | '1000002'       | '660,000'      | '1/3/2021'      | "No"            | '1000002'       | '3,270,000'  | '4/2/2021'      | "No"            | ''        |
			| "3C:Enterprise 8 CORP. Client license for 100 users " | '600,000'        | '5/2/2021'      | "No"            | '500000'        | '-1'              | ''                | "No"            | ''              | '-1'           | ''                | "No"            | ''              | '599,998'    | '5/2/2021'      | "No"            | ''        |
			| "Source"                                                        | '6,030,000'      | '1/4/2021'      | "Yes"             | ''              | '6,633,000'       | '2/4/2021'      | "Yes"             | ''              | '7,495,400'    | '3/4/2021'      | "Yes"             | ''              | '20,158,400' | '3/4/2021'      | "Yes"             | ''        |
			| "5C:Corporate performance management "                                      | '1,250,000'      | '1/4/2021'      | "Yes"             | '2900001871389' | '1,375,000'       | '2/4/2021'      | "Yes"             | '2900001871389' | '1,553,800'    | '3/4/2021'      | "Yes"             | '2900001871389' | '4,178,800'  | '3/4/2021'      | "Yes"             | ''        |
			| "2C:Corporation "                                                  | '2,050,000'      | '1/4/2021'      | "No"            | '2900001871419' | '2,255,000'       | '2/4/2021'      | "No"            | '2900001871419' | '2,548,200'    | '3/4/2021'      | "No"            | '2900001871419' | '6,853,200'  | '3/4/2021'      | "No"            | ''        |
			| "4C:Enterprise 8.3 CORP. Server License (x86-64) "           | '180,000'        | '1/4/2021'      | "No"            | '2900001916059' | '198,000'         | '2/4/2021'      | "No"            | '2900001916059' | '223,700'      | '3/4/2021'      | "No"            | '2900001916059' | '601,700'    | '3/4/2021'      | "No"            | ''        |
			| "1C:ERP. Corporate performance management "                                   | '1,950,000'      | '1/4/2021'      | "Yes"             | '2900001970198' | '2,145,000'       | '2/4/2021'      | "Yes"             | '2900001970198' | '2,423,900'    | '3/4/2021'      | "Yes"             | '2900001970198' | '6,518,900'  | '3/4/2021'      | "Yes"             | ''        |
			| "3C:Enterprise 8 CORP. Client license for 100 users " | '600,000'        | '1/4/2021'      | "No"            | '4601546106674' | '660,000'         | '2/4/2021'      | "No"            | '4601546106674' | '745,800'      | '3/4/2021'      | "No"            | '4601546106674' | '2,005,800'  | '3/4/2021'      | "No"            | ''        |

	* Записываем документ	
		Когда открылось окно '$WindowTitle$'
		И я нажимаю на кнопку с именем 'WriteAndClose'
		И я жду закрытия окна '$WindowTitle$' в течение 20 секунд			

Сценарий: 07.06 Создание вида отчета "VA - Calculation in code"

	И Я создаю вид отчета с именем "VA - Calculation in code" и родителем "VA - Non-Numbers and Groupings (группа)"
	И Я открываю вид отчета с именем "VA - Calculation in code"
	И я устанавливаю флаг с именем 'ProjectSeparation'		
	И я нажимаю на кнопку с именем 'FormButtonWrite'

	И я нажимаю на кнопку с именем 'EditTree'
	Когда открылось окно "Edit tree"
	И Я в конструкторе отчета добавляю строку с именем "Source"
	И Я в конструкторе отчета добавляю строку с именем "SourceCode"
	И Я в конструкторе отчета добавляю строку с именем "DestinationCode"
	И Я в конструкторе отчета добавляю строку с именем "FormulasCode"
	И Я в конструкторе отчета добавляю строку с именем "Calculation"
	И Я в конструкторе отчета добавляю колонку с именем "Number"
	И Я в конструкторе отчета добавляю колонку с именем "Date"
	И Я в конструкторе отчета добавляю колонку с именем "Boolean"
	И Я в конструкторе отчета добавляю колонку с именем "Line"

	И Я в конструкторе отчета в ячейке 'R2C3:R6C3' я меняю свойства показателей 'ValueType' на "Date"
	И Я в конструкторе отчета в ячейке 'R2C4:R6C4' я меняю свойства показателей 'ValueType' на "Boolean"
	И Я в конструкторе отчета в ячейке 'R2C5:R6C5' я меняю свойства показателей 'ValueType' на "Line"	

	* Устанавливаем аналитики отчета
		И Я в конструкторе отчета добавляю аналитику с кодом "VA0Product" в ячейку 'R2C2'
		Когда открылось окно "Edit tree"
		И я нажимаю на кнопку с именем 'CopyDimension'
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R6C2'
		И я нажимаю на кнопку с именем 'InsertDimension'

	* Устанавливаем формулы расчета
		Когда открылось окно "Edit tree"
		И из выпадающего списка с именем 'WorkMode' я выбираю точное значение "Indicators calculation formulas"
		* Источник
			* Число
				Когда открылось окно "Edit tree"
				И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R2C2'
				И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
				И я нажимаю на кнопку с именем 'RefToIndicator1'
				И Я выбираю показатель с кодом "Goods_Price" вида отчета "VA - Non-Numbers (source)"
				Тогда открылось окно "Edit tree *"
				И я нажимаю на кнопку с именем 'WriteAndCollapse'
			* Дата
				Когда открылось окно "Edit tree"
				И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R2C3'
				И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
				И я нажимаю на кнопку с именем 'RefToIndicator1'
				И Я выбираю показатель с кодом "Goods_DateInflow" вида отчета "VA - Non-Numbers (source)"
				Тогда открылось окно "Edit tree *"
				И я нажимаю на кнопку с именем 'WriteAndCollapse'
			* Булево
				Когда открылось окно "Edit tree"
				И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R2C4'
				И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
				И я нажимаю на кнопку с именем 'RefToIndicator1'
				И Я выбираю показатель с кодом "Goods_IncludeInPrice" вида отчета "VA - Non-Numbers (source)"
				Тогда открылось окно "Edit tree *"
				И я нажимаю на кнопку с именем 'WriteAndCollapse'
			* Строка
				Когда открылось окно "Edit tree"
				И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R2C5'
				И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
				И я нажимаю на кнопку с именем 'RefToIndicator1'
				И Я выбираю показатель с кодом "Goods_ProductID" вида отчета "VA - Non-Numbers (source)"
				Тогда открылось окно "Edit tree *"
				И я нажимаю на кнопку с именем 'WriteAndCollapse'
		* ИсточникКод
			* Число
				Когда открылось окно "Edit tree"
				И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R3C2'
				И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
				И я нажимаю на кнопку с именем 'ArbitraryCode'
				И я нажимаю на кнопку с именем 'EditProcedure'
				Тогда открылось окно "VA - Calculation in code: Calculation formula"
				И в поле с именем 'TextDocumentFieldProcedure' я ввожу текст 
					|'ArrayIndicators = New Array;'|
					|"ArrayIndicators.Add(\"VANonNumbersSource:Goods_Price\");"|
					|'AdditionalParameters = New Structure("GrandTotal",Enums.IndicatorTotalsTypes.Sum);'|
					|'tIndicatorsValues = GetIndicatorsValue(New Structure("ReportsIndicators,Currency,ReportPeriod",ArrayIndicators,SettlementObject.MainCurrency,SettlementObject.ReportPeriod),,AdditionalParameters);'|
					|''|
					|'If tIndicatorsValues.Count() = 0 Then'|
					|' Result = 0;'|
					|'Else'|
					|' Result = tIndicatorsValues.Get(0).Value;'|
					|'EndIf;'|
				И я нажимаю на кнопку с именем 'FormWriteAndClose'
				Тогда открылось окно "1C:Enterprise"
				И я нажимаю на кнопку с именем 'Button0'
				Тогда открылось окно "Edit tree"
				И я нажимаю на кнопку с именем 'WriteAndCollapse'
			* Дата
				Когда открылось окно "Edit tree"
				И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R3C3'
				И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
				И я нажимаю на кнопку с именем 'ArbitraryCode'
				И в поле с именем 'TextDocumentFieldProcedure' я ввожу текст 
					|'ArrayIndicators = New Array;'|
					|"ArrayIndicators.Add(\"VANonNumbersSource:Goods_DateInflow\");"|
					|'tIndicatorsValues = GetIndicatorsValue(New Structure("ReportsIndicators,Currency,ReportPeriod",ArrayIndicators,SettlementObject.MainCurrency,SettlementObject.ReportPeriod));'|
					|''|
					|'If tIndicatorsValues.Count() = 0 Then'|
					|' Result = Undefined;'|
					|'Else'|
					|' Result = tIndicatorsValues.Get(0).ValueNonNumeric;'|
					|'EndIf;'|
					|''|
				И я нажимаю на кнопку с именем 'WriteAndCollapse'
			* Булево
				Когда открылось окно "Edit tree"
				И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R3C4'
				И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
				И в поле с именем 'TextDocumentFieldProcedure' я ввожу текст
					|'ArrayIndicators = New Array;'|
					|"ArrayIndicators.Add(\"VANonNumbersSource:Goods_IncludeInPrice\");"|
					|'tIndicatorsValues = GetIndicatorsValue(New Structure("ReportsIndicators,Currency,ReportPeriod",ArrayIndicators,SettlementObject.MainCurrency,SettlementObject.ReportPeriod));'|
					|''|
					|'If tIndicatorsValues.Count() = 0 Then'|
					|' Result = Undefined;'|
					|'Else'|
					|' Result = tIndicatorsValues.Get(0).ValueNonNumeric;'|
					|'EndIf;'|
				И я нажимаю на кнопку с именем 'ArbitraryCode'
				И я нажимаю на кнопку с именем 'WriteAndCollapse'
			* Строка
				Когда открылось окно "Edit tree"
				И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R3C5'
				И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
				И в поле с именем 'TextDocumentFieldProcedure' я ввожу текст 
					|'ArrayIndicators = New Array;'|
					|"ArrayIndicators.Add(\"VANonNumbersSource:Goods_ProductID\");"|
					|'tIndicatorsValues = GetIndicatorsValue(New Structure("ReportsIndicators,Currency,ReportPeriod",ArrayIndicators,SettlementObject.MainCurrency,SettlementObject.ReportPeriod));'|
					|''|
					|'If tIndicatorsValues.Count() = 0 Then'|
					|' Result = Undefined;'|
					|'Else'|
					|' Result = tIndicatorsValues.Get(0).ValueNonNumeric;'|
					|'EndIf;'|
				И я нажимаю на кнопку с именем 'ArbitraryCode'
				И я нажимаю на кнопку с именем 'WriteAndCollapse'
		* ПриемникКод
			* Число
				Когда открылось окно "Edit tree"
				И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R4C2'
				И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
				И в поле с именем 'TextDocumentFieldProcedure' я ввожу текст
					|'ArrayIndicators = New Array;'|
					|"ArrayIndicators.Add(\"VACalculationInCode:Source_Number\");"|
					|'AdditionalParameters = New Structure("GrandTotal",Enums.IndicatorTotalsTypes.Sum);'|
					|'tIndicatorsValues = GetIndicatorsValue(New Structure("ReportsIndicators,Currency,ReportPeriod",ArrayIndicators,SettlementObject.MainCurrency,SettlementObject.ReportPeriod),,AdditionalParameters);'|
					|''|
					|'If tIndicatorsValues.Count() = 0 Then'|
					|' Result = 0;'|
					|'Else'|
					|' Result = tIndicatorsValues.Get(0).Value;'|
					|'EndIf;'|
				И я нажимаю на кнопку с именем 'ArbitraryCode'
				И я нажимаю на кнопку с именем 'WriteAndCollapse'
			* Дата
				Когда открылось окно "Edit tree"
				И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R4C3'
				И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
				И в поле с именем 'TextDocumentFieldProcedure' я ввожу текст
					|'ArrayIndicators = New Array;'|
					|"ArrayIndicators.Add(\"VACalculationInCode:Source_Date\");"|
					|'tIndicatorsValues = GetIndicatorsValue(New Structure("ReportsIndicators,Currency,ReportPeriod",ArrayIndicators,SettlementObject.MainCurrency,SettlementObject.ReportPeriod));'|
					|''|
					|'If tIndicatorsValues.Count() = 0 Then'|
					|' Result = Undefined;'|
					|'Else'|
					|' Result = tIndicatorsValues.Get(0).ValueNonNumeric;'|
					|'EndIf;'|
				И я нажимаю на кнопку с именем 'ArbitraryCode'
				И я нажимаю на кнопку с именем 'WriteAndCollapse'
			* Булево
				Когда открылось окно "Edit tree"
				И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R4C4'
				И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
				И в поле с именем 'TextDocumentFieldProcedure' я ввожу текст 
					|'ArrayIndicators = New Array;'|
					|"ArrayIndicators.Add(\"VACalculationInCode:Source_Boolean\");"|
					|'tIndicatorsValues = GetIndicatorsValue(New Structure("ReportsIndicators,Currency,ReportPeriod",ArrayIndicators,SettlementObject.MainCurrency,SettlementObject.ReportPeriod));'|
					|''|
					|'If tIndicatorsValues.Count() = 0 Then'|
					|' Result = Undefined;'|
					|'Else'|
					|' Result = tIndicatorsValues.Get(0).ValueNonNumeric;'|
					|'EndIf;'|
				И я нажимаю на кнопку с именем 'ArbitraryCode'
				И я нажимаю на кнопку с именем 'WriteAndCollapse'
			* Строка
				Когда открылось окно "Edit tree"
				И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R4C5'
				И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
				И в поле с именем 'TextDocumentFieldProcedure' я ввожу текст 
					|'ArrayIndicators = New Array;'|
					|"ArrayIndicators.Add(\"VACalculationInCode:Source_Line\");"|
					|'tIndicatorsValues = GetIndicatorsValue(New Structure("ReportsIndicators,Currency,ReportPeriod",ArrayIndicators,SettlementObject.MainCurrency,SettlementObject.ReportPeriod));'|
					|''|
					|'If tIndicatorsValues.Count() = 0 Then'|
					|' Result = Undefined;'|
					|'Else'|
					|' Result = tIndicatorsValues.Get(0).ValueNonNumeric;'|
					|'EndIf;'|
				И я нажимаю на кнопку с именем 'ArbitraryCode'
				И я нажимаю на кнопку с именем 'WriteAndCollapse'
		* ФормулыКод
			* Число
				Когда открылось окно "Edit tree"
				И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R5C2'
				И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
				И в поле с именем 'TextDocumentFieldProcedure' я ввожу текст 'Result = Month(SettlementObject.ReportPeriod.StartDate);'
				И я нажимаю на кнопку с именем 'ArbitraryCode'
				И я нажимаю на кнопку с именем 'WriteAndCollapse'
			* Дата
				Когда открылось окно "Edit tree"
				И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R5C3'
				И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
				И в поле с именем 'TextDocumentFieldProcedure' я ввожу текст 'Result = RelativePeriod(SettlementObject.ReportPeriod, -1).StartDate;'
				И я нажимаю на кнопку с именем 'ArbitraryCode'
				И я нажимаю на кнопку с именем 'WriteAndCollapse'
			* Булево
				Когда открылось окно "Edit tree"
				И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R5C4'
				И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
				И в поле с именем 'TextDocumentFieldProcedure' я ввожу текст 'Result = DateBelongsToPeriod(SettlementObject.ReportPeriod.StartDate, SettlementObject.PeriodsArray.Get(0));'
				И я нажимаю на кнопку с именем 'ArbitraryCode'
				И я нажимаю на кнопку с именем 'WriteAndCollapse'
			* Строка
				Когда открылось окно "Edit tree"
				И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R5C5'
				И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
				И в поле с именем 'TextDocumentFieldProcedure' я ввожу текст 
					|'Result = String(SettlementObject.Organization) + Chars.LF +'|
					|'String(SettlementObject.Scenario) + Chars.LF + '|
					|'String(SettlementObject.MainCurrency) + Chars.LF + '|
					|'String(SettlementObject.ReportPeriod) + Chars.LF + '|
					|'String(SettlementObject.Periodicity);'|
					|''|
				И я нажимаю на кнопку с именем 'ArbitraryCode'
				И я нажимаю на кнопку с именем 'WriteAndCollapse'
		* Расчет
			* Число
				Когда открылось окно "Edit tree"
				И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R6C2'
				И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
				И я нажимаю на кнопку с именем 'AddOperand1'
				Тогда открылось окно "Data sources"
				И я нажимаю на кнопку с именем 'FormCreate'
				Тогда открылось окно "Data source (create)"
				И из выпадающего списка с именем 'ReceiptOption' я выбираю точное значение "Current infobase report item indicator"
				И из выпадающего списка с именем 'ReportTypeFilter' я выбираю по строке "VA - Calculation in code"
				И я нажимаю кнопку выбора у поля с именем 'IndicatorFilter'
				И Я выбираю показатель с кодом "Source_Number"
				Тогда открылось окно "Data source (create) *"
				И я нажимаю на кнопку с именем 'FormWriteAndClose'
				И я жду закрытия окна "Data source (create) *" в течение 20 секунд
				Тогда открылось окно "Data sources"
				И в таблице 'List' я выбираю текущую строку
				Тогда открылось окно "Edit tree *"
				И я нажимаю на кнопку с именем 'ButtonMultiply'
				И я нажимаю на кнопку с именем 'AddOperand1'
				Тогда открылось окно "Data sources"
				И я нажимаю на кнопку с именем 'FormCreate'
				Тогда открылось окно "Data source (create)"
				И из выпадающего списка с именем 'ReceiptOption' я выбираю точное значение "Current infobase report item indicator"
				И из выпадающего списка с именем 'ReportTypeFilter' я выбираю по строке "VA - Calculation in code"
				И я нажимаю кнопку выбора у поля с именем 'IndicatorFilter'
				И Я выбираю показатель с кодом "FormulasCode_Number"
				Тогда открылось окно "Data source (create) *"
				И в таблице 'MappingTable' я активизирую поле с именем 'MappingTableFillingMethod'
				И в таблице 'MappingTable' я выбираю текущую строку
				И в таблице 'MappingTable' из выпадающего списка с именем 'MappingTableFillingMethod' я выбираю точное значение "Another source field"
				И в таблице 'MappingTable' я завершаю редактирование строки
				И в таблице 'MappingTable' я активизирую поле с именем 'MapTableDBAlias'
				И в таблице 'MappingTable' я выбираю текущую строку
				Тогда открылось окно "Data sources"
				И в таблице 'List' я выбираю текущую строку
				Тогда открылось окно "Data source (create) *"
				И я нажимаю на кнопку с именем 'FormWriteAndClose'
				И я жду закрытия окна "Data source (create) *" в течение 20 секунд
				Тогда открылось окно "Data sources"
				И в таблице 'List' я выбираю текущую строку
				Тогда открылось окно "Edit tree *"
				И я нажимаю на кнопку с именем 'WriteAndCollapse'
			* Дата
				Когда открылось окно "Edit tree"
				И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R6C3'
				И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
				И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R2C3'
				И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
				И я нажимаю на кнопку с именем 'WriteFormula'
				Тогда открылось окно "Edit tree"
				И я нажимаю на кнопку с именем 'ArbitraryCode'
				И в поле с именем 'TextDocumentFieldProcedure' я ввожу текст "Result = AddMonth([VACalculationInCode_Source_Date],1) "
				И я нажимаю на кнопку с именем 'WriteAndCollapse'
			* Булево
				Когда открылось окно "Edit tree"
				И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R6C4'
				И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
				И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R2C4'
				И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
				И я нажимаю на кнопку с именем 'WriteFormula'
				Тогда открылось окно "Edit tree"
				И в поле с именем 'TextDocumentFieldProcedure' я ввожу текст "NOT [VACalculationInCode_Source_Boolean]"
				И я нажимаю на кнопку с именем 'WriteAndCollapse'
			* Строка
				Когда открылось окно "Edit tree"
				И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R6C5'
				И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
				И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R2C5'
				И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
				И я нажимаю на кнопку с именем 'WriteFormula'
				Тогда открылось окно "Edit tree"
				И в поле с именем 'TextDocumentFieldProcedure' я ввожу текст "\"!!! \" + [VACalculationInCode_Source_Line]"
				И я нажимаю на кнопку с именем 'WriteAndCollapse'

	И Я Для вида отчета "VA - Calculation in code" я создаю бланк по умолчанию
	И Я Для вида отчета "VA - Calculation in code" в бланке для группы раскрытия с адресом 'R8C1' задаю сортировку "Product range" "Product ID"
	И Я Для вида отчета "VA - Calculation in code" в бланке для группы раскрытия с адресом 'R13C1' задаю сортировку "Product range" "Product ID"
																												
Сценарий: 07.07 Создание экземпляра отчета - "VA - Calculation in code" 

	И Я создаю экземпляр отчета для вида отчета "VA - Calculation in code" сценарий "VA - Main scenario" период '1/1/2021' '3/31/2021' периодичность "Month" организация "Mercury LLC" проект "VA - Main project" аналитики '' '' '' '' '' '' 

	* Рассчитываем документ и сверяем результат
		И я нажимаю на кнопку с именем 'FormFillByDefault'
		Тогда табличный документ 'SpreadsheetFieldTemlate' равен:
			| "VA - Calculation in code"                                              | ''               | ''           | ''       | ''                                                                 | ''                | ''           | ''       | ''                                                                  | ''             | ''           | ''       | ''                                                               | ''           | ''           | ''       | ''       |
			| ''                                                                | ''               | ''           | ''       | ''                                                                 | ''                | ''           | ''       | ''                                                                  | ''             | ''           | ''       | ''                                                               | ''           | ''           | ''       | ''       |
			| ''                                                                | "January 2021" | ''           | ''       | ''                                                                 | "February 2021" | ''           | ''       | ''                                                                  | "March 2021" | ''           | ''       | ''                                                               | "TOTAL"      | ''           | ''       | ''       |
			| ''                                                                | "Number"          | "Date"       | "Boolean" | "Line"                                                           | "Number"           | "Date"       | "Boolean" | "Line"                                                            | "Number"        | "Date"       | "Boolean" | "Line"                                                         | "Number"      | "Date"       | "Boolean" | "Line" |
			| "Source"                                                        | '6,030,000'      | '5/1/2021' | "Yes"     | ''                                                                 | '6,633,000'       | '5/2/2021' | "Yes"     | ''                                                                  | '6,633,000'    | '5/2/2021' | "Yes"     | ''                                                               | '19,296,000' | '5/2/2021' | "Yes"     | ''       |
			| "5C:Corporate performance management "                                      | '1,250,000'      | '1/1/2021' | "Yes"     | '000001'                                                           | '2,145,000'       | '5/2/2021' | "Yes"     | '2000005'                                                           | '2,145,000'    | '5/2/2021' | "Yes"     | '2000005'                                                        | '5,540,000'  | '5/2/2021' | "Yes"     | ''       |
			| "2C:Corporation "                                                  | '2,050,000'      | '2/1/2021' | "Yes"     | '000002'                                                           | '2,255,000'       | ''           | "No"    | ''                                                                  | '2,255,000'    | ''           | "No"    | ''                                                               | '6,560,000'  | '2/1/2021' | "Yes"     | ''       |
			| "4C:Enterprise 8.3 CORP. Server License (x86-64) "           | '180,000'        | '3/1/2021' | "Yes"     | '000003'                                                           | '198,000'         | ''           | "No"    | ''                                                                  | '198,000'      | ''           | "No"    | ''                                                               | '576,000'    | '3/1/2021' | "Yes"     | ''       |
			| "1C:ERP. Corporate performance management "                                   | '1,950,000'      | '4/1/2021' | "Yes"     | '000004'                                                           | '660,000'         | '1/2/2021' | "Yes"     | '2000001'                                                           | '660,000'      | '1/2/2021' | "Yes"     | '2000001'                                                        | '3,270,000'  | '4/1/2021' | "Yes"     | ''       |
			| "3C:Enterprise 8 CORP. Client license for 100 users " | '600,000'        | '5/1/2021' | "Yes"     | '000005'                                                           | '1,375,000'       | ''           | "No"    | ''                                                                  | '1,375,000'    | ''           | "No"    | ''                                                               | '3,350,000'  | '5/1/2021' | "Yes"     | ''       |
			| "SourceCode"                                                     | '6,030,000'      | '5/1/2021' | "Yes"     | '000005'                                                           | '6,633,000'       | '5/2/2021' | "Yes"     | '2000005'                                                           | '6,633,000'    | '5/2/2021' | "Yes"     | '2000005'                                                        | '19,296,000' | '5/2/2021' | "Yes"     | ''       |
			| "DestinationCode"                                                     | '0'              | ''           | "No"    | ''                                                                 | '0'               | ''           | "No"    | ''                                                                  | '0'            | ''           | "No"    | ''                                                               | '0'          | ''           | "No"    | ''       |
			| "FormulasCode"                                                      | '1'              | '12/1/2020' | "Yes"     | "Mercury LLC\nVA - Main scenario\nRUB\nJanuary 2021\nMonth" | '2'               | '1/1/2021' | "No"    | "Mercury LLC\nVA - Main scenario\nRUB\nFebruary 2021\nMonth" | '3'            | '2/1/2021' | "No"    | "Mercury LLC\nVA - Main scenario\nRUB\nMarch 2021\nMonth" | '6'          | '2/1/2021' | "Yes"     | ''       |
			| "Calculation"                                                          | '6,030,000'      | '6/1/2021' | "No"    | ''                                                                 | '13,266,000'      | '6/2/2021' | "Yes"     | ''                                                                  | '19,899,000'   | '6/2/2021' | "No"    | ''                                                               | '39,195,000' | '6/2/2021' | "Yes"     | ''       |
			| "5C:Corporate performance management "                                      | '1,250,000'      | '2/1/2021' | "No"    | '!!! 000001'                                                       | '4,290,000'       | '6/2/2021' | "No"    | '!!! 2000005'                                                       | '6,435,000'    | '6/2/2021' | "No"    | '!!! 2000005'                                                    | '11,975,000' | '6/2/2021' | "No"    | ''       |
			| "2C:Corporation "                                                  | '2,050,000'      | '3/1/2021' | "No"    | '!!! 000002'                                                       | '4,510,000'       | ''           | "Yes"     | ''                                                                  | '6,765,000'    | ''           | "No"    | ''                                                               | '13,325,000' | '3/1/2021' | "Yes"     | ''       |
			| "4C:Enterprise 8.3 CORP. Server License (x86-64) "           | '180,000'        | '4/1/2021' | "No"    | '!!! 000003'                                                       | '396,000'         | ''           | "No"    | ''                                                                  | '594,000'      | ''           | "No"    | ''                                                               | '1,170,000'  | '4/1/2021' | "No"    | ''       |
			| "1C:ERP. Corporate performance management "                                   | '1,950,000'      | '5/1/2021' | "No"    | '!!! 000004'                                                       | '1,320,000'       | '2/2/2021' | "No"    | '!!! 2000001'                                                       | '1,980,000'    | '2/2/2021' | "No"    | '!!! 2000001'                                                    | '5,250,000'  | '5/1/2021' | "No"    | ''       |
			| "3C:Enterprise 8 CORP. Client license for 100 users " | '600,000'        | '6/1/2021' | "No"    | '!!! 000005'                                                       | '2,750,000'       | ''           | "No"    | ''                                                                  | '4,125,000'    | ''           | "No"    | ''                                                               | '7,475,000'  | '6/1/2021' | "No"    | ''       |
	
	* Записываем документ
		Когда открылось окно '$WindowTitle$'
		И я нажимаю на кнопку с именем 'FormWriteANDContinue'
		Тогда Открылся экземпляр отчета для вида отчета "VA - Calculation in code" валюта 'RUB' организация "Mercury LLC" сценарий "VA - Main scenario" периодичность "Month" проект "VA - Main project" аналитики '' '' '' '' '' '' 

	* Рассчитываем документ еще раз и сверяем изменившийся результат
		И я нажимаю на кнопку с именем 'FormFillByDefault'
		Тогда табличный документ 'SpreadsheetFieldTemlate' равен:
			| "VA - Calculation in code"                                              | ''               | ''           | ''       | ''                                                                 | ''                | ''           | ''       | ''                                                                  | ''             | ''           | ''       | ''                                                               | ''           | ''           | ''       | ''       |
			| ''                                                                | ''               | ''           | ''       | ''                                                                 | ''                | ''           | ''       | ''                                                                  | ''             | ''           | ''       | ''                                                               | ''           | ''           | ''       | ''       |
			| ''                                                                | "January 2021" | ''           | ''       | ''                                                                 | "February 2021" | ''           | ''       | ''                                                                  | "March 2021" | ''           | ''       | ''                                                               | "TOTAL"      | ''           | ''       | ''       |
			| ''                                                                | "Number"          | "Date"       | "Boolean" | "Line"                                                           | "Number"           | "Date"       | "Boolean" | "Line"                                                            | "Number"        | "Date"       | "Boolean" | "Line"                                                         | "Number"      | "Date"       | "Boolean" | "Line" |
			| "Source"                                                        | '6,030,000'      | '5/1/2021' | "Yes"     | ''                                                                 | '6,633,000'       | '5/2/2021' | "Yes"     | ''                                                                  | '6,633,000'    | '5/2/2021' | "Yes"     | ''                                                               | '19,296,000' | '5/2/2021' | "Yes"     | ''       |
			| "5C:Corporate performance management "                                      | '1,250,000'      | '1/1/2021' | "Yes"     | '000001'                                                           | '2,145,000'       | '5/2/2021' | "Yes"     | '2000005'                                                           | '2,145,000'    | '5/2/2021' | "Yes"     | '2000005'                                                        | '5,540,000'  | '5/2/2021' | "Yes"     | ''       |
			| "2C:Corporation "                                                  | '2,050,000'      | '2/1/2021' | "Yes"     | '000002'                                                           | '2,255,000'       | ''           | "No"    | ''                                                                  | '2,255,000'    | ''           | "No"    | ''                                                               | '6,560,000'  | '2/1/2021' | "Yes"     | ''       |
			| "4C:Enterprise 8.3 CORP. Server License (x86-64) "           | '180,000'        | '3/1/2021' | "Yes"     | '000003'                                                           | '198,000'         | ''           | "No"    | ''                                                                  | '198,000'      | ''           | "No"    | ''                                                               | '576,000'    | '3/1/2021' | "Yes"     | ''       |
			| "1C:ERP. Corporate performance management "                                   | '1,950,000'      | '4/1/2021' | "Yes"     | '000004'                                                           | '660,000'         | '1/2/2021' | "Yes"     | '2000001'                                                           | '660,000'      | '1/2/2021' | "Yes"     | '2000001'                                                        | '3,270,000'  | '4/1/2021' | "Yes"     | ''       |
			| "3C:Enterprise 8 CORP. Client license for 100 users " | '600,000'        | '5/1/2021' | "Yes"     | '000005'                                                           | '1,375,000'       | ''           | "No"    | ''                                                                  | '1,375,000'    | ''           | "No"    | ''                                                               | '3,350,000'  | '5/1/2021' | "Yes"     | ''       |
			| "SourceCode"                                                     | '6,030,000'      | '5/1/2021' | "Yes"     | '000005'                                                           | '6,633,000'       | '5/2/2021' | "Yes"     | '2000005'                                                           | '6,633,000'    | '5/2/2021' | "Yes"     | '2000005'                                                        | '19,296,000' | '5/2/2021' | "Yes"     | ''       |
			| "DestinationCode"                                                     | '6,030,000'      | '5/1/2021' | "Yes"     | '000005'                                                           | '6,633,000'       | '5/2/2021' | "Yes"     | '2000005'                                                           | '6,633,000'    | '5/2/2021' | "Yes"     | '2000005'                                                        | '19,296,000' | '5/2/2021' | "Yes"     | ''       |
			| "FormulasCode"                                                      | '1'              | '12/1/2020' | "Yes"     | "Mercury LLC\nVA - Main scenario\nRUB\nJanuary 2021\nMonth" | '2'               | '1/1/2021' | "No"    | "Mercury LLC\nVA - Main scenario\nRUB\nFebruary 2021\nMonth" | '3'            | '2/1/2021' | "No"    | "Mercury LLC\nVA - Main scenario\nRUB\nMarch 2021\nMonth" | '6'          | '2/1/2021' | "Yes"     | ''       |
			| "Calculation"                                                          | '6,030,000'      | '6/1/2021' | "No"    | ''                                                                 | '13,266,000'      | '6/2/2021' | "Yes"     | ''                                                                  | '19,899,000'   | '6/2/2021' | "No"    | ''                                                               | '39,195,000' | '6/2/2021' | "Yes"     | ''       |
			| "5C:Corporate performance management "                                      | '1,250,000'      | '2/1/2021' | "No"    | '!!! 000001'                                                       | '4,290,000'       | '6/2/2021' | "No"    | '!!! 2000005'                                                       | '6,435,000'    | '6/2/2021' | "No"    | '!!! 2000005'                                                    | '11,975,000' | '6/2/2021' | "No"    | ''       |
			| "2C:Corporation "                                                  | '2,050,000'      | '3/1/2021' | "No"    | '!!! 000002'                                                       | '4,510,000'       | ''           | "Yes"     | ''                                                                  | '6,765,000'    | ''           | "No"    | ''                                                               | '13,325,000' | '3/1/2021' | "Yes"     | ''       |
			| "4C:Enterprise 8.3 CORP. Server License (x86-64) "           | '180,000'        | '4/1/2021' | "No"    | '!!! 000003'                                                       | '396,000'         | ''           | "No"    | ''                                                                  | '594,000'      | ''           | "No"    | ''                                                               | '1,170,000'  | '4/1/2021' | "No"    | ''       |
			| "1C:ERP. Corporate performance management "                                   | '1,950,000'      | '5/1/2021' | "No"    | '!!! 000004'                                                       | '1,320,000'       | '2/2/2021' | "No"    | '!!! 2000001'                                                       | '1,980,000'    | '2/2/2021' | "No"    | '!!! 2000001'                                                    | '5,250,000'  | '5/1/2021' | "No"    | ''       |
			| "3C:Enterprise 8 CORP. Client license for 100 users " | '600,000'        | '6/1/2021' | "No"    | '!!! 000005'                                                       | '2,750,000'       | ''           | "No"    | ''                                                                  | '4,125,000'    | ''           | "No"    | ''                                                               | '7,475,000'  | '6/1/2021' | "No"    | ''       |
	
	* Записываем документ и сверяем движения	
		Когда открылось окно '$WindowTitle$ *'
		И я нажимаю на кнопку с именем 'FormOpenDocumentRegisterRecordsFlatTab'
		Тогда открылось окно "1C:Enterprise"
		И я нажимаю на кнопку с именем 'Button0'
		Тогда открылось окно "Flat table of indicator values"
		И я жду когда в табличном документе 'ReportSpreadsheetDocument' заполнится ячейка 'R2C1' в течение 30 секунд
		Когда Я задаю параметры чтения области макета 'R1C1:R800C20'
		Дано Табличный документ 'ReportSpreadsheetDocument' равен макету 'Макеты\ВА_РасчетВКоде_Движения.mxl' по шаблону			

Сценарий: 07.08 Создание вида отчета "VA - Grouping by analytics"

	И Я создаю вид отчета с именем "VA - Grouping by analytics" и родителем "VA - Non-Numbers and Groupings (группа)"
	
	И Я открываю вид отчета с именем "VA - Grouping by analytics"
	И я устанавливаю флаг с именем 'ProjectSeparation'		
	И я перехожу к закладке с именем 'DimensionsOfReport'
	И из выпадающего списка с именем 'DimensionType1' я выбираю по строке "VA0CFItems"				
	И я нажимаю на кнопку с именем 'FormButtonWrite'
	Когда открылось окно "Data restructuring"
	И я нажимаю на кнопку с именем 'FormOK'

	И я нажимаю на кнопку с именем 'EditTree'
	Когда открылось окно "Edit tree"
	
	И Я в конструкторе отчета добавляю строку с именем "Group"
	И Я в конструкторе отчета добавляю строку с именем "GoodsSum"
	И Я в конструкторе отчета добавляю строку с именем "GoodsNoTotal"
	И Я в конструкторе отчета добавляю колонку с именем "Amount"
	
	И Я в конструкторе отчета добавляю колонку с именем "Maximum"
	И Я в конструкторе отчета добавляю колонку с именем "Minimum"
	И Я в конструкторе отчета добавляю колонку с именем "Average"
	И Я в конструкторе отчета добавляю колонку с именем "NoTotal"

	И Я в конструкторе отчета в ячейке 'R3C1' я меняю родителя у строки на "Group"
	И Я в конструкторе отчета в ячейке 'R4C1' я меняю родителя у строки на "Group"

	* Меняем настройки показателей
		* Сумма
			И я в конструкторе отчета в ячейке 'R2C2' я меняю свойство показателя 'PeriodTotalCalcMethod' на "Amount"
			И я в конструкторе отчета в ячейке 'R3C2' я меняю свойство показателя 'PeriodTotalCalcMethod' на "Amount"
			И я в конструкторе отчета в ячейке 'R3C2' я меняю свойство показателя 'TotalType' на "Amount"
			И я в конструкторе отчета в ячейке 'R4C2' я меняю свойство показателя 'PeriodTotalCalcMethod' на "Total by period is not calculated"
			И я в конструкторе отчета в ячейке 'R4C2' я меняю свойство показателя 'TotalType' на "Amount"
		* Максимум
			И я в конструкторе отчета в ячейке 'R2C3' я меняю свойство показателя 'PeriodTotalCalcMethod' на "Total by period is not calculated"
			И я в конструкторе отчета в ячейке 'R3C3' я меняю свойство показателя 'PeriodTotalCalcMethod' на "Amount"
			И я в конструкторе отчета в ячейке 'R3C3' я меняю свойство показателя 'TotalType' на "Maximum"
			И я в конструкторе отчета в ячейке 'R4C3' я меняю свойство показателя 'PeriodTotalCalcMethod' на "Total by period is not calculated"
			И я в конструкторе отчета в ячейке 'R4C3' я меняю свойство показателя 'TotalType' на "Maximum"
		* Минимум
			И я в конструкторе отчета в ячейке 'R2C4' я меняю свойство показателя 'PeriodTotalCalcMethod' на "Total by period is not calculated"
			И я в конструкторе отчета в ячейке 'R3C4' я меняю свойство показателя 'PeriodTotalCalcMethod' на "Amount"
			И я в конструкторе отчета в ячейке 'R3C4' я меняю свойство показателя 'TotalType' на "Minimum"
			И я в конструкторе отчета в ячейке 'R4C4' я меняю свойство показателя 'PeriodTotalCalcMethod' на "Total by period is not calculated"
			И я в конструкторе отчета в ячейке 'R3C4' я меняю свойство показателя 'TotalType' на "Minimum"
		* Среднее
			И я в конструкторе отчета в ячейке 'R3C5' я меняю свойство показателя 'PeriodTotalCalcMethod' на "Amount"
			И я в конструкторе отчета в ячейке 'R3C5' я меняю свойство показателя 'TotalType' на "Average"
			И я в конструкторе отчета в ячейке 'R4C5' я меняю свойство показателя 'PeriodTotalCalcMethod' на "Total by period is not calculated"
			И я в конструкторе отчета в ячейке 'R4C5' я меняю свойство показателя 'TotalType' на "Average"
		* БезИтога
			И я в конструкторе отчета в ячейке 'R2C6' я меняю свойство показателя 'PeriodTotalCalcMethod' на "Total by period is not calculated"
			И я в конструкторе отчета в ячейке 'R3C6' я меняю свойство показателя 'PeriodTotalCalcMethod' на "Amount"
			И я в конструкторе отчета в ячейке 'R3C6' я меняю свойство показателя 'TotalType' на "Cannot calculate the total by group drilldown"
			И я в конструкторе отчета в ячейке 'R4C6' я меняю свойство показателя 'PeriodTotalCalcMethod' на "Total by period is not calculated"
			И я в конструкторе отчета в ячейке 'R4C6' я меняю свойство показателя 'TotalType' на "Cannot calculate the total by group drilldown"

	* Устанавливаем аналитики отчета
		И Я в конструкторе отчета добавляю аналитику с кодом "VA0Product" в ячейку 'R3C3'

	* Устанавливаем формулы расчета
		Когда открылось окно "Edit tree"
		И из выпадающего списка с именем 'WorkMode' я выбираю точное значение "Indicators calculation formulas"
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R3C2'
		И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
		И я нажимаю на кнопку с именем 'RefToIndicator1'
		И Я выбираю показатель с кодом "Goods_Price" вида отчета "VA - Non-Numbers (source)"
		Тогда открылось окно "Edit tree *"
		И я нажимаю на кнопку с именем 'WriteAndCollapse'
		Тогда открылось окно "Edit tree"
		И я нажимаю на кнопку с именем 'CopyAndMoveRight'
		Когда открылось окно "Edit tree"
		И из выпадающего списка с именем 'WorkMode' я выбираю точное значение "Indicators calculation formulas"
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R4C2'
		И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
		И я нажимаю на кнопку с именем 'RefToIndicator1'
		И Я выбираю показатель с кодом "Goods_Price" вида отчета "VA - Non-Numbers (source)"
		Тогда открылось окно "Edit tree *"
		И я нажимаю на кнопку с именем 'WriteAndCollapse'
		Тогда открылось окно "Edit tree"
		И я нажимаю на кнопку с именем 'CopyAndMoveRight'

	* Устанавливаем формулы расчета для группы
		* Сумма
			Когда открылось окно "Edit tree"
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R2C2'
			И я нажимаю на кнопку с именем 'AmountByRowsHierarchy'
		* Максимум
			Когда открылось окно "Edit tree"
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R2C3'
			И я нажимаю на кнопку с именем 'AmountByRowsHierarchy'
			И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
			И я нажимаю на кнопку с именем 'ArbitraryCode'
			И в поле с именем 'TextDocumentFieldProcedure' я ввожу текст "Result = Max([VAGroupingByAnalytics_GoodsSum_Maximum], [VAGroupingByAnalytics_GoodsNoTotal_Maximum]) "
			И я нажимаю на кнопку с именем 'WriteAndCollapse'
		* Минимум
			Когда открылось окно "Edit tree"
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R2C4'
			И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
			И в поле с именем 'TextDocumentFieldProcedure' я ввожу текст "?({VAGroupingByAnalytics.GoodsSum_Minimum}<{VAGroupingByAnalytics.GoodsNoTotal_Minimum},{VAGroupingByAnalytics.GoodsSum_Minimum},{VAGroupingByAnalytics.GoodsNoTotal_Minimum}) "
			И я нажимаю на кнопку с именем 'WriteAndCollapse'
		* Среднее
			Когда открылось окно "Edit tree"
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R2C5'
			И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
			И в поле с именем 'TextDocumentFieldProcedure' я ввожу текст "({VAGroupingByAnalytics.GoodsSum_Average} + {VAGroupingByAnalytics.GoodsNoTotal_Average})  /  2"
			И я нажимаю на кнопку с именем 'WriteAndCollapse'						
		* БезИтога
			Когда открылось окно "Edit tree"
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R2C6'
			И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
			И в поле с именем 'TextDocumentFieldProcedure' я ввожу текст ' '
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R3C6'
			И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
			И я нажимаю на кнопку с именем 'ButtonDivide'
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R4C6'
			И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
			И я нажимаю на кнопку с именем 'WriteAndCollapse'
			* Должна сработать проверка деления на 0
				Тогда открылось окно "1C:Enterprise"
				И я нажимаю на кнопку с именем 'Button0'
			Тогда открылось окно "Edit tree *"
			И в поле с именем 'TextDocumentFieldProcedure' я ввожу текст "?({VAGroupingByAnalytics.GoodsNoTotal_NoTotal}=0,-1,{VAGroupingByAnalytics.GoodsSum_NoTotal} / {VAGroupingByAnalytics.GoodsNoTotal_NoTotal}) "
			И я нажимаю на кнопку с именем 'WriteAndCollapse'
			Когда открылось окно "Edit tree"
			И Я закрываю окно "Edit tree"							
									
	И Я Для вида отчета "VA - Grouping by analytics" я создаю бланк по умолчанию
	И Я Для вида отчета "VA - Grouping by analytics" в бланке для группы раскрытия с адресом 'R9C1' задаю сортировку "Product range" "Product ID"
						
Сценарий: 07.09 Создание экземпляра отчета - "VA - Grouping by analytics"

	И Я создаю экземпляр отчета для вида отчета "VA - Grouping by analytics" сценарий "VA - Main scenario" период '1/1/2021' '3/31/2021' периодичность "Month" организация "Mercury LLC" проект "VA - Main project" аналитики "3Software sale" '' '' '' '' '' 
	
	* Рассчитываем документ
		И я нажимаю на кнопку с именем 'FormFillByDefault'
		
	* Сравниваем результат
		Когда Я задаю параметры чтения области макета 'R1C1:R13C21'
		Тогда табличный документ 'SpreadsheetFieldTemlate' равен:
			| "VA - Grouping by analytics"                                  | ''               | ''          | ''          | ''          | ''          | ''                | ''          | ''          | ''          | ''          | ''             | ''          | ''          | ''          | ''          | ''           | ''          | ''          | ''           | ''         |
			| ''                                                                | ''               | ''          | ''          | ''          | ''          | ''                | ''          | ''          | ''          | ''          | ''             | ''          | ''          | ''          | ''          | ''           | ''          | ''          | ''           | ''         |
			| ''                                                                | "January 2021" | ''          | ''          | ''          | ''          | "February 2021" | ''          | ''          | ''          | ''          | "March 2021" | ''          | ''          | ''          | ''          | "TOTAL"      | ''          | ''          | ''           | ''         |
			| ''                                                                | "Amount"          | "Maximum"  | "Minimum"   | "Average"   | "NoTotal"  | "Amount"           | "Maximum"  | "Minimum"   | "Average"   | "NoTotal"  | "Amount"        | "Maximum"  | "Minimum"   | "Average"   | "NoTotal"  | "Amount"      | "Maximum"  | "Minimum"   | "Average"    | "NoTotal" |
			| "Group"                                                          | '12,060,000'     | '6,030,000' | '6,030,000' | '6,030,000' | '1'         | '13,266,000'      | '6,633,000' | '6,633,000' | '6,633,000' | '1'         | '13,266,000'   | '6,633,000' | '6,633,000' | '6,633,000' | '1'         | '38,592,000' | '0'         | '0'         | '19,296,000' | '0'        |
			| "GoodsSum"                                                     | '6,030,000'      | '2,050,000' | '180,000'   | '1,206,000' | '0'         | '6,633,000'       | '2,255,000' | '198,000'   | '1,326,600' | '0'         | '6,633,000'    | '2,255,000' | '198,000'   | '1,326,600' | '0'         | '19,296,000' | '2,255,000' | '180,000'   | '1,286,400'  | '0'        |
			| "5C:Corporate performance management "                                      | '1,250,000'      | '1,250,000' | '1,250,000' | '1,250,000' | '1,250,000' | '2,145,000'       | '2,145,000' | '2,145,000' | '2,145,000' | '2,145,000' | '2,145,000'    | '2,145,000' | '2,145,000' | '2,145,000' | '2,145,000' | '5,540,000'  | '2,145,000' | '1,250,000' | '1,846,667'  | '0'        |
			| "2C:Corporation "                                                  | '2,050,000'      | '2,050,000' | '2,050,000' | '2,050,000' | '2,050,000' | '2,255,000'       | '2,255,000' | '2,255,000' | '2,255,000' | '2,255,000' | '2,255,000'    | '2,255,000' | '2,255,000' | '2,255,000' | '2,255,000' | '6,560,000'  | '2,255,000' | '2,050,000' | '2,186,667'  | '0'        |
			| "4C:Enterprise 8.3 CORP. Server License (x86-64) "           | '180,000'        | '180,000'   | '180,000'   | '180,000'   | '180,000'   | '198,000'         | '198,000'   | '198,000'   | '198,000'   | '198,000'   | '198,000'      | '198,000'   | '198,000'   | '198,000'   | '198,000'   | '576,000'    | '198,000'   | '180,000'   | '192,000'    | '0'        |
			| "1C:ERP. Corporate performance management "                                   | '1,950,000'      | '1,950,000' | '1,950,000' | '1,950,000' | '1,950,000' | '660,000'         | '660,000'   | '660,000'   | '660,000'   | '660,000'   | '660,000'      | '660,000'   | '660,000'   | '660,000'   | '660,000'   | '3,270,000'  | '1,950,000' | '660,000'   | '1,090,000'  | '0'        |
			| "3C:Enterprise 8 CORP. Client license for 100 users " | '600,000'        | '600,000'   | '600,000'   | '600,000'   | '600,000'   | '1,375,000'       | '1,375,000' | '1,375,000' | '1,375,000' | '1,375,000' | '1,375,000'    | '1,375,000' | '1,375,000' | '1,375,000' | '1,375,000' | '3,350,000'  | '1,375,000' | '600,000'   | '1,116,667'  | '0'        |
			| "GoodsNoTotal"                                                  | '6,030,000'      | '6,030,000' | '6,030,000' | '6,030,000' | '0'         | '6,633,000'       | '6,633,000' | '6,633,000' | '6,633,000' | '0'         | '6,633,000'    | '6,633,000' | '6,633,000' | '6,633,000' | '0'         | '0'          | '0'         | '0'         | '0'          | '0'        |

	* Записываем документ
		И я нажимаю на кнопку с именем 'FormWriteANDContinue'

	* Проверяем движения	
		Тогда Открылся экземпляр отчета для вида отчета "VA - Grouping by analytics" валюта 'RUB' организация "Mercury LLC" сценарий "VA - Main scenario" периодичность "Month" проект "VA - Main project" аналитики "3Software sale" '' '' '' '' '' 
		И я нажимаю на кнопку с именем 'FormOpenDocumentRegisterRecordsFlatTab'
		Тогда открылось окно "Flat table of indicator values"
		И я жду когда в табличном документе 'ReportSpreadsheetDocument' заполнится ячейка 'R2C1' в течение 30 секунд
		Когда Я задаю параметры чтения области макета 'R1C1:R450C20'
		Дано Табличный документ 'ReportSpreadsheetDocument' равен макету 'Макеты\ВА_ГруппировкаПоАналитикам_Движения.mxl' по шаблону
													
