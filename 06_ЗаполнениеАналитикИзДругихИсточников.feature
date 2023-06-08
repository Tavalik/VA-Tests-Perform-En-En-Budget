#language: ru

@tree

Функционал: 06. Проверка заполнения аналитик из других источников

Как Администратор я хочу
Проверить что коорректно отрабатывало заполнение аналитик из других источников
чтобы показатели отчетов рассчитывались без ошибок

Контекст: 

	И я подключаю TestClient "CPM - Budget" логин "Administrator" пароль ''	
	И я закрыл все окна клиентского приложения

Сценарий: 06.00 Определение типа приложения

	Пусть Инициализация переменных

Сценарий: 06.01 Создание группы отчетов "VA - Analysts from other sources (группа)"

	И Я создаю группу видов отчетов с именем "VA - Analysts from other sources (группа)" и родителем "VA - Report group"

Сценарий: 06.02 Создание вида отчета "VA - Data to add analytics"	

	И Я создаю вид отчета с именем "VA - Data to add analytics" и родителем "VA - Analysts from other sources (группа)"
	И Я открываю вид отчета с именем "VA - Data to add analytics"
	И я перехожу к закладке с именем 'DimensionsOfReport'
	И из выпадающего списка с именем 'DimensionKind1' я выбираю по строке "VA0ProCate"				
	И я нажимаю на кнопку с именем 'RecordButtonForm'
	Когда открылось окно "Data restructuring"
	И я нажимаю на кнопку с именем 'FormOK'		

	И я нажимаю на кнопку с именем 'EditTree'
	Когда открылось окно "Edit tree"
	И Я в конструкторе отчета добавляю строку с именем "Cash flow items"
	И Я в конструкторе отчета добавляю строку с именем "Goods"
	И Я в конструкторе отчета добавляю колонку с именем "Quantity"
	И Я в конструкторе отчета добавляю аналитику с кодом "VA0CFItems" в ячейку 'R2C3'
	И Я в конструкторе отчета добавляю аналитику с кодом "VA0Product" в ячейку 'R3C3'

	И Я Для вида отчета "VA - Data to add analytics" создаю бланк по умолчанию

Сценарий: 06.03 Создание экзмемпляра отчета "VA - Data to add analytics"

	И Я создаю экземпляр отчета для вида отчета "VA - Data to add analytics" сценарий "VA - Main scenario" период '1/1/2021' '3/31/2021' периодичность "Month" организация "Mercury LLC" проект '' аналитики "Software products" '' '' '' '' '' 
	И я запоминаю текущее окно как 'WindowTitle'

	* Документ должен быть пустой
		И табличный документ 'SpreadsheetFieldTemlate' равен:
			| "VA - Data to add analytics" | ''               | ''                | ''             | ''           |
			| ''                                    | ''               | ''                | ''             | ''           |
			| ''                                    | "January 2021" | "February 2021" | "March 2021" | "TOTAL"      |
			| ''                                    | "Quantity"     | "Quantity"      | "Quantity"   | "Quantity" |
			| "Cash flow items"                          | '0'              | '0'               | '0'            | '0'          |
			| "Goods"                              | '0'              | '0'               | '0'            | '0'          |

	* Вводим значения показателей
		* Товарные категории
			И Я добавляю значения с раскрытием показателей в ячейку 'R6C2'
				| "VA0CFItems"                       | 'Value1' |
				| "3Software sale" | '1.00000'   |
				| "2Software implementation"  | '2.00000'   |
			И Я ввожу значение '1.00000' в ячейку 'R7C3'
			И Я ввожу значение '2.00000' в ячейку 'R8C3'
		* Товары
			И Я добавляю значения с раскрытием показателей в ячейку 'R9C2'
				| "VA0Product"                                                     | 'Value1' |
				| "4C:Enterprise 8.3 CORP. Server License (x86-64)"           | '1.00000'   |
				| "3C:Enterprise 8 CORP. Client license for 100 users" | '3.00000'   |
				| "5C:Corporate performance management"                                      | '2.00000'   |
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R10C2:R12C2'
			И я нажимаю на кнопку с именем 'SpreadsheetFieldTemplateCopyDataOnRow'
			И я изменяю значение на '100.00000' процентов в ячейке 'R10C3:R12C3'
			И я изменяю значение на '200.00000' процентов в ячейке 'R10C4:R12C4'

	* Записываем и закрываем документ	
		Тогда открылось окно '$WindowTitle$'
		И я нажимаю на кнопку с именем 'WriteAndClose'
		И я жду закрытия окна '$WindowTitle$' в течение 20 секунд

Сценарий: 06.04 Создание вида отчета "VA - Analysts from fields of other sources"

	И Я создаю вид отчета с именем "VA - Analysts from fields of other sources" и родителем "VA - Analysts from other sources (группа)"
	И Я открываю вид отчета с именем "VA - Analysts from fields of other sources"
	И я перехожу к закладке с именем 'DimensionsOfReport'
	И из выпадающего списка с именем 'DimensionKind1' я выбираю по строке "VA0ProCate"				
	И я нажимаю на кнопку с именем 'RecordButtonForm'
	Когда открылось окно "Data restructuring"
	И я нажимаю на кнопку с именем 'FormOK'	

	И я нажимаю на кнопку с именем 'EditTree'
	Тогда открылось окно "Edit tree"
	И Я в конструкторе отчета добавляю строку с именем "Current formula"
	И Я в конструкторе отчета добавляю строку с именем "Other source"
	И Я в конструкторе отчета добавляю строку с именем "Analyst transformation"
	И Я в конструкторе отчета добавляю строку с именем "Calculated Source"
	И Я в конструкторе отчета добавляю строку с именем "Recalculation in code"
	И Я в конструкторе отчета добавляю колонку с именем "Quantity"
	И Я в конструкторе отчета добавляю аналитику с кодом "VA0Product" в ячейку 'R2C3'
	И Я в конструкторе отчета добавляю аналитику с кодом "VA0Product" в ячейку 'R3C3'
	И Я в конструкторе отчета добавляю аналитику с кодом "VA0CFItems" в ячейку 'R4C3'
	И Я в конструкторе отчета добавляю аналитику с кодом "VA0Product" в ячейку 'R4C4'
	И Я в конструкторе отчета добавляю аналитику с кодом "VA0CFItems" в ячейку 'R5C3'
	И Я в конструкторе отчета добавляю аналитику с кодом "VA0Product" в ячейку 'R5C4'
	И Я в конструкторе отчета добавляю аналитику с кодом "VA0CFItems" в ячейку 'R6C3'
	И Я в конструкторе отчета добавляю аналитику с кодом "VA0Product" в ячейку 'R6C4'

	* Устанавливаем формулы расчета
		Когда открылось окно "Edit tree*"
		И из выпадающего списка с именем 'WorkMode' я выбираю точное значение "Indicators calculation formulas"
		* Текущая формула
			* Основной источник
				И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R2C2'
				И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
				И я нажимаю на кнопку с именем 'RefToIndicator1'
				И Я выбираю показатель с кодом "Goods_Quantity" вида отчета "VA - Data to add analytics"
				Когда открылось окно "Edit tree*"
				И я нажимаю на кнопку с именем 'WriteAndCollapse'
				* Источник с доп. аналитиками
					Когда открылось окно "Edit tree"
					И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R2C2'
					И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
					И я нажимаю на кнопку с именем 'AddOperand1'
					Тогда открылось окно "Data sources"
					И я нажимаю на кнопку с именем 'FormCreate'
					Тогда открылось окно "Data source (create)"
					И из выпадающего списка с именем 'MethodOfObtaining' я выбираю точное значение "Arbitrary query to current infobase"
					И я изменяю флаг с именем 'UseMultiperiodContext'
					И в поле с именем 'QueryTextForm' я ввожу текст 'SELECT 2 AS VALUE'
					И я нажимаю на кнопку с именем 'EditQueryText'
					И я перехожу к закладке с именем 'ComplianceAnalyst'
					И в таблице 'ComplianceTable' из выпадающего списка с именем 'ComplianceTableFillingMethod' я выбираю точное значение "Another source field"
					И в таблице 'ComplianceTable' я активизирую поле с именем 'MapTableDBAlias'
					И в таблице 'ComplianceTable' я выбираю текущую строку
					Тогда открылось окно "Data sources"
					И в таблице 'List' я выбираю текущую строку
					Тогда открылось окно "Data source (create)*"
					И я нажимаю на кнопку с именем 'FormWriteAndClose'
					И я жду закрытия окна "Data source (create)*" в течение 20 секунд
				Тогда открылось окно "Data sources"
				И в таблице 'List' я выбираю текущую строку
				Тогда открылось окно "Edit tree*"
				И я нажимаю на кнопку с именем 'ButtonMultiply'
				И я нажимаю на кнопку с именем 'WriteAndCollapse'
		* Другой источник
			* Источник с прозвольным запросом №1
				Когда открылось окно "Edit tree"
				И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R3C2'
				И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
				И я нажимаю на кнопку с именем 'AddOperand1'
				Тогда открылось окно "Data sources"
				И я нажимаю на кнопку с именем 'FormCreate'
				Тогда открылось окно "Data source (create)"
				И из выпадающего списка с именем 'MethodOfObtaining' я выбираю точное значение "Arbitrary query to current infobase"
				И я изменяю флаг с именем 'UseMultiperiodContext'
				И в поле с именем 'QueryTextForm' я ввожу текст 'SELECT 2 AS VALUE'
				И я нажимаю на кнопку с именем 'EditQueryText'
				И я перехожу к закладке с именем 'ComplianceAnalyst'
				И в таблице 'ComplianceTable' из выпадающего списка с именем 'ComplianceTableFillingMethod' я выбираю точное значение "Another source field"
				И в таблице 'ComplianceTable' я активизирую поле с именем 'MapTableDBAlias'
				И в таблице 'ComplianceTable' я выбираю текущую строку
				* Источник для дополнения аналитик
					Тогда открылось окно "Data sources"
					И я нажимаю на кнопку с именем 'FormCreate'
					Тогда открылось окно "Data source (create)"
					И из выпадающего списка с именем 'ReportTypeFilter' я выбираю по строке "VA - Data to add analytics"
					И я нажимаю кнопку выбора у поля с именем 'IndicatorFilter'
					И Я выбираю показатель с кодом "Goods_Quantity"
					Тогда открылось окно "Data source (create)*"
					И я нажимаю на кнопку с именем 'FormWriteAndClose'
				Тогда открылось окно "Data sources"
				И в таблице 'List' я выбираю текущую строку
				Тогда открылось окно "Data source (create)*"
				И я нажимаю на кнопку с именем 'FormWriteAndClose'
				И я жду закрытия окна "Data source (create)*" в течение 20 секунд
				Тогда открылось окно "Data sources"
				И в таблице 'List' я выбираю текущую строку
				Тогда открылось окно "Edit tree*"
				И я нажимаю на кнопку с именем 'ButtonPlus'
			* Источник с прозвольным запросом №1
				Когда открылось окно "Edit tree*"
				И я нажимаю на кнопку с именем 'AddOperand1'
				Тогда открылось окно "Data sources"
				И я нажимаю на кнопку с именем 'FormCreate'
				Тогда открылось окно "Data source (create)"
				И из выпадающего списка с именем 'MethodOfObtaining' я выбираю точное значение "Arbitrary query to current infobase"
				И я изменяю флаг с именем 'UseMultiperiodContext'
				И в поле с именем 'QueryTextForm' я ввожу текст 'SELECT 3 AS VALUE'
				И я нажимаю на кнопку с именем 'EditQueryText'
				И я перехожу к закладке с именем 'ComplianceAnalyst'
				И в таблице 'ComplianceTable' я активизирую поле с именем 'ComplianceTableFillingMethod'
				И в таблице 'ComplianceTable' я выбираю текущую строку
				И в таблице 'ComplianceTable' из выпадающего списка с именем 'ComplianceTableFillingMethod' я выбираю точное значение "Another source field"
				И в таблице 'ComplianceTable' я завершаю редактирование строки
				И в таблице 'ComplianceTable' я активизирую поле с именем 'MapTableDBAlias'
				И в таблице 'ComplianceTable' я выбираю текущую строку
				Когда открылось окно "Data sources"
				И в таблице 'List' я перехожу к строке:
					| "Description"                                          | "Receipt method"                                 | "Indicator filter"  |
					| "VA - Data to add analytics_Goods quantity" | "Current infobase report indicator (easy setup)" | "Goods quantity" |
				И в таблице 'List' я выбираю текущую строку				
				Тогда открылось окно "Data source (create)*"
				И я нажимаю на кнопку с именем 'FormWriteAndClose'
				И я жду закрытия окна "Data source (create)*" в течение 20 секунд
				Тогда открылось окно "Data sources"
				И в таблице 'List' я выбираю текущую строку
				Тогда открылось окно "Edit tree*"
				И я нажимаю на кнопку с именем 'WriteAndCollapse'
		* Трансформация аналитик
			* Источник данных для трансформации
				Когда открылось окно "Edit tree"
				И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R4C2'
				И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
				И я нажимаю на кнопку с именем 'AddOperand1'
				Тогда открылось окно "Data sources"
				И я нажимаю на кнопку с именем 'FormCreate'
				Тогда открылось окно "Data source (create)"
				И из выпадающего списка с именем 'ReportTypeFilter' я выбираю по строке "VA - Data to add analytics"
				И я нажимаю кнопку выбора у поля с именем 'IndicatorFilter'
				И Я выбираю показатель с кодом "Goods_Quantity"
				Тогда открылось окно "Data source (create) *"
				И в таблице 'ComplianceTable' я выбираю текущую строку
				И в таблице 'ComplianceTable' из выпадающего списка с именем 'ComplianceTableFillingMethod' я выбираю точное значение "Fixed value"
				И в таблице 'ComplianceTable' я завершаю редактирование строки
				И в таблице 'ComplianceTable' я активизирую поле с именем 'MapTableDBAlias'
				И в таблице 'ComplianceTable' я выбираю текущую строку
				Тогда открылось окно "Cash flow items"
				И я нажимаю на кнопку с именем 'FormFind'
				Тогда открылась форма с именем 'UniversalListFindExtForm'
				И из выпадающего списка с именем 'FieldSelector' я выбираю точное значение "Description"
				И в поле с именем 'Pattern' я ввожу текст "1Software upgrade"
				И я меняю значение переключателя с именем 'CompareType' на "Exact match"
				И я нажимаю на кнопку с именем 'Find'
				Тогда открылось окно "Cash flow items"
				И в таблице 'List' я выбираю текущую строку
				Тогда открылось окно "Data source (create) *"
				И я нажимаю на кнопку с именем 'FormWriteAndClose'
				И я жду закрытия окна "Data source (create) *" в течение 20 секунд
				Тогда открылось окно "Data sources"
				И в таблице 'List' я выбираю текущую строку
				Тогда открылось окно "Edit tree *"
				И я нажимаю на кнопку с именем 'WriteAndCollapse'											
		* Рассчитываемый источник
			* Произвольный запрос к БД с многопериодным контекстом
				Когда открылось окно "Edit tree"
				И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R5C2'
				И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
				И я нажимаю на кнопку с именем 'AddOperand1'
				Тогда открылось окно "Data sources"
				И я нажимаю на кнопку с именем 'FormCreate'
				Тогда открылось окно "Data source (create)"
				И из выпадающего списка с именем 'MethodOfObtaining' я выбираю точное значение "Arbitrary query to current infobase"
				И в поле с именем 'QueryTextForm' я ввожу текст 
					|'SELECT'|
					|' TimeIntervals.StartDate AS Date,'|
					|' MONTH(TimeIntervals.EndDate) AS Value'|
					|'FROM'|
					|' Catalog.TimeIntervals AS TimeIntervals'|
					|'WHERE'|
					|' TimeIntervals.Ref IN (&Periods)'|
				И я нажимаю на кнопку с именем 'EditQueryText'
				И я перехожу к закладке с именем 'ComplianceAnalyst'
				И в таблице 'ComplianceTable' я выбираю текущую строку
				И в таблице 'ComplianceTable' из выпадающего списка с именем 'ComplianceTableFillingMethod' я выбираю точное значение "Another source field"
				И в таблице 'ComplianceTable' я завершаю редактирование строки
				И в таблице 'ComplianceTable' я активизирую поле с именем 'MapTableDBAlias'
				И в таблице 'ComplianceTable' я выбираю текущую строку
				* Источник для заполнения Анилитики2
					Тогда открылось окно "Data sources"
					И я нажимаю на кнопку с именем 'FormCreate'
					Тогда открылось окно "Data source (create)"
					И из выпадающего списка с именем 'ReportTypeFilter' я выбираю по строке "VA - Data to add analytics"
					И я нажимаю кнопку выбора у поля с именем 'IndicatorFilter'
					И Я выбираю показатель с кодом "CashFlowItems_Quantity"
					Тогда открылось окно "Data source (create)*"
					И я нажимаю на кнопку с именем 'FormWriteAndClose'
					Тогда открылось окно "Data sources"
					И в таблице 'List' я выбираю текущую строку
				Тогда открылось окно "Data source (create) *"
				И в таблице 'ComplianceTable' я перехожу к строке:
					| "Destination dimension"       | "Dimension kind" |
					| "Dimension 3: Product range" | "Product range"  |
				И в таблице 'ComplianceTable' из выпадающего списка с именем 'ComplianceTableFillingMethod' я выбираю точное значение "Another source field"
				И в таблице 'ComplianceTable' я завершаю редактирование строки
				И в таблице 'ComplianceTable' я активизирую поле с именем 'MapTableDBAlias'
				И в таблице 'ComplianceTable' я выбираю текущую строку
				* Источник для заполненния Анилитики3
					Тогда открылось окно "Data sources"
					И я нажимаю на кнопку с именем 'FormCreate'
					Тогда открылось окно "Data source (create)"
					И из выпадающего списка с именем 'ReportTypeFilter' я выбираю по строке "VA - Analysts from fields of other sources"
					И я нажимаю кнопку выбора у поля с именем 'IndicatorFilter'
					И Я выбираю показатель с кодом "AnalystTransformatio_Quantity"
					Тогда открылось окно "Data source (create)*"
					И я нажимаю на кнопку с именем 'FormWriteAndClose'
					Тогда открылось окно "Data sources"
					И в таблице 'List' я выбираю текущую строку
				Тогда открылось окно "Data source (create)*"
				И я нажимаю на кнопку с именем 'FormWriteAndClose'
				И я жду закрытия окна "Data source (create)*" в течение 20 секунд
				Тогда открылось окно "Data sources"
				И в таблице 'List' я выбираю текущую строку
				Тогда открылось окно "Edit tree*"
				И я нажимаю на кнопку с именем 'WriteAndCollapse'
		* Пересчет в коде
			* Основной источник
				Когда открылось окно "Edit tree"
				И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R6C2'
				И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
				И я нажимаю на кнопку с именем 'AddOperand1'
				Тогда открылось окно "Data sources"
				И я нажимаю на кнопку с именем 'FormCreate'
				Тогда открылось окно "Data source (create)"
				И из выпадающего списка с именем 'MethodOfObtaining' я выбираю точное значение "Current infobase information register"
				И из выпадающего списка с именем 'DBInformationRegister' я выбираю по строке 'ItemsPrices'
				И из выпадающего списка с именем 'SliceType' я выбираю точное значение "Slice of the last ones"
				И в таблице 'ComplianceTable' из выпадающего списка с именем 'ComplianceTableFillingMethod' я выбираю точное значение "Another source field"
				И в таблице 'ComplianceTable' я завершаю редактирование строки
				И в таблице 'ComplianceTable' я активизирую поле с именем 'MapTableDBAlias'
				И в таблице 'ComplianceTable' я выбираю текущую строку
				* Источник с доп. аналитиками - Статьи ДДС 
					Тогда открылось окно "Data sources"
					И я нажимаю на кнопку с именем 'FormCreate'
					Тогда открылось окно "Data source (create)"
					И из выпадающего списка с именем 'ReportTypeFilter' я выбираю по строке "VA - Analysts from fields of other sources"
					И я нажимаю кнопку выбора у поля с именем 'IndicatorFilter'
					И Я выбираю показатель с кодом "AnalystTransformatio_Quantity"
					Тогда открылось окно "Data source (create) *"
					И я нажимаю на кнопку с именем 'FormWriteAndClose'
					Тогда открылось окно "Data sources"
					И в таблице 'List' я выбираю текущую строку
				Тогда открылось окно "Data source (create)*"
				И в таблице 'ComplianceTable' я перехожу к строке:
					| "Destination dimension"       | "Dimension kind" | "Column name"    | "Filling method" |
					| "Dimension 3: Product range" | "Product range"  | "[Product range]" | "Source field"    |
				И в таблице 'ComplianceTable' из выпадающего списка с именем 'ComplianceTableFillingMethod' я выбираю точное значение "Another source field"
				И в таблице 'ComplianceTable' я завершаю редактирование строки
				И в таблице 'ComplianceTable' я активизирую поле с именем 'MapTableDBAlias'
				И в таблице 'ComplianceTable' я выбираю текущую строку
				* Источник с доп. аналитиками - Товары 
					Тогда открылось окно "Data sources"
					И я нажимаю на кнопку с именем 'FormCreate'
					Тогда открылось окно "Data source (create)"
					И из выпадающего списка с именем 'ReportTypeFilter' я выбираю по строке "VA - Analysts from fields of other sources"
					И я нажимаю кнопку выбора у поля с именем 'IndicatorFilter'
					И Я выбираю показатель с кодом "CurrentFormula_Quantity"
					Тогда открылось окно "Data source (create) *"
					И я нажимаю на кнопку с именем 'FormWriteAndClose'
					Тогда открылось окно "Data sources"
					И в таблице 'List' я выбираю текущую строку
				* Устанавливаем отборы
					Тогда открылось окно "Data source (create)*"
					И я перехожу к закладке с именем 'FiltersPage'
					И в таблице 'FieldsTreeDB' я разворачиваю текущую строку
					И в таблице 'FieldsTreeDB' я перехожу к строке:
						| "Field"         |
						| "Product range" |
					И я нажимаю на кнопку с именем 'AddConditionItem'
					И в таблице 'TreeOfFilterParametersDB' я перехожу к строке:
						| "Field"           |
						| "[Product range]" |
					И в таблице 'TreeOfFilterParametersDB' из выпадающего списка с именем 'ParameterCalculationMethod' я выбираю точное значение "Fixed value"
					И в таблице 'TreeOfFilterParametersDB' из выпадающего списка с именем 'DefiningMethodClarification' я выбираю по строке "5C:Corporate performance management"
					И в таблице 'TreeOfFilterParametersDB' я завершаю редактирование строки
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
					И в таблице 'TreeOfFilterParametersDB' из выпадающего списка с именем 'ParameterCalculationMethod' я выбираю точное значение "Fixed value"
					И в таблице 'TreeOfFilterParametersDB' из выпадающего списка с именем 'DefiningMethodClarification' я выбираю по строке "VA - Products"
					И в таблице 'TreeOfFilterParametersDB' я завершаю редактирование строки
				И я нажимаю на кнопку с именем 'FormWriteAndClose'
				И я жду закрытия окна "Data source (create)*" в течение 20 секунд
				Тогда открылось окно "Data sources"
				И в таблице 'List' я выбираю текущую строку
			* Вводим формулу расчета
				Когда открылось окно "Edit tree*"
				И я нажимаю на кнопку с именем 'ArbitraryCode'
				И в поле с именем 'TextDocumentFieldProcedure' я ввожу текст ' '
				Если '$$LanguageИнтерфейса$$ = "Ru"' Тогда					
					Если '$$ЭтоPerform$$' Тогда
						И в поле с именем 'TextDocumentFieldProcedure' я ввожу текст 'Result = Max([IR_ЦеныНомен_Price_], 1500000)'
					Иначе
						И в поле с именем 'TextDocumentFieldProcedure' я ввожу текст 'Result = Max([BA_ЦеныНомен_Price_], 1500000)'
				Иначе
					И в поле с именем 'TextDocumentFieldProcedure' я ввожу текст 'Result = Max([InformationRegister_ProRanPri_Price_], 1500000)' 
				И я нажимаю на кнопку с именем 'WriteAndCollapse'
	
	И Я Для вида отчета "VA - Analysts from fields of other sources" создаю бланк по умолчанию
	И Я Для вида отчета "VA - Analysts from fields of other sources" в бланке для группы раскрытия с адресом 'R8C1' задаю сортировку "Product range" "Product ID"
	И Я Для вида отчета "VA - Analysts from fields of other sources" в бланке для группы раскрытия с адресом 'R10C1' задаю сортировку "Product range" "Product ID"
	И Я Для вида отчета "VA - Analysts from fields of other sources" в бланке для группы раскрытия с адресом 'R13C1' меняю сортировку "Product range" "Description" на сортировку "Product range" "Product ID"
	И Я Для вида отчета "VA - Analysts from fields of other sources" в бланке для группы раскрытия с адресом 'R16C1' меняю сортировку "Product range" "Description" на сортировку "Product range" "Product ID"
	И Я Для вида отчета "VA - Analysts from fields of other sources" в бланке для группы раскрытия с адресом 'R19C1' меняю сортировку "Product range" "Description" на сортировку "Product range" "Product ID"

Сценарий: 06.05 Создание экзмемпляра отчета "VA - Analysts from fields of other sources"

	И Я создаю экземпляр отчета для вида отчета "VA - Analysts from fields of other sources" сценарий "VA - Main scenario" период '1/1/2021' '3/31/2021' периодичность "Month" организация "Mercury LLC" проект '' аналитики "Software products" '' '' '' '' ''
	И я запоминаю текущее окно как 'WindowTitle' 

	* Документ должен быть пустой
		И табличный документ 'SpreadsheetFieldTemlate' равен:
			| "VA - Analysts from fields of other sources" | ''               | ''                | ''             | ''           |
			| ''                                          | ''               | ''                | ''             | ''           |
			| ''                                          | "January 2021" | "February 2021" | "March 2021" | "TOTAL"      |
			| ''                                          | "Quantity"     | "Quantity"      | "Quantity"   | "Quantity" |
			| "Current formula"                           | '0'              | '0'               | '0'            | '0'          |
			| "Other source"                           | '0'              | '0'               | '0'            | '0'          |
			| "Analyst transformation"                    | '0'              | '0'               | '0'            | '0'          |
			| "Calculated Source"                   | '0'              | '0'               | '0'            | '0'          |
			| "Recalculation in code"                           | '0'              | '0'               | '0'            | '0'          |

	* Выполняем расчет
		И я нажимаю на кнопку с именем 'FormFillByDefault'

	* Сравниваем результат
		Тогда открылось окно '$WindowTitle$'	
		Тогда табличный документ 'SpreadsheetFieldTemlate' равен:
			| "VA - Analysts from fields of other sources"                       | ''               | ''                | ''             | ''           |
			| ''                                                                | ''               | ''                | ''             | ''           |
			| ''                                                                | "January 2021" | "February 2021" | "March 2021" | "TOTAL"      |
			| ''                                                                | "Quantity"     | "Quantity"      | "Quantity"   | "Quantity" |
			| "Current formula"                                                 | '12'             | '24'              | '36'           | '72'         |
			| "5C:Corporate performance management "                                      | '4'              | '8'               | '12'           | '24'         |
			| "4C:Enterprise 8.3 CORP. Server License (x86-64) "           | '2'              | '4'               | '6'            | '12'         |
			| "3C:Enterprise 8 CORP. Client license for 100 users " | '6'              | '12'              | '18'           | '36'         |
			| "Other source"                                                 | '15'             | '15'              | '15'           | '45'         |
			| "5C:Corporate performance management "                                      | '5'              | '5'               | '5'            | '15'         |
			| "4C:Enterprise 8.3 CORP. Server License (x86-64) "           | '5'              | '5'               | '5'            | '15'         |
			| "3C:Enterprise 8 CORP. Client license for 100 users " | '5'              | '5'               | '5'            | '15'         |
			| "Analyst transformation"                                          | '6'              | '12'              | '18'           | '36'         |
			| "1Software upgrade "                                  | '6'              | '12'              | '18'           | '36'         |
			| "5C:Corporate performance management "                                      | '2'              | '4'               | '6'            | '12'         |
			| "4C:Enterprise 8.3 CORP. Server License (x86-64) "           | '1'              | '2'               | '3'            | '6'          |
			| "3C:Enterprise 8 CORP. Client license for 100 users " | '3'              | '6'               | '9'            | '18'         |
			| "Calculated Source"                                         | '6'              | '12'              | '9'            | '27'         |
			| ' '                                                               | '0'              | '0'               | '9'            | '9'          |
			| "5C:Corporate performance management "                                      | '0'              | '0'               | '3'            | '3'          |
			| "4C:Enterprise 8.3 CORP. Server License (x86-64) "           | '0'              | '0'               | '3'            | '3'          |
			| "3C:Enterprise 8 CORP. Client license for 100 users " | '0'              | '0'               | '3'            | '3'          |
			| "2Software implementation "                                | '3'              | '6'               | '0'            | '9'          |
			| "5C:Corporate performance management "                                      | '1'              | '2'               | '0'            | '3'          |
			| "4C:Enterprise 8.3 CORP. Server License (x86-64) "           | '1'              | '2'               | '0'            | '3'          |
			| "3C:Enterprise 8 CORP. Client license for 100 users " | '1'              | '2'               | '0'            | '3'          |
			| "3Software sale "                               | '3'              | '6'               | '0'            | '9'          |
			| "5C:Corporate performance management "                                      | '1'              | '2'               | '0'            | '3'          |
			| "4C:Enterprise 8.3 CORP. Server License (x86-64) "           | '1'              | '2'               | '0'            | '3'          |
			| "3C:Enterprise 8 CORP. Client license for 100 users " | '1'              | '2'               | '0'            | '3'          |
			| "Recalculation in code"                                                 | '4,500,000'      | '4,500,000'       | '4,661,400'    | '13,661,400' |
			| "1Software upgrade "                                  | '4,500,000'      | '4,500,000'       | '4,661,400'    | '13,661,400' |
			| "5C:Corporate performance management "                                      | '1,500,000'      | '1,500,000'       | '1,553,800'    | '4,553,800'  |
			| "4C:Enterprise 8.3 CORP. Server License (x86-64) "           | '1,500,000'      | '1,500,000'       | '1,553,800'    | '4,553,800'  |
			| "3C:Enterprise 8 CORP. Client license for 100 users " | '1,500,000'      | '1,500,000'       | '1,553,800'    | '4,553,800'  |
			
	* Записываем и закрываем документ
		Тогда открылось окно '$WindowTitle$'
		И я нажимаю на кнопку с именем 'WriteAndClose'
		И я жду закрытия окна '$WindowTitle$' в течение 20 секунд

Сценарий: 06.06 Проверка на рекурсивное вложение дополнения аналитик

	И Я открываю контруктор отчета с именем "VA - Analysts from fields of other sources"
	И Я в конструкторе отчета добавляю строку с именем 'Recursion в аналитиках'
	И Я в конструкторе отчета добавляю аналитику с кодом "VA0Product" в ячейку 'R7C3'

	* Вводим источники данных	
		Тогда открылось окно "Edit tree"
		И из выпадающего списка с именем 'WorkMode' я выбираю точное значение "Indicators calculation formulas"
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R7C2'
		И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
		И я нажимаю на кнопку с именем 'AddOperand1'
		Тогда открылось окно "Data sources"
		И я нажимаю на кнопку с именем 'FormCreate'
		Тогда открылось окно "Data source (create)"
		И из выпадающего списка с именем 'ReportTypeFilter' я выбираю по строке "VA - Analysts from fields of other sources"
		И я нажимаю кнопку выбора у поля с именем 'IndicatorFilter'
		И Я выбираю показатель с кодом "CurrentFormula_Quantity"
		Тогда открылось окно "Data source (create)*"
		И в таблице 'ComplianceTable' я выбираю текущую строку
		И в таблице 'ComplianceTable' из выпадающего списка с именем 'ComplianceTableFillingMethod' я выбираю точное значение "Another source field"
		И в таблице 'ComplianceTable' я завершаю редактирование строки
		И в таблице 'ComplianceTable' я активизирую поле с именем 'MapTableDBAlias'
		И в таблице 'ComplianceTable' я выбираю текущую строку
		* Источник данных для дополнения аналитик №1
			Тогда открылось окно "Data sources"
			И я нажимаю на кнопку с именем 'FormCreate'
			Тогда открылось окно "Data source (create)"
			И из выпадающего списка с именем 'ReportTypeFilter' я выбираю по строке "VA - Data to add analytics"
			И я нажимаю кнопку выбора у поля с именем 'IndicatorFilter'
			И Я выбираю показатель с кодом "Goods_Quantity"
			Тогда открылось окно "Data source (create) *"
			И в таблице 'ComplianceTable' я выбираю текущую строку
			И в таблице 'ComplianceTable' из выпадающего списка с именем 'ComplianceTableFillingMethod' я выбираю точное значение "Another source field"
			И в таблице 'ComplianceTable' я завершаю редактирование строки
			И в таблице 'ComplianceTable' я активизирую поле с именем 'MapTableDBAlias'
			И в таблице 'ComplianceTable' я выбираю текущую строку
			* Источник данных для дополнения аналитик №2
				Тогда открылось окно "Data sources"
				И я нажимаю на кнопку с именем 'FormCreate'
				Тогда открылось окно "Data source (create)"
				И из выпадающего списка с именем 'ReportTypeFilter' я выбираю по строке "VA - Data to add analytics"
				И я нажимаю кнопку выбора у поля с именем 'IndicatorFilter'
				И Я выбираю показатель с кодом "Goods_Quantity"
				Тогда открылось окно "Data source (create)*"
				И я нажимаю на кнопку с именем 'FormWriteAndClose'
			Тогда открылось окно "Data sources"
			И в таблице 'List' я выбираю текущую строку
			Тогда открылось окно "Data source (create)*"
			И я нажимаю на кнопку с именем 'FormWriteAndClose'
		Тогда открылось окно "Data sources"
		И в таблице 'List' я выбираю текущую строку
		Тогда открылось окно "Data source (create)*"
		И я нажимаю на кнопку с именем 'FormWriteAndClose'
		* Получаем сообщение об ошибке
			Тогда открылось окно "1C:Enterprise"
			И я нажимаю на кнопку с именем 'OK'
			Затем я жду, что в сообщениях пользователю будет подстрока "Data source used to add data to dimensions cannot contain dimension filling method \"Another source field\"." в течение 30 секунд

	* Закрываем все окна
		Когда открылось окно "Data source (create)*"
		И Я закрываю окно "Data source (create)*"
		Тогда открылось окно "1C:Enterprise"
		И я нажимаю на кнопку с именем 'Button1'
		Тогда открылось окно "Data sources"
		И Я закрываю окно "Data sources"
		Тогда открылось окно "Edit tree"
		И я нажимаю на кнопку с именем 'UndoFormulaEdit'
	
