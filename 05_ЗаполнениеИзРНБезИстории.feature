#language: ru
@tree

Функционал: 05. Проверка видов отчета без сохранения истории, проверка заполнения данных из РБ

Как Администратор я хочу
Проверить что виды отчетов без истории корректно сохраняют версии
чтобы версии записывались без ошибок

Контекст: 

	И я подключаю TestClient 'CPM - Budgeting' логин "Administrator" пароль ''
	И я закрыл все окна клиентского приложения

Сценарий: 05.00 Определение типа приложения

	Пусть Инициализация переменных

Сценарий: 05.01 Создание вида отчета 'VA - Заполнение From_SSLy РН (без истории)'

	И Я создаю вид отчета с именем 'VA - Заполнение From_SSLy РН (без истории)' и родителем 'VA - Report group'
	И Я для вида отчета 'VA - Заполнение From_SSLy РН (без истории)' изменяю флаг 'IsChangeTrackingEnabled'
	И Я для вида отчета 'VA - Заполнение From_SSLy РН (без истории)' изменяю флаг 'ProjectSeparation'
	
	* Редактируем структуру отчета
		И Я открываю контруктор отчета с именем 'VA - Заполнение From_SSLy РН (без истории)'
		И Я в конструкторе отчета добавляю строку с именем 'Cash flow items'
		И Я в конструкторе отчета добавляю колонку с именем 'Sum'
		И Я в конструкторе отчета добавляю аналитику с кодом 'VA0CFItems' в ячейку 'R2C2'

	И Я Для вида отчета 'VA - Заполнение From_SSLy РН (без истории)' я создаю бланк по умолчанию

Сценарий: 05.02 Создаем формулу расчета с заполнением из РН

	Если 'NOT $$ЭтоPerform$$' Тогда

		И Я открываю контруктор отчета с именем 'VA - Заполнение From_SSLy РН (без истории)'
					
		* Вводим формулу расчета
			* Создаем новый элемент	
				Тогда открылось окно "Edit tree"
				И из выпадающего списка с именем 'WorkMode' я выбираю точное значение "Indicators calculation formulas"
				И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R2C2'
				И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
				И в поле с именем 'TextDocFieldProcedure' я ввожу текст ' '
				И я нажимаю на кнопку с именем 'AddOperand1'
				Когда открылось окно "Data sources"
				И я нажимаю на кнопку с именем 'FormCreate'
			* Заполняем источник получения, проверяем заполнение полей				
				Когда открылось окно "Data source (create)"
				И из выпадающего списка с именем 'ReceiptOption' я выбираю точное значение "Current infobase accumulation register"
				И из выпадающего списка с именем 'DBAccumulationRegister' я выбираю по строке 'CashFlowsCPM'
				Тогда таблица 'MappingTable' стала равной:
					| 'Dimension приемника'     | 'Method заполнения' | 'Name колонки'                      | 'Kind аналитики' |
					| 'Dimension 1: Cash flow items' | 'Field источника'    | 'Item движения денежных sredstv' | 'Cash flow items'    |
				И у элемента с именем 'DBRegisterResource' я жду значения 'Sum' в течение 10 секунд
				И у элемента с именем 'TotalTypeDB' я жду значения 'Turnover' в течение 10 секунд			
			* Заполняем отборы		
				И я перехожу к закладке с именем 'FiltersPage'
				И в таблице 'TreeOfFilterParametersDB' я перехожу к строке:
					| 'Filter'         | 'Field'         |
					| 'Project report' | '[Dimension1]' |
				И я нажимаю на кнопку с именем 'TreeOfFilterParametersDBDelete'	
				И в таблице 'TreeOfFilterParametersDB' я перехожу к строке:
					| 'Filter'           | 'Field'         |
					| 'Scenario report' | '[Dimension2]' |
				И я нажимаю на кнопку с именем 'TreeOfFilterParametersDBDelete'
				И в таблице 'TreeOfFilterParametersDB' я перехожу к строке:
					| 'Filter'         | 'Field'         |
					| "Report period" | '[Dimension3]' |
				И я нажимаю на кнопку с именем 'TreeOfFilterParametersDBDelete'	
				И я нажимаю на кнопку с именем 'FormWriteAndClose'
				И я жду закрытия окна "Data source (create) *" в течение 20 секунд

		* Сохраняем элемент		
			Тогда открылось окно "Data sources"
			И в таблице 'List' я выбираю текущую строку
			Тогда открылось окно "Edit tree *"
			И я нажимаю на кнопку с именем 'WriteAndCollapse'

Сценарий: 05.03 Создание экземпляра отчета - 'VA - Заполнение From_SSLy РН (без истории)' без записи 

	Если 'NOT $$ЭтоPerform$$' Тогда

		И Я создаю экземпляр отчета для вида отчета 'VA - Заполнение From_SSLy РН (без истории)' сценарий 'VA - Main scenario' период '1/1/2021' '3/31/2021' периодичность 'Month' организация 'Mercury LLC' проект 'VA - Main project' аналитики '' '' '' '' '' '' 
		
		* Документ должен быть пустой
			И табличный документ 'SpreadsheetFieldTemlate' равен:
				| 'VA - Заполнение From_SSLy РН (без истории)' | ''               | ''                | ''             | ''      |
				| ''                                    | ''               | ''                | ''             | ''      |
				| ''                                    | 'January 2021' | 'February 2021' | 'March 2021' | 'TOTAL' |
				| ''                                    | 'Sum'          | 'Sum'           | 'Sum'        | 'Sum' |
				| 'Cash flow items'                          | '0'              | '0'               | '0'            | '0'     |

		* Рассчитываем значения показателей	
			Когда открылось окно '$WindowTitle$'
			И я нажимаю на кнопку с именем 'FormFillByDefault'
			Тогда табличный документ 'SpreadsheetFieldTemlate' равен:
				| 'VA - Заполнение From_SSLy РН (без истории)' | ''               | ''                | ''             | ''           |
				| ''                                    | ''               | ''                | ''             | ''           |
				| ''                                    | 'January 2021' | 'February 2021' | 'March 2021' | 'TOTAL'      |
				| ''                                    | 'Sum'          | 'Sum'           | 'Sum'        | 'Sum'      |
				| 'Cash flow items'                          | '3,120,000'      | '16,000,000'      | '0'            | '19,120,000' |
				| 'Software upgrade '      | '0'              | '3,450,000'       | '0'            | '3,450,000'  |
				| 'Software implementation '    | '2,340,000'      | '7,350,000'       | '0'            | '9,690,000'  |
				| 'Software sale '   | '780,000'        | '5,200,000'       | '0'            | '5,980,000'  |

		* Закрываем без записи
			Когда открылось окно '$WindowTitle$'
			И Я закрываю окно '$WindowTitle$'
			Тогда открылось окно "1C:Enterprise"
			И я нажимаю на кнопку с именем 'Button1'

Сценарий: 05.04 Создание экземпляра отчета - 'VA - Заполнение From_SSLy РН (без истории)' с записью 

	Если 'NOT $$ЭтоPerform$$' Тогда

		И Я создаю экземпляр отчета для вида отчета 'VA - Заполнение From_SSLy РН (без истории)' сценарий 'VA - Main scenario' период '1/1/2021' '3/31/2021' периодичность 'Month' организация 'Mercury LLC' проект 'VA - Main project' аналитики '' '' '' '' '' '' 

		* Документ должен быть пустой
			И табличный документ 'SpreadsheetFieldTemlate' равен:
				| 'VA - Заполнение From_SSLy РН (без истории)' | ''               | ''                | ''             | ''      |
				| ''                                    | ''               | ''                | ''             | ''      |
				| ''                                    | 'January 2021' | 'February 2021' | 'March 2021' | 'TOTAL' |
				| ''                                    | 'Sum'          | 'Sum'           | 'Sum'        | 'Sum' |
				| 'Cash flow items'                          | '0'              | '0'               | '0'            | '0'     |

		* Рассчитываем значения показателей	
			Когда открылось окно '$WindowTitle$'
			И я нажимаю на кнопку с именем 'FormFillByDefault'
			Тогда табличный документ 'SpreadsheetFieldTemlate' равен:
				| 'VA - Заполнение From_SSLy РН (без истории)' | ''               | ''                | ''             | ''           |
				| ''                                    | ''               | ''                | ''             | ''           |
				| ''                                    | 'January 2021' | 'February 2021' | 'March 2021' | 'TOTAL'      |
				| ''                                    | 'Sum'          | 'Sum'           | 'Sum'        | 'Sum'      |
				| 'Cash flow items'                          | '3,120,000'      | '16,000,000'      | '0'            | '19,120,000' |
				| 'Software upgrade '      | '0'              | '3,450,000'       | '0'            | '3,450,000'  |
				| 'Software implementation '    | '2,340,000'      | '7,350,000'       | '0'            | '9,690,000'  |
				| 'Software sale '   | '780,000'        | '5,200,000'       | '0'            | '5,980,000'  |

		* Записываем документ, проверяем движения
			Когда открылось окно '$WindowTitle$'
			И я нажимаю на кнопку с именем 'FormWriteANDContinue'
			И я жду открытия формы '$WindowTitle$' в течение 30 секунд
			И я нажимаю на кнопку с именем 'FormOpenDocRegisterRecordsFlatTab'
			Тогда открылось окно "Flat table of indicator values"
			И я жду когда в табличном документе 'ReportSpreadsheetDocument' заполнится ячейка 'R2C1' в течение 30 секунд				
			Тогда табличный документ 'ReportSpreadsheetDocument' равен по шаблону:
				| "Filter:"                                  | "Report instance Equal to \"Report instance * , created on *\"" | ''       | ''                                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                    | ''                |
				| ''                                        | ''                                                   | ''       | ''                                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                    | ''                |
				| "Report indicator values synthetic"  | ''                                                   | ''       | ''                                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                    | ''                |
				| ''                                        | ''                                                   | ''       | ''                                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                    | ''                |
				| 'Indicator'                              | ''                                                   | ''       | 'Value'                         | ''                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                    | ''                |
				| 'Version'                                  | "Report period"                                      | 'Currency' | ''                                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                    | ''                |
				| 'Cash flow items сумма'                        | ''                                                   | ''       | ''                                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                    | ''                |
				| '*'                                       | 'January 2021'                                     | 'RUB'    | '3,120,000.00000'                  | ''                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                    | ''                |
				| '*'                                       | 'January 2021'                                     | 'USD'    | '42,036.96019'                     | ''                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                    | ''                |
				| '*'                                       | 'January 2021'                                     | 'EUR'    | '34,476.24288'                     | ''                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                    | ''                |
				| '*'                                       | 'February 2021'                                    | 'RUB'    | '16,000,000.00000'                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                    | ''                |
				| '*'                                       | 'February 2021'                                    | 'USD'    | '215,126.9181*'                    | ''                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                    | ''                |
				| '*'                                       | 'February 2021'                                    | 'EUR'    | '177,912.00250'                    | ''                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                    | ''                |
				| ''                                        | ''                                                   | ''       | ''                                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                    | ''                |
				| "Report indicators currency values"   | ''                                                   | ''       | ''                                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                    | ''                |
				| ''                                        | ''                                                   | ''       | ''                                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                    | ''                |
				| 'Indicator'                              | ''                                                   | ''       | ''                                 | 'Value'         | 'Value валюта'  | ''                 | ''                 | ''                 | ''                 | ''                    | ''                |
				| 'Version'                                  | "Report period"                                      | 'Currency' | 'Dimension валюта'                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                    | ''                |
				| ''                                        | ''                                                   | ''       | ''                                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                    | ''                |
				| "Report indicator values 1"          | ''                                                   | ''       | ''                                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                    | ''                |
				| ''                                        | ''                                                   | ''       | ''                                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                    | ''                |
				| 'Indicator'                              | ''                                                   | ''       | ''                                 | ''                 | 'Value'         | 'Value валюта'  | ''                 | ''                 | ''                 | ''                    | ''                |
				| 'Version'                                  | "Report period"                                      | 'Currency' | 'Dimension 1'                      | 'Dimension валюта' | ''                 | ''                 | ''                 | ''                 | ''                 | ''                    | ''                |
				| 'Cash flow items сумма'                        | ''                                                   | ''       | ''                                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                    | ''                |
				| '*'                                       | 'January 2021'                                     | 'RUB'    | 'Software implementation'  | ''                 | '2,340,000.00000'  | ''                 | ''                 | ''                 | ''                 | ''                    | ''                |
				| '*'                                       | 'January 2021'                                     | 'RUB'    | 'Software sale' | ''                 | '780,000.00000'    | ''                 | ''                 | ''                 | ''                 | ''                    | ''                |
				| '*'                                       | 'January 2021'                                     | 'USD'    | 'Software implementation'  | ''                 | '31,527.72014'     | ''                 | ''                 | ''                 | ''                 | ''                    | ''                |
				| '*'                                       | 'January 2021'                                     | 'USD'    | 'Software sale' | ''                 | '10,509.24005'     | ''                 | ''                 | ''                 | ''                 | ''                    | ''                |
				| '*'                                       | 'January 2021'                                     | 'EUR'    | 'Software implementation'  | ''                 | '25,857.18216'     | ''                 | ''                 | ''                 | ''                 | ''                    | ''                |
				| '*'                                       | 'January 2021'                                     | 'EUR'    | 'Software sale' | ''                 | '8,619.06072'      | ''                 | ''                 | ''                 | ''                 | ''                    | ''                |
				| '*'                                       | 'February 2021'                                    | 'RUB'    | 'Software upgrade'    | ''                 | '3,450,000.00000'  | ''                 | ''                 | ''                 | ''                 | ''                    | ''                |
				| '*'                                       | 'February 2021'                                    | 'RUB'    | 'Software implementation'  | ''                 | '7,350,000.00000'  | ''                 | ''                 | ''                 | ''                 | ''                    | ''                |
				| '*'                                       | 'February 2021'                                    | 'RUB'    | 'Software sale' | ''                 | '5,200,000.00000'  | ''                 | ''                 | ''                 | ''                 | ''                    | ''                |
				| '*'                                       | 'February 2021'                                    | 'USD'    | 'Software upgrade'    | ''                 | '46,386.7417*'     | ''                 | ''                 | ''                 | ''                 | ''                    | ''                |
				| '*'                                       | 'February 2021'                                    | 'USD'    | 'Software implementation'  | ''                 | '98,823.9280*'     | ''                 | ''                 | ''                 | ''                 | ''                    | ''                |
				| '*'                                       | 'February 2021'                                    | 'USD'    | 'Software sale' | ''                 | '69,916.24840'     | ''                 | ''                 | ''                 | ''                 | ''                    | ''                |
				| '*'                                       | 'February 2021'                                    | 'EUR'    | 'Software upgrade'    | ''                 | '38,362.27554'     | ''                 | ''                 | ''                 | ''                 | ''                    | ''                |
				| '*'                                       | 'February 2021'                                    | 'EUR'    | 'Software implementation'  | ''                 | '81,728.32615'     | ''                 | ''                 | ''                 | ''                 | ''                    | ''                |
				| '*'                                       | 'February 2021'                                    | 'EUR'    | 'Software sale' | ''                 | '57,821.40081'     | ''                 | ''                 | ''                 | ''                 | ''                    | ''                |
				| ''                                        | ''                                                   | ''       | ''                                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                    | ''                |
				| "Report indicator values 2"          | ''                                                   | ''       | ''                                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                    | ''                |
				| ''                                        | ''                                                   | ''       | ''                                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                    | ''                |
				| 'Indicator'                              | ''                                                   | ''       | ''                                 | ''                 | ''                 | 'Value'         | 'Value валюта'  | ''                 | ''                 | ''                    | ''                |
				| 'Version'                                  | "Report period"                                      | 'Currency' | 'Dimension 1'                      | 'Dimension 2'      | 'Dimension валюта' | ''                 | ''                 | ''                 | ''                 | ''                    | ''                |
				| ''                                        | ''                                                   | ''       | ''                                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                    | ''                |
				| "Report indicator values 3"          | ''                                                   | ''       | ''                                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                    | ''                |
				| ''                                        | ''                                                   | ''       | ''                                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                    | ''                |
				| 'Indicator'                              | ''                                                   | ''       | ''                                 | ''                 | ''                 | ''                 | 'Value'         | 'Value валюта'  | ''                 | ''                    | ''                |
				| 'Version'                                  | "Report period"                                      | 'Currency' | 'Dimension 1'                      | 'Dimension 2'      | 'Dimension 3'      | 'Dimension валюта' | ''                 | ''                 | ''                 | ''                    | ''                |
				| ''                                        | ''                                                   | ''       | ''                                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                    | ''                |
				| "Report indicator values 4"          | ''                                                   | ''       | ''                                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                    | ''                |
				| ''                                        | ''                                                   | ''       | ''                                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                    | ''                |
				| 'Indicator'                              | ''                                                   | ''       | ''                                 | ''                 | ''                 | ''                 | ''                 | 'Value'         | 'Value валюта'  | ''                    | ''                |
				| 'Version'                                  | "Report period"                                      | 'Currency' | 'Dimension 1'                      | 'Dimension 2'      | 'Dimension 3'      | 'Dimension4'       | 'Dimension валюта' | ''                 | ''                 | ''                    | ''                |
				| ''                                        | ''                                                   | ''       | ''                                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                    | ''                |
				| "Report indicator values 5"          | ''                                                   | ''       | ''                                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                    | ''                |
				| ''                                        | ''                                                   | ''       | ''                                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                    | ''                |
				| 'Indicator'                              | ''                                                   | ''       | ''                                 | ''                 | ''                 | ''                 | ''                 | ''                 | 'Value'         | 'Value валюта'     | ''                |
				| 'Version'                                  | "Report period"                                      | 'Currency' | 'Dimension 1'                      | 'Dimension 2'      | 'Dimension 3'      | 'Dimension4'       | 'Dimension5'       | 'Dimension валюта' | ''                 | ''                    | ''                |
				| ''                                        | ''                                                   | ''       | ''                                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                    | ''                |
				| "Report indicator values 6"          | ''                                                   | ''       | ''                                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                    | ''                |
				| ''                                        | ''                                                   | ''       | ''                                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                    | ''                |
				| 'Indicator'                              | ''                                                   | ''       | ''                                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                 | 'Value'            | 'Value валюта' |
				| 'Version'                                  | "Report period"                                      | 'Currency' | 'Dimension 1'                      | 'Dimension 2'      | 'Dimension 3'      | 'Dimension4'       | 'Dimension5'       | 'Dimension6'       | 'Dimension валюта' | ''                    | ''                |
				| ''                                        | ''                                                   | ''       | ''                                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                    | ''                |
				| "Report indicators non-numeric values" | ''                                                   | ''       | ''                                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                    | ''                |
				| ''                                        | ''                                                   | ''       | ''                                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                    | ''                |
				| 'Indicator'                              | ''                                                   | ''       | ''                                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                 | 'Value нечисловое' | ''                |
				| 'Version'                                  | "Report period"                                      | 'Currency' | 'Dimension 1'                      | 'Dimension 2'      | 'Dimension 3'      | 'Dimension4'       | 'Dimension5'       | 'Dimension6'       | 'Dimension валюта' | ''                    | ''                |
				| ''                                        | ''                                                   | ''       | ''                                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                    | ''                |
				| 'Comments znacheniy pokazateley'        | ''                                                   | ''       | ''                                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                    | ''                |
				| ''                                        | ''                                                   | ''       | ''                                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                    | ''                |
				| 'Indicator'                              | ''                                                   | ''       | ''                                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                 | 'Comment'         | ''                |
				| 'Version'                                  | "Report period"                                      | 'Currency' | 'Dimension 1'                      | 'Dimension 2'      | 'Dimension 3'      | 'Dimension4'       | 'Dimension5'       | 'Dimension6'       | 'Dimension валюта' | ''                    | ''                |
			
Сценарий: 05.05 Создаем формулу расчета с заполнением из РН по основной таблице

	Если 'NOT $$ЭтоPerform$$' Тогда

		И Я открываю контруктор отчета с именем 'VA - Заполнение From_SSLy РН (без истории)'
					
		* Вводим формулу расчета
			* Создаем новый элемент	
				Тогда открылось окно "Edit tree"
				И из выпадающего списка с именем 'WorkMode' я выбираю точное значение "Indicators calculation formulas"
				И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R2C2'
				И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
				И в поле с именем 'TextDocFieldProcedure' я ввожу текст ' '
				И я нажимаю на кнопку с именем 'AddOperand1'
				Когда открылось окно "Data sources"
				И я нажимаю на кнопку с именем 'FormCreate'
			* Заполняем источник получения, проверяем заполнение полей				
				Когда открылось окно "Data source (create)"
				И из выпадающего списка с именем 'ReceiptOption' я выбираю точное значение "Current infobase accumulation register"
				И из выпадающего списка с именем 'DBAccumulationRegister' я выбираю по строке 'CashFlowsCPM'
				И я устанавливаю флаг с именем 'RegisterMainTable'						
				И у элемента с именем 'DBRegisterResource' я жду значения 'Sum' в течение 10 секунд
				Тогда таблица 'FieldsTreeDB' стала равной по шаблону:
					| 'Field'                   |
					| 'Recorder'            |
					| 'Dimensions регистра(13)' |
					| 'Attributes регистра(0)'  |
				Тогда таблица 'MappingTable' стала равной:
					| 'Dimension приемника'     | 'Method заполнения' | 'Name колонки'                      | 'Kind аналитики' |
					| 'Dimension 1: Cash flow items' | 'Field источника'    | 'Item движения денежных sredstv' | 'Cash flow items'    |

			* Добавляем отборы
				И я перехожу к закладке с именем 'FiltersPage'		
				* Удаляем текущие отборы
					И я нажимаю на кнопку с именем 'TreeOfFilterParametersDBDelete'
					И в таблице 'TreeOfFilterParametersDB' я перехожу к строке:
						| 'Filter'         | 'Field'         |
						| 'Project report' | '[Dimension1]' |
					И я нажимаю на кнопку с именем 'TreeOfFilterParametersDBDelete'
					И в таблице 'TreeOfFilterParametersDB' я перехожу к строке:
						| 'Filter'           | 'Field'         |
						| 'Scenario report' | '[Dimension2]' |
					И я нажимаю на кнопку с именем 'TreeOfFilterParametersDBDelete'
					И в таблице 'TreeOfFilterParametersDB' я перехожу к строке:
						| 'Filter'         | 'Field'         |
						| "Report period" | '[Dimension3]' |
					И я нажимаю на кнопку с именем 'TreeOfFilterParametersDBDelete''			
				* Добавляем поля отбора
					Когда открылось окно "Data source (create) *"
					И в таблице 'FieldsTreeDB' я перехожу к строке:
						| 'Field'        |
						| 'Recorder' |
					И в таблице 'FieldsTreeDB' я разворачиваю текущую строку
					Если '$$IsERPCPM$$' Тогда
						И в таблице 'FieldsTreeDB' я перехожу к строке:
							| 'Field'                                              |
							| 'Document.BudgetingActualDataRecording' |
						И в таблице 'FieldsTreeDB' я разворачиваю текущую строку
					И в таблице 'FieldsTreeDB' я перехожу к строке:
						| 'Field'       |
						| 'Counterparty' |
					И в таблице 'FieldsTreeDB' я разворачиваю текущую строку
					И в таблице 'FieldsTreeDB' я перехожу к строке:
						| 'Field'       |
						| 'Catalog.Counterparties' |
					И я нажимаю на кнопку с именем 'AddConditionItem'
					И в таблице 'FieldsTreeDB' я перехожу к строке:
						| 'Field'     |
						| 'Scenario' |
					И я нажимаю на кнопку с именем 'AddConditionItem'
				* Добавляем значения отбора
					Когда открылось окно "Data source (create) *"
					И в таблице 'TreeOfFilterParametersDB' я перехожу к строке:
						| 'Filter'                      | 'Field'                      |
						| 'Date beginning периода report' | 'Date beginning otbora data_' |
					И в таблице 'TreeOfFilterParametersDB' из выпадающего списка с именем 'ParameterCalculationMethod' я выбираю точное значение "Start date of report period with a shift"
					И в таблице 'TreeOfFilterParametersDB' в поле с именем 'DefiningMethodClarification' я ввожу текст '-1'
					И в таблице 'TreeOfFilterParametersDB' я завершаю редактирование строки
					И в таблице 'TreeOfFilterParametersDB' я перехожу к строке:
						| 'Filter'                     | 'Field'                         |
						| 'Date end периода report' | 'Date end otbora data_' |
					И в таблице 'TreeOfFilterParametersDB' из выпадающего списка с именем 'ParameterCalculationMethod' я выбираю точное значение "Reporting period end date with a shift"
					И в таблице 'TreeOfFilterParametersDB' в поле с именем 'DefiningMethodClarification' я ввожу текст '-1'
					И в таблице 'TreeOfFilterParametersDB' я завершаю редактирование строки								
					И в таблице 'TreeOfFilterParametersDB' я перехожу к строке:
						| 'Field'                     |
						| '[Recorder].[Scenario]' |
					И в таблице 'TreeOfFilterParametersDB' я активизирую поле с именем 'ParameterCalculationMethod'
					И в таблице 'TreeOfFilterParametersDB' из выпадающего списка с именем 'ParameterCalculationMethod' я выбираю точное значение "Report scenario"
					И в таблице 'TreeOfFilterParametersDB' я завершаю редактирование строки				
					И в таблице 'TreeOfFilterParametersDB' я перехожу к строке:
						| 'Field'                       |
						| '[Recorder].[Counterparty]' |
					И в таблице 'TreeOfFilterParametersDB' из выпадающего списка с именем 'ParameterCalculationMethod' я выбираю точное значение "Fixed value"
					И в таблице 'TreeOfFilterParametersDB' я нажимаю кнопку выбора у реквизита с именем 'DefiningMethodClarification'
					Когда открылось окно "Counterparties*"
					И Я закрываю окно "Counterparties*"
					И в таблице 'TreeOfFilterParametersDB' из выпадающего списка с именем 'DefiningMethodClarification' я выбираю по строке 'LLC \"Ganymede\"'
					И в таблице 'TreeOfFilterParametersDB' я завершаю редактирование строки
						
			* Записываем элемент
				Когда открылось окно "Data source (create) *"
				И я нажимаю на кнопку с именем 'FormWriteAndClose'
				И я жду закрытия окна "Data source (create) *" в течение 20 секунд
		
		* Выбираем элемент в форме конструктура			
			Тогда открылось окно "Data sources"
			И в таблице 'List' я выбираю текущую строку
			Тогда открылось окно "Edit tree *"
			И я нажимаю на кнопку с именем 'WriteAndCollapse'

Сценарий: 05.06 Создаем и рассчитываем сводную таблицу для 'VA - Заполнение From_SSLy РН (без истории)'

	Если 'NOT $$ЭтоPerform$$' Тогда

		И Я нахожу в списке вид отчета с именем 'VA - Заполнение From_SSLy РН (без истории)'
						
		* Создаем бланк сводной таблицы
			Когда открылось окно "Report kinds and templates"
			И в таблице "List" я перехожу к строке:
				| 'Description'                                          |
				| 'VA - Заполнение From_SSLy РН (без истории) (pivot table)' |
			И в таблице 'List' я выбираю текущую строку
			* Состав строк
				Когда Открылся бланк сводной таблицы для вида отчета 'VA - Заполнение From_SSLy РН (без истории)'
				И я нажимаю на кнопку с именем 'ShowListOfRows'
				Тогда открылось окно "Set up line list"
				И в таблице 'SettingTree' я перехожу к строке:
					| 'Kind аналитики 1' | 'Group analitik' | 'Code'       | 'Purpose'      | 'String report' |
					| 'Cash flow items'      | 'GR_Статьи CashFlow'   | 'CashFlowItems' | 'Arbitrary_Parameters данные' | 'Cash flow items'    |
				И я нажимаю на кнопку с именем 'MoveLeft'
				И я нажимаю на кнопку с именем 'ApplyChanges'
			* Состав колонок	
				Тогда Открылся бланк сводной таблицы для вида отчета 'VA - Заполнение From_SSLy РН (без истории)'
				И я запоминаю заголовок формы в переменную 'WindowTitle'				
				И я нажимаю на кнопку с именем 'ShowListOfColumns'
				Тогда открылось окно "Set up column list"
				И в таблице 'PivotTableColumnsListSettings' я нажимаю на кнопку с именем 'PivotTableColumnsListSettingsAdd'
				И в таблице 'PivotTableColumnsListSettings' я нажимаю кнопку выбора у реквизита с именем 'PivotTableColumnsListSettingsReportColumn'
				Тогда открылось окно "Report columns"
				И в таблице 'List' я выбираю текущую строку
				Тогда открылось окно "Set up column list"
				И в таблице 'PivotTableColumnsListSettings' я завершаю редактирование строки
				И я нажимаю на кнопку с именем 'FormApply'
			* Расположение группировок
				Когда открылось окно '$WindowTitle$'
				И я нажимаю на кнопку с именем 'ShowTableSettingsByAxes'
				Тогда открылось окно "Set up field location"
				И в таблице 'TableAvailableFields' я перехожу к строке:
					| 'Available2 аналитики' |
					| 'Project'              |
				И я выбираю пункт контекстного меню с именем 'TableAvailableFieldsContextMenuMoveToFilters' на элементе формы с именем 'TableAvailableFields'
				И в таблице 'TableAvailableFields' я перехожу к строке:
					| 'Available2 аналитики' |
					| 'Cash flow items'          |
				И я выбираю пункт контекстного меню с именем 'TableAvailableFieldsContextMenuMoveToRows' на элементе формы с именем 'TableAvailableFields'
				И я нажимаю на кнопку с именем 'ButtonApply'
			* Шкала с периодами
				Тогда открылось окно '$WindowTitle$'
				И я нажимаю на кнопку с именем 'ShowPeriodsSettings'
				И из выпадающего списка с именем 'Periodicity' я выбираю точное значение "Quarter"
				И из выпадающего списка с именем 'Periodicity' я выбираю точное значение "Month"
				И я изменяю флаг с именем 'ShouldShowTotalYear'
				И я изменяю флаг с именем 'ShouldShowTotalYear'
				И я изменяю флаг с именем 'ShouldShowTotal6Months'
				И я изменяю флаг с именем 'ShouldShowTotal6Months'
				И я изменяю флаг с именем 'ShouldShowTotalQuarter'
				И я изменяю флаг с именем 'ShouldShowTotalQuarter'
				И я нажимаю на кнопку с именем 'FormApply'
			* Расположение полей 
				Тогда открылось окно '$WindowTitle$'
				И я нажимаю на кнопку с именем 'ShowDimensionCompositionSettings'
				Тогда открылось окно "Row and column dimension list settings"
				И я нажимаю на кнопку с именем 'FormApply'
			* Запись бланка
				Тогда открылось окно '$WindowTitle$'
				И я разворачиваю группу с именем 'GroupOfMainAttributes'
				И я нажимаю на кнопку с именем 'FormWriteAndClose'
				И я жду закрытия окна '$WindowTitle$ *' в течение 20 секунд

		* Создаем сводную таблицу			
			Когда открылось окно "Report kinds and templates"
			И я нажимаю на кнопку с именем 'SwitchToDataDisplayMode'
			И Открылась сводная таблица для вида отчета 'VA - Заполнение From_SSLy РН (без истории)'
			И Я устанавливаю отборы сводной таблицы: дата начала '1/1/2021', дата конца '3/31/2021', валюта 'RUB', сценарий 'VA - Main scenario', организация 'Mercury LLC'
			И Я устанавливаю отбор сводной таблицы 'Project' со значением 'VA - Main project'	
			Тогда табличный документ 'SpreadsheetFieldTemlate' равен:
				| 'VA - Заполнение From_SSLy РН (без истории) (pivot table)' | 'January 2021' | 'February 2021' | 'March 2021' |
				| 'VA - Заполнение From_SSLy РН (без истории) (pivot table)' | 'Sum'          | 'Sum'           | 'Sum'        |
				| 'Cash flow items'                                            | '3,120,000'      | '16,000,000'      | '0'            |
				| 'Software upgrade'                         | '0'              | '3,450,000'       | '0'            |
				| 'Software implementation'                       | '2,340,000'      | '7,350,000'       | '0'            |
				| 'Software sale'                      | '780,000'        | '5,200,000'       | '0'            |
		
		* Рассчитываем по регламенту
			И Открылась сводная таблица для вида отчета 'VA - Заполнение From_SSLy РН (без истории)'
			И я запоминаю заголовок формы в переменную "TitleОкна"			
			И я нажимаю на кнопку с именем 'RecalculateByRule'
			Тогда открылось окно "Processing rule selection"
			И в таблице 'ProcessingRulesList' я перехожу к строке:
				| 'Rule'                 |
				| 'Fill по регламенту' |
			И в таблице 'ProcessingRulesList' я выбираю текущую строку
			И я жду открытия формы '$WindowTitle$' в течение 30 секунд
			Тогда табличный документ 'SpreadsheetFieldTemlate' равен:
				| 'VA - Заполнение From_SSLy РН (без истории) (pivot table)' | 'January 2021' | 'February 2021' | 'March 2021' |
				| 'VA - Заполнение From_SSLy РН (без истории) (pivot table)' | 'Sum'          | 'Sum'           | 'Sum'        |
				| 'Cash flow items'                                            | '0'              | '3,120,000'       | '0'            |
				| 'Software implementation'                       | '0'              | '2,340,000'       | '0'            |
				| 'Software sale'                      | '0'              | '780,000'         | '0'            |

		* Рассчитываем по правилу
			Когда открылось окно '$WindowTitle$'
			И я нажимаю на кнопку с именем 'RecalculateByRule'
			Тогда открылось окно "Processing rule selection"
			И в таблице 'ProcessingRulesList' я перехожу к строке:
				| 'Rule'                             |
				| 'VA - Заполнение From_SSLy РН (без истории)' |
			И я нажимаю на кнопку с именем 'Evaluate'
			И я жду открытия формы '$WindowTitle$' в течение 30 секунд
			Тогда табличный документ 'SpreadsheetFieldTemlate' равен:
				| 'VA - Заполнение From_SSLy РН (без истории) (pivot table)' | 'January 2021' | 'February 2021' | 'March 2021' |
				| 'VA - Заполнение From_SSLy РН (без истории) (pivot table)' | 'Sum'          | 'Sum'           | 'Sum'        |
				| 'Cash flow items'                                            | '0'              | '3,120,000'       | '0'            |
				| 'Software implementation'                       | '0'              | '2,340,000'       | '0'            |
				| 'Software sale'                      | '0'              | '780,000'         | '0'            |

		* Сохраняем таблицу
			Когда открылось окно '$WindowTitle$'
			И Я закрываю окно '$WindowTitle$'

Сценарий: 05.07 Проверяем движения экземпляра отчета - 'Заполнение From_SSLy РН (без истории)'

	Если 'NOT $$ЭтоPerform$$' Тогда

		И Я открываю первый экземпляр отчета для вида отчета 'VA - Заполнение From_SSLy РН (без истории)'
		И Открылся экземпляр отчета для вида отчета 'VA - Заполнение From_SSLy РН (без истории)' валюта 'RUB' организация 'Mercury LLC' сценарий 'VA - Main scenario' периодичность "Month" проект 'VA - Main project' аналитики '' '' '' '' '' '' 
		Тогда табличный документ 'SpreadsheetFieldTemlate' равен:
			| 'VA - Заполнение From_SSLy РН (без истории)' | ''               | ''                | ''             | ''          |
			| ''                                    | ''               | ''                | ''             | ''          |
			| ''                                    | 'January 2021' | 'February 2021' | 'March 2021' | 'TOTAL'     |
			| ''                                    | 'Sum'          | 'Sum'           | 'Sum'        | 'Sum'     |
			| 'Cash flow items'                          | '0'              | '3,120,000'       | '0'            | '3,120,000' |
			| 'Software implementation '    | '0'              | '2,340,000'       | '0'            | '2,340,000' |
			| 'Software sale '   | '0'              | '780,000'         | '0'            | '780,000'   |

		* Проверяем, движения после сводной таблицы
			Когда открылось окно '$WindowTitle$'
			И я нажимаю на кнопку с именем 'FormOpenDocRegisterRecordsFlatTab'
			Тогда открылось окно "Flat table of indicator values"
			И я жду когда в табличном документе 'ReportSpreadsheetDocument' заполнится ячейка 'R2C1' в течение 30 секунд
			Тогда табличный документ 'ReportSpreadsheetDocument' равен по шаблону:
				| "Filter:"                                  | "Report instance Equal to \"Report instance * , created on *\"" | ''       | ''                                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                    | ''                |
				| ''                                        | ''                                                   | ''       | ''                                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                    | ''                |
				| "Report indicator values synthetic"  | ''                                                   | ''       | ''                                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                    | ''                |
				| ''                                        | ''                                                   | ''       | ''                                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                    | ''                |
				| 'Indicator'                              | ''                                                   | ''       | 'Value'                         | ''                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                    | ''                |
				| 'Version'                                  | "Report period"                                      | 'Currency' | ''                                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                    | ''                |
				| 'Cash flow items сумма'                        | ''                                                   | ''       | ''                                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                    | ''                |
				| '*'                                       | 'January 2021'                                     | 'RUB'    | ''                                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                    | ''                |
				| '*'                                       | 'January 2021'                                     | 'USD'    | ''                                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                    | ''                |
				| '*'                                       | 'January 2021'                                     | 'EUR'    | '*'                                | ''                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                    | ''                |
				| '*'                                       | 'February 2021'                                    | 'RUB'    | '3,120,000.00000'                  | ''                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                    | ''                |
				| '*'                                       | 'February 2021'                                    | 'USD'    | '41,949.7490*'                     | ''                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                    | ''                |
				| '*'                                       | 'February 2021'                                    | 'EUR'    | '34,692.84049'                     | ''                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                    | ''                |
				| ''                                        | ''                                                   | ''       | ''                                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                    | ''                |
				| "Report indicators currency values"   | ''                                                   | ''       | ''                                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                    | ''                |
				| ''                                        | ''                                                   | ''       | ''                                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                    | ''                |
				| 'Indicator'                              | ''                                                   | ''       | ''                                 | 'Value'         | 'Value валюта'  | ''                 | ''                 | ''                 | ''                 | ''                    | ''                |
				| 'Version'                                  | "Report period"                                      | 'Currency' | 'Dimension валюта'                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                    | ''                |
				| ''                                        | ''                                                   | ''       | ''                                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                    | ''                |
				| "Report indicator values 1"          | ''                                                   | ''       | ''                                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                    | ''                |
				| ''                                        | ''                                                   | ''       | ''                                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                    | ''                |
				| 'Indicator'                              | ''                                                   | ''       | ''                                 | ''                 | 'Value'         | 'Value валюта'  | ''                 | ''                 | ''                 | ''                    | ''                |
				| 'Version'                                  | "Report period"                                      | 'Currency' | 'Dimension 1'                      | 'Dimension валюта' | ''                 | ''                 | ''                 | ''                 | ''                 | ''                    | ''                |
				| 'Cash flow items сумма'                        | ''                                                   | ''       | ''                                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                    | ''                |
				| '*'                                       | 'January 2021'                                     | 'RUB'    | 'Software implementation'  | ''                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                    | ''                |
				| '*'                                       | 'January 2021'                                     | 'RUB'    | 'Software sale' | ''                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                    | ''                |
				| '*'                                       | 'January 2021'                                     | 'USD'    | 'Software implementation'  | ''                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                    | ''                |
				| '*'                                       | 'January 2021'                                     | 'USD'    | 'Software sale' | ''                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                    | ''                |
				| '*'                                       | 'January 2021'                                     | 'EUR'    | 'Software implementation'  | ''                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                    | ''                |
				| '*'                                       | 'January 2021'                                     | 'EUR'    | 'Software sale' | ''                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                    | ''                |
				| '*'                                       | 'February 2021'                                    | 'RUB'    | 'Software upgrade'    | ''                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                    | ''                |
				| '*'                                       | 'February 2021'                                    | 'RUB'    | 'Software implementation'  | ''                 | '2,340,000.00000'  | ''                 | ''                 | ''                 | ''                 | ''                    | ''                |
				| '*'                                       | 'February 2021'                                    | 'RUB'    | 'Software sale' | ''                 | '780,000.00000'    | ''                 | ''                 | ''                 | ''                 | ''                    | ''                |
				| '*'                                       | 'February 2021'                                    | 'USD'    | 'Software upgrade'    | ''                 | '*'                | ''                 | ''                 | ''                 | ''                 | ''                    | ''                |
				| '*'                                       | 'February 2021'                                    | 'USD'    | 'Software implementation'  | ''                 | '31,462.3117*'     | ''                 | ''                 | ''                 | ''                 | ''                    | ''                |
				| '*'                                       | 'February 2021'                                    | 'USD'    | 'Software sale' | ''                 | '10,487.43726'     | ''                 | ''                 | ''                 | ''                 | ''                    | ''                |
				| '*'                                       | 'February 2021'                                    | 'EUR'    | 'Software upgrade'    | ''                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                    | ''                |
				| '*'                                       | 'February 2021'                                    | 'EUR'    | 'Software implementation'  | ''                 | '26,019.63037'     | ''                 | ''                 | ''                 | ''                 | ''                    | ''                |
				| '*'                                       | 'February 2021'                                    | 'EUR'    | 'Software sale' | ''                 | '8,673.21012'      | ''                 | ''                 | ''                 | ''                 | ''                    | ''                |
				| ''                                        | ''                                                   | ''       | ''                                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                    | ''                |
				| "Report indicator values 2"          | ''                                                   | ''       | ''                                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                    | ''                |
				| ''                                        | ''                                                   | ''       | ''                                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                    | ''                |
				| 'Indicator'                              | ''                                                   | ''       | ''                                 | ''                 | ''                 | 'Value'         | 'Value валюта'  | ''                 | ''                 | ''                    | ''                |
				| 'Version'                                  | "Report period"                                      | 'Currency' | 'Dimension 1'                      | 'Dimension 2'      | 'Dimension валюта' | ''                 | ''                 | ''                 | ''                 | ''                    | ''                |
				| ''                                        | ''                                                   | ''       | ''                                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                    | ''                |
				| "Report indicator values 3"          | ''                                                   | ''       | ''                                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                    | ''                |
				| ''                                        | ''                                                   | ''       | ''                                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                    | ''                |
				| 'Indicator'                              | ''                                                   | ''       | ''                                 | ''                 | ''                 | ''                 | 'Value'         | 'Value валюта'  | ''                 | ''                    | ''                |
				| 'Version'                                  | "Report period"                                      | 'Currency' | 'Dimension 1'                      | 'Dimension 2'      | 'Dimension 3'      | 'Dimension валюта' | ''                 | ''                 | ''                 | ''                    | ''                |
				| ''                                        | ''                                                   | ''       | ''                                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                    | ''                |
				| "Report indicator values 4"          | ''                                                   | ''       | ''                                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                    | ''                |
				| ''                                        | ''                                                   | ''       | ''                                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                    | ''                |
				| 'Indicator'                              | ''                                                   | ''       | ''                                 | ''                 | ''                 | ''                 | ''                 | 'Value'         | 'Value валюта'  | ''                    | ''                |
				| 'Version'                                  | "Report period"                                      | 'Currency' | 'Dimension 1'                      | 'Dimension 2'      | 'Dimension 3'      | 'Dimension4'       | 'Dimension валюта' | ''                 | ''                 | ''                    | ''                |
				| ''                                        | ''                                                   | ''       | ''                                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                    | ''                |
				| "Report indicator values 5"          | ''                                                   | ''       | ''                                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                    | ''                |
				| ''                                        | ''                                                   | ''       | ''                                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                    | ''                |
				| 'Indicator'                              | ''                                                   | ''       | ''                                 | ''                 | ''                 | ''                 | ''                 | ''                 | 'Value'         | 'Value валюта'     | ''                |
				| 'Version'                                  | "Report period"                                      | 'Currency' | 'Dimension 1'                      | 'Dimension 2'      | 'Dimension 3'      | 'Dimension4'       | 'Dimension5'       | 'Dimension валюта' | ''                 | ''                    | ''                |
				| ''                                        | ''                                                   | ''       | ''                                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                    | ''                |
				| "Report indicator values 6"          | ''                                                   | ''       | ''                                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                    | ''                |
				| ''                                        | ''                                                   | ''       | ''                                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                    | ''                |
				| 'Indicator'                              | ''                                                   | ''       | ''                                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                 | 'Value'            | 'Value валюта' |
				| 'Version'                                  | "Report period"                                      | 'Currency' | 'Dimension 1'                      | 'Dimension 2'      | 'Dimension 3'      | 'Dimension4'       | 'Dimension5'       | 'Dimension6'       | 'Dimension валюта' | ''                    | ''                |
				| ''                                        | ''                                                   | ''       | ''                                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                    | ''                |
				| "Report indicators non-numeric values" | ''                                                   | ''       | ''                                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                    | ''                |
				| ''                                        | ''                                                   | ''       | ''                                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                    | ''                |
				| 'Indicator'                              | ''                                                   | ''       | ''                                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                 | 'Value нечисловое' | ''                |
				| 'Version'                                  | "Report period"                                      | 'Currency' | 'Dimension 1'                      | 'Dimension 2'      | 'Dimension 3'      | 'Dimension4'       | 'Dimension5'       | 'Dimension6'       | 'Dimension валюта' | ''                    | ''                |
				| ''                                        | ''                                                   | ''       | ''                                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                    | ''                |
				| 'Comments znacheniy pokazateley'        | ''                                                   | ''       | ''                                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                    | ''                |
				| ''                                        | ''                                                   | ''       | ''                                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                    | ''                |
				| 'Indicator'                              | ''                                                   | ''       | ''                                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                 | 'Comment'         | ''                |
				| 'Version'                                  | "Report period"                                      | 'Currency' | 'Dimension 1'                      | 'Dimension 2'      | 'Dimension 3'      | 'Dimension4'       | 'Dimension5'       | 'Dimension6'       | 'Dimension валюта' | ''                    | ''                |
			И Я закрываю окно "Flat table of indicator values"

		* Рассчитываем документ
			Когда открылось окно '$WindowTitle$'
			И я нажимаю на кнопку с именем 'FormFillByDefault'

		* Проверяем движения
			Когда открылось окно '$WindowTitle$'
			И я нажимаю на кнопку с именем 'FormOpenDocRegisterRecordsFlatTab'
			Тогда открылось окно "1C:Enterprise"
			И я нажимаю на кнопку с именем 'Button1'
			Когда открылось окно '$WindowTitle$'
			И я нажимаю на кнопку с именем 'FormWriteANDContinue'
			И я жду открытия формы '$WindowTitle$' в течение 30 секунд
			И я нажимаю на кнопку с именем 'FormOpenDocRegisterRecordsFlatTab'
			Тогда открылось окно "Flat table of indicator values"
			И я жду когда в табличном документе 'ReportSpreadsheetDocument' заполнится ячейка 'R2C1' в течение 30 секунд
			Тогда табличный документ 'ReportSpreadsheetDocument' равен по шаблону:
				| "Filter:"                                  | "Report instance Equal to \"Report instance * , created on *\"" | ''       | ''                                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                    | ''                |
				| ''                                        | ''                                                   | ''       | ''                                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                    | ''                |
				| "Report indicator values synthetic"  | ''                                                   | ''       | ''                                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                    | ''                |
				| ''                                        | ''                                                   | ''       | ''                                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                    | ''                |
				| 'Indicator'                              | ''                                                   | ''       | 'Value'                         | ''                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                    | ''                |
				| 'Version'                                  | "Report period"                                      | 'Currency' | ''                                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                    | ''                |
				| 'Cash flow items сумма'                        | ''                                                   | ''       | ''                                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                    | ''                |
				| '*'                                       | 'January 2021'                                     | 'RUB'    | ''                                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                    | ''                |
				| '*'                                       | 'January 2021'                                     | 'USD'    | ''                                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                    | ''                |
				| '*'                                       | 'January 2021'                                     | 'EUR'    | '*'                                | ''                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                    | ''                |
				| '*'                                       | 'February 2021'                                    | 'RUB'    | '3,120,000.00000'                  | ''                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                    | ''                |
				| '*'                                       | 'February 2021'                                    | 'USD'    | '41,949.7490*'                     | ''                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                    | ''                |
				| '*'                                       | 'February 2021'                                    | 'EUR'    | '34,692.84049'                     | ''                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                    | ''                |
				| ''                                        | ''                                                   | ''       | ''                                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                    | ''                |
				| "Report indicators currency values"   | ''                                                   | ''       | ''                                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                    | ''                |
				| ''                                        | ''                                                   | ''       | ''                                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                    | ''                |
				| 'Indicator'                              | ''                                                   | ''       | ''                                 | 'Value'         | 'Value валюта'  | ''                 | ''                 | ''                 | ''                 | ''                    | ''                |
				| 'Version'                                  | "Report period"                                      | 'Currency' | 'Dimension валюта'                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                    | ''                |
				| ''                                        | ''                                                   | ''       | ''                                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                    | ''                |
				| "Report indicator values 1"          | ''                                                   | ''       | ''                                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                    | ''                |
				| ''                                        | ''                                                   | ''       | ''                                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                    | ''                |
				| 'Indicator'                              | ''                                                   | ''       | ''                                 | ''                 | 'Value'         | 'Value валюта'  | ''                 | ''                 | ''                 | ''                    | ''                |
				| 'Version'                                  | "Report period"                                      | 'Currency' | 'Dimension 1'                      | 'Dimension валюта' | ''                 | ''                 | ''                 | ''                 | ''                 | ''                    | ''                |
				| 'Cash flow items сумма'                        | ''                                                   | ''       | ''                                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                    | ''                |
				| '*'                                       | 'January 2021'                                     | 'RUB'    | 'Software implementation'  | ''                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                    | ''                |
				| '*'                                       | 'January 2021'                                     | 'RUB'    | 'Software sale' | ''                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                    | ''                |
				| '*'                                       | 'January 2021'                                     | 'USD'    | 'Software implementation'  | ''                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                    | ''                |
				| '*'                                       | 'January 2021'                                     | 'USD'    | 'Software sale' | ''                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                    | ''                |
				| '*'                                       | 'January 2021'                                     | 'EUR'    | 'Software implementation'  | ''                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                    | ''                |
				| '*'                                       | 'January 2021'                                     | 'EUR'    | 'Software sale' | ''                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                    | ''                |
				| '*'                                       | 'February 2021'                                    | 'RUB'    | 'Software upgrade'    | ''                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                    | ''                |
				| '*'                                       | 'February 2021'                                    | 'RUB'    | 'Software implementation'  | ''                 | '2,340,000.00000'  | ''                 | ''                 | ''                 | ''                 | ''                    | ''                |
				| '*'                                       | 'February 2021'                                    | 'RUB'    | 'Software sale' | ''                 | '780,000.00000'    | ''                 | ''                 | ''                 | ''                 | ''                    | ''                |
				| '*'                                       | 'February 2021'                                    | 'USD'    | 'Software upgrade'    | ''                 | '*'                | ''                 | ''                 | ''                 | ''                 | ''                    | ''                |
				| '*'                                       | 'February 2021'                                    | 'USD'    | 'Software implementation'  | ''                 | '31,462.3117*'     | ''                 | ''                 | ''                 | ''                 | ''                    | ''                |
				| '*'                                       | 'February 2021'                                    | 'USD'    | 'Software sale' | ''                 | '10,487.43726'     | ''                 | ''                 | ''                 | ''                 | ''                    | ''                |
				| '*'                                       | 'February 2021'                                    | 'EUR'    | 'Software upgrade'    | ''                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                    | ''                |
				| '*'                                       | 'February 2021'                                    | 'EUR'    | 'Software implementation'  | ''                 | '26,019.63037'     | ''                 | ''                 | ''                 | ''                 | ''                    | ''                |
				| '*'                                       | 'February 2021'                                    | 'EUR'    | 'Software sale' | ''                 | '8,673.21012'      | ''                 | ''                 | ''                 | ''                 | ''                    | ''                |
				| ''                                        | ''                                                   | ''       | ''                                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                    | ''                |
				| "Report indicator values 2"          | ''                                                   | ''       | ''                                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                    | ''                |
				| ''                                        | ''                                                   | ''       | ''                                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                    | ''                |
				| 'Indicator'                              | ''                                                   | ''       | ''                                 | ''                 | ''                 | 'Value'         | 'Value валюта'  | ''                 | ''                 | ''                    | ''                |
				| 'Version'                                  | "Report period"                                      | 'Currency' | 'Dimension 1'                      | 'Dimension 2'      | 'Dimension валюта' | ''                 | ''                 | ''                 | ''                 | ''                    | ''                |
				| ''                                        | ''                                                   | ''       | ''                                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                    | ''                |
				| "Report indicator values 3"          | ''                                                   | ''       | ''                                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                    | ''                |
				| ''                                        | ''                                                   | ''       | ''                                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                    | ''                |
				| 'Indicator'                              | ''                                                   | ''       | ''                                 | ''                 | ''                 | ''                 | 'Value'         | 'Value валюта'  | ''                 | ''                    | ''                |
				| 'Version'                                  | "Report period"                                      | 'Currency' | 'Dimension 1'                      | 'Dimension 2'      | 'Dimension 3'      | 'Dimension валюта' | ''                 | ''                 | ''                 | ''                    | ''                |
				| ''                                        | ''                                                   | ''       | ''                                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                    | ''                |
				| "Report indicator values 4"          | ''                                                   | ''       | ''                                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                    | ''                |
				| ''                                        | ''                                                   | ''       | ''                                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                    | ''                |
				| 'Indicator'                              | ''                                                   | ''       | ''                                 | ''                 | ''                 | ''                 | ''                 | 'Value'         | 'Value валюта'  | ''                    | ''                |
				| 'Version'                                  | "Report period"                                      | 'Currency' | 'Dimension 1'                      | 'Dimension 2'      | 'Dimension 3'      | 'Dimension4'       | 'Dimension валюта' | ''                 | ''                 | ''                    | ''                |
				| ''                                        | ''                                                   | ''       | ''                                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                    | ''                |
				| "Report indicator values 5"          | ''                                                   | ''       | ''                                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                    | ''                |
				| ''                                        | ''                                                   | ''       | ''                                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                    | ''                |
				| 'Indicator'                              | ''                                                   | ''       | ''                                 | ''                 | ''                 | ''                 | ''                 | ''                 | 'Value'         | 'Value валюта'     | ''                |
				| 'Version'                                  | "Report period"                                      | 'Currency' | 'Dimension 1'                      | 'Dimension 2'      | 'Dimension 3'      | 'Dimension4'       | 'Dimension5'       | 'Dimension валюта' | ''                 | ''                    | ''                |
				| ''                                        | ''                                                   | ''       | ''                                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                    | ''                |
				| "Report indicator values 6"          | ''                                                   | ''       | ''                                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                    | ''                |
				| ''                                        | ''                                                   | ''       | ''                                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                    | ''                |
				| 'Indicator'                              | ''                                                   | ''       | ''                                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                 | 'Value'            | 'Value валюта' |
				| 'Version'                                  | "Report period"                                      | 'Currency' | 'Dimension 1'                      | 'Dimension 2'      | 'Dimension 3'      | 'Dimension4'       | 'Dimension5'       | 'Dimension6'       | 'Dimension валюта' | ''                    | ''                |
				| ''                                        | ''                                                   | ''       | ''                                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                    | ''                |
				| "Report indicators non-numeric values" | ''                                                   | ''       | ''                                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                    | ''                |
				| ''                                        | ''                                                   | ''       | ''                                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                    | ''                |
				| 'Indicator'                              | ''                                                   | ''       | ''                                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                 | 'Value нечисловое' | ''                |
				| 'Version'                                  | "Report period"                                      | 'Currency' | 'Dimension 1'                      | 'Dimension 2'      | 'Dimension 3'      | 'Dimension4'       | 'Dimension5'       | 'Dimension6'       | 'Dimension валюта' | ''                    | ''                |
				| ''                                        | ''                                                   | ''       | ''                                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                    | ''                |
				| 'Comments znacheniy pokazateley'        | ''                                                   | ''       | ''                                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                    | ''                |
				| ''                                        | ''                                                   | ''       | ''                                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                    | ''                |
				| 'Indicator'                              | ''                                                   | ''       | ''                                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                 | 'Comment'         | ''                |
				| 'Version'                                  | "Report period"                                      | 'Currency' | 'Dimension 1'                      | 'Dimension 2'      | 'Dimension 3'      | 'Dimension4'       | 'Dimension5'       | 'Dimension6'       | 'Dimension валюта' | ''                    | ''                |
			И Я закрываю окно "Flat table of indicator values"
