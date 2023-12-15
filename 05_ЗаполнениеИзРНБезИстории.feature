#language: ru
@tree

Функционал: 05. Проверка видов отчета без сохранения истории, проверка заполнения данных из РБ

	Как Администратор я хочу
	Проверить что виды отчетов без истории корректно сохраняют версии
	чтобы версии записывались без ошибок

Контекст:
	
	И я закрыл все окна клиентского приложения

Сценарий: 05.00 Определение типа приложения

	И я закрываю TestClient "CPM - Budget"
	И я подключаю TestClient "CPM - Budget" логин "Administrator" пароль ''
	Пусть Инициализация переменных

Сценарий: 05.01 Создание вида отчета "VA - Filling from PH (no history)"

	И Я создаю вид отчета с именем "VA - Filling from PH (no history)" и родителем "VA - Report group"
	И Я для вида отчета "VA - Filling from PH (no history)" изменяю флаг 'IsChangeTrackingEnabled'
	И Я для вида отчета "VA - Filling from PH (no history)" изменяю флаг 'ProjectSeparation'
	
	* Редактируем структуру отчета
		И Я открываю контруктор отчета с именем "VA - Filling from PH (no history)"
		И Я в конструкторе отчета добавляю строку с именем "Cash flow items"
		И Я в конструкторе отчета добавляю колонку с именем "Amount"
		И Я в конструкторе отчета добавляю аналитику с кодом "VA0CFItems" в ячейку 'R2C2'

	И Я Для вида отчета "VA - Filling from PH (no history)" создаю бланк по умолчанию

Сценарий: 05.02 Создаем бланк сводной таблицы

	И Я нахожу в списке вид отчета с именем "VA - Filling from PH (no history)"
					
	* Создаем бланк сводной таблицы
		Когда открылось окно "Report types and templates"
		И в таблице 'List' я перехожу к строке:
			| "Description"                                          |
			| "VA - Filling from PH (no history) (pivot table)" |
		И в таблице 'List' я выбираю текущую строку
		* Состав строк
			Когда Открылся бланк сводной таблицы для вида отчета "VA - Filling from PH (no history)"
			И я нажимаю на кнопку с именем 'ShowListOfRows'
			Тогда открылось окно "Set up line list"
			И в таблице 'SettingTree' я перехожу к строке:
				| "Dimension kind 1" | "Dimension group" | "Code"       | "Purpose"      | "Report line" |
				| "Cash flow items"      | "DG_Cash flow items"   | "CashFlowItems" | "Arbitrary data" | "Cash flow items"    |
			И я нажимаю на кнопку с именем 'MoveLeft'
			И я нажимаю на кнопку с именем 'ApplyTheChanges'
		* Состав колонок	
			Тогда Открылся бланк сводной таблицы для вида отчета "VA - Filling from PH (no history)"
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
				| "Available dimensions" |
				| "Project"              |
			И я выбираю пункт контекстного меню с именем 'TableAvailableFieldsContextMenuMoveToFilters' на элементе формы с именем 'TableAvailableFields'
			И в таблице 'TableAvailableFields' я перехожу к строке:
				| "Available dimensions" |
				| "Cash flow items"          |
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

Сценарий: 05.03 Создаем формулу расчета с заполнением из РН

	Если 'NOT $$ЭтоPerform$$' Тогда

		И Я открываю контруктор отчета с именем "VA - Filling from PH (no history)"
					
		* Вводим формулу расчета
			* Создаем новый элемент	
				Тогда открылось окно "Report wizard"
				И из выпадающего списка с именем 'WorkMode' я выбираю точное значение "Indicators calculation formulas"
				И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R2C2'
				И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
				И в поле с именем 'TextDocumentFieldProcedure' я ввожу текст ' '
				И я нажимаю на кнопку с именем 'AddOperand1'
				Когда открылось окно "Data sources"
				И я нажимаю на кнопку с именем 'FormCreate'
			* Заполняем источник получения, проверяем заполнение полей				
				Когда открылось окно "Data source (create)"
				И из выпадающего списка с именем 'MethodOfObtaining' я выбираю точное значение "Current infobase accumulation register"
				Если '$$IsERPCPM$$' Тогда
					И из выпадающего списка с именем 'DBAccumulationRegister' я выбираю по строке 'BudgetsOperations'
					И у элемента с именем 'DBRegisterResource' я жду значения "Amount" в течение 3 секунд
					И у элемента с именем 'TotalKindDB' я жду значения "Turnover" в течение 3 секунд	
					И из выпадающего списка с именем 'DBRegisterResource' я выбираю точное значение "Amount исполнено"										
					Когда открылось окно "Data source (create) *"
					И в таблице "TreeFieldsБД" я разворачиваю текущую строку
					И в таблице "TreeFieldsБД" я разворачиваю строку:
						| 'Field'                      |
						| 'Dimension статей бюджетов' |
					И в таблице "TreeFieldsБД" я разворачиваю строку:
						| 'Field'           |
						| 'AssetRef бюджета' |
					И в таблице "TreeFieldsБД" я перехожу к строке:
						| 'Field'                                     |
						| 'Catalog.CashFlowReportItems' |
					И я выбираю пункт контекстного меню с именем 'ButtonMapDimensions' на элементе формы с именем "TableСоответствия"
					Тогда таблица "TableСоответствия" стала равной:
						| 'Dimension приемника'     | 'Method заполнения' | 'Name колонки'                                  | 'Kind аналитики' |
						| 'Dimension 1: ARTICLES__ Cash_Flow' | 'Field источника'    | '[Dimension статей бюджетов].[AssetRef бюджета]' | 'ARTICLES__ Cash_Flow'    |																									
				Иначе
					И из выпадающего списка с именем 'DBAccumulationRegister' я выбираю по строке 'CashFlowCPM'
					И у элемента с именем 'DBRegisterResource' я жду значения "Amount" в течение 3 секунд
					И у элемента с именем 'TotalKindDB' я жду значения "Turnover" в течение 3 секунд					
					Тогда таблица 'ComplianceTable' стала равной:
						| 'Dimension приемника'     | 'Method заполнения' | 'Name колонки'                        | 'Kind аналитики' |
						| "Dimension 1: Cash flow items" | 'Field источника'    | '[AssetRef движения денежных средств]' | "Cash flow items"    |							
			* Заполняем отборы		
				И я перехожу к закладке с именем 'FiltersPage'
				Если '$$IsERPCPM$$' Тогда
					И в таблице "TreeFieldsБД" я разворачиваю строку:
						| 'Field'                |
						| 'Dimension структуры' |
					И в таблице "TreeFieldsБД" я перехожу к строке:
						| 'Field'        |
						| 'Organization' |
					И я нажимаю на кнопку с именем 'AddConditionItem'
					И в таблице "TreeПараметровFilterБД" я перехожу к строке:
						| 'Field'                                |
						| '[Dimension структуры].[Organization]' |
					И в таблице "TreeПараметровFilterБД" из выпадающего списка с именем "MethodВычисленияПараметра" я выбираю точное значение 'Organization Report_'
					И в таблице "TreeПараметровFilterБД" я завершаю редактирование строки											
				Иначе
					И в таблице 'TreeOfFilterParametersDB' я перехожу к строке:
						| 'Filter'         | 'Field'         |
						| 'Project Report_' | '[Dimension1]' |
					И я нажимаю на кнопку с именем 'TreeOfFilterParametersDBDelete'	
					И в таблице 'TreeOfFilterParametersDB' я перехожу к строке:
						| 'Filter'           | 'Field'         |
						| 'Scenario Report_' | '[Dimension2]' |
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
			Тогда открылось окно "Report wizard *"
			И я нажимаю на кнопку с именем 'WriteAndCollapse'

Сценарий: 05.04 Создание экземпляра отчета - "VA - Filling from PH (no history)" без записи 

	Если 'NOT $$ЭтоPerform$$' Тогда

		И Я создаю экземпляр отчета для вида отчета "VA - Filling from PH (no history)" сценарий "VA - Main scenario" период '1/1/2024' '3/31/2024' периодичность 'Month' организация "Mercury LLC" проект "VA - Main project" аналитики '' '' '' '' '' '' 
		
		* Документ должен быть пустой
			И табличный документ 'SpreadsheetFieldTemlate' равен:
				| "VA - Filling from PH (no history)" | ''               | ''                | ''             | ''      |
				| ''                                    | ''               | ''                | ''             | ''      |
				| ''                                    | "January 2024" | "February 2024" | "March 2024" | "TOTAL" |
				| ''                                    | "Amount"          | "Amount"           | "Amount"        | "Amount" |
				| "Cash flow items"                          | '0'              | '0'               | '0'            | '0'     |

		* Рассчитываем значения показателей	
			Когда открылось окно '$WindowTitle$'
			И я нажимаю на кнопку с именем 'FormFillByDefault'
			Тогда табличный документ 'SpreadsheetFieldTemlate' равен:
				| "VA - Filling from PH (no history)" | ''               | ''                | ''             | ''           |
				| ''                                    | ''               | ''                | ''             | ''           |
				| ''                                    | "January 2024" | "February 2024" | "March 2024" | "TOTAL"      |
				| ''                                    | "Amount"          | "Amount"           | "Amount"        | "Amount"      |
				| "Cash flow items"                          | '3,120,000'      | '16,000,000'      | '0'            | '19,120,000' |
				| "1Software upgrade "      | '0'              | '3,450,000'       | '0'            | '3,450,000'  |
				| "2Software implementation "    | '2,340,000'      | '7,350,000'       | '0'            | '9,690,000'  |
				| "3Software sale "   | '780,000'        | '5,200,000'       | '0'            | '5,980,000'  |

		* Закрываем без записи
			Когда открылось окно '$WindowTitle$'
			И Я закрываю окно '$WindowTitle$'
			Тогда открылось окно "1C:Enterprise"
			И я нажимаю на кнопку с именем 'Button1'

Сценарий: 05.05 Создание экземпляра отчета - "VA - Filling from PH (no history)" с записью 

	Если 'NOT $$ЭтоPerform$$' Тогда

		И Я создаю экземпляр отчета для вида отчета "VA - Filling from PH (no history)" сценарий "VA - Main scenario" период '1/1/2024' '3/31/2024' периодичность 'Month' организация "Mercury LLC" проект "VA - Main project" аналитики '' '' '' '' '' '' 

		* Документ должен быть пустой
			И табличный документ 'SpreadsheetFieldTemlate' равен:
				| "VA - Filling from PH (no history)" | ''               | ''                | ''             | ''      |
				| ''                                    | ''               | ''                | ''             | ''      |
				| ''                                    | "January 2024" | "February 2024" | "March 2024" | "TOTAL" |
				| ''                                    | "Amount"          | "Amount"           | "Amount"        | "Amount" |
				| "Cash flow items"                          | '0'              | '0'               | '0'            | '0'     |

		* Рассчитываем значения показателей	
			Когда открылось окно '$WindowTitle$'
			И я нажимаю на кнопку с именем 'FormFillByDefault'
			Тогда табличный документ 'SpreadsheetFieldTemlate' равен:
				| "VA - Filling from PH (no history)" | ''               | ''                | ''             | ''           |
				| ''                                    | ''               | ''                | ''             | ''           |
				| ''                                    | "January 2024" | "February 2024" | "March 2024" | "TOTAL"      |
				| ''                                    | "Amount"          | "Amount"           | "Amount"        | "Amount"      |
				| "Cash flow items"                          | '3,120,000'      | '16,000,000'      | '0'            | '19,120,000' |
				| "1Software upgrade "      | '0'              | '3,450,000'       | '0'            | '3,450,000'  |
				| "2Software implementation "    | '2,340,000'      | '7,350,000'       | '0'            | '9,690,000'  |
				| "3Software sale "   | '780,000'        | '5,200,000'       | '0'            | '5,980,000'  |

		* Записываем документ, проверяем движения
			Когда открылось окно '$WindowTitle$'
			И я нажимаю на кнопку с именем 'Write'
			И я жду открытия формы '$WindowTitle$' в течение 30 секунд

		* Проверяем движения
			И Движения документа ставли равны '\Макеты\05\ВА_ЗаполнениеИзРН_Движения_1.mxl'	
		
Сценарий: 05.06 Создаем формулу расчета с заполнением из РН по основной таблице

	Если 'NOT $$ЭтоPerform$$' Тогда

		И Я открываю контруктор отчета с именем "VA - Filling from PH (no history)"
					
		* Вводим формулу расчета
			* Создаем новый элемент	
				Тогда открылось окно "Report wizard"
				И из выпадающего списка с именем 'WorkMode' я выбираю точное значение "Indicators calculation formulas"
				И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R2C2'
				И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
				И в поле с именем 'TextDocumentFieldProcedure' я ввожу текст ' '
				И я нажимаю на кнопку с именем 'AddOperand1'
				Когда открылось окно "Data sources"
				И я нажимаю на кнопку с именем 'FormCreate'
			* Заполняем источник получения, проверяем заполнение полей				
				Когда открылось окно "Data source (create)"
				И из выпадающего списка с именем 'MethodOfObtaining' я выбираю точное значение "Current infobase accumulation register"
				Если '$$IsERPCPM$$' Тогда
					И из выпадающего списка с именем 'DBAccumulationRegister' я выбираю по строке 'BudgetsOperations'
				Иначе
					И из выпадающего списка с именем 'DBAccumulationRegister' я выбираю по строке 'CashFlowCPM'
				И я устанавливаю флаг с именем 'IsRegisterMainTable'						
				И у элемента с именем 'DBRegisterResource' я жду значения "Amount" в течение 10 секунд
				Тогда таблица 'FieldsTreeDB' стала равной по шаблону:
					| 'Field'                  |
					| 'Recorder'           |
					| 'Dimensions регистра(*)' |
					| 'Attributes регистра(*)' |
				Если '$$IsERPCPM$$' Тогда
					И из выпадающего списка с именем 'DBRegisterResource' я выбираю точное значение "Amount исполнено"										
					Когда открылось окно "Data source (create) *"
					И в таблице "TreeFieldsБД" я разворачиваю строку:
						| 'Field'                   |
						| 'Dimensions регистра(12)' |
					И в таблице "TreeFieldsБД" я разворачиваю строку:
						| 'Field'                      |
						| 'Dimension статей бюджетов' |
					И в таблице "TreeFieldsБД" я разворачиваю строку:
						| 'Field'           |
						| 'AssetRef бюджета' |
					И в таблице "TreeFieldsБД" я перехожу к строке:
						| 'Field'                                     |
						| 'Catalog.CashFlowReportItems' |
					И я выбираю пункт контекстного меню с именем 'ButtonMapDimensions' на элементе формы с именем "TableСоответствия"
					Тогда таблица "TableСоответствия" стала равной:
						| 'Dimension приемника'     | 'Method заполнения' | 'Name колонки'                                  | 'Kind аналитики' |
						| 'Dimension 1: ARTICLES__ Cash_Flow' | 'Field источника'    | '[Dimension статей бюджетов].[AssetRef бюджета]' | 'ARTICLES__ Cash_Flow'    |
				Иначе
					Тогда таблица 'ComplianceTable' стала равной:
						| 'Dimension приемника'     | 'Method заполнения' | 'Name колонки'                        | 'Kind аналитики' |
						| "Dimension 1: Cash flow items" | 'Field источника'    | '[AssetRef движения денежных средств]' | "Cash flow items"    |

			* Добавляем отборы
				И я перехожу к закладке с именем 'FiltersPage'	
				Когда открылось окно "Data source (create) *"
				И в таблице 'TreeOfFilterParametersDB' я перехожу к строке:
					| 'Filter'                      | 'Field'                      |
					| 'Date beginning периода Report_' | 'Date beginning отбора data_' |
				И в таблице 'TreeOfFilterParametersDB' из выпадающего списка с именем 'ParameterCalculationMethod' я выбираю точное значение "Start date of report period with a shift"
				И в таблице 'TreeOfFilterParametersDB' в поле с именем 'DefiningMethodClarification' я ввожу текст '-1'
				И в таблице 'TreeOfFilterParametersDB' я завершаю редактирование строки
				И в таблице 'TreeOfFilterParametersDB' я перехожу к строке:
					| 'Filter'                     | 'Field'                         |
					| 'Date end периода Report_' | 'Date окончания отбора data_' |
				И в таблице 'TreeOfFilterParametersDB' из выпадающего списка с именем 'ParameterCalculationMethod' я выбираю точное значение "Reporting period end date with a shift"
				И в таблице 'TreeOfFilterParametersDB' в поле с именем 'DefiningMethodClarification' я ввожу текст '-1'
				И в таблице 'TreeOfFilterParametersDB' я завершаю редактирование строки	
				Если '$$IsERPCPM$$' Тогда
					* Добавляем поля отбора
						И в таблице "TreeFieldsБД" я разворачиваю строку:
							| 'Field'                |
							| 'Dimension структуры' |
						И в таблице "TreeFieldsБД" я перехожу к строке:
							| 'Field'        |
							| 'Organization' |
						И я нажимаю на кнопку с именем 'AddConditionItem'
						И в таблице "TreeПараметровFilterБД" я перехожу к строке:
							| 'Field'                                |
							| '[Dimension структуры].[Organization]' |
						И в таблице "TreeПараметровFilterБД" из выпадающего списка с именем "MethodВычисленияПараметра" я выбираю точное значение 'Organization Report_'
						И в таблице "TreeПараметровFilterБД" я завершаю редактирование строки	

				Иначе	
					* Удаляем текущие отборы
						И в таблице 'TreeOfFilterParametersDB' я перехожу к строке:
							| 'Filter'         | 'Field'         |
							| 'Project Report_' | '[Dimension1]' |
						И я нажимаю на кнопку с именем 'TreeOfFilterParametersDBDelete'
						И в таблице 'TreeOfFilterParametersDB' я перехожу к строке:
							| 'Filter'           | 'Field'         |
							| 'Scenario Report_' | '[Dimension2]' |
						И я нажимаю на кнопку с именем 'TreeOfFilterParametersDBDelete'
						И в таблице 'TreeOfFilterParametersDB' я перехожу к строке:
							| 'Filter'         | 'Field'         |
							| "Report period" | '[Dimension3]' |
						И я нажимаю на кнопку с именем 'TreeOfFilterParametersDBDelete''			
				* Добавляем поля отбора
					Когда открылось окно "Data source (create) *"
					И в таблице 'FieldsTreeDB' я разворачиваю строку:
						| 'Field'        |
						| 'Recorder' |
					Если '$$IsERPCPM$$' Тогда
						И в таблице 'FieldsTreeDB' я перехожу к строке:
							| 'Field'                                              |
							| 'Document.BudgetingActualDataRecording' |
						И в таблице 'FieldsTreeDB' я разворачиваю текущую строку	
					И в таблице 'FieldsTreeDB' я разворачиваю строку:
						| 'Field'       |
						| 'Counterparty' |
					И в таблице 'FieldsTreeDB' я разворачиваю строку:
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
					И в таблице 'TreeOfFilterParametersDB' из выпадающего списка с именем 'DefiningMethodClarification' я выбираю по строке "LLC \"Ganymede\""
					И в таблице 'TreeOfFilterParametersDB' я завершаю редактирование строки
						
			* Записываем элемент
				Когда открылось окно "Data source (create) *"
				И я нажимаю на кнопку с именем 'FormWriteAndClose'
				И я жду закрытия окна "Data source (create) *" в течение 20 секунд
		
		* Выбираем элемент в форме конструктура			
			Тогда открылось окно "Data sources"
			И в таблице 'List' я выбираю текущую строку
			Тогда открылось окно "Report wizard *"
			И я нажимаю на кнопку с именем 'WriteAndCollapse'

Сценарий: 05.07 Настройка прав для пользователей

	Если 'NOT $$ЭтоPerform$$' Тогда

		И Я добавляю право "Read, write" для вида отчета "VA - Filling from PH (no history)" пользователя "Budgeting1" по всем организациям
		И я закрываю TestClient "CPM - Budget"
		И я подключаю TestClient "CPM - Budget" логин "Budgeting1" пароль ''			

Сценарий: 05.08 Создаем сводную таблицу

	Если 'NOT $$ЭтоPerform$$' Тогда

		И Я нахожу в списке вид отчета с именем "VA - Filling from PH (no history)"

		* Создаем сводную таблицу			
			Когда открылось окно "Report types and templates"
			И в таблице "List" я перехожу к строке:
				| 'Description'                                          |
				| 'DimenKind - FillType From_SSLy RН (Without истории) (pivot table)' |
			И я нажимаю на кнопку с именем 'SwitchToDataDisplayMode'
			И Открылась сводная таблица для вида отчета "VA - Filling from PH (no history)"
			И Я устанавливаю отборы сводной таблицы: дата начала '1/1/2024', дата конца '3/31/2024', валюта 'RUB', сценарий "VA - Main scenario", организация "Mercury LLC"
			И Я устанавливаю отбор сводной таблицы 'Project' со значением "VA - Main project"	
			Тогда табличный документ 'SpreadsheetFieldTemlate' равен:
				| 'DimenKind - FillType From_SSLy RН (Without истории) (pivot table)' | "January 2024" | "February 2024" | "March 2024" |
				| 'DimenKind - FillType From_SSLy RН (Without истории) (pivot table)' | "Amount"          | "Amount"           | "Amount"        |
				| "Cash flow items"                                            | '3,120,000'      | '16,000,000'      | '0'            |
				| "1Software upgrade"                         | '0'              | '3,450,000'       | '0'            |
				| "2Software implementation"                       | '2,340,000'      | '7,350,000'       | '0'            |
				| "3Software sale"                      | '780,000'        | '5,200,000'       | '0'            |
		
		* Рассчитываем по регламенту
			И Открылась сводная таблица для вида отчета "VA - Filling from PH (no history)"
			И я нажимаю на кнопку с именем 'RecalculateAccordingToRegulations'
			И я жду открытия формы '$WindowTitle$' в течение 30 секунд
			Тогда табличный документ 'SpreadsheetFieldTemlate' равен:
				| 'DimenKind - FillType From_SSLy RН (Without истории) (pivot table)' | "January 2024" | "February 2024" | "March 2024" |
				| 'DimenKind - FillType From_SSLy RН (Without истории) (pivot table)' | "Amount"          | "Amount"           | "Amount"        |
				| "Cash flow items"                                            | '0'              | '3,120,000'       | '0'            |
				| "2Software implementation"                       | '0'              | '2,340,000'       | '0'            |
				| "3Software sale"                      | '0'              | '780,000'         | '0'            |

		* Отменим транзакцию
			И я нажимаю на кнопку с именем 'CancelAction'
			Тогда табличный документ 'SpreadsheetFieldTemlate' равен:
				| 'DimenKind - FillType From_SSLy RН (Without истории) (pivot table)' | "January 2024" | "February 2024" | "March 2024" |
				| 'DimenKind - FillType From_SSLy RН (Without истории) (pivot table)' | "Amount"          | "Amount"           | "Amount"        |
				| "Cash flow items"                                            | '3,120,000'      | '16,000,000'      | '0'            |
				| "1Software upgrade"                         | '0'              | '3,450,000'       | '0'            |
				| "2Software implementation"                       | '2,340,000'      | '7,350,000'       | '0'            |
				| "3Software sale"                      | '780,000'        | '5,200,000'       | '0'            |								

		* Рассчитываем по правилу
			Когда открылось окно '$WindowTitle$'
			И я нажимаю на кнопку с именем 'RecalculateOther'
			Тогда открылось окно "Select method to calculate indicators"
			И я нажимаю на кнопку с именем 'FormSelect'
			И я жду открытия формы '$WindowTitle$' в течение 30 секунд
			Тогда табличный документ 'SpreadsheetFieldTemlate' равен:
				| 'DimenKind - FillType From_SSLy RН (Without истории) (pivot table)' | "January 2024" | "February 2024" | "March 2024" |
				| 'DimenKind - FillType From_SSLy RН (Without истории) (pivot table)' | "Amount"          | "Amount"           | "Amount"        |
				| "Cash flow items"                                            | '0'              | '3,120,000'       | '0'            |
				| "2Software implementation"                       | '0'              | '2,340,000'       | '0'            |
				| "3Software sale"                      | '0'              | '780,000'         | '0'            |

		* Сохраняем таблицу
			Когда открылось окно '$WindowTitle$'
			И Я закрываю окно '$WindowTitle$'
			Тогда открылось окно '1C:Предприятие'
			И я нажимаю на кнопку с именем 'Button0'

Сценарий: 05.09 Проверяем движения экземпляра отчета

	Если 'NOT $$ЭтоPerform$$' Тогда

		И Я открываю первый экземпляр отчета для вида отчета "VA - Filling from PH (no history)"
		И Открылся экземпляр отчета для вида отчета "VA - Filling from PH (no history)" валюта 'RUB' организация "Mercury LLC" сценарий "VA - Main scenario" периодичность "Month" проект "VA - Main project" аналитики '' '' '' '' '' '' 
		Тогда табличный документ 'SpreadsheetFieldTemlate' равен:
			| "VA - Filling from PH (no history)" | ''               | ''                | ''             | ''          |
			| ''                                    | ''               | ''                | ''             | ''          |
			| ''                                    | "January 2024" | "February 2024" | "March 2024" | "TOTAL"     |
			| ''                                    | "Amount"          | "Amount"           | "Amount"        | "Amount"     |
			| "Cash flow items"                          | '0'              | '3,120,000'       | '0'            | '3,120,000' |
			| "2Software implementation "    | '0'              | '2,340,000'       | '0'            | '2,340,000' |
			| "3Software sale "   | '0'              | '780,000'         | '0'            | '780,000'   |

		* Проверяем, движения после сводной таблицы
			Когда открылось окно '$WindowTitle$'
			И я нажимаю на кнопку с именем 'FormOpenDocumentRegisterRecordsFlatTab'
			Тогда открылось окно "Flat table of indicator values"
			И я жду когда в табличном документе 'ReportSpreadsheetDocument' заполнится ячейка 'R2C1' в течение 30 секунд
			Тогда табличный документ 'ReportSpreadsheetDocument' равен по шаблону:
				| "Filter:"                                  | "Report instance Equal to \"Report instance * from *\"" | ''       | ''                                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                    | ''                |
				| ''                                        | ''                                                   | ''       | ''                                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                    | ''                |
				| "Report indicator values synthetic"  | ''                                                   | ''       | ''                                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                    | ''                |
				| ''                                        | ''                                                   | ''       | ''                                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                    | ''                |
				| 'Factor'                              | ''                                                   | ''       | 'Value'                         | ''                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                    | ''                |
				| 'Version'                                  | "Report period"                                      | 'Currency' | ''                                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                    | ''                |
				| 'ARTICLES__ Cash_Flow сумма'                        | ''                                                   | ''       | ''                                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                    | ''                |
				| '*'                                       | "February 2024"                                    | 'RUB'    | '3,120,000.00000'                  | ''                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                    | ''                |
				| '*'                                       | "February 2024"                                    | 'USD'    | '41,949.7490*'                     | ''                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                    | ''                |
				| '*'                                       | "February 2024"                                    | 'EUR'    | '34,692.84049'                     | ''                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                    | ''                |
				| ''                                        | ''                                                   | ''       | ''                                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                    | ''                |
				| "Report indicators currency values"   | ''                                                   | ''       | ''                                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                    | ''                |
				| ''                                        | ''                                                   | ''       | ''                                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                    | ''                |
				| 'Factor'                              | ''                                                   | ''       | ''                                 | 'Value'         | 'Value валюта'  | ''                 | ''                 | ''                 | ''                 | ''                    | ''                |
				| 'Version'                                  | "Report period"                                      | 'Currency' | 'Dimension валюта'                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                    | ''                |
				| ''                                        | ''                                                   | ''       | ''                                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                    | ''                |
				| "Report indicator values 1"          | ''                                                   | ''       | ''                                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                    | ''                |
				| ''                                        | ''                                                   | ''       | ''                                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                    | ''                |
				| 'Factor'                              | ''                                                   | ''       | ''                                 | ''                 | 'Value'         | 'Value валюта'  | ''                 | ''                 | ''                 | ''                    | ''                |
				| 'Version'                                  | "Report period"                                      | 'Currency' | 'Dimension 1'                      | 'Dimension валюта' | ''                 | ''                 | ''                 | ''                 | ''                 | ''                    | ''                |
				| 'ARTICLES__ Cash_Flow сумма'                        | ''                                                   | ''       | ''                                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                    | ''                |
				| '*'                                       | "February 2024"                                    | 'RUB'    | "2Software implementation"  | ''                 | '2,340,000.00000'  | ''                 | ''                 | ''                 | ''                 | ''                    | ''                |
				| '*'                                       | "February 2024"                                    | 'RUB'    | "3Software sale" | ''                 | '780,000.00000'    | ''                 | ''                 | ''                 | ''                 | ''                    | ''                |
				| '*'                                       | "February 2024"                                    | 'USD'    | "2Software implementation"  | ''                 | '31,462.3117*'     | ''                 | ''                 | ''                 | ''                 | ''                    | ''                |
				| '*'                                       | "February 2024"                                    | 'USD'    | "3Software sale" | ''                 | '10,487.43726'     | ''                 | ''                 | ''                 | ''                 | ''                    | ''                |
				| '*'                                       | "February 2024"                                    | 'EUR'    | "2Software implementation"  | ''                 | '26,019.63037'     | ''                 | ''                 | ''                 | ''                 | ''                    | ''                |
				| '*'                                       | "February 2024"                                    | 'EUR'    | "3Software sale" | ''                 | '8,673.21012'      | ''                 | ''                 | ''                 | ''                 | ''                    | ''                |
				| ''                                        | ''                                                   | ''       | ''                                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                    | ''                |
				| "Report indicator values 2"          | ''                                                   | ''       | ''                                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                    | ''                |
				| ''                                        | ''                                                   | ''       | ''                                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                    | ''                |
				| 'Factor'                              | ''                                                   | ''       | ''                                 | ''                 | ''                 | 'Value'         | 'Value валюта'  | ''                 | ''                 | ''                    | ''                |
				| 'Version'                                  | "Report period"                                      | 'Currency' | 'Dimension 1'                      | 'Dimension 2'      | 'Dimension валюта' | ''                 | ''                 | ''                 | ''                 | ''                    | ''                |
				| ''                                        | ''                                                   | ''       | ''                                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                    | ''                |
				| "Report indicator values 3"          | ''                                                   | ''       | ''                                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                    | ''                |
				| ''                                        | ''                                                   | ''       | ''                                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                    | ''                |
				| 'Factor'                              | ''                                                   | ''       | ''                                 | ''                 | ''                 | ''                 | 'Value'         | 'Value валюта'  | ''                 | ''                    | ''                |
				| 'Version'                                  | "Report period"                                      | 'Currency' | 'Dimension 1'                      | 'Dimension 2'      | 'Dimension 3'      | 'Dimension валюта' | ''                 | ''                 | ''                 | ''                    | ''                |
				| ''                                        | ''                                                   | ''       | ''                                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                    | ''                |
				| "Report indicator values 4"          | ''                                                   | ''       | ''                                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                    | ''                |
				| ''                                        | ''                                                   | ''       | ''                                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                    | ''                |
				| 'Factor'                              | ''                                                   | ''       | ''                                 | ''                 | ''                 | ''                 | ''                 | 'Value'         | 'Value валюта'  | ''                    | ''                |
				| 'Version'                                  | "Report period"                                      | 'Currency' | 'Dimension 1'                      | 'Dimension 2'      | 'Dimension 3'      | 'Dimension4'       | 'Dimension валюта' | ''                 | ''                 | ''                    | ''                |
				| ''                                        | ''                                                   | ''       | ''                                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                    | ''                |
				| "Report indicator values 5"          | ''                                                   | ''       | ''                                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                    | ''                |
				| ''                                        | ''                                                   | ''       | ''                                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                    | ''                |
				| 'Factor'                              | ''                                                   | ''       | ''                                 | ''                 | ''                 | ''                 | ''                 | ''                 | 'Value'         | 'Value валюта'     | ''                |
				| 'Version'                                  | "Report period"                                      | 'Currency' | 'Dimension 1'                      | 'Dimension 2'      | 'Dimension 3'      | 'Dimension4'       | 'Dimension5'       | 'Dimension валюта' | ''                 | ''                    | ''                |
				| ''                                        | ''                                                   | ''       | ''                                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                    | ''                |
				| "Report indicator values 6"          | ''                                                   | ''       | ''                                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                    | ''                |
				| ''                                        | ''                                                   | ''       | ''                                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                    | ''                |
				| 'Factor'                              | ''                                                   | ''       | ''                                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                 | 'Value'            | 'Value валюта' |
				| 'Version'                                  | "Report period"                                      | 'Currency' | 'Dimension 1'                      | 'Dimension 2'      | 'Dimension 3'      | 'Dimension4'       | 'Dimension5'       | 'Dimension6'       | 'Dimension валюта' | ''                    | ''                |
				| ''                                        | ''                                                   | ''       | ''                                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                    | ''                |
				| "Report indicators non-numeric values" | ''                                                   | ''       | ''                                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                    | ''                |
				| ''                                        | ''                                                   | ''       | ''                                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                    | ''                |
				| 'Factor'                              | ''                                                   | ''       | ''                                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                 | 'Value нечисловое' | ''                |
				| 'Version'                                  | "Report period"                                      | 'Currency' | 'Dimension 1'                      | 'Dimension 2'      | 'Dimension 3'      | 'Dimension4'       | 'Dimension5'       | 'Dimension6'       | 'Dimension валюта' | ''                    | ''                |
				| ''                                        | ''                                                   | ''       | ''                                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                    | ''                |
				| 'Comments Values_ показателей'        | ''                                                   | ''       | ''                                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                    | ''                |
				| ''                                        | ''                                                   | ''       | ''                                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                    | ''                |
				| 'Factor'                              | ''                                                   | ''       | ''                                 | ''                 | ''                 | ''                 | ''                 | ''                 | ''                 | 'Comment'         | ''                |
				| 'Version'                                  | "Report period"                                      | 'Currency' | 'Dimension 1'                      | 'Dimension 2'      | 'Dimension 3'      | 'Dimension4'       | 'Dimension5'       | 'Dimension6'       | 'Dimension валюта' | ''                    | ''                |
			И Я закрываю окно "Flat table of indicator values"

		* Рассчитываем документ
			Когда открылось окно '$WindowTitle$'
			И я нажимаю на кнопку с именем 'FormFillByDefault'

		* Проверяем движения
			Когда открылось окно '$WindowTitle$'
			И я нажимаю на кнопку с именем 'FormOpenDocumentRegisterRecordsFlatTab'
			Тогда открылось окно "1C:Enterprise"
			И я нажимаю на кнопку с именем 'Button1'
			Когда открылось окно '$WindowTitle$'
			И я нажимаю на кнопку с именем 'Write'
			И я жду открытия формы '$WindowTitle$' в течение 30 секунд
			И Движения документа с реквизитами ставли равны '\Макеты\05\ВА_ЗаполнениеИзРН_Движения_2.mxl'
