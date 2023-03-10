#language: ru

@tree

Функционал: 02. Проверка функционала работы с правилами расчета

Как Администратор я хочу
Проверить создание и работу видов отчетов
чтобы Виды отчетов вводились без ошибок

Контекст: 

	И я подключаю TestClient "CPM - Budget" логин "Administrator" пароль ''
	И я закрыл все окна клиентского приложения	

Сценарий: 02.00 Определение типа приложения

	Пусть Инициализация переменных

Сценарий: 02.01 Создание группы отчетов "VA - Calculation rules (группа)"

	И Я создаю группу видов отчетов с именем "VA - Calculation rules (группа)" и родителем "VA - Report group"

Сценарий: 02.02 Создание отчета с ручным вводом - "VA - Quantity"

	И Я создаю вид отчета с именем "VA - Quantity" и родителем "VA - Calculation rules (группа)"
	
	* Редактируем структуру отчета
		И Я открываю контруктор отчета с именем "VA - Quantity"
		И Я в конструкторе отчета добавляю строку с именем "Product range"
		И Я в конструкторе отчета добавляю колонку с именем "Quantity"
		И Я в конструкторе отчета добавляю аналитику с кодом "VA0Product" в ячейку 'R2C2' 
		И Я закрываю окно "Edit tree"

	И Я Для вида отчета "VA - Quantity" я создаю бланк по умолчанию
	И Я Для вида отчета "VA - Quantity" в бланке для группы раскрытия с адресом 'R8C1' задаю сортировку "Product range" "Product ID"

Сценарий: 02.03 Создание экземпляра отчета - "VA - Quantity"

	И Я создаю экземпляр отчета для вида отчета "VA - Quantity" сценарий "VA - Main scenario" период '1/1/2021' '3/31/2021' периодичность "Month" организация "Mercury LLC" проект '' аналитики '' '' '' '' '' '' 
	И я запоминаю текущее окно как 'WindowTitle'

	И Я добавляю значения с раскрытием показателей в ячейку 'R6C2'
		| "VA0Product"                                                     | 'Value' |
		| "4C:Enterprise 8.3 CORP. Server License (x86-64)"           | '20.00000' |
		| "3C:Enterprise 8 CORP. Client license for 100 users" | '40.00000' |
		| "5C:Corporate performance management"                                      | '5.00000'  |
		| "2C:Corporation"                                                  | '7.00000'  |
		| "1C:ERP. Corporate performance management"                                   | '8.00000'  |

	* Копируем и меняем значения показателей
		Тогда открылось окно '$WindowTitle$'
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R6C2:R11C2'
		И я нажимаю на кнопку с именем 'SpreadsheetFieldTemplateCopyDataOnRow'
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R7C3:R11C3'
		И я нажимаю на кнопку с именем 'ChangeIndicators'
		Тогда открылось окно "Change values"
		И в поле с именем 'ValueAdjustments' я ввожу текст '10.00000'
		И я нажимаю на кнопку с именем 'Apply'
		Когда открылось окно '$WindowTitle$'
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R6C4:R11C4'
		И я нажимаю на кнопку с именем 'ChangeIndicators'
		Тогда открылось окно "Change values"
		И я меняю значение переключателя с именем 'AdjustmentType' на "Percentage"
		И в поле с именем 'ValueAdjustments' я ввожу текст '100.00000'
		И я нажимаю на кнопку с именем 'Apply'

	* Проверим результат
		Когда открылось окно '$WindowTitle$'
		Тогда табличный документ 'SpreadsheetFieldTemlate' равен:
			| "VA - Quantity"                                                 | ''               | ''                | ''             | ''           |
			| ''                                                                | ''               | ''                | ''             | ''           |
			| ''                                                                | "January 2021" | "February 2021" | "March 2021" | "TOTAL"      |
			| ''                                                                | "Quantity"     | "Quantity"      | "Quantity"   | "Quantity" |
			| "Product range"                                                    | '80'             | '130'             | '160'          | '370'        |
			| "5C:Corporate performance management "                                      | '5'              | '15'              | '10'           | '30'         |
			| "2C:Corporation "                                                  | '7'              | '17'              | '14'           | '38'         |
			| "4C:Enterprise 8.3 CORP. Server License (x86-64) "           | '20'             | '30'              | '40'           | '90'         |
			| "1C:ERP. Corporate performance management "                                   | '8'              | '18'              | '16'           | '42'         |
			| "3C:Enterprise 8 CORP. Client license for 100 users " | '40'             | '50'              | '80'           | '170'        |

	* Закроем документ
		Когда открылось окно '$WindowTitle$'
		И я нажимаю на кнопку с именем 'FormWriteANDContinue'

	* Проверим, можно ли имзенить значение пустой ячейки
		Когда Открылся экземпляр отчета для вида отчета "VA - Quantity" валюта 'RUB' организация "Mercury LLC" сценарий "VA - Main scenario" периодичность "Month" проект '' аналитики '' '' '' '' '' '' 
		И я запоминаю текущее окно как 'WindowTitle'
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R12C2:R12C4'
		И я нажимаю на кнопку с именем 'ChangeIndicators'

	* Закроем и сохраним документ
		Тогда открылось окно '$WindowTitle$'
		И я нажимаю на кнопку с именем 'WriteAndClose'
		И я жду закрытия окна '$WindowTitle$' в течение 20 секунд

Сценарий: 02.04 Создание отчета с загрузкой из РС "VA - Price"

	И Я создаю вид отчета с именем "VA - Price" и родителем "VA - Calculation rules (группа)"

	* Редактируем структуру отчета
		И Я открываю контруктор отчета с именем "VA - Price"
		И Я в конструкторе отчета добавляю строку с именем "Product range"
		И Я в конструкторе отчета добавляю колонку с именем "Price"
		И Я в конструкторе отчета добавляю аналитику с кодом "VA0Product" в ячейку 'R2C2' 

	* Вводим формулы расчета
		Тогда открылось окно "Edit tree"
		И из выпадающего списка с именем 'WorkMode' я выбираю точное значение "Indicators calculation formulas"
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R2C2'
		И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
		И я нажимаю на кнопку с именем 'AddOperand1'
		Тогда открылось окно "Data sources"
		И я нажимаю на кнопку с именем 'FormCreate'
		Тогда открылось окно "Data source (create)"
		И из выпадающего списка с именем 'ReceiptOption' я выбираю точное значение "Current infobase information register"
		И я нажимаю кнопку выбора у поля с именем 'DBInformationRegister'
		Тогда открылось окно "Infobase information registers"
		И я нажимаю на кнопку с именем 'FormFind'
		Тогда открылось окно "Find"
		И из выпадающего списка с именем 'FieldSelector' я выбираю точное значение "Register"
		И я меняю значение переключателя с именем 'CompareType' на "At beginning of line"
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
			| "Field"    |
			| 'KindЦены' |
		И в таблице 'TreeOfFilterParametersDB' я выбираю текущую строку
		И в таблице 'TreeOfFilterParametersDB' из выпадающего списка с именем 'ParameterCalculationMethod' я выбираю точное значение "Fixed value"
		И в таблице 'TreeOfFilterParametersDB' из выпадающего списка с именем 'DefiningMethodClarification' я выбираю по строке "VA - Products"
		И я нажимаю на кнопку с именем 'FormWriteAndClose'
		И я жду закрытия окна "Data source (create) *" в течение 20 секунд
		Тогда открылось окно "Data sources"
		И в таблице 'List' я выбираю текущую строку	
		Тогда открылось окно "Edit tree *"
		И я нажимаю на кнопку с именем 'WriteAndCollapse'

	И Я Для вида отчета "VA - Price" я создаю бланк по умолчанию
	И Я Для вида отчета "VA - Price" в бланке для группы раскрытия с адресом 'R8C1' задаю сортировку "Product range" "Product ID"

Сценарий: 02.05 Создание экземпляра отчета - "VA - Price"

	И Я создаю экземпляр отчета для вида отчета "VA - Price" сценарий "VA - Main scenario" период '1/1/2021' '3/31/2021' периодичность "Month" организация "Mercury LLC" проект '' аналитики '' '' '' '' '' ''

	* Запишем документ
		И я нажимаю на кнопку с именем 'FormFillByDefault'
		И я нажимаю на кнопку с именем 'FormWriteANDContinue'

	* Проверим результат
		Когда Открылся экземпляр отчета для вида отчета "VA - Price" валюта 'RUB' организация "Mercury LLC" сценарий "VA - Main scenario" периодичность "Month" проект '' аналитики '' '' '' '' '' ''
		Тогда табличный документ 'SpreadsheetFieldTemlate' равен:
			| "VA - Price"                                                       | ''               | ''                | ''             | ''           |
			| ''                                                                | ''               | ''                | ''             | ''           |
			| ''                                                                | "January 2021" | "February 2021" | "March 2021" | "TOTAL"      |
			| ''                                                                | "Price"           | "Price"            | "Price"         | "Price"       |
			| "Product range"                                                    | '6,030,000'      | '6,633,000'       | '7,495,400'    | '20,158,400' |
			| "5C:Corporate performance management "                                      | '1,250,000'      | '1,375,000'       | '1,553,800'    | '4,178,800'  |
			| "2C:Corporation "                                                  | '2,050,000'      | '2,255,000'       | '2,548,200'    | '6,853,200'  |
			| "4C:Enterprise 8.3 CORP. Server License (x86-64) "           | '180,000'        | '198,000'         | '223,700'      | '601,700'    |
			| "1C:ERP. Corporate performance management "                                   | '1,950,000'      | '2,145,000'       | '2,423,900'    | '6,518,900'  |
			| "3C:Enterprise 8 CORP. Client license for 100 users " | '600,000'        | '660,000'         | '745,800'      | '2,005,800'  |

Сценарий: 02.06 Создание отчета с рассчитываемыми показателями - "VA - Sales"

	И Я создаю вид отчета с именем "VA - Sales" и родителем "VA - Calculation rules (группа)"

	* Редактируем структуру отчета
		И Я открываю контруктор отчета с именем "VA - Sales"
		И Я в конструкторе отчета добавляю строку с именем "Product range"
		И Я в конструкторе отчета добавляю колонку с именем "Quantity"
		И Я в конструкторе отчета добавляю колонку с именем "Price"
		И Я в конструкторе отчета добавляю колонку с именем "Amount"
		И Я в конструкторе отчета в ячейке 'R2C2' я меняю свойство показателя 'IsNonFinancial' на 'True'
		И Я в конструкторе отчета добавляю аналитику с кодом "VA0Product" в ячейку 'R2C2' 

	* Вводим формулы расчета
		Тогда открылось окно "Edit tree"
		И из выпадающего списка с именем 'WorkMode' я выбираю точное значение "Indicators calculation formulas"
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R2C2'
		И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
		И я нажимаю на кнопку с именем 'RefToIndicator1'
		И Я выбираю показатель с кодом "ProductRange_Quantity" вида отчета  "VA - Quantity"
		Тогда открылось окно "Edit tree *"
		И я нажимаю на кнопку с именем 'WriteAndCollapse'
		Тогда открылось окно "Edit tree"
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R2C3'
		И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
		И я нажимаю на кнопку с именем 'RefToIndicator1'
		И Я выбираю показатель с кодом "ProductRange_Price" вида отчета "VA - Price"
		Тогда открылось окно "Edit tree *"
		И я нажимаю на кнопку с именем 'WriteAndCollapse'
		Тогда открылось окно "Edit tree"
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R2C4'
		И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
		И я нажимаю на кнопку с именем 'RefToIndicator1'
		И Я выбираю показатель с кодом "ProductRange_Quantity"
		Тогда открылось окно "Edit tree *"
		И я нажимаю на кнопку с именем 'ButtonMultiply'
		И я нажимаю на кнопку с именем 'RefToIndicator1'
		И Я выбираю показатель с кодом "ProductRange_Price"
		Тогда открылось окно "Edit tree *"
		И я нажимаю на кнопку с именем 'WriteAndCollapse'	
		Когда открылось окно "Edit tree"
		И Я закрываю окно "Edit tree"

	И Я Для вида отчета "VA - Sales" я создаю бланк по умолчанию
	И Я Для вида отчета "VA - Sales" в бланке для группы раскрытия с адресом 'R8C1' задаю сортировку "Product range" "Product ID"
		
Сценарий: 02.07 Создание экземпляра отчета - "VA - Sales"	- пишем черновые версии

	И Я создаю экземпляр отчета для вида отчета "VA - Sales" сценарий "VA - Main scenario" период '1/1/2021' '3/31/2021' периодичность "Month" организация "Mercury LLC" проект '' аналитики '' '' '' '' '' ''
	И я запоминаю текущее окно как 'WindowTitle'

	* Документ должен быть пустой
		Когда открылось окно '$WindowTitle$'
		Тогда табличный документ 'SpreadsheetFieldTemlate' равен:
			| "VA - Sales" | ''               | ''     | ''      | ''                | ''     | ''      | ''             | ''     | ''      | ''           | ''     | ''      |
			| ''             | ''               | ''     | ''      | ''                | ''     | ''      | ''             | ''     | ''      | ''           | ''     | ''      |
			| ''             | "January 2021" | ''     | ''      | "February 2021" | ''     | ''      | "March 2021" | ''     | ''      | "TOTAL"      | ''     | ''      |
			| ''             | "Quantity"     | "Price" | "Amount" | "Quantity"      | "Price" | "Amount" | "Quantity"   | "Price" | "Amount" | "Quantity" | "Price" | "Amount" |
			| "Product range" | '0'              | '0'    | '0'     | '0'               | '0'    | '0'     | '0'            | '0'    | '0'     | '0'          | '0'    | '0'     |

	* Расчитаем документ
		И я нажимаю на кнопку с именем 'FormFillByDefault'
		Когда открылось окно '$WindowTitle$'
		Тогда табличный документ 'SpreadsheetFieldTemlate' равен:
			| "VA - Sales"                                                    | ''               | ''          | ''           | ''                | ''          | ''            | ''             | ''          | ''            | ''           | ''           | ''            |
			| ''                                                                | ''               | ''          | ''           | ''                | ''          | ''            | ''             | ''          | ''            | ''           | ''           | ''            |
			| ''                                                                | "January 2021" | ''          | ''           | "February 2021" | ''          | ''            | "March 2021" | ''          | ''            | "TOTAL"      | ''           | ''            |
			| ''                                                                | "Quantity"     | "Price"      | "Amount"      | "Quantity"      | "Price"      | "Amount"       | "Quantity"   | "Price"      | "Amount"       | "Quantity" | "Price"       | "Amount"       |
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

Сценарий: 02.08 Создание экземпляра отчета - "VA - Sales"

	И Я создаю экземпляр отчета для вида отчета "VA - Sales" сценарий "VA - Main scenario" период '1/1/2021' '3/31/2021' периодичность "Month" организация "Mercury LLC" проект '' аналитики '' '' '' '' '' ''

	* Документ должен быть пустой
		Тогда табличный документ 'SpreadsheetFieldTemlate' равен:
			| "VA - Sales" | ''               | ''     | ''      | ''                | ''     | ''      | ''             | ''     | ''      | ''           | ''     | ''      |
			| ''             | ''               | ''     | ''      | ''                | ''     | ''      | ''             | ''     | ''      | ''           | ''     | ''      |
			| ''             | "January 2021" | ''     | ''      | "February 2021" | ''     | ''      | "March 2021" | ''     | ''      | "TOTAL"      | ''     | ''      |
			| ''             | "Quantity"     | "Price" | "Amount" | "Quantity"      | "Price" | "Amount" | "Quantity"   | "Price" | "Amount" | "Quantity" | "Price" | "Amount" |
			| "Product range" | '0'              | '0'    | '0'     | '0'               | '0'    | '0'     | '0'            | '0'    | '0'     | '0'          | '0'    | '0'     |

	* Рассчитаем документ
		И я нажимаю на кнопку с именем 'FormFillByDefault'
		И я нажимаю на кнопку с именем 'FormWriteANDContinue'
		И я запоминаю текущее окно как 'WindowTitle'
		Когда открылось окно '$WindowTitle$'
		Тогда табличный документ 'SpreadsheetFieldTemlate' равен:
			| "VA - Sales"                                                    | ''               | ''          | ''           | ''                | ''          | ''            | ''             | ''          | ''            | ''           | ''           | ''            |
			| ''                                                                | ''               | ''          | ''           | ''                | ''          | ''            | ''             | ''          | ''            | ''           | ''           | ''            |
			| ''                                                                | "January 2021" | ''          | ''           | "February 2021" | ''          | ''            | "March 2021" | ''          | ''            | "TOTAL"      | ''           | ''            |
			| ''                                                                | "Quantity"     | "Price"      | "Amount"      | "Quantity"      | "Price"      | "Amount"       | "Quantity"   | "Price"      | "Amount"       | "Quantity" | "Price"       | "Amount"       |
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

Сценарий: 02.09 Проверка поведения формы редактирования процедур

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
			| "Report kind"   |
			| "VA - Sales" |
		Если '$$LanguageИнтерфейса$$ = "Ru"' Тогда
			И таблица 'Definitions' стала равной:
				| "Method"                                        |
				| 'SettlementObject'                                |
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
		И у элемента формы с именем 'FormVisibilityReportsKinds' установлена пометка
		И элемент формы с именем 'UsedReportTypes' присутствует на форме	 	
		И я нажимаю на кнопку с именем 'FormVisibilityReportsKinds'
		И у элемента формы с именем 'FormVisibilityReportsKinds' не установлена пометка
		И элемент формы с именем 'UsedReportTypes' отсутствует на форме
		И я нажимаю на кнопку с именем 'FormVisibilityReportsKinds'
		И у элемента формы с именем 'FormVisibilityReportsKinds' установлена пометка

	* Видимость Процедуры и функции
		И у элемента формы с именем 'FormVisibilityПроцедурANDФункций' установлена пометка
		И элемент формы с именем 'GroupMethods' присутствует на форме	 	
		И я нажимаю на кнопку с именем 'FormVisibilityПроцедурANDФункций'
		И у элемента формы с именем 'FormVisibilityПроцедурANDФункций' не установлена пометка
		И элемент формы с именем 'GroupMethods' отсутствует на форме
		И я нажимаю на кнопку с именем 'FormVisibilityПроцедурANDФункций'
		И у элемента формы с именем 'FormVisibilityПроцедурANDФункций' установлена пометка

	* Ввод показателей
		И в поле с именем 'TextDocumentFieldProcedure' я ввожу текст ' '
		И в таблице 'UsedReportTypes' я нажимаю на кнопку с именем 'UsedReportTypesInsertIndicators'
		И Я выбираю показатель с кодом "ProductRange_Quantity"
		Когда открылось окно "VA - Sales, VA - Sales: Procedure before calculation *"
		Если '$$LanguageИнтерфейса$$ = "Ru"' Тогда
			Тогда элемент формы с именем 'TextDocumentFieldProcedure' стал равен 
				|' IndicatorsArray = New Array;'|
				|'IndicatorsArray.Add(\"DimenKindSales:Products_Count\");'|
				|'tIndicatorsValues = GetIndicatorsValue(New Structure(\"ReportsIndicators\", IndicatorsArray));'|
				|''|							
		Иначе
			Тогда элемент формы с именем 'TextDocumentFieldProcedure' стал равен 
				|' ArrayIndicators = New Array;'|
				|'ArrayIndicators.Add(\"VASales:ProductRange_Quantity\");'|
				|'tValuesIndicators = UGetIndicatorsValue(New Structure(\"IndicatorsReports\", ArrayIndicators));'|
				|''|
		И в поле с именем 'TextDocumentFieldProcedure' я ввожу текст ' '
		И в таблице 'UsedReportTypes' я нажимаю на кнопку с именем 'UsedReportTypesAdd'
		И в таблице 'UsedReportTypes' из выпадающего списка с именем 'UsedReportTypesReportKind' я выбираю по строке "VA - Price"
		И в таблице 'UsedReportTypes' я завершаю редактирование строки
		И в таблице 'UsedReportTypes' я нажимаю на кнопку с именем 'UsedReportTypesInsertIndicators'
		И Я выбираю показатель с кодом "ProductRange_Price"
		Если '$$LanguageИнтерфейса$$ = "Ru"' Тогда
			Тогда элемент формы с именем 'TextDocumentFieldProcedure' стал равен 
				|' IndicatorsArray = New Array;'|
				|'IndicatorsArray.Add(\"DimenKindPrice:Products_Price\");'|
				|'tIndicatorsValues = GetIndicatorsValue(New Structure(\"ReportsIndicators\", IndicatorsArray));'|
				|''|						
		Иначе
			Тогда элемент формы с именем 'TextDocumentFieldProcedure' стал равен 
				|' ArrayIndicators = New Array;'|
				|'ArrayIndicators.Add(\"VAPrice:ProductRange_Price\");'|
				|'tValuesIndicators = UGetIndicatorsValue(New Structure(\"IndicatorsReports\", ArrayIndicators));'|
				|''|
		И в поле с именем 'TextDocumentFieldProcedure' я ввожу текст ' '	

	* Ввод функций
		Если '$$LanguageИнтерфейса$$ = "Ru"' Тогда
			* ОбъектРасчета
				И в таблице 'Definitions' я перехожу к строке:
						| "Method"         |
						| 'SettlementObject' |
				И в таблице 'Definitions' я выбираю текущую строку
				Тогда элемент формы с именем 'TextDocumentFieldProcedure' стал равен 
					|' SettlementObject.'|
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
					|'	[<Scenario>], [<ReportPeriod>], [<Company>],'|
					|'	[<ConsolidationMethod>], [<MinTotalOwnershipShare>], [<MaxTotalOwnershipShare>],'|
					|'	[<CompanyTypes>], [<PerimeterOwner>]);'|
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
		Если '$$LanguageИнтерфейса$$ = "Ru"' Тогда
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
		Тогда открылось окно "Edit tree"
		И Я закрываю окно "Edit tree"

Сценарий: 02.10 Проверка работы произвольных функций расчета

	* Откроем правило обработки
		И Я открываю контруктор отчета с именем "VA - Sales"
		И я нажимаю на кнопку открытия поля с именем 'ProcessingRule'
		Тогда Открылась правило расчета для вида отчета "VA - Sales"
		И я запоминаю текущее окно как 'WindowTitle'

	* Вводим текст процедуры
		И я нажимаю на кнопку с именем 'FormProcedureAfterCalculation'
		Когда открылось окно "VA - Sales, VA - Sales: Procedure after calculation"
		Если '$$LanguageИнтерфейса$$ = "Ru"' Тогда
			И в поле с именем 'TextDocumentFieldProcedure' я ввожу текст 
				|'ReportData = New Structure("Organization,Scenario,Currency,ReportPeriod",'|
				|' SettlementObject.Organization,SettlementObject.Scenario,SettlementObject.MainCurrency,SettlementObject.PeriodsArray);'|
				|'DimensionsToDrillDown = New Structure("Dimension1");'|
				|'AdditionalParameters = New Structure("GrandTotal",Enums.IndicatorTotalsTypes.Sum);'|
				|''|
				|'IndicatorsArray = New Array;'|
				|'IndicatorsArray.Add("DimenKindSales:Products_Count");'|
				|'ReportData.Insert("ReportsIndicators",IndicatorsArray);'|
				|'tIndicatorsValues_Count = GetIndicatorsValue('|
				|' ReportData,DimensionsToDrillDown);'|
				|'ReportData.Delete("ReportsIndicators"); '|
				|''|
				|'ReportData.Insert("ReportIndicator", '|
				|' Справочники.ReportsIndicators.FindByCode("Products_Price",True,,SettlementObject.ReportKind));'|
				|'tIndicatorsValues_Price = GetIndicatorsValue('|
				|' ReportData,DimensionsToDrillDown,AdditionalParameters);'|
				|'ReportData.Delete("ReportIndicator"); '|
				|''|
				|'ClearAll();'|
				|''|
				|'Для Each StringValue2 Из tIndicatorsValues_Count Do'|
				|''|
				|' PeriodOffset = RelativePeriod(StringValue2.ReportPeriod, 1);'|
				|' If DateBelongsToPeriod(PeriodOffset.StartDate,SettlementObject.PeriodsArray.Get(1)) OR'|
				|'  DateBelongsToPeriod(PeriodOffset.StartDate,SettlementObject.PeriodsArray.Get(2)) Then'|
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
				|'Для Each StringValue2 Из tIndicatorsValues_Price Do'|
				|''|
				|' If NOT ValueIsFilled(StringValue2.ReportPeriod) Then'|
				|'  Continue;'|
				|' EndIf;'|
				|''|
				|' PeriodOffset = RelativePeriod(StringValue2.ReportPeriod, 1);'|
				|' If DateBelongsToPeriod(PeriodOffset.StartDate,SettlementObject.PeriodsArray.Get(1)) OR'|
				|'  DateBelongsToPeriod(PeriodOffset.StartDate,SettlementObject.PeriodsArray.Get(2)) Then'|
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
				|'  CalcStructure.Entity, CalcStructure.Scenario, CalcStructure.BaseCurrency, CalcStructure.ArrayPeriods);'|
				|'DisclosedAnalysts = New Structure(\"Dimension1\");'|
				|'ExtraOptions = New Structure(\"GrandTotal\",Enums.IndicatorTotalsTypes.Sum);'|
				|''|
				|'ArrayIndicators = New Array;'|
				|'ArrayIndicators.Add(\"VASales:ProductRange_Quantity\");'|
				|'ReportData.Insert(\"ReportsIndicators\", ArrayIndicators);'|
				|'tValuesIndicators_Number = UGetIndicatorsValue('|
				|' 	ReportData, DisclosedAnalysts);'|
				|'ReportData.Delete(\"ReportsIndicators\"); '|
				|''|
				|'ReportData.Insert(\"ReportIndicator\", '|
				|'  Справочники.ReportsIndicators.FindByCode(\"ProductRange_Price\",True,,CalcStructure.ReportKind));'|
				|'tValuesIndicators_Price = UGetIndicatorsValue('|
				|'  ReportData, DisclosedAnalysts, ExtraOptions);'|
				|'ReportData.Delete(\"ReportIndicator\"); '|
				|''|
				|'UClearAll();'|
				|''|
				|'For Each StringValue In tValuesIndicators_Number Do'|
				|''|
				|' PeriodOffset = URelativePeriod(StringValue.ReportPeriod, 1);'|
				|' If UDateBelongsToPeriod(PeriodOffset.StartDate,CalcStructure.ArrayPeriods.Get(1)) OR'|
				|'  UDateBelongsToPeriod(PeriodOffset.StartDate,CalcStructure.ArrayPeriods.Get(2)) Then'|
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
				|' If UDateBelongsToPeriod(PeriodOffset.StartDate,CalcStructure.ArrayPeriods.Get(1)) OR'|
				|'  UDateBelongsToPeriod(PeriodOffset.StartDate,CalcStructure.ArrayPeriods.Get(2)) Then'|
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
		Тогда открылось окно "Edit tree"
		И Я закрываю окно "Edit tree"

	* Рассчитаем документ
		Тогда открылось окно "Report kinds and templates"
		И в таблице 'ListOfReportTypes' я нажимаю на кнопку с именем 'ListOfReportTypesOpenInstancesList'
		Тогда открылось окно "Report instances"
		И в таблице 'List' я выбираю текущую строку
		Тогда Открылся экземпляр отчета для вида отчета "VA - Sales" валюта 'RUB' организация "Mercury LLC" сценарий "VA - Main scenario" периодичность "Month" проект '' аналитики '' '' '' '' '' '' 
		И я запоминаю текущее окно как 'WindowTitle'
		И я нажимаю на кнопку с именем 'FormFillByDefault'

	* Сравниваем результат
		Тогда табличный документ 'SpreadsheetFieldTemlate' равен:
			| "VA - Sales"                                                    | ''               | ''     | ''      | ''                | ''           | ''      | ''             | ''           | ''      | ''           | ''           | ''      |
			| ''                                                                | ''               | ''     | ''      | ''                | ''           | ''      | ''             | ''           | ''      | ''           | ''           | ''      |
			| ''                                                                | "January 2021" | ''     | ''      | "February 2021" | ''           | ''      | "March 2021" | ''           | ''      | "TOTAL"      | ''           | ''      |
			| ''                                                                | "Quantity"     | "Price" | "Amount" | "Quantity"      | "Price"       | "Amount" | "Quantity"   | "Price"       | "Amount" | "Quantity" | "Price"       | "Amount" |
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

Сценарий: 02.11 Отображение экземпляра в валюте после расчетов

	И Я открываю первый экземпляр отчета для вида отчета "VA - Sales"
	Тогда Открылся экземпляр отчета для вида отчета "VA - Sales" валюта 'RUB' организация "Mercury LLC" сценарий "VA - Main scenario" периодичность "Month" проект '' аналитики '' '' '' '' '' '' 
	
	* Проверим суммы в валюте
		И я нажимаю на кнопку с именем 'FormOpenSettings'
		Тогда открылось окно "Edit report settings"
		И я перехожу к закладке с именем 'GroupPageReportSettings'
		И из выпадающего списка с именем 'SelectedCurrency' я выбираю точное значение "EUR"
		И я нажимаю на кнопку с именем 'FormApplyANDClose'
		Когда Открылся экземпляр отчета для вида отчета "VA - Sales" валюта 'EUR' организация "Mercury LLC" сценарий "VA - Main scenario" периодичность "Month" проект '' аналитики '' '' '' '' '' ''
		И я запоминаю текущее окно как 'WindowTitle' 
		Тогда табличный документ 'SpreadsheetFieldTemlate' равен:
			| "VA - Sales"                                                    | ''               | ''     | ''      | ''                | ''        | ''      | ''             | ''        | ''      | ''           | ''        | ''      |
			| ''                                                                | ''               | ''     | ''      | ''                | ''        | ''      | ''             | ''        | ''      | ''           | ''        | ''      |
			| ''                                                                | "January 2021" | ''     | ''      | "February 2021" | ''        | ''      | "March 2021" | ''        | ''      | "TOTAL"      | ''        | ''      |
			| ''                                                                | "Quantity"     | "Price" | "Amount" | "Quantity"      | "Price"    | "Amount" | "Quantity"   | "Price"    | "Amount" | "Quantity" | "Price"    | "Amount" |
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

Сценарий: 02.12 Удаление версий при автоматическом расчете

	И Я открываю первый экземпляр отчета для вида отчета "VA - Sales"
	Тогда Открылся экземпляр отчета для вида отчета "VA - Sales" валюта 'RUB' организация "Mercury LLC" сценарий "VA - Main scenario" периодичность "Month" проект '' аналитики '' '' '' '' '' ''
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
			| "VA - Sales"                                                    | ''               | ''          | ''           | ''                | ''          | ''            | ''             | ''          | ''            | ''           | ''           | ''            |
			| ''                                                                | ''               | ''          | ''           | ''                | ''          | ''            | ''             | ''          | ''            | ''           | ''           | ''            |
			| ''                                                                | "January 2021" | ''          | ''           | "February 2021" | ''          | ''            | "March 2021" | ''          | ''            | "TOTAL"      | ''           | ''            |
			| ''                                                                | "Quantity"     | "Price"      | "Amount"      | "Quantity"      | "Price"      | "Amount"       | "Quantity"   | "Price"      | "Amount"       | "Quantity" | "Price"       | "Amount"       |
			| "Product range"                                                    | '80'             | '6,030,000' | '63,800,000' | '130'             | '6,633,000' | '136,510,000' | '160'          | '7,495,400' | '158,607,200' | '370'        | '20,158,400' | '358,917,200' |
			| "5C:Corporate performance management "                                      | '5'              | '1,250,000' | '6,250,000'  | '15'              | '1,375,000' | '20,625,000'  | '10'           | '1,553,800' | '15,538,000'  | '30'         | '4,178,800'  | '42,413,000'  |
			| "2C:Corporation "                                                  | '7'              | '2,050,000' | '14,350,000' | '17'              | '2,255,000' | '38,335,000'  | '14'           | '2,548,200' | '35,674,800'  | '38'         | '6,853,200'  | '88,359,800'  |
			| "4C:Enterprise 8.3 CORP. Server License (x86-64) "           | '20'             | '180,000'   | '3,600,000'  | '30'              | '198,000'   | '5,940,000'   | '40'           | '223,700'   | '8,948,000'   | '90'         | '601,700'    | '18,488,000'  |
			| "1C:ERP. Corporate performance management "                                   | '8'              | '1,950,000' | '15,600,000' | '18'              | '2,145,000' | '38,610,000'  | '16'           | '2,423,900' | '38,782,400'  | '42'         | '6,518,900'  | '92,992,400'  |
			| "3C:Enterprise 8 CORP. Client license for 100 users " | '40'             | '600,000'   | '24,000,000' | '50'              | '660,000'   | '33,000,000'  | '80'           | '745,800'   | '59,664,000'  | '170'        | '2,005,800'  | '116,664,000' |
		
				
