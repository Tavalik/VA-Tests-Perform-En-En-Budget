#language: ru

@tree

Функционал: 08. Расчет показателей нарастающим итогом

Как Администратор я хочу
Проверить различные способы расчета показателей нарастающим итогом 

Контекст: 

	И я подключаю TestClient 'CPM - Budgeting' логин "Administrator" пароль ''
	И я закрыл все окна клиентского приложения

Сценарий: 08.00 Определение типа приложения

	Пусть Инициализация переменных

Сценарий: 08.01 Создание группы отчетов 'VA - Cumulative total (group)'

	И Я создаю группу видов отчетов с именем 'VA - Cumulative total (group)' и родителем 'VA - Report group'

Сценарий: 08.02 Создание вида отчета 'VA - Cumulative total (source)'

	И Я создаю вид отчета с именем 'VA - Cumulative total (source)' и родителем 'VA - Cumulative total (group)'

	И Я открываю вид отчета с именем 'VA - Cumulative total (source)'
	И я устанавливаю флаг с именем 'ProjectSeparation'		
	И я перехожу к закладке с именем 'ReportDimensions'
	И из выпадающего списка с именем 'DimensionType1' я выбираю по строке 'VA0CFItems'				
	И я нажимаю на кнопку с именем 'FormButtonWrite'
	Когда открылось окно "Data restructuring"
	И я нажимаю на кнопку с именем 'FormOK'

	И я нажимаю на кнопку с именем 'EditTree'
	Когда открылось окно "Edit tree"
	И Я в конструкторе отчета добавляю строку с именем 'Goods'	
	И Я в конструкторе отчета добавляю колонку с именем 'Count'		
	И Я в конструкторе отчета добавляю аналитику с кодом 'VA0Product' в ячейку 'R2C3'
		
	И Я Для вида отчета 'VA - Cumulative total (source)' я создаю бланк по умолчанию
	И Я Для вида отчета 'VA - Cumulative total (source)' в бланке для группы раскрытия с адресом 'R8C1' задаю сортировку 'Products.Product ID'

Сценарий: 08.03 Создание экземпляра отчета - 'VA - Cumulative total (source)' 

	И Я создаю экземпляр отчета для вида отчета 'VA - Cumulative total (source)' сценарий 'VA - Main scenario' период '1/1/2021' '3/31/2021' периодичность "Month" организация 'Mercury LLC' проект 'VA - Main project' аналитики 'Software sale' '' '' '' '' '' 

	* Документ должен быть пустой
		Тогда табличный документ 'SpreadsheetFieldTemlate' равен:
			| 'VA - Cumulative total (source)' | ''               | ''                | ''             | ''           |
			| ''                                 | ''               | ''                | ''             | ''           |
			| ''                                 | 'January 2021' | 'February 2021' | 'March 2021' | 'TOTAL'      |
			| ''                                 | 'Count'     | 'Count'      | 'Count'   | 'Count' |
			| 'Goods'                           | '0'              | '0'               | '0'            | '0'          |

	* Вводим значения показателей
		Когда открылось окно '$WindowTitle$'		
		И Я добавляю значения с раскрытием показателей в ячейку 'R6C2'
				| 'VA0Product'                                                     | 'Value' |
				| '1C:Enterprise 8.3 CORP. Server License (x86-64)'           | '10.00000' |
				| '1C:Enterprise 8 CORP. Client license for 100 users' | '10.00000' |
				| '1C:Corporate performance management'                                      | '10.00000' |
				| '1C:Corporation'                                                  | '10.00000' |
				| '1C:ERP. Corporate performance management'                                   | '10.00000' |

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
			| 'VA - Cumulative total (source)'                                | ''               | ''                | ''             | ''           |
			| ''                                                                | ''               | ''                | ''             | ''           |
			| ''                                                                | 'January 2021' | 'February 2021' | 'March 2021' | 'TOTAL'      |
			| ''                                                                | 'Count'     | 'Count'      | 'Count'   | 'Count' |
			| 'Goods'                                                          | '50'             | '100'             | '150'          | '300'        |
			| '1C:Corporate performance management '                                      | '10'             | '20'              | '30'           | '60'         |
			| '1C:Corporation '                                                  | '10'             | '20'              | '30'           | '60'         |
			| '1C:Enterprise 8.3 CORP. Server License (x86-64) '           | '10'             | '20'              | '30'           | '60'         |
			| '1C:ERP. Corporate performance management '                                   | '10'             | '20'              | '30'           | '60'         |
			| '1C:Enterprise 8 CORP. Client license for 100 users ' | '10'             | '20'              | '30'           | '60'         |

	* Записываем документ	
		Когда открылось окно '$WindowTitle$'
		И я нажимаю на кнопку с именем 'WriteAndClose'
		И я жду закрытия окна '$WindowTitle$' в течение 20 секунд			

Сценарий: 08.04 Создание вида отчета 'VA - Cumulative total (recipient)'

	И Я создаю вид отчета с именем 'VA - Cumulative total (recipient)' и родителем 'VA - Cumulative total (group)'

	И Я открываю вид отчета с именем 'VA - Cumulative total (recipient)'
	И я устанавливаю флаг с именем 'ProjectSeparation'		
	И я перехожу к закладке с именем 'ReportDimensions'
	И из выпадающего списка с именем 'DimensionType1' я выбираю по строке 'VA0CFItems'				
	И я нажимаю на кнопку с именем 'FormButtonWrite'
	Когда открылось окно "Data restructuring"
	И я нажимаю на кнопку с именем 'FormOK'

	И я нажимаю на кнопку с именем 'EditTree'
	Когда открылось окно "Edit tree"
	
	И Я в конструкторе отчета добавляю строку с именем 'SourceData'	
	И Я в конструкторе отчета добавляю строку с именем 'FromSourceBeforeCalculation'
	И Я в конструкторе отчета добавляю строку с именем 'FromSourceBeforeCalculationX2'
	И Я в конструкторе отчета добавляю строку с именем 'FromSourceAfterCalculation'
	И Я в конструкторе отчета добавляю строку с именем 'FromSourceSelectionByPeriod'
	И Я в конструкторе отчета добавляю строку с именем 'FromReceiverSelectionByPeriod'
	И Я в конструкторе отчета добавляю строку с именем 'FromReceiverShiftPeriod'
	И Я в конструкторе отчета добавляю строку с именем 'FromSourceArbitraryCode'
		
	И Я в конструкторе отчета добавляю колонку с именем 'Count'		
	
	И Я в конструкторе отчета добавляю аналитику с кодом 'VA0Product' в ячейку 'R2C3'
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
			И Я выбираю показатель с кодом 'Goods_Count' вида отчета 'VA - Cumulative total (source)'
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
			И из выпадающего списка с именем 'ReceiptOption' я выбираю точное значение "Arbitrary query to current infobase"
			И я снимаю флаг с именем 'ShouldUseMultiperiodContext'
			И в поле с именем 'QueryTextForm' я ввожу текст 'SELECT 2 AS Value'
			И я нажимаю на кнопку с именем 'EditQueryText'
			И я перехожу к закладке с именем 'DimensionsMap'
			И в таблице 'MappingTable' я активизирую поле с именем 'MappingTableFillingMethod'
			И в таблице 'MappingTable' я выбираю текущую строку
			И в таблице 'MappingTable' из выпадающего списка с именем 'MappingTableFillingMethod' я выбираю точное значение "Another source field"
			И в таблице 'MappingTable' я завершаю редактирование строки
			И в таблице 'MappingTable' я активизирую поле с именем 'MapTableDBAlias'
			И в таблице 'MappingTable' я выбираю текущую строку
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
			И из выпадающего списка с именем 'ReceiptOption' я выбираю точное значение "Current infobase report item indicator"
			И из выпадающего списка с именем 'ReportTypeFilter' я выбираю по строке 'VA - Cumulative total (source)'
			И я нажимаю кнопку выбора у поля с именем 'IndicatorFilter'
			И Я выбираю показатель с кодом 'Goods_Count'
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
			Когда открылось окно 'VA - Cumulative total (recipient), : ParameterValueCalculation'
			И в поле с именем 'TextDocFieldProcedure' я ввожу текст 
				|'// Получаем все периоды before текущего'|
				|'Result = New ValueList;'|
				|'For Cnt = 0 To SettlementObject.PeriodsArray.Find(SettlementObject.ReportPeriod) Do'|
				|' Result.Add(SettlementObject.PeriodsArray.Get(Cnt));'|
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
			И из выпадающего списка с именем 'ReceiptOption' я выбираю точное значение "Current infobase report item indicator"
			И из выпадающего списка с именем 'ReportTypeFilter' я выбираю по строке 'VA - Cumulative total (recipient)'
			И я нажимаю кнопку выбора у поля с именем 'IndicatorFilter'
			И Я выбираю показатель с кодом 'SourceData_Count'
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
			Тогда открылось окно 'VA - Cumulative total (recipient), : ParameterValueCalculation'
			И в поле с именем 'TextDocFieldProcedure' я ввожу текст 
				|'// Получаем все периоды before текущего'|
				|'Result = New ValueList;'|
				|'For Cnt = 0 To SettlementObject.PeriodsArray.Find(SettlementObject.ReportPeriod) Do'|
				|' Result.Add(SettlementObject.PeriodsArray.Get(Cnt));'|
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
			И из выпадающего списка с именем 'ReportTypeFilter' я выбираю по строке 'VA - Cumulative total (recipient)'
			И я нажимаю кнопку выбора у поля с именем 'IndicatorFilter'
			И Я выбираю показатель с кодом 'FromReceiverSelectio_Count'
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
			Тогда открылось окно 'VA - Cumulative total (recipient), : EvalFormula'
			И в поле с именем 'TextDocFieldProcedure' я ввожу текст
				|'// Получим ссылки to1 нужные показатели'|
				|'IndicatorSource = Catalogs.ReportsIndicators.FindByCode("Goods_Count",,,Catalogs.ReportsKinds.FindByCode("VACumulativeTotalSource"));'|
				|''|
				|'// Получаем массив periods'|
				|'тTimeIntervalsReport = New Array;'|
				|'For Cnt = 0 To SettlementObject.PeriodsArray.Find(SettlementObject.ReportPeriod) Do'|
				|' тTimeIntervalsReport.Add(SettlementObject.PeriodsArray.Get(Cnt));'|
				|'EndDo;'|
				|''|
				|'FilterParameterStructure = New Structure("ReportIndicator,Currency,ReportPeriod,Scenario,Company", IndicatorSource,SettlementObject.MainCurrency,тTimeIntervalsReport,SettlementObject.Scenario,SettlementObject.Company);'|
				|'AdditionalParameters = New Structure("GrandTotal",Enums.IndicatorTotalsTypes.Sum);'|
				|'tIndicatorsValues = GetIndicatorsValue(FilterParameterStructure,,AdditionalParameters);'|
				|''|
				|' // Получаем сумму znacheniy pokazateley'|
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
			Когда Открылась правило расчета для вида отчета 'VA - Cumulative total (recipient)'
			И я нажимаю на кнопку с именем 'FormCalculationProcedure'
			Когда открылось окно 'VA - Cumulative total (recipient), VA - Cumulative total (recipient): CalculationProcedure'
			И в поле с именем 'TextDocFieldProcedure' я ввожу текст 
				|'// Получим ссылки to1 нужные показатели'|
				|'IndicatorSource = Catalogs.ReportsIndicators.FindByCode("Goods_Count",,,Catalogs.ReportsKinds.FindByCode("VACumulativeTotalSource"));'|
				|'IndicatorDestination = Catalogs.ReportsIndicators.FindByCode("FromSourceBeforeCalc_Count",,,SettlementObject.ReportKind);'|
				|''|
				|'// Do по периодам report'|
				|'For CntShared = 0 To SettlementObject.PeriodsArray.Count()-1 Do'|
				|''|
				|' // Получаем значение pokazateley всех предыдущих и текущего periods'|
				|' тTimeIntervalsReport = New Array;'|
				|' For CntTimeIntervals = 0 To CntShared Do'|
				|'  тTimeIntervalsReport.Add(SettlementObject.PeriodsArray.Get(CntTimeIntervals));'|
				|' EndDo;'|
				|' '|
				|' DimensionsToDrillDown = New Structure("Dimension2");'|
				|''|
				|' FilterParameterStructure = New Structure("ReportIndicator,Currency,ReportPeriod,Scenario,Company",'|
				|'  IndicatorSource,SettlementObject.MainCurrency,тTimeIntervalsReport,SettlementObject.Scenario,SettlementObject.Company);'|
				|''|
				|' tIndicatorsValues = GetIndicatorsValue(FilterParameterStructure,DimensionsToDrillDown);'|
				|' tIndicatorsValues.GroupBy("Dimension2","Value");'|
				|' '|
				|' For Each RowValuesПоказателей In tIndicatorsValues Do'|
				|'  SetIndicatorValue('|
				|'   IndicatorDestination,  '|
				|'   RowValuesПоказателей.Value,   '|
				|'   SettlementObject.PeriodsArray.Get(CntShared),,'|
				|'   RowValuesПоказателей.Dimension2);'|
				|' EndDo;'|
				|'  '|
				|'EndDo;'|
			И я нажимаю на кнопку с именем 'FormWriteAndClose'
			Тогда открылось окно "1C:Enterprise"
			И я нажимаю на кнопку с именем 'Button0'
		* Процедура После вычисления
			Когда Открылась правило расчета для вида отчета 'VA - Cumulative total (recipient)'
			И я нажимаю на кнопку с именем 'FormProcedureAfterCalculation'
			Когда открылось окно 'VA - Cumulative total (recipient), VA - Cumulative total (recipient): ProcedureAfterCalculation'
			И в поле с именем 'TextDocFieldProcedure' я ввожу текст 
				|'// Получим ссылки to1 нужные показатели'|
				|'IndicatorSource = Catalogs.ReportsIndicators.FindByCode("Goods_Count",,,Catalogs.ReportsKinds.FindByCode("VACumulativeTotalSource"));'|
				|'IndicatorDestination = Catalogs.ReportsIndicators.FindByCode("FromSourceAfterCalcu_Count",,,SettlementObject.ReportKind);'|
				|''|
				|'// Do по периодам report'|
				|'For CntShared = 0 To SettlementObject.PeriodsArray.Count()-1 Do'|
				|''|
				|' // Получаем значение pokazateley всех предыдущих и текущего periods'|
				|' тTimeIntervalsReport = New Array;'|
				|' For CntTimeIntervals = 0 To CntShared Do'|
				|'  тTimeIntervalsReport.Add(SettlementObject.PeriodsArray.Get(CntTimeIntervals));'|
				|' EndDo;'|
				|''|
				|' FilterParameterStructure = New Structure("ReportIndicator,Currency,ReportPeriod,Scenario,Company",'|
				|'  IndicatorSource,SettlementObject.MainCurrency,тTimeIntervalsReport,SettlementObject.Scenario,SettlementObject.Company);'|
				|'  '|
				|' AdditionalParameters = New Structure("GrandTotal",Enums.IndicatorTotalsTypes.Sum); '|
				|''|
				|' tIndicatorsValues = GetIndicatorsValue(FilterParameterStructure,,AdditionalParameters);'|
				|' '|
				|' // Получаем сумму znacheniy pokazateley'|
				|' If tIndicatorsValues.Count() Then'|
				|'  Value = tIndicatorsValues.Get(0).Value;'|
				|' Else'|
				|'  Value = 0; '|
				|' EndIf;'|
				|''|
				|' // Устанавливаем значение pokazatelja'|
				|' SetIndicatorValue('|
				|'  IndicatorDestination,  '|
				|'  Value,   '|
				|'  SettlementObject.PeriodsArray.Get(CntShared));'|
				|'  '|
				|'EndDo;'|
			И я нажимаю на кнопку с именем 'FormWriteAndClose'
			Тогда открылось окно "1C:Enterprise"
			И я нажимаю на кнопку с именем 'Button0'
			Тогда Открылась правило расчета для вида отчета 'VA - Cumulative total (recipient)'
			И я запоминаю заголовок формы в переменную "TitleОкна"			
			И я нажимаю на кнопку с именем 'FormWriteAndClose'
			И я жду закрытия окна '$WindowTitle$' в течение 20 секунд
			Когда открылось окно "Edit tree"
			И Я закрываю окно "Edit tree"														
	
	И Я Для вида отчета 'VA - Cumulative total (recipient)' я создаю бланк по умолчанию
	И Я Для вида отчета 'VA - Cumulative total (recipient)' в бланке для группы раскрытия с адресом 'R8C1' задаю сортировку 'Products.Product ID'
	И Я Для вида отчета 'VA - Cumulative total (recipient)' в бланке для группы раскрытия с адресом 'R10C1' задаю сортировку 'Products.Product ID'
	И Я Для вида отчета 'VA - Cumulative total (recipient)' в бланке для группы раскрытия с адресом 'R12C1' задаю сортировку 'Products.Product ID'
	И Я Для вида отчета 'VA - Cumulative total (recipient)' в бланке для группы раскрытия с адресом 'R15C1' задаю сортировку 'Products.Product ID'
	И Я Для вида отчета 'VA - Cumulative total (recipient)' в бланке для группы раскрытия с адресом 'R17C1' задаю сортировку 'Products.Product ID'
	И Я Для вида отчета 'VA - Cumulative total (recipient)' в бланке для группы раскрытия с адресом 'R19C1' задаю сортировку 'Products.Product ID'

Сценарий: 08.05 Создание экземпляра отчета - 'VA - Cumulative total (recipient)' 

	И Я создаю экземпляр отчета для вида отчета 'VA - Cumulative total (recipient)' сценарий 'VA - Main scenario' период '1/1/2021' '3/31/2021' периодичность "Month" организация 'Mercury LLC' проект 'VA - Main project' аналитики 'Software sale' '' '' '' '' '' 

	* Рассчитываем и сверяем документ
		И я нажимаю на кнопку с именем 'FormFillByDefault'
		Тогда табличный документ 'SpreadsheetFieldTemlate' равен макету 'Макеты\ВА_НарастающийИтог.mxl'

	* Еще раз расчитаем документ, убедимся, что ничего не поменялось
		Когда открылось окно '$WindowTitle$'	
		И я нажимаю на кнопку с именем 'FormWriteANDContinue'
		Тогда Открылся экземпляр отчета для вида отчета 'VA - Cumulative total (recipient)' валюта 'RUB' организация 'Mercury LLC' сценарий 'VA - Main scenario' периодичность "Month" проект 'VA - Main project' аналитики 'Software sale' '' '' '' '' '' 
		И я нажимаю на кнопку с именем 'FormFillByDefault'
		Тогда табличный документ 'SpreadsheetFieldTemlate' равен макету 'Макеты\ВА_НарастающийИтог.mxl'					

	* Смотрим движения
		Когда открылось окно '$WindowTitle$ *'
		И я нажимаю на кнопку с именем 'FormOpenDocRegisterRecordsFlatTab'
		Тогда открылось окно "1C:Enterprise"
		И я нажимаю на кнопку с именем 'Button0'
		Тогда открылось окно "Flat table of indicator values"
		И я жду когда в табличном документе 'ReportSpreadsheetDocument' заполнится ячейка 'R2C1' в течение 30 секунд
		Когда Я задаю параметры чтения области макета 'R1C1:R452C20'
		Дано Табличный документ 'ReportSpreadsheetDocument' равен макету 'Макеты\ВА_НарастающийИтог_Движения_En_En.mxl' по шаблону

	* Закроем отчет и документ
		Когда открылось окно "Flat table of indicator values"
		И Я закрываю окно "Flat table of indicator values"
		Тогда открылось окно '$WindowTitle$'
		И я нажимаю на кнопку с именем 'WriteAndClose'
		И я жду закрытия окна '$WindowTitle$' в течение 20 секунд
