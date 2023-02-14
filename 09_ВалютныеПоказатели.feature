#language: ru

@tree

Функционал: 09. Валютные показатели

Как Администратор я хочу
Проверить что виды отчетов с валютными показателями расчитываются и записываются

Контекст: 

	И я подключаю TestClient 'CPM - Budgeting' логин "Administrator" пароль ''
	И я закрыл все окна клиентского приложения

Сценарий: 09.00 Определение типа приложения

	Пусть Инициализация переменных

Сценарий: 09.01 Создание группы отчетов 'VA - Currency indicators (group)'

	И Я создаю группу видов отчетов с именем 'VA - Currency indicators (group)' и родителем 'VA - Report group'

Сценарий: 09.02 Создание вида отчета 'VA - Currency indicators (source)'

	И Я создаю вид отчета с именем 'VA - Currency indicators (source)' и родителем 'VA - Currency indicators (group)'
	
	И Я открываю вид отчета с именем 'VA - Currency indicators (source)'
	И я устанавливаю флаг с именем 'ProjectSeparation'	
	И я нажимаю на кнопку с именем 'FormButtonWrite'

	И я нажимаю на кнопку с именем 'EditTree'
	Когда открылось окно "Edit tree"

	И Я в конструкторе отчета добавляю строку с именем 'Revenue'
	И Я в конструкторе отчета добавляю строку с именем 'Revenue in currency'
	И Я в конструкторе отчета добавляю строку с именем 'Revenue by currency'
	И Я в конструкторе отчета добавляю строку с именем 'Course date'
	И Я в конструкторе отчета добавляю строку с именем 'Rate [EUR]'
	И Я в конструкторе отчета добавляю строку с именем 'Rate [USD]'
		
	И Я в конструкторе отчета добавляю колонку с именем 'Value'

	И я в конструкторе отчета в ячейке 'R5C2' я меняю свойство показателя 'ValueType' на "Date"
	И я в конструкторе отчета в ячейке 'R5C2' я меняю свойство показателя 'PeriodTotalCalcMethod' на "Total by period is not calculated"
	И я в конструкторе отчета в ячейке 'R6C2' я меняю свойство показателя 'IsNonFinancial' на "True"
	И я в конструкторе отчета в ячейке 'R6C2' я меняю свойство показателя 'PeriodTotalCalcMethod' на "Total by period is not calculated"
	И я в конструкторе отчета в ячейке 'R7C2' я меняю свойство показателя 'IsNonFinancial' на "True"
	И я в конструкторе отчета в ячейке 'R7C2' я меняю свойство показателя 'PeriodTotalCalcMethod' на "Total by period is not calculated"
	
	И Я в конструкторе отчета добавляю аналитику с кодом 'VA0Counter' в ячейку 'R2C2'
	Когда открылось окно "Edit tree"
	И я нажимаю на кнопку с именем 'CopyDimension'
	И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R3C2'
	И я нажимаю на кнопку с именем 'InsertDim'
	И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R3C8'
	И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
	И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R4C8'
	И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке						

Сценарий: 09.03 Создание многопериодного бланка для вида отчета 'VA - Currency indicators (source)'

	И Я Для вида отчета 'VA - Currency indicators (source)' я создаю бланк по умолчанию

	* Открываем бланк
		И Я нахожу в списке вид отчета с именем 'VA - Currency indicators (source)'
		Тогда открылось окно "Report kinds and templates"
		И в таблице 'List' я перехожу к строке:
			| "Description"                        |
			| 'VA - Currency indicators (source)' |
		И в таблице 'List' я выбираю текущую строку
		И я запоминаю заголовок формы в переменную 'WindowTitle'		
	
	* Добавляем колонку с значением валюта
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'C3'
		И я выбираю пункт контекстного меню с именем 'SpreadsheetFieldTemplateContextMenuAddRowsRight' на элементе формы с именем 'SpreadsheetFieldTemlate'
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R5C3:R16C3'
		И я нажимаю на кнопку с именем 'CopyToClipboard'
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R5C4:R16C4'
		И я нажимаю на кнопку с именем 'PasteFromClipboard'
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R5C3:R5C4'
		И я нажимаю на кнопку с именем 'Union'
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R6C4'
		И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
		И в табличный документ 'SpreadsheetFieldTemlate' я ввожу текст 'Sum (вал)'
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R7C4:R10C4'
		И я нажимаю на кнопку с именем 'ClearUpContent'
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R11C4'
		И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
		Тогда открылось окно 'Indicator value filter settings'
		И я изменяю флаг с именем 'AmountInAddlCurrency'
		И я нажимаю на кнопку с именем 'FormApply'
		Тогда открылось окно '$WindowTitle$ *'
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R12C4'
		И я нажимаю на кнопку с именем 'ClearUpContent'
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R13C4'
		И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
		Тогда открылось окно 'Indicator value filter settings'
		И я изменяю флаг с именем 'AmountInAddlCurrency'
		И я нажимаю на кнопку с именем 'FormApply'
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R14C4:R16C4'
		И я нажимаю на кнопку с именем 'ClearUpContent'
	
	* Добавляем колонку с значением валюта для итога
		Когда открылось окно '$WindowTitle$ *'
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'C5'
		И я выбираю пункт контекстного меню с именем 'SpreadsheetFieldTemplateContextMenuAddRowsRight' на элементе формы с именем 'SpreadsheetFieldTemlate'
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R5C5:R16C5'
		И я нажимаю на кнопку с именем 'CopyToClipboard'
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R5C6:R16C6'
		И я нажимаю на кнопку с именем 'PasteFromClipboard'
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R7C6:R10C6'
		И я нажимаю на кнопку с именем 'ClearUpContent'
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R11C6'
		И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
		Тогда открылось окно 'Indicator value filter settings'
		И я изменяю флаг с именем 'AmountInAddlCurrency'
		И я нажимаю на кнопку с именем 'FormApply'
		Тогда открылось окно '$WindowTitle$ *'
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R12C6'
		И я нажимаю на кнопку с именем 'ClearUpContent'
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R13C6'
		И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
		Тогда открылось окно 'Indicator value filter settings'
		И я изменяю флаг с именем 'AmountInAddlCurrency'
		И я нажимаю на кнопку с именем 'FormApply'
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R14C6:R16C6'
		И я нажимаю на кнопку с именем 'ClearUpContent'
	
	* Записываем макет
		Тогда открылось окно '$WindowTitle$ *'
		И я нажимаю на кнопку с именем 'FormButtonWriteAndClose'

Сценарий: 09.04 Создание экземпляра отчета - 'VA - Currency indicators (source)' 

	И Я создаю экземпляр отчета для вида отчета 'VA - Currency indicators (source)' сценарий 'VA - Main scenario' период '1/1/2021' '3/31/2021' периодичность "Month" организация 'Mercury LLC' проект 'VA - Main project' аналитики '' '' '' '' '' '' 

	* Вводим значения показателей
		Когда открылось окно '$WindowTitle$'		
		И Я добавляю значения с раскрытием показателей в ячейку 'R6C2'
				| 'VA0Counter'      | 'Value'      |
				| 'LLC \"Ganymede\"' | '100,000.00000' |
				| 'LLC \"Io\"'      | '200,000.00000' |
		И Я добавляю значения с раскрытием показателей в ячейку 'R9C2'
				| 'VA0Counter'      | 'DimensionCurrency' | 'Value'      |
				| 'LLC \"Ganymede\"' | 'RUB'             | '100,000.00000' |
				| 'LLC \"Ganymede\"' | 'USD'             | '90,000.00000'  |
				| 'LLC \"Ganymede\"' | 'EUR'             | '110,000.00000' |
				| 'LLC \"Io\"'      | 'RUB'             | '200,000.00000' |
				| 'LLC \"Io\"'      | 'USD'             | '180,000.00000' |
				| 'LLC \"Io\"'      | 'EUR'             | '220,000.00000' |
		И Я добавляю значения с раскрытием показателей в ячейку 'R18C2'
				| 'DimensionCurrency' | 'Value'      |
				| 'RUB'             | '300,000.00000' |
				| 'USD'             | '270,000.00000' |
				| 'EUR'             | '330,000.00000' |

	* Копируем значения показателей
		Когда открылось окно '$WindowTitle$'
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R6C2:R21C2'
		И я нажимаю на кнопку с именем 'SpreadsheetFieldTemplateCopyDataOnRow'

	* Вводим значения для расчета курсов
		Когда открылось окно '$WindowTitle$'
		И Я ввожу значение '3/1/2021' в ячейку 'R22C2'
		И Я ввожу значение '2/1/2021' в ячейку 'R22C4'
		И Я ввожу значение '1/1/2021' в ячейку 'R22C6'
		И Я ввожу значение '90.00000' в ячейку 'R23C2'
		И Я ввожу значение '91.00000' в ячейку 'R23C4'
		И Я ввожу значение '92.00000' в ячейку 'R23C6'
		И Я ввожу значение '73.00000' в ячейку 'R24C2'
		И Я ввожу значение '74.00000' в ячейку 'R24C4'
		И Я ввожу значение '75.00000' в ячейку 'R24C6'

	* Сравниваем итоговый документ
		Тогда табличный документ 'SpreadsheetFieldTemlate' равен:
			| 'VA - Currency indicators (source)' | ''               | ''            | ''                | ''            | ''             | ''            | ''          | ''         |
			| ''                                    | ''               | ''            | ''                | ''            | ''             | ''            | ''          | ''         |
			| ''                                    | 'January 2021' | ''            | 'February 2021' | ''            | 'March 2021' | ''            | 'TOTAL'     | 'TOTAL'    |
			| ''                                    | 'Value'       | 'Sum (вал)' | 'Value'        | 'Sum (вал)' | 'Value'     | 'Sum (вал)' | 'Value'  | 'Value' |
			| 'Revenue'                             | '300,000'        | ''            | '300,000'         | ''            | '300,000'      | ''            | '900,000'   | ''         |
			| 'LLC "Ganymede" '                      | '100,000'        | ''            | '100,000'         | ''            | '100,000'      | ''            | '300,000'   | ''         |
			| 'LLC "Io" '                           | '200,000'        | ''            | '200,000'         | ''            | '200,000'      | ''            | '600,000'   | ''         |
			| 'Revenue in currency'                    | '900,000'        | ''            | '900,000'         | ''            | '900,000'      | ''            | '2,700,000' | ''         |
			| 'LLC "Ganymede" '                      | '300,000'        | ''            | '300,000'         | ''            | '300,000'      | ''            | '900,000'   | ''         |
			| 'EUR '                                | '110,000'        | '1,216'       | '110,000'         | '1,223'       | '110,000'      | '1,240'       | '330,000'   | '3,679'    |
			| 'RUB '                                | '100,000'        | '100,000'     | '100,000'         | '100,000'     | '100,000'      | '100,000'     | '300,000'   | '300,000'  |
			| 'USD '                                | '90,000'         | '1,213'       | '90,000'          | '1,210'       | '90,000'       | '1,210'       | '270,000'   | '3,632'    |
			| 'LLC "Io" '                           | '600,000'        | ''            | '600,000'         | ''            | '600,000'      | ''            | '1,800,000' | ''         |
			| 'EUR '                                | '220,000'        | '2,431'       | '220,000'         | '2,446'       | '220,000'      | '2,481'       | '660,000'   | '7,358'    |
			| 'RUB '                                | '200,000'        | '200,000'     | '200,000'         | '200,000'     | '200,000'      | '200,000'     | '600,000'   | '600,000'  |
			| 'USD '                                | '180,000'        | '2,425'       | '180,000'         | '2,420'       | '180,000'      | '2,419'       | '540,000'   | '7,265'    |
			| 'Revenue by currency'                   | '900,000'        | ''            | '900,000'         | ''            | '900,000'      | ''            | '2,700,000' | ''         |
			| 'EUR '                                | '330,000'        | '3,647'       | '330,000'         | '3,669'       | '330,000'      | '3,721'       | '990,000'   | '11,037'   |
			| 'RUB '                                | '300,000'        | '300,000'     | '300,000'         | '300,000'     | '300,000'      | '300,000'     | '900,000'   | '900,000'  |
			| 'USD '                                | '270,000'        | '3,638'       | '270,000'         | '3,630'       | '270,000'      | '3,629'       | '810,000'   | '10,897'   |
			| 'Course date'                          | '3/1/2021'     | ''            | '2/1/2021'      | ''            | '1/1/2021'   | ''            | ''          | ''         |
			| 'Rate [EUR]'                          | '90'             | ''            | '91'              | ''            | '92'           | ''            | '0'         | ''         |
			| 'Rate [USD]'                          | '73'             | ''            | '74'              | ''            | '75'           | ''            | '0'         | ''         |

	* Записываем документ	
		Когда открылось окно '$WindowTitle$'
		И я нажимаю на кнопку с именем 'FormWriteANDContinue'
		И я запоминаю заголовок формы в переменную 'WindowTitle'		

	* Сравниваем движения	
		Тогда открылось окно '$WindowTitle$'
		И я нажимаю на кнопку с именем 'FormOpenDocRegisterRecordsFlatTab'
		Тогда открылось окно "Flat table of indicator values"
		И я жду когда в табличном документе 'ReportSpreadsheetDocument' заполнится ячейка 'R2C1' в течение 30 секунд
		Дано Табличный документ 'ReportSpreadsheetDocument' равен макету 'Макеты\ВА_ВалютныеПоказатели_Источник_Движения_En_En.mxl' по шаблону

Сценарий: 09.05 Создание вида отчета 'VA - Currency indicators (recipient)'

	И Я создаю вид отчета с именем 'VA - Currency indicators (recipient)' и родителем 'VA - Cumulative total (group)'

	И Я открываю вид отчета с именем 'VA - Currency indicators (recipient)'
	И я устанавливаю флаг с именем 'ProjectSeparation'	
	И я нажимаю на кнопку с именем 'FormButtonWrite'

	И я нажимаю на кнопку с именем 'EditTree'
	Когда открылось окно "Edit tree"

	* Добавляем строки
		Тогда открылось окно "Edit tree"
		И я нажимаю на кнопку с именем 'RowsTreeAddRows'
		Тогда открылось окно "Adding new lines"
		И в таблице 'NewLines' я нажимаю на кнопку с именем 'NewLinesAdd'
		И в таблице 'NewLines' в поле с именем 'NewLinesDescription' я ввожу текст 'Revenue by currency'
		И в таблице 'NewLines' я нажимаю на кнопку с именем 'NewLinesAdd'
		И в таблице 'NewLines' в поле с именем 'NewLinesDescription' я ввожу текст 'Revenue by currency [Average rate for period]'
		И в таблице 'NewLines' я нажимаю на кнопку с именем 'NewLinesAdd'
		И в таблице 'NewLines' в поле с именем 'NewLinesDescription' я ввожу текст 'Revenue by currency [Average rate for IFRS period]'
		И в таблице 'NewLines' я нажимаю на кнопку с именем 'NewLinesAdd'
		И в таблице 'NewLines' в поле с именем 'NewLinesDescription' я ввожу текст 'Revenue by currency [Average rate for period CB]'
		И в таблице 'NewLines' я нажимаю на кнопку с именем 'NewLinesAdd'
		И в таблице 'NewLines' в поле с именем 'NewLinesDescription' я ввожу текст 'Revenue by currency [Exchange rate at the beginning of the period]'
		И в таблице 'NewLines' я нажимаю на кнопку с именем 'NewLinesAdd'
		И в таблице 'NewLines' в поле с именем 'NewLinesDescription' я ввожу текст 'Revenue by currency [Exchange rate at the end of the period]'
		И в таблице 'NewLines' я нажимаю на кнопку с именем 'NewLinesAdd'
		И в таблице 'NewLines' в поле с именем 'NewLinesDescription' я ввожу текст 'Revenue by currency [Average rate for the previous period]'
		И в таблице 'NewLines' я нажимаю на кнопку с именем 'NewLinesAdd'
		И в таблице 'NewLines' в поле с именем 'NewLinesDescription' я ввожу текст 'Revenue by currency [Exchange rate at the end of the previous period]'
		И в таблице 'NewLines' я нажимаю на кнопку с именем 'NewLinesAdd'
		И в таблице 'NewLines' в поле с именем 'NewLinesDescription' я ввожу текст 'Revenue by currency [Average rate for the previous period CB]'
		И в таблице 'NewLines' я нажимаю на кнопку с именем 'NewLinesAdd'
		И в таблице 'NewLines' в поле с именем 'NewLinesDescription' я ввожу текст 'Course date'
		И в таблице 'NewLines' я нажимаю на кнопку с именем 'NewLinesAdd'
		И в таблице 'NewLines' в поле с именем 'NewLinesDescription' я ввожу текст 'Revenue by currency [Exchange rate as of the date specified in the indicator]'
		И в таблице 'NewLines' я нажимаю на кнопку с именем 'NewLinesAdd'
		И в таблице 'NewLines' в поле с именем 'NewLinesDescription' я ввожу текст 'Revenue by currency [Exchange rate as of the date specified in the indicator another report]'
		И в таблице 'NewLines' я нажимаю на кнопку с именем 'NewLinesAdd'
		И в таблице 'NewLines' в поле с именем 'NewLinesDescription' я ввожу текст 'Rate [EUR]'
		И в таблице 'NewLines' я нажимаю на кнопку с именем 'NewLinesAdd'
		И в таблице 'NewLines' в поле с именем 'NewLinesDescription' я ввожу текст 'Rate [USD]'
		И в таблице 'NewLines' я нажимаю на кнопку с именем 'NewLinesAdd'
		И в таблице 'NewLines' в поле с именем 'NewLinesDescription' я ввожу текст 'Revenue by currency [Rate specified in the indicator]'
		И в таблице 'NewLines' я нажимаю на кнопку с именем 'NewLinesAdd'
		И в таблице 'NewLines' в поле с именем 'NewLinesDescription' я ввожу текст 'Revenue by currency [Rate specified in the indicator another report]'
		И я нажимаю на кнопку с именем 'OK'
		
	* Добавляем колонки
		И Я в конструкторе отчета добавляю колонку с именем 'Value'

	* Настраиваем показатели
		* Выручка по валюте [Средний курс за период]
			Тогда открылось окно "Edit tree"
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R3C2'
			И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
			Тогда открылось окно "* (Report indicators)"
			И я перехожу к закладке с именем 'CurrenciesConversion'
			И из выпадающего списка с именем 'CurrExchangeType' я выбираю точное значение "Average rate for period"
			И я нажимаю на кнопку с именем 'FormWriteAndClose'
			И я жду закрытия окна "* (Report indicators) *" в течение 20 секунд
		* Выручка по валюте [Средний курс за период МСФО]
			Тогда открылось окно "Edit tree"
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R4C2'
			И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
			Тогда открылось окно "* (Report indicators)"
			И я перехожу к закладке с именем 'CurrenciesConversion'
			И из выпадающего списка с именем 'CurrExchangeType' я выбираю точное значение "Average rate for IFRS period"
			И я нажимаю на кнопку с именем 'FormWriteAndClose'
			И я жду закрытия окна "* (Report indicators) *" в течение 20 секунд
		* Выручка по валюте [Средний курс за период ЦБ]
			Тогда открылось окно "Edit tree"
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R5C2'
			И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
			Тогда открылось окно "* (Report indicators)"
			И я перехожу к закладке с именем 'CurrenciesConversion'
			И из выпадающего списка с именем 'CurrExchangeType' я выбираю точное значение "Average rate for period CB"
			И я нажимаю на кнопку с именем 'FormWriteAndClose'
			И я жду закрытия окна "* (Report indicators) *" в течение 20 секунд
		* Выручка по валюте [Курс на начало периода]	
			Тогда открылось окно "Edit tree"
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R6C2'
			И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
			Тогда открылось окно "* (Report indicators)"
			И я перехожу к закладке с именем 'CurrenciesConversion'
			И из выпадающего списка с именем 'CurrExchangeType' я выбираю точное значение "Exchange rate at the beginning of the period"
			И я нажимаю на кнопку с именем 'FormWriteAndClose'
			И я жду закрытия окна "* (Report indicators) *" в течение 20 секунд
		* Выручка по валюте [Курс на конец периода]	
			Тогда открылось окно "Edit tree"
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R7C2'
			И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
			Тогда открылось окно "* (Report indicators)"
			И я перехожу к закладке с именем 'CurrenciesConversion'
			И из выпадающего списка с именем 'CurrExchangeType' я выбираю точное значение "Exchange rate at the end of the period"
			И я нажимаю на кнопку с именем 'FormWriteAndClose'
			И я жду закрытия окна '"* (Report indicators) *" в течение 20 секунд
		* Выручка по валюте [Средний курс за предыдущий период]	
			Тогда открылось окно "Edit tree"
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R8C2'
			И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
			Тогда открылось окно "* (Report indicators)"
			И я перехожу к закладке с именем 'CurrenciesConversion'
			И из выпадающего списка с именем 'CurrExchangeType' я выбираю точное значение "Average rate for the previous period"
			И я нажимаю на кнопку с именем 'FormWriteAndClose'
			И я жду закрытия окна "* (Report indicators) *" в течение 20 секунд
		* Выручка по валюте [Курс на конец предыдущего периода]	
			Тогда открылось окно "Edit tree"
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R9C2'
			И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
			Тогда открылось окно "* (Report indicators)"
			И я перехожу к закладке с именем 'CurrenciesConversion'
			И из выпадающего списка с именем 'CurrExchangeType' я выбираю точное значение "Exchange rate at the end of the previous period"
			И я нажимаю на кнопку с именем 'FormWriteAndClose'
			И я жду закрытия окна "* (Report indicators) *" в течение 20 секунд
		* Выручка по валюте [Средний курс за предыдущий период ЦБ]	
			Тогда открылось окно "Edit tree"
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R10C2'
			И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
			Тогда открылось окно "* (Report indicators)"
			И я перехожу к закладке с именем 'CurrenciesConversion'
			И из выпадающего списка с именем 'CurrExchangeType' я выбираю точное значение "Average rate for the previous period CB"
			И я нажимаю на кнопку с именем 'FormWriteAndClose'
			И я жду закрытия окна "* (Report indicators) *" в течение 20 секунд
		* Дата курса	
			Тогда открылось окно "Edit tree"
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R11C2'
			И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
			Тогда открылось окно "* (Report indicators)"
			И из выпадающего списка с именем 'ValueType' я выбираю точное значение "Date"
			И из выпадающего списка с именем 'PeriodTotalCalcMethod' я выбираю точное значение "Total by period is not calculated"
			И я нажимаю на кнопку с именем 'FormWriteAndClose'
			И я жду закрытия окна "* (Report indicators) *" в течение 20 секунд
		* Выручка по валюте [Курс на дату указанную в показателе]	
			Тогда открылось окно "Edit tree"
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R12C2'
			И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
			Тогда открылось окно "* (Report indicators)"
			И я перехожу к закладке с именем 'CurrenciesConversion'
			И из выпадающего списка с именем 'CurrExchangeType' я выбираю точное значение "Exchange rate as of the date specified in the indicator"
			И я нажимаю кнопку выбора у поля с именем 'LinkedIndicator'
			И Я выбираю показатель с кодом 'CourseDate_Value'
			Тогда открылось окно "* (Report indicators) *"
			И я нажимаю на кнопку с именем 'FormWriteAndClose'
			И я жду закрытия окна "* (Report indicators) *" в течение 20 секунд
		* Выручка по валюте [Курс на дату указанную в показателе другого отчета]	
			Тогда открылось окно "Edit tree"
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R13C2'
			И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
			Тогда открылось окно "* (Report indicators)"
			И я перехожу к закладке с именем 'CurrenciesConversion'
			И из выпадающего списка с именем 'CurrExchangeType' я выбираю точное значение "Exchange rate as of the date specified in the indicator"
			И я нажимаю кнопку выбора у поля с именем 'LinkedIndicator'
			И Я выбираю показатель с кодом 'CourseDate_Value' вида отчета 'VA - Currency indicators (source)'
			Тогда открылось окно "* (Report indicators) *"
			И я нажимаю на кнопку с именем 'FormWriteAndClose'
			И я жду закрытия окна "* (Report indicators) *" в течение 20 секунд
		* Курс (EUR)	
			Тогда открылось окно "Edit tree"
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R14C2'
			И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
			Тогда открылось окно "* (Report indicators)"
			И из выпадающего списка с именем 'PeriodTotalCalcMethod' я выбираю точное значение "Total by period is not calculated"
			И я изменяю флаг с именем 'IsNonFinancial'
			И я нажимаю на кнопку с именем 'FormWriteAndClose'
			И я жду закрытия окна "* (Report indicators) *" в течение 20 секунд
		* Курс (USD)	
			Тогда открылось окно "Edit tree"
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R15C2'
			И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
			Тогда открылось окно "* (Report indicators)"
			И из выпадающего списка с именем 'PeriodTotalCalcMethod' я выбираю точное значение "Total by period is not calculated"
			И я изменяю флаг с именем 'IsNonFinancial'
			И я нажимаю на кнопку с именем 'FormWriteAndClose'
			И я жду закрытия окна "* (Report indicators) *" в течение 20 секунд
		* Выручка по валюте [Курс указанный в показателе]	
			Тогда открылось окно "Edit tree"
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R16C2'
			И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
			Тогда открылось окно "* (Report indicators)"
			И я перехожу к закладке с именем 'CurrenciesConversion'
			И из выпадающего списка с именем 'CurrExchangeType' я выбираю точное значение "Rate specified in the indicator"
			* EUR
				И в таблице 'IndicatorsForExchRates' я нажимаю на кнопку с именем 'IndicatorsForExchRatesAdd'
				И в таблице 'IndicatorsForExchRates' из выпадающего списка с именем 'IndicatorsForExchRatesCurrency' я выбираю точное значение "EUR"
				И я перехожу к следующему реквизиту
				И в таблице 'IndicatorsForExchRates' я нажимаю кнопку выбора у реквизита с именем 'IndicatorsForExchRatesRateIndicator'
				И Я выбираю показатель с кодом 'RateEUR_Value' вида отчета 'VA - Currency indicators (recipient)'
				Тогда открылось окно "* (Report indicators) *"
				И в таблице 'IndicatorsForExchRates' в поле с именем 'IndicatorsForExchRatesRepetition' я ввожу текст '1'
				И в таблице 'IndicatorsForExchRates' я завершаю редактирование строки
			* USD
				И в таблице 'IndicatorsForExchRates' я нажимаю на кнопку с именем 'IndicatorsForExchRatesAdd'
				И в таблице 'IndicatorsForExchRates' из выпадающего списка с именем 'IndicatorsForExchRatesCurrency' я выбираю точное значение "USD"
				И я перехожу к следующему реквизиту
				И в таблице 'IndicatorsForExchRates' я нажимаю кнопку выбора у реквизита с именем 'IndicatorsForExchRatesRateIndicator'
				И Я выбираю показатель с кодом 'RateUSD_Value' вида отчета 'VA - Currency indicators (recipient)'
				Тогда открылось окно "* (Report indicators) *"
				И в таблице 'IndicatorsForExchRates' в поле с именем 'IndicatorsForExchRatesRepetition' я ввожу текст '1'
				И в таблице 'IndicatorsForExchRates' я завершаю редактирование строки	
			И я нажимаю на кнопку с именем 'FormWriteAndClose'
			И я жду закрытия окна "* (Report indicators) *" в течение 20 секунд
		* Выручка по валюте [Курс указанный в показателе другого отчета]
			Тогда открылось окно "Edit tree"
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R17C2'
			И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
			Тогда открылось окно "* (Report indicators)"
			И я перехожу к закладке с именем 'CurrenciesConversion'
			И из выпадающего списка с именем 'CurrExchangeType' я выбираю точное значение "Rate specified in the indicator"
			* EUR
				И в таблице 'IndicatorsForExchRates' я нажимаю на кнопку с именем 'IndicatorsForExchRatesAdd'
				И в таблице 'IndicatorsForExchRates' из выпадающего списка с именем 'IndicatorsForExchRatesCurrency' я выбираю точное значение "EUR"
				И я перехожу к следующему реквизиту
				И в таблице 'IndicatorsForExchRates' я нажимаю кнопку выбора у реквизита с именем 'IndicatorsForExchRatesRateIndicator'
				И Я выбираю показатель с кодом 'RateEUR_Value' вида отчета 'VA - Currency indicators (source)'
				Тогда открылось окно "* (Report indicators) *"
				И в таблице 'IndicatorsForExchRates' в поле с именем 'IndicatorsForExchRatesRepetition' я ввожу текст '1'
				И в таблице 'IndicatorsForExchRates' я завершаю редактирование строки
			* USD
				И в таблице 'IndicatorsForExchRates' я нажимаю на кнопку с именем 'IndicatorsForExchRatesAdd'
				И в таблице 'IndicatorsForExchRates' из выпадающего списка с именем 'IndicatorsForExchRatesCurrency' я выбираю точное значение "USD"
				И я перехожу к следующему реквизиту
				И в таблице 'IndicatorsForExchRates' я нажимаю кнопку выбора у реквизита с именем 'IndicatorsForExchRatesRateIndicator'
				И Я выбираю показатель с кодом 'RateUSD_Value' вида отчета 'VA - Currency indicators (source)'
				Тогда открылось окно "* (Report indicators) *"
				И в таблице 'IndicatorsForExchRates' в поле с именем 'IndicatorsForExchRatesRepetition' я ввожу текст '1'
				И в таблице 'IndicatorsForExchRates' я завершаю редактирование строки	
			И я нажимаю на кнопку с именем 'FormWriteAndClose'
			И я жду закрытия окна "* (Report indicators) *" в течение 20 секунд

	* Устанавливаем аналитики отчета
		Тогда открылось окно "Edit tree"
		И из выпадающего списка с именем 'WorkMode' я выбираю точное значение "Indicator dimensions"
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R2C2'
		И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
		Тогда открылось окно "Dimension kinds (corporate)"
		И я нажимаю на кнопку с именем 'FormFind'
		Тогда открылась форма с именем 'UniversalListFindExtForm'
		И из выпадающего списка с именем 'FieldSelector' я выбираю точное значение "Code"
		И в поле с именем 'Pattern' я ввожу текст 'VA0Counter'
		И я меняю значение переключателя с именем 'CompareType' на "Exact match"
		И я нажимаю на кнопку с именем 'Find'
		Тогда открылось окно "Dimension kinds (corporate)"
		И в таблице 'List' я выбираю текущую строку
		Когда открылось окно "Edit tree"
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R2C8'
		И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R3C8'
		И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R4C8'
		И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R5C8'
		И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R6C8'
		И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R7C8'
		И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R8C8'
		И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R9C8'
		И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R10C8'
		И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R12C8'
		И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R13C8'
		И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R16C8'
		И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R17C8'
		И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке						

	* Вводим источники данных
		Когда открылось окно "Edit tree"
		И из выпадающего списка с именем 'WorkMode' я выбираю точное значение "Indicators calculation formulas"
		* Выручка по валюте
			Тогда открылось окно "Edit tree"
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R2C2'
			И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
			И я нажимаю на кнопку с именем 'RefToIndicator1'
			И Я выбираю показатель с кодом 'RevenueInCurrency_Value' вида отчета 'VA - Currency indicators (source)'
			Тогда открылось окно "Edit tree *"
			И я нажимаю на кнопку с именем 'WriteAndCollapse'
		* Выручка по валюте [Средний курс за период]	
			Тогда открылось окно "Edit tree"
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R3C2'
			И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
			И я нажимаю на кнопку с именем 'RefToIndicator1'
			И Я выбираю показатель с кодом 'RevenueByCurrency_Value' вида отчета 'VA - Currency indicators (source)'
			Тогда открылось окно "Edit tree *"
			И я нажимаю на кнопку с именем 'WriteAndCollapse'
		* Выручка по валюте [Средний курс за период МСФО]	
			Тогда открылось окно "Edit tree"
			И я нажимаю на кнопку с именем 'CopyFormula'
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R4C2'
			И я нажимаю на кнопку с именем 'InsertFormula'
		* Выручка по валюте [Средний курс за период ЦБ]	
			И я нажимаю на кнопку с именем 'CopyFormula'
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R5C2'
			И я нажимаю на кнопку с именем 'InsertFormula'
		* Выручка по валюте [Курс на начало периода]	
			И я нажимаю на кнопку с именем 'CopyFormula'
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R6C2'
			И я нажимаю на кнопку с именем 'InsertFormula'
		* Выручка по валюте [Курс на конец периода]	
			И я нажимаю на кнопку с именем 'CopyFormula'
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R7C2'
			И я нажимаю на кнопку с именем 'InsertFormula'
		* Выручка по валюте [Средний курс за предыдущий период]	
			И я нажимаю на кнопку с именем 'CopyFormula'
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R8C2'
			И я нажимаю на кнопку с именем 'InsertFormula'
		* Выручка по валюте [Курс на конец предыдущего периода]	
			И я нажимаю на кнопку с именем 'CopyFormula'
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R9C2'
			И я нажимаю на кнопку с именем 'InsertFormula'
		* Выручка по валюте [Средний курс за предыдущий период ЦБ]	
			И я нажимаю на кнопку с именем 'CopyFormula'
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R10C2'
			И я нажимаю на кнопку с именем 'InsertFormula'
		* Выручка по валюте [Курс на дату указанную в показателе]	
			И я нажимаю на кнопку с именем 'CopyFormula'
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R12C2'
			И я нажимаю на кнопку с именем 'InsertFormula'
		* Выручка по валюте [Курс на дату указанную в показателе другого отчета]	
			И я нажимаю на кнопку с именем 'CopyFormula'
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R13C2'
			И я нажимаю на кнопку с именем 'InsertFormula'
		* Выручка по валюте [Курс указанный в показателе]	
			И я нажимаю на кнопку с именем 'CopyFormula'
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R16C2'
			И я нажимаю на кнопку с именем 'InsertFormula'
		* Выручка по валюте [Курс указанный в показателе другого отчета]	
			И я нажимаю на кнопку с именем 'CopyFormula'
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R17C2'
			И я нажимаю на кнопку с именем 'InsertFormula'
		* Дата курса	
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R11C2'
			И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
			И я нажимаю на кнопку с именем 'RefToIndicator1'
			И Я выбираю показатель с кодом 'CourseDate_Value' вида отчета 'VA - Currency indicators (source)'
			Тогда открылось окно "Edit tree *"
			И я нажимаю на кнопку с именем 'WriteAndCollapse'
		* Курс (EUR)	
			Тогда открылось окно "Edit tree"
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R14C2'
			И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
			И я нажимаю на кнопку с именем 'RefToIndicator1'
			И Я выбираю показатель с кодом 'RateEUR_Value' вида отчета 'VA - Currency indicators (source)'
			Тогда открылось окно "Edit tree *"
			И я нажимаю на кнопку с именем 'WriteAndCollapse'
			Тогда открылось окно "Edit tree"
		* Курс (USD)	
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R15C2'
			И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
			И я нажимаю на кнопку с именем 'RefToIndicator1'
			И Я выбираю показатель с кодом 'RateUSD_Value' вида отчета 'VA - Currency indicators (source)'
			Тогда открылось окно "Edit tree *"
			И я нажимаю на кнопку с именем 'WriteAndCollapse'
				
Сценарий: 09.06 Создание многопериодного бланка для вида отчета 'VA - Currency indicators (recipient)'

	И Я Для вида отчета 'VA - Currency indicators (recipient)' я создаю бланк по умолчанию

	* Открываем бланк
		И Я нахожу в списке вид отчета с именем 'VA - Currency indicators (recipient)'
		Тогда открылось окно "Report kinds and templates"
		И в таблице 'List' я перехожу к строке:
			| "Description"                        |
			| 'VA - Currency indicators (recipient)' |
		И в таблице 'List' я выбираю текущую строку
		И я запоминаю заголовок формы в переменную 'WindowTitle'

	* Добавляем колонку с значением валюта
		* Период отчета
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R1C3'
			И я выбираю пункт контекстного меню с именем 'SpreadsheetFieldTemplateContextMenuAddRowsRight' на элементе формы с именем 'SpreadsheetFieldTemlate'
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R5C3:R36C3'
			И я нажимаю на кнопку с именем 'CopyToClipboard'
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R5C4:R36C4'
			И я нажимаю на кнопку с именем 'PasteFromClipboard'
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R5C3:R5C4'
			И я нажимаю на кнопку с именем 'Union'
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R7C4:R8C4'
			И я нажимаю на кнопку с именем 'ClearUpContent'
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R9C4'
			И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
			Тогда открылось окно 'Indicator value filter settings'
			И я изменяю флаг с именем 'AmountInAddlCurrency'
			И я нажимаю на кнопку с именем 'FormApply'
			Тогда открылось окно '$WindowTitle$ *'
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R10C4'
			И я нажимаю на кнопку с именем 'ClearUpContent'
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R11C4'
			И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
			Тогда открылось окно 'Indicator value filter settings'
			И я изменяю флаг с именем 'AmountInAddlCurrency'
			И я нажимаю на кнопку с именем 'FormApply'
			Тогда открылось окно '$WindowTitle$ *'
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R12C4'
			И я нажимаю на кнопку с именем 'ClearUpContent'
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R13C4'
			И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
			Тогда открылось окно 'Indicator value filter settings'
			И я изменяю флаг с именем 'AmountInAddlCurrency'
			И я нажимаю на кнопку с именем 'FormApply'
			Тогда открылось окно '$WindowTitle$ *'
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R14C4'
			И я нажимаю на кнопку с именем 'ClearUpContent'
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R15C4'
			И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
			Тогда открылось окно 'Indicator value filter settings'
			И я изменяю флаг с именем 'AmountInAddlCurrency'
			И я нажимаю на кнопку с именем 'FormApply'
			Тогда открылось окно '$WindowTitle$ *'
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R16C4'
			И я нажимаю на кнопку с именем 'ClearUpContent'
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R17C4'
			И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
			Тогда открылось окно 'Indicator value filter settings'
			И я изменяю флаг с именем 'AmountInAddlCurrency'
			И я нажимаю на кнопку с именем 'FormApply'
			Тогда открылось окно '$WindowTitle$ *'
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R18C4'
			И я нажимаю на кнопку с именем 'ClearUpContent'
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R19C4'
			И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
			Тогда открылось окно 'Indicator value filter settings'
			И я изменяю флаг с именем 'AmountInAddlCurrency'
			И я нажимаю на кнопку с именем 'FormApply'
			Тогда открылось окно '$WindowTitle$ *'
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R20C4'
			И я нажимаю на кнопку с именем 'ClearUpContent'
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R21C4'
			И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
			Тогда открылось окно 'Indicator value filter settings'
			И я изменяю флаг с именем 'AmountInAddlCurrency'
			И я нажимаю на кнопку с именем 'FormApply'
			Тогда открылось окно '$WindowTitle$ *'
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R22C4'
			И я нажимаю на кнопку с именем 'ClearUpContent'
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R23C4'
			И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
			Тогда открылось окно 'Indicator value filter settings'
			И я изменяю флаг с именем 'AmountInAddlCurrency'
			И я нажимаю на кнопку с именем 'FormApply'
			Тогда открылось окно '$WindowTitle$ *'
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R24C4'
			И я нажимаю на кнопку с именем 'ClearUpContent'
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R25C4'
			И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
			Тогда открылось окно 'Indicator value filter settings'
			И я изменяю флаг с именем 'AmountInAddlCurrency'
			И я нажимаю на кнопку с именем 'FormApply'
			Тогда открылось окно '$WindowTitle$ *'
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R26C4:R27C4'
			И я нажимаю на кнопку с именем 'ClearUpContent'
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R28C4'
			И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
			Тогда открылось окно 'Indicator value filter settings'
			И я изменяю флаг с именем 'AmountInAddlCurrency'
			И я нажимаю на кнопку с именем 'FormApply'
			Тогда открылось окно '$WindowTitle$ *'
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R29C4'
			И я нажимаю на кнопку с именем 'ClearUpContent'
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R30C4'
			И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
			Тогда открылось окно 'Indicator value filter settings'
			И я изменяю флаг с именем 'AmountInAddlCurrency'
			И я нажимаю на кнопку с именем 'FormApply'
			Тогда открылось окно '$WindowTitle$ *'
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R31C4:R33C4'
			И я нажимаю на кнопку с именем 'ClearUpContent'
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R34C4'
			И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
			Тогда открылось окно 'Indicator value filter settings'
			И я изменяю флаг с именем 'AmountInAddlCurrency'
			И я нажимаю на кнопку с именем 'FormApply'
			Тогда открылось окно '$WindowTitle$ *'
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R35C4'
			И я нажимаю на кнопку с именем 'ClearUpContent'
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R36C4'
			И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
			Тогда открылось окно 'Indicator value filter settings'
			И я изменяю флаг с именем 'AmountInAddlCurrency'
			И я нажимаю на кнопку с именем 'FormApply'
		* Итог	
			Тогда открылось окно '$WindowTitle$ *'
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R1C5'
			// ДОДЕЛАТЬ: Почему-то не работает
			Если '$$LanguageИнтерфейса$$ = "Ru"' Тогда				
				И я выбираю пункт контекстного меню с именем 'SpreadsheetFieldTemplateContextMenuAddRowsRight' на элементе формы с именем 'SpreadsheetFieldTemlate'
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R5C5:R36C5'
			И я нажимаю на кнопку с именем 'CopyToClipboard'
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R5C6:R36C6'
			И я нажимаю на кнопку с именем 'PasteFromClipboard'
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R5C5:R5C6'
			И я нажимаю на кнопку с именем 'Union'
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R7C6:R8C6'
			И я нажимаю на кнопку с именем 'ClearUpContent'
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R9C6'
			И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
			Тогда открылось окно 'Indicator value filter settings'
			И я изменяю флаг с именем 'AmountInAddlCurrency'
			И я нажимаю на кнопку с именем 'FormApply'
			Тогда открылось окно '$WindowTitle$ *'
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R10C6'
			И я нажимаю на кнопку с именем 'ClearUpContent'
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R11C6'
			И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
			Тогда открылось окно 'Indicator value filter settings'
			И я изменяю флаг с именем 'AmountInAddlCurrency'
			И я нажимаю на кнопку с именем 'FormApply'
			Тогда открылось окно '$WindowTitle$ *'
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R12C6'
			И я нажимаю на кнопку с именем 'ClearUpContent'
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R13C6'
			И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
			Тогда открылось окно 'Indicator value filter settings'
			И я изменяю флаг с именем 'AmountInAddlCurrency'
			И я нажимаю на кнопку с именем 'FormApply'
			Тогда открылось окно '$WindowTitle$ *'
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R14C6'
			И я нажимаю на кнопку с именем 'ClearUpContent'
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R15C6'
			И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
			Тогда открылось окно 'Indicator value filter settings'
			И я изменяю флаг с именем 'AmountInAddlCurrency'
			И я нажимаю на кнопку с именем 'FormApply'
			Тогда открылось окно '$WindowTitle$ *'
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R16C6'
			И я нажимаю на кнопку с именем 'ClearUpContent'
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R17C6'
			И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
			Тогда открылось окно 'Indicator value filter settings'
			И я изменяю флаг с именем 'AmountInAddlCurrency'
			И я нажимаю на кнопку с именем 'FormApply'
			Тогда открылось окно '$WindowTitle$ *'
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R18C6'
			И я нажимаю на кнопку с именем 'ClearUpContent'
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R19C6'
			И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
			Тогда открылось окно 'Indicator value filter settings'
			И я изменяю флаг с именем 'AmountInAddlCurrency'
			И я нажимаю на кнопку с именем 'FormApply'
			Тогда открылось окно '$WindowTitle$ *'
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R20C6'
			И я нажимаю на кнопку с именем 'ClearUpContent'
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R21C6'
			И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
			Тогда открылось окно 'Indicator value filter settings'
			И я изменяю флаг с именем 'AmountInAddlCurrency'
			И я нажимаю на кнопку с именем 'FormApply'
			Тогда открылось окно '$WindowTitle$ *'
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R22C6'
			И я нажимаю на кнопку с именем 'ClearUpContent'
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R23C6'
			И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
			Тогда открылось окно 'Indicator value filter settings'
			И я изменяю флаг с именем 'AmountInAddlCurrency'
			И я нажимаю на кнопку с именем 'FormApply'
			Тогда открылось окно '$WindowTitle$ *'
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R24C6'
			И я нажимаю на кнопку с именем 'ClearUpContent'
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R25C6'
			И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
			Тогда открылось окно 'Indicator value filter settings'
			И я изменяю флаг с именем 'AmountInAddlCurrency'
			И я нажимаю на кнопку с именем 'FormApply'
			Тогда открылось окно '$WindowTitle$ *'
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R26C6:R27C6'
			И я нажимаю на кнопку с именем 'ClearUpContent'
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R28C6'
			И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
			Тогда открылось окно 'Indicator value filter settings'
			И я изменяю флаг с именем 'AmountInAddlCurrency'
			И я нажимаю на кнопку с именем 'FormApply'
			Тогда открылось окно '$WindowTitle$ *'
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R29C6'
			И я нажимаю на кнопку с именем 'ClearUpContent'
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R30C6'
			И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
			Тогда открылось окно 'Indicator value filter settings'
			И я изменяю флаг с именем 'AmountInAddlCurrency'
			И я нажимаю на кнопку с именем 'FormApply'
			Тогда открылось окно '$WindowTitle$ *'
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R31C6:R33C6'
			И я нажимаю на кнопку с именем 'ClearUpContent'
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R34C6'
			И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
			Тогда открылось окно 'Indicator value filter settings'
			И я изменяю флаг с именем 'AmountInAddlCurrency'
			И я нажимаю на кнопку с именем 'FormApply'
			Тогда открылось окно '$WindowTitle$ *'
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R35C6'
			И я нажимаю на кнопку с именем 'ClearUpContent'
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R36C6'
			И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
			Тогда открылось окно 'Indicator value filter settings'
			И я изменяю флаг с именем 'AmountInAddlCurrency'
			И я нажимаю на кнопку с именем 'FormApply'	
				
	* Записываем бланк
		Когда открылось окно '$WindowTitle$ *'
		И я нажимаю на кнопку с именем 'FormButtonWriteAndClose'
				
Сценарий: 09.07 Создание экземпляра отчета - 'VA - Currency indicators (recipient)' 

	И Я создаю экземпляр отчета для вида отчета 'VA - Currency indicators (recipient)' сценарий 'VA - Main scenario' период '1/1/2021' '3/31/2021' периодичность "Month" организация 'Mercury LLC' проект 'VA - Main project' аналитики '' '' '' '' '' '' 

	* Рассчитываем документ по правилу и сверяем результат
		И я нажимаю на кнопку с именем 'FormFillByDefault'
		Тогда табличный документ 'SpreadsheetFieldTemlate' равен:
			| 'VA - Currency indicators (recipient)'                                     | ''               | ''         | ''                | ''         | ''             | ''         | ''          | ''         |
			| ''                                                                        | ''               | ''         | ''                | ''         | ''             | ''         | ''          | ''         |
			| ''                                                                        | 'January 2021' | ''         | 'February 2021' | ''         | 'March 2021' | ''         | 'TOTAL'     | ''         |
			| ''                                                                        | 'Value'       | 'Value' | 'Value'        | 'Value' | 'Value'     | 'Value' | 'Value'  | 'Value' |
			| 'Revenue by currency'                                                       | '900,000'        | ''         | '900,000'         | ''         | '900,000'      | ''         | '2,700,000' | ''         |
			| 'LLC "Ganymede" '                                                          | '300,000'        | ''         | '300,000'         | ''         | '300,000'      | ''         | '900,000'   | ''         |
			| 'EUR '                                                                    | '110,000'        | '1,216'    | '110,000'         | '1,223'    | '110,000'      | '1,240'    | '330,000'   | '3,679'    |
			| 'RUB '                                                                    | '100,000'        | '100,000'  | '100,000'         | '100,000'  | '100,000'      | '100,000'  | '300,000'   | '300,000'  |
			| 'USD '                                                                    | '90,000'         | '1,213'    | '90,000'          | '1,210'    | '90,000'       | '1,210'    | '270,000'   | '3,632'    |
			| 'LLC "Io" '                                                               | '600,000'        | ''         | '600,000'         | ''         | '600,000'      | ''         | '1,800,000' | ''         |
			| 'EUR '                                                                    | '220,000'        | '2,431'    | '220,000'         | '2,446'    | '220,000'      | '2,481'    | '660,000'   | '7,358'    |
			| 'RUB '                                                                    | '200,000'        | '200,000'  | '200,000'         | '200,000'  | '200,000'      | '200,000'  | '600,000'   | '600,000'  |
			| 'USD '                                                                    | '180,000'        | '2,425'    | '180,000'         | '2,420'    | '180,000'      | '2,419'    | '540,000'   | '7,265'    |
			| 'Revenue by currency [Average rate for period]'                              | '900,000'        | ''         | '900,000'         | ''         | '900,000'      | ''         | '2,700,000' | ''         |
			| 'EUR '                                                                    | '330,000'        | '3,647'    | '330,000'         | '3,669'    | '330,000'      | '3,721'    | '990,000'   | '11,037'   |
			| 'RUB '                                                                    | '300,000'        | '300,000'  | '300,000'         | '300,000'  | '300,000'      | '300,000'  | '900,000'   | '900,000'  |
			| 'USD '                                                                    | '270,000'        | '3,638'    | '270,000'         | '3,630'    | '270,000'      | '3,629'    | '810,000'   | '10,897'   |
			| 'Revenue by currency [Average rate for IFRS period]'                         | '900,000'        | ''         | '900,000'         | ''         | '900,000'      | ''         | '2,700,000' | ''         |
			| 'EUR '                                                                    | '330,000'        | '3,605'    | '330,000'         | '3,613'    | '330,000'      | '3,682'    | '990,000'   | '10,900'   |
			| 'RUB '                                                                    | '300,000'        | '300,000'  | '300,000'         | '300,000'  | '300,000'      | '300,000'  | '900,000'   | '900,000'  |
			| 'USD '                                                                    | '270,000'        | '3,597'    | '270,000'         | '3,584'    | '270,000'      | '3,597'    | '810,000'   | '10,777'   |
			| 'Revenue by currency [Average rate for period CB]'                           | '900,000'        | ''         | '900,000'         | ''         | '900,000'      | ''         | '2,700,000' | ''         |
			| 'EUR '                                                                    | '330,000'        | '3,648'    | '330,000'         | '3,667'    | '330,000'      | '3,719'    | '990,000'   | '11,034'   |
			| 'RUB '                                                                    | '300,000'        | '300,000'  | '300,000'         | '300,000'  | '300,000'      | '300,000'  | '900,000'   | '900,000'  |
			| 'USD '                                                                    | '270,000'        | '3,641'    | '270,000'         | '3,627'    | '270,000'      | '3,631'    | '810,000'   | '10,899'   |
			| 'Revenue by currency [Exchange rate at the beginning of the period]'                              | '900,000'        | ''         | '900,000'         | ''         | '900,000'      | ''         | '2,700,000' | ''         |
			| 'EUR '                                                                    | '330,000'        | '3,635'    | '330,000'         | '3,575'    | '330,000'      | '3,651'    | '990,000'   | '10,862'   |
			| 'RUB '                                                                    | '300,000'        | '300,000'  | '300,000'         | '300,000'  | '300,000'      | '300,000'  | '900,000'   | '900,000'  |
			| 'USD '                                                                    | '270,000'        | '3,655'    | '270,000'         | '3,541'    | '270,000'      | '3,627'    | '810,000'   | '10,823'   |
			| 'Revenue by currency [Exchange rate at the end of the period]'                               | '900,000'        | ''         | '900,000'         | ''         | '900,000'      | ''         | '2,700,000' | ''         |
			| 'EUR '                                                                    | '330,000'        | '3,575'    | '330,000'         | '3,651'    | '330,000'      | '3,713'    | '990,000'   | '10,940'   |
			| 'RUB '                                                                    | '300,000'        | '300,000'  | '300,000'         | '300,000'  | '300,000'      | '300,000'  | '900,000'   | '900,000'  |
			| 'USD '                                                                    | '270,000'        | '3,541'    | '270,000'         | '3,627'    | '270,000'      | '3,567'    | '810,000'   | '10,735'   |
			| 'Revenue by currency [Average rate for the previous period]'                   | '0'              | ''         | '900,000'         | ''         | '900,000'      | ''         | '1,800,000' | ''         |
			| 'EUR '                                                                    | '0'              | '0'        | '330,000'         | '3,647'    | '330,000'      | '3,669'    | '660,000'   | '7,316'    |
			| 'RUB '                                                                    | '0'              | '0'        | '300,000'         | '300,000'  | '300,000'      | '300,000'  | '600,000'   | '600,000'  |
			| 'USD '                                                                    | '0'              | '0'        | '270,000'         | '3,638'    | '270,000'      | '3,630'    | '540,000'   | '7,268'    |
			| 'Revenue by currency [Exchange rate at the end of the previous period]'                   | '0'              | ''         | '900,000'         | ''         | '900,000'      | ''         | '1,800,000' | ''         |
			| 'EUR '                                                                    | '0'              | '0'        | '330,000'         | '3,575'    | '330,000'      | '3,651'    | '660,000'   | '7,227'    |
			| 'RUB '                                                                    | '0'              | '0'        | '300,000'         | '300,000'  | '300,000'      | '300,000'  | '600,000'   | '600,000'  |
			| 'USD '                                                                    | '0'              | '0'        | '270,000'         | '3,541'    | '270,000'      | '3,627'    | '540,000'   | '7,168'    |
			| 'Revenue by currency [Average rate for the previous period CB]'                | '0'              | ''         | '900,000'         | ''         | '900,000'      | ''         | '1,800,000' | ''         |
			| 'EUR '                                                                    | '0'              | '0'        | '330,000'         | '3,648'    | '330,000'      | '3,667'    | '660,000'   | '7,315'    |
			| 'RUB '                                                                    | '0'              | '0'        | '300,000'         | '300,000'  | '300,000'      | '300,000'  | '600,000'   | '600,000'  |
			| 'USD '                                                                    | '0'              | '0'        | '270,000'         | '3,641'    | '270,000'      | '3,627'    | '540,000'   | '7,268'    |
			| 'Course date'                                                              | '3/1/2021'     | ''         | '2/1/2021'      | ''         | '1/1/2021'   | ''         | ''          | ''         |
			| 'Revenue by currency [Exchange rate as of the date specified in the indicator]'                | '900,000'        | ''         | '900,000'         | ''         | '900,000'      | ''         | '2,700,000' | ''         |
			| 'EUR '                                                                    | '330,000'        | '3,651'    | '330,000'         | '3,575'    | '330,000'      | '3,635'    | '990,000'   | '10,862'   |
			| 'RUB '                                                                    | '300,000'        | '300,000'  | '300,000'         | '300,000'  | '300,000'      | '300,000'  | '900,000'   | '900,000'  |
			| 'USD '                                                                    | '270,000'        | '3,627'    | '270,000'         | '3,541'    | '270,000'      | '3,655'    | '810,000'   | '10,823'   |
			| 'Revenue by currency [Exchange rate as of the date specified in the indicator another report]' | '900,000'        | ''         | '900,000'         | ''         | '900,000'      | ''         | '2,700,000' | ''         |
			| 'EUR '                                                                    | '330,000'        | '3,651'    | '330,000'         | '3,575'    | '330,000'      | '3,635'    | '990,000'   | '10,862'   |
			| 'RUB '                                                                    | '300,000'        | '300,000'  | '300,000'         | '300,000'  | '300,000'      | '300,000'  | '900,000'   | '900,000'  |
			| 'USD '                                                                    | '270,000'        | '3,627'    | '270,000'         | '3,541'    | '270,000'      | '3,655'    | '810,000'   | '10,823'   |
			| 'Rate [EUR]'                                                              | '90'             | ''         | '91'              | ''         | '92'           | ''         | '0'         | ''         |
			| 'Rate [USD]'                                                              | '73'             | ''         | '74'              | ''         | '75'           | ''         | '0'         | ''         |
			| 'Revenue by currency [Rate specified in the indicator]'                        | '900,000'        | ''         | '900,000'         | ''         | '900,000'      | ''         | '2,700,000' | ''         |
			| 'EUR '                                                                    | '330,000'        | '3,667'    | '330,000'         | '3,626'    | '330,000'      | '3,587'    | '990,000'   | '10,880'   |
			| 'RUB '                                                                    | '300,000'        | '300,000'  | '300,000'         | '300,000'  | '300,000'      | '300,000'  | '900,000'   | '900,000'  |
			| 'USD '                                                                    | '270,000'        | '3,699'    | '270,000'         | '3,649'    | '270,000'      | '3,600'    | '810,000'   | '10,947'   |
			| 'Revenue by currency [Rate specified in the indicator another report]'         | '900,000'        | ''         | '900,000'         | ''         | '900,000'      | ''         | '2,700,000' | ''         |
			| 'EUR '                                                                    | '330,000'        | '3,667'    | '330,000'         | '3,626'    | '330,000'      | '3,587'    | '990,000'   | '10,880'   |
			| 'RUB '                                                                    | '300,000'        | '300,000'  | '300,000'         | '300,000'  | '300,000'      | '300,000'  | '900,000'   | '900,000'  |
			| 'USD '                                                                    | '270,000'        | '3,699'    | '270,000'         | '3,649'    | '270,000'      | '3,600'    | '810,000'   | '10,947'   |
	
	* Записываем документ	
		Когда открылось окно '$WindowTitle$'
		И я нажимаю на кнопку с именем 'FormWriteANDContinue'

	* Сравниваем движения
		Тогда Открылся экземпляр отчета для вида отчета 'VA - Currency indicators (recipient)' валюта 'RUB' организация 'Mercury LLC' сценарий 'VA - Main scenario' периодичность "Month" проект 'VA - Main project' аналитики '' '' '' '' '' '' 
		И я нажимаю на кнопку с именем 'FormOpenDocRegisterRecordsFlatTab'
		Тогда открылось окно "Flat table of indicator values"
		И я жду когда в табличном документе 'ReportSpreadsheetDocument' заполнится ячейка 'R2C1' в течение 30 секунд
		Дано Табличный документ 'ReportSpreadsheetDocument' равен макету 'Макеты\ВА_ВалютныеПоказатели_Приемник_Движения_En_En.mxl' по шаблону
		И Я закрываю окно "Flat table of indicator values"
