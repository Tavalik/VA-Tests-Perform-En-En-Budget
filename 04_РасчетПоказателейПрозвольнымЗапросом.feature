#language: ru
@tree

Функционал: 04. Проверка произвольных запросов расчета показателей

Как Администратор я хочу
Проверить что произвольные запросы работают для расчета показателей
чтобы показатели рассчитывались без ошибок

Контекст: 

	И я подключаю TestClient "CPM - Budget" логин "Administrator" пароль ''	
	И я закрыл все окна клиентского приложения

Сценарий: 04.00 Определение типа приложения

	Пусть Инициализация переменных

Сценарий: 04.01 Создание вида отчета "VA - Arbitrary request"

	И Я создаю вид отчета с именем "VA - Arbitrary request" и родителем "VA - Report group"
	
	* Редактируем структуру отчета
		И Я открываю контруктор отчета с именем "VA - Arbitrary request"
		И Я в конструкторе отчета добавляю строку с именем "Product range"
		И Я в конструкторе отчета добавляю колонку с именем "Price"
		И Я в конструкторе отчета добавляю аналитику с кодом "VA0Product" в ячейку 'R2C2' 

	И Я Для вида отчета "VA - Arbitrary request" я создаю бланк по умолчанию
	И Я Для вида отчета "VA - Arbitrary request" в бланке для группы раскрытия с адресом 'R8C1' задаю сортировку "Product range" "Product ID"

Сценарий: 04.02 Проверка поведения формы настройки показателей

	И Я открываю контруктор отчета с именем "VA - Arbitrary request"
				
	* Вводим формулу расчета	
		Тогда открылось окно "Edit tree"
		И из выпадающего списка с именем 'WorkMode' я выбираю точное значение "Indicators calculation formulas"
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R2C2'
		И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
		И в поле с именем 'TextDocumentFieldProcedure' я ввожу текст ' '
		И я нажимаю на кнопку с именем 'AddOperand1'

	* Проверяем поведение формы при расширенном движке расчета показателей
		Тогда открылось окно "Data sources"
		И я нажимаю на кнопку с именем 'FormCreate'			
		Когда открылось окно "Data source (create)"
		И из выпадающего списка с именем 'ReceiptOption' я выбираю точное значение "Current infobase report item indicator"
		И элемент формы с именем 'ShouldUseMultiperiodContext' отсутствует на форме
		И элемент формы с именем 'Help' отсутствует на форме
		И из выпадающего списка с именем 'ReceiptOption' я выбираю точное значение "Current infobase accumulation register"
		И элемент формы с именем 'ShouldUseMultiperiodContext' отсутствует на форме
		И элемент формы с именем 'Help' отсутствует на форме
		И из выпадающего списка с именем 'ReceiptOption' я выбираю точное значение "Current infobase accounting register"
		И элемент формы с именем 'ShouldUseMultiperiodContext' отсутствует на форме
		И элемент формы с именем 'Help' отсутствует на форме
		И из выпадающего списка с именем 'ReceiptOption' я выбираю точное значение "Current infobase information register"
		И элемент формы с именем 'ShouldUseMultiperiodContext' отсутствует на форме
		И элемент формы с именем 'Help' отсутствует на форме
		И из выпадающего списка с именем 'ReceiptOption' я выбираю точное значение "Current infobase catalog"
		И элемент формы с именем 'ShouldUseMultiperiodContext' отсутствует на форме
		И элемент формы с именем 'Help' отсутствует на форме
		И из выпадающего списка с именем 'ReceiptOption' я выбираю точное значение "Arbitrary query to current infobase"
		И элемент формы с именем 'ShouldUseMultiperiodContext' присутствует на форме
		И элемент формы с именем 'Help' присутствует на форме			
		И я нажимаю на кнопку с именем 'Help'
		Тогда открылось окно "Help"
		И Я закрываю окно "Help"

	* Устанавливаем текст запроса
		Когда открылось окно "Data source (create) *"
		Если '$$IsCPM$$' Тогда 
			И в поле с именем 'QueryTextForm' я ввожу текст 
				|'SELECT'|
				|'	ProductPrices.Period AS Date,'|
				|'	ProductPrices.Products AS Products,'|
				|'	MAX(ProductPrices.Price) AS Price'|
				|'INTO втРасчетная'|
				|'FROM'|
				|'	InformationRegister.ProductPrices AS ProductPrices'|
				|'WHERE'|
				|'	ProductPrices.Period >= &ParameterStartDate'|
				|'	AND ProductPrices.Period <= &ParameterEndDate'|
				|'	AND ProductPrices.PricesType = &ParameterPricesType'|
				|''|
				|'GROUP BY'|
				|'	ProductPrices.Period,'|
				|'	ProductPrices.Products'|
				|';'|
				|''|
				|'////////////////////////////////////////////////////////////////////////////////'|
				|'SELECT'|
				|'	втРасчетная.Date AS Date,'|
				|'	втРасчетная.Products AS Products,'|
				|'	втРасчетная.Price AS Price'|
				|'FROM'|
				|'	втРасчетная AS втРасчетная'|
		Если '$$IsERPCPM$$' Тогда
			И в поле с именем 'QueryTextForm' я ввожу текст 
				|'SELECT'|
				|'	ProductPrices.Period AS Date,'|
				|'	ProductPrices.Products AS Products,'|
				|'	MAX(ProductPrices.Price) AS Price'|
				|'INTO втРасчетная'|
				|'FROM'|
				|'	InformationRegister.ProductPrices AS ProductPrices'|
				|'WHERE'|
				|'	ProductPrices.Period >= &ParameterStartDate'|
				|'	AND ProductPrices.Period <= &ParameterEndDate'|
				|'	AND ProductPrices.KindЦены = &ParameterPricesType'|
				|''|
				|'GROUP BY'|
				|'	ProductPrices.Period,'|
				|'	ProductPrices.Products'|
				|';'|
				|''|
				|'////////////////////////////////////////////////////////////////////////////////'|
				|'SELECT'|
				|'	втРасчетная.Date AS Date,'|
				|'	втРасчетная.Products AS Products,'|
				|'	втРасчетная.Price AS Price'|
				|'FROM'|
				|'	втРасчетная AS втРасчетная'|
		И я нажимаю на кнопку с именем 'QueryWizard'
		Тогда открылось окно "Query wizard"
		И Я закрываю окно "Query wizard"
		Если открылось окно '1C:Enterprise' Тогда
			И я нажимаю на кнопку с именем 'Button0'
		Тогда открылось окно "Data source (create) *"
		И я нажимаю на кнопку с именем 'EditQueryText'
		И я перехожу к закладке с именем 'DimensionsMap'
		
	* Проверяем заполнение таблиц
		Когда открылось окно "Data source (create) *"
		И в таблице 'FieldsTreeDB' я разворачиваю строку:
			| "Field"                 |
			| "Query parameters(3)" |
		И в таблице 'FieldsTreeDB' я разворачиваю строку
			| "Field"                 |
			| "Data source fields(3)" |
		Тогда Таблица 'FieldsTreeDB' содержит '8' строк из списка:			
			| "Field"                     |
			| "Query parameters(3)"     |
			| 'ParameterStartDate'       |
			| 'ParameterEndDate'    |
			| 'ParameterPricesType'           |
			| "Data source fields(3)" |
			| 'Date'                     |
			| 'Products'             |
			| 'Price'                     |
		Тогда Таблица 'MappingTable' содержит '3' строк из списка:
			| "Destination dimension"       | "Filling method" | "Column name"    | "Dimension kind" |
			| "Dimension 1: Product range" | "Source field"    | '[Products]' | "Product range"  |
			| 'Value'                  | "Source field"    | '[Price]'         | ''              |
			| 'Period'                    | "Source field"    | '[Date]'         | ''              |
		И я перехожу к закладке с именем 'FiltersPage'
		Когда открылось окно "Data source (create) *"
		Тогда Таблица 'TreeOfFilterParametersDB' содержит '3' строк из списка:
			| "Field"                    | "Filter" | "Filter clarification" | "Value to check" |
			| '[ParameterStartDate]'    | ''      | ''                 | ''                      |
			| '[ParameterEndDate]' | ''      | ''                 | ''                      |
			| '[ParameterPricesType]'        | ''      | ''                 | ''                      |

	* Заполняем параметры		
		Когда открылось окно "Data source (create) *"	
		И в таблице 'TreeOfFilterParametersDB' я перехожу к строке:
			| "Field"                 |
			| '[ParameterStartDate]' |
		И в таблице 'TreeOfFilterParametersDB' из выпадающего списка с именем 'ParameterCalculationMethod' я выбираю точное значение "Report period start date"
		И в таблице 'TreeOfFilterParametersDB' я завершаю редактирование строки
		И в таблице 'TreeOfFilterParametersDB' я перехожу к строке:
			| "Field"                    |
			| '[ParameterEndDate]' |
		И в таблице 'TreeOfFilterParametersDB' я выбираю текущую строку
		И в таблице 'TreeOfFilterParametersDB' из выпадающего списка с именем 'ParameterCalculationMethod' я выбираю точное значение "Report period end date"
		И в таблице 'TreeOfFilterParametersDB' я завершаю редактирование строки
		И в таблице 'TreeOfFilterParametersDB' я перехожу к строке:
			| "Field"             |
			| '[ParameterPricesType]' |
		И в таблице 'TreeOfFilterParametersDB' я выбираю текущую строку
		И в таблице 'TreeOfFilterParametersDB' из выпадающего списка с именем 'ParameterCalculationMethod' я выбираю точное значение "Fixed value"
		И в таблице 'TreeOfFilterParametersDB' я активизирую поле с именем 'DefiningMethodClarification'
		И в таблице 'TreeOfFilterParametersDB' из выпадающего списка с именем 'DefiningMethodClarification' я выбираю по строке "VA - Products"
		И в таблице 'TreeOfFilterParametersDB' я завершаю редактирование строки
		Тогда Таблица 'TreeOfFilterParametersDB' содержит '3' строк из списка:
			| "Field"                    | "Filter"                      | "Filter clarification"  | "Value to check" |
			| '[ParameterStartDate]'    | "Report period start date" | ''                  | ''                      |
			| '[ParameterEndDate]' | "Report period end date"  | ''                  | ''                      |
			| '[ParameterPricesType]'        | "Fixed value"     | "VA - Products" | ''                      |

	* Записываем элемент
		Когда открылось окно "Data source (create) *"
		И я нажимаю на кнопку с именем 'FormWriteAndClose'
		И я жду закрытия окна "Data source (create) *" в течение 20 секунд
		Тогда открылось окно "Data sources"
		И в таблице 'List' я выбираю текущую строку
		Тогда открылось окно "Edit tree *"
		И я нажимаю на кнопку с именем 'WriteAndCollapse'

Сценарий: 04.03 Создание экземпляра отчета - "VA - Arbitrary request" с использованием многопериодного контекста

	И Я создаю экземпляр отчета для вида отчета "VA - Arbitrary request" сценарий "VA - Main scenario" период '1/1/2021' '3/31/2021' периодичность "Month" организация "Mercury LLC" проект '' аналитики '' '' '' '' '' ''

	* Документ должен быть пустой
		Тогда табличный документ 'SpreadsheetFieldTemlate' равен:
			| "VA - Arbitrary request" | ''               | ''                | ''             | ''      |
			| ''                         | ''               | ''                | ''             | ''      |
			| ''                         | "January 2021" | "February 2021" | "March 2021" | "TOTAL" |
			| ''                         | "Price"           | "Price"            | "Price"         | "Price"  |
			| "Product range"             | '0'              | '0'               | '0'            | '0'     |

	* Рассчитываем значения показателей	
		Когда открылось окно '$WindowTitle$'
		И я нажимаю на кнопку с именем 'FormFillByDefault'
		Тогда табличный документ 'SpreadsheetFieldTemlate' равен:
			| "VA - Arbitrary request"                                        | ''               | ''                | ''             | ''           |
			| ''                                                                | ''               | ''                | ''             | ''           |
			| ''                                                                | "January 2021" | "February 2021" | "March 2021" | "TOTAL"      |
			| ''                                                                | "Price"           | "Price"            | "Price"         | "Price"       |
			| "Product range"                                                    | '6,030,000'      | '6,633,000'       | '7,495,400'    | '20,158,400' |
			| "5C:Corporate performance management "                                      | '1,250,000'      | '1,375,000'       | '1,553,800'    | '4,178,800'  |
			| "2C:Corporation "                                                  | '2,050,000'      | '2,255,000'       | '2,548,200'    | '6,853,200'  |
			| "4C:Enterprise 8.3 CORP. Server License (x86-64) "           | '180,000'        | '198,000'         | '223,700'      | '601,700'    |
			| "1C:ERP. Corporate performance management "                                   | '1,950,000'      | '2,145,000'       | '2,423,900'    | '6,518,900'  |
			| "3C:Enterprise 8 CORP. Client license for 100 users " | '600,000'        | '660,000'         | '745,800'      | '2,005,800'  |
	
	* Записываем документ
		Когда открылось окно '$WindowTitle$'
		И я нажимаю на кнопку с именем 'WriteAndClose'
		И я жду закрытия окна '$WindowTitle$' в течение 20 секунд

Сценарий: 04.04 Проверка поведениея формы настройки показателей без использования многопериодного контекста

	И Я открываю контруктор отчета с именем "VA - Arbitrary request"

	* Снимаем флаг многопериодного контекста у источника данных	
		Тогда открылось окно "Edit tree"
		И из выпадающего списка с именем 'WorkMode' я выбираю точное значение "Indicators calculation formulas"
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R2C2'
		И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
		И я нажимаю на кнопку с именем 'AddOperand1'
		Когда открылось окно "Data sources"
		И я выбираю пункт контекстного меню с именем 'ListContextMenuChange' на элементе формы с именем 'List'
		Если '$$ЭтоPerform$$' Тогда
			Тогда открылось окно 'Arbitrary query to current infobase (Data source)'
		Иначе					
			Тогда открылось окно "Arbitrary query to current infobase (Data source)"
		И я запоминаю текущее окно как 'WindowTitle'
		И я нажимаю на кнопку с именем 'FormWriteAndClose'
		И я жду закрытия окна '$WindowTitle$' в течение 20 секунд

	* Проверяем поведение формы при расширенном движке расчета показателей		
		Тогда открылось окно "Data sources"
		И я выбираю пункт контекстного меню с именем 'ListContextMenuChange' на элементе формы с именем 'List'
		Тогда открылось окно '$WindowTitle$'
		И элемент формы с именем 'ShouldUseMultiperiodContext' присутствует на форме
		И элемент формы с именем 'Help' присутствует на форме
		И я снимаю флаг с именем 'ShouldUseMultiperiodContext'
		И я перехожу к закладке с именем 'DimensionsMap'
		И я перехожу к закладке с именем 'FiltersPage'
		Тогда Таблица 'TreeOfFilterParametersDB' содержит '3' строк из списка:
			| "Field"                    | "Filter"                      | "Filter clarification"  | "Value to check" |
			| '[ParameterStartDate]'    | "Report period start date" | ''                  | ''                      |
			| '[ParameterEndDate]' | "Report period end date"  | ''                  | ''                      |
			| '[ParameterPricesType]'        | "Fixed value"     | "VA - Products" | ''                      |
		И я нажимаю на кнопку с именем 'FormWrite'
		И флаг с именем 'ShouldUseMultiperiodContext' равен 'False'												
								
	* Проверяем заполнение таблиц
		Когда открылось окно '$WindowTitle$'
		И я нажимаю на кнопку с именем 'EditQueryText'
		И я нажимаю на кнопку с именем 'EditQueryText'				
		И в таблице 'FieldsTreeDB' я разворачиваю строку:
			| "Field"                 |
			| "Query parameters(3)" |
		И в таблице 'FieldsTreeDB' я разворачиваю строку
			| "Field"                     |
			| "Data source fields(3)" |
		Тогда Таблица 'FieldsTreeDB' содержит '8' строк из списка:				
			| "Field"                     |
			| "Query parameters(3)"     |
			| 'ParameterStartDate'       |
			| 'ParameterEndDate'    |
			| 'ParameterPricesType'           |
			| "Data source fields(3)" |
			| 'Date'                     |
			| 'Products'             |
			| 'Price'                     |
		Тогда Таблица 'MappingTable' содержит '2' строк из списка:	
			| "Destination dimension"       | "Filling method" | "Column name"    | "Dimension kind" |
			| "Dimension 1: Product range" | "Source field"    | '[Products]' | "Product range"  |
			| 'Value'                  | "Source field"    | '[Price]'         | ''              |
		И я перехожу к закладке с именем 'FiltersPage'
		Когда открылось окно '$WindowTitle$'
		Тогда Таблица 'TreeOfFilterParametersDB' содержит '3' строк из списка:
			| "Field"                    | "Filter"                      | "Filter clarification"  | "Value to check" |
			| '[ParameterStartDate]'    | "Report period start date" | ''                  | ''                      |
			| '[ParameterEndDate]' | "Report period end date"  | ''                  | ''                      |
			| '[ParameterPricesType]'        | "Fixed value"     | "VA - Products" | ''                      |
	 			
	* Закрываем источник данных
		Когда открылось окно '$WindowTitle$'
		И Я закрываю окно '$WindowTitle$'
		Тогда открылось окно "Data sources"
		И Я закрываю окно "Data sources"
		Тогда открылось окно "Edit tree"
		И я нажимаю на кнопку с именем 'UndoFormulaEdit'

Сценарий: 04.05 Создание экземпляра отчета - "VA - Arbitrary request" без использования многопериодного контекста

	И Я создаю экземпляр отчета для вида отчета "VA - Arbitrary request" сценарий "VA - Main scenario" период '1/1/2021' '3/31/2021' периодичность "Month" организация "Venus LLC" проект '' аналитики '' '' '' '' '' ''

	* Документ должен быть пустой
		Тогда табличный документ 'SpreadsheetFieldTemlate' равен:
			| "VA - Arbitrary request" | ''               | ''                | ''             | ''      |
			| ''                         | ''               | ''                | ''             | ''      |
			| ''                         | "January 2021" | "February 2021" | "March 2021" | "TOTAL" |
			| ''                         | "Price"           | "Price"            | "Price"         | "Price"  |
			| "Product range"             | '0'              | '0'               | '0'            | '0'     |

	* Рассчитываем значения показателей	
		Когда открылось окно '$WindowTitle$'
		И я нажимаю на кнопку с именем 'FormFillByDefault'
		Тогда табличный документ 'SpreadsheetFieldTemlate' равен:
			| "VA - Arbitrary request"                                        | ''               | ''                | ''             | ''           |
			| ''                                                                | ''               | ''                | ''             | ''           |
			| ''                                                                | "January 2021" | "February 2021" | "March 2021" | "TOTAL"      |
			| ''                                                                | "Price"           | "Price"            | "Price"         | "Price"       |
			| "Product range"                                                    | '6,030,000'      | '6,633,000'       | '7,495,400'    | '20,158,400' |
			| "5C:Corporate performance management "                                      | '1,250,000'      | '1,375,000'       | '1,553,800'    | '4,178,800'  |
			| "2C:Corporation "                                                  | '2,050,000'      | '2,255,000'       | '2,548,200'    | '6,853,200'  |
			| "4C:Enterprise 8.3 CORP. Server License (x86-64) "           | '180,000'        | '198,000'         | '223,700'      | '601,700'    |
			| "1C:ERP. Corporate performance management "                                   | '1,950,000'      | '2,145,000'       | '2,423,900'    | '6,518,900'  |
			| "3C:Enterprise 8 CORP. Client license for 100 users " | '600,000'        | '660,000'         | '745,800'      | '2,005,800'  |

	* Записываем документ
		Когда открылось окно '$WindowTitle$'
		И я нажимаю на кнопку с именем 'WriteAndClose'
		И я жду закрытия окна '$WindowTitle$' в течение 20 секунд
