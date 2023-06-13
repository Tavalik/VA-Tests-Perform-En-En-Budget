#language: ru

@tree

Функционал: 08. Расчет показателей нарастающим итогом

Как Администратор я хочу
Проверить различные способы расчета показателей нарастающим итогом 

Контекст: 

	И я подключаю TestClient "CPM - Budget" логин "Administrator" пароль ''
	И я закрыл все окна клиентского приложения

Сценарий: 08.00 Определение типа приложения

	Пусть Инициализация переменных

Сценарий: 08.01 Создание группы отчетов "VA - Cumulative total (group)"

	И Я создаю группу видов отчетов с именем "VA - Cumulative total (group)" и родителем "VA - Report group"

Сценарий: 08.02 Создание вида отчета "VA - Cumulative total (source)"

	И Я создаю вид отчета с именем "VA - Cumulative total (source)" и родителем "VA - Cumulative total (group)"

	И Я открываю вид отчета с именем "VA - Cumulative total (source)"
	И я устанавливаю флаг с именем 'ProjectSeparation'		
	И я перехожу к закладке с именем 'DimensionsOfReport'
	И из выпадающего списка с именем 'DimensionKind1' я выбираю по строке "VA0CFItems"				
	И я нажимаю на кнопку с именем 'RecordButtonForm'
	Когда открылось окно "Data restructuring"
	И я нажимаю на кнопку с именем 'FormOK'

	И я нажимаю на кнопку с именем 'EditTree'
	Когда открылось окно "Edit tree"
	И Я в конструкторе отчета добавляю строку с именем "Goods"	
	И Я в конструкторе отчета добавляю колонку с именем "Quantity"		
	И Я в конструкторе отчета добавляю аналитику с кодом "VA0Product" в ячейку 'R2C3'
		
	И Я Для вида отчета "VA - Cumulative total (source)" создаю бланк по умолчанию
	И Я Для вида отчета "VA - Cumulative total (source)" в бланке для группы раскрытия с адресом 'R8C1' задаю сортировку "Product range" "Product ID"

Сценарий: 08.03 Создание экземпляра отчета - "VA - Cumulative total (source)" 

	И Я создаю экземпляр отчета для вида отчета "VA - Cumulative total (source)" сценарий "VA - Main scenario" период '1/1/2021' '3/31/2021' периодичность "Month" организация "Mercury LLC" проект "VA - Main project" аналитики "3Software sale" '' '' '' '' '' 

	* Документ должен быть пустой
		Тогда табличный документ 'SpreadsheetFieldTemlate' равен:
			| "VA - Cumulative total (source)" | ''               | ''                | ''             | ''           |
			| ''                                 | ''               | ''                | ''             | ''           |
			| ''                                 | "January 2021" | "February 2021" | "March 2021" | "TOTAL"      |
			| ''                                 | "Quantity"     | "Quantity"      | "Quantity"   | "Quantity" |
			| "Goods"                           | '0'              | '0'               | '0'            | '0'          |

	* Вводим значения показателей
		Когда открылось окно '$WindowTitle$'		
		И Я добавляю значения с раскрытием показателей в ячейку 'R6C2'
				| "VA0Product"                                                     | 'Value1' |
				| "4C:Enterprise 8.3 CORP. Server License (x86-64)"           | '10.00000'  |
				| "3C:Enterprise 8 CORP. Client license for 100 users" | '10.00000'  |
				| "5C:Corporate performance management"                                      | '10.00000'  |
				| "2C:Corporation"                                                  | '10.00000'  |
				| "1C:ERP. Corporate performance management"                                   | '10.00000'  |

	* Копируем значения показателей
		Когда открылось окно '$WindowTitle$'
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R6C2:R11C2'
		И я нажимаю на кнопку с именем 'CopyToClipboard'
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R6C3:R11C3'
		И Я вставляю из буфера обмена в макете
		И Я изменяю значение на '100.00000' процентов в ячейке 'R6C3:R11C3'
		Когда открылось окно '$WindowTitle$'
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R6C3:R11C3'
		И я нажимаю на кнопку с именем 'SpreadsheetFieldTemplateCopyDataOnRow'
		И Я изменяю значение на '10.00000' в ячейке 'R7C4:R11C4'

	* Сравниваем итоговый документ
		Тогда табличный документ 'SpreadsheetFieldTemlate' равен:
			| "VA - Cumulative total (source)"                                | ''               | ''                | ''             | ''           |
			| ''                                                                | ''               | ''                | ''             | ''           |
			| ''                                                                | "January 2021" | "February 2021" | "March 2021" | "TOTAL"      |
			| ''                                                                | "Quantity"     | "Quantity"      | "Quantity"   | "Quantity" |
			| "Goods"                                                          | '50'             | '100'             | '150'          | '300'        |
			| "5C:Corporate performance management "                                      | '10'             | '20'              | '30'           | '60'         |
			| "2C:Corporation "                                                  | '10'             | '20'              | '30'           | '60'         |
			| "4C:Enterprise 8.3 CORP. Server License (x86-64) "           | '10'             | '20'              | '30'           | '60'         |
			| "1C:ERP. Corporate performance management "                                   | '10'             | '20'              | '30'           | '60'         |
			| "3C:Enterprise 8 CORP. Client license for 100 users " | '10'             | '20'              | '30'           | '60'         |

	* Записываем документ	
		Когда открылось окно '$WindowTitle$'
		И я нажимаю на кнопку с именем 'WriteAndClose'
		И я жду закрытия окна '$WindowTitle$' в течение 20 секунд			

Сценарий: 08.04 Создание вида отчета "VA - Cumulative total (recipient)"

	И Я создаю вид отчета с именем "VA - Cumulative total (recipient)" и родителем "VA - Cumulative total (group)"

	И Я открываю вид отчета с именем "VA - Cumulative total (recipient)"
	И я устанавливаю флаг с именем 'ProjectSeparation'		
	И я перехожу к закладке с именем 'DimensionsOfReport'
	И из выпадающего списка с именем 'DimensionKind1' я выбираю по строке "VA0CFItems"				
	И я нажимаю на кнопку с именем 'RecordButtonForm'
	Когда открылось окно "Data restructuring"
	И я нажимаю на кнопку с именем 'FormOK'

	И я нажимаю на кнопку с именем 'EditTree'
	Когда открылось окно "Edit tree"
	
	И Я в конструкторе отчета добавляю строку с именем "SourceData"	
	И Я в конструкторе отчета добавляю строку с именем "FromSourceBeforeCalculation"
	И Я в конструкторе отчета добавляю строку с именем "FromSourceBeforeCalculationX2"
	И Я в конструкторе отчета добавляю строку с именем "FromSourceAfterCalculation"
	И Я в конструкторе отчета добавляю строку с именем "FromSourceSelectionByPeriod"
	И Я в конструкторе отчета добавляю строку с именем "FromReceiverSelectionByPeriod"
	И Я в конструкторе отчета добавляю строку с именем "FromReceiverShiftPeriod"
	И Я в конструкторе отчета добавляю строку с именем "FromSourceArbitraryCode"
		
	И Я в конструкторе отчета добавляю колонку с именем "Quantity"		
	
	И Я в конструкторе отчета добавляю аналитику с кодом "VA0Product" в ячейку 'R2C3'
	Когда открылось окно "Edit tree"
	И я нажимаю на кнопку с именем 'CopyAndShiftDown1'
	И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R5C3'
	И я нажимаю на кнопку с именем 'DeleteDimension'
	И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R9C3'
	И я нажимаю на кнопку с именем 'DeleteDimension'						

	* Добавляем формулы расчета
		* ДанныеИсточника
			Когда открылось окно "Edit tree"
			И из выпадающего списка с именем 'WorkMode' я выбираю точное значение "Indicators calculation formulas"
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R2C2'
			И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
			И я нажимаю на кнопку с именем 'RefToIndicator1'
			И Я выбираю показатель с кодом "Goods_Quantity" вида отчета "VA - Cumulative total (source)"
			Тогда открылось окно "Edit tree *"
			И я нажимаю на кнопку с именем 'WriteAndCollapse'
		* ИзИсточникаДоВычисленияХ2	
			Тогда открылось окно "Edit tree"
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R4C2'
			И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R3C2'
			И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
			И я нажимаю на кнопку с именем 'WriteFormula'
			Тогда открылось окно "Edit tree"			
			И я нажимаю на кнопку с именем 'AddOperand1'
			Тогда открылось окно "Data sources"
			И я нажимаю на кнопку с именем 'FormCreate'
			Тогда открылось окно "Data source (create)"
			И из выпадающего списка с именем 'MethodOfObtaining' я выбираю точное значение "Arbitrary query to current infobase"
			И я снимаю флаг с именем 'UseMultiperiodContext'
			И в поле с именем 'QueryTextForm' я ввожу текст 'SELECT 2 AS Value'
			И я нажимаю на кнопку с именем 'EditQueryText'
			И я перехожу к закладке с именем 'ComplianceAnalyst'
			И в таблице 'ComplianceTable' я активизирую поле с именем 'ComplianceTableFillingMethod'
			И в таблице 'ComplianceTable' я выбираю текущую строку
			И в таблице 'ComplianceTable' из выпадающего списка с именем 'ComplianceTableFillingMethod' я выбираю точное значение "Another source field"
			И в таблице 'ComplianceTable' я завершаю редактирование строки
			И в таблице 'ComplianceTable' я активизирую поле с именем 'MapTableDBAlias'
			И в таблице 'ComplianceTable' я выбираю текущую строку
			Тогда открылось окно "Data sources"
			И в таблице 'List' я выбираю текущую строку
			Тогда открылось окно "Data source (create) *"
			И я нажимаю на кнопку с именем 'FormWriteAndClose'
			И я жду закрытия окна "Data source (create) *" в течение 20 секунд
			Тогда открылось окно "Data sources"
			И в таблице 'List' я выбираю текущую строку
			Тогда открылось окно "Edit tree *"
			И я нажимаю на кнопку с именем 'ButtonMultiply'
			И я нажимаю на кнопку с именем 'WriteAndCollapse'
		* ИзИсточникаОтборПоПериоду
			Когда открылось окно "Edit tree"
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R6C2'
			И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
			И я нажимаю на кнопку с именем 'AddOperand1'
			Тогда открылось окно "Data sources"
			И я нажимаю на кнопку с именем 'FormCreate'
			Тогда открылось окно "Data source (create)"
			И из выпадающего списка с именем 'MethodOfObtaining' я выбираю точное значение "Current infobase report item indicator"
			И из выпадающего списка с именем 'ReportTypeFilter' я выбираю по строке "VA - Cumulative total (source)"
			И я нажимаю кнопку выбора у поля с именем 'IndicatorFilter'
			И Я выбираю показатель с кодом "Goods_Quantity"
			Тогда открылось окно "Data source (create) *"
			И я перехожу к закладке с именем 'FiltersPage'
			И в таблице 'TreeOfFilterParametersDB' я перехожу к строке:
				| "Filter"         | "Field"            |
				| "Report period" | "[Report period]" |
			И в таблице 'TreeOfFilterParametersDB' я активизирую поле с именем 'ParameterCalculationMethod'
			И в таблице 'TreeOfFilterParametersDB' я выбираю текущую строку
			И в таблице 'TreeOfFilterParametersDB' из выпадающего списка с именем 'ParameterCalculationMethod' я выбираю точное значение "List of values (function in 1C:Enterprise script)"
			И в таблице 'TreeOfFilterParametersDB' я активизирую поле с именем 'DefiningMethodClarification'
			И в таблице 'TreeOfFilterParametersDB' я нажимаю кнопку выбора у реквизита с именем 'DefiningMethodClarification'
			Когда открылось окно "VA - Cumulative total (recipient): Calculate a parameter value"
			И в поле с именем 'TextDocumentFieldProcedure' я ввожу текст 
				|'// Получаем все периоды Before текущего'|
				|'Result = New ValueList;'|
				|'For Cnt = 0 To ObjectOfARAP.ArrayOfPeriods.Find(ObjectOfARAP.ReportPeriod) Do'|
				|' Result.Add(ObjectOfARAP.ArrayOfPeriods.Get(Cnt));'|
				|'EndDo;'|
			И я нажимаю на кнопку с именем 'FormWriteAndClose'
			Тогда открылось окно "1C:Enterprise"
			И я нажимаю на кнопку с именем 'Button0'
			И я активизирую окно "Data source (create) *"
			Тогда открылось окно "Data source (create) *"
			И в таблице 'TreeOfFilterParametersDB' я завершаю редактирование строки
			И я нажимаю на кнопку с именем 'FormWriteAndClose'
			И я жду закрытия окна "Data source (create) *" в течение 20 секунд
			Тогда открылось окно "Data sources"
			И в таблице 'List' я выбираю текущую строку
			Тогда открылось окно "Edit tree *"
			И я нажимаю на кнопку с именем 'WriteAndCollapse'
		* ИзПриемникаОтборПоПериоду
			Когда открылось окно "Edit tree"
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R7C2'
			И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
			И я нажимаю на кнопку с именем 'AddOperand1'
			Тогда открылось окно "Data sources"
			И я нажимаю на кнопку с именем 'FormCreate'
			Тогда открылось окно "Data source (create)"
			И из выпадающего списка с именем 'MethodOfObtaining' я выбираю точное значение "Current infobase report item indicator"
			И из выпадающего списка с именем 'ReportTypeFilter' я выбираю по строке "VA - Cumulative total (recipient)"
			И я нажимаю кнопку выбора у поля с именем 'IndicatorFilter'
			И Я выбираю показатель с кодом "SourceData_Quantity"
			Тогда открылось окно "Data source (create) *"
			И я перехожу к закладке с именем 'FiltersPage'
			И в таблице 'TreeOfFilterParametersDB' я перехожу к строке:
				| "Filter"         | "Field"            |
				| "Report period" | "[Report period]" |
			И в таблице 'TreeOfFilterParametersDB' я активизирую поле с именем 'ParameterCalculationMethod'
			И в таблице 'TreeOfFilterParametersDB' я выбираю текущую строку
			И в таблице 'TreeOfFilterParametersDB' из выпадающего списка с именем 'ParameterCalculationMethod' я выбираю точное значение "List of values (function in 1C:Enterprise script)"
			И в таблице 'TreeOfFilterParametersDB' я активизирую поле с именем 'DefiningMethodClarification'
			И в таблице 'TreeOfFilterParametersDB' я нажимаю кнопку выбора у реквизита с именем 'DefiningMethodClarification'
			Тогда открылось окно "VA - Cumulative total (recipient): Calculate a parameter value"
			И в поле с именем 'TextDocumentFieldProcedure' я ввожу текст 
				|'// Получаем все периоды Before текущего'|
				|'Result = New ValueList;'|
				|'For Cnt = 0 To ObjectOfARAP.ArrayOfPeriods.Find(ObjectOfARAP.ReportPeriod) Do'|
				|' Result.Add(ObjectOfARAP.ArrayOfPeriods.Get(Cnt));'|
				|'EndDo;'|
			И я нажимаю на кнопку с именем 'FormWriteAndClose'
			Тогда открылось окно "1C:Enterprise"
			И я нажимаю на кнопку с именем 'Button0'
			И я активизирую окно "Data source (create) *"
			Тогда открылось окно "Data source (create) *"
			И в таблице 'TreeOfFilterParametersDB' я завершаю редактирование строки
			И я нажимаю на кнопку с именем 'FormWriteAndClose'
			И я жду закрытия окна "Data source (create) *" в течение 20 секунд
			Тогда открылось окно "Data sources"
			И в таблице 'List' я выбираю текущую строку
			Тогда открылось окно "Edit tree *"
			И я нажимаю на кнопку с именем 'WriteAndCollapse'
		* ИзПриемникаСдвигПериода
			Когда открылось окно "Edit tree"
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R8C2'
			И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
			И я нажимаю на кнопку с именем 'AddOperand1'
			Тогда открылось окно "Data sources"
			И я нажимаю на кнопку с именем 'FormCreate'
			Тогда открылось окно "Data source (create)"
			И из выпадающего списка с именем 'ReportTypeFilter' я выбираю по строке "VA - Cumulative total (recipient)"
			И я нажимаю кнопку выбора у поля с именем 'IndicatorFilter'
			И Я выбираю показатель с кодом "FromReceiverSelectio_Quantity"
			Тогда открылось окно "Data source (create) *"
			И я перехожу к закладке с именем 'FiltersPage'
			И в таблице 'TreeOfFilterParametersDB' я перехожу к строке:
				| "Filter"         | "Field"            |
				| "Report period" | "[Report period]" |
			И в таблице 'TreeOfFilterParametersDB' я активизирую поле с именем 'ParameterCalculationMethod'
			И в таблице 'TreeOfFilterParametersDB' я выбираю текущую строку
			И в таблице 'TreeOfFilterParametersDB' из выпадающего списка с именем 'ParameterCalculationMethod' я выбираю точное значение "Report period with a shift"
			И в таблице 'TreeOfFilterParametersDB' я активизирую поле с именем 'DefiningMethodClarification'
			И в таблице 'TreeOfFilterParametersDB' в поле с именем 'DefiningMethodClarification' я ввожу текст '-1'
			И в таблице 'TreeOfFilterParametersDB' я завершаю редактирование строки
			И я нажимаю на кнопку с именем 'FormWriteAndClose'
			И я жду закрытия окна "Data source (create) *" в течение 20 секунд
			Тогда открылось окно "Data sources"
			И в таблице 'List' я выбираю текущую строку
			Тогда открылось окно "Edit tree *"
			И я нажимаю на кнопку с именем 'ButtonPlus'
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R2C2'
			И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
			И я нажимаю на кнопку с именем 'WriteAndCollapse'
		* ИзИсточникаПроизвольныйКод
			Когда открылось окно "Edit tree"
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R9C2'
			И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
			И я нажимаю на кнопку с именем 'ArbitraryCode'
			И я нажимаю на кнопку с именем 'EditProcedure'
			Тогда открылось окно "VA - Cumulative total (recipient): Calculation formula"
			И Я запоминаю в переменную 'ReportCode' значение "VACumulativeTotalSource"
			И Я запоминаю в переменную 'CodeOfIndicator1' значение "Goods_Quantity"			
			И в поле с именем 'TextDocumentFieldProcedure' я ввожу текст
				|'// Получим ссылки to1 нужные показатели'|
				|'IndicatorSource = Catalogs.ReportsIndicators.FindByCode("$CodeOfIndicator1$",,,Catalogs.ReportsKinds.FindByCode("$ReportCode$"));'|
				|''|
				|'// Получаем массив Periods'|
				|'тReportPeriods = New Array;'|
				|'For Cnt = 0 To ObjectOfARAP.ArrayOfPeriods.Find(ObjectOfARAP.ReportPeriod) Do'|
				|' тReportPeriods.Add(ObjectOfARAP.ArrayOfPeriods.Get(Cnt));'|
				|'EndDo;'|
				|''|
				|'FilterParameterStructure = New Structure("ReportIndicator,Currency,ReportPeriod,Scenario,Organization", IndicatorSource,ObjectOfARAP.MainCurrency,тReportPeriods,ObjectOfARAP.Scenario,ObjectOfARAP.Organization);'|
				|'AdditionalParameters = New Structure("Overall",Enums.IndicatorTotalsTypes.Sum);'|
				|'tIndicatorsValues = GetIndicatorsValue(FilterParameterStructure,,AdditionalParameters);'|
				|''|
				|' // Получаем сумму Values_ показателей'|
				|' If tIndicatorsValues.Count() Then'|
				|'  Result = tIndicatorsValues.Get(0).Value;'|
				|' Else'|
				|'  Result = 0; '|
				|' EndIf; '|
			И я нажимаю на кнопку с именем 'FormWriteAndClose'
			Тогда открылось окно "1C:Enterprise"
			И я нажимаю на кнопку с именем 'Button0'
			Тогда открылось окно "Edit tree"
			И я нажимаю на кнопку с именем 'WriteAndCollapse'						

	* Добавляем процедуры в правило обработки		
		* Процедура До вычисления
			Когда открылось окно "Edit tree"
			И я нажимаю на кнопку открытия поля с именем 'ProcessingRule'
			Когда Открылась правило расчета для вида отчета "VA - Cumulative total (recipient)"
			И я нажимаю на кнопку с именем 'FormProcedureOfCalculation'
			Когда открылось окно "VA - Cumulative total (recipient), VA - Cumulative total (recipient): Procedure before calculation"
			И Я запоминаю в переменную 'CodeOfIndicator2' значение "FromSourceBeforeCalc_Quantity"
			И в поле с именем 'TextDocumentFieldProcedure' я ввожу текст 
				|'// Получим ссылки to1 нужные показатели'|
				|'IndicatorSource = Catalogs.ReportsIndicators.FindByCode("$CodeOfIndicator1$",,,Catalogs.ReportsKinds.FindByCode("$ReportCode$"));'|
				|'IndicatorDestination = Catalogs.ReportsIndicators.FindByCode("$CodeOfIndicator2$",,,ObjectOfARAP.ReportKind);'|
				|''|
				|'// Cycle по периодам Report_'|
				|'For CntShared = 0 To ObjectOfARAP.ArrayOfPeriods.Count()-1 Do'|
				|''|
				|' // Получаем значение показателей AllOfThem предыдущих и текущего Periods'|
				|' тReportPeriods = New Array;'|
				|' For CntTimeIntervals = 0 To CntShared Do'|
				|'  тReportPeriods.Add(ObjectOfARAP.ArrayOfPeriods.Get(CntTimeIntervals));'|
				|' EndDo;'|
				|' '|
				|' DimensionsToDrillDown = New Structure("Dimension2");'|
				|''|
				|' FilterParameterStructure = New Structure("ReportIndicator,Currency,ReportPeriod,Scenario,Organization",'|
				|'  IndicatorSource,ObjectOfARAP.MainCurrency,тReportPeriods,ObjectOfARAP.Scenario,ObjectOfARAP.Organization);'|
				|''|
				|' tIndicatorsValues = GetIndicatorsValue(FilterParameterStructure,DimensionsToDrillDown);'|
				|' tIndicatorsValues.GroupBy("Dimension2","Value");'|
				|' '|
				|' For Each RowValuesПоказателей In tIndicatorsValues Do'|
				|'  SetIndicatorValue('|
				|'   IndicatorDestination,  '|
				|'   RowValuesПоказателей.Value,   '|
				|'   ObjectOfARAP.ArrayOfPeriods.Get(CntShared),,'|
				|'   RowValuesПоказателей.Dimension2);'|
				|' EndDo;'|
				|'  '|
				|'EndDo;'|
			И я нажимаю на кнопку с именем 'FormWriteAndClose'
			Тогда открылось окно "1C:Enterprise"
			И я нажимаю на кнопку с именем 'Button0'
		* Процедура После вычисления
			Когда Открылась правило расчета для вида отчета "VA - Cumulative total (recipient)"
			И я нажимаю на кнопку с именем 'FormProcedureAfterCalculation'
			Когда открылось окно "VA - Cumulative total (recipient), VA - Cumulative total (recipient): Procedure after calculation"
			И Я запоминаю в переменную 'CodeOfIndicator2' значение "FromSourceAfterCalcu_Quantity"
			И в поле с именем 'TextDocumentFieldProcedure' я ввожу текст 
				|'// Получим ссылки to1 нужные показатели'|
				|'IndicatorSource = Catalogs.ReportsIndicators.FindByCode("$CodeOfIndicator1$",,,Catalogs.ReportsKinds.FindByCode("$ReportCode$"));'|
				|'IndicatorDestination = Catalogs.ReportsIndicators.FindByCode("$CodeOfIndicator2$",,,ObjectOfARAP.ReportKind);'|
				|''|
				|'// Cycle по периодам Report_'|
				|'For CntShared = 0 To ObjectOfARAP.ArrayOfPeriods.Count()-1 Do'|
				|''|
				|' // Получаем значение показателей AllOfThem предыдущих и текущего Periods'|
				|' тReportPeriods = New Array;'|
				|' For CntTimeIntervals = 0 To CntShared Do'|
				|'  тReportPeriods.Add(ObjectOfARAP.ArrayOfPeriods.Get(CntTimeIntervals));'|
				|' EndDo;'|
				|''|
				|' FilterParameterStructure = New Structure("ReportIndicator,Currency,ReportPeriod,Scenario,Organization",'|
				|'  IndicatorSource,ObjectOfARAP.MainCurrency,тReportPeriods,ObjectOfARAP.Scenario,ObjectOfARAP.Organization);'|
				|'  '|
				|' AdditionalParameters = New Structure("Overall",Enums.IndicatorTotalsTypes.Sum); '|
				|''|
				|' tIndicatorsValues = GetIndicatorsValue(FilterParameterStructure,,AdditionalParameters);'|
				|' '|
				|' // Получаем сумму Values_ показателей'|
				|' If tIndicatorsValues.Count() Then'|
				|'  Value = tIndicatorsValues.Get(0).Value;'|
				|' Else'|
				|'  Value = 0; '|
				|' EndIf;'|
				|''|
				|' // Устанавливаем значение показателя'|
				|' SetIndicatorValue('|
				|'  IndicatorDestination,  '|
				|'  Value,   '|
				|'  ObjectOfARAP.ArrayOfPeriods.Get(CntShared));'|
				|'  '|
				|'EndDo;'|
			И я нажимаю на кнопку с именем 'FormWriteAndClose'
			Тогда открылось окно "1C:Enterprise"
			И я нажимаю на кнопку с именем 'Button0'
			Тогда Открылась правило расчета для вида отчета "VA - Cumulative total (recipient)"
			И я запоминаю заголовок формы в переменную "TitleОкна"			
			И я нажимаю на кнопку с именем 'FormWriteAndClose'
			И я жду закрытия окна '$WindowTitle$' в течение 20 секунд
			Когда открылось окно "Edit tree"
			И Я закрываю окно "Edit tree"														
	
	И Я Для вида отчета "VA - Cumulative total (recipient)" создаю бланк по умолчанию
	И Я Для вида отчета "VA - Cumulative total (recipient)" в бланке для группы раскрытия с адресом 'R8C1' задаю сортировку "Product range" "Product ID"
	И Я Для вида отчета "VA - Cumulative total (recipient)" в бланке для группы раскрытия с адресом 'R10C1' задаю сортировку "Product range" "Product ID"
	И Я Для вида отчета "VA - Cumulative total (recipient)" в бланке для группы раскрытия с адресом 'R12C1' задаю сортировку "Product range" "Product ID"
	И Я Для вида отчета "VA - Cumulative total (recipient)" в бланке для группы раскрытия с адресом 'R15C1' задаю сортировку "Product range" "Product ID"
	И Я Для вида отчета "VA - Cumulative total (recipient)" в бланке для группы раскрытия с адресом 'R17C1' задаю сортировку "Product range" "Product ID"
	И Я Для вида отчета "VA - Cumulative total (recipient)" в бланке для группы раскрытия с адресом 'R19C1' задаю сортировку "Product range" "Product ID"

Сценарий: 08.05 Создание экземпляра отчета - "VA - Cumulative total (recipient)" 

	И Я создаю экземпляр отчета для вида отчета "VA - Cumulative total (recipient)" сценарий "VA - Main scenario" период '1/1/2021' '3/31/2021' периодичность "Month" организация "Mercury LLC" проект "VA - Main project" аналитики "3Software sale" '' '' '' '' '' 

	* Рассчитываем и сверяем документ
		И я нажимаю на кнопку с именем 'FormFillByDefault'
		Тогда табличный документ 'SpreadsheetFieldTemlate' равен макету "Макеты\ВА_НарастающийИтог.mxl"

	* Еще раз расчитаем документ, убедимся, что ничего не поменялось
		Когда открылось окно '$WindowTitle$'	
		И я нажимаю на кнопку с именем 'Write'
		Тогда Открылся экземпляр отчета для вида отчета "VA - Cumulative total (recipient)" валюта 'RUB' организация "Mercury LLC" сценарий "VA - Main scenario" периодичность "Month" проект "VA - Main project" аналитики "3Software sale" '' '' '' '' '' 
		И я нажимаю на кнопку с именем 'FormFillByDefault'
		Тогда табличный документ 'SpreadsheetFieldTemlate' равен макету "Макеты\ВА_НарастающийИтог.mxl"					

	* Смотрим движения
		Когда открылось окно '$WindowTitle$ *'
		И я нажимаю на кнопку с именем 'FormOpenDocumentRegisterRecordsFlatTab'
		Тогда открылось окно "1C:Enterprise"
		И я нажимаю на кнопку с именем 'Button0'
		Тогда открылось окно "Flat table of indicator values"
		И я жду когда в табличном документе 'ReportSpreadsheetDocument' заполнится ячейка 'R2C1' в течение 30 секунд
		Когда Я задаю параметры чтения области макета 'R1C1:R452C20'
		Дано Табличный документ 'ReportSpreadsheetDocument' равен макету "Макеты\ВА_НарастающийИтог_Движения.mxl" по шаблону

	* Закроем отчет и документ
		Когда открылось окно "Flat table of indicator values"
		И Я закрываю окно "Flat table of indicator values"
		Тогда открылось окно '$WindowTitle$'
		И я нажимаю на кнопку с именем 'WriteAndClose'
		И я жду закрытия окна '$WindowTitle$' в течение 20 секунд
