#language: ru
@tree


Функционал: 18. Проверка ролевой модели в Бюджетировании

	Как Администратор я хочу
	Проверить что ролевая модель в Бюджетировании
	работают корректно

Контекст:
	
	И я закрыл все окна клиентского приложения

Сценарий: 18.00 Определение типа приложения

	И я закрываю TestClient "CPM - Budget"
	И я подключаю TestClient "CPM - Budget" логин "Administrator" пароль ''
	Пусть Инициализация переменных

	И Я включаю производительный режим работы ограничений на уровне записей
	
Сценарий: 18.01 Создание группы видов отчетов "VA - Checking access settings (group)"

	И Я создаю группу видов отчетов с именем "VA - Checking access settings (group)" и родителем "VA - Report group"

Сценарий: 18.02 Создание вида отчета "VA - Checking access settings (no)"	

	* Создаем вид отчета
		И Я создаю вид отчета с именем "VA - Checking access settings (no)" и родителем "VA - Checking access settings (group)"	

	* Настраиваем вид отчета
		И Я открываю вид отчета с именем "VA - Checking access settings (no)"
		И я устанавливаю флаг с именем 'ProjectSeparation'
		И я перехожу к закладке с именем 'DimensionsOfReport'
		И из выпадающего списка с именем 'DimensionKind1' я выбираю по строке "Company business units"
		И я нажимаю на кнопку с именем 'RecordButtonForm'
		Тогда открылось окно "Data restructuring"
		И я нажимаю на кнопку с именем 'FormOK'
		И я нажимаю на кнопку с именем 'EditTree'

	* Редактируем структуру отчета
		И Я в конструкторе отчета добавляю строку с именем "ReportLine"
		И Я в конструкторе отчета добавляю строку с именем "ReportLineХ2"
		И Я в конструкторе отчета добавляю колонку с именем "Amount"
		И Я в конструкторе отчета добавляю аналитику с кодом "VA0IEItems" в ячейку 'R3C3'

	* Настраиваем формулы
		Когда открылось окно "Report wizard"
		И из выпадающего списка с именем 'WorkMode' я выбираю точное значение "Indicators calculation formulas"
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке "R3C2"
		И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
		Когда открылось окно "Report wizard"
		И я нажимаю на кнопку с именем 'TotalByAccount1'
		Тогда открылось окно "Data source (create)"
		И из выпадающего списка с именем 'ReportTypeFilter' я выбираю по строке "VA - Checking access settings (no)"
		И я нажимаю кнопку выбора у поля с именем 'IndicatorFilter'
		Тогда открылось окно "Report indicators"
		И я меняю значение переключателя с именем 'IndicatorChoiceMode' на "Indicator list"
		Когда открылось окно "Report indicators"
		И в таблице 'List' я перехожу к строке по шаблону:
			| "Code"               | "Description"       |
			| "ReportLine_Amount*" | "ReportLine amount" |
		И в таблице 'List' я выбираю текущую строку
		Тогда открылось окно "Data source (create) *"
		И в таблице 'ComplianceTable' я активизирую поле с именем 'ComplianceTableFillingMethod'
		И в таблице 'ComplianceTable' из выпадающего списка с именем 'ComplianceTableFillingMethod' я выбираю точное значение "Fixed value"
		И в таблице 'ComplianceTable' я завершаю редактирование строки
		И в таблице 'ComplianceTable' я активизирую поле с именем 'MapTableDBAlias'
		И в таблице 'ComplianceTable' я выбираю текущую строку
		И Я в списке "Income and expense items" по полю "Description" ищу и выбираю элемент "2Software implementation" "Exact match"		
		Когда открылось окно "Data source (create) *"
		И я нажимаю на кнопку с именем 'FormWriteAndClose'
		И я жду закрытия окна "Data source (create) *" в течение 20 секунд
		Тогда открылось окно "Report wizard *"
		И в поле с именем 'TextDocumentFieldProcedure' я ввожу текст "[VACheckingAccessSettingsNo_ReportLine_Amount] * 2"
		И я нажимаю на кнопку с именем 'WriteAndCollapse'
		Когда открылось окно "Report wizard"
		И Я закрываю окно "Report wizard"

	И Я Для вида отчета "VA - Checking access settings (no)" создаю бланк по умолчанию
	И Я для вида отчета "VA - Checking access settings (no)" создаю бланк сводной таблицы по умолчанию с отборами "Company business units" "Project"

Структура сценария: 18.03 Копирование вида отчета "VA - Checking access settings (no)"

	* Открываем список
		И В командном интерфейсе я выбираю "Budgeting, reporting, and analysis" "Report types and templates"

	* Удаляем текущий элемент
		Тогда открылось окно "Report types and templates"
		И в таблице 'ReportKindList' я нажимаю на кнопку с именем 'ReportKindListFind'
		Тогда открылась форма с именем 'UniversalListFindExtForm'
		И из выпадающего списка с именем 'FieldSelector' я выбираю точное значение "Report type"
		И я меняю значение переключателя с именем 'CompareType' на "Anywhere in the line"
		И в поле с именем 'Pattern' я ввожу текст <ТекВидОтчета>
		И я нажимаю на кнопку с именем 'Find'
		И Пока в таблице 'ReportKindList' количество строк 'больше' 0 Тогда
			* Ставим пометку на удаление
					И Я удаляю текущую строку в списке 'ReportKindList'
						И я выбираю пункт контекстного меню с именем 'ReportKindListContextMenuSetDeletionMark' на элементе формы с именем 'ReportKindList'
						Тогда открылось окно "1C:Enterprise"
						Если элемент формы с именем 'Message' стал равен "Mark * for deletion?" по шаблону Тогда
								И я нажимаю на кнопку с именем 'Button0'
						Иначе
								И я нажимаю на кнопку с именем 'Button1'
						И я жду доступности элемента с именем 'ReportKindList' в течение 20 секунд
			* Перименовываем
				И Я запоминаю значение выражения '"Delete_" + StrReplace(New UUID, "-", "")' в переменную 'UID'
				И в таблице 'ReportKindList' я выбираю текущую строку
				Тогда открылось окно "* (Report types)"
				И в поле с именем 'Description' я ввожу значение переменной 'UID'
				И в поле с именем 'FullDescr' я ввожу значение переменной 'UID'
				И в поле с именем 'Code' я ввожу значение переменной 'UID'
				И в поле с именем 'Parent' я ввожу текст ''
				И я нажимаю на кнопку с именем 'FormWriteAndClose'
				И я жду закрытия окна "* (Report types)" в течение 20 секунд

	* Ищем отчет для копирования
		Тогда открылось окно "Report types and templates"
		И в таблице 'ReportKindList' я нажимаю на кнопку с именем 'ReportKindListFind'
		Тогда открылась форма с именем 'UniversalListFindExtForm'
		И из выпадающего списка с именем 'FieldSelector' я выбираю точное значение "Report type"
		И я меняю значение переключателя с именем 'CompareType' на "Anywhere in the line"
		И в поле с именем 'Pattern' я ввожу текст "VA - Checking access settings (no)"
		И я нажимаю на кнопку с именем 'Find'
		Тогда в таблице 'ReportKindList' количество строк "равно" 1
		Когда открылось окно "Report types and templates"
		И я выбираю пункт контекстного меню с именем 'ReportKindListContextMenuCopy' на элементе формы с именем 'ReportKindList'
		Тогда открылось окно "Copy report type"
		И я нажимаю на кнопку с именем 'FormOK'
		Когда открылось окно "Report types (create)"
		И в поле с именем 'Description' я ввожу текст <ТекВидОтчета>
		И в поле с именем 'FullDescr' я ввожу текст <ТекВидОтчета>
		И я нажимаю на кнопку с именем 'FormWriteAndClose'
		И я жду закрытия окна "Report types (create) *" в течение 20 секунд

	* Создаем бланк сводной таблицы
		// ДОДЕЛАТЬ: Бланки должны корректно копироваться вместе с видом отчета	
		Когда открылось окно "Report types and templates"
		И в таблице 'ReportKindList' я нажимаю на кнопку с именем 'ReportKindListFind'
		Тогда открылась форма с именем 'UniversalListFindExtForm'
		И из выпадающего списка с именем 'FieldSelector' я выбираю точное значение "Report type"
		И я меняю значение переключателя с именем 'CompareType' на "Anywhere in the line"
		И в поле с именем 'Pattern' я ввожу текст <ТекВидОтчета>
		И я нажимаю на кнопку с именем 'Find'
		Когда открылось окно "Report types and templates"
		Тогда в таблице 'ReportKindList' количество строк "равно" 1				
		И в таблице 'List' я перехожу к строке:
			| "Description"                                           |
			| "VA - Checking access settings (no) (pivot table)" |
		И в таблице 'List' я выбираю текущую строку	
		Когда открылось окно "Pivot table template: *"
		И я нажимаю на кнопку с именем 'ShowListOfRows'
		Тогда открылось окно "Set up line list"
		И в таблице 'TreeOfSelectedLines' я перехожу к строке по шаблону:
			| "Code"         | "Report line" |
			| "ReportLine*" | "ReportLine"  |
		И я нажимаю на кнопку с именем 'Delete'
		И я нажимаю на кнопку с именем 'Delete'
		И я нажимаю на кнопку с именем 'MoveLeftAll'
		И я нажимаю на кнопку с именем 'ApplyTheChanges'
		Тогда открылось окно "Pivot table template: *"
		И я нажимаю на кнопку с именем 'ShowListOfColumns'
		Тогда открылось окно "Set up column list"
		И в таблице 'PivotTableColumnsListSettings' я нажимаю на кнопку с именем 'PivotTableColumnsListSettingsDelete'
		И в таблице 'PivotTableColumnsListSettings' я нажимаю на кнопку с именем 'PivotTableColumnsListSettingsPopulateColumns'
		И я нажимаю на кнопку с именем 'FormApply'
		Тогда открылось окно "Pivot table template: *"
		И я нажимаю на кнопку с именем 'FormWriteAndClose'
		И я жду закрытия окна "Pivot table template: *" в течение 20 секунд	

Примеры:
	| ТекВидОтчета                              |
	| "VA - Checking access settings (record)" |
	| "VA - Checking access settings (reading)" |

Структура сценария: 18.04 Создание шаблонов корректировки значений показателей

	И Я создаю шаблон корректировки значений показателей с имененм <ТекВидОтчета> и видами отчетов
		| "Report type"   |
		| <ТекВидОтчета> |

	И Для шаблона корректировки значений показателей с имененм <ТекВидОтчета> я заполняю таблицу корректировок значениями
		| "Report type"   | "Indicator"           |
		| <ТекВидОтчета> | "ReportLine amount"   |
		| <ТекВидОтчета> | "ReportLineХ2 amount" |

Примеры:
	| ТекВидОтчета                              |
	| "VA - Checking access settings (no)"    |
	| "VA - Checking access settings (record)" |
	| "VA - Checking access settings (reading)" |

Структура сценария: 18.05 Создание корректировок значений показателей

	И Я создаю корректировку значений показателей сценарий "VA - Main scenario" период "January 2024" периодичность "Month" организация <ТекОрганизация> значения
		| "Report type"   | "Indicator"         | "Company"    | "Report period"  | "Dimension 1"   | "Project"               | "Adjustment" |
		| <ТекВидОтчета> | "ReportLine amount" | <ТекОрганизация> | "January 2024" | "Administration" | "VA - Main project" | "20.00000"      |

Примеры:
	| ТекВидОтчета                              | ТекОрганизация |
	| "VA - Checking access settings (no)"    | "Mercury LLC" |
	| "VA - Checking access settings (record)" | "Mercury LLC" |
	| "VA - Checking access settings (reading)" | "Venus LLC"   |
	| "VA - Checking access settings (reading)" | "System LLC"  |

Сценарий: 18.06 Создание двойного шаблона корректировки значений показателей	

	И Я создаю шаблон корректировки значений показателей с имененм "VA - Checking access settings (some)" и видами отчетов
		| "Report type"                              |
		| "VA - Checking access settings (no)"    |
		| "VA - Checking access settings (record)" |

	И Для шаблона корректировки значений показателей с имененм "VA - Checking access settings (some)" я заполняю таблицу корректировок значениями
		| "Report type"                              | "Indicator"         |
		| "VA - Checking access settings (no)"    | "ReportLine amount" |
		| "VA - Checking access settings (record)" | "ReportLine amount" |

Сценарий: 18.07 Создание двойной корректировки значений показателей	

	И Я открываю новую корректировку значений показателей сценарий "VA - Main scenario" период "January 2024" периодичность "Month" организация "Mercury LLC"

	Когда открылось окно "Indicator value adjustment (create) *"
	И из выпадающего списка с именем 'TemplateOfAdjustment' я выбираю по строке "VA - Checking access settings (some)"
	И в таблице 'KeyAttributes' я нажимаю на кнопку с именем 'KeyAttributesPopulateKeyAttributes'
	Тогда открылось окно "Attribute population form"
	И из выпадающего списка с именем 'Organization' я выбираю точное значение "Mercury LLC"
	И из выпадающего списка с именем 'ReportPeriod' я выбираю по строке "January 2024"
	И я нажимаю на кнопку с именем 'FormOK'
	Тогда открылось окно "Indicator value adjustment (create) *"
	И в таблице 'TableOfAdjustments' я нажимаю на кнопку с именем 'FillFromTemplate'
	// ДОДЕЛАТЬ: При заполнении по шаблону нет возможности указать аналитику вида отчета и проект
	И я нажимаю на кнопку с именем 'FormPostAndClose'
	И я жду закрытия окна "Indicator value adjustment (create) *" в течение 20 секунд	

Структура сценария: 18.08 Создание экземпляров отчетов

	И Я создаю экземпляр отчета для вида отчета <ТекВидОтчета> сценарий "VA - Main scenario" период '1/1/2024' '3/31/2024' периодичность "Month" организация <ТекОрганизация> проект "VA - Main project" аналитики "Administration" '' '' '' '' ''
	Дано Табличный документ 'SpreadsheetFieldTemlate' равен макету '\\Макеты\18\ВА_ПроверкаНастроекДоступа_20.mxl'
	И Я ввожу значение '100' в ячейку 'R6C2'	
	Дано Табличный документ 'SpreadsheetFieldTemlate' равен макету '\\Макеты\18\ВА_ПроверкаНастроекДоступа_100.mxl'
	И я нажимаю на кнопку с именем 'WriteAndClose'
	И я жду закрытия окна '$WindowTitle$' в течение 20 секунд

Примеры:
	| ТекВидОтчета                              | ТекОрганизация |
	| "VA - Checking access settings (no)"    | "Mercury LLC" |
	| "VA - Checking access settings (record)" | "Mercury LLC" |
	| "VA - Checking access settings (reading)" | "Venus LLC"   |
	| "VA - Checking access settings (reading)" | "System LLC"  |

Сценарий: 18.09 Настройка прав для пользователей

	// Группа доступа "VA - Budgeting (Edit)", организации - все
	И Я добавляю право "Read, write" для вида отчета "VA - Checking access settings (record)" пользователя "Budgeting1" по всем организациям
	И Я добавляю право "Read" для вида отчета "VA - Checking access settings (reading)" пользователя "Budgeting1" по всем организациям

	// Группа доступа "VA - Budgeting (Edit)", организации - все
	И Я добавляю право "Read, write" для вида отчета "VA - Checking access settings (record)" пользователя "Budgeting2" организации "Mercury LLC" 
	И Я добавляю право "Read" для вида отчета "VA - Checking access settings (reading)" пользователя "Budgeting2" организации "Venus LLC"

	// Группа доступа "VA - Budgeting (View)", организации - "Mercury LLC" и "Venus LLC"
	И Я добавляю право "Read, write" для вида отчета "VA - Checking access settings (record)" пользователя "Budgeting3" организации "Mercury LLC" 

	И я закрываю сеанс текущего клиента тестирования

Сценарий: 18.10 Проверка видов отчетов для "Budgeting1"
	
	И я подключаю TestClient "CPM - Budget" логин "Budgeting1" пароль ''

	* Отчета "ВА - Проверка настроек доступа (нет)" не должно быть в списке
		И В командном интерфейсе я выбираю "Budgeting, reporting, and analysis" "Report types and templates"
		Тогда открылось окно "Report types and templates"
		И в таблице 'ReportKindList' я нажимаю на кнопку с именем 'ReportKindListFind'
		Тогда открылась форма с именем 'UniversalListFindExtForm'
		И из выпадающего списка с именем 'FieldSelector' я выбираю точное значение "Report type"
		И я меняю значение переключателя с именем 'CompareType' на "Anywhere in the line"
		И в поле с именем 'Pattern' я ввожу текст "VA - Checking access settings (no)"
		И я нажимаю на кнопку с именем 'Find'				
		Тогда в таблице 'ReportKindList' количество строк "равно" 0
				
	* Ищем отчет "ВА - Проверка настроек доступа (запись)"
		И в таблице 'ReportKindList' я нажимаю на кнопку с именем 'ReportKindListFind'
		Тогда открылась форма с именем 'UniversalListFindExtForm'
		И из выпадающего списка с именем 'FieldSelector' я выбираю точное значение "Report type"
		И я меняю значение переключателя с именем 'CompareType' на "Anywhere in the line"
		И в поле с именем 'Pattern' я ввожу текст "VA - Checking access settings (record)"
		И я нажимаю на кнопку с именем 'Find'				
		Тогда в таблице 'ReportKindList' количество строк "равно" 1	
		И Я закрываю окно "Report types and templates"

Сценарий: 18.11 Проверка корректировок значений покзаталей для "Budgeting1"

	И я подключаю TestClient "CPM - Budget" логин "Budgeting1" пароль ''

	* Открываем список с отборами
		И В командном интерфейсе я выбираю "Budgeting, reporting, and analysis" "Indicator value adjustment"
		Когда открылось окно "Indicator value adjustment"
		И я нажимаю на кнопку с именем 'FormListSettings'
		И Я устанавливаю отбор в форме списка "Synthetic adjustment.Report type.Description" "Contains" "VA - Checking access settings"
		Когда открылось окно "Indicator value adjustment"
		И я нажимаю на кнопку с именем 'FormListSettings'
		И Я добавляю отбор в форме списка "Deletion mark" "Equal to" "No"

	* Проверяем состав списка
		Тогда Таблица 'List' содержит '4' строк из списка:
			| "Company"  | "Scenario"               | "Adjustment template"                       | "Adjustment input method" |
			| "Mercury LLC" | "VA - Main scenario" | ""                                           | "Manual entry"                |
			| "Venus LLC"   | "VA - Main scenario" | ""                                           | "Manual entry"                |
			| "System LLC"  | "VA - Main scenario" | ""                                           | "Manual entry"                |
			| "Mercury LLC" | "VA - Main scenario" | "VA - Checking access settings (some)" | "Manual entry"                |

	* Открываем документ без доступа
		И в таблице 'List' я перехожу к строке:
			| "Company"  | "Scenario"               | "Adjustment template"                       | "Adjustment input method" |
			| "Mercury LLC" | "VA - Main scenario" | "VA - Checking access settings (some)" | "Manual entry"                |
		И в таблице 'List' я выбираю текущую строку
		Тогда открылось окно "Indicator value adjustment"
		Тогда в логе сообщений TestClient есть строки:
			|"Insufficient access rights to view the document.\nCheck settings in Report type access matrix."|
		И я очищаю окно сообщений пользователю
		
	* Отменяем проведение документа без доступа
		И я выбираю пункт контекстного меню с именем 'ListContextMenuUndoPosting' на элементе формы с именем 'List'
		Тогда открылось окно "1C:Enterprise"
		И я нажимаю на кнопку с именем 'OK'
		Тогда в логе сообщений TestClient есть строки:
			|"Insufficient access rights to save the document.\nCheck settings in Report type access matrix."|
		И я очищаю окно сообщений пользователю	

	* Открываем документ с доступом
		Когда открылось окно "Indicator value adjustment"
		И в таблице 'List' я перехожу к строке:
			| "Company"  | "Scenario"               | "Adjustment template" | "Adjustment input method" |
			| "Mercury LLC" | "VA - Main scenario" | ""                     | "Manual entry"                |
		И в таблице 'List' я выбираю текущую строку
		Тогда открылось окно "Indicator value adjustment *"
		И я нажимаю на кнопку с именем 'FormPostAndClose'
		И я жду закрытия окна "Indicator value adjustment *" в течение 20 секунд
		И в логе сообщений TestClient нет строки "*"

	* Открываем документ с доступом на чтение
		Когда открылось окно "Indicator value adjustment"
		И в таблице 'List' я перехожу к строке:
			| "Company" | "Scenario"               | "Adjustment template" | "Adjustment input method" |
			| "Venus LLC"  | "VA - Main scenario" | ""                     | "Manual entry"                |
		И в таблице 'List' я выбираю текущую строку
		Тогда открылось окно "Indicator value adjustment *"									
		И я нажимаю на кнопку с именем 'FormPostAndClose'
		Тогда открылось окно "1C:Enterprise"
		И я нажимаю на кнопку с именем 'OK'
		Тогда в логе сообщений TestClient есть строки:
			|"Insufficient access rights to save the document.\nCheck settings in Report type access matrix."|
		И я закрываю окно "Indicator value adjustment *"					
		
	* Снимаем отборы
		Когда открылось окно "Indicator value adjustment"
		И я нажимаю на кнопку с именем 'FormListSettings'			
		И Я снимаю все отборы в форме списка			

Сценарий: 18.12 Проверка экземпляров отчетов для "Budgeting1"

	И я подключаю TestClient "CPM - Budget" логин "Budgeting1" пароль ''

	* Ищем экземпляры отчетов	
		И В командном интерфейсе я выбираю "Budgeting, reporting, and analysis" "Report instances"
		И Я в списке "Report instances" по полю "Report type" ищу элемент "VA - Checking access settings" "At beginning of line"
		И я нажимаю кнопку очистить у поля с именем 'SavedSetting'
		Тогда таблица 'List' содержит "3" строк из списка:
			| "Report type"                              | "Company"  | "Report period"  | "End period" | "Scenario"               | "State" | "Project"               | "Dimension 1"   | "Dimension 2" | "Dimension 3" | "Dimension 4" | "Dimension 5" | "Dimension 6" | "Primary currency" | "External infobase" |
			| "VA - Checking access settings (reading)" | "System LLC"  | "January 2024" | "March 2024"     | "VA - Main scenario" | "Draft"  | "VA - Main project" | "Administration" | ''            | ''            | ''            | ''            | ''            | "RUB"             | ''           |
			| "VA - Checking access settings (reading)" | "Venus LLC"   | "January 2024" | "March 2024"     | "VA - Main scenario" | "Draft"  | "VA - Main project" | "Administration" | ''            | ''            | ''            | ''            | ''            | "RUB"             | ''           |
			| "VA - Checking access settings (record)" | "Mercury LLC" | "January 2024" | "March 2024"     | "VA - Main scenario" | "Draft"  | "VA - Main project" | "Administration" | ''            | ''            | ''            | ''            | ''            | "RUB"             | ''           |

	* Открываем документ с доступом на запись
		И в таблице 'List' я перехожу к строке:
			| "Report type"                              | "Company"  | "Report period"  | "End period" | "Scenario"               | "State" | "Project"               | "Dimension 1"   | "Primary currency" |
			| "VA - Checking access settings (record)" | "Mercury LLC" | "January 2024" | "March 2024"     | "VA - Main scenario" | "Draft"  | "VA - Main project" | "Administration" | "RUB"             |
		И в таблице 'List' я выбираю текущую строку
		И Открылся экземпляр отчета для вида отчета "VA - Checking access settings (record)" валюта "RUB" организация "Mercury LLC" сценарий "VA - Main scenario" периодичность 'Month' проект "VA - Main project" аналитики "Administration" '' '' '' '' '' 
		Дано Табличный документ 'SpreadsheetFieldTemlate' равен макету '\\Макеты\18\ВА_ПроверкаНастроекДоступа_100.mxl'
		И я нажимаю на кнопку с именем 'FormVersionsManagement'
		Тогда открылось окно "Indicator version management"
		И я нажимаю на кнопку с именем 'ListDeleteVersions'
		Тогда открылось окно "1C:Enterprise"
		И я нажимаю на кнопку с именем 'Button0'
		Тогда открылось окно "Indicator version management *"
		И Я закрываю окно "Indicator version management *"
		И открылось окно '$WindowTitle$'	
		Дано Табличный документ 'SpreadsheetFieldTemlate' равен макету '\\Макеты\18\ВА_ПроверкаНастроекДоступа_20.mxl'
		И я нажимаю на кнопку с именем 'EnableEdit'				
		И Я ввожу значение '100' в ячейку 'R6C2'
		Дано Табличный документ 'SpreadsheetFieldTemlate' равен макету '\\Макеты\18\ВА_ПроверкаНастроекДоступа_100.mxl'
		И я нажимаю на кнопку с именем 'WriteAndClose'
		И я жду закрытия окна '$WindowTitle$' в течение 20 секунд
		Когда открылось окно "Report instances"
		И в таблице 'List' я выбираю текущую строку
		И открылось окно '$WindowTitle$'
		Дано Табличный документ 'SpreadsheetFieldTemlate' равен макету '\\Макеты\18\ВА_ПроверкаНастроекДоступа_100.mxl'
		И я закрываю окно '$WindowTitle$'
				
	* Открываем документ с доступом на чтение
		Когда открылось окно "Report instances"
		И в таблице 'List' я перехожу к строке:
			| "Report type"                              | "Company" | "Report period"  | "End period" | "Scenario"               | "State" | "Project"               | "Dimension 1"   | "Primary currency" |
			| "VA - Checking access settings (reading)" | "Venus LLC"  | "January 2024" | "March 2024"     | "VA - Main scenario" | "Draft"  | "VA - Main project" | "Administration" | "RUB"             |
		И в таблице 'List' я выбираю текущую строку
		И Открылся экземпляр отчета для вида отчета "VA - Checking access settings (reading)" валюта "RUB" организация "Venus LLC" сценарий "VA - Main scenario" периодичность 'Month' проект "VA - Main project" аналитики "Administration" '' '' '' '' '' 
		Дано Табличный документ 'SpreadsheetFieldTemlate' равен макету '\\Макеты\18\ВА_ПроверкаНастроекДоступа_100.mxl'
		И элемент формы с именем 'EnableEdit' не доступен
		И я закрываю окно '$WindowTitle$'

	* Помечаем на удаление документ
		Когда открылось окно "Report instances"
		И я выбираю пункт контекстного меню с именем 'ListContextMenuSetDeletionMark' на элементе формы с именем 'List'
		Тогда открылось окно "1C:Enterprise"
		И я нажимаю на кнопку с именем 'Button0'
		Когда открылось окно "1C:Enterprise"
		И я нажимаю на кнопку с именем 'OK'				
		Тогда в логе сообщений TestClient есть строки:
			|"Insufficient access rights to save the document.\nCheck settings in Report type access matrix."|				

Сценарий: 18.13 Проверка формы настроек экземпляров отчетов для "Budgeting1"

	И я подключаю TestClient "CPM - Budget" логин "Budgeting1" пароль ''

	И Я открываю первый экземпляр отчета для вида отчета "VA - Checking access settings (record)"

	* Проверяем форму настроек
		И я нажимаю на кнопку с именем 'FormOpenSettings'
		Когда открылось окно "Settings документа"
		И я нажимаю на кнопку открытия поля с именем 'ReportKind'
		Тогда открылось окно "VA - Checking access settings (record) (Report types)"
		И Я закрываю окно "VA - Checking access settings (record) (Report types)"
		Тогда открылось окно "Settings документа"
		И я нажимаю на кнопку открытия поля с именем 'TemplateОтчета'
		Тогда открылось окно "Template VA - Checking access settings (N/A) report type: VA - Checking access settings (record)"
		И Я закрываю окно "Template VA - Checking access settings (N/A) report type: VA - Checking access settings (record)"
		Тогда открылось окно "Settings документа"
		И я нажимаю на кнопку открытия поля с именем 'Project'
		Тогда открылось окно "VA - Main project (Projects and phases)"
		И Я закрываю окно "VA - Main project (Projects and phases)"
		Тогда открылось окно "Settings документа"
		И я нажимаю на кнопку открытия поля с именем 'Dimension1'
		Когда открылось окно "Administration (Department)"
		И Я закрываю окно "Administration (Department)"
		Тогда открылось окно "Settings документа"
		И я нажимаю на кнопку открытия поля с именем 'Scenario'
		Тогда открылось окно "Scenarios: VA - Main scenario (Scenarios)"
		И Я закрываю окно "Scenarios: VA - Main scenario (Scenarios)"
		Тогда открылось окно "Settings документа"
		И я нажимаю на кнопку открытия поля с именем 'PeriodManagement'
		Тогда открылось окно "January * г. - March * г. (Frequency: Month) <VA - Main scenario>"
		И Я закрываю окно "January * г. - March * г. (Frequency: Month) <VA - Main scenario>"
		Тогда открылось окно "Settings документа"
		И я нажимаю на кнопку открытия поля с именем 'Organization'
		Тогда открылось окно "Mercury LLC (Business unit*)"
		И Я закрываю окно "Mercury LLC (Business unit*)"
		Тогда открылось окно "Settings документа"
		И я нажимаю на кнопку открытия поля с именем 'Regulation'
		Тогда открылось окно "VA - Main regulations from * (Regulation for preparing reports)"
		И Я закрываю окно "VA - Main regulations from * (Regulation for preparing reports)"
		Тогда открылось окно "Settings документа"
		И я нажимаю на кнопку открытия поля с именем 'MainCurrency'
		Тогда открылось окно "RUB (Currency)"
		И Я закрываю окно "RUB (Currency)"
		Тогда открылось окно "Settings документа"
		И я перехожу к закладке с именем 'GroupPageReportSettings'
		И я нажимаю на кнопку открытия поля с именем 'ProcessingRule'
		Тогда открылось окно "VA - Checking access settings (no) (Calculation rules)"
		И Я закрываю окно "VA - Checking access settings (no) (Calculation rules)"
		Тогда открылось окно "Settings документа"
		И я нажимаю на кнопку открытия поля с именем 'UsedIB'
		Тогда открылось окно "Current infobase (External infobases)"
		И Я закрываю окно "Current infobase (External infobases)"
		Тогда открылось окно "Settings документа"
		И я нажимаю на кнопку открытия поля с именем 'CheckRule'
		Тогда открылось окно "VA - Checking access settings (no) (Правила проверки)"
		И Я закрываю окно "VA - Checking access settings (no) (Правила проверки)"

	* Меняем период
		Тогда открылось окно "Settings документа"
		И я нажимаю на кнопку с именем 'ChangePeriod'
		Тогда открылось окно "Select period"
		И в поле с именем 'DateBegin' я ввожу текст '1/1/2023'
		И в поле с именем 'DateEnd' я ввожу текст '3/31/2023'
		И я нажимаю на кнопку с именем 'select'
		И открылось окно "Settings документа *"
		Тогда в логе сообщений TestClient есть строки:
			|"Not удалось определить document управления отчетным периодом to параметрам:\n	Scenario: \"VA - Main scenario\",\n	Period: \"January 2023 г.\""|
		И я очищаю окно сообщений пользователю
		Тогда элемент формы с именем 'PeriodManagement' стал равен ""
		Тогда элемент формы с именем 'Organization' стал равен ""	
		Тогда элемент формы с именем 'Periodicity' стал равен "Month"
		Тогда элемент формы с именем 'ReportPeriod' стал равен ""	
		Тогда элемент формы с именем 'PeriodОкончания' стал равен ""	
		Тогда элемент формы с именем 'Regulation' стал равен ""	
		Тогда элемент формы с именем 'MainCurrency' стал равен ""			

	* Выбрием документ управления периодом
		Тогда открылось окно "Settings документа *"
		И я нажимаю кнопку выбора у поля с именем 'PeriodManagement'
		Тогда открылось окно "Reporting period management"
		И в таблице 'List' я перехожу к строке:
			| "Scenario"               | "Start period"  | "Period окончание" | "Frequency" | "Regulation"               |
			| "VA - Main scenario" | "January 2024" | "March 2024"     | "Month"         | "VA - Main regulations" |
		И в таблице 'List' я выбираю текущую строку
		И элемент формы с именем 'AdditionalCurrencies' стал равен "USD; EUR"
		И элемент формы с именем 'Organization' стал равен ""
		И элемент формы с именем 'MainCurrency' стал равен "RUB"
		И элемент формы с именем 'Periodicity' стал равен "Month"
		И элемент формы с именем 'PeriodОкончания' стал равен "March 2024"
		И элемент формы с именем 'ReportPeriod' стал равен "January 2024"
		И элемент формы с именем 'Regulation' стал равен "VA - Main regulations"
		И элемент формы с именем 'Scenario' стал равен "VA - Main scenario"
		И элемент формы с именем 'PeriodManagement' стал равен "January 2024 г. - March 2024 г. (Frequency: Month) <VA - Main scenario>"

	* Очищаем сценарий
		Когда открылось окно "Settings документа *"
		И я нажимаю кнопку очистить у поля с именем 'Scenario'
		Тогда элемент формы с именем 'PeriodManagement' стал равен ""		
		Тогда элемент формы с именем 'Periodicity' стал равен "Month"
		Тогда элемент формы с именем 'ReportPeriod' стал равен ""	
		Тогда элемент формы с именем 'PeriodОкончания' стал равен ""	
		Тогда элемент формы с именем 'Regulation' стал равен ""	
		Тогда элемент формы с именем 'MainCurrency' стал равен ""	

	* Выбираем сценарий
		Когда открылось окно "Settings документа *"
		И из выпадающего списка с именем 'Scenario' я выбираю по строке "VA - Main scenario"
		Тогда элемент формы с именем 'Dimension1' стал равен "Administration"
		И элемент формы с именем 'AdditionalCurrencies' стал равен "USD; EUR"
		И элемент формы с именем 'MainCurrency' стал равен "RUB"
		И элемент формы с именем 'Periodicity' стал равен "Month"
		И элемент формы с именем 'PeriodОкончания' стал равен "March 2024"
		И элемент формы с именем 'ReportPeriod' стал равен "January 2024"
		И элемент формы с именем 'Regulation' стал равен "VA - Main regulations"
		И элемент формы с именем 'Scenario' стал равен "VA - Main scenario"
		И элемент формы с именем 'PeriodManagement' стал равен "January 2024 г. - March 2024 г. (Frequency: Month) <VA - Main scenario>"

	* Закрываем формы
		Когда открылось окно "Settings документа *"
		И Я закрываю окно "Settings документа *"
		Тогда открылось окно "1C:Enterprise"
		И я нажимаю на кнопку с именем 'Button1'
		Тогда открылось окно "Report instance *"
		И Я закрываю окно "Report instance *"
		
	И я закрываю сеанс текущего клиента тестирования

Сценарий: 18.14 Проверка корректировок значений покзаталей для "Budgeting2"

	И я подключаю TestClient "CPM - Budget" логин "Budgeting2" пароль ''

	* Открываем список с отборами
		И В командном интерфейсе я выбираю "Budgeting, reporting, and analysis" "Indicator value adjustment"
		Когда открылось окно "Indicator value adjustment"
		И я нажимаю на кнопку с именем 'FormListSettings'
		И Я устанавливаю отбор в форме списка "Synthetic adjustment.Report type.Description" "Contains" "VA - Checking access settings"
		Когда открылось окно "Indicator value adjustment"
		И я нажимаю на кнопку с именем 'FormListSettings'
		И Я добавляю отбор в форме списка "Deletion mark" "Equal to" "No"

	* Проверяем состав списка
		Тогда Таблица 'List' содержит '3' строк из списка:
			| "Company"  | "Scenario"               | "Adjustment template"                       | "Adjustment input method" |
			| "Mercury LLC" | "VA - Main scenario" | ""                                           | "Manual entry"                |
			| "Venus LLC"   | "VA - Main scenario" | ""                                           | "Manual entry"                |
			| "Mercury LLC" | "VA - Main scenario" | "VA - Checking access settings (some)" | "Manual entry"                |
		
	* Снимаем отборы
		Когда открылось окно "Indicator value adjustment"
		И я нажимаю на кнопку с именем 'FormListSettings'			
		И Я снимаю все отборы в форме списка

Сценарий: 18.15 Проверка экземпляров отчетов для "Budgeting2"

	И я подключаю TestClient "CPM - Budget" логин "Budgeting2" пароль ''

	* Ищем экземпляры отчетов	
		И В командном интерфейсе я выбираю "Budgeting, reporting, and analysis" "Report instances"
		И Я в списке "Report instances" по полю "Report type" ищу элемент "VA - Checking access settings" "At beginning of line"
		И я нажимаю кнопку очистить у поля с именем 'SavedSetting'				
		Тогда таблица 'List' содержит "2" строк из списка:
			| "Report type"                              | "Company"  | "Report period"  | "End period" | "Scenario"               | "State" | "Project"               | "Dimension 1"   | "Dimension 2" | "Dimension 3" | "Dimension 4" | "Dimension 5" | "Dimension 6" | "Primary currency" | "External infobase" |
			| "VA - Checking access settings (reading)" | "Venus LLC"   | "January 2024" | "March 2024"     | "VA - Main scenario" | "Draft"  | "VA - Main project" | "Administration" | ''            | ''            | ''            | ''            | ''            | "RUB"             | ''           |
			| "VA - Checking access settings (record)" | "Mercury LLC" | "January 2024" | "March 2024"     | "VA - Main scenario" | "Draft"  | "VA - Main project" | "Administration" | ''            | ''            | ''            | ''            | ''            | "RUB"             | ''           |
	
	* Создаем отчет по организации, к которой нет доступа
		И в таблице 'List' я перехожу к строке:
			| "Report type"                              | "Company"  | "Report period"  | "End period" | "Scenario"               | "Project"               | "Dimension 1"   |
			| "VA - Checking access settings (record)" | "Mercury LLC" | "January 2024" | "March 2024"     | "VA - Main scenario" | "VA - Main project" | "Administration" |
		И я выбираю пункт контекстного меню с именем 'ListContextMenuCopy' на элементе формы с именем 'List'
		Тогда открылось окно "Specify key document attributes"
		И я нажимаю кнопку выбора у поля с именем 'Organization'
		И Я выбираю организацию "System LLC"
		И я нажимаю на кнопку с именем 'FormApplyANDClose'
		Тогда открылось окно "Specify key document attributes *"
		Тогда в логе сообщений TestClient есть строки:
			|"У toльзователя Budgeting2\nотсутствуют права for просмотр бланка VA - Revision forстроек доступа (N/A) to организации System LLC.\nВыберите другой бланк."|
		Когда открылось окно "Specify key document attributes *"
		И Я закрываю окно "Specify key document attributes *"
		Тогда открылось окно "Report instances"

Сценарий: 18.16 Проверка СТ для пользователя "Budgeting2"

	И я подключаю TestClient "CPM - Budget" логин "Budgeting2" пароль ''

	* Проверяем сводную таблицу с правами на запись
		И В командном интерфейсе я выбираю "Budgeting, reporting, and analysis" "Pivot table"
		Тогда открылось окно "Pivot table: *"			
		И я нажимаю на гиперссылку с именем 'FilterHeading'
		И в поле с именем 'Form' я ввожу текст ""				
		И я нажимаю кнопку выбора у поля с именем 'Form'
		Тогда открылось окно "Report types and templates"
		И в таблице 'ReportKindList' я нажимаю на кнопку с именем 'ReportKindListRefresh'
		И в таблице 'ReportKindList' я нажимаю на кнопку с именем 'ReportKindListFind'
		Тогда открылось окно "Find"
		И из выпадающего списка с именем 'FieldSelector' я выбираю точное значение "Report type"
		И я меняю значение переключателя с именем 'CompareType' на "At beginning of line"
		И в поле с именем 'Pattern' я ввожу текст "VA - Checking access settings (record)"
		И я нажимаю на кнопку с именем 'Find'
		Тогда открылось окно "Report types and templates"
		И в таблице 'List' я перехожу к строке:
			| "Description"                                           |
			| "VA - Checking access settings (no) (pivot table)" |
		И я нажимаю на кнопку с именем 'ListChoose'
		Тогда открылось окно "Pivot table: *"
		И я нажимаю кнопку выбора у поля с именем 'PivotTableVariant'
		Тогда открылось окно "Pivol table options"
		И в таблице 'List' я выбираю текущую строку
		И из выпадающего списка с именем 'WorkMode' я выбираю точное значение "Main"
		И я нажимаю на кнопку с именем 'ChangePeriod'
		Тогда открылось окно "Select period"
		И в поле с именем 'DateBegin' я ввожу текст '1/1/2024'
		И я перехожу к следующему реквизиту
		И в поле с именем 'DateEnd' я ввожу текст '3/31/2024'
		И я нажимаю на кнопку с именем 'select'
		Тогда Открылась сводная таблица для вида отчета "VA - Checking access settings (no)"
		Тогда открылось окно '$WindowTitle$'
		И из выпадающего списка с именем 'DisplayCurrency' я выбираю точное значение 'RUB'
		И из выпадающего списка с именем 'Item_Scenario' я выбираю по строке "VA - Main scenario"
		И из выпадающего списка с именем 'Item_Organization' я выбираю по строке "Mercury LLC"
		И из выпадающего списка с именем 'Item_Project' я выбираю по строке "VA - Main project"
		И из выпадающего списка "Company business units" я выбираю по строке "Administration"
		И я нажимаю на кнопку с именем 'UpdateTabData1'
		И я жду открытия формы '$WindowTitle$' в течение 20 секунд
		Дано Табличный документ 'SpreadsheetFieldTemlate' равен макету '\\Макеты\18\ВА_ПроверкаНастроекДоступа_СТ_100.mxl'
		И я нажимаю на кнопку с именем 'VersionsManagement'
		Тогда открылось окно "Indicator version management"
		И я нажимаю на кнопку с именем 'ListDeleteVersions'
		Тогда открылось окно "1C:Enterprise"
		И я нажимаю на кнопку с именем 'Button0'
		Тогда открылось окно "Indicator version management *"
		И Я закрываю окно "Indicator version management *"
		Тогда открылось окно '$WindowTitle$'
		Дано Табличный документ 'SpreadsheetFieldTemlate' равен макету '\\Макеты\18\ВА_ПроверкаНастроекДоступа_СТ_20.mxl'
		И Я ввожу значение '100' в ячейку 'R4C2'
		И я нажимаю на кнопку с именем 'Apply'
		Тогда открылось окно '$WindowTitle$'
		И я нажимаю на кнопку с именем 'UpdateTabData'
		Дано Табличный документ 'SpreadsheetFieldTemlate' равен макету '\\Макеты\18\ВА_ПроверкаНастроекДоступа_СТ_100.mxl'

	* Проверяем сводную таблицу без прав
		И Я устанавливаю отбор сводной таблицы 'Item_Organization' со значением "Venus LLC"
		Когда открылось окно '$WindowTitle$'
		И Я закрываю окно '$WindowTitle$'
		И В командном интерфейсе я выбираю "Budgeting, reporting, and analysis" "Pivot table"
		Когда открылось окно '$WindowTitle$'	
		И я жду недоступности элемента с именем 'SpreadsheetFieldTemlate' в течение 20 секунд	
		Дано Табличный документ 'SpreadsheetFieldTemlate' равен макету '\\Макеты\18\ВА_ПроверкаНастроекДоступа_НетДоступа.mxl'	

	* Проверяем сводную таблицу с правами на чтение
		Когда открылось окно "Pivot table: *"
		И я нажимаю на гиперссылку с именем 'FilterHeading'
		И я нажимаю кнопку выбора у поля с именем 'Form'
		Тогда открылось окно "Report types and templates"
		И в таблице 'ReportKindList' я нажимаю на кнопку с именем 'ReportKindListFind'
		Тогда открылось окно "Find"
		И из выпадающего списка с именем 'FieldSelector' я выбираю точное значение "Report type"
		И я меняю значение переключателя с именем 'CompareType' на "At beginning of line"
		И в поле с именем 'Pattern' я ввожу текст "VA - Checking access settings (reading)"
		И я нажимаю на кнопку с именем 'Find'
		Тогда открылось окно "Report types and templates"
		И в таблице 'List' я перехожу к строке:
			| "Description"                                           |
			| "VA - Checking access settings (no) (pivot table)" |
		И я нажимаю на кнопку с именем 'ListChoose'
		Тогда Открылась сводная таблица для вида отчета "VA - Checking access settings (no)"
		И я нажимаю кнопку выбора у поля с именем 'PivotTableVariant'
		Тогда открылось окно "Pivol table options"
		И в таблице 'List' я выбираю текущую строку
		И я нажимаю на кнопку с именем 'UpdateTabData1'
		И я жду открытия формы '$WindowTitle$' в течение 20 секунд
		Дано Табличный документ 'SpreadsheetFieldTemlate' равен макету '\\Макеты\18\ВА_ПроверкаНастроекДоступа_СТ_100.mxl'								
		И Я ввожу значение '200' в ячейку 'R4C3'
		Дано Табличный документ 'SpreadsheetFieldTemlate' равен макету '\\Макеты\18\ВА_ПроверкаНастроекДоступа_СТ_100.mxl'		

	И я закрываю сеанс текущего клиента тестирования		
								
Сценарий: 18.17 Проверка корректировок значений покзаталей для "Budgeting3"

	И я подключаю TestClient "CPM - Budget" логин "Budgeting3" пароль ''

	* Открываем список с отборами
		И В командном интерфейсе я выбираю "Budgeting, reporting, and analysis" "Indicator value adjustment"
		Когда открылось окно "Indicator value adjustment"
		И я нажимаю на кнопку с именем 'FormListSettings'
		И Я устанавливаю отбор в форме списка "Synthetic adjustment.Report type.Description" "Contains" "VA - Checking access settings"
		Когда открылось окно "Indicator value adjustment"
		И я нажимаю на кнопку с именем 'FormListSettings'
		И Я добавляю отбор в форме списка "Deletion mark" "Equal to" "No"

	* Проверяем состав списка
		Тогда Таблица 'List' содержит '2' строк из списка:
			| "Company"  | "Scenario"               | "Adjustment template"                       | "Adjustment input method" |
			| "Mercury LLC" | "VA - Main scenario" | ""                                           | "Manual entry"                |
			| "Mercury LLC" | "VA - Main scenario" | "VA - Checking access settings (some)" | "Manual entry"                |

	* Открываем документ без доступа
		И в таблице 'List' я перехожу к строке:
			| "Company"  | "Scenario"               | "Adjustment template"                       | "Adjustment input method" |
			| "Mercury LLC" | "VA - Main scenario" | "VA - Checking access settings (some)" | "Manual entry"                |
		И в таблице 'List' я выбираю текущую строку
		Тогда открылось окно "Indicator value adjustment"
		Тогда в логе сообщений TestClient есть строки:
			|"Insufficient access rights to view the document.\nCheck settings in Report type access matrix."|
		И я очищаю окно сообщений пользователю
		И элемент формы с именем 'ListContextMenuUndoPosting' отсутствует на форме

	* Открываем документ с доступом на чтение
		Когда открылось окно "Indicator value adjustment"
		И в таблице 'List' я перехожу к строке:
			| "Company"  | "Scenario"               | "Adjustment template" | "Adjustment input method" |
			| "Mercury LLC" | "VA - Main scenario" | ""                     | "Manual entry"                |
		И в таблице 'List' я выбираю текущую строку
		Тогда открылось окно "Indicator value adjustment *"
		И элемент формы с именем 'FormPostAndClose' отсутствует на форме
		И я закрываю окно "Indicator value adjustment *"
		
	* Снимаем отборы
		Когда открылось окно "Indicator value adjustment"
		И я нажимаю на кнопку с именем 'FormListSettings'			
		И Я снимаю все отборы в форме списка	

Сценарий: 18.18 Проверка экземпляров отчетов и формы настроек для "Budgeting3"
	
	И я подключаю TestClient "CPM - Budget" логин "Budgeting3" пароль ''

	* Ищем экземпляры отчетов	
		И В командном интерфейсе я выбираю "Budgeting, reporting, and analysis" "Report instances"
		И Я в списке "Report instances" по полю "Report type" ищу элемент "VA - Checking access settings" "At beginning of line"
		И я нажимаю кнопку очистить у поля с именем 'SavedSetting'
		Если '$$IsERPCPM$$' Тогда
			И Я запоминаю в переменную 'NameDepartments' значение "Administration"
		Иначе
			И Я запоминаю в переменную 'NameDepartments' значение "<Object not found> (*)"				
		Тогда таблица 'List' стала равной по шаблону: 
			| "Report type"                              | "Company"  | "Report period"  | "End period" | "Scenario"               | "State" | "Project"               | "Dimension 1"        | "Dimension 2" | "Dimension 3" | "Dimension 4" | "Dimension 5" | "Dimension 6" | "Primary currency" | "External infobase" |
			| "VA - Checking access settings (record)" | "Mercury LLC" | "January 2024" | "March 2024"     | "VA - Main scenario" | "Draft"  | "VA - Main project" | '$NameDepartments$' | ''            | ''            | ''            | ''            | ''            | "RUB"             | ''           |
	
	* Открываем документ с правами на чтение
		Когда открылось окно "Report instances"
		И в таблице 'List' я выбираю текущую строку
		И Открылся экземпляр отчета для вида отчета "VA - Checking access settings (record)" валюта "RUB" организация "Mercury LLC" сценарий "VA - Main scenario" периодичность 'Month' проект "VA - Main project" аналитики '$NameDepartments$' '' '' '' '' '' 					
		Дано Табличный документ 'SpreadsheetFieldTemlate' равен макету '\\Макеты\18\ВА_ПроверкаНастроекДоступа_100.mxl'
		И элемент формы с именем 'EnableEdit' отсутствует на форме
		Когда открылось окно '$WindowTitle$'
		Попытка
			И из выпадающего списка с именем 'DisplayCurrency' я выбираю точное значение "USD"
			И я нажимаю на кнопку с именем 'WriteAndClose'
		Исключение	
			И я нажимаю на кнопку с именем 'FormOpenSettings'
	
	* Проверяем форму настроек
		Когда открылось окно "Settings документа"
		И я нажимаю на кнопку открытия поля с именем 'ReportKind'
		Тогда открылось окно "VA - Checking access settings (record) (Report types)"
		И Я закрываю окно "VA - Checking access settings (record) (Report types)"
		Тогда открылось окно "Settings документа"
		И я нажимаю на кнопку открытия поля с именем 'TemplateОтчета'
		Тогда открылось окно "Template VA - Checking access settings (N/A) report type: VA - Checking access settings (record)"
		И Я закрываю окно "Template VA - Checking access settings (N/A) report type: VA - Checking access settings (record)"
		Тогда открылось окно "Settings документа"
		И я нажимаю на кнопку открытия поля с именем 'Project'
		Тогда открылось окно "VA - Main project (Projects and phases)"
		И Я закрываю окно "VA - Main project (Projects and phases)"
		Тогда открылось окно "Settings документа"
		И я нажимаю на кнопку открытия поля с именем 'Dimension1'
		Если '$$IsERPCPM$$' Тогда
			Когда открылось окно "Administration (Department)"
			И Я закрываю окно "Administration (Department)"
		Иначе			
			Тогда открылось окно "1C:Enterprise"
			И я нажимаю на кнопку с именем 'OK'
		Тогда открылось окно "Settings документа"
		И я нажимаю на кнопку открытия поля с именем 'Scenario'
		Тогда открылось окно "Scenarios: VA - Main scenario (Scenarios)"
		И Я закрываю окно "Scenarios: VA - Main scenario (Scenarios)"
		Тогда открылось окно "Settings документа"
		И я нажимаю на кнопку открытия поля с именем 'PeriodManagement'
		Тогда открылось окно "January * г. - March * г. (Frequency: Month) <VA - Main scenario>"
		И Я закрываю окно "January * г. - March * г. (Frequency: Month) <VA - Main scenario>"
		Тогда открылось окно "Settings документа"
		И я нажимаю на кнопку открытия поля с именем 'Organization'
		Тогда открылось окно "Mercury LLC (Business unit*)"
		И Я закрываю окно "Mercury LLC (Business unit*)"
		Тогда открылось окно "Settings документа"
		И я нажимаю на кнопку открытия поля с именем 'Regulation'
		Тогда открылось окно "VA - Main regulations from * (Regulation for preparing reports)"
		И Я закрываю окно "VA - Main regulations from * (Regulation for preparing reports)"
		Тогда открылось окно "Settings документа"
		И я нажимаю на кнопку открытия поля с именем 'MainCurrency'
		Тогда открылось окно "RUB (Currency)"
		И Я закрываю окно "RUB (Currency)"
		Тогда открылось окно "Settings документа"
		И я перехожу к закладке с именем 'GroupPageReportSettings'
		И я нажимаю на кнопку открытия поля с именем 'ProcessingRule'
		Тогда открылось окно "VA - Checking access settings (no) (Calculation rules)"
		И Я закрываю окно "VA - Checking access settings (no) (Calculation rules)"
		Тогда открылось окно "Settings документа"
		И я нажимаю на кнопку открытия поля с именем 'UsedIB'
		Тогда открылось окно "Current infobase (External infobases)"
		И Я закрываю окно "Current infobase (External infobases)"
		Тогда открылось окно "Settings документа"
		И я нажимаю на кнопку открытия поля с именем 'CheckRule'
		Тогда открылось окно "VA - Checking access settings (no) (Правила проверки)"
		И Я закрываю окно "VA - Checking access settings (no) (Правила проверки)"

	* Меняем период
		Тогда открылось окно "Settings документа"
		Попытка
			И я нажимаю на кнопку с именем 'ChangePeriod'
		Исключение
			И я закрываю форму "Settings документа"

	Когда открылось окно '$WindowTitle$'
	И я закрываю окно '$WindowTitle$'
		
Сценарий: 18.19 Проверка СТ для пользователя "Budgeting3"

	И я подключаю TestClient "CPM - Budget" логин "Budgeting3" пароль ''

	* Проверяем сводную таблицу с правами на чтение
		И В командном интерфейсе я выбираю "Budgeting, reporting, and analysis" "Pivot table"
		Тогда открылось окно "Pivot table: *"			
		И я нажимаю на гиперссылку с именем 'FilterHeading'
		И в поле с именем 'Form' я ввожу текст ""	
		И я нажимаю кнопку выбора у поля с именем 'Form'
		Тогда открылось окно "Report types and templates"
		И в таблице 'ReportKindList' я нажимаю на кнопку с именем 'ReportKindListRefresh'
		И в таблице 'ReportKindList' я нажимаю на кнопку с именем 'ReportKindListFind'
		Тогда открылось окно "Find"
		И из выпадающего списка с именем 'FieldSelector' я выбираю точное значение "Report type"
		И я меняю значение переключателя с именем 'CompareType' на "At beginning of line"
		И в поле с именем 'Pattern' я ввожу текст "VA - Checking access settings (record)"
		И я нажимаю на кнопку с именем 'Find'
		Тогда открылось окно "Report types and templates"
		И в таблице 'List' я перехожу к строке:
			| "Description"                                           |
			| "VA - Checking access settings (no) (pivot table)" |
		И я нажимаю на кнопку с именем 'ListChoose'
		Тогда открылось окно "Pivot table: *"
		И я нажимаю кнопку выбора у поля с именем 'PivotTableVariant'
		Тогда открылось окно "Pivol table options"
		И в таблице 'List' я выбираю текущую строку
		И из выпадающего списка с именем 'WorkMode' я выбираю точное значение "Main"
		И я нажимаю на кнопку с именем 'ChangePeriod'
		Тогда открылось окно "Select period"
		И в поле с именем 'DateBegin' я ввожу текст '1/1/2024'
		И я перехожу к следующему реквизиту
		И в поле с именем 'DateEnd' я ввожу текст '3/31/2024'
		И я нажимаю на кнопку с именем 'select'
		Тогда Открылась сводная таблица для вида отчета "VA - Checking access settings (no)"
		Тогда открылось окно '$WindowTitle$'
		И из выпадающего списка с именем 'DisplayCurrency' я выбираю точное значение 'RUB'
		И из выпадающего списка с именем 'Item_Scenario' я выбираю по строке "VA - Main scenario"
		И из выпадающего списка с именем 'Item_Organization' я выбираю по строке "Mercury LLC"
		И из выпадающего списка с именем 'Item_Project' я выбираю по строке "VA - Main project"
		И я нажимаю на кнопку с именем 'UpdateTabData1'
		И я жду открытия формы '$WindowTitle$' в течение 20 секунд
		Дано Табличный документ 'SpreadsheetFieldTemlate' равен макету '\\Макеты\18\ВА_ПроверкаНастроекДоступа_СТ_Пустой.mxl'
		И Я ввожу значение '100' в ячейку 'R4C2'
		Дано Табличный документ 'SpreadsheetFieldTemlate' равен макету '\\Макеты\18\ВА_ПроверкаНастроекДоступа_СТ_Пустой.mxl'

	* Проверяем сводную таблицу без прав
		И Я устанавливаю отбор сводной таблицы 'Item_Organization' со значением "Venus LLC"
		Когда открылось окно '$WindowTitle$'
		И Я закрываю окно '$WindowTitle$'
		И В командном интерфейсе я выбираю "Budgeting, reporting, and analysis" "Pivot table"
		Когда открылось окно '$WindowTitle$'	
		И я жду недоступности элемента с именем 'SpreadsheetFieldTemlate' в течение 20 секунд	
		Дано Табличный документ 'SpreadsheetFieldTemlate' равен макету '\\Макеты\18\ВА_ПроверкаНастроекДоступа_НетДоступа.mxl'	

Сценарий: 18.20 Тест интерфейса для пользователя "Budgeting3" - Панель разделов и функций

	И я подключаю TestClient "CPM - Budget" логин "Budgeting3" пароль ''

	* Панель разделов
		И панель разделов равна
			| "Quick menu" |
			| "Budgeting, reporting, and analysis" |

	* Панель функций
		Если '$$IsERPCPM$$' Тогда
			И Я запоминаю в переменную 'CompanyName' значение "Companies"
		Иначе
			И Я запоминаю в переменную 'CompanyName' значение "Business units"
			
		Когда В панели разделов я выбираю "Budgeting, reporting, and analysis"
		И панель функций равна
			| "Report types and templates" | // Важное
			| "Report instances" |
			| "Pivot table" |
			| "Reporting period management" | // Основное
			| "Indicator version management" |
			| "Periodic exchange rates" |
			| "Indicator value adjustment" |
			| "Indicator value adjustments templates" |
			| "Budgeting classifiers" | // Подсистемы
			| "Investment projects" |
			| "Reports" |
			| "Tools" |
			| "Regulations for preparing reports" | // Классификаторы бюджетирования
			| "Scenarios" |
			| '$CompanyName$' |
			| "Periods" |
			| "Dimension types (corporate)" |
			| "Arbitrary classifier" |
			| "Projects and phases" | // Инвестиционные проекты			
			| "Organizational regulation structures" | // Отчеты
			| "Report on report indicator links" |
			| "Graphic report link report" |
			| "Network diagram of project group" |
			| "Copy values indicators отчетов" | // Сервис
			| "Compare spreadsheet documents" |

	И я закрываю сеанс текущего клиента тестирования					

Сценарий: 18.21 Тест интерфейса для пользователя "Budgeting1" - Панель разделов и функций

	И я подключаю TestClient "CPM - Budget" логин "Budgeting1" пароль ''

	* Панель разделов
		И панель разделов равна
			| "Quick menu" |
			| "Budgeting, reporting, and analysis" |

	* Панель функций
		Если '$$IsERPCPM$$' Тогда
			И Я запоминаю в переменную 'CompanyName' значение "Companies"
		Иначе
			И Я запоминаю в переменную 'CompanyName' значение "Business units"

		Когда В панели разделов я выбираю "Budgeting, reporting, and analysis"
		И панель функций равна
			| "Report types and templates" | // Важное
			| "Report instances" |
			| "Pivot table" |
			| "Reporting period management" | // Основное
			| "Indicator version management" |
			| "Periodic exchange rates" |
			| "Indicator value adjustment" |
			| "Indicator value adjustments templates" |
			| "Budgeting classifiers" | // Подсистемы
			| "Investment projects" |
			| "Reports" |
			| "Tools" |
			| "Regulations for preparing reports" | // Классификаторы бюджетирования
			| "Scenarios" |
			| '$CompanyName$' |
			| "Periods" |
			| "Dimension types (corporate)" |
			| "Arbitrary classifier" |
			| "Projects and phases" | // Инвестиционные проекты	
			| "Матрица экземпляров отчетов" | // Отчеты
			| "Organizational regulation structures" | 		
			| "Report on report indicator links" |
			| "Graphic report link report" |
			| "Network diagram of project group" |
			| "Copy values indicators отчетов" | // Сервис
			| "Compare spreadsheet documents" |	

Сценарий: 18.22 Тест интерфейса для пользователя "Budgeting1" - Персональные настройки

	И я подключаю TestClient "CPM - Budget" логин "Budgeting1" пароль ''

	Если '$$IsERPCPM$$' Тогда

		* Пользователь
			И В командном интерфейсе я выбираю "Quick menu" "Personal settings"
			Тогда открылось окно "Мои настройки"
			И я нажимаю на кнопку с именем 'UserInfo'
			Тогда открылось окно "Budgeting1 (User)"
			И В текущем окне я нажимаю кнопку командного интерфейса "Setup options"
			И В текущем окне я нажимаю кнопку командного интерфейса "Access rights"
			И В текущем окне я нажимаю кнопку командного интерфейса "Settings"
			И Я закрываю окно "Budgeting1 (User)"

		* Мои настройки
			Когда открылось окно "Мои настройки"
			И я снимаю флаг с именем 'AskConfirmationOnExit'
			И Я закрываю окно "Мои настройки"

		* Мои настройки еще раз	
			И В командном интерфейсе я выбираю "Quick menu" "Personal settings"
			Тогда элемент формы с именем 'AskConfirmationOnExit' стал равен "No"

		* Закрываем форму	
			И Я закрываю окно "Мои настройки"					

	Иначе

		* Персональные настройки
			И В командном интерфейсе я выбираю "Quick menu" "Personal settings"
			Когда открылось окно "Personal settings"

			И из выпадающего списка с именем 'MainProjectCPM' я выбираю по строке "VA - Main project"
			И из выпадающего списка с именем 'MainCFRCPM' я выбираю по строке "Mercury LLC"
			Если 'NOT $$ЭтоPerform$$' Тогда
				И из выпадающего списка с именем 'MainCompany' я выбираю по строке "Mercury LLC"
				И из выпадающего списка с именем 'MainVATRate' я выбираю точное значение "20%"
				И я устанавливаю флаг с именем 'ShowGLAccountsINДокументах'
			И я снимаю флаг с именем 'AskConfirmationOnExit'				
			Когда открылось окно "Personal settings *"				
			И я нажимаю на кнопку с именем 'FormWriteAndClose'
			И В командном интерфейсе я выбираю "Quick menu" "Personal settings"
			Тогда элемент формы с именем 'AuthorizedUser' стал равен "Budgeting1"
			И у элемента формы с именем 'CPMMainLanguage' текст редактирования стал равен "Main language"
			И элемент формы с именем 'MainProjectCPM' стал равен "VA - Main project"
			И элемент формы с именем 'MainCFRCPM' стал равен "Mercury LLC"						
			Если 'NOT $$ЭтоPerform$$' Тогда
				И элемент формы с именем 'MainCompany' стал равен "Mercury LLC"
				// ДОДЕЛАТЬ: Ошибка БП
				//И элемент формы с именем 'MainVATRate' стал равен "20%"
				И элемент формы с именем 'ShowGLAccountsINДокументах' стал равен "Yes"
			Тогда элемент формы с именем 'AskConfirmationOnExit' стал равен "No"
			
		* Пользователь
			Когда открылось окно "Personal settings"
			И я нажимаю на гиперссылку с именем 'AuthorizedUser'				
			Тогда открылось окно "Budgeting1 (User)"
			И В текущем окне я нажимаю кнопку командного интерфейса "Setup options"
			Если 'NOT $$ЭтоPerform$$' Тогда
				И В текущем окне я нажимаю кнопку командного интерфейса "Контактные лица"
			И В текущем окне я нажимаю кнопку командного интерфейса "Access rights"
			И В текущем окне я нажимаю кнопку командного интерфейса "Settings"
			И Я закрываю окно "Budgeting1 (User)"

		* Прокси сервер	
			Тогда открылось окно "Personal settings"
			И я нажимаю на кнопку с именем 'ProxyServerParameters'
			Тогда открылось окно "Proxy server parameters"
			И я меняю значение переключателя с именем 'ProxyServerUseCases' на "Do not use proxy server"
			И я нажимаю на кнопку с именем 'OK'

		* Настройки сканирования
			Тогда открылось окно "Personal settings"
			И я нажимаю на кнопку с именем 'ScanningSettings'
			Тогда открылось окно "Install add-in"
			И я нажимаю на кнопку с именем 'Close'
		
		Тогда открылось окно "Personal settings"
		И я нажимаю на кнопку с именем 'FormWriteAndClose'
		И я жду закрытия окна "Personal settings" в течение 20 секунд

Сценарий: 18.23 Тест интерфейса для пользователя "Budgeting1" - Виды отчетов, экземпляры отчетов, сводная таблица

	И я подключаю TestClient "CPM - Budget" логин "Budgeting1" пароль ''

	И В командном интерфейсе я выбираю "Budgeting, reporting, and analysis" "Report types and templates"
	Тогда открылось окно "Report types and templates"

	* Ищем отчет "ВА - Проверка настроек доступа (запись)"
		И в таблице 'ReportKindList' я нажимаю на кнопку с именем 'ReportKindListFind'
		Тогда открылась форма с именем 'UniversalListFindExtForm'
		И из выпадающего списка с именем 'FieldSelector' я выбираю точное значение "Report type"
		И я меняю значение переключателя с именем 'CompareType' на "Anywhere in the line"
		И в поле с именем 'Pattern' я ввожу текст "VA - Checking access settings (record)"
		И я нажимаю на кнопку с именем 'Find'				
		Тогда в таблице 'ReportKindList' количество строк "равно" 1	
		
	* Недоступность элементов, на которые нет прав
		Когда открылось окно "Report types and templates"
		И элемент формы с именем 'DoOpenDesigner' отсутствует на форме
		И элемент формы с именем 'CreateReportInstanceTemplate' отсутствует на форме
		И элемент формы с именем 'ListCreatePivotTabTemplate' отсутствует на форме
		И элемент формы с именем 'ListSetDefaultReportTemplate' отсутствует на форме
		
	* Список бланков
		И в таблице 'List' я перехожу к строке:
			| "Description"                         |
			| "VA - Checking access settings (no)" |
		И я нажимаю на кнопку с именем 'MagazineForm'
		Тогда открылось окно "Report instances"
		И Я закрываю окно "Report instances"
		Тогда открылось окно "Report types and templates"
		И я нажимаю на кнопку с именем 'SwitchToDataDisplayMode'
		Тогда открылось окно "VA - Checking access settings (no) (View mode)"
		И Я закрываю окно "VA - Checking access settings (no) (View mode)"
		Тогда открылось окно "Report types and templates"

	* Список экземпляров отчетов
		И в таблице 'ReportKindList' я нажимаю на кнопку с именем 'ReportKindListOpenInstancesList'
		Тогда открылось окно "Report instances"
		И я устанавливаю флаг с именем 'UseScenario'
		И я нажимаю кнопку выбора у поля с именем 'FilteringByScenario'
		Тогда открылось окно "Value list"
		И в таблице 'ValueList' из выпадающего списка с именем 'value' я выбираю по строке "VA - Main scenario"
		И я нажимаю на кнопку с именем 'OK'
		Тогда открылось окно "Report instances"
		И в таблице 'Companies' я перехожу к строке:
			| "Value"    | "Use" |
			| "System LLC" | "No"          |
		И в таблице 'Companies' я разворачиваю текущую строку
		И в таблице 'Companies' я перехожу к строке:
			| "Value"     | "Use" |
			| "Mercury LLC" | "No"          |
		И в таблице 'Companies' я устанавливаю флаг с именем 'CompaniesUse'
		Тогда таблица 'List' стала равной:
			| "Report type"                              | "Company"  | "Report period"  | "End period" | "Scenario"               | "State" | "Project"               | "Assignee" | "Approval" | "Dimension 1"   | "Dimension 2" | "Dimension 3" | "Dimension 4" | "Dimension 5" | "Dimension 6" | "Primary currency" | "External infobase" |
			| "VA - Checking access settings (record)" | "Mercury LLC" | "January 2024" | "March 2024"     | "VA - Main scenario" | "Draft"  | "VA - Main project" | ""            | ""             | "Administration" | ""            | ""            | ""            | ""            | ""            | "RUB"             | ""           |
	
	* Создание и копирование
		И я нажимаю на кнопку с именем 'FormCreate'
		Тогда открылось окно "Specify key document attributes"
		И Я закрываю окно "Specify key document attributes"
		И я нажимаю на кнопку с именем 'FormCopy'
		Тогда открылось окно "Specify key document attributes"
		И Я закрываю окно "Specify key document attributes"
		Тогда открылось окно "Report instances"
		
	* Согласование
		Тогда открылось окно "Report instances"
		И я нажимаю на кнопку с именем 'FormCommonCommandUniversalApproval_ApprovalHistory'
		Тогда открылось окно "Approval history"
		И Я закрываю окно "Approval history"
		Тогда открылось окно "Report instances"
		И я нажимаю на кнопку с именем 'FormCommonCommandUniversalApproval_ApproveDocument'
		И я нажимаю на кнопку с именем 'FormCommonCommandUniversalApproval_UndoApproval'
		И я нажимаю на кнопку с именем 'FormCommonCommandUniversalApproval_AcceptForApproval'
		И я нажимаю на кнопку с именем 'BatchEditAttributes'
		Тогда в логе сообщений TestClient есть строки по шаблону:
			|"No person responsible for approval is specified in the responsibility assignment matrix for *. Enter proper approval status manually."|
			|"Approval has not been initiated for object *."|
			|"Person responsible for approval of the * object is not specified in the responsibility assignment matrix. The Status field is available for editing. Set the required approval status manually"|
			|"Current user does not have the \"Superuser\" role for company \"Mercury LLC\""|
		И я нажимаю на кнопку с именем 'FormCommonCommandUniversalApproval_ApprovalRoute'
		Тогда открылось окно "Process management console"
		И Я закрываю окно "Process management console"

	* Заполнение
		Тогда открылось окно "Report instances"
		И я нажимаю на кнопку с именем 'ImportOfData'
		И элемент формы с именем 'FormProcessingProtocol' отсутствует на форме
		Тогда открылось окно "Report instances"
		И в таблице 'List' я выбираю текущую строку
		И Открылся экземпляр отчета для вида отчета "VA - Checking access settings (record)" валюта "RUB" организация "Mercury LLC" сценарий "VA - Main scenario" периодичность 'Month' проект "VA - Main project" аналитики "Administration" '' '' '' '' '' 
		И я закрываю окно '$WindowTitle$'

	* Экземпляры отчетов
		Тогда открылось окно "Report instances"
		И Я закрываю окно "Report instances"
		И В командном интерфейсе я выбираю "Budgeting, reporting, and analysis" "Report instances"
		Тогда открылось окно "Report instances"
		И Я закрываю окно "Report instances"	

	* Сводная таблица
		Когда В панели разделов я выбираю "Budgeting, reporting, and analysis"
		И В командном интерфейсе я выбираю "Budgeting, reporting, and analysis" "Pivot table"
		Тогда открылось окно "Pivot table: *"
		И Я закрываю окно "Pivot table: *"
			
Сценарий: 18.24 Тест интерфейса для пользователя "Budgeting1" - Управление отчетным периодом

	И я подключаю TestClient "CPM - Budget" логин "Budgeting1" пароль ''

	И В командном интерфейсе я выбираю "Budgeting, reporting, and analysis" "Reporting period management"

	* Проверка формы списка
		Тогда открылось окно "Reporting period management" 
		И элемент формы с именем 'PeriodsManagementForm' отсутствует на форме	
		И элемент формы с именем 'FormOpenNextPeriod' отсутствует на форме
		И элемент формы с именем 'ProcessesManagementReportPreparation' отсутствует на форме
		И элемент формы с именем 'ReportingPreparationProcessChart' отсутствует на форме
		И элемент формы с именем 'ReportsMatrix' отсутствует на форме

		И Я в списке "Reporting period management" по полю "Scenario" ищу элемент "VA - Main scenario" "Exact match"
		И Я в списке "Reporting period management" по полю "Frequency" ищу элемент "Month" "Exact match" 
		И Я в списке "Reporting period management" по полю "Start period" ищу элемент "January 2024" "At beginning of line"

		Тогда в таблице 'List' количество строк "равно" 1
		И в таблице 'List' я выбираю текущую строку
	
	* Проверка формы элемента
		Тогда Открылся документ управления периодом для сценария "VA - Main scenario" периодичность "Month"
		И элемент формы с именем 'Label_MainPage' присутствует на форме
		И таблица 'Contents' стала равной:
			| "Description"            |
			| "Main period data" |
			| "Setting"               |
			| "Exchange rates"             |
		И элемент формы с именем 'ChangePeriod' отсутствует на форме
		И я нажимаю на кнопку с именем 'ReportOrganizationStructure'
		Тогда открылось окно "Organizational structure briefly"
		И Я закрываю окно "Organizational structure briefly"
		Тогда открылось окно '$WindowTitle$'
		И я нажимаю на кнопку с именем 'FormGoForward'
		И элемент формы с именем 'Label_ExchangeRates' присутствует на форме
		И элемент формы с именем 'RatesTable_ChangeModeWithoutSave' отсутствует на форме	
		И элемент формы с именем 'FormGoForward' не доступен
		И я нажимаю на кнопку с именем 'FormClose'
		Тогда открылось окно "Reporting period management"
		И Я закрываю окно "Reporting period management"
				
Сценарий: 18.25 Тест интерфейса для пользователя "Budgeting1" - Корректировка значений показателей

	И я подключаю TestClient "CPM - Budget" логин "Budgeting1" пароль ''

	* Открываем список с отборами
		И В командном интерфейсе я выбираю "Budgeting, reporting, and analysis" "Indicator value adjustment"
		Когда открылось окно "Indicator value adjustment"
		И я нажимаю на кнопку с именем 'FormListSettings'
		И Я устанавливаю отбор в форме списка "Synthetic adjustment.Report type.Description" "Contains" "VA - Checking access settings"
		Когда открылось окно "Indicator value adjustment"
		И я нажимаю на кнопку с именем 'FormListSettings'
		И Я добавляю отбор в форме списка "Deletion mark" "Equal to" "No"

	* Открываем документ
		Когда открылось окно "Indicator value adjustment"
		И в таблице 'List' я перехожу к строке:
			| "Company"  | "Adjustment input method" | "Scenario"               | "Adjustment template" |
			| "Mercury LLC" | "Manual entry"                | "VA - Main scenario" | ""                     |
		И в таблице 'List' я выбираю текущую строку
		Тогда открылось окно "Indicator value adjustment *"
		И Я закрываю окно "Indicator value adjustment *"

	* Проверяем кнопки согласования	
		Тогда открылось окно "Indicator value adjustment"
		И я нажимаю на кнопку с именем 'FormCommonCommandUniversalApproval_ApprovalHistory'
		Тогда открылось окно "Approval history"
		И Я закрываю окно "Approval history"
		Тогда открылось окно "Indicator value adjustment"
		И я нажимаю на кнопку с именем 'FormCommonCommandUniversalApproval_ApproveDocument'
		И я нажимаю на кнопку с именем 'FormCommonCommandUniversalApproval_UndoApproval'
		И я нажимаю на кнопку с именем 'FormCommonCommandUniversalApproval_AcceptForApproval'
		Тогда в логе сообщений TestClient есть строки по шаблону:
			|"No person responsible for approval is specified in the responsibility assignment matrix for *. Enter proper approval status manually."|
			|"Approval has not been initiated for object *."|
			|"Person responsible for approval of the * object is not specified in the responsibility assignment matrix. The Status field is available for editing. Set the required approval status manually"|
		И я нажимаю на кнопку с именем 'FormCommonCommandUniversalApproval_ApprovalRoute'
		Тогда открылось окно "Process management console"
		И Я закрываю окно "Process management console"

	* Снимаем отборы
		Когда открылось окно "Indicator value adjustment"
		И я нажимаю на кнопку с именем 'FormListSettings'			
		И Я снимаю все отборы в форме списка

Сценарий: 18.26 Тест интерфейса для пользователя "Budgeting1" - Шаблон корректировка значений показателей
	
	И я подключаю TestClient "CPM - Budget" логин "Budgeting1" пароль ''

	И В командном интерфейсе я выбираю "Budgeting, reporting, and analysis" "Indicator value adjustments templates"
	И Я в списке "Indicator value adjustments templates" по полю "Description" ищу элемент "VA - Checking access settings" "At beginning of line"

	Тогда таблица 'List' содержит '3' строк из списка:
		| "Description"                               | "Comment" | "Balanced" | "Adjustment input method" | "Filter companies" |
		| "VA - Checking access settings (record)"    | ""            | "No"              | "Manual entry"                | ""                  |
		| "VA - Checking access settings (some)" | ""            | "No"              | "Manual entry"                | ""                  |
		| "VA - Checking access settings (reading)"    | ""            | "No"              | "Manual entry"                | ""                  |

	И в таблице 'List' я перехожу к строке:
		| "Description"                               | "Balanced" | "Adjustment input method" |
		| "VA - Checking access settings (some)" | "No"              | "Manual entry"                |
	И в таблице 'List' я выбираю текущую строку

	Тогда открылось окно "VA - Checking access settings (some) (Indicator value adjustments templates)"	
	Тогда таблица 'UsedReportTypes' стала равной по шаблону:
		| "Report type"                              |
		| "<Object not found> (*)"                  |
		| "VA - Checking access settings (record)" |
	
	И я нажимаю на кнопку с именем 'FormDocumentIndicatorsValuesAdjustmentCreateBasedOn'
	Тогда открылось окно "Indicator value adjustment (create)"
	Тогда элемент формы с именем 'TemplateOfAdjustment' стал равен "VA - Checking access settings (some)"
	И Я закрываю окно "Indicator value adjustment (create)"

	Тогда открылось окно "VA - Checking access settings (some) (Indicator value adjustments templates)"
	И Я закрываю окно "VA - Checking access settings (some) (Indicator value adjustments templates)"
	
	Тогда открылось окно "Indicator value adjustments templates"
	И в таблице 'List' я перехожу к строке:
		| "Description"                            | "Balanced" | "Adjustment input method" |
		| "VA - Checking access settings (reading)" | "No"              | "Manual entry"                |
	И в таблице 'List' я выбираю текущую строку

	Тогда открылось окно "VA - Checking access settings (reading) (Indicator value adjustments templates)"	
	Тогда таблица 'UsedReportTypes' стала равной:
		| "Report type"                              |
		| "VA - Checking access settings (reading)" |
	И таблица 'TableOfAdjustments' стала равной:
		| "Report type"                              | "Indicator"           |
		| "VA - Checking access settings (reading)" | "ReportLine amount"   |
		| "VA - Checking access settings (reading)" | "ReportLineХ2 amount" |
	И Я закрываю окно "VA - Checking access settings (reading) (Indicator value adjustments templates)"
	
	Тогда открылось окно "Indicator value adjustments templates"
	И Я закрываю окно "Indicator value adjustments templates"
		
Сценарий: 18.27 Тест интерфейса для пользователя "Budgeting1" - Регламент подготовки отчетности
	
	И я подключаю TestClient "CPM - Budget" логин "Budgeting1" пароль ''

	И В командном интерфейсе я выбираю "Budgeting, reporting, and analysis" "Regulations for preparing reports"
	И Я в списке "Regulations for preparing reports" по полю "Description" ищу элемент "VA - Main regulations" "At beginning of line"		

	Тогда в таблице 'List' количество строк "равно" 1

	Когда открылось окно "Regulations for preparing reports"
	И я нажимаю на кнопку с именем 'FormReportOrganizationalRegulationStructuresBusinessUnitChart'
	Тогда открылось окно "Organizational structure briefly"
	Тогда табличный документ 'ReportSpreadsheetDocument' равен:
		| "System LLC (No, VA - Package CFR, RUB)" | '' | ''                                        |
		| ''                                       | '' | ''                                        |
		| ''                                       | '' | ''                                        |
		| ''                                       | '' | "Mars LLC (Yes, VA - Package CFR, RUB)"      |
		| ''                                       | '' | ''                                        |
		| ''                                       | '' | ''                                        |
		| ''                                       | '' | "Venus LLC (No, VA - Package CFR, RUB)"   |
		| ''                                       | '' | ''                                        |
		| ''                                       | '' | ''                                        |
		| ''                                       | '' | "Earth LLC (No, VA - Package CFR, RUB)"    |
		| ''                                       | '' | ''                                        |
		| ''                                       | '' | ''                                        |
		| ''                                       | '' | "Mercury LLC (No, VA - Package CFR, RUB)" |
	И Я закрываю окно "Organizational structure briefly"

	Тогда открылось окно "Regulations for preparing reports"
	И я нажимаю на кнопку с именем 'FormReportOrganizationalRegulationStructuresBusinessUnitTable'
	Когда открылось окно "Organizational structure briefly"
	Тогда табличный документ 'ReportSpreadsheetDocument' равен:
		| "Data parameters:"              | "Regulation version: VA - Main regulations" | ''                            | ''                                |
		| ''                        | "Display chart: No"                       | ''                            | ''                                |
		| ''                        | ''                                           | ''                            | ''                                |
		| "Business unit" | "Eliminating company"                  | "Business unit kind" | "Presentation currency" |
		| "System LLC"             | "No"                                        | "VA - Package CFR"              | "RUB"                             |
		| "Mars LLC"                | "Yes"                                         | "VA - Package CFR"              | "RUB"                             |
		| "Venus LLC"              | "No"                                        | "VA - Package CFR"              | "RUB"                             |
		| "Earth LLC"               | "No"                                        | "VA - Package CFR"              | "RUB"                             |
		| "Mercury LLC"            | "No"                                        | "VA - Package CFR"              | "RUB"                             |
	И Я закрываю окно "Organizational structure briefly"		
		
	И в таблице 'List' я выбираю текущую строку	
	Тогда открылось окно "VA - Main regulations from * (Regulation for preparing reports)"
	И я перехожу к закладке с именем 'GroupMainPage'
	И я нажимаю на кнопку с именем 'FormConfirmedReports'
	Тогда открылось окно "Report instances"
	И Я закрываю окно "Report instances"
	Тогда открылось окно "VA - Main regulations from * (Regulation for preparing reports)"
	И я перехожу к закладке с именем 'PerimeterSetting'
	Попытка
		И я нажимаю на кнопку с именем 'FormWrite'
	Исключение	
		И Я закрываю окно "VA - Main regulations from * (Regulation for preparing reports)"
	
	Когда открылось окно "Regulations for preparing reports"
	И я закрываю окно "Regulations for preparing reports"
			
Сценарий: 18.28 Тест интерфейса для пользователя "Budgeting1" - Сценарии

	И я подключаю TestClient "CPM - Budget" логин "Budgeting1" пароль ''

	И В командном интерфейсе я выбираю "Budgeting, reporting, and analysis" "Scenarios"
	И Я в списке "Scenarios" по полю "Description" ищу элемент "VA - Main scenario" "At beginning of line"	

	Тогда в таблице 'List' количество строк "равно" 1
	И в таблице 'List' я выбираю текущую строку

	Тогда открылось окно "Scenarios: VA - Main scenario (Scenarios)"
	И я перехожу к закладке с именем 'Budgeting'
	И я перехожу к закладке с именем 'MainProperties'
	Попытка
		И я нажимаю на кнопку с именем 'FormWrite'
	Исключение	
		И Я закрываю окно "Scenarios: VA - Main scenario (Scenarios)"

	Когда открылось окно "Scenarios"
	И я закрываю окно "Scenarios"	

Сценарий: 18.29 Тест интерфейса для пользователя "Budgeting1" - Организации

	И я подключаю TestClient "CPM - Budget" логин "Budgeting1" пароль ''

	Если '$$ЭтоPerform$$' Тогда

		И В командном интерфейсе я выбираю "Budgeting, reporting, and analysis" "Business units"
		Тогда открылось окно "Business units"
	
		И в таблице 'List' я перехожу к строке:
			| "Description" | "Company type"    |
			| "System LLC"  | "Tax resident" |
		И в таблице 'List' я перехожу на один уровень вниз
		
		Тогда таблица 'List' содержит '5' строк из списка:
			| "Description" | "Company type"    |
			| "System LLC"  | "Tax resident" |
			| "Mars LLC"     | "Elimination"         |
			| "Earth LLC"    | "Financial responsibility center"                |
			| "Venus LLC"   | "Financial responsibility center"                |
			| "Mercury LLC" | "Tax resident" |	

		И в таблице 'List' я перехожу к строке:
			| "Description" | "Company type"    |
			| "Mercury LLC" | "Tax resident" |

		И в таблице 'List' я выбираю текущую строку
		Тогда открылось окно "Mercury LLC (Business unit)"
		И В текущем окне я нажимаю кнопку командного интерфейса "Bank accounts"
		И В текущем окне я нажимаю кнопку командного интерфейса "Departments"
		// ДОДЕЛАТЬ: Сейчас не работает
		//И В текущем окне я нажимаю кнопку командного интерфейса "Attachments"
		//И В текущем окне я нажимаю кнопку командного интерфейса "Accounting policy settings"
		И В текущем окне я нажимаю кнопку командного интерфейса "Stored files of business units"
		И Я закрываю окно "Mercury LLC (Business unit)"	

	ИначеЕсли '$$IsERPCPM$$' Тогда

		И В командном интерфейсе я выбираю "Budgeting, reporting, and analysis" "Companies"
		Тогда открылось окно "Companies"

		Тогда таблица 'List' содержит '5' строк из списка:
			| "Description" | "Company type"       |
			| "Venus LLC"   | "Financial responsibility center"                   |
			| "Earth LLC"    | "Financial responsibility center"                   |
			| "Mars LLC"     | "Elimination"            |
			| "Mercury LLC" | "Tax resident" |
			| "System LLC"  | "Tax resident" |
		
		Когда открылось окно "Companies"
		И я нажимаю на кнопку с именем 'FormCommonCommandAdditionalInfoCommandBar'
		Тогда открылось окно "Additional information records"
		И Я закрываю окно "Additional information records"

		Когда открылось окно "Companies"
		И в таблице 'List' я перехожу к строке:
			| "Description" | "Company type"       |
			| "Mercury LLC" | "Tax resident" |		
		И в таблице 'List' я выбираю текущую строку

		Тогда открылось окно "Mercury LLC (Company)"
		И В текущем окне я нажимаю кнопку командного интерфейса "Лandца From правом подпandFromand"
		И В текущем окне я нажимаю кнопку командного интерфейса "Bank accounts"
		И В текущем окне я нажимаю кнопку командного интерфейса "Кассы предприятия"
		И В текущем окне я нажимаю кнопку командного интерфейса "Налоговые инспекции to forлогу for прибыль to региоforм"
		// ДОДЕЛАТЬ: Сейчас не работает
		//И В текущем окне я нажимаю кнопку командного интерфейса "Accounting policy settings"
		И В текущем окне я нажимаю кнопку командного интерфейса "Stored files of business units"
		И Я закрываю окно "Mercury LLC (Company)"				

	ИначеЕсли '$$IsCPM$$' Тогда

		И В командном интерфейсе я выбираю "Budgeting, reporting, and analysis" "Business units"
		Тогда открылось окно "Business units"

		Тогда таблица 'List' содержит '5' строк из списка:
			| "Name in the application" | "Company type"       |
			| "System LLC"              | "Tax resident" |
			| "Venus LLC"               | "Financial responsibility center"                   |
			| "Earth LLC"                | "Financial responsibility center"                   |
			| "Mars LLC"                 | "Elimination"            |
			| "Mercury LLC"             | "Tax resident" |

		И в таблице 'List' я перехожу к строке:
			| "Name in the application" | "Company type"       |
			| "Mercury LLC"             | "Tax resident" |	
	
		И я нажимаю на кнопку с именем 'FormUseОсновным'
		И я нажимаю на кнопку с именем 'FormUseОсновным'
	
		И я нажимаю на кнопку с именем 'SubmenuPrintNormal__Attributes'
		Тогда открылось окно "Print tools реквизитов Mercury LLC"
		И Я закрываю окно "Print tools реквизитов Mercury LLC"

		Тогда открылось окно "Business units"
		И я нажимаю на кнопку с именем 'CommonCommandAttachedFiles'
		Тогда открылось окно "Attachments: Mercury LLC"
		И Я закрываю окно "Attachments: Mercury LLC"

		Тогда открылось окно "Business units"
		Когда открылось окно "Business units"
		И я нажимаю на кнопку с именем 'CommonCommandAdditionalInfoCommandBar'
		Тогда открылось окно "Additional information records"
		И Я закрываю окно "Additional information records"

		Тогда открылось окно "Business units"
		И я нажимаю на кнопку с именем 'FormРегламентированныеCPM'
		Тогда таблица 'List' содержит '2' строк из списка:
			| "Name in the application" | "TIN" | "FNP" | "Company type"       |
			| "Mercury LLC"             | ""    | ""    | "Tax resident" |
			| "System LLC"              | ""    | ""    | "Tax resident" |
		И я нажимаю на кнопку с именем 'FormРегламентированныеCPM'

		И в таблице 'List' я выбираю текущую строку
		Тогда открылось окно "Mercury LLC (Business unit)"
		// ДОДЕЛАТЬ: Сейчас не работает
		//И В текущем окне я нажимаю кнопку командного интерфейса "Accounting policy settings"
		И В текущем окне я нажимаю кнопку командного интерфейса "Stored files of business units"
		И Я закрываю окно "Mercury LLC (Business unit)"

Сценарий: 18.30 Тест интерфейса для пользователя "Budgeting1" - Периоды

	И я подключаю TestClient "CPM - Budget" логин "Budgeting1" пароль ''

	И В командном интерфейсе я выбираю "Budgeting, reporting, and analysis" "Periods"
	Тогда открылось окно "Periods"
	
	И в таблице 'List' я перехожу к строке:
		| "Start date" | "End date" | "Description" | "Frequency" | "Arbitrary" |
		| "1/1/2024"  | "12/31/2024"     | "2024 year"      | "Year"           | "No"          |
	И в таблице 'List' я выбираю текущую строку
	Тогда открылось окно "2024 year (Periods)"
	И Я закрываю окно "2024 year (Periods)"

Сценарий: 18.31 Тест интерфейса для пользователя "Budgeting1" - Виды аналитик (корпоративные)	

	И я подключаю TestClient "CPM - Budget" логин "Budgeting1" пароль ''

	И В командном интерфейсе я выбираю "Budgeting, reporting, and analysis" "Dimension types (corporate)"
	И Я в списке "Dimension types (corporate)" по полю "Code" ищу элемент "VA0" "At beginning of line"
	Если '$$ЭтоPerform$$' Тогда
		Тогда Таблица 'List' содержит '6' строк из списка:
			| "Code"        | "Description"              | "Value type"                 | "Create if search failed during import" | "Update attributes during import" | "Divide by companies" |
			| "VA0Contrac" | "Counterparty contracts"     | "Contract"                      | "No"                                        | "No"                             | "No"                       |
			| "VA0Counter" | "Counterparties"               | "Counterparty"                   | "No"                                        | "No"                             | "No"                       |
			| "VA0Product" | "Product range"              | "Product range"                 | "No"                                        | "No"                             | "No"                       |
			| "VA0CFItems" | "Cash flow items"                | "Cash flow item" | "No"                                        | "No"                             | "No"                       |
			| "VA0IEItems" | "Income and expense items" | "Income and expense item"    | "No"                                        | "No"                             | "No"                       |
			| "VA0ProCate" | "Product categories"        | "Arbitrary classifier"   | "No"                                        | "No"                             | "No"                       |
	ИначеЕсли '$$IsERPCPM$$' Тогда	
		Тогда Таблица 'List' содержит '6' строк из списка:
			| "Code"        | "Description"              | "Value type"                     | "Create if search failed during import" | "Update attributes during import" | "Divide by companies" |
			| "VA0Contrac" | "Counterparty contracts"     | "Contract From контрагентом"           | "No"                                        | "No"                             | "No"                       |
			| "VA0Counter" | "Counterparties"               | "Counterparty"                       | "No"                                        | "No"                             | "No"                       |
			| "VA0Product" | "Product range"              | "Product range"                     | "No"                                        | "No"                             | "No"                       |
			| "VA0CFItems" | "Cash flow items"                | "Cash flow item" | "No"                                        | "No"                             | "No"                       |
			| "VA0IEItems" | "Income and expense items" | "Income and expense item"        | "No"                                        | "No"                             | "No"                       |
			| "VA0ProCate" | "Product categories"        | "Product categories"               | "No"                                        | "No"                             | "No"                       |
	ИначеЕсли '$$IsCPM$$' Тогда			
		Тогда Таблица 'List' содержит '6' строк из списка:
			| "Code"        | "Description"              | "Value type"                 | "Create if search failed during import" | "Update attributes during import" | "Divide by companies" |
			| "VA0Contrac" | "Counterparty contracts"     | "Contract"                      | "No"                                        | "No"                             | "No"                       |
			| "VA0Counter" | "Counterparties"               | "Counterparty"                   | "No"                                        | "No"                             | "No"                       |
			| "VA0Product" | "Product range"              | "Product range"                 | "No"                                        | "No"                             | "No"                       |
			| "VA0CFItems" | "Cash flow items"                | "Cash flow item" | "No"                                        | "No"                             | "No"                       |
			| "VA0IEItems" | "Income and expense items" | "Income and expense item"    | "No"                                        | "No"                             | "No"                       |
			| "VA0ProCate" | "Product categories"        | "Product categories"           | "No"                                        | "No"                             | "No"                       |
	
	Когда открылось окно "Dimension types (corporate)"
	И в таблице 'List' я перехожу к строке:
		| "Code"        | "Description" | "Update attributes during import" | "Divide by companies" | "Create if search failed during import" | "Value type" |
		| "VA0Product" | "Product range" | "No"                             | "No"                       | "No"                                        | "Product range" |
	И в таблице 'List' я выбираю текущую строку
	Тогда открылось окно "Product range (Dimension types (corporate))"
	И В текущем окне я нажимаю кнопку командного интерфейса "Default dimension values"
	И В текущем окне я нажимаю кнопку командного интерфейса "Arbitrary classifier"
	И Я закрываю окно "Product range (Dimension types (corporate))"
	Тогда открылось окно "Dimension types (corporate)"
	И Я закрываю окно "Dimension types (corporate)"

Сценарий: 18.32 Тест интерфейса для пользователя "Budgeting1" - Произвольный классификатор

	И я подключаю TestClient "CPM - Budget" логин "Budgeting1" пароль ''

	И В командном интерфейсе я выбираю "Budgeting, reporting, and analysis" "Arbitrary classifier"
	Тогда открылось окно "Arbitrary classifier"

	Если '$$IsERPCPM$$' Тогда
		И из выпадающего списка с именем 'Owner' я выбираю по строке "Units of measure"
	Иначе	
		И из выпадающего списка с именем 'Owner' я выбираю по строке "Staff kinds"
	И я нажимаю кнопку очистить у поля с именем 'Owner'

	Если в таблице 'List' количество строк "больше" 0 Тогда	
		И в таблице 'List' я выбираю текущую строку
		Тогда открылось окно "* (Arbitrary classifier)"
		И Я закрываю окно "* (Arbitrary classifier)"

	Тогда открылось окно "Arbitrary classifier"
	И Я закрываю окно "Arbitrary classifier"

Сценарий: 18.33 Тест интерфейса для пользователя "Budgeting1" - Проекты и этапы		

	И я подключаю TestClient "CPM - Budget" логин "Budgeting1" пароль ''

	И В командном интерфейсе я выбираю "Budgeting, reporting, and analysis" "Projects and phases"
	И Я в списке "Projects and phases" по полю "Description" ищу элемент "VA - Main project" "Exact match"
	Тогда в таблице 'List' количество строк "равно" 1
	
	И я нажимаю на кнопку с именем 'ButtonIncExpBudget'
	Тогда открылось окно "Pivot table: No options selected"
	И Я закрываю окно "Pivot table: No options selected"

	Тогда открылось окно "Projects and phases"
	И я нажимаю на кнопку с именем 'ButtonCFBudget'
	Тогда открылось окно "Pivot table: No options selected"
	И Я закрываю окно "Pivot table: No options selected"

	Тогда открылось окно "Projects and phases"
	И я нажимаю на кнопку с именем 'ButtonIEBudget'
	Тогда открылось окно "Pivot table: No options selected"
	И Я закрываю окно "Pivot table: No options selected"

	Тогда открылось окно "Projects and phases"
	И в таблице 'List' я выбираю текущую строку
	Когда открылось окно "VA - Main project (Projects and phases)"
	И Я закрываю окно "VA - Main project (Projects and phases)"

	Когда открылось окно "Projects and phases"
	И Я закрываю окно "Projects and phases"
			
Сценарий: 18.34 Тест интерфейса для пользователя "Budgeting1" - Отчеты

	И я подключаю TestClient "CPM - Budget" логин "Budgeting1" пароль ''

	* Организационные структуры регламента 
		И В командном интерфейсе я выбираю "Budgeting, reporting, and analysis" "Organizational regulation structures"
		Тогда открылось окно "Organizational structure briefly"
		И из выпадающего списка с именем 'SettingsComposerUserSettingsItem0Value' я выбираю по строке "VA - Main regulations"
		И я нажимаю на кнопку с именем 'GenerateReport'	
		Тогда табличный документ 'ReportSpreadsheetDocument' равен:
			| "Data parameters:"              | "Regulation version: VA - Main regulations" | ''                            | ''                                |
			| ''                        | "Display chart: No"                       | ''                            | ''                                |
			| ''                        | ''                                           | ''                            | ''                                |
			| "Business unit" | "Eliminating company"                  | "Business unit kind" | "Presentation currency" |
			| "System LLC"             | "No"                                        | "VA - Package CFR"              | "RUB"                             |
			| "Mars LLC"                | "Yes"                                         | "VA - Package CFR"              | "RUB"                             |
			| "Venus LLC"              | "No"                                        | "VA - Package CFR"              | "RUB"                             |
			| "Earth LLC"               | "No"                                        | "VA - Package CFR"              | "RUB"                             |
			| "Mercury LLC"            | "No"                                        | "VA - Package CFR"              | "RUB"                             |
		И Я закрываю окно "Organizational structure briefly"

	* Отчет о связях показателей отчетов
		И В командном интерфейсе я выбираю "Budgeting, reporting, and analysis" "Report on report indicator links"
		Тогда открылось окно "Report on report indicator links"
		И в таблице 'MainReports' я нажимаю на кнопку с именем 'MainReportsAdd'
		И в таблице 'MainReports' я нажимаю кнопку выбора у реквизита с именем 'MainReportsReportKind'				
		И Я в списке "Report types" по полю "Description" ищу и выбираю элемент "VA - Checking access settings (record)" "Exact match" 
		И в таблице 'MainReports' я нажимаю на кнопку с именем 'FormFormulate'
		И Я закрываю окно "Report on report indicator links"

	* Графический отчет связей отчетов
		И В командном интерфейсе я выбираю "Budgeting, reporting, and analysis" "Graphic report link report"
		Тогда открылось окно "Report links report"
		И в таблице 'ReportsTableBox' я нажимаю на кнопку с именем 'ReportsTableBoxAdd'
		И в таблице 'ReportsTableBox' я нажимаю кнопку выбора у реквизита с именем 'ReportsTableBoxReport'
		И Я в списке "Report types" по полю "Description" ищу и выбираю элемент "VA - Checking access settings (record)" "Exact match" 
		И в таблице 'ReportsTableBox' я завершаю редактирование строки
		И в таблице 'ReportsTableBox' я нажимаю на кнопку с именем 'Generate'
		И Я закрываю окно "Report links report"

	* Сетевая диаграмма группы проектов
		И В командном интерфейсе я выбираю "Budgeting, reporting, and analysis" "Network diagram of project group"
		Тогда открылось окно "Network diagram of project group"
		И в табличном документе 'SpreadsheetDocumentField' я перехожу к ячейке "R1C1"
		И я нажимаю на кнопку с именем 'FormFormulate'
		И Я закрываю окно "Network diagram of project group"
			
Сценарий: 18.35 Тест интерфейса для пользователя "Budgeting1" - Сервис
		
	И я подключаю TestClient "CPM - Budget" логин "Budgeting1" пароль ''

	* Копирование данных показателей отчетов
		И В командном интерфейсе я выбираю "Budgeting, reporting, and analysis" "Copy values indicators отчетов"
		Тогда открылось окно "Copy values indicators отчетов"
		И Я закрываю окно "Copy values indicators отчетов"

	* Сравнение табличных документов	
		И В командном интерфейсе я выбираю "Budgeting, reporting, and analysis" "Compare spreadsheet documents"
		Тогда открылось окно "Compare spreadsheet documents"
		И Я закрываю окно "Compare spreadsheet documents"
		И В панели разделов я выбираю "Budgeting, reporting, and analysis"
				
