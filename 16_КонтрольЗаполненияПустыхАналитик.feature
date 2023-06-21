#language: ru

@tree

Функционал: 16. Проверка контроля заполнения пустых аналитик

Как Администратор я хочу
чтобы нельзя было записать значение показателя с пустой аналитикой

Контекст:

	И я подключаю TestClient "CPM - Budget" логин "Administrator" пароль ''	
	И я закрыл все окна клиентского приложения

Сценарий: 16.00 Определение типа приложения

	Пусть Инициализация переменных

Сценарий: 16.01 Создание вида отчета "VA - Empty analytics"

	* Создаем вид отчета
		И Я создаю вид отчета с именем "VA - Empty analytics" и родителем "VA - Report group"
		И Я открываю вид отчета с именем "VA - Empty analytics"
	
	* Доработаем вид отчета	
		И я перехожу к закладке с именем 'DimensionsOfReport'
		И из выпадающего списка с именем 'DimensionKind1' я выбираю по строке "VA0CFItems"
		И я нажимаю на кнопку с именем 'RecordButtonForm'	
		Тогда открылось окно "Data restructuring"
		И я нажимаю на кнопку с именем 'FormOK'

	* Настраиваем структуру вида отчета
		И я нажимаю на кнопку с именем 'EditTree'
		Когда открылось окно "Edit tree"
		И Я в конструкторе отчета добавляю строку с именем "Source"
		И Я в конструкторе отчета добавляю строку с именем "Destination1"
		И Я в конструкторе отчета добавляю строку с именем "Destination2"
		И Я в конструкторе отчета добавляю колонку с именем "Number"
		И Я в конструкторе отчета добавляю колонку с именем "Date"

	* Настраиваем показатели
		И Я в конструкторе отчета в ячейке 'R2C3:R4C3' меняю свойства показателей 'ValueType' на "Date"	

	* Настраиваем аналитики
		И Я в конструкторе отчета добавляю аналитику с кодом "VA0Product" в ячейку 'R2C3'
		И я нажимаю на кнопку с именем 'CopyAndShiftDown1'				
		И Я в конструкторе отчета добавляю аналитику с кодом "VA0ProCate" в ячейку 'R2C4'
		И я нажимаю на кнопку с именем 'CopyAndShiftDown1'

	* Устанавливаем обязателность заполнения аналитик	
		* ГР_Приемник1
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке "R3C9"
			И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
			Когда открылось окно "DG_Destination1 (Report indicator dimension groups)"
			И в таблице 'TabFieldsDisplaySetting' я перехожу к строке:
				| "Group dimension"          | "Dimension kind" | "Required" |
				| "Dimension 2: Product range" | "Product range"  | "No"          |
			И в таблице 'TabFieldsDisplaySetting' я активизирую поле с именем 'MandatoryAnalytics'
			И в таблице 'TabFieldsDisplaySetting' я изменяю флаг с именем 'MandatoryAnalytics'
			И в таблице 'TabFieldsDisplaySetting' я завершаю редактирование строки
			И я нажимаю на кнопку с именем 'FormWriteAndClose'
			И я жду закрытия окна "DG_Destination1 (Report indicator dimension groups) *" в течение 20 секунд
		* ГР_Приемник2
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке "R4C9"
			И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
			Когда открылось окно "DG_Destination2 (Report indicator dimension groups)"
			И в таблице 'TabFieldsDisplaySetting' я перехожу к строке:
				| "Group dimension"          | "Dimension kind" | "Required" |
				| "Dimension 2: Product range" | "Product range"  | "No"          |
			И в таблице 'TabFieldsDisplaySetting' я активизирую поле с именем 'MandatoryAnalytics'
			И в таблице 'TabFieldsDisplaySetting' я изменяю флаг с именем 'MandatoryAnalytics'
			И в таблице 'TabFieldsDisplaySetting' я завершаю редактирование строки
			И в таблице 'TabFieldsDisplaySetting' я перехожу к строке:
				| "Group dimension"                | "Dimension kind"      | "Required" |
				| "Dimension 3: Product categories" | "Product categories" | "No"          |
			И в таблице 'TabFieldsDisplaySetting' я активизирую поле с именем 'MandatoryAnalytics'
			И в таблице 'TabFieldsDisplaySetting' я изменяю флаг с именем 'MandatoryAnalytics'
			И в таблице 'TabFieldsDisplaySetting' я завершаю редактирование строки
			И я нажимаю на кнопку с именем 'FormWriteAndClose'
			И я жду закрытия окна "DG_Destination2 (Report indicator dimension groups) *" в течение 20 секунд

	* Закрываем конструктор
		Когда открылось окно "Edit tree"
		И Я закрываю окно "Edit tree"
		
	* Бланк вида отчета
		И Я Для вида отчета "VA - Empty analytics" создаю бланк по умолчанию

Сценарий: 16.02 Настраиваем формулы через 

	И Я открываю контруктор отчета с именем "VA - Empty analytics"

	* Ввод формул
		Когда открылось окно "Edit tree"
		И из выпадающего списка с именем 'WorkMode' я выбираю точное значение "Indicators calculation formulas"				
		И я нажимаю на кнопку с именем 'FormShowSourceData'
		И из выпадающего списка с именем 'ReportTypeFilter' я выбираю по строке "VA - Empty analytics"
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R3C2'
		И в табличном документе 'SpreadsheetDocSelectIndicator' я перехожу к ячейке "Source_Number"
		// ДОРАБОТАТЬ
		// Сделать ввод формулы по двойному клику
		Тогда открылось окно "Edit tree"
		И я нажимаю на кнопку с именем 'AddDataToCell1'
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R3C3'
		И в табличном документе 'SpreadsheetDocSelectIndicator' я перехожу к ячейке "Source_Date"
		И я нажимаю на кнопку с именем 'AddDataToCell1'
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R4C2'
		И в табличном документе 'SpreadsheetDocSelectIndicator' я перехожу к ячейке "Source_Number"
		И я нажимаю на кнопку с именем 'AddDataToCell1'
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R4C3'
		И в табличном документе 'SpreadsheetDocSelectIndicator' я перехожу к ячейке "Source_Date"
		И я нажимаю на кнопку с именем 'AddDataToCell1'
		И я нажимаю на кнопку с именем 'FormShowSourceData'

	* Настройка аналитик
		* Приемник1 число
			Когда открылось окно "Edit tree"
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R3C2'
			И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
			И я нажимаю на кнопку с именем 'AddOperand1'
			Тогда открылось окно "Data sources"
			И я выбираю пункт контекстного меню с именем 'ListContextMenuChange' на элементе формы с именем 'List'
			Тогда открылось окно "VA - Empty analytics_Source number (Data source)"
			И в таблице 'ComplianceTable' я перехожу к строке:
				| "Destination dimension"             | "Dimension kind"      | "Column name"                       | "Filling method" |
				| "Dimension 3: Product categories" | "Product categories" | "[Dimension 3: Product categories]" | "Source field"    |
			И в таблице 'ComplianceTable' я активизирую поле с именем 'ComplianceTableFillingMethod'
			И в таблице 'ComplianceTable' я выбираю текущую строку
			И в таблице 'ComplianceTable' из выпадающего списка с именем 'ComplianceTableFillingMethod' я выбираю точное значение "Fixed value"
			И в таблице 'ComplianceTable' я завершаю редактирование строки
			И я нажимаю на кнопку с именем 'FormWriteAndClose'
			И я жду закрытия окна "VA - Empty analytics_Source number (Data source) *" в течение 20 секунд
			Тогда открылось окно "Data sources"
			И Я закрываю окно "Data sources"
			Тогда открылось окно "Edit tree"
			И я нажимаю на кнопку с именем 'UndoFormulaEdit'
		* Приемник1 дата		
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке "R3C3"
			И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
			И я нажимаю на кнопку с именем 'AddOperand1'
			Тогда открылось окно "Data sources"
			И я выбираю пункт контекстного меню с именем 'ListContextMenuChange' на элементе формы с именем 'List'
			Тогда открылось окно "VA - Empty analytics_Source date (Data source)"
			И в таблице 'ComplianceTable' я перехожу к строке:
				| "Destination dimension"             | "Dimension kind"      | "Column name"                       | "Filling method" |
				| "Dimension 3: Product categories" | "Product categories" | "[Dimension 3: Product categories]" | "Source field"    |
			И в таблице 'ComplianceTable' я активизирую поле с именем 'ComplianceTableFillingMethod'
			И в таблице 'ComplianceTable' я выбираю текущую строку
			И в таблице 'ComplianceTable' из выпадающего списка с именем 'ComplianceTableFillingMethod' я выбираю точное значение "Fixed value"
			И в таблице 'ComplianceTable' я завершаю редактирование строки
			И я нажимаю на кнопку с именем 'FormWriteAndClose'
			И я жду закрытия окна "VA - Empty analytics_Source date (Data source) *" в течение 20 секунд
			Тогда открылось окно "Data sources"
			И Я закрываю окно "Data sources"
			Тогда открылось окно "Edit tree"
			И я нажимаю на кнопку с именем 'UndoFormulaEdit'
		* Приемник2 число
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R4C2'
			И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
			И я нажимаю на кнопку с именем 'AddOperand1'
			Тогда открылось окно "Data sources"
			И я выбираю пункт контекстного меню с именем 'ListContextMenuChange' на элементе формы с именем 'List'
			Тогда открылось окно "VA - Empty analytics_Source number (Data source)"
			И в таблице 'ComplianceTable' я перехожу к строке:
				| "Destination dimension"             | "Dimension kind"      | "Column name"                       | "Filling method" |
				| "Dimension 3: Product categories" | "Product categories" | "[Dimension 3: Product categories]" | "Source field"    |
			И в таблице 'ComplianceTable' я активизирую поле с именем 'ComplianceTableFillingMethod'
			И в таблице 'ComplianceTable' я выбираю текущую строку
			И в таблице 'ComplianceTable' из выпадающего списка с именем 'ComplianceTableFillingMethod' я выбираю точное значение "Fixed value"
			И в таблице 'ComplianceTable' я завершаю редактирование строки
			И я нажимаю на кнопку с именем 'FormWriteAndClose'
			И я жду закрытия окна "VA - Empty analytics_Source number (Data source) *" в течение 20 секунд
			Тогда открылось окно "Data sources"
			И Я закрываю окно "Data sources"
			Тогда открылось окно "Edit tree"
			И я нажимаю на кнопку с именем 'UndoFormulaEdit'
		* Приемник2 дата
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R4C3'
			И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
			И я нажимаю на кнопку с именем 'AddOperand1'
			Тогда открылось окно "Data sources"
			И я выбираю пункт контекстного меню с именем 'ListContextMenuChange' на элементе формы с именем 'List'
			Тогда открылось окно "VA - Empty analytics_Source date (Data source)"
			И в таблице 'ComplianceTable' я перехожу к строке:
				| "Destination dimension"             | "Dimension kind"      | "Column name"                       | "Filling method" |
				| "Dimension 3: Product categories" | "Product categories" | "[Dimension 3: Product categories]" | "Source field"    |
			И в таблице 'ComplianceTable' я активизирую поле с именем 'ComplianceTableFillingMethod'
			И в таблице 'ComplianceTable' я выбираю текущую строку
			И в таблице 'ComplianceTable' из выпадающего списка с именем 'ComplianceTableFillingMethod' я выбираю точное значение "Fixed value"
			И в таблице 'ComplianceTable' я завершаю редактирование строки
			И я нажимаю на кнопку с именем 'FormWriteAndClose'
			И я жду закрытия окна "VA - Empty analytics_Source date (Data source) *" в течение 20 секунд
			Тогда открылось окно "Data sources"
			И Я закрываю окно "Data sources"
			Тогда открылось окно "Edit tree"
			И я нажимаю на кнопку с именем 'UndoFormulaEdit'

	* Закрываем конструктор
		Когда открылось окно "Edit tree"
		И Я закрываю окно "Edit tree"		

Сценарий: 16.03 Создание экземпляра отчета "VA - Empty analytics"

	И Я создаю экземпляр отчета для вида отчета "VA - Empty analytics" сценарий "VA - Main scenario" период '1/1/2021' '3/31/2021' периодичность "Month" организация "Mercury LLC" проект '' аналитики "3Software sale" '' '' '' '' ''
	И я нажимаю на кнопку с именем 'Write'

	И Я добавляю значения с раскрытием показателей в ячейку 'R6C8'
		| "Product range"                 | "Product categories"   | 'Period_1_Value1' | 'Period_2_Value1' |
		| "5C:Corporate performance management"    | "Software products" | '100'                | '200'                |
		| "1C:ERP. Corporate performance management" | "Software products" | '100'                | '200'                |

	И Я добавляю значения с раскрытием показателей в ячейку 'R6C9'
		| "Product range"                 | "Product categories"   | 'Period_1_Value1' | 'Period_2_Value1' |
		| "5C:Corporate performance management"    | "Software products" | '1/1/2021'         | '2/2/2021'         |
		| "1C:ERP. Corporate performance management" | "Software products" | '1/1/2021'         | '2/2/2021'         |

	И Я ввожу комментарий "Number" в ячейку 'R8C2'
	И Я ввожу комментарий "Date" в ячейку 'R10C5'

	Тогда табличный документ 'SpreadsheetFieldTemlate' равен:
		| "VA - Empty analytics"         | ''               | ''           | ''                | ''           | ''             | ''     | ''      | ''           |
		| ''                              | ''               | ''           | ''                | ''           | ''             | ''     | ''      | ''           |
		| ''                              | "January 2021" | ''           | "February 2021" | ''           | "March 2021" | ''     | "TOTAL" | ''           |
		| ''                              | "Number"          | "Date"       | "Number"           | "Date"       | "Number"        | "Date" | "Number" | "Date"       |
		| "Source"                      | '200'            | '1/1/2021' | '400'             | '2/2/2021' | '0'            | ''     | '600'   | '2/2/2021' |
		| "1C:ERP. Corporate performance management " | '100'            | '1/1/2021' | '200'             | '2/2/2021' | '0'            | ''     | '300'   | '2/2/2021' |
		| "Software products "         | '100'            | '1/1/2021' | '200'             | '2/2/2021' | '0'            | ''     | '300'   | '2/2/2021' |
		| "5C:Corporate performance management "    | '100'            | '1/1/2021' | '200'             | '2/2/2021' | '0'            | ''     | '300'   | '2/2/2021' |
		| "Software products "         | '100'            | '1/1/2021' | '200'             | '2/2/2021' | '0'            | ''     | '300'   | '2/2/2021' |
		| "Destination1"                     | '200'            | '1/1/2021' | '400'             | '2/2/2021' | '0'            | ''     | '600'   | '2/2/2021' |
		| "1C:ERP. Corporate performance management " | '100'            | '1/1/2021' | '200'             | '2/2/2021' | '0'            | ''     | '300'   | '2/2/2021' |
		| ' '                             | '100'            | '1/1/2021' | '200'             | '2/2/2021' | '0'            | ''     | '300'   | '2/2/2021' |
		| "5C:Corporate performance management "    | '100'            | '1/1/2021' | '200'             | '2/2/2021' | '0'            | ''     | '300'   | '2/2/2021' |
		| ' '                             | '100'            | '1/1/2021' | '200'             | '2/2/2021' | '0'            | ''     | '300'   | '2/2/2021' |
		| "Destination2"                     | '200'            | '1/1/2021' | '400'             | '2/2/2021' | '0'            | ''     | '600'   | '2/2/2021' |
		| "1C:ERP. Corporate performance management " | '100'            | '1/1/2021' | '200'             | '2/2/2021' | '0'            | ''     | '300'   | '2/2/2021' |
		| ' '                             | '100'            | '1/1/2021' | '200'             | '2/2/2021' | '0'            | ''     | '300'   | '2/2/2021' |
		| "5C:Corporate performance management "    | '100'            | '1/1/2021' | '200'             | '2/2/2021' | '0'            | ''     | '300'   | '2/2/2021' |
		| ' '                             | '100'            | '1/1/2021' | '200'             | '2/2/2021' | '0'            | ''     | '300'   | '2/2/2021' |

	Когда открылось окно '$WindowTitle$'
	И я нажимаю на кнопку с именем 'Write'
	Тогда открылось окно "1C:Enterprise"
	И я нажимаю на кнопку с именем 'OK'

	Тогда в логе сообщений TestClient есть строки:
		|"Required dimension is not filled for the indicator:\n	Indicator: Destination2 number\n	Dimension3: \"Product categories\""|
		|"Required dimension is not filled for the indicator:\n	Indicator: Destination2 date\n	Dimension3: \"Product categories\""|

	Когда открылось окно '$WindowTitle$'
	И Я закрываю окно '$WindowTitle$'
	Тогда открылось окно "1C:Enterprise"
	И я нажимаю на кнопку с именем 'Button1'		
		
Сценарий: 16.04 Создание сводной таблицы "VA - Empty analytics"		

	И Я для вида отчета "VA - Empty analytics" создаю бланк сводной таблицы по умолчанию с отборами ""
		
	И Я октрываю сводную таблицу отчета с именем "VA - Empty analytics"
	И Я устанавливаю отборы сводной таблицы: дата начала '1/1/2021', дата конца '3/31/2021', валюта 'RUB', сценарий "VA - Main scenario", организация "Mercury LLC"		

	* Настраиваем порядок аналитик
		И я нажимаю на кнопку с именем 'ShowTableSettingsByAxes'
		И Я в сводной таблице перемещаю аналитику с именем "Product categories" вверх
		И Я в сводной таблице перемещаю аналитику с именем "Product range" вверх
		И Я в сводной таблице перемещаю аналитику с именем "Cash flow items" вверх
		И я нажимаю на кнопку с именем 'ButtonApply'			
		И я жду открытия формы "Pivot table: *" в течение 20 секунд

	И Я добавляю значения с раскрытием показателей в ячейку 'R4C8'
		 | "Product range"                 | "Product categories"   | "Cash flow items"                       | 'Period_1_Value1' | 'Period_2_Value1' |
		 | "5C:Corporate performance management"    | "Software products" | "3Software sale" | '100'                | '200'                |
		 | "1C:ERP. Corporate performance management" | "Software products" | "2Software implementation"  | '100'                | '200'                |

	И Я добавляю значения с раскрытием показателей в ячейку 'R4C9'
		| "Product range"                 | "Product categories"   | "Cash flow items"                       | 'Period_1_Value1' | 'Period_2_Value1' |
		| "5C:Corporate performance management"    | "Software products" | "3Software sale" | '1/1/2021'         | '2/2/2021'         |
		| "1C:ERP. Corporate performance management" | "Software products" | "2Software implementation"  | '1/1/2021'         | '2/2/2021'         |

	И Я ввожу комментарий "Number" в ячейку 'R7C2'
	И Я ввожу комментарий "Date" в ячейку 'R10C5'

	* Сверяем результат
		Тогда табличный документ 'SpreadsheetFieldTemlate' равен:
			| "VA - Empty analytics (pivot table)" | "January 2021" | ''           | "February 2021" | ''           | "March 2021" | ''     | "TOTAL" | ''           |
			| "VA - Empty analytics (pivot table)" | "Number"          | "Date"       | "Number"           | "Date"       | "Number"        | "Date" | "Number" | "Date"       |
			| "Source"                                | '200'            | '1/1/2021' | '400'             | '2/2/2021' | '0'            | ''     | '600'   | '2/2/2021' |
			| "2Software implementation"         | '100'            | '1/1/2021' | '200'             | '2/2/2021' | '0'            | ''     | '300'   | '2/2/2021' |
			| "1C:ERP. Corporate performance management"            | '100'            | '1/1/2021' | '200'             | '2/2/2021' | '0'            | ''     | '300'   | '2/2/2021' |
			| "Software products"                    | '100'            | '1/1/2021' | '200'             | '2/2/2021' | '0'            | ''     | '300'   | '2/2/2021' |
			| "3Software sale"        | '100'            | '1/1/2021' | '200'             | '2/2/2021' | '0'            | ''     | '300'   | '2/2/2021' |
			| "5C:Corporate performance management"               | '100'            | '1/1/2021' | '200'             | '2/2/2021' | '0'            | ''     | '300'   | '2/2/2021' |
			| "Software products"                    | '100'            | '1/1/2021' | '200'             | '2/2/2021' | '0'            | ''     | '300'   | '2/2/2021' |
			| "Destination1"                               | '200'            | '1/1/2021' | '400'             | '2/2/2021' | '0'            | ''     | '600'   | '2/2/2021' |
			| "2Software implementation"         | '100'            | '1/1/2021' | '200'             | '2/2/2021' | '0'            | ''     | '300'   | '2/2/2021' |
			| "1C:ERP. Corporate performance management"            | '100'            | '1/1/2021' | '200'             | '2/2/2021' | '0'            | ''     | '300'   | '2/2/2021' |
			| ''                                        | '100'            | '1/1/2021' | '200'             | '2/2/2021' | '0'            | ''     | '300'   | '2/2/2021' |
			| "3Software sale"        | '100'            | '1/1/2021' | '200'             | '2/2/2021' | '0'            | ''     | '300'   | '2/2/2021' |
			| "5C:Corporate performance management"               | '100'            | '1/1/2021' | '200'             | '2/2/2021' | '0'            | ''     | '300'   | '2/2/2021' |
			| ''                                        | '100'            | '1/1/2021' | '200'             | '2/2/2021' | '0'            | ''     | '300'   | '2/2/2021' |
			| "Destination2"                               | '200'            | '1/1/2021' | '400'             | '2/2/2021' | '0'            | ''     | '600'   | '2/2/2021' |
			| "2Software implementation"         | '100'            | '1/1/2021' | '200'             | '2/2/2021' | '0'            | ''     | '300'   | '2/2/2021' |
			| "1C:ERP. Corporate performance management"            | '100'            | '1/1/2021' | '200'             | '2/2/2021' | '0'            | ''     | '300'   | '2/2/2021' |
			| ''                                        | '100'            | '1/1/2021' | '200'             | '2/2/2021' | '0'            | ''     | '300'   | '2/2/2021' |
			| "3Software sale"        | '100'            | '1/1/2021' | '200'             | '2/2/2021' | '0'            | ''     | '300'   | '2/2/2021' |
			| "5C:Corporate performance management"               | '100'            | '1/1/2021' | '200'             | '2/2/2021' | '0'            | ''     | '300'   | '2/2/2021' |
			| ''                                        | '100'            | '1/1/2021' | '200'             | '2/2/2021' | '0'            | ''     | '300'   | '2/2/2021' |
	
	* Открываем экземпляр отчета
		Когда открылось окно "Pivot table: *"
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке "R10C3"
		И я выбираю пункт контекстного меню с именем 'SpreadsheetFieldTemlateContextMenuOpenReportInstance' на элементе формы с именем 'SpreadsheetFieldTemlate'
		И Открылся экземпляр отчета для вида отчета "VA - Empty analytics" валюта "RUB" организация "Mercury LLC" сценарий "VA - Main scenario" периодичность "Month"  проект '' аналитики "3Software sale" '' '' '' '' ''
		И Я закрываю окно '$WindowTitle$'

	* Открываем несуществующий экземпляр отчета
		Когда открылось окно "Pivot table: *"
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке "R7C3"
		И я выбираю пункт контекстного меню с именем 'SpreadsheetFieldTemlateContextMenuOpenReportInstance' на элементе формы с именем 'SpreadsheetFieldTemlate'
		Тогда в логе сообщений TestClient есть строки:
			|"A report instance is not found by the key slices:\n	Scenario: VA - Main scenario\n	Company: Mercury LLC\n	Period: January 2021,\n	Dimension1: 2Software implementation"|
	
	Когда открылось окно "Pivot table: *"
	И я нажимаю на кнопку с именем 'Apply'

	Тогда открылось окно "Protocol"		
	Тогда табличный документ 'SpreadsheetDocumentField' равен:
		| "Errors"                                                                                                                     |
		| "Required dimension is not filled for the indicator:\n	Indicator: Destination2 number\n	Dimension3: \"Product categories\"" |
		| "Required dimension is not filled for the indicator:\n	Indicator: Destination2 date\n	Dimension3: \"Product categories\"" |
		
