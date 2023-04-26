#language: ru

@tree

Функционал: 12. Автоматическое заполнение пустых аналитик

Как Администратор я хочу
Проверить автоматическое заполнение аналитик
чтобы пустые аналитики заполнялись 

Контекст: 

	И я подключаю TestClient "CPM - Budget" логин "Administrator" пароль ''	
	И я закрыл все окна клиентского приложения

Сценарий: 12.00 Начальная инициализация переменных

	Пусть Инициализация переменных

Сценарий: 12.01 Настраиваем значения аналитик по умолчанию

	* Открываем список
		И В командном интерфейсе я выбираю "Budgeting, reporting, and analysis" "Dimension types (corporate)"
		Когда открылось окно "Dimension types (corporate)"

	* Настраиваем Товарные категории
		* Находим вид аналитики
			И я нажимаю на кнопку с именем 'FormFind'
			Тогда открылось окно "Find"
			И из выпадающего списка с именем 'FieldSelector' я выбираю точное значение "Code"
			И в поле с именем 'Pattern' я ввожу текст "VA0ProCate"
			И я меняю значение переключателя с именем 'CompareType' на "Exact match"
			И я нажимаю на кнопку с именем 'Find'
			Тогда открылось окно "Dimension types (corporate)"
			И в таблице 'List' я выбираю текущую строку
			Тогда открылось окно "Product categories (Dimension types (corporate))"
			И В текущем окне я нажимаю кнопку командного интерфейса "Default dimension values"
		* Удаляем текущие позиции
			И пока в таблице 'List' количество строк '>' 0 Тогда
				И я выбираю пункт контекстного меню с именем 'ListContextMenuDelete' на элементе формы с именем 'List'
				Тогда открылось окно "1C:Enterprise"
				И я нажимаю на кнопку с именем 'Button0'				
		* Создаем значение на январь
			Тогда открылось окно "Product categories (Dimension types (corporate))"
			И я нажимаю на кнопку с именем 'FormCreate'
			Тогда открылось окно "Default dimension values (create)"
			И в поле с именем 'Period' я ввожу текст '12/2/2020'
			Если '$$ЭтоPerform$$' Тогда
				И я нажимаю кнопку выбора у поля с именем 'DefaultValue'
				Тогда открылось окно "Arbitrary classifier"
				И я нажимаю на кнопку с именем 'FormFind'
				Тогда открылось окно "Find"
				И из выпадающего списка с именем 'FieldSelector' я выбираю точное значение "Description"
				И в поле с именем 'Pattern' я ввожу текст "Software products"
				И я меняю значение переключателя с именем 'CompareType' на "Exact match"
				И я нажимаю на кнопку с именем 'Find'
				Тогда открылось окно "Arbitrary classifier"
				И в таблице 'List' я выбираю текущую строку
			Иначе					
				И из выпадающего списка с именем 'DefaultValue' я выбираю по строке "Software products"
			И я нажимаю на кнопку с именем 'FormWriteAndClose'
			И я жду закрытия окна "Default dimension values (create) *" в течение 20 секунд
		* Закрываем окна
			Тогда открылось окно "Product categories (Dimension types (corporate))"
			И Я закрываю окно "Product categories (Dimension types (corporate))"

	* Настраиваем Номенклатуру	
		* Находим вид аналитики
			И я нажимаю на кнопку с именем 'FormFind'
			Тогда открылось окно "Find"
			И из выпадающего списка с именем 'FieldSelector' я выбираю точное значение "Code"
			И в поле с именем 'Pattern' я ввожу текст "VA0Product"
			И я меняю значение переключателя с именем 'CompareType' на "Exact match"
			И я нажимаю на кнопку с именем 'Find'
			Тогда открылось окно "Dimension types (corporate)"
			И в таблице 'List' я выбираю текущую строку
			Тогда открылось окно "Product range (Dimension types (corporate))"
			И В текущем окне я нажимаю кнопку командного интерфейса "Default dimension values"
		* Удаляем текущие позиции
			И пока в таблице 'List' количество строк '>' 0 Тогда
				И я выбираю пункт контекстного меню с именем 'ListContextMenuDelete' на элементе формы с именем 'List'
				Тогда открылось окно "1C:Enterprise"
				И я нажимаю на кнопку с именем 'Button0'				
		* Создаем значение на февраль
			Тогда открылось окно "Product range (Dimension types (corporate))"
			И я нажимаю на кнопку с именем 'FormCreate'
			Тогда открылось окно "Default dimension values (create)"
			И в поле с именем 'Period' я ввожу текст '1/2/2021'
			Если '$$ЭтоPerform$$' Тогда
				И я нажимаю кнопку выбора у поля с именем 'DefaultValue'
				Тогда открылось окно "Product range"
				И я нажимаю на кнопку с именем 'FormFind'
				Тогда открылось окно "Find"
				И из выпадающего списка с именем 'FieldSelector' я выбираю точное значение "Description"
				И в поле с именем 'Pattern' я ввожу текст "5C:Corporate performance management"
				И я меняю значение переключателя с именем 'CompareType' на "Exact match"
				И я нажимаю на кнопку с именем 'Find'
				Тогда открылось окно "Product range"
				И в таблице 'List' я выбираю текущую строку
			Иначе
				И из выпадающего списка с именем 'DefaultValue' я выбираю по строке "5C:Corporate performance management"
			И я нажимаю на кнопку с именем 'FormWriteAndClose'
			И я жду закрытия окна "Default dimension values (create) *" в течение 20 секунд
		* Создаем значение на март
			Тогда открылось окно "Product range (Dimension types (corporate))"
			И я нажимаю на кнопку с именем 'FormCreate'
			Тогда открылось окно "Default dimension values (create)"
			И в поле с именем 'Period' я ввожу текст '2/2/2021'
			Если '$$ЭтоPerform$$' Тогда
				И я нажимаю кнопку выбора у поля с именем 'DefaultValue'
				Тогда открылось окно "Product range"
				И я нажимаю на кнопку с именем 'FormFind'
				Тогда открылось окно "Find"
				И из выпадающего списка с именем 'FieldSelector' я выбираю точное значение "Description"
				И в поле с именем 'Pattern' я ввожу текст "1C:ERP. Corporate performance management"
				И я меняю значение переключателя с именем 'CompareType' на "Exact match"
				И я нажимаю на кнопку с именем 'Find'
				Тогда открылось окно "Product range"
				И в таблице 'List' я выбираю текущую строку
			Иначе
				И из выпадающего списка с именем 'DefaultValue' я выбираю по строке "1C:ERP. Corporate performance management"
			И я нажимаю на кнопку с именем 'FormWriteAndClose'
			И я жду закрытия окна "Default dimension values (create) *" в течение 20 секунд
		* Закрываем окна
			Тогда открылось окно "Product range (Dimension types (corporate))"
			И Я закрываю окно "Product range (Dimension types (corporate))"
		
Сценарий: 12.02 Создаем вид отчета и структуру отчета

	И Я создаю вид отчета с именем "VA - Filling empty analytics" и родителем "VA - Report group"
	
	И Я открываю вид отчета с именем "VA - Filling empty analytics"
	И я перехожу к закладке с именем 'DimensionsOfReport'
	И из выпадающего списка с именем 'DimensionKind1' я выбираю по строке "VA0CFItems"
	И я нажимаю на кнопку с именем 'RecordButtonForm'	
	Тогда открылось окно "Data restructuring"
	И я нажимаю на кнопку с именем 'FormOK'

	И я нажимаю на кнопку с именем 'EditTree'
	И Я в конструкторе отчета добавляю строку с именем "Source"
	И Я в конструкторе отчета добавляю строку с именем "SuccessorSameAnalytics"		
	И Я в конструкторе отчета добавляю строку с именем "SuccessorEmptyAnalytics"
	И Я в конструкторе отчета добавляю колонку с именем "Amount"
	И Я в конструкторе отчета добавляю колонку с именем "Date"

	И Я в конструкторе отчета в ячейке 'R2C3:R4C3' я меняю свойства показателей 'ValueType' на "Date"
		
	И Я в конструкторе отчета добавляю аналитику с кодом "VA0ProCate" в ячейку 'R2C3'
	И я нажимаю на кнопку с именем 'CopyAndShiftDown1'
	И Я в конструкторе отчета добавляю аналитику с кодом "VA0Product" в ячейку 'R2C4'
	И я нажимаю на кнопку с именем 'CopyAndShiftDown1'	

	* Устанавливаем формулы
		* Сумма
			Когда открылось окно "Edit tree"
			И из выпадающего списка с именем 'WorkMode' я выбираю точное значение "Indicators calculation formulas"
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R3C2'
			И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R2C2'
			И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
			И я нажимаю на кнопку с именем 'WriteAndCollapse'
			Тогда открылось окно "Edit tree"
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R4C2'
			И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R2C2'
			И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
			И я нажимаю на кнопку с именем 'WriteAndCollapse'
			Тогда открылось окно "Edit tree"
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R4C2'
			И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
			И я нажимаю на кнопку с именем 'AddOperand1'
			Тогда открылось окно "Data sources"
			И я выбираю пункт контекстного меню с именем 'ListContextMenuChange' на элементе формы с именем 'List'
			Тогда открылось окно "VA - Filling empty analytics_Source amount (Data source)"
			И в таблице 'ComplianceTable' я перехожу к строке:
				| "Destination dimension"             | "Dimension kind"      | "Column name"                       | "Filling method" |
				| "Dimension 2: Product categories" | "Product categories" | "[Dimension 2: Product categories]" | "Source field"    |
			И в таблице 'ComplianceTable' я выбираю текущую строку
			И в таблице 'ComplianceTable' из выпадающего списка с именем 'ComplianceTableFillingMethod' я выбираю точное значение "Fixed value"
			И в таблице 'ComplianceTable' я завершаю редактирование строки
			И в таблице 'ComplianceTable' я перехожу к строке:
				| "Destination dimension"       | "Dimension kind" | "Column name"                 | "Filling method" |
				| "Dimension 3: Product range" | "Product range"  | "[Dimension 3: Product range]" | "Source field"    |
			И в таблице 'ComplianceTable' я выбираю текущую строку
			И в таблице 'ComplianceTable' из выпадающего списка с именем 'ComplianceTableFillingMethod' я выбираю точное значение "Fixed value"
			И в таблице 'ComplianceTable' я завершаю редактирование строки
			И я нажимаю на кнопку с именем 'FormWriteAndClose'
			И я жду закрытия окна "VA - Filling empty analytics_Source amount (Data source) *" в течение 20 секунд
			Тогда открылось окно "Data sources"
			И Я закрываю окно "Data sources"
		* Дата
			Тогда открылось окно "Edit tree"
			И я нажимаю на кнопку с именем 'WriteAndCollapse'
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R3C3'
			И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R2C3'
			И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
			И я нажимаю на кнопку с именем 'WriteAndCollapse'
			Тогда открылось окно "Edit tree"
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R4C3'
			И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R2C3'
			И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
			И я нажимаю на кнопку с именем 'WriteFormula'
			Тогда открылось окно "Edit tree"
			И я нажимаю на кнопку с именем 'AddOperand1'
			Тогда открылось окно "Data sources"
			И я выбираю пункт контекстного меню с именем 'ListContextMenuChange' на элементе формы с именем 'List'
			Тогда открылось окно "VA - Filling empty analytics_Source date (Data source)"
			И в таблице 'ComplianceTable' я перехожу к строке:
				| "Destination dimension"             | "Dimension kind"      | "Column name"                       | "Filling method" |
				| "Dimension 2: Product categories" | "Product categories" | "[Dimension 2: Product categories]" | "Source field"    |
			И в таблице 'ComplianceTable' я выбираю текущую строку
			И в таблице 'ComplianceTable' из выпадающего списка с именем 'ComplianceTableFillingMethod' я выбираю точное значение "Fixed value"
			И в таблице 'ComplianceTable' я завершаю редактирование строки
			И в таблице 'ComplianceTable' я перехожу к строке:
				| "Destination dimension"       | "Dimension kind" | "Column name"                 | "Filling method" |
				| "Dimension 3: Product range" | "Product range"  | "[Dimension 3: Product range]" | "Source field"    |
			И в таблице 'ComplianceTable' я выбираю текущую строку
			И в таблице 'ComplianceTable' из выпадающего списка с именем 'ComplianceTableFillingMethod' я выбираю точное значение "Fixed value"
			И в таблице 'ComplianceTable' я завершаю редактирование строки
			И я нажимаю на кнопку с именем 'FormWriteAndClose'
			И я жду закрытия окна "VA - Filling empty analytics_Source date (Data source) *" в течение 20 секунд
			Тогда открылось окно "Data sources"
			И Я закрываю окно "Data sources"
			Тогда открылось окно "Edit tree"
			И я нажимаю на кнопку с именем 'WriteAndCollapse'
		* Закрываем конструктор
			Тогда открылось окно "Edit tree"
			И Я закрываю окно "Edit tree"
					
	И Я для вида отчета "VA - Filling empty analytics" я создаю бланк по умолчанию
	И Я Для вида отчета "VA - Filling empty analytics" в бланке для группы раскрытия с адресом 'R9C1' меняю сортировку "Product range" "Description" на сортировку "Product range" "Product ID"
	И Я Для вида отчета "VA - Filling empty analytics" в бланке для группы раскрытия с адресом 'R12C1' меняю сортировку "Product range" "Description" на сортировку "Product range" "Product ID"
	И Я Для вида отчета "VA - Filling empty analytics" в бланке для группы раскрытия с адресом 'R15C1' меняю сортировку "Product range" "Description" на сортировку "Product range" "Product ID"

Сценарий: 12.03 Создаем экземпляр отчета без записи и заполнения аналитик

	И Я создаю экземпляр отчета для вида отчета "VA - Filling empty analytics" сценарий "VA - Main scenario" период '1/1/2021' '3/31/2021' периодичность "Month" организация "Mercury LLC" проект '' аналитики '' '' '' '' '' ''

	И Я добавляю значения с раскрытием показателей в ячейку 'R6C2'
		| 'Value1' |
		| '1,000'     |
	И Я добавляю значения с раскрытием показателей в ячейку 'R6C5'
		| 'Value1'  |
		| '2/1/2021' |

	* Сравниваем результат
		Тогда табличный документ 'SpreadsheetFieldTemlate' равен:
			| "VA - Filling empty analytics" | ''               | ''     | ''                | ''           | ''             | ''     | ''      | ''           |
			| ''                                | ''               | ''     | ''                | ''           | ''             | ''     | ''      | ''           |
			| ''                                | "January 2021" | ''     | "February 2021" | ''           | "March 2021" | ''     | "TOTAL" | ''           |
			| ''                                | "Amount"          | "Date" | "Amount"           | "Date"       | "Amount"        | "Date" | "Amount" | "Date"       |
			| "Source"                        | '1,000'          | ''     | '0'               | '2/1/2021' | '0'            | ''     | '1,000' | '2/1/2021' |
			| ' '                               | '1,000'          | ''     | '0'               | '2/1/2021' | '0'            | ''     | '1,000' | '2/1/2021' |
			| ' '                               | '1,000'          | ''     | '0'               | '2/1/2021' | '0'            | ''     | '1,000' | '2/1/2021' |
			| "SuccessorSameAnalytics"            | '1,000'          | ''     | '0'               | '2/1/2021' | '0'            | ''     | '1,000' | '2/1/2021' |
			| ' '                               | '1,000'          | ''     | '0'               | '2/1/2021' | '0'            | ''     | '1,000' | '2/1/2021' |
			| ' '                               | '1,000'          | ''     | '0'               | '2/1/2021' | '0'            | ''     | '1,000' | '2/1/2021' |
			| "SuccessorEmptyAnalytics"          | '1,000'          | ''     | '0'               | '2/1/2021' | '0'            | ''     | '1,000' | '2/1/2021' |
			| ' '                               | '1,000'          | ''     | '0'               | '2/1/2021' | '0'            | ''     | '1,000' | '2/1/2021' |
			| ' '                               | '1,000'          | ''     | '0'               | '2/1/2021' | '0'            | ''     | '1,000' | '2/1/2021' |
		
	* Закрываем без сохранения
		Когда открылось окно '$WindowTitle$'
		И Я закрываю окно '$WindowTitle$'
		Тогда открылось окно "1C:Enterprise"
		И я нажимаю на кнопку с именем 'Button1'
				
Сценарий: 12.04 Создаем экземпляр отчета без записи с заполнением аналитик

	И Я для регламента "VA - Main regulations" изменяю флаг 'ShouldInsertDimensionValuesByDefault'

	И Я создаю экземпляр отчета для вида отчета "VA - Filling empty analytics" сценарий "VA - Main scenario" период '1/1/2021' '3/31/2021' периодичность "Month" организация "Mercury LLC" проект '' аналитики '' '' '' '' '' ''

	* Заполняем значения показателей
		И Я добавляю значения с раскрытием показателей в ячейку 'R6C2'
			| 'Value1' |
			| '100'       |
		И Я добавляю значения с раскрытием показателей в ячейку 'R6C3'
			| 'Value1'  |
			| '1/1/2021' |
		И Я добавляю значения с раскрытием показателей в ячейку 'R6C4'
			| 'Value1' |
			| '200'       |
		И Я добавляю значения с раскрытием показателей в ячейку 'R6C5'
			| 'Value1'  |
			| '2/1/2021' |
		И Я добавляю значения с раскрытием показателей в ячейку 'R6C6'
			| 'Value1' |
			| '300'       |
		И Я добавляю значения с раскрытием показателей в ячейку 'R6C7'
			| 'Value1'  |
			| '3/1/2021' |

	* Сравниваем результат
		Тогда табличный документ 'SpreadsheetFieldTemlate' равен:
			| "VA - Filling empty analytics" | ''               | ''           | ''                | ''           | ''             | ''           | ''      | ''           |
			| ''                                | ''               | ''           | ''                | ''           | ''             | ''           | ''      | ''           |
			| ''                                | "January 2021" | ''           | "February 2021" | ''           | "March 2021" | ''           | "TOTAL" | ''           |
			| ''                                | "Amount"          | "Date"       | "Amount"           | "Date"       | "Amount"        | "Date"       | "Amount" | "Date"       |
			| "Source"                        | '100'            | '1/1/2021' | '200'             | '2/1/2021' | '300'          | '3/1/2021' | '600'   | '3/1/2021' |
			| "Software products "           | '100'            | '1/1/2021' | '200'             | '2/1/2021' | '300'          | '3/1/2021' | '600'   | '3/1/2021' |
			| ' '                               | '100'            | '1/1/2021' | '0'               | ''           | '0'            | ''           | '100'   | '1/1/2021' |
			| "5C:Corporate performance management "      | '0'              | ''           | '200'             | '2/1/2021' | '0'            | ''           | '200'   | '2/1/2021' |
			| "1C:ERP. Corporate performance management "   | '0'              | ''           | '0'               | ''           | '300'          | '3/1/2021' | '300'   | '3/1/2021' |
			| "SuccessorSameAnalytics"            | '100'            | '1/1/2021' | '200'             | '2/1/2021' | '300'          | '3/1/2021' | '600'   | '3/1/2021' |
			| "Software products "           | '100'            | '1/1/2021' | '200'             | '2/1/2021' | '300'          | '3/1/2021' | '600'   | '3/1/2021' |
			| ' '                               | '100'            | '1/1/2021' | '0'               | ''           | '0'            | ''           | '100'   | '1/1/2021' |
			| "5C:Corporate performance management "      | '0'              | ''           | '200'             | '2/1/2021' | '0'            | ''           | '200'   | '2/1/2021' |
			| "1C:ERP. Corporate performance management "   | '0'              | ''           | '0'               | ''           | '300'          | '3/1/2021' | '300'   | '3/1/2021' |
			| "SuccessorEmptyAnalytics"          | '100'            | '1/1/2021' | '200'             | '2/1/2021' | '300'          | '3/1/2021' | '600'   | '3/1/2021' |
			| "Software products "           | '100'            | '1/1/2021' | '200'             | '2/1/2021' | '300'          | '3/1/2021' | '600'   | '3/1/2021' |
			| ' '                               | '100'            | '1/1/2021' | '0'               | ''           | '0'            | ''           | '100'   | '1/1/2021' |
			| "5C:Corporate performance management "      | '0'              | ''           | '200'             | '2/1/2021' | '0'            | ''           | '200'   | '2/1/2021' |
			| "1C:ERP. Corporate performance management "   | '0'              | ''           | '0'               | ''           | '300'          | '3/1/2021' | '300'   | '3/1/2021' |
				
	* Закрываем без сохранения
		Когда открылось окно '$WindowTitle$'
		И Я закрываю окно '$WindowTitle$'
		Тогда открылось окно "1C:Enterprise"
		И я нажимаю на кнопку с именем 'Button1'

Сценарий: 12.05 Добавляем расчет для источника

	И Я открываю контруктор отчета с именем "VA - Filling empty analytics"

	* Добавляем формулу
		* Сумма
			Когда открылось окно "Edit tree"
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R2C2'
			И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
			И я нажимаю на кнопку с именем 'AddOperand1'
			Тогда открылось окно "Data sources"
			И я нажимаю на кнопку с именем 'FormCreate'
			Тогда открылось окно "Data source (create)"
			И из выпадающего списка с именем 'MethodOfObtaining' я выбираю точное значение "Arbitrary query to current infobase"	
			Когда открылось окно "Data source (create) *"
			И в поле с именем 'QueryTextForm' я ввожу текст 
				|'SELECT'|
				|' MONTH(TimeIntervals.StartDate) * 100 AS Value,'|
				|' TimeIntervals.StartDate AS StartDate'|
				|'FROM'|
				|' Catalog.TimeIntervals AS TimeIntervals'|
				|'WHERE'|
				|' TimeIntervals.Ref IN (&PeriodsОтчета)'|
			И я нажимаю на кнопку с именем 'EditQueryText'
			И я перехожу к закладке с именем 'ComplianceAnalyst'
			И я перехожу к закладке с именем 'FiltersPage'
			И в таблице 'TreeOfFilterParametersDB' я активизирую поле с именем 'ParameterCalculationMethod'
			И в таблице 'TreeOfFilterParametersDB' я выбираю текущую строку
			И в таблице 'TreeOfFilterParametersDB' из выпадающего списка с именем 'ParameterCalculationMethod' я выбираю точное значение "List of values (function in 1C:Enterprise script)"
			И в таблице 'TreeOfFilterParametersDB' я активизирую поле с именем 'DefiningMethodClarification'
			И в таблице 'TreeOfFilterParametersDB' я нажимаю кнопку выбора у реквизита с именем 'DefiningMethodClarification'
			Тогда открылось окно "VA - Filling empty analytics: Calculate a parameter value"
			И в поле с именем 'TextDocumentFieldProcedure' я ввожу текст 
				|'Result = ObjectOfARAP.ArrayOfPeriods; '|
			И я нажимаю на кнопку с именем 'FormWriteAndClose'
			Тогда открылось окно "1C:Enterprise"
			И я нажимаю на кнопку с именем 'Button0'
			Тогда открылось окно "Data source (create) *"
			И в таблице 'TreeOfFilterParametersDB' я завершаю редактирование строки
			И я нажимаю на кнопку с именем 'FormWriteAndClose'
			И я жду закрытия окна "Data source (create) *" в течение 20 секунд
			Тогда открылось окно "Data sources"
			И в таблице 'List' я выбираю текущую строку
			Тогда открылось окно "Edit tree *"
			И я нажимаю на кнопку с именем 'WriteAndCollapse'
		* Дата
			Когда открылось окно "Edit tree"
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R2C3'
			И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
			И я нажимаю на кнопку с именем 'AddOperand1'
			Тогда открылось окно "Data sources"
			И я нажимаю на кнопку с именем 'FormCreate'
			Тогда открылось окно "Data source (create)"
			И из выпадающего списка с именем 'MethodOfObtaining' я выбираю точное значение "Arbitrary query to current infobase"	
			Когда открылось окно "Data source (create) *"
			И в поле с именем 'QueryTextForm' я ввожу текст 
				|'SELECT'|
				|' TimeIntervals.StartDate AS StartDate'|
				|'FROM'|
				|' Catalog.TimeIntervals AS TimeIntervals'|
				|'WHERE'|
				|' TimeIntervals.Ref IN (&PeriodsОтчета)'|
			И я нажимаю на кнопку с именем 'EditQueryText'
			И я перехожу к закладке с именем 'ComplianceAnalyst'
			И я перехожу к закладке с именем 'FiltersPage'
			И в таблице 'TreeOfFilterParametersDB' я активизирую поле с именем 'ParameterCalculationMethod'
			И в таблице 'TreeOfFilterParametersDB' я выбираю текущую строку
			И в таблице 'TreeOfFilterParametersDB' из выпадающего списка с именем 'ParameterCalculationMethod' я выбираю точное значение "List of values (function in 1C:Enterprise script)"
			И в таблице 'TreeOfFilterParametersDB' я активизирую поле с именем 'DefiningMethodClarification'
			И в таблице 'TreeOfFilterParametersDB' я нажимаю кнопку выбора у реквизита с именем 'DefiningMethodClarification'
			Тогда открылось окно "VA - Filling empty analytics: Calculate a parameter value"
			И в поле с именем 'TextDocumentFieldProcedure' я ввожу текст 
				|'Result = ObjectOfARAP.ArrayOfPeriods; '|
			И я нажимаю на кнопку с именем 'FormWriteAndClose'
			Тогда открылось окно "1C:Enterprise"
			И я нажимаю на кнопку с именем 'Button0'
			Тогда открылось окно "Data source (create) *"
			И в таблице 'TreeOfFilterParametersDB' я завершаю редактирование строки
			И я нажимаю на кнопку с именем 'FormWriteAndClose'
			И я жду закрытия окна "Data source (create) *" в течение 20 секунд
			Тогда открылось окно "Data sources"
			И в таблице 'List' я выбираю текущую строку
			Тогда открылось окно "Edit tree *"
			И я нажимаю на кнопку с именем 'WriteAndCollapse'	
		
Сценарий: 12.06 Создаем экземпляр отчета с расчетом по правилам

	И Я создаю экземпляр отчета для вида отчета "VA - Filling empty analytics" сценарий "VA - Main scenario" период '1/1/2021' '3/31/2021' периодичность "Month" организация "Mercury LLC" проект '' аналитики '' '' '' '' '' ''
	
	* Рассчитаем и сравним результат
		И я нажимаю на кнопку с именем 'FormFillByDefault'
		Когда открылось окно '$WindowTitle$'
		Тогда табличный документ 'SpreadsheetFieldTemlate' равен:
			| "VA - Filling empty analytics" | ''               | ''           | ''                | ''           | ''             | ''           | ''      | ''           |
			| ''                                | ''               | ''           | ''                | ''           | ''             | ''           | ''      | ''           |
			| ''                                | "January 2021" | ''           | "February 2021" | ''           | "March 2021" | ''           | "TOTAL" | ''           |
			| ''                                | "Amount"          | "Date"       | "Amount"           | "Date"       | "Amount"        | "Date"       | "Amount" | "Date"       |
			| "Source"                        | '100'            | '1/1/2021' | '200'             | '2/1/2021' | '300'          | '3/1/2021' | '600'   | '3/1/2021' |
			| "Software products "           | '100'            | '1/1/2021' | '200'             | '2/1/2021' | '300'          | '3/1/2021' | '600'   | '3/1/2021' |
			| ' '                               | '100'            | '1/1/2021' | '0'               | ''           | '0'            | ''           | '100'   | '1/1/2021' |
			| "5C:Corporate performance management "      | '0'              | ''           | '200'             | '2/1/2021' | '0'            | ''           | '200'   | '2/1/2021' |
			| "1C:ERP. Corporate performance management "   | '0'              | ''           | '0'               | ''           | '300'          | '3/1/2021' | '300'   | '3/1/2021' |
			| "SuccessorSameAnalytics"            | '100'            | '1/1/2021' | '200'             | '2/1/2021' | '300'          | '3/1/2021' | '600'   | '3/1/2021' |
			| "Software products "           | '100'            | '1/1/2021' | '200'             | '2/1/2021' | '300'          | '3/1/2021' | '600'   | '3/1/2021' |
			| ' '                               | '100'            | '1/1/2021' | '0'               | ''           | '0'            | ''           | '100'   | '1/1/2021' |
			| "5C:Corporate performance management "      | '0'              | ''           | '200'             | '2/1/2021' | '0'            | ''           | '200'   | '2/1/2021' |
			| "1C:ERP. Corporate performance management "   | '0'              | ''           | '0'               | ''           | '300'          | '3/1/2021' | '300'   | '3/1/2021' |
			| "SuccessorEmptyAnalytics"          | '100'            | '1/1/2021' | '200'             | '2/1/2021' | '300'          | '3/1/2021' | '600'   | '3/1/2021' |
			| "Software products "           | '100'            | '1/1/2021' | '200'             | '2/1/2021' | '300'          | '3/1/2021' | '600'   | '3/1/2021' |
			| ' '                               | '100'            | '1/1/2021' | '0'               | ''           | '0'            | ''           | '100'   | '1/1/2021' |
			| "5C:Corporate performance management "      | '0'              | ''           | '200'             | '2/1/2021' | '0'            | ''           | '200'   | '2/1/2021' |
			| "1C:ERP. Corporate performance management "   | '0'              | ''           | '0'               | ''           | '300'          | '3/1/2021' | '300'   | '3/1/2021' |

	* Запишем документ
		Когда открылось окно '$WindowTitle$'
		И я нажимаю на кнопку с именем 'WriteAndClose'
		И я жду закрытия окна '$WindowTitle$' в течение 20 секунд

	* Откроем документ
		И Я открываю первый экземпляр отчета для вида отчета "VA - Filling empty analytics"

	* Сравним результат
		Тогда табличный документ 'SpreadsheetFieldTemlate' равен:
			| "VA - Filling empty analytics" | ''               | ''           | ''                | ''           | ''             | ''           | ''      | ''           |
			| ''                                | ''               | ''           | ''                | ''           | ''             | ''           | ''      | ''           |
			| ''                                | "January 2021" | ''           | "February 2021" | ''           | "March 2021" | ''           | "TOTAL" | ''           |
			| ''                                | "Amount"          | "Date"       | "Amount"           | "Date"       | "Amount"        | "Date"       | "Amount" | "Date"       |
			| "Source"                        | '100'            | '1/1/2021' | '200'             | '2/1/2021' | '300'          | '3/1/2021' | '600'   | '3/1/2021' |
			| "Software products "           | '100'            | '1/1/2021' | '200'             | '2/1/2021' | '300'          | '3/1/2021' | '600'   | '3/1/2021' |
			| ' '                               | '100'            | '1/1/2021' | '0'               | ''           | '0'            | ''           | '100'   | '1/1/2021' |
			| "5C:Corporate performance management "      | '0'              | ''           | '200'             | '2/1/2021' | '0'            | ''           | '200'   | '2/1/2021' |
			| "1C:ERP. Corporate performance management "   | '0'              | ''           | '0'               | ''           | '300'          | '3/1/2021' | '300'   | '3/1/2021' |
			| "SuccessorSameAnalytics"            | '100'            | '1/1/2021' | '200'             | '2/1/2021' | '300'          | '3/1/2021' | '600'   | '3/1/2021' |
			| "Software products "           | '100'            | '1/1/2021' | '200'             | '2/1/2021' | '300'          | '3/1/2021' | '600'   | '3/1/2021' |
			| ' '                               | '100'            | '1/1/2021' | '0'               | ''           | '0'            | ''           | '100'   | '1/1/2021' |
			| "5C:Corporate performance management "      | '0'              | ''           | '200'             | '2/1/2021' | '0'            | ''           | '200'   | '2/1/2021' |
			| "1C:ERP. Corporate performance management "   | '0'              | ''           | '0'               | ''           | '300'          | '3/1/2021' | '300'   | '3/1/2021' |
			| "SuccessorEmptyAnalytics"          | '100'            | '1/1/2021' | '200'             | '2/1/2021' | '300'          | '3/1/2021' | '600'   | '3/1/2021' |
			| "Software products "           | '100'            | '1/1/2021' | '200'             | '2/1/2021' | '300'          | '3/1/2021' | '600'   | '3/1/2021' |
			| ' '                               | '100'            | '1/1/2021' | '0'               | ''           | '0'            | ''           | '100'   | '1/1/2021' |
			| "5C:Corporate performance management "      | '0'              | ''           | '200'             | '2/1/2021' | '0'            | ''           | '200'   | '2/1/2021' |
			| "1C:ERP. Corporate performance management "   | '0'              | ''           | '0'               | ''           | '300'          | '3/1/2021' | '300'   | '3/1/2021' |
				
Сценарий: 12.06 Возвращаем регламент в прежнее состояние

	И Я для регламента "VA - Main regulations" изменяю флаг 'ShouldInsertDimensionValuesByDefault'
