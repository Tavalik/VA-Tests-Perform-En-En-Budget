#language: ru

@tree

Функционал: 15. Проверка контролируемых значений при записи

Как Администратор я хочу
чтобы нельзя было записать значение показателя большее, чем контрольное

Контекст: 

	И я подключаю TestClient "CPM - Budget" логин "Administrator" пароль ''	
	И я закрыл все окна клиентского приложения

Сценарий: 15.00 Определение типа приложения

	Пусть Инициализация переменных

Сценарий: 15.01 Создание вида отчета "VA - Controlled indicators"

	* Создает вид отыета
		И Я создаю вид отчета с именем "VA - Controlled indicators" и родителем "VA - Report group"
		И Я открываю вид отчета с именем "VA - Controlled indicators"
	
	* Доработаем вид отчета	
		И я изменяю флаг с именем 'IsChangeTrackingEnabled'
		И я устанавливаю флаг с именем 'ProjectSeparation'		
		И я нажимаю на кнопку с именем 'RecordButtonForm'

	* Настраиваем структуру вида отчета
		И я нажимаю на кнопку с именем 'EditTree'
		Когда открылось окно "Edit tree"
		И Я в конструкторе отчета добавляю строку с именем "Synthetic"
		И Я в конструкторе отчета добавляю строку с именем "Dimensions"
		И Я в конструкторе отчета добавляю колонку с именем "Quantity"
		И Я в конструкторе отчета добавляю колонку с именем "ControlYes"
		И Я в конструкторе отчета добавляю колонку с именем "ControlNo"
		И Я в конструкторе отчета добавляю колонку с именем "Date"

	* Настраиваем показатели
		И Я в конструкторе отчета в ячейке 'R2C2:R3C5' меняю свойства показателей 'ControllableIndicator' на "True"	
		И Я в конструкторе отчета в ячейке 'R2C2' меняю свойства показателей 'ControllableIndicator' на "False"
		И я в конструкторе отчета в ячейке 'R3C2' меняю свойство показателя 'ControllableIndicator' на "False"
		И я в конструкторе отчета в ячейке 'R2C5' меняю свойство показателя 'ValueType' на "Date"
		И я в конструкторе отчета в ячейке 'R3C5' меняю свойство показателя 'ValueType' на "Date"

	* Настраиваем аналитики
		И Я в конструкторе отчета добавляю аналитику с кодом "VA0CFItems" в ячейку 'R3C2'
		И Я в конструкторе отчета добавляю аналитику с кодом "VA0Product" в ячейку 'R3C3'
		И Я в конструкторе отчета в ячейке 'R3C8' меняю аналитику валюта
		И Я в конструкторе отчета в ячейке 'R3C2:R3C5' меняю свойства показателей 'ShouldRecalculateForeignCurrencyAmount' на "True"

	* Бланк вида отчета
		И Я Для вида отчета "VA - Controlled indicators" создаю бланк по умолчанию		

Сценарий: 15.02 Создание экземпляра отчета "VA - Controlled indicators"

	И Я создаю экземпляр отчета для вида отчета "VA - Controlled indicators" сценарий "VA - Main scenario" период '1/1/2021' '3/31/2021' периодичность "Month" организация "Mercury LLC" проект "VA - Main project" аналитики '' '' '' '' '' ''

	* Вводим значения показателей
		* Синтетика
			И Я ввожу значение '100' в ячейку 'R6C2'
			И Я ввожу значение '100' в ячейку 'R6C3'
			И Я ввожу значение '100' в ячейку 'R6C4'
			И Я ввожу значение '1/1/2021' в ячейку 'R6C5'
			И Я ввожу значение '200' в ячейку 'R6C6'
			И Я ввожу значение '200' в ячейку 'R6C7'
			И Я ввожу значение '200' в ячейку 'R6C8'
			И Я ввожу значение '1/1/2021' в ячейку 'R6C9'
		* Аналитики
			И Я добавляю значения с раскрытием показателей в ячейку 'R7C14'
				| "Cash flow items"                       | "Product range"                 | "Currencies" | 'Period_1_Value1' | 'Period_2_Value1' |
				| "3Software sale" | "5C:Corporate performance management"    | 'RUB'    | '100'                | '200'                |
				| "3Software sale" | "2C:Corporation"                | 'RUB'    | '100'                | '200'                |
				| "3Software sale" | "1C:ERP. Corporate performance management" | 'RUB'    | '100'                | '200'                |
			И Я добавляю значения с раскрытием показателей в ячейку 'R7C15'
				| "Cash flow items"                       | "Product range"                 | "Currencies" | 'Period_1_Value1' | 'Period_2_Value1' |
				| "3Software sale" | "5C:Corporate performance management"    | 'RUB'    | '100'                | '200'                |
				| "3Software sale" | "2C:Corporation"                | 'RUB'    | '100'                | '200'                |
			И Я добавляю значения с раскрытием показателей в ячейку 'R7C16'
				| "Cash flow items"                       | "Product range"                 | "Currencies" | 'Period_1_Value1' | 'Period_2_Value1' |
				| "3Software sale" | "5C:Corporate performance management"    | 'RUB'    | '100'                | '200'                |
				| "3Software sale" | "2C:Corporation"                | 'RUB'    | '100'                | '200'                |
			И Я добавляю значения с раскрытием показателей в ячейку 'R7C17'
				| "Cash flow items"                       | "Product range"                 | "Currencies" | 'Period_1_Value1' | 'Period_2_Value1' |
				| "3Software sale" | "5C:Corporate performance management"    | 'RUB'    | '1/1/2021'         | '2/1/2021'         |
				| "3Software sale" | "2C:Corporation"                | 'RUB'    | '1/1/2021'         | '2/1/2021'         |
				| "3Software sale" | "1C:ERP. Corporate performance management" | 'RUB'    | '1/1/2021'         | '2/1/2021'         |

	* Записываем, проверяем форму
		Когда открылось окно '$WindowTitle$'
		И я нажимаю на кнопку с именем 'Write'
		Тогда табличный документ 'SpreadsheetFieldTemlate' равен:
			| "VA - Controlled indicators"    | ''               | ''           | ''            | ''           | ''                | ''           | ''            | ''           | ''             | ''           | ''            | ''     | ''           | ''           | ''            | ''           |
			| ''                                  | ''               | ''           | ''            | ''           | ''                | ''           | ''            | ''           | ''             | ''           | ''            | ''     | ''           | ''           | ''            | ''           |
			| ''                                  | "January 2021" | ''           | ''            | ''           | "February 2021" | ''           | ''            | ''           | "March 2021" | ''           | ''            | ''     | "TOTAL"      | ''           | ''            | ''           |
			| ''                                  | "Quantity"     | "ControlYes" | "ControlNo" | "Date"       | "Quantity"      | "ControlYes" | "ControlNo" | "Date"       | "Quantity"   | "ControlYes" | "ControlNo" | "Date" | "Quantity" | "ControlYes" | "ControlNo" | "Date"       |
			| "Synthetic"                         | '100'            | '100'        | '100'         | '1/1/2021' | '200'             | '200'        | '200'         | '1/1/2021' | '0'            | '0'          | '0'           | ''     | '300'        | '300'        | '300'         | '1/1/2021' |
			| "Dimensions"                         | '300'            | '200'        | '200'         | '1/1/2021' | '600'             | '400'        | '400'         | '2/1/2021' | '0'            | '0'          | '0'           | ''     | '900'        | '600'        | '600'         | '2/1/2021' |
			| "3Software sale " | '300'            | '200'        | '200'         | '1/1/2021' | '600'             | '400'        | '400'         | '2/1/2021' | '0'            | '0'          | '0'           | ''     | '900'        | '600'        | '600'         | '2/1/2021' |
			| "1C:ERP. Corporate performance management "     | '100'            | '0'          | '0'           | '1/1/2021' | '200'             | '0'          | '0'           | '2/1/2021' | '0'            | '0'          | '0'           | ''     | '300'        | '0'          | '0'           | '2/1/2021' |
			| 'RUB '                              | '100'            | '0'          | '0'           | '1/1/2021' | '200'             | '0'          | '0'           | '2/1/2021' | '0'            | '0'          | '0'           | ''     | '300'        | '0'          | '0'           | '2/1/2021' |
			| "2C:Corporation "                    | '100'            | '100'        | '100'         | '1/1/2021' | '200'             | '200'        | '200'         | '2/1/2021' | '0'            | '0'          | '0'           | ''     | '300'        | '300'        | '300'         | '2/1/2021' |
			| 'RUB '                              | '100'            | '100'        | '100'         | '1/1/2021' | '200'             | '200'        | '200'         | '2/1/2021' | '0'            | '0'          | '0'           | ''     | '300'        | '300'        | '300'         | '2/1/2021' |
			| "5C:Corporate performance management "        | '100'            | '100'        | '100'         | '1/1/2021' | '200'             | '200'        | '200'         | '2/1/2021' | '0'            | '0'          | '0'           | ''     | '300'        | '300'        | '300'         | '2/1/2021' |
			| 'RUB '                              | '100'            | '100'        | '100'         | '1/1/2021' | '200'             | '200'        | '200'         | '2/1/2021' | '0'            | '0'          | '0'           | ''     | '300'        | '300'        | '300'         | '2/1/2021' |

	* Удаляем одну строку
		Когда открылось окно '$WindowTitle$'
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке "R7C14"
		И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
		Тогда открылось окно "Drill down indicators: *"
		И в таблице 'IndicatorsDrilldown' я перехожу к строке:
			| "Currencies" | 'Value1' | 'ValueCurrency1' | "Product range"                 | 'ReportPeriod'    | "Cash flow items"                       |
			| 'RUB'    | '200'       | '200'             | "1C:ERP. Corporate performance management" | "February 2021" | "3Software sale" |
		И в таблице 'IndicatorsDrilldown' я нажимаю на кнопку с именем 'IndicatorsDrilldownDelete'
		И в таблице 'IndicatorsDrilldown' я перехожу к строке:
			| "Currencies" | 'Value1' | 'ValueCurrency1' | "Product range"                 | 'ReportPeriod'   | "Cash flow items"                       |
			| 'RUB'    | '100'       | '100'             | "1C:ERP. Corporate performance management" | "January 2021" | "3Software sale" |
		И в таблице 'IndicatorsDrilldown' я нажимаю на кнопку с именем 'IndicatorsDrilldownDelete'
		И я нажимаю на кнопку с именем 'FormOKButton1'
		Когда открылось окно '$WindowTitle$'
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке "R7C17"
		И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
		Тогда открылось окно "Drill down indicators: *"
		И в таблице 'IndicatorsDrilldown' я перехожу к строке:
			| "Currencies" | 'Value1'  | "Product range"                 | 'ReportPeriod'    | "Cash flow items"                       |
			| 'RUB'    | '2/1/2021' | "1C:ERP. Corporate performance management" | "February 2021" | "3Software sale" |
		И в таблице 'IndicatorsDrilldown' я нажимаю на кнопку с именем 'IndicatorsDrilldownDelete'
		И в таблице 'IndicatorsDrilldown' я перехожу к строке:
			| "Currencies" | 'Value1'  | "Product range"                 | 'ReportPeriod'   | "Cash flow items"                       |
			| 'RUB'    | '1/1/2021' | "1C:ERP. Corporate performance management" | "January 2021" | "3Software sale" |
		И в таблице 'IndicatorsDrilldown' я нажимаю на кнопку с именем 'IndicatorsDrilldownDelete'
		И я нажимаю на кнопку с именем 'FormOKButton1'

	* Проверяем движение документа	
		Когда открылось окно '$WindowTitle$'		
		И я нажимаю на кнопку с именем 'FormOpenDocumentRegisterRecordsFlatTab'
		Тогда открылось окно "1C:Enterprise"
		И я нажимаю на кнопку с именем 'Button0'
		Тогда открылось окно "Flat table of indicator values"
		И я жду когда в табличном документе 'ReportSpreadsheetDocument' заполнится ячейка 'R2C1' в течение 30 секунд
		Когда Я задаю параметры чтения области макета 'R1C1:R200C20'
		Дано Табличный документ 'ReportSpreadsheetDocument' равен макету 'Макеты\ВА_КонтролируемыеПоказатели_Движения.mxl' по шаблону	
		И Я закрываю окно "Flat table of indicator values"

	* Обновляем и проверяем форму
		Когда открылось окно '$WindowTitle$'
		И я нажимаю на кнопку с именем 'FormUpdateConsideringVersions'
		Тогда табличный документ 'SpreadsheetFieldTemlate' равен:
			| "VA - Controlled indicators"    | ''               | ''           | ''            | ''           | ''                | ''           | ''            | ''           | ''             | ''           | ''            | ''     | ''           | ''           | ''            | ''           |
			| ''                                  | ''               | ''           | ''            | ''           | ''                | ''           | ''            | ''           | ''             | ''           | ''            | ''     | ''           | ''           | ''            | ''           |
			| ''                                  | "January 2021" | ''           | ''            | ''           | "February 2021" | ''           | ''            | ''           | "March 2021" | ''           | ''            | ''     | "TOTAL"      | ''           | ''            | ''           |
			| ''                                  | "Quantity"     | "ControlYes" | "ControlNo" | "Date"       | "Quantity"      | "ControlYes" | "ControlNo" | "Date"       | "Quantity"   | "ControlYes" | "ControlNo" | "Date" | "Quantity" | "ControlYes" | "ControlNo" | "Date"       |
			| "Synthetic"                         | '100'            | '100'        | '100'         | '1/1/2021' | '200'             | '200'        | '200'         | '1/1/2021' | '0'            | '0'          | '0'           | ''     | '300'        | '300'        | '300'         | '1/1/2021' |
			| "Dimensions"                         | '200'            | '200'        | '200'         | '1/1/2021' | '400'             | '400'        | '400'         | '2/1/2021' | '0'            | '0'          | '0'           | ''     | '600'        | '600'        | '600'         | '2/1/2021' |
			| "3Software sale " | '200'            | '200'        | '200'         | '1/1/2021' | '400'             | '400'        | '400'         | '2/1/2021' | '0'            | '0'          | '0'           | ''     | '600'        | '600'        | '600'         | '2/1/2021' |
			| "2C:Corporation "                    | '100'            | '100'        | '100'         | '1/1/2021' | '200'             | '200'        | '200'         | '2/1/2021' | '0'            | '0'          | '0'           | ''     | '300'        | '300'        | '300'         | '2/1/2021' |
			| 'RUB '                              | '100'            | '100'        | '100'         | '1/1/2021' | '200'             | '200'        | '200'         | '2/1/2021' | '0'            | '0'          | '0'           | ''     | '300'        | '300'        | '300'         | '2/1/2021' |
			| "5C:Corporate performance management "        | '100'            | '100'        | '100'         | '1/1/2021' | '200'             | '200'        | '200'         | '2/1/2021' | '0'            | '0'          | '0'           | ''     | '300'        | '300'        | '300'         | '2/1/2021' |
			| 'RUB '                              | '100'            | '100'        | '100'         | '1/1/2021' | '200'             | '200'        | '200'         | '2/1/2021' | '0'            | '0'          | '0'           | ''     | '300'        | '300'        | '300'         | '2/1/2021' |

Сценарий: 15.03 Создаем новый сценарий для контролируемых значений

	И Я создаю сценарий с именем "VA - Scenario with control"
	И Я для сценария "VA - Scenario with control" на закладке 'Budgeting' для реквизита 'ControllingScenario' устанавливаю значение "VA - Main scenario"

	И Я создаю документ управления периодом со сценарием "VA - Scenario with control" регламентом "VA - Main regulations" периодичностью "Month" датой начала '1/1/2021' датой окончания '3/31/2021'

Сценарий: 15.04 Создаем экземпляра отчета для контролируемых значений

	* Копируем существующий документ
		И Я нахожу в списке вид отчета с именем "VA - Controlled indicators"
		И в таблице 'ReportKindList' я нажимаю на кнопку с именем 'ReportKindListOpenInstancesList'
		Тогда открылось окно "Report instances"
		И я нажимаю на кнопку с именем 'FormCopy'
		Когда открылось окно "Specify key document attributes"
		И из выпадающего списка с именем 'Scenario' я выбираю по строке "VA - Scenario with control"
		И я нажимаю кнопку выбора у поля с именем 'Organization'
		И Я выбираю организацию "Mercury LLC"
		Когда открылось окно "Specify key document attributes"
		И я нажимаю на кнопку с именем 'OKButton'
		Тогда Открылся экземпляр отчета для вида отчета "VA - Controlled indicators" валюта 'RUB' организация "Mercury LLC" сценарий "VA - Scenario with control" периодичность "Month" проект "VA - Main project" аналитики '' '' '' '' '' '' 
		
	* Меняем значения
		И Я ввожу значение '250' в ячейку 'R6C6'
		И Я ввожу значение '250' в ячейку 'R6C7'
		И Я ввожу значение '150' в ячейку 'R6C8'
		И Я ввожу значение '250' в ячейку 'R10C6'
		И Я ввожу значение '250' в ячейку 'R10C7'
		И Я ввожу значение '150' в ячейку 'R10C8'
		И Я ввожу значение '250' в ячейку 'R6C10'
		И Я ввожу значение '250' в ячейку 'R6C11'
		И Я ввожу значение '150' в ячейку 'R6C12'
		И Я ввожу значение '250' в ячейку 'R10C10'
		И Я ввожу значение '250' в ячейку 'R10C11'
		И Я ввожу значение '150' в ячейку 'R10C12'					

	* Пробуем записать документ
		Когда открылось окно '$WindowTitle$'
		И я нажимаю на кнопку с именем 'Write'
		Когда открылось окно "1C:Enterprise"
		И я нажимаю на кнопку с именем 'OK'			
		Когда открылось окно '$WindowTitle$'
		Тогда в логе сообщений TestClient есть строки:
			|"You have exceeded the controlled value for the indicator:\n	Indicator: \"Synthetic controlyes\"\n	Calculated value: \"250\"\n	Control value: \"200\"\n	Controlling scenario: \"VA - Main scenario\"\n	Company: \"Mercury LLC\"\n	Period: \"February 2021\"\n	Project: \"VA - Main project\""|
			|"You have exceeded the controlled value for the indicator:\n	Indicator: \"Dimensions controlyes\"\n	Calculated value: \"250\"\n	Control value: \"200\"\n	Controlling scenario: \"VA - Main scenario\"\n	Company: \"Mercury LLC\"\n	Period: \"February 2021\"\n	Project: \"VA - Main project\"\n	Dimension1: \"3Software sale\"\n	Dimension2: \"2C:Corporation\"\n	АналитикаВалюта: \"RUB\""|

	* Отменяем изменения
		Когда открылось окно '$WindowTitle$'
		И я делаю 12 раз		
			И я нажимаю на кнопку с именем 'CancelAction'
		Тогда табличный документ 'SpreadsheetFieldTemlate' равен:
			| "VA - Controlled indicators"    | ''               | ''           | ''            | ''           | ''                | ''           | ''            | ''           | ''             | ''           | ''            | ''     | ''           | ''           | ''            | ''           |
			| ''                                  | ''               | ''           | ''            | ''           | ''                | ''           | ''            | ''           | ''             | ''           | ''            | ''     | ''           | ''           | ''            | ''           |
			| ''                                  | "January 2021" | ''           | ''            | ''           | "February 2021" | ''           | ''            | ''           | "March 2021" | ''           | ''            | ''     | "TOTAL"      | ''           | ''            | ''           |
			| ''                                  | "Quantity"     | "ControlYes" | "ControlNo" | "Date"       | "Quantity"      | "ControlYes" | "ControlNo" | "Date"       | "Quantity"   | "ControlYes" | "ControlNo" | "Date" | "Quantity" | "ControlYes" | "ControlNo" | "Date"       |
			| "Synthetic"                         | '100'            | '100'        | '100'         | '1/1/2021' | '200'             | '200'        | '200'         | '1/1/2021' | '0'            | '0'          | '0'           | ''     | '300'        | '300'        | '300'         | '1/1/2021' |
			| "Dimensions"                         | '200'            | '200'        | '200'         | '1/1/2021' | '400'             | '400'        | '400'         | '2/1/2021' | '0'            | '0'          | '0'           | ''     | '600'        | '600'        | '600'         | '2/1/2021' |
			| "3Software sale " | '200'            | '200'        | '200'         | '1/1/2021' | '400'             | '400'        | '400'         | '2/1/2021' | '0'            | '0'          | '0'           | ''     | '600'        | '600'        | '600'         | '2/1/2021' |
			| "2C:Corporation "                    | '100'            | '100'        | '100'         | '1/1/2021' | '200'             | '200'        | '200'         | '2/1/2021' | '0'            | '0'          | '0'           | ''     | '300'        | '300'        | '300'         | '2/1/2021' |
			| 'RUB '                              | '100'            | '100'        | '100'         | '1/1/2021' | '200'             | '200'        | '200'         | '2/1/2021' | '0'            | '0'          | '0'           | ''     | '300'        | '300'        | '300'         | '2/1/2021' |
			| "5C:Corporate performance management "        | '100'            | '100'        | '100'         | '1/1/2021' | '200'             | '200'        | '200'         | '2/1/2021' | '0'            | '0'          | '0'           | ''     | '300'        | '300'        | '300'         | '2/1/2021' |
			| 'RUB '                              | '100'            | '100'        | '100'         | '1/1/2021' | '200'             | '200'        | '200'         | '2/1/2021' | '0'            | '0'          | '0'           | ''     | '300'        | '300'        | '300'         | '2/1/2021' |

	* Записываем документ
		И я нажимаю на кнопку с именем 'WriteAndClose'
		И я жду закрытия окна '$WindowTitle$' в течение 20 секунд				

Сценарий: 15.05 Создаем сводную таблицу для контролируемых значений 						

	* Создаем бланк сводной таблицы
		И Я для вида отчета "VA - Controlled indicators" создаю бланк сводной таблицы по умолчанию с отборами "Project"
		Когда открылось окно "VA - Controlled indicators (Report types)"
		И я нажимаю на кнопку открытия поля с именем 'DefaultPivotTableTemplate'
		Тогда Открылся бланк сводной таблицы для вида отчета "VA - Controlled indicators"
		И я нажимаю на кнопку с именем 'ShowTableSettingsByAxes'
		Тогда открылось окно "Set up field location"
		И в таблице 'TableRows1' я перехожу к строке:
			| "Horizontally (in rows)" |
			| "Product range"               |
		И я нажимаю на кнопку с именем 'RowsMoveDown'
		И я нажимаю на кнопку с именем 'RowsMoveDown'
		И я нажимаю на кнопку с именем 'RowsMoveDown'
		И в таблице 'TableRows1' я перехожу к строке:
			| "Horizontally (in rows)" |
			| "Additional currencies"      |
		И я нажимаю на кнопку с именем 'RowsMoveDown'
		И я нажимаю на кнопку с именем 'RowsMoveDown'
		И я нажимаю на кнопку с именем 'RowsMoveDown'
		И я изменяю флаг с именем 'TotalByColumns'
		И я нажимаю на кнопку с именем 'ButtonApply'
		Когда открылось окно '$WindowTitle$'
		И я нажимаю на кнопку с именем 'FormWrite'		

	* Открываем сводную таблицу
		Когда открылось окно '$WindowTitle$'
		И я нажимаю на кнопку с именем 'OpenPivotTable'	
		И я жду открытия формы "Pivot table: *" в течение 20 секунд			
		И Я устанавливаю отборы сводной таблицы: дата начала '1/1/2021', дата конца '3/31/2021', валюта 'RUB', сценарий "VA - Scenario with control", организация "Mercury LLC"		
		И Я устанавливаю отбор сводной таблицы 'Project' со значением "VA - Main project"	

	* Вводим значения
		И Я ввожу значение '250' в ячейку 'R4C6'
		И Я ввожу значение '250' в ячейку 'R4C7'
		И Я ввожу значение '150' в ячейку 'R4C8'
		И Я ввожу значение '250' в ячейку 'R8C6'
		И Я ввожу значение '250' в ячейку 'R8C7'
		И Я ввожу значение '150' в ячейку 'R8C8'
		И Я ввожу значение '250' в ячейку 'R4C10'
		И Я ввожу значение '250' в ячейку 'R4C11'
		И Я ввожу значение '150' в ячейку 'R4C12'
		И Я ввожу значение '250' в ячейку 'R8C10'
		И Я ввожу значение '250' в ячейку 'R8C11'
		И Я ввожу значение '150' в ячейку 'R8C12'			

	* Записываем показатели
		И я нажимаю на кнопку с именем 'Apply'
		Тогда открылось окно "Protocol"
		Тогда табличный документ 'SpreadsheetDocumentField' равен:
			| "Errors"                                                                                                                                                                                                                                                                                                                                                                                                                      |
			| "You have exceeded the controlled value for the indicator:\n	Indicator: \"Synthetic controlyes\"\n	Calculated value: \"250\"\n	Control value: \"200\"\n	Controlling scenario: \"VA - Main scenario\"\n	Company: \"Mercury LLC\"\n	Period: \"February 2021\"\n	Project: \"VA - Main project\""                                                                                                               |
			| "You have exceeded the controlled value for the indicator:\n	Indicator: \"Dimensions controlyes\"\n	Calculated value: \"250\"\n	Control value: \"200\"\n	Controlling scenario: \"VA - Main scenario\"\n	Company: \"Mercury LLC\"\n	Period: \"February 2021\"\n	Project: \"VA - Main project\"\n	Dimension1: \"3Software sale\"\n	Dimension2: \"2C:Corporation\"\n	АналитикаВалюта: \"RUB\"" |
				
		
