#language: ru
@tree

Функционал: 11. Проверка функционала работы с правилами расчета

	Как Администратор я хочу
	Проверить создание и работу видов отчетов
	чтобы Виды отчетов вводились без ошибок

Контекст: 

	И я закрыл все окна клиентского приложения	

Сценарий: 11.00 Определение типа приложения

	И я закрываю TestClient "CPM - Budget"
	И я подключаю TestClient "CPM - Budget" логин "Administrator" пароль ''
	Пусть Инициализация переменных

Сценарий: 11.01 Создание группы видов отчетов "VA - Calculation rules (group)"

	И Я создаю группу видов отчетов с именем "VA - Calculation rules (group)" и родителем "VA - Report group"

Сценарий: 11.02 Создание вида отчета с ручным вводом - "VA - Count"

	И Я создаю вид отчета с именем "VA - Count" и родителем "VA - Calculation rules (group)"
	
	* Редактируем структуру отчета
		И Я открываю контруктор отчета с именем "VA - Count"
		И Я в конструкторе отчета добавляю строку с именем "Product range"
		И Я в конструкторе отчета добавляю колонку с именем "Count"
		И Я в конструкторе отчета добавляю аналитику с кодом "VA0Product" в ячейку 'R2C2' 
		И Я закрываю окно "Report wizard"

	И Я Для вида отчета "VA - Count" создаю бланк по умолчанию
	И Я Для вида отчета "VA - Count" в бланке для группы раскрытия с адресом 'R8C1' задаю сортировку "Product range" "Product ID"

Сценарий: 11.03 Создание экземпляра отчета - "VA - Count"

	И Я создаю экземпляр отчета для вида отчета "VA - Count" сценарий "VA - Main scenario" период '1/1/2024' '3/31/2024' периодичность "Month" организация "Mercury LLC" проект '' аналитики '' '' '' '' '' '' 

	И Я добавляю значения с раскрытием показателей в ячейку 'R6C2'
		| "VA0Product"                                                     | 'Value1' |
		| "4C:Enterprise 8.3 CORP. Server License (x86-64)"           | '20.00000'  |
		| "3C:Enterprise 8 CORP. Client license for 100 users" | '40.00000'  |
		| "5C:Corporate performance management"                                      | '5.00000'   |
		| "2C:Corporation"                                                  | '7.00000'   |
		| "1C:ERP. Corporate performance management"                                   | '8.00000'   |

	* Копируем и меняем значения показателей
		Тогда открылось окно '$WindowTitle$'
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R6C2:R11C2'
		И я нажимаю на кнопку с именем 'SpreadsheetFieldTemplateCopyDataOnRow'
		И Я изменяю значение на '10.00000' в ячейке 'R7C3:R11C3'		
		Когда открылось окно '$WindowTitle$'
		И Я изменяю значение на '100.00000' процентов в ячейке 'R6C4:R11C4'

	* Проверим результат
		Когда открылось окно '$WindowTitle$'
		Тогда табличный документ 'SpreadsheetFieldTemlate' равен:
			| "VA - Count"                                                 | ''               | ''                | ''             | ''           |
			| ''                                                                | ''               | ''                | ''             | ''           |
			| ''                                                                | "January 2024" | "February 2024" | "March 2024" | "TOTAL"      |
			| ''                                                                | "Count"     | "Count"      | "Count"   | "Count" |
			| "Product range"                                                    | '80'             | '130'             | '160'          | '370'        |
			| "5C:Corporate performance management "                                      | '5'              | '15'              | '10'           | '30'         |
			| "2C:Corporation "                                                  | '7'              | '17'              | '14'           | '38'         |
			| "4C:Enterprise 8.3 CORP. Server License (x86-64) "           | '20'             | '30'              | '40'           | '90'         |
			| "1C:ERP. Corporate performance management "                                   | '8'              | '18'              | '16'           | '42'         |
			| "3C:Enterprise 8 CORP. Client license for 100 users " | '40'             | '50'              | '80'           | '170'        |

	* Запишем документ
		Когда открылось окно '$WindowTitle$'
		И я нажимаю на кнопку с именем 'Write'

	* Проверим, можно ли имзенить значение пустой ячейки
		Когда Открылся экземпляр отчета для вида отчета "VA - Count" валюта 'RUB' организация "Mercury LLC" сценарий "VA - Main scenario" периодичность "Month" проект '' аналитики '' '' '' '' '' '' 
		И я запоминаю текущее окно как 'WindowTitle'
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R12C2:R12C4'
		И я нажимаю на кнопку с именем 'ChangeIndicators'

	* Закроем и сохраним документ
		Тогда открылось окно '$WindowTitle$'
		И я нажимаю на кнопку с именем 'WriteAndClose'
		И я жду закрытия окна '$WindowTitle$' в течение 20 секунд

Сценарий: 11.04 Создание вида отчета с загрузкой из РС "VA - Price"

	И Я создаю вид отчета с именем "VA - Price" и родителем "VA - Calculation rules (group)"

	* Редактируем структуру отчета
		И Я открываю контруктор отчета с именем "VA - Price"
		И Я в конструкторе отчета добавляю строку с именем "Product range"
		И Я в конструкторе отчета добавляю колонку с именем "Price"
		И Я в конструкторе отчета добавляю аналитику с кодом "VA0Product" в ячейку 'R2C2' 

	* Вводим формулы расчета
		Тогда открылось окно "Report wizard"
		И из выпадающего списка с именем 'WorkMode' я выбираю точное значение "Indicators calculation formulas"
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R2C2'
		И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
		И я нажимаю на кнопку с именем 'AddOperand1'
		Тогда открылось окно "Data sources"
		И я нажимаю на кнопку с именем 'FormCreate'
		Тогда открылось окно "Data source (create)"
		И из выпадающего списка с именем 'MethodOfObtaining' я выбираю точное значение "Current infobase information register"
		И я нажимаю кнопку выбора у поля с именем 'DBInformationRegister'
		Тогда открылось окно "Infobase information registers"
		И я нажимаю на кнопку с именем 'FormFind'
		Тогда открылось окно "Find"
		И из выпадающего списка с именем 'FieldSelector' я выбираю точное значение "Register"
		И я меняю значение переключателя с именем 'CompareType' на "At beginning of line"
		Если '$$IsERPCPM$$' Тогда
			И в поле с именем 'Pattern' я ввожу текст "Product range prices 2.5"	
		Иначе
			И в поле с именем 'Pattern' я ввожу текст "Product range prices"		
		И я нажимаю на кнопку с именем 'Find'
		Тогда открылось окно "Infobase information registers"
		И в таблице 'List' я выбираю текущую строку			
		И из выпадающего списка с именем 'InfoRegisterResource' я выбираю точное значение "Price"
		И из выпадающего списка с именем 'SliceType' я выбираю точное значение "Slice of the last ones"
		И я перехожу к закладке с именем 'FiltersPage'
		И в таблице 'TreeOfFilterParametersDB' я активизирую поле с именем 'ParameterCalculationMethod'
		И в таблице 'TreeOfFilterParametersDB' я выбираю текущую строку
		И в таблице 'TreeOfFilterParametersDB' из выпадающего списка с именем 'ParameterCalculationMethod' я выбираю точное значение "Report period start date"
		И в таблице 'TreeOfFilterParametersDB' я завершаю редактирование строки
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
				| "Field"     |
				| 'Kind цены' |
			И я нажимаю на кнопку с именем 'AddConditionItem'
			И в таблице 'TreeOfFilterParametersDB' я перехожу к строке:
			| "Field"       |
			| '[Kind цены]' |
		И в таблице 'TreeOfFilterParametersDB' я выбираю текущую строку
		И в таблице 'TreeOfFilterParametersDB' из выпадающего списка с именем 'ParameterCalculationMethod' я выбираю точное значение "Fixed value"
		И в таблице 'TreeOfFilterParametersDB' из выпадающего списка с именем 'DefiningMethodClarification' я выбираю по строке "VA - Products"
		И я нажимаю на кнопку с именем 'FormWriteAndClose'
		И я жду закрытия окна "Data source (create) *" в течение 20 секунд
		Тогда открылось окно "Data sources"
		И в таблице 'List' я выбираю текущую строку	
		Тогда открылось окно "Report wizard *"
		И я нажимаю на кнопку с именем 'WriteAndCollapse'

	И Я Для вида отчета "VA - Price" создаю бланк по умолчанию
	И Я Для вида отчета "VA - Price" в бланке для группы раскрытия с адресом 'R8C1' задаю сортировку "Product range" "Product ID"

Сценарий: 11.05 Создание экземпляра отчета - "VA - Price"

	И Я создаю экземпляр отчета для вида отчета "VA - Price" сценарий "VA - Main scenario" период '1/1/2024' '3/31/2024' периодичность "Month" организация "Mercury LLC" проект '' аналитики '' '' '' '' '' ''

	* Запишем документ
		И я нажимаю на кнопку с именем 'FormFillByDefault'
		И я нажимаю на кнопку с именем 'Write'

	* Проверим результат
		Когда Открылся экземпляр отчета для вида отчета "VA - Price" валюта 'RUB' организация "Mercury LLC" сценарий "VA - Main scenario" периодичность "Month" проект '' аналитики '' '' '' '' '' ''
		Тогда табличный документ 'SpreadsheetFieldTemlate' равен:
			| "VA - Price"                                                       | ''               | ''                | ''             | ''           |
			| ''                                                                | ''               | ''                | ''             | ''           |
			| ''                                                                | "January 2024" | "February 2024" | "March 2024" | "TOTAL"      |
			| ''                                                                | "Price"           | "Price"            | "Price"         | "Price"       |
			| "Product range"                                                    | '6,030,000'      | '6,633,000'       | '7,495,400'    | '20,158,400' |
			| "5C:Corporate performance management "                                      | '1,250,000'      | '1,375,000'       | '1,553,800'    | '4,178,800'  |
			| "2C:Corporation "                                                  | '2,050,000'      | '2,255,000'       | '2,548,200'    | '6,853,200'  |
			| "4C:Enterprise 8.3 CORP. Server License (x86-64) "           | '180,000'        | '198,000'         | '223,700'      | '601,700'    |
			| "1C:ERP. Corporate performance management "                                   | '1,950,000'      | '2,145,000'       | '2,423,900'    | '6,518,900'  |
			| "3C:Enterprise 8 CORP. Client license for 100 users " | '600,000'        | '660,000'         | '745,800'      | '2,005,800'  |

Сценарий: 11.06 Создание вида отчета с рассчитываемыми показателями - "VA - Sales"

	И Я создаю вид отчета с именем "VA - Sales" и родителем "VA - Calculation rules (group)"

	* Редактируем структуру отчета
		И Я открываю контруктор отчета с именем "VA - Sales"
		И Я в конструкторе отчета добавляю строку с именем "Product range"
		И Я в конструкторе отчета добавляю колонку с именем "Count"
		И Я в конструкторе отчета добавляю колонку с именем "Price"
		И Я в конструкторе отчета добавляю колонку с именем "Amount"
		И Я в конструкторе отчета в ячейке 'R2C2' меняю свойство показателя 'NonFinancial' на 'True'
		И Я в конструкторе отчета добавляю аналитику с кодом "VA0Product" в ячейку 'R2C2' 

	* Вводим формулы расчета
		Тогда открылось окно "Report wizard"
		И из выпадающего списка с именем 'WorkMode' я выбираю точное значение "Indicators calculation formulas"
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R2C2'
		И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
		И я нажимаю на кнопку с именем 'RefToIndicator1'
		И Я выбираю показатель с кодом "ProductRange_count" вида отчета  "VA - Count"
		Тогда открылось окно "Report wizard *"
		И я нажимаю на кнопку с именем 'WriteAndCollapse'
		Тогда открылось окно "Report wizard"
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R2C3'
		И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
		И я нажимаю на кнопку с именем 'RefToIndicator1'
		И Я выбираю показатель с кодом "ProductRange_Price" вида отчета "VA - Price"
		Тогда открылось окно "Report wizard *"
		И я нажимаю на кнопку с именем 'WriteAndCollapse'
		Тогда открылось окно "Report wizard"
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R2C4'
		И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
		И я нажимаю на кнопку с именем 'RefToIndicator1'
		И Я выбираю показатель с кодом "ProductRange_count"
		Тогда открылось окно "Report wizard *"
		И я нажимаю на кнопку с именем 'ButtonMultiply'
		И я нажимаю на кнопку с именем 'RefToIndicator1'
		И Я выбираю показатель с кодом "ProductRange_Price"
		Тогда открылось окно "Report wizard *"
		И я нажимаю на кнопку с именем 'WriteAndCollapse'	
		Когда открылось окно "Report wizard"
		И Я закрываю окно "Report wizard"

	И Я Для вида отчета "VA - Sales" создаю бланк по умолчанию
	И Я Для вида отчета "VA - Sales" в бланке для группы раскрытия с адресом 'R8C1' задаю сортировку "Product range" "Product ID"
		
Сценарий: 11.07 Создание экземпляра отчета - "VA - Sales" без записи

	И Я создаю экземпляр отчета для вида отчета "VA - Sales" сценарий "VA - Main scenario" период '1/1/2024' '3/31/2024' периодичность "Month" организация "Mercury LLC" проект '' аналитики '' '' '' '' '' ''

	* Документ должен быть пустой
		Когда открылось окно '$WindowTitle$'
		Тогда табличный документ 'SpreadsheetFieldTemlate' равен:
			| "VA - Sales" | ''               | ''     | ''      | ''                | ''     | ''      | ''             | ''     | ''      | ''           | ''     | ''      |
			| ''             | ''               | ''     | ''      | ''                | ''     | ''      | ''             | ''     | ''      | ''           | ''     | ''      |
			| ''             | "January 2024" | ''     | ''      | "February 2024" | ''     | ''      | "March 2024" | ''     | ''      | "TOTAL"      | ''     | ''      |
			| ''             | "Count"     | "Price" | "Amount" | "Count"      | "Price" | "Amount" | "Count"   | "Price" | "Amount" | "Count" | "Price" | "Amount" |
			| "Product range" | '0'              | '0'    | '0'     | '0'               | '0'    | '0'     | '0'            | '0'    | '0'     | '0'          | '0'    | '0'     |

	* Расчитаем документ
		И я нажимаю на кнопку с именем 'FormFillByDefault'
		Когда открылось окно '$WindowTitle$'
		Тогда табличный документ 'SpreadsheetFieldTemlate' равен:
			| "VA - Sales"                                                    | ''               | ''          | ''           | ''                | ''          | ''            | ''             | ''          | ''            | ''           | ''           | ''            |
			| ''                                                                | ''               | ''          | ''           | ''                | ''          | ''            | ''             | ''          | ''            | ''           | ''           | ''            |
			| ''                                                                | "January 2024" | ''          | ''           | "February 2024" | ''          | ''            | "March 2024" | ''          | ''            | "TOTAL"      | ''           | ''            |
			| ''                                                                | "Count"     | "Price"      | "Amount"      | "Count"      | "Price"      | "Amount"       | "Count"   | "Price"      | "Amount"       | "Count" | "Price"       | "Amount"       |
			| "Product range"                                                    | '80'             | '6,030,000' | '63,800,000' | '130'             | '6,633,000' | '136,510,000' | '160'          | '7,495,400' | '158,607,200' | '370'        | '20,158,400' | '358,917,200' |
			| "5C:Corporate performance management "                                      | '5'              | '1,250,000' | '6,250,000'  | '15'              | '1,375,000' | '20,625,000'  | '10'           | '1,553,800' | '15,538,000'  | '30'         | '4,178,800'  | '42,413,000'  |
			| "2C:Corporation "                                                  | '7'              | '2,050,000' | '14,350,000' | '17'              | '2,255,000' | '38,335,000'  | '14'           | '2,548,200' | '35,674,800'  | '38'         | '6,853,200'  | '88,359,800'  |
			| "4C:Enterprise 8.3 CORP. Server License (x86-64) "           | '20'             | '180,000'   | '3,600,000'  | '30'              | '198,000'   | '5,940,000'   | '40'           | '223,700'   | '8,948,000'   | '90'         | '601,700'    | '18,488,000'  |
			| "1C:ERP. Corporate performance management "                                   | '8'              | '1,950,000' | '15,600,000' | '18'              | '2,145,000' | '38,610,000'  | '16'           | '2,423,900' | '38,782,400'  | '42'         | '6,518,900'  | '92,992,400'  |
			| "3C:Enterprise 8 CORP. Client license for 100 users " | '40'             | '600,000'   | '24,000,000' | '50'              | '660,000'   | '33,000,000'  | '80'           | '745,800'   | '59,664,000'  | '170'        | '2,005,800'  | '116,664,000' |
	
	* Закроем документ без записи
		Когда открылось окно '$WindowTitle$'
		И Я закрываю окно '$WindowTitle$'
		Тогда открылось окно "1C:Enterprise"
		И я нажимаю на кнопку с именем 'Button1'

Сценарий: 11.08 Создание экземпляра отчета - "VA - Sales"

	И Я создаю экземпляр отчета для вида отчета "VA - Sales" сценарий "VA - Main scenario" период '1/1/2024' '3/31/2024' периодичность "Month" организация "Mercury LLC" проект '' аналитики '' '' '' '' '' ''

	* Документ должен быть пустой
		Тогда табличный документ 'SpreadsheetFieldTemlate' равен:
			| "VA - Sales" | ''               | ''     | ''      | ''                | ''     | ''      | ''             | ''     | ''      | ''           | ''     | ''      |
			| ''             | ''               | ''     | ''      | ''                | ''     | ''      | ''             | ''     | ''      | ''           | ''     | ''      |
			| ''             | "January 2024" | ''     | ''      | "February 2024" | ''     | ''      | "March 2024" | ''     | ''      | "TOTAL"      | ''     | ''      |
			| ''             | "Count"     | "Price" | "Amount" | "Count"      | "Price" | "Amount" | "Count"   | "Price" | "Amount" | "Count" | "Price" | "Amount" |
			| "Product range" | '0'              | '0'    | '0'     | '0'               | '0'    | '0'     | '0'            | '0'    | '0'     | '0'          | '0'    | '0'     |

	* Рассчитаем документ
		И я нажимаю на кнопку с именем 'FormFillByDefault'
		И я нажимаю на кнопку с именем 'Write'
		И я запоминаю текущее окно как 'WindowTitle'
		Когда открылось окно '$WindowTitle$'
		Тогда табличный документ 'SpreadsheetFieldTemlate' равен:
			| "VA - Sales"                                                    | ''               | ''          | ''           | ''                | ''          | ''            | ''             | ''          | ''            | ''           | ''           | ''            |
			| ''                                                                | ''               | ''          | ''           | ''                | ''          | ''            | ''             | ''          | ''            | ''           | ''           | ''            |
			| ''                                                                | "January 2024" | ''          | ''           | "February 2024" | ''          | ''            | "March 2024" | ''          | ''            | "TOTAL"      | ''           | ''            |
			| ''                                                                | "Count"     | "Price"      | "Amount"      | "Count"      | "Price"      | "Amount"       | "Count"   | "Price"      | "Amount"       | "Count" | "Price"       | "Amount"       |
			| "Product range"                                                    | '80'             | '6,030,000' | '63,800,000' | '130'             | '6,633,000' | '136,510,000' | '160'          | '7,495,400' | '158,607,200' | '370'        | '20,158,400' | '358,917,200' |
			| "5C:Corporate performance management "                                      | '5'              | '1,250,000' | '6,250,000'  | '15'              | '1,375,000' | '20,625,000'  | '10'           | '1,553,800' | '15,538,000'  | '30'         | '4,178,800'  | '42,413,000'  |
			| "2C:Corporation "                                                  | '7'              | '2,050,000' | '14,350,000' | '17'              | '2,255,000' | '38,335,000'  | '14'           | '2,548,200' | '35,674,800'  | '38'         | '6,853,200'  | '88,359,800'  |
			| "4C:Enterprise 8.3 CORP. Server License (x86-64) "           | '20'             | '180,000'   | '3,600,000'  | '30'              | '198,000'   | '5,940,000'   | '40'           | '223,700'   | '8,948,000'   | '90'         | '601,700'    | '18,488,000'  |
			| "1C:ERP. Corporate performance management "                                   | '8'              | '1,950,000' | '15,600,000' | '18'              | '2,145,000' | '38,610,000'  | '16'           | '2,423,900' | '38,782,400'  | '42'         | '6,518,900'  | '92,992,400'  |
			| "3C:Enterprise 8 CORP. Client license for 100 users " | '40'             | '600,000'   | '24,000,000' | '50'              | '660,000'   | '33,000,000'  | '80'           | '745,800'   | '59,664,000'  | '170'        | '2,005,800'  | '116,664,000' |
	
	* Запишем документ
		Когда открылось окно '$WindowTitle$'
		И я нажимаю на кнопку с именем 'WriteAndClose'
		И я жду закрытия окна '$WindowTitle$' в течение 20 секунд

Сценарий: 11.09 Проверка поведения формы редактирования процедур

	* Откроем правило обработки
		И Я открываю контруктор отчета с именем "VA - Sales"
		И я нажимаю на кнопку открытия поля с именем 'ProcessingRule'
		Тогда Открылась правило расчета для вида отчета "VA - Sales"
		И я запоминаю текущее окно как 'WindowTitle'

	* Откроем процедуру ДО вычисления
		И я нажимаю на кнопку с именем 'FormProcedureOfCalculation'
		Тогда элемент формы с именем 'TextDocumentFieldProcedure' стал равен 
			|''|
			|''|
		И таблица 'UsedReportTypes' стала равной:
			| "Report type"   |
			| "VA - Sales" |
		Если '$$InterfaceLanguage$$ = "Ru"' Тогда
			И таблица 'Definitions' стала равной:
				| "Method"                                        |
				| 'ObjectOfARAP'                                |
				| 'GetIndicatorsValue()'                |
				| 'SetIndicatorValue()'               |
				| 'DateBelongsToPeriod()'                     |
				| 'RelativePeriod()'                        |
				| 'RelativePeriodYear()'                     |
				| 'PerimeterContent()'                            |
				| 'PerimeterContentForElimination()'               |
				| 'CompaniesControllingPerimeter()' |
				| 'ClearAll()'                                |
		Иначе
			И таблица 'Definitions' стала равной:
				| 'Method'                            |
				| 'CalcStructure'                     |
				| 'UGetIndicatorsValue()'             |
				| 'USetIndicatorsValue()'             |
				| 'UDateBelongsToPeriod()'            |
				| 'URelativePeriod()'                 |
				| 'URelativePeriodYear()'             |
				| 'UPerimeterContent()'               |
				| 'UPerimeterContentForElimination()' |
				| 'UPerimeterControllingCompanies()'  |
				| 'UClearAll()'                       |

	* Видимость ВидыОтчетов
		И у элемента формы с именем 'FormReportsTypesVisibility' установлена пометка
		И элемент формы с именем 'UsedReportTypes' присутствует на форме	 	
		И я нажимаю на кнопку с именем 'FormReportsTypesVisibility'
		И у элемента формы с именем 'FormReportsTypesVisibility' не установлена пометка
		И элемент формы с именем 'UsedReportTypes' отсутствует на форме
		И я нажимаю на кнопку с именем 'FormReportsTypesVisibility'
		И у элемента формы с именем 'FormReportsTypesVisibility' установлена пометка

	* Видимость Процедуры и функции
		И у элемента формы с именем 'FormProceduresAndFunctionsVisibility' установлена пометка
		И элемент формы с именем 'GroupMethods' присутствует на форме	 	
		И я нажимаю на кнопку с именем 'FormProceduresAndFunctionsVisibility'
		И у элемента формы с именем 'FormProceduresAndFunctionsVisibility' не установлена пометка
		И элемент формы с именем 'GroupMethods' отсутствует на форме
		И я нажимаю на кнопку с именем 'FormProceduresAndFunctionsVisibility'
		И у элемента формы с именем 'FormProceduresAndFunctionsVisibility' установлена пометка

	* Ввод показателей
		И в поле с именем 'TextDocumentFieldProcedure' я ввожу текст ' '
		И в таблице 'UsedReportTypes' я нажимаю на кнопку с именем 'UsedReportTypesInsertIndicators'
		И Я выбираю показатель с кодом "ProductRange_count"
		Когда открылось окно "VA - Sales, VA - Sales: Procedure before calculation *"
		Если '$$InterfaceLanguage$$ = "Ru"' Тогда
			Тогда элемент формы с именем 'TextDocumentFieldProcedure' стал равен 
				|' ArrayOfIndicators = New Array;'|
				|'ArrayOfIndicators.Add(\"DimenKindSales:Products_Count\");'|
				|'tIndicatorsValues = GetIndicatorsValue(New Structure(\"ReportsIndicators\", ArrayOfIndicators));'|
				|''|							
		Иначе
			Тогда элемент формы с именем 'TextDocumentFieldProcedure' стал равен 
				|' ArrayIndicators = New Array;'|
				|'ArrayIndicators.Add(\"VASales:ProductRange_Count\");'|
				|'tValuesIndicators = UGetIndicatorsValue(New Structure(\"IndicatorsReports\", ArrayIndicators));'|
				|''|
		И в поле с именем 'TextDocumentFieldProcedure' я ввожу текст ' '
		И в таблице 'UsedReportTypes' я нажимаю на кнопку с именем 'UsedReportTypesAdd'
		И в таблице 'UsedReportTypes' из выпадающего списка с именем 'UsedReportTypesReportKind' я выбираю по строке "VA - Price"
		И в таблице 'UsedReportTypes' я завершаю редактирование строки
		И в таблице 'UsedReportTypes' я нажимаю на кнопку с именем 'UsedReportTypesInsertIndicators'
		И Я выбираю показатель с кодом "ProductRange_Price"
		Если '$$InterfaceLanguage$$ = "Ru"' Тогда
			Тогда элемент формы с именем 'TextDocumentFieldProcedure' стал равен 
				|' ArrayOfIndicators = New Array;'|
				|'ArrayOfIndicators.Add(\"DimenKindPrice:Products_Price\");'|
				|'tIndicatorsValues = GetIndicatorsValue(New Structure(\"ReportsIndicators\", ArrayOfIndicators));'|
				|''|						
		Иначе
			Тогда элемент формы с именем 'TextDocumentFieldProcedure' стал равен 
				|' ArrayIndicators = New Array;'|
				|'ArrayIndicators.Add(\"VAPrice:ProductRange_Price\");'|
				|'tValuesIndicators = UGetIndicatorsValue(New Structure(\"IndicatorsReports\", ArrayIndicators));'|
				|''|
		И в поле с именем 'TextDocumentFieldProcedure' я ввожу текст ' '	

	* Ввод функций
		Если '$$InterfaceLanguage$$ = "Ru"' Тогда
			* ОбъектРасчета
				И в таблице 'Definitions' я перехожу к строке:
						| "Method"         |
						| 'ObjectOfARAP' |
				И в таблице 'Definitions' я выбираю текущую строку
				Тогда элемент формы с именем 'TextDocumentFieldProcedure' стал равен 
					|' ObjectOfARAP.'|
				И в поле с именем 'TextDocumentFieldProcedure' я ввожу текст ' '
			* ПолучитьЗначениеПоказателей
				И в таблице 'Definitions' я перехожу к строке:
					| "Method"                         |
					| 'GetIndicatorsValue()' |
				И в таблице 'Definitions' я выбираю текущую строку
				Тогда элемент формы с именем 'TextDocumentFieldProcedure' стал равен 
					|' GetIndicatorsValue('|
					|'	<FilterParameterStructure>,'|
					|'	[DimensionsToDrillDown], '|
					|'	[AdditionalParameters]);'|
				И в поле с именем 'TextDocumentFieldProcedure' я ввожу текст ' '
			* УстановитьЗначениеПоказателя
				И в таблице 'Definitions' я перехожу к строке:
					| "Method"                          |
					| 'SetIndicatorValue()' |
				И в таблице 'Definitions' я выбираю текущую строку
				Тогда элемент формы с именем 'TextDocumentFieldProcedure' стал равен 
					|' SetIndicatorValue('|
					|'	<код показателя или ссылка to1 показатель>,'|
					|'	<значение показателя>,'|
					|'	[<период>],'|
					|'	[<аналитика 1>],'|
					|'	[<аналитика 2>],'|
					|'	[<аналитика 3>],'|
					|'	[<аналитика 4>],'|
					|'	[<аналитика 5>],'|
					|'	[<аналитика 6>]);'|	
				И в поле с именем 'TextDocumentFieldProcedure' я ввожу текст ' '
			* ДатаПринадлежитПериоду
				И в таблице 'Definitions' я перехожу к строке:
					| "Method"                    |
					| 'DateBelongsToPeriod()' |
				И в таблице 'Definitions' я выбираю текущую строку
				Тогда элемент формы с именем 'TextDocumentFieldProcedure' стал равен ' DateBelongsToPeriod(<дата>, <период>);'
				И в поле с именем 'TextDocumentFieldProcedure' я ввожу текст ' '
			* ОтносительныйПериод
				И в таблице 'Definitions' я перехожу к строке:
					| "Method"                 |
					| 'RelativePeriod()' |
				И в таблице 'Definitions' я выбираю текущую строку
				Тогда элемент формы с именем 'TextDocumentFieldProcedure' стал равен 
					|' RelativePeriod(<исходный период>, [<смещение>]);'|
					|''|
				И в поле с именем 'TextDocumentFieldProcedure' я ввожу текст ' '
			* ОтносительныйПериодГод
				И в таблице 'Definitions' я перехожу к строке:
					| "Method"                 |
					| 'RelativePeriodYear()' |
				И в таблице 'Definitions' я выбираю текущую строку
				Тогда элемент формы с именем 'TextDocumentFieldProcedure' стал равен 
					|' RelativePeriodYear(<исходный период>, [<смещение>]);'|
					|''|
				И в поле с именем 'TextDocumentFieldProcedure' я ввожу текст ' '
			* СоставПериметра
				И в таблице 'Definitions' я перехожу к строке:
					| "Method"             |
					| 'PerimeterContent()' |
				И в таблице 'Definitions' я выбираю текущую строку
				Тогда элемент формы с именем 'TextDocumentFieldProcedure' стал равен 
					|' PerimeterContent([<сценарий>],'|
					|'	[<период>],'|
					|'	[<организационная единица>],'|
					|'	[<метод консолидации>],'|
					|'	[<максимальная полная доля владения>],'|
					|'	[<минимальная полная доля владения>],'|
					|'	[<типы организаций>]);'|
				И в поле с именем 'TextDocumentFieldProcedure' я ввожу текст ' '
			* СоставПериметраДляЭлиминации
				И в таблице 'Definitions' я перехожу к строке:
					| "Method"                          |
					| 'PerimeterContentForElimination()' |
				И в таблице 'Definitions' я выбираю текущую строку
				Тогда элемент формы с именем 'TextDocumentFieldProcedure' стал равен 
					|' PerimeterContentForElimination();'|
					|''|
				И в поле с именем 'TextDocumentFieldProcedure' я ввожу текст ' '
			* ВернутьМассивОрганизацийОсуществляющихКонтрольПериметра
				И в таблице 'Definitions' я перехожу к строке:
					| "Method"                                        |
					| 'CompaniesControllingPerimeter()' |
				И в таблице 'Definitions' я выбираю текущую строку
				Тогда элемент формы с именем 'TextDocumentFieldProcedure' стал равен ' CompaniesControllingPerimeter();'
				И в поле с именем 'TextDocumentFieldProcedure' я ввожу текст ' '
			* ОчиститьВсе
				И в таблице 'Definitions' я перехожу к строке:
					| "Method"         |
					| 'ClearAll()' |
				И в таблице 'Definitions' я выбираю текущую строку
				Тогда элемент формы с именем 'TextDocumentFieldProcedure' стал равен 
					|' ClearAll();'|
					|''|											
		Иначе
			* ОбъектРасчета
				И в таблице 'Definitions' я перехожу к строке:
					| "Method"         |
					| "CalcStructure" |
				И в таблице 'Definitions' я выбираю текущую строку
				Тогда элемент формы с именем 'TextDocumentFieldProcedure' стал равен 
					|' CalcStructure.'|
				И в поле с именем 'TextDocumentFieldProcedure' я ввожу текст ' '
			* ПолучитьЗначениеПоказателей
				И в таблице 'Definitions' я перехожу к строке:
					| "Method"                 |
					| 'UGetIndicatorsValue()' |
				И в таблице 'Definitions' я выбираю текущую строку
				Тогда элемент формы с именем 'TextDocumentFieldProcedure' стал равен 
					|' UGetIndicatorsValue('|
					|'	<SelectionParametersStructure>,'|
					|'	[<Dimension>],'|
					|'	[<Options>]);'|
				И в поле с именем 'TextDocumentFieldProcedure' я ввожу текст ' '			
			* УстановитьЗначениеПоказателя
				И в таблице 'Definitions' я перехожу к строке:
					| "Method"                 |
					| 'USetIndicatorsValue()' |
				И в таблице 'Definitions' я выбираю текущую строку	
				Тогда элемент формы с именем 'TextDocumentFieldProcedure' стал равен 
					|' USetIndicatorsValue(<CodeReferenceIndicators>, <Value>, '|
					|'	[<ReportPeriod>],'|
					|'	[<Dimension1>], [<Dimension2>], [<Dimension3>], [<Dimension4>], [<Dimension5>], [<Dimension6>],'|
					|'	[<DimensionCurrency>]);'|	
				И в поле с именем 'TextDocumentFieldProcedure' я ввожу текст ' '
			* ДатаПринадлежитПериоду
				И в таблице 'Definitions' я перехожу к строке:
					| "Method"                  |
					| 'UDateBelongsToPeriod()' |
				И в таблице 'Definitions' я выбираю текущую строку	
				Тогда элемент формы с именем 'TextDocumentFieldProcedure' стал равен ' UDateBelongsToPeriod(<StringDate>, <Period>);'				
				И в поле с именем 'TextDocumentFieldProcedure' я ввожу текст ' '
			* ОтносительныйПериод
				И в таблице 'Definitions' я перехожу к строке:
					| "Method"             |
					| 'URelativePeriod()' |
				И в таблице 'Definitions' я выбираю текущую строку
				Тогда элемент формы с именем 'TextDocumentFieldProcedure' стал равен 
					|' URelativePeriod(<ReportPeriod>, [<Offset>]);'|
					|''|				
				И в поле с именем 'TextDocumentFieldProcedure' я ввожу текст ' '
			* ОтносительныйПериодГод
				И в таблице 'Definitions' я перехожу к строке:
					| "Method"                 |
					| 'URelativePeriodYear()' |
				И в таблице 'Definitions' я выбираю текущую строку
				Тогда элемент формы с именем 'TextDocumentFieldProcedure' стал равен 
					|' URelativePeriodYear(<ReportPeriod>, [<Offset>]);'|
					|''|
				И в поле с именем 'TextDocumentFieldProcedure' я ввожу текст ' '
			* СоставПериметра
				И в таблице 'Definitions' я перехожу к строке:
					| "Method"               |
					| 'UPerimeterContent()' |
				И в таблице 'Definitions' я выбираю текущую строку
				Тогда элемент формы с именем 'TextDocumentFieldProcedure' стал равен 
					|' UPerimeterContent('|
					|'	[<Scenario>], [<ReportPeriod>], [<Organization>],'|
					|'	[<ConsolidationMethod>], [<MinTotalOwnershipShare>], [<MaxTotalOwnershipShare>],'|
					|'	[<OrganizationTypes>], [<PerimeterOwner>]);'|
				И в поле с именем 'TextDocumentFieldProcedure' я ввожу текст ' '
			* СоставПериметраДляЭлиминации
				И в таблице 'Definitions' я перехожу к строке:
					| "Method"                             |
					| 'UPerimeterContentForElimination()' |
				И в таблице 'Definitions' я выбираю текущую строку
				Тогда элемент формы с именем 'TextDocumentFieldProcedure' стал равен ' UPerimeterContentForElimination();'
				И в поле с именем 'TextDocumentFieldProcedure' я ввожу текст ' '
			* ВернутьМассивОрганизацийОсуществляющихКонтрольПериметра
				И в таблице 'Definitions' я перехожу к строке:
					| "Method"                            |
					| 'UPerimeterControllingCompanies()' |
				И в таблице 'Definitions' я выбираю текущую строку
				Тогда элемент формы с именем 'TextDocumentFieldProcedure' стал равен ' UPerimeterControllingCompanies();'
				И в поле с именем 'TextDocumentFieldProcedure' я ввожу текст ' '
			* ОчиститьВсе
				И в таблице 'Definitions' я перехожу к строке:
					| "Method"       |
					| 'UClearAll()' |
				И в таблице 'Definitions' я выбираю текущую строку
				Тогда элемент формы с именем 'TextDocumentFieldProcedure' стал равен 
					|' UClearAll();'|
					|''|

	* Сохраним изменения
		И я нажимаю на кнопку с именем 'FormValidate'
		Тогда открылось окно "1C:Enterprise"
		И я нажимаю на кнопку с именем 'Button0'
		Тогда открылось окно "VA - Sales, VA - Sales: Procedure before calculation *"
		И я нажимаю на кнопку с именем 'FormWriteAndClose'
		Тогда открылось окно "1C:Enterprise"
		И я нажимаю на кнопку с именем 'Button0'
		Тогда открылось окно '$WindowTitle$ *'
		И я нажимаю на кнопку с именем 'FormWrite'

	* Процедура ПОСЛЕ вычисления
		Когда открылось окно '$WindowTitle$'
		И я нажимаю на кнопку с именем 'FormProcedureOfCalculation'
		Когда открылось окно "VA - Sales, VA - Sales: Procedure before calculation"
		Если '$$InterfaceLanguage$$ = "Ru"' Тогда
			Тогда элемент формы с именем 'TextDocumentFieldProcedure' стал равен 
				|' ClearAll();'|
				|''|
				|''|
		Иначе
			Тогда элемент формы с именем 'TextDocumentFieldProcedure' стал равен 
				|' UClearAll();'|
				|''|
				|''|
		И я нажимаю на кнопку с именем 'FormClose'

	* Закрытие форм
		Когда открылось окно '$WindowTitle$'
		И Я закрываю окно '$WindowTitle$'
		Тогда открылось окно "Report wizard"
		И Я закрываю окно "Report wizard"

Сценарий: 11.10 Проверка работы произвольных функций расчета

	* Откроем правило обработки
		И Я открываю контруктор отчета с именем "VA - Sales"
		И я нажимаю на кнопку открытия поля с именем 'ProcessingRule'
		Тогда Открылась правило расчета для вида отчета "VA - Sales"
		И я запоминаю текущее окно как 'WindowTitle'

	* Вводим текст процедуры
		И я нажимаю на кнопку с именем 'FormProcedureAfterCalculation'
		Когда открылось окно "VA - Sales, VA - Sales: Procedure after calculation"
		Если '$$InterfaceLanguage$$ = "Ru"' Тогда
			И в поле с именем 'TextDocumentFieldProcedure' я ввожу текст 
				|'ReportData = New Structure("Organization,Scenario,Currency,ReportPeriod",'|
				|' ObjectOfARAP.Organization,ObjectOfARAP.Scenario,ObjectOfARAP.MainCurrency,ObjectOfARAP.ArrayOfPeriods);'|
				|'DimensionsToDrillDown = New Structure("Dimension1");'|
				|'AdditionalParameters = New Structure("Overall",Enums.IndicatorTotalsTypes.Sum);'|
				|''|
				|'ArrayOfIndicators = New Array;'|
				|'ArrayOfIndicators.Add("DimenKindSales:Products_Count");'|
				|'ReportData.Insert("ReportsIndicators",ArrayOfIndicators);'|
				|'tIndicatorsValues_Count = GetIndicatorsValue('|
				|' ReportData,DimensionsToDrillDown);'|
				|'ReportData.Delete("ReportsIndicators"); '|
				|''|
				|'ReportData.Insert("ReportIndicator", '|
				|' Catalogs.ReportsIndicators.FindByCode("Products_Price",True,,ObjectOfARAP.ReportKind));'|
				|'tIndicatorsValues_Price = GetIndicatorsValue('|
				|' ReportData,DimensionsToDrillDown,AdditionalParameters);'|
				|'ReportData.Delete("ReportIndicator"); '|
				|''|
				|'ClearAll();'|
				|''|
				|'For Каждого StringValue2 From tIndicatorsValues_Count Cycle'|
				|''|
				|' PeriodOffset = RelativePeriod(StringValue2.ReportPeriod, 1);'|
				|' If DateBelongsToPeriod(PeriodOffset.StartDate,ObjectOfARAP.ArrayOfPeriods.Get(1)) OR'|
				|'  DateBelongsToPeriod(PeriodOffset.StartDate,ObjectOfARAP.ArrayOfPeriods.Get(2)) Then'|
				|''|
				|'  SetIndicatorValue('|
				|'   StringValue2.ReportIndicator,'|
				|'   StringValue2.Value + 10,'|
				|'   RelativePeriod(StringValue2.ReportPeriod, 1),'|
				|'   StringValue2.Dimension1);'|
				|'   '|
				|' EndIf;'|
				|'  '|
				|'EndOfTheCycle;'|
				|''|
				|'For Каждого StringValue2 From tIndicatorsValues_Price Cycle'|
				|''|
				|' If NOT ValueIsFilled(StringValue2.ReportPeriod) Then'|
				|'  Continue;'|
				|' EndIf;'|
				|''|
				|' PeriodOffset = RelativePeriod(StringValue2.ReportPeriod, 1);'|
				|' If DateBelongsToPeriod(PeriodOffset.StartDate,ObjectOfARAP.ArrayOfPeriods.Get(1)) OR'|
				|'  DateBelongsToPeriod(PeriodOffset.StartDate,ObjectOfARAP.ArrayOfPeriods.Get(2)) Then'|
				|''|
				|'  SetIndicatorValue('|
				|'   StringValue2.ReportIndicator,'|
				|'   StringValue2.Value * 2,'|
				|'   RelativePeriod(StringValue2.ReportPeriod, 1),'|
				|'   StringValue2.Dimension1);'|
				|'   '|
				|' EndIf;  '|
				|'  '|
				|'EndOfTheCycle;'|
		Иначе
			И в поле с именем 'TextDocumentFieldProcedure' я ввожу текст 
				|'ReportData = New Structure(\"Organization,Scenario,Currency,ReportPeriod\",'|
				|'  CalcStructure.Organization, CalcStructure.Scenario, CalcStructure.MainCurrency, CalcStructure.PeriodsArray);'|
				|'DisclosedAnalysts = New Structure(\"Dimension1\");'|
				|'ExtraOptions = New Structure(\"Overall\",Enums.IndicatorTotalsTypes.Sum);'|
				|''|
				|'ArrayIndicators = New Array;'|
				|'ArrayIndicators.Add(\"VASales:ProductRange_Count\");'|
				|'ReportData.Insert(\"ReportsIndicators\", ArrayIndicators);'|
				|'tValuesIndicators_Number = UGetIndicatorsValue('|
				|' 	ReportData, DisclosedAnalysts);'|
				|'ReportData.Delete(\"ReportsIndicators\"); '|
				|''|
				|'ReportData.Insert(\"ReportIndicator\", '|
				|'  Catalogs.ReportsIndicators.FindByCode(\"ProductRange_Price\",True,,CalcStructure.ReportKind));'|
				|'tValuesIndicators_Price = UGetIndicatorsValue('|
				|'  ReportData, DisclosedAnalysts, ExtraOptions);'|
				|'ReportData.Delete(\"ReportIndicator\"); '|
				|''|
				|'UClearAll();'|
				|''|
				|'For Each StringValue In tValuesIndicators_Number Do'|
				|''|
				|' PeriodOffset = URelativePeriod(StringValue.ReportPeriod, 1);'|
				|' If UDateBelongsToPeriod(PeriodOffset.StartDate,CalcStructure.PeriodsArray.Get(1)) OR'|
				|'  UDateBelongsToPeriod(PeriodOffset.StartDate,CalcStructure.PeriodsArray.Get(2)) Then'|
				|''|
				|'  USetIndicatorsValue('|
				|'   StringValue.ReportIndicator,'|
				|'   StringValue.Value + 10,'|
				|'   URelativePeriod(StringValue.ReportPeriod, 1),'|
				|'   StringValue.Dimension1);'|
				|'   '|
				|' EndIf;'|
				|'  '|
				|'EndDo;'|
				|''|
				|'For Each StringValue In tValuesIndicators_Price Do'|
				|''|
				|' If Not ValueIsFilled(StringValue.ReportPeriod) Then'|
				|'  Continue;'|
				|' EndIf;'|
				|''|
				|' PeriodOffset = URelativePeriod(StringValue.ReportPeriod, 1);'|
				|' If UDateBelongsToPeriod(PeriodOffset.StartDate,CalcStructure.PeriodsArray.Get(1)) OR'|
				|'  UDateBelongsToPeriod(PeriodOffset.StartDate,CalcStructure.PeriodsArray.Get(2)) Then'|
				|''|
				|'  USetIndicatorsValue('|
				|'   StringValue.ReportIndicator,'|
				|'   StringValue.Value * 2,'|
				|'   URelativePeriod(StringValue.ReportPeriod, 1),'|
				|'   StringValue.Dimension1);'|
				|'   '|
				|' EndIf;  '|
				|'  '|
				|'EndDo;'|
		И я нажимаю на кнопку с именем 'FormWriteAndClose'
		Тогда открылось окно "1C:Enterprise"
		И я нажимаю на кнопку с именем 'Button0'
		Тогда открылось окно '$WindowTitle$ *'
		И я нажимаю на кнопку с именем 'FormWriteAndClose'
		И я жду закрытия окна '$WindowTitle$ *' в течение 20 секунд
		Тогда открылось окно "Report wizard"
		И Я закрываю окно "Report wizard"

	* Рассчитаем документ
		Тогда открылось окно "Report types and templates"
		И в таблице 'ReportKindList' я нажимаю на кнопку с именем 'ReportKindListOpenInstancesList'
		Тогда открылось окно "Report instances"
		И в таблице 'List' я выбираю текущую строку
		Тогда Открылся экземпляр отчета для вида отчета "VA - Sales" валюта 'RUB' организация "Mercury LLC" сценарий "VA - Main scenario" периодичность "Month" проект '' аналитики '' '' '' '' '' '' 
		И я запоминаю текущее окно как 'WindowTitle'
		И я нажимаю на кнопку с именем 'FormFillByDefault'

	* Сравниваем результат
		Тогда табличный документ 'SpreadsheetFieldTemlate' равен:
			| "VA - Sales"                                                    | ''               | ''     | ''      | ''                | ''           | ''      | ''             | ''           | ''      | ''           | ''           | ''      |
			| ''                                                                | ''               | ''     | ''      | ''                | ''           | ''      | ''             | ''           | ''      | ''           | ''           | ''      |
			| ''                                                                | "January 2024" | ''     | ''      | "February 2024" | ''           | ''      | "March 2024" | ''           | ''      | "TOTAL"      | ''           | ''      |
			| ''                                                                | "Count"     | "Price" | "Amount" | "Count"      | "Price"       | "Amount" | "Count"   | "Price"       | "Amount" | "Count" | "Price"       | "Amount" |
			| "Product range"                                                    | '0'              | '0'    | '0'     | '130'             | '12,060,000' | '0'     | '180'          | '13,266,000' | '0'     | '310'        | '25,326,000' | '0'     |
			| "5C:Corporate performance management "                                      | '0'              | '0'    | '0'     | '15'              | '2,500,000'  | '0'     | '25'           | '2,750,000'  | '0'     | '40'         | '5,250,000'  | '0'     |
			| "2C:Corporation "                                                  | '0'              | '0'    | '0'     | '17'              | '4,100,000'  | '0'     | '27'           | '4,510,000'  | '0'     | '44'         | '8,610,000'  | '0'     |
			| "4C:Enterprise 8.3 CORP. Server License (x86-64) "           | '0'              | '0'    | '0'     | '30'              | '360,000'    | '0'     | '40'           | '396,000'    | '0'     | '70'         | '756,000'    | '0'     |
			| "1C:ERP. Corporate performance management "                                   | '0'              | '0'    | '0'     | '18'              | '3,900,000'  | '0'     | '28'           | '4,290,000'  | '0'     | '46'         | '8,190,000'  | '0'     |
			| "3C:Enterprise 8 CORP. Client license for 100 users " | '0'              | '0'    | '0'     | '50'              | '1,200,000'  | '0'     | '60'           | '1,320,000'  | '0'     | '110'        | '2,520,000'  | '0'     |
	
	* Сохраним и откроем документ
		Когда открылось окно '$WindowTitle$ *'
		И я нажимаю на кнопку с именем 'WriteAndClose'
		И я жду закрытия окна '$WindowTitle$ *' в течение 20 секунд

Сценарий: 11.11 Отображение экземпляра в валюте после расчетов

	И Я открываю первый экземпляр отчета для вида отчета "VA - Sales"
	Тогда Открылся экземпляр отчета для вида отчета "VA - Sales" валюта 'RUB' организация "Mercury LLC" сценарий "VA - Main scenario" периодичность "Month" проект '' аналитики '' '' '' '' '' '' 
	
	* Проверим суммы в валюте
		И я нажимаю на кнопку с именем 'FormOpenSettings'
		Тогда открылось окно "Document settings"
		И я перехожу к закладке с именем 'GroupPageReportSettings'
		И из выпадающего списка с именем 'DisplayCurrency' я выбираю точное значение "EUR"
		И я нажимаю на кнопку с именем 'FormApplyAndClose'
		Когда Открылся экземпляр отчета для вида отчета "VA - Sales" валюта 'EUR' организация "Mercury LLC" сценарий "VA - Main scenario" периодичность "Month" проект '' аналитики '' '' '' '' '' ''
		И я запоминаю текущее окно как 'WindowTitle' 
		Тогда табличный документ 'SpreadsheetFieldTemlate' равен:
			| "VA - Sales"                                                    | ''               | ''     | ''      | ''                | ''        | ''      | ''             | ''        | ''      | ''           | ''        | ''      |
			| ''                                                                | ''               | ''     | ''      | ''                | ''        | ''      | ''             | ''        | ''      | ''           | ''        | ''      |
			| ''                                                                | "January 2024" | ''     | ''      | "February 2024" | ''        | ''      | "March 2024" | ''        | ''      | "TOTAL"      | ''        | ''      |
			| ''                                                                | "Count"     | "Price" | "Amount" | "Count"      | "Price"    | "Amount" | "Count"   | "Price"    | "Amount" | "Count" | "Price"    | "Amount" |
			| "Product range"                                                    | '0'              | '0'    | '0'     | '130'             | '134,101' | '0'     | '180'          | '149,591' | '0'     | '310'        | '283,692' | '0'     |
			| "5C:Corporate performance management "                                      | '0'              | '0'    | '0'     | '15'              | '27,799'  | '0'     | '25'           | '31,010'  | '0'     | '40'         | '58,808'  | '0'     |
			| "2C:Corporation "                                                  | '0'              | '0'    | '0'     | '17'              | '45,590'  | '0'     | '27'           | '50,856'  | '0'     | '44'         | '96,446'  | '0'     |
			| "4C:Enterprise 8.3 CORP. Server License (x86-64) "           | '0'              | '0'    | '0'     | '30'              | '4,003'   | '0'     | '40'           | '4,465'   | '0'     | '70'         | '8,468'   | '0'     |
			| "1C:ERP. Corporate performance management "                                   | '0'              | '0'    | '0'     | '18'              | '43,366'  | '0'     | '28'           | '48,375'  | '0'     | '46'         | '91,741'  | '0'     |
			| "3C:Enterprise 8 CORP. Client license for 100 users " | '0'              | '0'    | '0'     | '50'              | '13,343'  | '0'     | '60'           | '14,885'  | '0'     | '110'        | '28,228'  | '0'     |
					
	* Запишем документ
		Когда открылось окно '$WindowTitle$'
		И я нажимаю на кнопку с именем 'WriteAndClose'
		И я жду закрытия окна '$WindowTitle$' в течение 20 секунд

Сценарий: 11.12 Удаление версий при автоматическом расчете

	И Я открываю первый экземпляр отчета для вида отчета "VA - Sales"
	Тогда Открылся экземпляр отчета для вида отчета "VA - Sales" валюта 'EUR' организация "Mercury LLC" сценарий "VA - Main scenario" периодичность "Month" проект '' аналитики '' '' '' '' '' ''
	И я запоминаю текущее окно как 'WindowTitle'
	
	* Удалим версию
		И я нажимаю на кнопку с именем 'FormVersionsManagement'
		Тогда открылось окно "Indicator version management"
		И я нажимаю на кнопку с именем 'ListDeleteVersions'
		Тогда открылось окно "1C:Enterprise"
		И я нажимаю на кнопку с именем 'Button0'

	* Закрываем окна
		Тогда открылось окно "Indicator version management *"
		И Я закрываю окно "Indicator version management *"
		Тогда открылось окно '$WindowTitle$'
		И Я закрываю окно '$WindowTitle$'
		
	* Проверим результат
		Тогда открылось окно "Report instances"
		И в таблице 'List' я выбираю текущую строку
		Тогда открылось окно '$WindowTitle$'
		Тогда табличный документ 'SpreadsheetFieldTemlate' равен:
			| "VA - Sales"                                                    | ''               | ''       | ''        | ''                | ''       | ''          | ''             | ''       | ''          | ''           | ''        | ''          |
			| ''                                                                | ''               | ''       | ''        | ''                | ''       | ''          | ''             | ''       | ''          | ''           | ''        | ''          |
			| ''                                                                | "January 2024" | ''       | ''        | "February 2024" | ''       | ''          | "March 2024" | ''       | ''          | "TOTAL"      | ''        | ''          |
			| ''                                                                | "Count"     | "Price"   | "Amount"   | "Count"      | "Price"   | "Amount"     | "Count"   | "Price"   | "Amount"     | "Count" | "Price"    | "Amount"     |
			| "Product range"                                                    | '80'             | '66,632' | '704,995' | '130'             | '73,756' | '1,517,923' | '160'          | '84,520' | '1,788,494' | '370'        | '224,908' | '4,011,412' |
			| "5C:Corporate performance management "                                      | '5'              | '13,813' | '69,063'  | '15'              | '15,289' | '229,340'   | '10'           | '17,521' | '175,210'   | '30'         | '46,623'  | '473,613'   |
			| "2C:Corporation "                                                  | '7'              | '22,653' | '158,569' | '17'              | '25,074' | '426,266'   | '14'           | '28,734' | '402,278'   | '38'         | '76,461'  | '987,112'   |
			| "4C:Enterprise 8.3 CORP. Server License (x86-64) "           | '20'             | '1,989'  | '39,780'  | '30'              | '2,202'  | '66,050'    | '40'           | '2,522'  | '100,900'   | '90'         | '6,713'   | '206,730'   |
			| "1C:ERP. Corporate performance management "                                   | '8'              | '21,548' | '172,381' | '18'              | '23,851' | '429,324'   | '16'           | '27,332' | '437,320'   | '42'         | '72,731'  | '1,039,025' |
			| "3C:Enterprise 8 CORP. Client license for 100 users " | '40'             | '6,630'  | '265,202' | '50'              | '7,339'  | '366,944'   | '80'           | '8,410'  | '672,786'   | '170'        | '22,379'  | '1,304,931' |
