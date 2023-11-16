#language: ru
@tree

Функционал: 13. Рекурсия в расчетах

	Как Администратор я хочу
	Проверить что рекурсия в расчетах отлавливается

Контекст: 

	И я закрыл все окна клиентского приложения	

Сценарий: 13.00 Определеняем тип приложения

	И я закрываю TestClient "CPM - Budget"
	И я подключаю TestClient "CPM - Budget" логин "Administrator" пароль ''
	Пусть Инициализация переменных

Сценарий: 13.01 Создаем вид отчета с рекурсией расчета показателей

	* Создаем вид отчета
		И Я создаю группу видов отчетов с именем "VA - Transformations period (group)" и родителем "VA - Report group"
		И Я создаю вид отчета с именем "VA - Transformation period" и родителем "VA - Transformations period (group)"
		
	* Настраиваем структуру вида отчета
		И Я открываю контруктор отчета с именем "VA - Transformation period"
		И Я в конструкторе отчета добавляю строку с именем "Source"
		И Я в конструкторе отчета добавляю строку с именем "Destination"
		И Я в конструкторе отчета добавляю строку с именем "Accumulation"
		И Я в конструкторе отчета добавляю строку с именем "Total"
		И Я в конструкторе отчета добавляю колонку с именем "Amount"

	* Настраиваем формулы расчета
		Когда открылось окно "Report wizard"
		И из выпадающего списка с именем 'WorkMode' я выбираю точное значение "Indicators calculation formulas"
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R3C2'
		И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R2C2'
		И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
		И я нажимаю на кнопку с именем 'ButtonPlus'
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R5C2'
		И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
		И я нажимаю на кнопку с именем 'WriteAndCollapse'
		Тогда открылось окно "Report wizard"
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R4C2'
		И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R3C2'
		И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
		И я нажимаю на кнопку с именем 'WriteAndCollapse'
		Тогда открылось окно "Report wizard"
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R5C2'
		И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R4C2'
		И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
		И я нажимаю на кнопку с именем 'WriteAndCollapse'				

	* Создаем бланк сводной таблицы
		И Я для вида отчета "VA - Transformation period" создаю бланк сводной таблицы по умолчанию с отборами "Cash flow items"

Сценарий: 13.02 Вводим данные в сводную таблицу, получаем ошибку рекурсивного расчета

	* Открываем сводную таблицу
		И Я октрываю сводную таблицу отчета с именем "VA - Transformation period"
		И Я устанавливаю отборы сводной таблицы: дата начала '1/1/2024', дата конца '3/31/2024', валюта 'RUB', сценарий "VA - Main scenario", организация "Mercury LLC"	
		И я запоминаю заголовок формы в переменную 'WindowTitle'	

	* Вводим значение
		Когда открылось окно '$WindowTitle$'
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R4C2'
		И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
		И в табличный документ 'SpreadsheetFieldTemlate' я ввожу текст '100.00000'
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R4C3'
		Тогда открылось окно "Protocol"
		И я нажимаю на кнопку с именем 'FormTechnicalInformation'
		Тогда табличный документ 'SpreadsheetDocumentField' равен:
				| "Errors"                                                                                                                                | '' | ''                                                                                                                     |
				| "Recursion is found in links when calculating the indicator: \"Destination amount\".\nCheck calculation formulas and rewrite the calculation rule."   | '' | "{\"S\",\"Calculation tree:\n	Total amount\n		Accumulation amount\n			Destination amount\n				Source amount\n				Total amount\"}"      |
				| "Recursion is found in links when calculating the indicator: \"Accumulation amount\".\nCheck calculation formulas and rewrite the calculation rule." | '' | "{\"S\",\"Calculation tree:\n	Destination amount\n		Source amount\n		Total amount\n			Accumulation amount\n				Destination amount\"}"    |
				| "Recursion is found in links when calculating the indicator: \"Total amount\".\nCheck calculation formulas and rewrite the calculation rule."       | '' | "{\"S\",\"Calculation tree:\n	Accumulation amount\n		Destination amount\n			Source amount\n			Total amount\n				Accumulation amount\"}" |
		И Я закрываю окно "Protocol"
		Когда открылось окно '$WindowTitle$'
		И Я закрываю окно '$WindowTitle$'
		Тогда открылось окно "1C:Enterprise"
		И я нажимаю на кнопку с именем 'Button1'

Сценарий: 13.03 Перенастраиваем структуру вида отчета

	* Настраиваем структуру вида отчета
		И Я открываю контруктор отчета с именем "VA - Transformation period"

	* Приемник
		Когда открылось окно "Report wizard"
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R3C2'
		И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
		И в поле с именем 'TextDocumentFieldProcedure' я ввожу текст "[VATransformationPeriod_Source_Amount]"
		И я нажимаю на кнопку с именем 'WriteAndCollapse'				

	* Накопление
		Когда открылось окно "Report wizard"	
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R4C2'
		И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
		И я нажимаю на кнопку с именем 'AddOperand1'
		Тогда открылось окно "Data sources"
		И я нажимаю на кнопку с именем 'FormCreate'
		Тогда открылось окно "Data source (create)"
		И из выпадающего списка с именем 'ReportTypeFilter' я выбираю по строке "VA - Transformation period"
		И я нажимаю кнопку выбора у поля с именем 'IndicatorFilter'
		И Я выбираю показатель с кодом "Accumulation_Amount"
		Тогда открылось окно "Data source (create) *"
		И я перехожу к закладке с именем 'FiltersPage'
		И в таблице 'TreeOfFilterParametersDB' я перехожу к строке:
			| "Filter"         | "Field"            |
			| "Report period" | "[Report period]" |
		И в таблице 'TreeOfFilterParametersDB' я активизирую поле с именем 'ParameterCalculationMethod'
		И в таблице 'TreeOfFilterParametersDB' из выпадающего списка с именем 'ParameterCalculationMethod' я выбираю точное значение "Report period with a shift"
		И в таблице 'TreeOfFilterParametersDB' я активизирую поле с именем 'DefiningMethodClarification'
 		И в таблице 'TreeOfFilterParametersDB' в поле с именем 'DefiningMethodClarification' я ввожу текст '-1'
		И я нажимаю на кнопку с именем 'FormWriteAndClose'
		И я жду закрытия окна "Data source (create) *" в течение 20 секунд
		Тогда открылось окно "Data sources"
		И в таблице 'List' я выбираю текущую строку
		Тогда открылось окно "Report wizard *"
		И в поле с именем 'TextDocumentFieldProcedure' я ввожу текст "[VATransformationPeriod_Accumulation_Amount01] + [VATransformationPeriod_Destination_Amount]"
		И я нажимаю на кнопку с именем 'WriteAndCollapse'

	* Итог
		Когда открылось окно "Report wizard"
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R5C2'
		И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
		И я нажимаю на кнопку с именем 'AddOperand1'
		Тогда открылось окно "Data sources"
		И я выбираю пункт контекстного меню с именем 'ListContextMenuChange' на элементе формы с именем 'List'
		Тогда открылось окно "VA - Transformation period_Accumulation Amount (Data source)"
		И я перехожу к закладке с именем 'FiltersPage'
		И в таблице 'TreeOfFilterParametersDB' я перехожу к строке:
			| "Filter"         | "Field"            |
			| "Report period" | "[Report period]" |
		И в таблице 'TreeOfFilterParametersDB' я активизирую поле с именем 'ParameterCalculationMethod'
		И в таблице 'TreeOfFilterParametersDB' я выбираю текущую строку
		И в таблице 'TreeOfFilterParametersDB' я выбираю текущую строку
		И в таблице 'TreeOfFilterParametersDB' из выпадающего списка с именем 'ParameterCalculationMethod' я выбираю точное значение "Not filtered"
		И в таблице 'TreeOfFilterParametersDB' я завершаю редактирование строки
		И я нажимаю на кнопку с именем 'FormWriteAndClose'
		И я жду закрытия окна "VA - Transformation period_Accumulation Amount (Data source) *" в течение 20 секунд
		Тогда открылось окно "Data sources"
		И Я закрываю окно "Data sources"
		Тогда открылось окно "Report wizard"
		И я нажимаю на кнопку с именем 'UndoFormulaEdit'
				
Сценарий: 13.04 Проверяем расчет в сводной таблице

	* Открываем сводную таблиц
		И Я октрываю сводную таблицу отчета с именем "VA - Transformation period"

	* Вводим значения
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R4C2'
		И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
		И в табличный документ 'SpreadsheetFieldTemlate' я ввожу текст '100.00000'
		Когда открылось окно '$WindowTitle$ *'
		Тогда табличный документ 'SpreadsheetFieldTemlate' равен:
			| "VA - Transformation period (pivot table)" | "January 2024" | "February 2024" | "March 2024" | "TOTAL" |
			| "VA - Transformation period (pivot table)" | "Amount"          | "Amount"           | "Amount"        | "Amount" |
			| "Source"                                      | '100'            | '0'               | '0'            | '100'   |
			| "Destination"                                      | '100'            | '0'               | '0'            | '100'   |
			| "Accumulation"                                    | '100'            | '100'             | '100'          | '300'   |
			| "Total"                                          | '300'            | '300'             | '300'          | '900'   |

	* Вводим значения			
		Когда открылось окно '$WindowTitle$ *'
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R4C3'
		И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
		И в табличный документ 'SpreadsheetFieldTemlate' я ввожу текст '200.00000'
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R4C4'
		И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
		И в табличный документ 'SpreadsheetFieldTemlate' я ввожу текст '300.00000'
		Тогда табличный документ 'SpreadsheetFieldTemlate' равен:
			| "VA - Transformation period (pivot table)" | "January 2024" | "February 2024" | "March 2024" | "TOTAL" |
			| "VA - Transformation period (pivot table)" | "Amount"          | "Amount"           | "Amount"        | "Amount" |
			| "Source"                                      | '100'            | '200'             | '300'          | '600'   |
			| "Destination"                                      | '100'            | '200'             | '300'          | '600'   |
			| "Accumulation"                                    | '100'            | '300'             | '600'          | '1,000' |
			| "Total"                                          | '1,000'          | '1,000'           | '1,000'        | '3,000' |
			
	* Сохраняем результат
		Когда открылось окно '$WindowTitle$ *'
		И Я закрываю окно '$WindowTitle$ *'
		Тогда открылось окно "1C:Enterprise"
		И я нажимаю на кнопку с именем 'Button0'
									
