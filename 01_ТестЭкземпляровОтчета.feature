#language: ru

@tree

Функционал: 01. Проверка создание видов отчетов с полным набором аналитик

Как Администратор я хочу
Проверить создание и работу видов отчетов
чтобы Виды отчетов вводились без ошибок

Контекст: 

	И я подключаю TestClient "CPM - Budget" логин "Administrator" пароль ''	
	И я закрыл все окна клиентского приложения

Сценарий: 01.00 Определение типа приложения

	Пусть Инициализация переменных		

Сценарий: 01.01 Создание вида отчета

	И Я создаю вид отчета с именем "VA - Manual entry for all analytics" и родителем "VA - Report group"
	И Я для вида отчета "VA - Manual entry for all analytics" изменяю флаг 'ProjectSeparation'

Сценарий: 01.02 Тестируем кнопки формы списка и формы элемента вида отчета

	* Находим вид отчета
		И В командном интерфейсе я выбираю "Budgeting, reporting, and analysis" "Report kinds and templates"
		Тогда открылось окно "Report kinds and templates"
		И в таблице 'ReportKindList' я нажимаю на кнопку с именем 'ReportKindListFind'
		Тогда открылась форма с именем 'UniversalListFindExtForm'
		И из выпадающего списка с именем 'FieldSelector' я выбираю точное значение "Report kind"
		И я меняю значение переключателя с именем 'CompareType' на "Anywhere in the line"
		И в поле с именем 'Pattern' я ввожу текст "VA - Manual entry for all analytics"
		И я нажимаю на кнопку с именем 'Find'
		Тогда в таблице 'ReportKindList' количество строк 'равно' 1

	* Контруктор
		Когда открылось окно "Report kinds and templates"
		И в таблице 'ReportKindList' я нажимаю на кнопку с именем 'DoOpenDesigner'
		Тогда открылось окно "Edit tree"
		И Я закрываю окно "Edit tree"

	* Экземпляры отчетов
		Когда открылось окно "Report kinds and templates"
		И в таблице 'ReportKindList' я нажимаю на кнопку с именем 'ReportKindListOpenInstancesList'
		Тогда открылось окно "Report instances"
		И Я закрываю окно "Report instances"

	* Копирование
		Когда открылось окно "Report kinds and templates"
		И в таблице 'ReportKindList' я нажимаю на кнопку с именем 'ReportKindListCopy'
		Тогда открылось окно "Copy report kind"
		И я нажимаю на кнопку с именем 'FormOK'
		Тогда открылось окно "Report kinds (create)"
		И Я закрываю окно "Report kinds (create)"

	* Открываем форму
		Когда открылось окно "Report kinds and templates"
		И в таблице 'ReportKindList' я выбираю текущую строку		

	* Конструктор
		Тогда открылось окно "VA - Manual entry for all analytics (Report kinds)"
		И я нажимаю на кнопку с именем 'EditTree'
		Тогда открылось окно "Edit tree"
		И Я закрываю окно "Edit tree"

	* Связи показателей графически
		Тогда открылось окно "VA - Manual entry for all analytics (Report kinds)"
		Если '$$IsCPM$$' Тогда
			И я нажимаю на кнопку с именем 'FormReportGraphicReportOnReportLinksOpenReport'
		ИначеЕсли '$$IsERPCPM$$' Тогда
			И я нажимаю на кнопку с именем 'FormLinksReport'
		Тогда открылось окно "Report links report"
		И Я закрываю окно "Report links report"

	* Связи показателей
		Тогда открылось окно "VA - Manual entry for all analytics (Report kinds)"
		И я нажимаю на кнопку с именем 'FormReportReportLinksReportOpenReport'
		Тогда открылось окно "Report on report indicator links"
		И Я закрываю окно "Report on report indicator links"

	* Вкладки
		Тогда открылось окно "VA - Manual entry for all analytics (Report kinds)"
		И я перехожу к закладке с именем 'DimensionsOfReport'
		И я перехожу к закладке с именем 'DefaultSettings'
		И я перехожу к закладке с именем 'ReportParameters'
		И я перехожу к закладке с именем 'GroupSetLimits'

	* Закрываем форму
		И Я закрываю окно "VA - Manual entry for all analytics (Report kinds)"

	* Закрваем форму списка
		Тогда открылось окно "Report kinds and templates"
		И Я закрываю окно "Report kinds and templates"								

Сценарий: 01.03 Работа в контрукторе отчета - Настройка структуры отчета

	И Я открываю контруктор отчета с именем "VA - Manual entry for all analytics"

	* Добавляем строки
		Когда открылось окно "Edit tree"
		И я нажимаю на кнопку с именем 'RowsTreeAddRows'
		Тогда открылось окно "Adding new lines"
		И в таблице 'NewLines' я нажимаю на кнопку с именем 'NewLinesAdd'
		И в таблице 'NewLines' в поле с именем 'NewLinesDescription' я ввожу текст "LineSynthetic"
		И в таблице 'NewLines' я завершаю редактирование строки
		И в таблице 'NewLines' я нажимаю на кнопку с именем 'NewLinesAdd'
		И в таблице 'NewLines' в поле с именем 'NewLinesDescription' я ввожу текст "LineDimension1"
		И в таблице 'NewLines' я завершаю редактирование строки
		И в таблице 'NewLines' я нажимаю на кнопку с именем 'NewLinesAdd'
		И в таблице 'NewLines' в поле с именем 'NewLinesDescription' я ввожу текст "LineDimension2"
		И в таблице 'NewLines' я завершаю редактирование строки
		И в таблице 'NewLines' я нажимаю на кнопку с именем 'NewLinesAdd'
		И в таблице 'NewLines' в поле с именем 'NewLinesDescription' я ввожу текст "LineDimension3"
		И в таблице 'NewLines' я завершаю редактирование строки
		И в таблице 'NewLines' я нажимаю на кнопку с именем 'NewLinesAdd'
		И в таблице 'NewLines' в поле с именем 'NewLinesDescription' я ввожу текст "LineDimension4"
		И в таблице 'NewLines' я завершаю редактирование строки
		И в таблице 'NewLines' я нажимаю на кнопку с именем 'NewLinesAdd'
		И в таблице 'NewLines' в поле с именем 'NewLinesDescription' я ввожу текст "LineDimension5"
		И в таблице 'NewLines' я завершаю редактирование строки
		И в таблице 'NewLines' я нажимаю на кнопку с именем 'NewLinesAdd'
		И в таблице 'NewLines' в поле с именем 'NewLinesDescription' я ввожу текст "LineDimension6"
		И в таблице 'NewLines' я завершаю редактирование строки
		И в таблице 'NewLines' я нажимаю на кнопку с именем 'NewLinesAdd'
		И в таблице 'NewLines' в поле с именем 'NewLinesDescription' я ввожу текст "LineDimension6Currency"
		И в таблице 'NewLines' я завершаю редактирование строки
		И в таблице 'NewLines' я нажимаю на кнопку с именем 'NewLinesAdd'
		И в таблице 'NewLines' в поле с именем 'NewLinesDescription' я ввожу текст "LineDimensionCurrency"
		И в таблице 'NewLines' я завершаю редактирование строки
		И я нажимаю на кнопку с именем 'OK'
	
	* Добавляем группу строк
		Тогда открылось окно "Edit tree"
		И я нажимаю на кнопку с именем 'RowsTreeAddRows'
		Тогда открылось окно "Adding new lines"
		И в таблице 'NewLines' я нажимаю на кнопку с именем 'NewLinesAdd'
		И в таблице 'NewLines' в поле с именем 'NewLinesDescription' я ввожу текст "LinesGroup"
		И в таблице 'NewLines' я завершаю редактирование строки
		И я нажимаю на кнопку с именем 'OK'
	
	* Проверяем работу кнопок перемещения строк
		Тогда открылось окно "Edit tree"
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R11C1'
		И я нажимаю на кнопку с именем 'RowsTreeRowMoveUp'
		И я нажимаю на кнопку с именем 'RowsTreeRowMoveUp'
		И я нажимаю на кнопку с именем 'RowsTreeRowMoveUp'
		И я нажимаю на кнопку с именем 'RowsTreeRowMoveUp'
		И я нажимаю на кнопку с именем 'RowsTreeRowMoveUp'
		И я нажимаю на кнопку с именем 'RowsTreeRowMoveUp'
		И я нажимаю на кнопку с именем 'RowsTreeRowMoveUp'
		И я нажимаю на кнопку с именем 'RowsTreeRowMoveUp'
		И я нажимаю на кнопку с именем 'RowsTreeRowMoveUp'
		И я нажимаю на кнопку с именем 'RowsTreeRowMoveDown'
		И я нажимаю на кнопку с именем 'RowsTreeRowMoveUp'

	* Добавляем строку и сразу удаляем
		Когда открылось окно "Edit tree"
		И я нажимаю на кнопку с именем 'RowsTreeAddRows'
		Тогда открылось окно "Adding new lines"
		И в таблице 'NewLines' я нажимаю на кнопку с именем 'NewLinesAdd'
		И в таблице 'NewLines' в поле с именем 'NewLinesDescription' я ввожу текст "LineDelete"
		И в таблице 'NewLines' я завершаю редактирование строки
		И я нажимаю на кнопку с именем 'OK'
		Тогда открылось окно "Edit tree"
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R12C1'
		И я нажимаю на кнопку с именем 'DeleteRows'

	* Добавляем колонки
		И я нажимаю на кнопку с именем 'RowsTreeAddColumn'
		Тогда открылось окно "Adding new columns"
		И в таблице 'NewLines' я нажимаю на кнопку с именем 'NewLinesAdd'
		И в таблице 'NewLines' в поле с именем 'NewLinesDescription' я ввожу текст "Amount"
		И в таблице 'NewLines' я завершаю редактирование строки
		И в таблице 'NewLines' я нажимаю на кнопку с именем 'NewLinesAdd'
		И в таблице 'NewLines' в поле с именем 'NewLinesDescription' я ввожу текст "Quantity"
		И в таблице 'NewLines' я завершаю редактирование строки
		И в таблице 'NewLines' я нажимаю на кнопку с именем 'NewLinesAdd'
		И в таблице 'NewLines' в поле с именем 'NewLinesDescription' я ввожу текст "Price"
		И в таблице 'NewLines' я завершаю редактирование строки
		И я нажимаю на кнопку с именем 'OK'

	* Проверяем стрелки
		Когда открылось окно "Edit tree"
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R1C2'
		И я нажимаю на кнопку с именем 'ColumnMoveRight'
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R1C4'
		И я нажимаю на кнопку с именем 'ColumnMoveLeft'

	* Удаляем показатели
		Когда открылось окно "Edit tree"
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R2C2:R11C4'
		И В конструкторе отчета я нажимаю кнопку контекстного меню с именем 'SpreadsheetFieldTemlateContextMenuDeleteIndicator'
	
	* Создаем показатели
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R2C2:R11C4'
		И В конструкторе отчета я нажимаю кнопку контекстного меню с именем 'SpreadsheetFieldTemlateContextMenuCreateIndicators'
	
	* Редактируем свойства показателей
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R2C2:R11C4'
		И В конструкторе отчета я нажимаю кнопку контекстного меню с именем 'SpreadsheetFieldTemlateContextMenuProperties'
		Тогда открылось окно "Bulk edit indicators"
		И я изменяю флаг с именем 'ValueTypeChange'
		И из выпадающего списка с именем 'ValueType' я выбираю точное значение "Number"
		И я изменяю флаг с именем 'TotalKindChange'
		И из выпадающего списка с именем 'TotalKind' я выбираю точное значение "Amount"
		И я нажимаю на кнопку с именем 'FormWriteAndClose'

	* Добавляем колонку, сразу удаляем
		Когда открылось окно "Edit tree"
		И я нажимаю на кнопку с именем 'RowsTreeAddColumn'
		Тогда открылось окно "Adding new columns"
		И в таблице 'NewLines' я нажимаю на кнопку с именем 'NewLinesAdd'
		И в таблице 'NewLines' в поле с именем 'NewLinesDescription' я ввожу текст "ColumnDelete"
		И в таблице 'NewLines' я завершаю редактирование строки
		И я нажимаю на кнопку с именем 'OK'
		Тогда открылось окно "Edit tree"
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R1C5'
		И я нажимаю на кнопку с именем 'DeleteColumns'

	* Добавим настройки реквизитов строк и столбцов и сравним
		Когда открылось окно "Edit tree"
		И я нажимаю на кнопку с именем 'OpenLinesAttributesSettings'
		Тогда открылось окно "Line attributes"
		И в таблице 'LinesAttributes' я нажимаю на кнопку с именем 'LinesAttributesAdd'
		Тогда открылось окно "Select attribute"
		И в таблице 'SettingsComposerSettingsOrderAvailableOrderFields' я перехожу к строке:
			| "Available fields" |
			| 'Code'            |
		И в таблице 'SettingsComposerSettingsOrderAvailableOrderFields' я выбираю текущую строку
		Тогда открылось окно "Line attributes"
		И в таблице 'LinesAttributes' я завершаю редактирование строки
		И я нажимаю на кнопку с именем 'FormSelect'
		Тогда открылось окно "Edit tree"
		И я нажимаю на кнопку с именем 'OpenIndicatorsPropertiesSettings'
		Тогда открылось окно "Indicator attributes"
		И в таблице 'IndicatorsAttributes' я нажимаю на кнопку с именем 'IndicatorsAttributesAdd'
		Тогда открылось окно "Select attribute"
		И в таблице 'SettingsComposerSettingsOrderAvailableOrderFields' я перехожу к строке:
			| "Available fields" |
			| 'Code'            |
		И в таблице 'SettingsComposerSettingsOrderAvailableOrderFields' я выбираю текущую строку
		Тогда открылось окно "Indicator attributes"
		И в таблице 'IndicatorsAttributes' я завершаю редактирование строки
		И я нажимаю на кнопку с именем 'FormSelect'
		Тогда открылось окно "Edit tree"
		И я нажимаю на кнопку с именем 'ShowMarkedForDeletion'

	* Сравниваем с эталоном
		Тогда табличный документ 'SpreadsheetFieldTemlate' равен по шаблону:
			| 'String'                 | 'Code'              | "Indicator attributes" | "Quantity"                   | "Price"                   | "Amount"                   | "ColumnDelete" |
			| "LinesGroup"            | "LinesGroup*"     | ''                      | '■'                            | '■'                      | '■'                       | ''               |
			| ''                       | ''                 | 'Code'                   | "LinesGroup_Quantity1*"     | "LinesGroup_Price1*"     | "LinesGroup_Amount1*"     | ''               |
			| "LineSynthetic"        | "LineSynthetic*"   | ''                      | '■'                            | '■'                      | '■'                       | ''               |
			| ''                       | ''                 | 'Code'                   | "LineSynthetic_Quantity1*"   | "LineSynthetic_Price1*"   | "LineSynthetic_Amount1*"   | ''               |
			| "LineDimension1"       | "LineANLT1*"       | ''                      | '■'                            | '■'                      | '■'                       | ''               |
			| ''                       | ''                 | 'Code'                   | "LineANLT1_Quantity1*"       | "LineANLT1_Price1*"       | "LineANLT1_Amount1*"       | ''               |
			| "LineDimension2"       | "LineANLT2*"       | ''                      | '■'                            | '■'                      | '■'                       | ''               |
			| ''                       | ''                 | 'Code'                   | "LineANLT2_Quantity1*"       | "LineANLT2_Price1*"       | "LineANLT2_Amount1*"       | ''               |
			| "LineDimension3"       | "LineANLT3*"       | ''                      | '■'                            | '■'                      | '■'                       | ''               |
			| ''                       | ''                 | 'Code'                   | "LineANLT3_Quantity1*"       | "LineANLT3_Price1*"       | "LineANLT3_Amount1*"       | ''               |
			| "LineDimension4"       | "LineANLT4*"       | ''                      | '■'                            | '■'                      | '■'                       | ''               |
			| ''                       | ''                 | 'Code'                   | "LineANLT4_Quantity1*"       | "LineANLT4_Price1*"       | "LineANLT4_Amount1*"       | ''               |
			| "LineDimension5"       | "LineANLT5*"       | ''                      | '■'                            | '■'                      | '■'                       | ''               |
			| ''                       | ''                 | 'Code'                   | "LineANLT5_Quantity1*"       | "LineANLT5_Price1*"       | "LineANLT5_Amount1*"       | ''               |
			| "LineDimension6"       | "LineANLT6*"       | ''                      | '■'                            | '■'                      | '■'                       | ''               |
			| ''                       | ''                 | 'Code'                   | "LineANLT6_Quantity1*"       | "LineANLT6_Price1*"       | "LineANLT6_Amount1*"       | ''               |
			| "LineDimension6Currency" | "LineANLT6Currency*" | ''                      | '■'                            | '■'                      | '■'                       | ''               |
			| ''                       | ''                 | 'Code'                   | "LineANLT6Currency_Quantity1*" | "LineANLT6Currency_Price1*" | "LineANLT6Currency_Amount1*" | ''               |
			| "LineDimensionCurrency"  | "LineANLTCurrency*"  | ''                      | '■'                            | '■'                      | '■'                       | ''               |
			| ''                       | ''                 | 'Code'                   | "LineANLTCurrency_Quantity1*"  | "LineANLTCurrency_Price1*"  | "LineANLTCurrency_Amount1*"  | ''               |
			| "LineDelete"          | "LineDelete*"     | ''                      | ''                             | ''                       | ''                        | ''               |
			| ''                       | ''                 | 'Code'                   | ''                             | ''                       | ''                        | ''               |

	* Уберем все настройки и сравним
		Когда открылось окно "Edit tree"
		И я нажимаю на кнопку с именем 'OpenLinesAttributesSettings'
		Тогда открылось окно "Line attributes"
		И в таблице 'LinesAttributes' я перехожу к строке:
			| 'Value' |
			| 'Code'      |
		И в таблице 'LinesAttributes' я нажимаю на кнопку с именем 'LinesAttributesDelete'
		И я нажимаю на кнопку с именем 'FormSelect'
		Тогда открылось окно "Edit tree"
		И я нажимаю на кнопку с именем 'OpenIndicatorsPropertiesSettings'
		Тогда открылось окно "Indicator attributes"
		И в таблице 'IndicatorsAttributes' я нажимаю на кнопку с именем 'IndicatorsAttributesDelete'
		И я нажимаю на кнопку с именем 'FormSelect'
		Тогда открылось окно "Edit tree"
		И я нажимаю на кнопку с именем 'ShowMarkedForDeletion'

	* Сравниваем с эталоном
		Тогда табличный документ 'SpreadsheetFieldTemlate' равен:
			| 'String'                 | "Quantity" | "Price" | "Amount" |
			| "LinesGroup"            | '■'          | '■'    | '■'     |
			| "LineSynthetic"        | '■'          | '■'    | '■'     |
			| "LineDimension1"       | '■'          | '■'    | '■'     |
			| "LineDimension2"       | '■'          | '■'    | '■'     |
			| "LineDimension3"       | '■'          | '■'    | '■'     |
			| "LineDimension4"       | '■'          | '■'    | '■'     |
			| "LineDimension5"       | '■'          | '■'    | '■'     |
			| "LineDimension6"       | '■'          | '■'    | '■'     |
			| "LineDimension6Currency" | '■'          | '■'    | '■'     |
			| "LineDimensionCurrency"  | '■'          | '■'    | '■'     |

Сценарий: 01.04 Работа в контрукторе отчета - Настройка аналитик

	И Я открываю контруктор отчета с именем "VA - Manual entry for all analytics"
	
	* Зададим аналитику "Товарные категории"
		Когда открылось окно "Edit tree"
		И из выпадающего списка с именем 'WorkMode' я выбираю точное значение "Indicator dimensions"
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R4C2'
		И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
		Тогда открылось окно "Dimension kinds (corporate)"
		И я нажимаю на кнопку с именем 'FormFind'
		Тогда открылась форма с именем 'UniversalListFindExtForm'
		И из выпадающего списка с именем 'FieldSelector' я выбираю точное значение "Code"
		И я меняю значение переключателя с именем 'CompareType' на "Exact match"
		И в поле с именем 'Pattern' я ввожу текст "VA0ProCate"
		И я нажимаю на кнопку с именем 'Find'
		Тогда открылось окно "Dimension kinds (corporate)"
		И в таблице 'List' я выбираю текущую строку
		Когда открылось окно "Edit tree"
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R4C2'
		И я нажимаю на кнопку с именем 'CopyAndShiftDown1'		

	* Зададим аналитику 'ВА0Номенклра' 
		Когда открылось окно "Edit tree"
		И из выпадающего списка с именем 'WorkMode' я выбираю точное значение "Indicator dimensions"
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R5C3'
		И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
		Тогда открылось окно "Dimension kinds (corporate)"
		И я нажимаю на кнопку с именем 'FormFind'
		Тогда открылась форма с именем 'UniversalListFindExtForm'
		И из выпадающего списка с именем 'FieldSelector' я выбираю точное значение "Code"
		И я меняю значение переключателя с именем 'CompareType' на "Exact match"
		И в поле с именем 'Pattern' я ввожу текст "VA0Product"
		И я нажимаю на кнопку с именем 'Find'
		Тогда открылось окно "Dimension kinds (corporate)"
		И в таблице 'List' я выбираю текущую строку
		Когда открылось окно "Edit tree"
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R5C3'
		И я нажимаю на кнопку с именем 'CopyAndShiftDown1'

	* Зададим аналитику 'ВА0Контрагы' 
		Когда открылось окно "Edit tree"
		И из выпадающего списка с именем 'WorkMode' я выбираю точное значение "Indicator dimensions"
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R6C4'
		И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
		Тогда открылось окно "Dimension kinds (corporate)"
		И я нажимаю на кнопку с именем 'FormFind'
		Тогда открылась форма с именем 'UniversalListFindExtForm'
		И из выпадающего списка с именем 'FieldSelector' я выбираю точное значение "Code"
		И я меняю значение переключателя с именем 'CompareType' на "Exact match"
		И в поле с именем 'Pattern' я ввожу текст "VA0Counter"
		И я нажимаю на кнопку с именем 'Find'
		Тогда открылось окно "Dimension kinds (corporate)"
		И в таблице 'List' я выбираю текущую строку
		Когда открылось окно "Edit tree"
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R6C4'
		И я нажимаю на кнопку с именем 'CopyAndShiftDown1'

	* Зададим аналитику 'Договоры ВА0Контрагов' 
		Когда открылось окно "Edit tree"
		И из выпадающего списка с именем 'WorkMode' я выбираю точное значение "Indicator dimensions"
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R7C5'
		И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
		Тогда открылось окно "Dimension kinds (corporate)"
		И я нажимаю на кнопку с именем 'FormFind'
		Тогда открылась форма с именем 'UniversalListFindExtForm'
		И из выпадающего списка с именем 'FieldSelector' я выбираю точное значение "Code"
		И я меняю значение переключателя с именем 'CompareType' на "Exact match"
		И в поле с именем 'Pattern' я ввожу текст "VA0Contrac"
		И я нажимаю на кнопку с именем 'Find'
		Тогда открылось окно "Dimension kinds (corporate)"
		И в таблице 'List' я выбираю текущую строку
		Когда открылось окно "Edit tree"
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R7C5'
		И я нажимаю на кнопку с именем 'CopyAndShiftDown1'

	* Зададим аналитику "Статьи ДДС" 
		Когда открылось окно "Edit tree"
		И из выпадающего списка с именем 'WorkMode' я выбираю точное значение "Indicator dimensions"
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R8C6'
		И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
		Тогда открылось окно "Dimension kinds (corporate)"
		И я нажимаю на кнопку с именем 'FormFind'
		Тогда открылась форма с именем 'UniversalListFindExtForm'
		И из выпадающего списка с именем 'FieldSelector' я выбираю точное значение "Code"
		И я меняю значение переключателя с именем 'CompareType' на "Exact match"
		И в поле с именем 'Pattern' я ввожу текст "VA0CFItems"
		И я нажимаю на кнопку с именем 'Find'
		Тогда открылось окно "Dimension kinds (corporate)"
		И в таблице 'List' я выбираю текущую строку
		Когда открылось окно "Edit tree"
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R8C6'
		И я нажимаю на кнопку с именем 'CopyAndShiftDown1'

	* Зададим аналитику "Статьи доходов и расходов" 
		Когда открылось окно "Edit tree"
		И из выпадающего списка с именем 'WorkMode' я выбираю точное значение "Indicator dimensions"
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R9C7'
		И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
		Тогда открылось окно "Dimension kinds (corporate)"
		И я нажимаю на кнопку с именем 'FormFind'
		Тогда открылась форма с именем 'UniversalListFindExtForm'
		И из выпадающего списка с именем 'FieldSelector' я выбираю точное значение "Code"
		И я меняю значение переключателя с именем 'CompareType' на "Exact match"
		И в поле с именем 'Pattern' я ввожу текст "VA0IEItems"
		И я нажимаю на кнопку с именем 'Find'
		Тогда открылось окно "Dimension kinds (corporate)"
		И в таблице 'List' я выбираю текущую строку
		Когда открылось окно "Edit tree"
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R9C7'
		И я нажимаю на кнопку с именем 'CopyAndShiftDown1'
	
	* Пробуем удалить и вставить аналитику
		Тогда открылось окно "Edit tree"
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R10C7'
		И я нажимаю на кнопку с именем 'DeleteDimension'
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R9C7'
		И я нажимаю на кнопку с именем 'CopyDimension'
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R10C7'
		И я нажимаю на кнопку с именем 'InsertDimension'

	* Удалим аналитики у валютного показателя
		Когда открылось окно "Edit tree"
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R11C7'
		И В конструкторе отчета я нажимаю кнопку контекстного меню с именем 'SpreadsheetFieldTemlateContextMenuDeleteDimension'
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R11C6'
		И В конструкторе отчета я нажимаю кнопку контекстного меню с именем 'SpreadsheetFieldTemlateContextMenuDeleteDimension'
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R11C2'
		И В конструкторе отчета я нажимаю кнопку контекстного меню с именем 'SpreadsheetFieldTemlateContextMenuDeleteDimension'
		И В конструкторе отчета я нажимаю кнопку контекстного меню с именем 'SpreadsheetFieldTemlateContextMenuDeleteDimension'
		И В конструкторе отчета я нажимаю кнопку контекстного меню с именем 'SpreadsheetFieldTemlateContextMenuDeleteDimension'
		И В конструкторе отчета я нажимаю кнопку контекстного меню с именем 'SpreadsheetFieldTemlateContextMenuDeleteDimension'
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R11C8'
		И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке

	* Добавим и удалим аналитику по валюте	
		Когда открылось окно "Edit tree"
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R9C8'
		И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R10C8'
		И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R9C9'
		И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
		Тогда открылось окно "GR_LineDimension6 (Report indicator dimension groups)"
		И я изменяю флаг с именем 'IsCurrency'
		И я нажимаю на кнопку с именем 'FormWriteAndClose'
		И я жду закрытия окна "GR_LineDimension6 (Report indicator dimension groups) *" в течение 3 секунд

	* Сравним макет с эталоном
		Тогда открылось окно "Edit tree"
		Тогда табличный документ 'SpreadsheetFieldTemlate' равен:
			| 'String'                 | "Dimension 1"        | "Dimension 2"  | "Dimension 3" | "Dimension 4"           | "Dimension 5" | "Dimension 6"               | "Drilldown by currencies" | "Settings" |
			| "LinesGroup"            | ''                   | ''             | ''            | ''                      | ''            | ''                          | ''                     | ''          |
			| "LineSynthetic"        | ''                   | ''             | ''            | ''                      | ''            | ''                          | ''                     | ''          |
			| "LineDimension1"       | "Product categories" | ''             | ''            | ''                      | ''            | ''                          | ''                     | ''          |
			| "LineDimension2"       | "Product categories" | "Product range" | ''            | ''                      | ''            | ''                          | ''                     | ''          |
			| "LineDimension3"       | "Product categories" | "Product range" | "Counterparties" | ''                      | ''            | ''                          | ''                     | ''          |
			| "LineDimension4"       | "Product categories" | "Product range" | "Counterparties" | "Counterparty contracts" | ''            | ''                          | ''                     | ''          |
			| "LineDimension5"       | "Product categories" | "Product range" | "Counterparties" | "Counterparty contracts" | "Cash flow items"  | ''                          | ''                     | ''          |
			| "LineDimension6"       | "Product categories" | "Product range" | "Counterparties" | "Counterparty contracts" | "Cash flow items"  | "Income and expense items" | ''                     | ''          |
			| "LineDimension6Currency" | "Product categories" | "Product range" | "Counterparties" | "Counterparty contracts" | "Cash flow items"  | "Income and expense items" | '■'                    | ''          |
			| "LineDimensionCurrency"  | ''                   | ''             | ''            | ''                      | ''            | ''                          | '■'                    | ''          |

	* Удалим аналитику	
		Когда открылось окно "Edit tree"
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R10C6'
		И я нажимаю на кнопку с именем 'DeleteDimension'
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R10C5'
		И я нажимаю на кнопку с именем 'DeleteDimension'

	* Сравним макте с эталоном
		Тогда открылось окно "Edit tree"
		Тогда табличный документ 'SpreadsheetFieldTemlate' равен:
			| 'String'                 | "Dimension 1"        | "Dimension 2"  | "Dimension 3" | "Dimension 4"               | "Dimension 5" | "Dimension 6"               | "Drilldown by currencies" | "Settings" |
			| "LinesGroup"            | ''                   | ''             | ''            | ''                          | ''            | ''                          | ''                     | ''          |
			| "LineSynthetic"        | ''                   | ''             | ''            | ''                          | ''            | ''                          | ''                     | ''          |
			| "LineDimension1"       | "Product categories" | ''             | ''            | ''                          | ''            | ''                          | ''                     | ''          |
			| "LineDimension2"       | "Product categories" | "Product range" | ''            | ''                          | ''            | ''                          | ''                     | ''          |
			| "LineDimension3"       | "Product categories" | "Product range" | "Counterparties" | ''                          | ''            | ''                          | ''                     | ''          |
			| "LineDimension4"       | "Product categories" | "Product range" | "Counterparties" | "Counterparty contracts"     | ''            | ''                          | ''                     | ''          |
			| "LineDimension5"       | "Product categories" | "Product range" | "Counterparties" | "Counterparty contracts"     | "Cash flow items"  | ''                          | ''                     | ''          |
			| "LineDimension6"       | "Product categories" | "Product range" | "Counterparties" | "Counterparty contracts"     | "Cash flow items"  | "Income and expense items" | ''                     | ''          |
			| "LineDimension6Currency" | "Product categories" | "Product range" | "Counterparties" | "Income and expense items" | ''            | ''                          | '■'                    | ''          |
			| "LineDimensionCurrency"  | ''                   | ''             | ''            | ''                          | ''            | ''                          | '■'                    | ''          |

	* Заполним аналитику
		Когда открылось окно "Edit tree"
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R9C5'
		И я нажимаю на кнопку с именем 'CopyDimension'
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R10C5'
		И я нажимаю на кнопку с именем 'InsertDimension'	
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R10C9'
		И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
		Тогда открылось окно "GR_LineDimension6Currency (Report indicator dimension groups)"
		И в таблице 'TabFieldsDisplaySetting' я перехожу к строке:
			| "Group dimension" | "Required" |
			| "Dimension 5"      | "No"          |
		И в таблице 'TabFieldsDisplaySetting' я активизирую поле с именем 'DimensionKind'
		И в таблице 'TabFieldsDisplaySetting' я выбираю текущую строку
		И в таблице 'TabFieldsDisplaySetting' я нажимаю кнопку выбора у реквизита с именем 'DimensionKind'
		Тогда открылось окно "Dimension kinds (corporate)"
		И я нажимаю на кнопку с именем 'FormFind'
		Тогда открылась форма с именем 'UniversalListFindExtForm'
		И из выпадающего списка с именем 'FieldSelector' я выбираю точное значение "Code"
		И я меняю значение переключателя с именем 'CompareType' на "Exact match"
		И в поле с именем 'Pattern' я ввожу текст "VA0CFItems"	
		И я нажимаю на кнопку с именем 'Find'
		Тогда открылось окно "Dimension kinds (corporate)"
		И в таблице 'List' я активизирую поле с именем 'Description'
		И в таблице 'List' я выбираю текущую строку
		Тогда открылось окно "GR_LineDimension6Currency (Report indicator dimension groups)"
		И в таблице 'TabFieldsDisplaySetting' я завершаю редактирование строки
		И в таблице 'TabFieldsDisplaySetting' я перехожу к строке:
			| "Group dimension" | "Required" |
			| "Dimension 6"      | "No"          |
		И в таблице 'TabFieldsDisplaySetting' я выбираю текущую строку
		И в таблице 'TabFieldsDisplaySetting' я нажимаю кнопку выбора у реквизита с именем 'DimensionKind'
		Тогда открылось окно "Dimension kinds (corporate)"
		И я нажимаю на кнопку с именем 'FormFind'
		Тогда открылась форма с именем 'UniversalListFindExtForm'
		И из выпадающего списка с именем 'FieldSelector' я выбираю точное значение "Code"
		И я меняю значение переключателя с именем 'CompareType' на "Exact match"
		И в поле с именем 'Pattern' я ввожу текст "VA0IEItems"
		И я нажимаю на кнопку с именем 'Find'
		Тогда открылось окно "Dimension kinds (corporate)"
		И в таблице 'List' я активизирую поле с именем 'Description'
		И в таблице 'List' я выбираю текущую строку
		Тогда открылось окно "GR_LineDimension6Currency (Report indicator dimension groups) *"
		И в таблице 'TabFieldsDisplaySetting' я завершаю редактирование строки
		И я нажимаю на кнопку с именем 'FormWriteAndClose'	
		И я жду закрытия окна "GR_LineDimension6Currency (Report indicator dimension groups) *" в течение 5 секунд
		Тогда открылось окно "Edit tree"
		И из выпадающего списка с именем 'WorkMode' я выбираю точное значение "Indicator dimensions"

	* Сравним макет с эталоном
		Тогда открылось окно "Edit tree"
		Тогда табличный документ 'SpreadsheetFieldTemlate' равен:
			| 'String'                 | "Dimension 1"        | "Dimension 2"  | "Dimension 3" | "Dimension 4"           | "Dimension 5" | "Dimension 6"               | "Drilldown by currencies" | "Settings" |
			| "LinesGroup"            | ''                   | ''             | ''            | ''                      | ''            | ''                          | ''                     | ''          |
			| "LineSynthetic"        | ''                   | ''             | ''            | ''                      | ''            | ''                          | ''                     | ''          |
			| "LineDimension1"       | "Product categories" | ''             | ''            | ''                      | ''            | ''                          | ''                     | ''          |
			| "LineDimension2"       | "Product categories" | "Product range" | ''            | ''                      | ''            | ''                          | ''                     | ''          |
			| "LineDimension3"       | "Product categories" | "Product range" | "Counterparties" | ''                      | ''            | ''                          | ''                     | ''          |
			| "LineDimension4"       | "Product categories" | "Product range" | "Counterparties" | "Counterparty contracts" | ''            | ''                          | ''                     | ''          |
			| "LineDimension5"       | "Product categories" | "Product range" | "Counterparties" | "Counterparty contracts" | "Cash flow items"  | ''                          | ''                     | ''          |
			| "LineDimension6"       | "Product categories" | "Product range" | "Counterparties" | "Counterparty contracts" | "Cash flow items"  | "Income and expense items" | ''                     | ''          |
			| "LineDimension6Currency" | "Product categories" | "Product range" | "Counterparties" | "Counterparty contracts" | "Cash flow items"  | "Income and expense items" | '■'                    | ''          |
			| "LineDimensionCurrency"  | ''                   | ''             | ''            | ''                      | ''            | ''                          | '■'                    | ''          |

Сценарий: 01.05 Настройка валютных показателей

	И Я открываю контруктор отчета с именем "VA - Manual entry for all analytics"

	* Снимем раскрытие по валюте у показателя "СтрокаАналитикаВалюта"
		Когда открылось окно "Edit tree"
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R11C1'
		И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
		Когда открылось окно "LineDimensionCurrency (Report lines)"
		И элемент формы с именем 'DrillDownGroup' стал равен "GR_LineDimensionCurrency"
		И Я закрываю окно "LineDimensionCurrency (Report lines)"						
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R11C8'
		И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R11C1'
		И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
		Когда открылось окно "LineDimensionCurrency (Report lines)"		
		И элемент формы с именем 'DrillDownGroup' стал равен ''
		И Я закрываю окно "LineDimensionCurrency (Report lines)"

	* Проверим что группа раскрытия очистились и у показателей
		Когда открылось окно "Edit tree"
		И из выпадающего списка с именем 'WorkMode' я выбираю точное значение "Report structure"
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R11C2'
		И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке				
		Когда открылось окно "LineDimensionCurrency quantity (Report indicators)"
		И элемент формы с именем 'DrillDownGroup' стал равен ''
		И элемент формы с именем 'ShouldRecalculateForeignCurrencyAmount' стал равен 'No'
		И Я закрываю окно "LineDimensionCurrency quantity (Report indicators)"

	* Снова установим раскрытие по валютам
		Когда открылось окно "Edit tree"
		И из выпадающего списка с именем 'WorkMode' я выбираю точное значение "Indicator dimensions"
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R11C8'
		И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке

	* Настроим валютные показатели
		Когда открылось окно "Edit tree"
		И из выпадающего списка с именем 'WorkMode' я выбираю точное значение "Report structure"	
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R11C2'
		И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
		Тогда открылось окно "LineDimensionCurrency quantity (Report indicators)"
		И элемент формы с именем 'ShouldRecalculateForeignCurrencyAmount' стал равен 'Yes'
		И я изменяю флаг с именем 'ShouldRecalculateForeignCurrencyAmount'
		И я нажимаю на кнопку с именем 'FormWriteAndClose'
		И я жду закрытия окна "LineDimensionCurrency quantity (Report indicators) *" в течение 20 секунд
		Тогда открылось окно "Edit tree"
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R11C3'
		И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
		Тогда открылось окно "LineDimensionCurrency price (Report indicators)"
		И элемент формы с именем 'ShouldRecalculateForeignCurrencyAmount' стал равен 'Yes'
		И Я закрываю окно "LineDimensionCurrency price (Report indicators)"
		Тогда открылось окно "Edit tree"
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R10C2'
		И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
		Тогда открылось окно "LineDimension6Currency quantity (Report indicators)"
		И элемент формы с именем 'ShouldRecalculateForeignCurrencyAmount' стал равен 'Yes'
		И я изменяю флаг с именем 'ShouldRecalculateForeignCurrencyAmount'
		И я нажимаю на кнопку с именем 'FormWriteAndClose'
		И я жду закрытия окна "LineDimension6Currency quantity (Report indicators) *" в течение 20 секунд
		Тогда открылось окно "Edit tree"
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R10C3'
		И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
		Тогда открылось окно "LineDimension6Currency price (Report indicators)"
		И элемент формы с именем 'ShouldRecalculateForeignCurrencyAmount' стал равен 'Yes'
		И я нажимаю на кнопку с именем 'FormWriteAndClose'

Сценарий: 01.06 Работа в контрукторе отчета - Ввод формул

	И Я открываю контруктор отчета с именем "VA - Manual entry for all analytics"

	* Проверяем кнопку 'Сумма показателей' - 'ГруппаСтрок - Количество'
		Когда открылось окно "Edit tree*"
		И из выпадающего списка с именем 'WorkMode' я выбираю точное значение "Indicators calculation formulas"				
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R2C2'
		И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
		И в поле с именем 'TextDocumentFieldProcedure' я ввожу текст ' '
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R3C2:R11C2'
		И я нажимаю на кнопку с именем 'ButtonSum'
		И я нажимаю на кнопку с именем 'WriteAndCollapse'

	* Вводим формулу вручную - 'ГруппаСтрок - Цена'
		Когда открылось окно "Edit tree*"
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R2C3'
		И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
		И в поле с именем 'TextDocumentFieldProcedure' я ввожу текст ' '
		И в поле с именем 'TextDocumentFieldProcedure' я ввожу текст "({VAManualEntryForAllAnalytics.LineSynthetic_Price1}+{VAManualEntryForAllAnalytics.LineANLT1_Price1}+{VAManualEntryForAllAnalytics.LineANLT2_Price1}+{VAManualEntryForAllAnalytics.LineANLT3_Price1}+{VAManualEntryForAllAnalytics.LineANLT4_Price1}+{VAManualEntryForAllAnalytics.LineANLT5_Price1}+{VAManualEntryForAllAnalytics.LineANLT6_Price1}+{VAManualEntryForAllAnalytics.LineANLT6Currency_Price1}+{VAManualEntryForAllAnalytics.LineANLTCurrency_Price1})/9"
		И я нажимаю на кнопку с именем 'WriteAndCollapse'

	* Вводим формулу кнопками - 'ГруппаСтрок - Сумма'	
		Когда открылось окно "Edit tree*"
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R2C4'
		И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
		И в поле с именем 'TextDocumentFieldProcedure' я ввожу текст ' '
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R2C2'
		И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
		И я нажимаю на кнопку с именем 'ButtonMultiply'
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R2C3'
		И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
		И я нажимаю на кнопку с именем 'WriteAndCollapse'

	* Копируем формулу - 'СтрокаСинтетика - Сумма'
		Когда открылось окно "Edit tree*"
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R2C4'
		И я нажимаю на кнопку с именем 'CopyFormula'
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R3C4'
		И я нажимаю на кнопку с именем 'InsertFormula'
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R3C4'
		И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
		И в поле с именем 'TextDocumentFieldProcedure' я ввожу текст ' '
		И я нажимаю на кнопку с именем 'WriteAndCollapse'

	* Вводим формулу через конструктор - 'СтрокаСинтетика - Сумма'
		Когда открылось окно "Edit tree*"
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R3C4'
		И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
		И я нажимаю на кнопку с именем 'RefToIndicator1'
		И Я выбираю показатель с кодом "LineSynthetic_Quantity1" вида отчета "VA - Manual entry for all analytics"
		Тогда открылось окно "Edit tree*"
		И я нажимаю на кнопку с именем 'ButtonMultiply'
		И я нажимаю на кнопку с именем 'RefToIndicator1'
		И Я выбираю показатель с кодом "LineSynthetic_Price1"
		Тогда открылось окно "Edit tree*"
		И я нажимаю на кнопку с именем 'WriteAndCollapse'

	* Вводим формулу кнопками - 'СтрокаАналитика1 - Сумма'
		Когда открылось окно "Edit tree*"
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R4C4'
		И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
		И в поле с именем 'TextDocumentFieldProcedure' я ввожу текст ' '
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R4C2'
		И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
		И я нажимаю на кнопку с именем 'ButtonMultiply'
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R4C3'
		И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
		И я нажимаю на кнопку с именем 'WriteAndCollapse'

	* Вводим формулу копированием - 'СтрокаАналитика6Валюта - Сумма'
		Когда открылось окно "Edit tree*"
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R4C4'
		И я нажимаю на кнопку с именем 'CopyFormula'
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R10C4'
		И я нажимаю на кнопку с именем 'InsertFormula'

	* Редактируем формулу через форму источников данных
		* Добавляем операнд "Количество"
			Когда открылось окно "Edit tree*"
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R10C4'
			И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
			И я нажимаю на кнопку с именем 'AddOperand1'
			Когда открылось окно "Data sources"
			И я нажимаю на кнопку с именем 'FormFind'
			Тогда открылась форма с именем 'UniversalListFindExtForm'
			И в поле с именем 'Pattern' я ввожу текст "VA - Manual entry for all analytics_LineDimension1 quantity"
			И я меняю значение переключателя с именем 'CompareType' на "Exact match"
			И я нажимаю на кнопку с именем 'Find'
			Тогда открылось окно "Data sources"
			И я выбираю пункт контекстного меню с именем 'ListContextMenuChange' на элементе формы с именем 'List'
			Тогда открылось окно "VA - Manual entry for all analytics_LineDimension1 quantity (Data source)"
			И я нажимаю кнопку выбора у поля с именем 'IndicatorFilter'
			И Я выбираю показатель с кодом "LineANLT6Currency_Quantity1"
			Тогда открылось окно "VA - Manual entry for all analytics_LineDimension1 quantity (Data source) *"
			И я нажимаю на кнопку с именем 'FormWriteAndClose'
			И я жду закрытия окна "VA - Manual entry for all analytics_LineDimension1 quantity *" в течение 5 секунд
		* Добавляем операнд "Цена"
			Когда открылось окно "Data sources"
			И я нажимаю на кнопку с именем 'FormFind'
			Тогда открылась форма с именем 'UniversalListFindExtForm'
			И в поле с именем 'Pattern' я ввожу текст "VA - Manual entry for all analytics_LineDimension1 price"
			И я меняю значение переключателя с именем 'CompareType' на "Exact match"
			И я нажимаю на кнопку с именем 'Find'
			Тогда открылось окно "Data sources"
			И я выбираю пункт контекстного меню с именем 'ListContextMenuChange' на элементе формы с именем 'List'
			Когда открылось окно "VA - Manual entry for all analytics_LineDimension1 price (Data source)"
			И я нажимаю кнопку выбора у поля с именем 'IndicatorFilter'
			И Я выбираю показатель с кодом "LineANLT6Currency_Price1"
			Тогда открылось окно "VA - Manual entry for all analytics_LineDimension1 price (Data source) *"
			И я нажимаю на кнопку с именем 'FormWriteAndClose'
			И я жду закрытия окна "VA - Manual entry for all analytics_LineDimension1 price *" в течение 5 секунд
			Тогда открылось окно "Data sources"
			И Я закрываю окно "Data sources"
			Тогда открылось окно "Edit tree*"
			И я нажимаю на кнопку с именем 'UndoFormulaEdit'
			
	* Копируем формулу во все показатели
		Когда открылось окно "Edit tree*"
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R10C1'
		И я нажимаю на кнопку с именем 'RowsTreeRowMoveUp'
		И я нажимаю на кнопку с именем 'RowsTreeRowMoveUp'
		И я нажимаю на кнопку с именем 'RowsTreeRowMoveUp'
		И я нажимаю на кнопку с именем 'RowsTreeRowMoveUp'
		И я нажимаю на кнопку с именем 'RowsTreeRowMoveUp'
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R5C4'
		И я нажимаю на кнопку с именем 'CopyAndShiftDown'
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R5C1'
		И я нажимаю на кнопку с именем 'RowsTreeRowMoveDown'
		И я нажимаю на кнопку с именем 'RowsTreeRowMoveDown'
		И я нажимаю на кнопку с именем 'RowsTreeRowMoveDown'
		И я нажимаю на кнопку с именем 'RowsTreeRowMoveDown'
		И я нажимаю на кнопку с именем 'RowsTreeRowMoveDown'
	
	* Проверим, что форма структуры работает		
		Когда открылось окно "Edit tree*"
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R10C4'		
		И я нажимаю на кнопку с именем 'ShowIndicatorTree'
		Тогда открылось окно "Indicator tree"
		И я нажимаю на кнопку с именем 'FormClose'
			
	* Проверим, что открывается и записывается форма правила расчета
		Когда открылось окно "Edit tree*"
		И я нажимаю на кнопку открытия поля с именем 'ProcessingRule'
		Тогда открылось окно "VA - Manual entry for all analytics (Calculation rules)"
		И я нажимаю на кнопку с именем 'FormWrite'
		И я нажимаю на кнопку с именем 'FormWriteAndClose'
		И я жду закрытия окна "VA - Manual entry for all analytics *" в течение 5 секунд
		Тогда открылось окно "Edit tree*"
		И я нажимаю на кнопку открытия поля с именем 'ProcessingRule'
		Тогда открылось окно "VA - Manual entry for all analytics (Calculation rules)"
		И Я закрываю окно "VA - Manual entry for all analytics *"

Сценарий: 01.07 Создание бланка вида отчета

	И Я для вида отчета "VA - Manual entry for all analytics" я создаю бланк по умолчанию

Сценарий: 01.08 Создание экземпляра отчета

	И Я создаю экземпляр отчета для вида отчета "VA - Manual entry for all analytics" сценарий "VA - Main scenario" период '1/1/2021' '3/31/2021' периодичность "Month" организация "Mercury LLC" проект "VA - Main project" аналитики '' '' '' '' '' ''
	Дано Табличный документ 'SpreadsheetFieldTemlate' равен макету '\\Макеты\ВА_ВидОтчетаСАналитиками_Пустой.mxl'
		
	* Вводим значения в таблицу
		И Я ввожу значение '123.00000' в ячейку 'R7C2'

		И Я добавляю значения с раскрытием показателей в ячейку 'R8C2'
			| "VA0ProCate"           | 'Value1'    |
			| "Software products" | '1,000.00000'  |

		И Я добавляю значения с раскрытием показателей в ячейку 'R10C2'
			| "VA0ProCate"           | "VA0Product"                | 'Value1'    |
			| "Software products" | "5C:Corporate performance management" | '2,000.00000'  |

		И Я добавляю значения с раскрытием показателей в ячейку 'R13C2'
			| "VA0ProCate"           | "VA0Product"                | "VA0Counter"      | 'Value1'    |
			| "Software products" | "5C:Corporate performance management" | "LLC \"Ganymede\"" | '3,000.00000'  |

		И Я добавляю значения с раскрытием показателей в ячейку 'R17C2'
			| "VA0ProCate"           | "VA0Product"                | "VA0Counter"      | "VA0Contrac"  | 'Value1'    |
			| "Software products" | "5C:Corporate performance management" | "LLC \"Ganymede\"" | "Ganymede-001" | '4,000.00000'  |

		И Я добавляю значения с раскрытием показателей в ячейку 'R22C2'
			| "VA0ProCate"           | "VA0Product"                | "VA0Counter"      | "VA0Contrac"  | "VA0CFItems"                       | 'Value1'    |
			| "Software products" | "5C:Corporate performance management" | "LLC \"Ganymede\"" | "Ganymede-001" | "3Software sale" | '5,000.00000'  |

		И Я добавляю значения с раскрытием показателей в ячейку 'R28C2'
			| "VA0ProCate"           | "VA0Product"                | "VA0Counter"      | "VA0Contrac"  | "VA0CFItems"                       | "VA0IEItems"                       | 'Value1'    |
			| "Software products" | "5C:Corporate performance management" | "LLC \"Ganymede\"" | "Ganymede-001" | "3Software sale" | "3Software sale" | '6,000.00000'  |

		И Я добавляю значения с раскрытием показателей в ячейку 'R35C2'
			| "VA0ProCate"           | "VA0Product"                | "VA0Counter"      | "VA0Contrac"  | "VA0CFItems"                       | "VA0IEItems"                       | 'DimensionCurrency' | 'Value1'    |
			| "Software products" | "5C:Corporate performance management" | "LLC \"Ganymede\"" | "Ganymede-001" | "3Software sale" | "3Software sale" | 'RUB'             | '1,100.00000'  |
			| "Software products" | "5C:Corporate performance management" | "LLC \"Ganymede\"" | "Ganymede-001" | "3Software sale" | "3Software sale" | 'USD'             | '1,200.00000'  |
			| "Software products" | "5C:Corporate performance management" | "LLC \"Ganymede\"" | "Ganymede-001" | "3Software sale" | "3Software sale" | 'EUR'             | '1,300.00000'  |

	* Запомним заголовок окна
		И Открылся экземпляр отчета для вида отчета "VA - Manual entry for all analytics" валюта 'RUB' организация "Mercury LLC" сценарий "VA - Main scenario" периодичность "Month" проект "VA - Main project" аналитики '' '' '' '' '' ''
		И я запоминаю текущее окно как 'WindowTitle'

	* Тестируем кнопку копирования вниз и кнопку очистики		
		Когда открылось окно '$WindowTitle$'
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R7C3'
		И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
		И в табличный документ 'SpreadsheetFieldTemlate' я ввожу текст '55.00000'
		И я нажимаю на кнопку с именем 'SpreadsheetFieldTemplateCopyDataOnColumn'
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R35C3:R45C3'
		И я нажимаю на кнопку с именем 'SpreadsheetFieldTemplateClearRange'
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R42C3'
		И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
		И в табличный документ 'SpreadsheetFieldTemlate' я ввожу текст '11.00000'
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R43C3'
		И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
		И в табличный документ 'SpreadsheetFieldTemlate' я ввожу текст '22.00000'
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R44C3'
		И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
		И в табличный документ 'SpreadsheetFieldTemlate' я ввожу текст '33.00000'

	* Копирование вправо по строке
		Когда открылось окно '$WindowTitle$'
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R6C2:R44C2'
		И я нажимаю на кнопку с именем 'SpreadsheetFieldTemplateCopyDataOnRow'
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R6C3:R44C3'
		И я нажимаю на кнопку с именем 'SpreadsheetFieldTemplateCopyDataOnRow'
	
	* Изменение на значение
		И Я изменяю значение на '100.00000' в ячейке 'R7C6'
		Тогда открылось окно '$WindowTitle$'
		
	* Копирование вниз по колонке
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R7C6'
		И я нажимаю на кнопку с именем 'SpreadsheetFieldTemplateCopyDataOnColumn'

	* Изменение на процент
		И Я изменяю значение на '100.00000' процентов в ячейке 'R7C9'
		Тогда открылось окно '$WindowTitle$'
	
	* Копирование вниз по колонке
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R7C9'
		И я нажимаю на кнопку с именем 'SpreadsheetFieldTemplateCopyDataOnColumn'

	* Копирование и вставка из буфера обмена
		Когда открылось окно '$WindowTitle$'
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R42C3:R44C3'
		И я нажимаю на кнопку с именем 'CopyToClipboard'
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R42C6:R44C6'
		И я вставляю из буфера обмена в макете			
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R42C9:R44C9'
		И я вставляю из буфера обмена в макете

	* Очистка диапазона
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R42C9:R44C9'
		И я нажимаю на кнопку с именем 'SpreadsheetFieldTemplateClearRange'	

	* Установка значения вручную
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R42C9'
		И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
		И в табличный документ 'SpreadsheetFieldTemlate' я ввожу текст '22.00000'

	* Установим значение количества для валютного показателя
		Когда открылось окно '$WindowTitle$'
		И Я добавляю значения с раскрытием показателей в ячейку 'R45C2'
			| 'DimensionCurrency' | 'Value1'    |
			| 'EUR'             | '123.00000'    |
			| 'USD'             | '456.00000'    |
			| 'RUB'             | '78900.00000'  |

	* Копируем значения для валютного показателя
		Когда открылось окно '$WindowTitle$'
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R46C2:R48C2'
		И я нажимаю на кнопку с именем 'SpreadsheetFieldTemplateCopyDataOnRow'

	* Установим значение цены для валютного показателя
		И Я ввожу значение '77.00000' в ячейку 'R46C3'
		И я нажимаю на кнопку с именем 'SpreadsheetFieldTemplateCopyDataOnColumn'				
		И Я ввожу значение '88.00000' в ячейку 'R46C6'
		И я нажимаю на кнопку с именем 'SpreadsheetFieldTemplateCopyDataOnColumn'		
		И Я ввожу значение '99.00000' в ячейку 'R46C9'
		И я нажимаю на кнопку с именем 'SpreadsheetFieldTemplateCopyDataOnColumn'		

	* Тестируем кнопку 'Отобразить примечания'
		Когда открылось окно '$WindowTitle$'
		И я нажимаю на кнопку с именем 'FormDisplayComments'
		И в поле с именем 'AnalyticalTemplateNote' я ввожу текст "Comment"
		И я нажимаю на кнопку с именем 'FormDisplayComments'
		И я нажимаю на кнопку с именем 'FormDisplayComments'
		И поле с именем 'AnalyticalTemplateNote' заполнено 
		И я нажимаю на кнопку с именем 'FormDisplayComments'

	* Добавляем Комментарии ячеек
		Когда открылось окно '$WindowTitle$'
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R6C2'
		И я нажимаю на кнопку с именем 'SpreadsheetFieldTemplateLeaveCommentToIndicator'
		Тогда открылось окно "Comments"
		И в поле с именем 'NewComment' я ввожу текст "Comment Group"
		И я нажимаю на кнопку с именем 'WriteComment'
		Тогда открылось окно '$WindowTitle$'
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R7C3'
		И я нажимаю на кнопку с именем 'SpreadsheetFieldTemplateLeaveCommentToIndicator'
		Тогда открылось окно "Comments"
		И в поле с именем 'NewComment' я ввожу текст "Comment Synthetic"
		И я нажимаю на кнопку с именем 'WriteComment'
		Тогда открылось окно '$WindowTitle$'
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R9C4'
		И я нажимаю на кнопку с именем 'SpreadsheetFieldTemplateLeaveCommentToIndicator'
		Тогда открылось окно "Comments"
		И в поле с именем 'NewComment' я ввожу текст "Comment Dimension 1"
		И я нажимаю на кнопку с именем 'WriteComment'
		Тогда открылось окно '$WindowTitle$'
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R12C5'
		И я нажимаю на кнопку с именем 'SpreadsheetFieldTemplateLeaveCommentToIndicator'
		Тогда открылось окно "Comments"
		И в поле с именем 'NewComment' я ввожу текст "Comment Dimension 2"
		И я нажимаю на кнопку с именем 'WriteComment'
		Тогда открылось окно '$WindowTitle$'
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R16C6'
		И я нажимаю на кнопку с именем 'SpreadsheetFieldTemplateLeaveCommentToIndicator'
		Тогда открылось окно "Comments"
		И в поле с именем 'NewComment' я ввожу текст "Comment Dimension 3"
		И я нажимаю на кнопку с именем 'WriteComment'
		Тогда открылось окно '$WindowTitle$'
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R21C7'
		И я нажимаю на кнопку с именем 'SpreadsheetFieldTemplateLeaveCommentToIndicator'
		Тогда открылось окно "Comments"
		И в поле с именем 'NewComment' я ввожу текст "Comment Dimension 4"
		И я нажимаю на кнопку с именем 'WriteComment'
		Тогда открылось окно '$WindowTitle$'
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R27C8'
		И я нажимаю на кнопку с именем 'SpreadsheetFieldTemplateLeaveCommentToIndicator'
		Тогда открылось окно "Comments"
		И в поле с именем 'NewComment' я ввожу текст "Comment Dimension 5"
		И я нажимаю на кнопку с именем 'WriteComment'
		Тогда открылось окно '$WindowTitle$'
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R34C9'
		И я нажимаю на кнопку с именем 'SpreadsheetFieldTemplateLeaveCommentToIndicator'
		Тогда открылось окно "Comments"
		И в поле с именем 'NewComment' я ввожу текст "Comment Dimension 6"
		И я нажимаю на кнопку с именем 'WriteComment'
		Тогда открылось окно '$WindowTitle$'
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R42C10'
		И я нажимаю на кнопку с именем 'SpreadsheetFieldTemplateLeaveCommentToIndicator'
		Тогда открылось окно "Comments"
		И в поле с именем 'NewComment' я ввожу текст "Comment Dimension 6 Currency"
		И я нажимаю на кнопку с именем 'WriteComment'
		Тогда открылось окно '$WindowTitle$'
	
	* Проверяем работу формы комментариев
		* Комментарий группы
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R45C2'
			И я нажимаю на кнопку с именем 'SpreadsheetFieldTemplateLeaveCommentToIndicator'
			Тогда открылось окно '$WindowTitle$'
		* Отмена комментария	
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R47C2'
			И я нажимаю на кнопку с именем 'SpreadsheetFieldTemplateLeaveCommentToIndicator'
			Тогда открылось окно "Comments"
			И в поле с именем 'NewComment' я ввожу текст "Comment"
			И Я закрываю окно "Comments"
		* Ввод комментария	
			Тогда открылось окно '$WindowTitle$'
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R47C2'
			И я нажимаю на кнопку с именем 'SpreadsheetFieldTemplateLeaveCommentToIndicator'
			Тогда открылось окно "Comments"
			Тогда элемент формы с именем 'CommentsHistory' стал равен ''
			Тогда элемент формы с именем 'NewComment' стал равен ''
			И в поле с именем 'NewComment' я ввожу текст "Comment Currency"
			И я нажимаю на кнопку с именем 'WriteComment'
		* История комментария	
			Тогда открылось окно '$WindowTitle$'
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R47C2'
			И я нажимаю на кнопку с именем 'SpreadsheetFieldTemplateLeaveCommentToIndicator'
			Тогда открылось окно "Comments"
			Тогда элемент формы с именем 'CommentsHistory' стал равен по шаблону
				|'* (*): '|
				|"Comment Currency"|
			Тогда элемент формы с именем 'NewComment' стал равен ''
			И в поле с именем 'NewComment' я ввожу текст "Comment Currency 2"
			И я нажимаю на кнопку с именем 'WriteComment'
		* История двух комментариев
			Тогда открылось окно '$WindowTitle$'
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R47C2'
			И я нажимаю на кнопку с именем 'SpreadsheetFieldTemplateLeaveCommentToIndicator'
			Тогда открылось окно "Comments"
			Тогда элемент формы с именем 'CommentsHistory' стал равен по шаблону
				|'* (*): '|
				|"Comment Currency"|
				|'* (*): '|
				|"Comment Currency 2"|
			И Я закрываю окно "Comments"

	* Запишем и закроем документ
		Тогда открылось окно '$WindowTitle$'
		И я нажимаю на кнопку с именем 'WriteAndClose'
		И я жду закрытия окна '$WindowTitle$' в течение 60 секунд		

	И я закрываю сеанс текущего клиента тестирования

Сценарий: 01.09 Проверяем движения документа

	* Открываем документ
		И Я нахожу в списке вид отчета с именем "VA - Manual entry for all analytics"
		Когда открылось окно "Report kinds and templates"
		И в таблице 'ReportKindList' я нажимаю на кнопку с именем 'ReportKindListOpenInstancesList'
		Тогда открылось окно "Report instances"
		И в таблице 'List' я выбираю текущую строку

	* Запомним заголовок окна
		И Открылся экземпляр отчета для вида отчета "VA - Manual entry for all analytics" валюта 'RUB' организация "Mercury LLC" сценарий "VA - Main scenario" периодичность "Month" проект "VA - Main project" аналитики '' '' '' '' '' ''

	* Загружаем эталонный макет
		Когда открылось окно '$WindowTitle$'
		И я буду выбирать внешний файл '$КаталогПроекта$\Макеты\ВА_ВидОтчетаСАналитиками_Меркурий.mxl' 
		И я нажимаю на кнопку с именем 'FormImportRefTemplate'
		И Пауза 1

	* Сравниваем с эталонным макетом
		Когда открылось окно '$WindowTitle$'
		И я нажимаю на кнопку с именем 'FormCompareWithRefTemplateByTemplate'
		// ДОДЕЛАТЬ, Временная заглушка для CPMWE, пока не приехали форматы
		Если 'NOT $$ЭтоPerform$$' Тогда
			Тогда открылось окно "Documents are identical: Compare spreadsheet documents"
		И я изменяю флаг с именем 'AreOnlyValuesCompared'
		И я нажимаю на кнопку с именем 'FormCompareDocuments'
		Тогда открылось окно "Documents are identical: Compare spreadsheet documents"
		И я нажимаю на кнопку с именем 'FormClose'

	* Проверяем движения документа
		Когда открылось окно '$WindowTitle$'
		И я нажимаю на кнопку с именем 'FormOpenDocumentRegisterRecordsFlatTab'
		Тогда открылось окно "Flat table of indicator values"
		И я жду когда в табличном документе 'ReportSpreadsheetDocument' заполнится ячейка 'R2C1' в течение 30 секунд
		Дано Табличный документ 'ReportSpreadsheetDocument' равен макету '\\Макеты\ВА_ВидОтчетаСАналитиками_Меркурий_Движения.mxl' по шаблону
		И Я закрываю окно "Flat table of indicator values"

	* Запишем и закроем документ
		Тогда открылось окно '$WindowTitle$'
		И я нажимаю на кнопку с именем 'WriteAndClose'
		И я жду закрытия окна '$WindowTitle$' в течение 60 секунд

Сценарий: 01.10 Копирование экземпляра отчета

	* Откроем экземпляры отчетов
		И В командном интерфейсе я выбираю "Budgeting, reporting, and analysis" "Report instances"
		Тогда открылось окно "Report instances"

	* Фильтр по сценарию
		И я устанавливаю флаг с именем 'UseScenario'
		И я нажимаю кнопку выбора у поля с именем 'FilteringByScenario'	
		Тогда открылось окно "Value list"
		И Пока в таблице 'ValueList' количество строк 'больше' 0 Тогда
			И я выбираю пункт контекстного меню с именем 'ValueListContextMenuDelete' на элементе формы с именем 'ValueList'	
		Когда открылось окно "Value list"
		И я нажимаю на кнопку с именем 'Add'
		И в таблице 'ValueList' из выпадающего списка с именем 'Value' я выбираю по строке "VA - Main scenario"
		И в таблице 'ValueList' я завершаю редактирование строки
		И я нажимаю на кнопку с именем 'OK'			

	* Фильтр по организации
		Когда открылось окно "Report instances"
		И я устанавливаю флаг с именем 'UseCompanies'
		Если в таблице 'Companies' есть строка Тогда
			| "Value"    | "Use" |
			| "System LLC" | "Yes"          |
			И в таблице 'Companies' я перехожу к строке:
				| "Value"    | "Use" |
				| "System LLC" | "Yes"          |
			И в таблице 'Companies' я снимаю флаг с именем 'CompaniesUse'
			И в таблице 'Companies' я завершаю редактирование строки
		И в таблице 'Companies' я перехожу к строке:
			| "Value"    | "Use" |
			| "System LLC" | "No"          |
		И в таблице 'Companies' я разворачиваю текущую строку
		Если в таблице 'Companies' есть строка Тогда
			| "Value"     | "Use" |
			| "Mercury LLC" | "No"          |
			И в таблице 'Companies' я перехожу к строке:
				| "Value"     | "Use" |
				| "Mercury LLC" | "No"          |
			И в таблице 'Companies' я устанавливаю флаг с именем 'CompaniesUse'
			И в таблице 'Companies' я завершаю редактирование строки
		И в таблице 'Companies' я перехожу к строке:
			| "Value"     | "Use" |
			| "Mercury LLC" | "Yes"           |

	* Фильтр по виду отчета
		Когда открылось окно "Report instances"
		И я устанавливаю флаг с именем 'UseReportTypes'
		Если в таблице 'ReportsKinds' есть строка Тогда
			| "Value"            | "Use" |
			| "VA - Report group" | "Yes"           |
			И в таблице 'ReportsKinds' я перехожу к строке:
				| "Value"            | "Use" |
				| "VA - Report group" | "Yes"           |
			И в таблице 'ReportsKinds' я снимаю флаг с именем 'CompaniesUse'
			И в таблице 'ReportsKinds' я завершаю редактирование строки
		И в таблице 'ReportsKinds' я перехожу к строке:
			| "Value"            | "Use" |
			| "VA - Report group" | "No"          |
		И в таблице 'ReportsKinds' я разворачиваю текущую строку
		Если в таблице 'ReportsKinds' есть строка Тогда
			| "Value"                            | "Use" |
			| "VA - Manual entry for all analytics" | "No"          |
			И в таблице 'ReportsKinds' я перехожу к строке:
				| "Value"                            | "Use" |
				| "VA - Manual entry for all analytics" | "No"          |
			И в таблице 'ReportsKinds' я устанавливаю флаг с именем 'ReportsKindsUse'
			И в таблице 'ReportsKinds' я завершаю редактирование строки
		И в таблице 'ReportsKinds' я перехожу к строке:
			| "Value"                            | "Use" |
			| "VA - Manual entry for all analytics" | "Yes"           |

	* Копирование экземпляра
		Когда открылось окно "Report instances"
		И я выбираю пункт контекстного меню с именем 'ListContextMenuCopy' на элементе формы с именем 'List'
		Когда открылось окно "Specify document key attributes"
		И я нажимаю на кнопку с именем 'OKButton'
		Тогда в логе сообщений TestClient есть строки:
			|"A report instance with key attributes you specified already exists."|						
		Когда открылось окно "Specify document key attributes"
		И я нажимаю кнопку выбора у поля с именем 'Organization'
		Если '$$IsCPM$$' Тогда
			И Я в списке "Business units" по полю "Name in the application" ищу элемент "Earth LLC" "Exact match"
		Если '$$IsERPCPM$$' Тогда
			И Я в списке "Companies" по полю "Рабочее наименование" ищу элемент "Earth LLC" "Exact match"
		Когда открылось окно "Specify document key attributes"
		И я нажимаю на кнопку с именем 'OKButton'

	* Сверим результат	
		Тогда Открылся экземпляр отчета для вида отчета "VA - Manual entry for all analytics" валюта 'RUB' организация "Earth LLC" сценарий "VA - Main scenario" периодичность "Month" проект "VA - Main project" аналитики '' '' '' '' '' ''
		Дано Табличный документ 'SpreadsheetFieldTemlate' равен макету '\\Макеты\ВА_ВидОтчетаСАналитиками_Меркурий.mxl'

	* Добавляем комментарий
		Когда открылось окно '$WindowTitle$'
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R34C2'
		И я нажимаю на кнопку с именем 'SpreadsheetFieldTemplateLeaveCommentToIndicator'
		Тогда открылось окно "Comments"
		И в поле с именем 'NewComment' я ввожу текст "Comment Dimension 6"
		И я нажимаю на кнопку с именем 'WriteComment'

	* Еще раз меняем организацию		
		И я нажимаю на кнопку с именем 'FormOpenSettings'
		Тогда открылось окно "Edit report settings"
		И из выпадающего списка с именем 'Organization' я выбираю по строке "Mars LLC"
		И я нажимаю на кнопку с именем 'FormApplyANDClose'
		Тогда открылось окно "1C:Enterprise"
		И я нажимаю на кнопку с именем 'Button0'
		Тогда открылось окно "Report instances"
		И в таблице 'Companies' я перехожу к строке:
			| "Value"     | "Use" |
			| "Mercury LLC" | "Yes"           |
		И в таблице 'Companies' я изменяю флаг с именем 'CompaniesUse'
		И в таблице 'Companies' я завершаю редактирование строки
		И в таблице 'Companies' я перехожу к строке:
			| "Value"  | "Use" |
			| "Mars LLC"  | "No"          |
		И в таблице 'Companies' я изменяю флаг с именем 'CompaniesUse'
		И в таблице 'Companies' я завершаю редактирование строки
		И в таблице 'List' я выбираю текущую строку	
		И Открылся экземпляр отчета для вида отчета "VA - Manual entry for all analytics" валюта 'RUB' организация "Mars LLC" сценарий "VA - Main scenario" периодичность "Month" проект "VA - Main project" аналитики '' '' '' '' '' ''

	* Добавляем комментарии			
		Когда открылось окно '$WindowTitle$'
		И я нажимаю на кнопку с именем 'EnableEdit'				
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R43C3'
		И я нажимаю на кнопку с именем 'SpreadsheetFieldTemplateLeaveCommentToIndicator'
		Тогда открылось окно "Comments"
		И в поле с именем 'NewComment' я ввожу текст "Comment Dimension 6 Currency"
		И я нажимаю на кнопку с именем 'WriteComment'		
		Тогда открылось окно '$WindowTitle$'
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R46C4'
		И я нажимаю на кнопку с именем 'SpreadsheetFieldTemplateLeaveCommentToIndicator'
		Тогда открылось окно "Comments"
		И в поле с именем 'NewComment' я ввожу текст "Comment Dimension Currency"
		И я нажимаю на кнопку с именем 'WriteComment'

	* Еще раз меняем организацию		
		И я нажимаю на кнопку с именем 'FormOpenSettings'
		Тогда открылось окно "Edit report settings"
		И из выпадающего списка с именем 'Organization' я выбираю по строке "Venus LLC"
		И я нажимаю на кнопку с именем 'FormApplyANDClose'
		Тогда открылось окно "1C:Enterprise"
		И я нажимаю на кнопку с именем 'Button0'
		Тогда открылось окно "Report instances"
		И в таблице 'Companies' я перехожу к строке:
			| "Value" | "Use" |
			| "Mars LLC" | "Yes"           |
		И в таблице 'Companies' я изменяю флаг с именем 'CompaniesUse'
		И в таблице 'Companies' я завершаю редактирование строки
		И в таблице 'Companies' я перехожу к строке:
			| "Value"   | "Use" |
			| "Venus LLC" | "No"          |
		И в таблице 'Companies' я изменяю флаг с именем 'CompaniesUse'
		И в таблице 'Companies' я завершаю редактирование строки
		И в таблице 'List' я выбираю текущую строку
		И Открылся экземпляр отчета для вида отчета "VA - Manual entry for all analytics" валюта 'RUB' организация "Venus LLC" сценарий "VA - Main scenario" периодичность "Month" проект "VA - Main project" аналитики '' '' '' '' '' ''
		
	* Загружаем эталонный макет
		Когда открылось окно '$WindowTitle$'
		И я буду выбирать внешний файл '$КаталогПроекта$\\Макеты\ВА_ВидОтчетаСАналитиками_Венера.mxl' 
		И я нажимаю на кнопку с именем 'FormImportRefTemplate'
		И Пауза 5

	* Сравниваем с эталонным макетом
		Когда открылось окно '$WindowTitle$'
		// ДОДЕЛАТЬ, Временная заглушка для CPMWE, пока не приехали форматы
		Если '$$ЭтоPerform$$' Тогда
			И я нажимаю на кнопку с именем 'FormCompareWithRefTemplateByValue'					
		Иначе
			И я нажимаю на кнопку с именем 'FormCompareWithRefTemplateByTemplate'
		Тогда открылось окно "Documents are identical: Compare spreadsheet documents"
		И я нажимаю на кнопку с именем 'FormClose'

	* Проверяем движения документа
		Когда открылось окно '$WindowTitle$'
		И я нажимаю на кнопку с именем 'FormOpenDocumentRegisterRecordsFlatTab'
		Тогда открылось окно "Flat table of indicator values"
		И я жду когда в табличном документе 'ReportSpreadsheetDocument' заполнится ячейка 'R2C1' в течение 30 секунд
		Дано Табличный документ 'ReportSpreadsheetDocument' равен макету '\\Макеты\ВА_ВидОтчетаСАналитиками_Венера_Движения.mxl' по шаблону
		И Я закрываю окно "Flat table of indicator values"

	* Свернем все версии
		Когда открылось окно '$WindowTitle$'
		И я нажимаю на кнопку с именем 'FormVersionsManagement'
		Тогда открылось окно "Indicator version management"
		И я нажимаю на кнопку с именем 'ListCollapseTillVersion'
		Тогда открылось окно "1C:Enterprise"
		И я нажимаю на кнопку с именем 'Button0'
		Тогда открылось окно "Indicator version management *"
		И Я закрываю окно "Indicator version management *"						

	* Закрываем документ
		Когда открылось окно '$WindowTitle$'
		И я нажимаю на кнопку с именем 'WriteAndClose'
	
Сценарий: 01.11 Сохранение настроек формы списка экземпляров отчетов

	И Я запоминаю значение выражения '"Delete_" + StrReplace(New UUID, "-", "")' в переменную 'UID'

	* Откроем экземпляры отчетов
		И В командном интерфейсе я выбираю "Budgeting, reporting, and analysis" "Report instances"
		Тогда открылось окно "Report instances"
		Тогда я устанавливаю флаг с именем 'ShouldShowStandardFilters'
		И в таблице 'Filter' я нажимаю на кнопку с именем 'FilterUncheckAll'

	* Установим стандартые фильтры
		И я перехожу к закладке с именем 'Standard1'
		И в таблице 'Filter' я перехожу к строке:
			| "Comparison type" | "Use" | "Left value"        | "Display mode" |
			| "Equal to"         | "No"           | "Company" | "Quick access"    |
		И в таблице 'Filter' из выпадающего списка с именем 'FilterRightValue' я выбираю по строке "Venus LLC"
		
		И в таблице 'Filter' я перехожу к строке:
			| "Comparison type" | "Use" | "Left value"          | "Display mode" |
			| "Equal to"         | "No"           | "Report period" | "Quick access"    |
		И в таблице 'Filter' я нажимаю кнопку выбора у реквизита с именем 'FilterRightValue'
		Тогда открылось окно "Periods"
		И я нажимаю на кнопку с именем 'FormFind'
		Тогда открылась форма с именем 'UniversalListFindExtForm'
		И я меняю значение переключателя с именем 'CompareType' на "Exact match"
		И из выпадающего списка с именем 'Pattern' я выбираю по строке "January 2021"				
		И я нажимаю на кнопку с именем 'Find'
		Тогда открылось окно "Periods"
		И в таблице 'List' я выбираю текущую строку
	
	Тогда открылось окно "Report instances"
	И в таблице 'Filter' я перехожу к строке:
		| "Comparison type" | "Use" | "Left value"     | "Display mode" |
		| "Equal to"         | "No"           | "Scenario" | "Quick access"    |
	И в таблице 'Filter' из выпадающего списка с именем 'FilterRightValue' я выбираю по строке "VA - Main scenario"
	
	И в таблице 'Filter' я перехожу к строке:
		| "Comparison type" | "Use" | "Left value"       | "Display mode" |
		| "Equal to"         | "No"           | "Report kind" | "Quick access"    |
	И в таблице 'Filter' из выпадающего списка с именем 'FilterRightValue' я выбираю по строке "VA - Manual entry for all analytics"
	
	И в таблице 'Filter' я перехожу к строке:
		| "Comparison type" | "Use" | "Left value"   | "Display mode" |
		| "Equal to"         | "No"           | "Project" | "Quick access"    |
	И в таблице 'Filter' из выпадающего списка с именем 'FilterRightValue' я выбираю по строке "VA - Main project"

	* Сохраним настройку
		Когда открылось окно "Report instances"
		И я нажимаю на кнопку с именем 'SaveSettingAs'	
		Тогда открылось окно "Saved settings"
		И я выбираю пункт контекстного меню с именем 'ListContextMenuFind' на элементе формы с именем 'List'
		Тогда открылась форма с именем 'UniversalListFindExtForm'
		И из выпадающего списка с именем 'FieldSelector' я выбираю точное значение "Description"
		И я меняю значение переключателя с именем 'CompareType' на "Exact match"
		И в поле с именем 'Pattern' я ввожу текст "VA - Manual entry for all analytics - Venus LLC"
		И я нажимаю на кнопку с именем 'Find'
		Тогда открылось окно "Saved settings"
		И Пока в таблице 'List' количество строк 'больше' 0 Тогда
			И я выбираю пункт контекстного меню с именем 'ListContextMenuChange' на элементе формы с именем 'List'
			Тогда открылось окно "VA - Manual entry for all analytics - Venus LLC (Setup option)"
			И в поле с именем 'Description' я ввожу значение переменной 'UID'
			И я нажимаю на кнопку с именем 'FormWriteAndClose'
			И я жду закрытия окна "VA - Manual entry for all analytics - Venus LLC *" в течение 20 секунд
			
	Тогда открылось окно "Saved settings"
	И в поле с именем 'Description' я ввожу текст "VA - Manual entry for all analytics - Venus LLC"
	И я нажимаю на кнопку с именем 'FormSaveVariant'

Сценарий: 01.12 Отображение в дополнительной валюте

	* Открываем экземпляр отчета по сохраненной настройке
		И В командном интерфейсе я выбираю "Budgeting, reporting, and analysis" "Report instances"
		Тогда открылось окно "Report instances"
		И из выпадающего списка с именем 'SavedSetting' я выбираю по строке "VA - Manual entry for all analytics - Venus LLC"
		И в таблице 'List' я выбираю текущую строку	

	* Меняем параметры отображения в экземпляре отчета
		И Открылся экземпляр отчета для вида отчета "VA - Manual entry for all analytics" валюта 'RUB' организация "Venus LLC" сценарий "VA - Main scenario" периодичность "Month" проект "VA - Main project" аналитики '' '' '' '' '' ''
		И я нажимаю на кнопку с именем 'FormOpenSettings'
		Тогда открылось окно "Edit report settings"
		И я перехожу к закладке с именем 'GroupPageReportSettings'
		И из выпадающего списка с именем 'UnitOfMeasure' я выбираю точное значение "thousand"
		И из выпадающего списка с именем 'SelectedCurrency' я выбираю точное значение "USD"
		И в поле с именем 'CurrentPrecision' я ввожу текст '5'
		И я нажимаю на кнопку с именем 'FormApplyANDClose'

	* Запомним заголовок окна
		И Открылся экземпляр отчета для вида отчета "VA - Manual entry for all analytics" валюта 'USD' организация "Venus LLC" сценарий "VA - Main scenario" периодичность "Month" проект "VA - Main project" аналитики '' '' '' '' '' ''
		И я запоминаю текущее окно как 'WindowTitle'		

	* Добавляем комментарий в отчет с дополнительной валютой
		Тогда открылось окно '$WindowTitle$'
		И я нажимаю на кнопку с именем 'EnableEdit'				
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R6C2'
		И я нажимаю на кнопку с именем 'SpreadsheetFieldTemplateLeaveCommentToIndicator'
		Тогда открылось окно "Comments"
		И в поле с именем 'NewComment' я ввожу текст "Comment Group"
		И я нажимаю на кнопку с именем 'WriteComment'
		Когда открылось окно '$WindowTitle$'
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R47C2'
		И я нажимаю на кнопку с именем 'SpreadsheetFieldTemplateLeaveCommentToIndicator'
		Тогда открылось окно "Comments"
		И в поле с именем 'NewComment' я ввожу текст "Comment Dimension 6 Currency"
		И я нажимаю на кнопку с именем 'WriteComment'					

	* Сравниваем с эталоном
		Тогда открылось окно '$WindowTitle$'
		Дано Табличный документ 'SpreadsheetFieldTemlate' равен макету '\\Макеты\ВА_ВидОтчетаСАналитиками_Венера_USD'
		И Я закрываю окно '$WindowTitle$'
		Тогда открылось окно "1C:Enterprise"
		И я нажимаю на кнопку с именем 'Button1'

Сценарий: 01.13 Очистка показателей отчета

	* Открываем экземпляр отчета по сохраненной настройке
		И В командном интерфейсе я выбираю "Budgeting, reporting, and analysis" "Report instances"
		Тогда открылось окно "Report instances"
		И из выпадающего списка с именем 'SavedSetting' я выбираю по строке "VA - Manual entry for all analytics - Venus LLC"
		И в таблице 'List' я выбираю текущую строку

	* Запомним заголовок окна
		И Открылся экземпляр отчета для вида отчета "VA - Manual entry for all analytics" валюта 'RUB' организация "Venus LLC" сценарий "VA - Main scenario" периодичность "Month" проект "VA - Main project" аналитики '' '' '' '' '' ''
		И я запоминаю текущее окно как 'WindowTitle'		

	* Очищаем показатели
		Когда открылось окно '$WindowTitle$'
		И я нажимаю на кнопку с именем 'EnableEdit'		
		И я нажимаю на кнопку с именем 'Clear'
		Тогда открылось окно "1C:Enterprise"
		И я нажимаю на кнопку с именем 'Button0'
		Дано Табличный документ 'SpreadsheetFieldTemlate' равен макету '\\Макеты\ВА_ВидОтчетаСАналитиками_Пустой.mxl'

	* Закрываем документ
		Когда открылось окно '$WindowTitle$ *'
		И я нажимаю на кнопку с именем 'WriteAndClose'
		И я жду закрытия окна '$WindowTitle$ *' в течение 60 секунд

Сценарий: 01.14 Открытие версии

	* Открываем экземпляр отчета по сохраненной настройке
		И В командном интерфейсе я выбираю "Budgeting, reporting, and analysis" "Report instances"
		Тогда открылось окно "Report instances"
		И из выпадающего списка с именем 'SavedSetting' я выбираю по строке "VA - Manual entry for all analytics - Venus LLC"
		И в таблице 'List' я выбираю текущую строку

	* Запомним заголовок окна
		И Открылся экземпляр отчета для вида отчета "VA - Manual entry for all analytics" валюта 'RUB' организация "Venus LLC" сценарий "VA - Main scenario" периодичность "Month" проект "VA - Main project" аналитики '' '' '' '' '' ''
		И я запоминаю текущее окно как 'WindowTitle'		

	* Проверим количество версий
		Когда открылось окно '$WindowTitle$'
		И я нажимаю на кнопку с именем 'FormVersionsManagement'
		Когда открылось окно "Indicator version management"
		Когда в таблице 'List' количество строк 'равно' 2
		И Я закрываю окно "Indicator version management"

	* Откроем справочник версии
		Когда открылось окно '$WindowTitle$'
		И я нажимаю на кнопку с именем 'FormVersionsManagement'
		Когда открылось окно "Indicator version management"
		И в таблице 'List' я выбираю текущую строку
		Когда открылось окно "* (Version description)"
		И Я закрываю окно "* (Version description)"

	* Откроем версию
		Когда открылось окно "Indicator version management"
		И я нажимаю на кнопку с именем 'ListOpenVersion'
		Тогда открылось окно "VA - Manual entry for all analytics (Version view mode)"
		И я нажимаю на кнопку с именем 'FormFormulate'
		Дано Табличный документ 'SpreadsheetFieldTemlate' равен макету '\\Макеты\ВА_ВидОтчетаСАналитиками_Пустой.mxl'	
		И Я закрываю окно "VA - Manual entry for all analytics *"

	* Закроем окно версий
		Когда открылось окно "Indicator version management"
		И Я закрываю окно "Indicator version management"

Сценарий: 01.15 Удаление версии

	* Открываем экземпляр отчета по сохраненной настройке
		И В командном интерфейсе я выбираю "Budgeting, reporting, and analysis" "Report instances"
		Тогда открылось окно "Report instances"
		И из выпадающего списка с именем 'SavedSetting' я выбираю по строке "VA - Manual entry for all analytics - Venus LLC"
		И в таблице 'List' я выбираю текущую строку

	* Запомним заголовок окна
		И Открылся экземпляр отчета для вида отчета "VA - Manual entry for all analytics" валюта 'RUB' организация "Venus LLC" сценарий "VA - Main scenario" периодичность "Month" проект "VA - Main project" аналитики '' '' '' '' '' ''
		И я запоминаю текущее окно как 'WindowTitle'	

	* Удалим версию
		Когда открылось окно '$WindowTitle$'
		И я нажимаю на кнопку с именем 'FormVersionsManagement'
		Когда открылось окно "Indicator version management"
		И я нажимаю на кнопку с именем 'ListDeleteVersions'
		Тогда открылось окно "1C:Enterprise"
		И я нажимаю на кнопку с именем 'Button0'
		Тогда открылось окно "Indicator version management *"
		И Я закрываю окно "Indicator version management *"
	
	* Закрываем документ
		Тогда открылось окно '$WindowTitle$'
		И Я закрываю окно '$WindowTitle$'
		
	* Сравним с эталоном после удаления версий
		Тогда открылось окно "Report instances"
		И в таблице 'List' я выбираю текущую строку
		Тогда открылось окно '$WindowTitle$'
		// ДОДЕЛАТЬ, Временная заглушка для CPMWE, пока не приехали форматы
		Если '$$ЭтоPerform$$' Тогда
			И я нажимаю на кнопку с именем 'FormCompareWithRefTemplateByValue'					
		Иначе
			И я нажимаю на кнопку с именем 'FormCompareWithRefTemplateByTemplate'
		Тогда открылось окно "Documents are identical: Compare spreadsheet documents"
		И я нажимаю на кнопку с именем 'FormClose'	

Сценарий: 01.16 Сравнение версий

	* Открываем экземпляр отчета по сохраненной настройке
		И В командном интерфейсе я выбираю "Budgeting, reporting, and analysis" "Report instances"
		Тогда открылось окно "Report instances"
		И из выпадающего списка с именем 'SavedSetting' я выбираю по строке "VA - Manual entry for all analytics - Venus LLC"
		И в таблице 'List' я выбираю текущую строку

	* Запомним заголовок окна
		И Открылся экземпляр отчета для вида отчета "VA - Manual entry for all analytics" валюта 'RUB' организация "Venus LLC" сценарий "VA - Main scenario" периодичность "Month" проект "VA - Main project" аналитики '' '' '' '' '' ''
		И я запоминаю текущее окно как 'WindowTitle'	

	* Изменим показатели текущего отчета (процент)
		Когда открылось окно '$WindowTitle$'
		И я нажимаю на кнопку с именем 'EnableEdit'
		И Я изменяю значение на '100.00000' процентов в ячейке 'R6C2:R34C2'

	* Изменим показатели текущего отчета (значение)
		Тогда открылось окно '$WindowTitle$ *'
		И Я изменяю значение на '25.00000' в ячейке 'R6C3:R34C3'

	* Запишем документ
		Когда открылось окно '$WindowTitle$ *'
		И я нажимаю на кнопку с именем 'Write'		

	* Сравним версии
		Когда открылось окно '$WindowTitle$'
		И я нажимаю на кнопку с именем 'FormVersionsManagement'
		Когда открылось окно "Indicator version management"
		И в таблице 'List' я выделяю все строки
		И я нажимаю на кнопку с именем 'ListCompareVersions'
		Когда открылось окно "VA - Manual entry for all analytics (Two versions comparison mode)"
		Дано Табличный документ 'SpreadsheetFieldTemlate' равен макету '\\Макеты\ВА_ВидОтчетаСАналитиками_СравнениеВерсий_Различные.mxl'
		И Я закрываю окно "VA - Manual entry for all analytics *"

	* Закроем окно версий
		Когда открылось окно "Indicator version management"
		И Я закрываю окно "Indicator version management"

Сценарий: 01.17 Сворачивание до версии

	* Открываем экземпляр отчета по сохраненной настройке
		И В командном интерфейсе я выбираю "Budgeting, reporting, and analysis" "Report instances"
		Тогда открылось окно "Report instances"
		И из выпадающего списка с именем 'SavedSetting' я выбираю по строке "VA - Manual entry for all analytics - Venus LLC"
		И в таблице 'List' я выбираю текущую строку

	* Запомним заголовок окна
		И Открылся экземпляр отчета для вида отчета "VA - Manual entry for all analytics" валюта 'RUB' организация "Venus LLC" сценарий "VA - Main scenario" периодичность "Month" проект "VA - Main project" аналитики '' '' '' '' '' ''
		И я запоминаю текущее окно как 'WindowTitle'		

	* Свернем до версии
		Когда открылось окно '$WindowTitle$'
		И я нажимаю на кнопку с именем 'FormVersionsManagement'
		Тогда открылось окно "Indicator version management"
		И я нажимаю на кнопку с именем 'ListCollapseTillVersion'
		Тогда открылось окно "1C:Enterprise"
		И я нажимаю на кнопку с именем 'Button0'
		Тогда в таблице 'List' количество строк 'равно' 1
		Когда открылось окно "Indicator version management *"
		И Я закрываю окно "Indicator version management *"

	* Сравниваем с эталонным макетом
		Дано Табличный документ 'SpreadsheetFieldTemlate' равен макету '\\Макеты\ВА_ВидОтчетаСАналитиками_Венера_2.mxl'

	* Закрываем документ
		Когда открылось окно '$WindowTitle$'
		И я нажимаю на кнопку с именем 'WriteAndClose'
		
Сценарий: 01.18 Изменение отчета при выводе в тысячах

	* Открываем экземпляр отчета по сохраненной настройке
		И В командном интерфейсе я выбираю "Budgeting, reporting, and analysis" "Report instances"
		Тогда открылось окно "Report instances"
		И из выпадающего списка с именем 'SavedSetting' я выбираю по строке "VA - Manual entry for all analytics - Venus LLC"
		И в таблице 'List' я выбираю текущую строку

	* Запомним заголовок окна
		И Открылся экземпляр отчета для вида отчета "VA - Manual entry for all analytics" валюта 'RUB' организация "Venus LLC" сценарий "VA - Main scenario" периодичность "Month" проект "VA - Main project" аналитики '' '' '' '' '' ''

	* Меняем параметры отображения в экземпляре отчета
		Когда открылось окно '$WindowTitle$'
		И я нажимаю на кнопку с именем 'FormOpenSettings'
		Тогда открылось окно "Edit report settings"
		И я перехожу к закладке с именем 'GroupPageReportSettings'
		И из выпадающего списка с именем 'UnitOfMeasure' я выбираю точное значение "thousand"
		И в поле с именем 'CurrentPrecision' я ввожу текст '2'
		И я нажимаю на кнопку с именем 'FormApplyANDClose'

	* Открываем документ, вводим новые значения
		Тогда открылось окно '$WindowTitle$'
		И я нажимаю на кнопку с именем 'Edit'
		И Я изменяю значение на '1,000.00000' в ячейке 'R6C2:R44C2'
		Тогда открылось окно '$WindowTitle$'
		И я нажимаю на кнопку с именем 'WriteAndClose'
		И я жду закрытия окна '$WindowTitle$' в течение 20 секунд
	
	* Открываем документ, вводим новые значения
		Тогда открылось окно "Report instances"
		И в таблице 'List' я выбираю текущую строку
		Тогда открылось окно '$WindowTitle$'
		И я нажимаю на кнопку с именем 'Edit'
		И Я изменяю значение на '1,000.00000' в ячейке 'R6C2:R44C2'

	* Сравниваем с эталоном
		Дано Табличный документ 'SpreadsheetFieldTemlate' равен макету '\\Макеты\ВА_ВидОтчетаСАналитиками_Венера_3.mxl'

	* Записываем документ
		Когда открылось окно '$WindowTitle$'
		И я нажимаю на кнопку с именем 'WriteAndClose'
		И я жду закрытия окна '$WindowTitle$' в течение 20 секунд
			
Сценарий: 01.19 Созадем бланк сводной таблицы

	И Я для вида отчета "VA - Manual entry for all analytics" я создаю бланк сводной таблицы по умолчанию с отборами "Project"

	* Доработаем бланк
		Когда открылось окно "VA - Manual entry for all analytics (Report kinds)"
		И я нажимаю на кнопку открытия поля с именем 'DefaultPivotTableTemplate'
		Тогда Открылся бланк сводной таблицы для вида отчета "VA - Manual entry for all analytics"
		И я запоминаю текущее окно как 'WindowTitle'
		И я нажимаю на кнопку с именем 'ShowPeriodsSettings'
		И я изменяю флаг с именем 'ShouldShowTotalQuarter'
		И я нажимаю на кнопку с именем 'FormApply'		

	* Установим порядок колонок
		Когда открылось окно '$WindowTitle$ *'
		И я нажимаю на кнопку с именем 'ShowTableSettingsByAxes'
		Тогда открылось окно "Set up field location"
		И в таблице 'TableRows1' я перехожу к строке:
			| "Horizontally (in rows)" |
			| "Product categories"         |
		И я нажимаю на кнопку с именем 'RowsMoveUp'
		И я нажимаю на кнопку с именем 'RowsMoveUp'
		И я нажимаю на кнопку с именем 'RowsMoveUp'
		И я нажимаю на кнопку с именем 'RowsMoveUp'
		И я нажимаю на кнопку с именем 'RowsMoveUp'
		И я нажимаю на кнопку с именем 'RowsMoveUp'
		И в таблице 'TableRows1' я перехожу к строке:
			| "Horizontally (in rows)" |
			| "Product range"               |
		И я нажимаю на кнопку с именем 'RowsMoveUp'
		И я нажимаю на кнопку с именем 'RowsMoveUp'
		И я нажимаю на кнопку с именем 'RowsMoveUp'
		И я нажимаю на кнопку с именем 'RowsMoveUp'
		И я нажимаю на кнопку с именем 'RowsMoveUp'
		И я нажимаю на кнопку с именем 'RowsMoveUp'
		И я нажимаю на кнопку с именем 'RowsMoveDown'
		И в таблице 'TableRows1' я перехожу к строке:
			| "Horizontally (in rows)" |
			| "Counterparties"                |
		И я нажимаю на кнопку с именем 'RowsMoveUp'
		И я нажимаю на кнопку с именем 'RowsMoveUp'
		И я нажимаю на кнопку с именем 'RowsMoveUp'
		И я нажимаю на кнопку с именем 'RowsMoveUp'
		И я нажимаю на кнопку с именем 'RowsMoveUp'
		И я нажимаю на кнопку с именем 'RowsMoveUp'
		И я нажимаю на кнопку с именем 'RowsMoveDown'
		И я нажимаю на кнопку с именем 'RowsMoveDown'
		И в таблице 'TableRows1' я перехожу к строке:
			| "Horizontally (in rows)" |
			| "Counterparty contracts"      |
		И я нажимаю на кнопку с именем 'RowsMoveUp'
		И я нажимаю на кнопку с именем 'RowsMoveUp'
		И я нажимаю на кнопку с именем 'RowsMoveUp'
		И я нажимаю на кнопку с именем 'RowsMoveUp'
		И я нажимаю на кнопку с именем 'RowsMoveUp'
		И я нажимаю на кнопку с именем 'RowsMoveUp'
		И я нажимаю на кнопку с именем 'RowsMoveDown'
		И я нажимаю на кнопку с именем 'RowsMoveDown'
		И я нажимаю на кнопку с именем 'RowsMoveDown'
		И в таблице 'TableRows1' я перехожу к строке:
			| "Horizontally (in rows)" |
			| "Cash flow items"                 |
		И я нажимаю на кнопку с именем 'RowsMoveDown'
		И я нажимаю на кнопку с именем 'RowsMoveDown'
		И я нажимаю на кнопку с именем 'RowsMoveDown'
		И я нажимаю на кнопку с именем 'RowsMoveDown'
		И я нажимаю на кнопку с именем 'RowsMoveDown'
		И я нажимаю на кнопку с именем 'RowsMoveDown'	
		И я нажимаю на кнопку с именем 'RowsMoveUp'
		И я нажимаю на кнопку с именем 'RowsMoveUp'
		И в таблице 'TableRows1' я перехожу к строке:
			| "Horizontally (in rows)" |
			| "Income and expense items"  |
		И я нажимаю на кнопку с именем 'RowsMoveDown'
		И я нажимаю на кнопку с именем 'RowsMoveDown'
		И я нажимаю на кнопку с именем 'RowsMoveDown'
		И я нажимаю на кнопку с именем 'RowsMoveDown'
		И я нажимаю на кнопку с именем 'RowsMoveDown'
		И я нажимаю на кнопку с именем 'RowsMoveDown'	
		И я нажимаю на кнопку с именем 'RowsMoveUp'
		И я нажимаю на кнопку с именем 'ButtonApply'

	* Сохраняем бланк
		Тогда открылось окно '$WindowTitle$ *'
		И я нажимаю на кнопку с именем 'FormWriteAndClose'
		И я жду закрытия окна '$WindowTitle$ *' в течение 20 секунд			

Сценарий: 01.20 Переходим в режим отображения данных

	И Я октрываю сводную таблицу отчета с именем "VA - Manual entry for all analytics"
	И Я устанавливаю отборы сводной таблицы: дата начала '1/1/2021', дата конца '3/31/2021', валюта 'RUB', сценарий "VA - Main scenario", организация "Venus LLC"
	И Я устанавливаю отбор сводной таблицы 'Item_Project' со значением "VA - Main project"
	
	* Запомним заголовок окна
		И Открылась сводная таблица для вида отчета "VA - Manual entry for all analytics"
		И я запоминаю текущее окно как 'WindowTitle'

	* Проверяем содержимое
		Дано Табличный документ 'SpreadsheetFieldTemlate' равен макету '\\Макеты\ВА_ВидОтчетаСАналитиками_СводнаяТаблица1.mxl'

	* Тестируем кнопки настроек
		Когда открылось окно '$WindowTitle$'
		И я нажимаю на кнопку с именем 'ShowListOfColumns'
		Тогда открылось окно "Set up column list"
		И в таблице 'PivotTableColumnsListSettings' я перехожу к строке:
			| "Title in table" | "Report column/Formula" | "Company"        | "Display in additional currency" | "Period"             | "Shows usage" | "Project"             | "Scenario"           | "Column type"      |
			| "Price"                | "Price"                   | "Context value" | "No"                     | "Context value" | "Yes"                    | "Context value" | "Context value" | "Basic value" |
		И в таблице 'PivotTableColumnsListSettings' я изменяю флаг с именем 'PivotTableColumnsListSettingsUsageFlag_'
		И в таблице 'PivotTableColumnsListSettings' я завершаю редактирование строки
		И я нажимаю на кнопку с именем 'FormApply'
		Тогда открылось окно '$WindowTitle$'
		И я нажимаю на кнопку с именем 'ShowTableSettingsByAxes'
		Тогда открылось окно "Set up field location"
		И в таблице 'TableRows1' я перехожу к строке:
			| "Horizontally (in rows)" |
			| "Additional currencies"      |
		И я нажимаю на кнопку с именем 'RowsMoveDown'
		И я нажимаю на кнопку с именем 'RowsMoveUp'
		И я нажимаю на кнопку с именем 'RowsMoveUp'
		И я нажимаю на кнопку с именем 'RowsMoveUp'
		И я нажимаю на кнопку с именем 'RowsMoveUp'
		И я нажимаю на кнопку с именем 'RowsMoveUp'
		И я нажимаю на кнопку с именем 'RowsMoveUp'
		И в таблице 'TableRows1' я перехожу к строке:
			| "Horizontally (in rows)" |
			| "Income and expense items"  |
		И я выбираю пункт контекстного меню с именем 'TableRows1ContextMenuMoveToAvailableFields' на элементе формы с именем 'TableRows1'
		И я выбираю пункт контекстного меню с именем 'TableRows1ContextMenuMoveToAvailableFields' на элементе формы с именем 'TableRows1'
		И в таблице 'TableRows1' я перехожу к строке:
			| "Horizontally (in rows)" |
			| "Product range"               |
		И я нажимаю на кнопку с именем 'RowsMoveUp'
		И я нажимаю на кнопку с именем 'ButtonApply'
		Тогда открылось окно '$WindowTitle$'
		И я нажимаю на кнопку с именем 'ShowPeriodsSettings'
		И я нажимаю на кнопку с именем 'FormApply'
		И я нажимаю на кнопку с именем 'ShowAdditionalFilters'
		И в таблице 'FiltersSettings' я перехожу к строке:
			| "Comparison type" | "Value"| "Use" 	| "Field"        |
			| "Equal to"         | ''        | "No"           | "Counterparties" |		
		И в таблице 'FiltersSettings' я устанавливаю флаг с именем 'FiltersSettingsUse'
		И в таблице 'FiltersSettings' я активизирую поле с именем 'FiltersSettingsFilterValue'
		И в таблице 'FiltersSettings' из выпадающего списка с именем 'FiltersSettingsFilterValue' я выбираю по строке "LLC \"Ganymede\""
		И в таблице 'FiltersSettings' я завершаю редактирование строки
		И я нажимаю на кнопку с именем 'UpdateTabData'
		И я жду открытия формы '$WindowTitle$' в течение 20 секунд
		Когда открылось окно '$WindowTitle$'
		Дано Табличный документ 'SpreadsheetFieldTemlate' равен макету '\\Макеты\ВА_ВидОтчетаСАналитиками_СводнаяТаблица2.mxl'
				
	* Меняем показатели
		* Первый показатель
			Когда открылось окно '$WindowTitle$'
			И Я ввожу значение '10,000.00000' с раскрытием показателей в ячейку 'R26C2'
			Когда открылось окно '$WindowTitle$'
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R26C3'
			И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
			Когда открылось окно "Drill down indicators*"
			Тогда таблица 'IndicatorsDrilldown' стала равной:
				| "Cash flow items"                       | "Income and expense items"        | 'Value1' |
				| "3Software sale" | "3Software sale" | '800,000'   |
			И я нажимаю на кнопку с именем 'FormCancel'
		* Второй показатель	
			Тогда открылось окно '$WindowTitle$'
			И Я ввожу значение '20,000.00000' с раскрытием показателей в ячейку 'R21C2'
			Тогда открылось окно '$WindowTitle$'
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R21C3'
			И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
			Когда открылось окно "Drill down indicators*"
			Тогда таблица 'IndicatorsDrilldown' стала равной:
				| "Cash flow items"                       | 'Value1'  |
				| "3Software sale" | '1,600,000'  |
			И я нажимаю на кнопку с именем 'FormCancel'
		* Отменяем измененное значение
			Когда открылось окно '$WindowTitle$'
			И я нажимаю на кнопку с именем 'CancelAction'
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R21C3'
			И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
			Тогда открылось окно "Drill down indicators*"
			Тогда таблица 'IndicatorsDrilldown' стала равной:
				| "Cash flow items"                       | 'Value1' |
				| "3Software sale" | '960,000'   |
			И я нажимаю на кнопку с именем 'FormCancel'
		* Показатель с валютной аналитикой
			Когда открылось окно '$WindowTitle$'
			И Я ввожу значение '10,000.00000' с раскрытием показателей в ячейку 'R32C2'
			И Я ввожу значение '10,000.00000' с раскрытием показателей в ячейку 'R37C2'
			Тогда область 'R27C2:R27C3' табличного документа 'SpreadsheetFieldTemlate' равна:
				| '23,200' | '435,600' |

	* Закрываем не сохраняя
		Когда открылось окно '$WindowTitle$'
		И Я закрываю окно '$WindowTitle$'
		Тогда открылось окно "1C:Enterprise"
		И я нажимаю на кнопку с именем 'Button1'

Сценарий: 01.21 Тестируем кнопки пересчета показателей

	И Я октрываю сводную таблицу отчета с именем "VA - Manual entry for all analytics"

	* Запомним заголовок окна
		И Открылась сводная таблица для вида отчета "VA - Manual entry for all analytics"
		И я запоминаю текущее окно как 'WindowTitle'

	* Проверим содержание таблицы
		И Я устанавливаю отбор сводной таблицы 'DisplayCurrency' со значением 'RUB'	
		Дано Табличный документ 'SpreadsheetFieldTemlate' равен макету '\\Макеты\ВА_ВидОтчетаСАналитиками_СводнаяТаблица1.mxl'	

	* Меняем показатели в таблице
		Когда открылось окно '$WindowTitle$ *'
		И Я ввожу значение '10,000.00000' в ячейку 'R5C2'
		И Я ввожу значение '10,000.00000' в ячейку 'R7C2'
		И Я ввожу значение '10,000.00000' в ячейку 'R10C2'
		И Я ввожу значение '10,000.00000' в ячейку 'R14C2'
		И Я ввожу значение '10,000.00000' в ячейку 'R19C2'
		И Я ввожу значение '10,000.00000' в ячейку 'R25C2'
		И Я ввожу значение '10,000.00000' в ячейку 'R32C2'
		И Я ввожу значение '12,000.00000' в ячейку 'R40C2'
		И Я ввожу значение '10,000.00000' в ячейку 'R41C2'
		И Я ввожу значение '11,000.00000' в ячейку 'R42C2'
		И Я ввожу значение '12,000.00000' в ячейку 'R44C2'
		И Я ввожу значение '10,000.00000' в ячейку 'R45C2'
		И Я ввожу значение '11,000.00000' в ячейку 'R46C2'
	
	* Меняем показатели в окне
		Когда открылось окно '$WindowTitle$ *'
		И Я ввожу значение '100.00000' с раскрытием показателей в ячейку 'R26C3'

	* Кнопки копирования показателей
		Тогда открылось окно '$WindowTitle$ *'
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R26C3'
		И я нажимаю на кнопку с именем 'CopyIntoClipboard'
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R25C3'
		И я нажимаю на кнопку с именем 'PasteFromClipboard1'
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R19C3'
		И я нажимаю на кнопку с именем 'PasteFromClipboard1'
		И я нажимаю на кнопку с именем 'CopyDataByRow'
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R5C3'
		И я нажимаю на кнопку с именем 'PasteFromClipboard1'

	* Тестируем стрелки
		Тогда открылось окно '$WindowTitle$ *'
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R5C3'
		И я нажимаю на кнопку с именем 'CopyDataByColumn'		
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R5C2:R46C2'
		И я нажимаю на кнопку с именем 'CopyDataByRow'		

	* Кнопка очистки диапазона
		Когда открылось окно '$WindowTitle$ *'
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R5C6:R46C6'
		И я нажимаю на кнопку с именем 'ClearRange'

	* Комментарий
		Когда открылось окно '$WindowTitle$ *'
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R19C2:R25C4'
		И я нажимаю на кнопку с именем 'InsertNote'
		Тогда открылось окно "Comments"
		И в поле с именем 'NewComment' я ввожу текст "Comment 1"
		И я нажимаю на кнопку с именем 'WriteComment'
		Когда открылось окно '$WindowTitle$ *'
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R19C2'
		И я нажимаю на кнопку с именем 'InsertNote'
		Тогда открылось окно "Comments"
		И в поле с именем 'NewComment' я ввожу текст "Comment 2"
		И я нажимаю на кнопку с именем 'WriteComment'
		Тогда открылось окно '$WindowTitle$ *'
		И я нажимаю на кнопку с именем 'InsertNote'
		Тогда элемент формы с именем 'CommentsHistory' стал равен по шаблону
			|'* (*): '|
			|"Comment 1"|
			|'* (*): '|
			|"Comment 2"|
		И Я закрываю окно "Comments"

	* Тестируем кнопки изменения показателей
		Когда открылось окно '$WindowTitle$ *'
		И Я изменяю значение на '50.00000' в ячейке 'R5C6'
		Тогда открылось окно '$WindowTitle$ *'
		И я нажимаю на кнопку с именем 'CopyDataByColumn'
		Когда открылось окно '$WindowTitle$ *'
		И Я изменяю значение на '50.00000' процентов в ячейке 'R5C6:R46C6'

	* Сохраняем значения показателей
		Когда открылось окно '$WindowTitle$ *'
		И я нажимаю на кнопку с именем 'Apply'

	* Настройки разрядности отображения показателей		
		Тогда открылось окно '$WindowTitle$'
		И в поле с именем 'Accuracy' я ввожу текст '6'
		И я перехожу к следующему реквизиту
		Тогда открылось окно "1C:Enterprise"
		И я нажимаю на кнопку с именем 'Button0'
		Тогда открылось окно '$WindowTitle$'
		И в поле с именем 'Accuracy' я ввожу текст '5'
		И из выпадающего списка с именем 'Divisor' я выбираю точное значение "thousand"
		
	* Меняем валюту отображения 
		И Я устанавливаю отбор сводной таблицы 'DisplayCurrency' со значением 'USD'
	
	* Настраиваем аналитики
		Когда открылось окно '$WindowTitle$ *'
		И я нажимаю на кнопку с именем 'ShowTableSettingsByAxes'
		Тогда открылось окно "Set up field location"
		И я нажимаю на кнопку с именем 'DimensionsLayoutOption'
		И в меню формы я выбираю "Adjacent dimensions"
		И я нажимаю на кнопку с именем 'ButtonApply'
		Тогда открылось окно '$WindowTitle$ *'
		И я нажимаю на кнопку с именем 'ShowPeriodsSettings'
		И я изменяю флаг с именем 'ShouldShowTotalYear'
		И я нажимаю на кнопку с именем 'FormApply'
		Тогда открылось окно '$WindowTitle$ *'
		И я нажимаю на кнопку с именем 'UpdateTabData'
		И я жду открытия формы '$WindowTitle$ *' в течение 20 секунд
				
	* Сравниваем результат
		Тогда открылось окно '$WindowTitle$ *'
		Дано Табличный документ 'SpreadsheetFieldTemlate' равен макету '\\Макеты\ВА_ВидОтчетаСАналитиками_СводнаяТаблица3.mxl' по шаблону		
					
	* Сохраним вариант
		И я нажимаю на кнопку с именем 'SaveCurrentTabVariantAs'
		Тогда открылось окно "Save the pivot table option"
		И в поле с именем 'SettingDescription' я ввожу текст "VA - Main variant"
		И я нажимаю на кнопку с именем 'Apply'
		Если открылось окно "1C:Enterprise" Тогда
			И я нажимаю на кнопку с именем 'Button0'
		Тогда Открылась сводная таблица для варианта "VA - Main variant"
		И Я закрываю окно "Pivot table: *"
							
	* Загрузим вариант
		И Я октрываю сводную таблицу отчета с именем "VA - Manual entry for all analytics"
		И я нажимаю на гиперссылку с именем 'FilterHeading'
		И Пауза 1
		И я нажимаю кнопку выбора у поля с именем 'PivotTableVariant'
		Тогда открылось окно "Pivol table options"
		И я нажимаю на кнопку с именем 'FormFind'
		Тогда открылась форма с именем 'UniversalListFindExtForm'
		И в поле с именем 'Pattern' я ввожу текст "VA - Main variant"
		И я нажимаю на кнопку с именем 'Find'
		Тогда открылось окно "Pivol table options"
		И в таблице 'List' я выбираю текущую строку
		Тогда Открылась сводная таблица для варианта "VA - Main variant"
		И я запоминаю текущее окно как 'WindowTitleВарианта'
		И Пауза 1
		И в поле с именем 'Accuracy' я ввожу текст '5'
		И из выпадающего списка с именем 'Divisor' я выбираю точное значение "thousand"
		И я нажимаю на кнопку с именем 'UpdateTabData'
		И я жду открытия формы '$WindowTitleВарианта$' в течение 20 секунд
		Дано Табличный документ 'SpreadsheetFieldTemlate' равен макету '\\Макеты\ВА_ВидОтчетаСАналитиками_СводнаяТаблица3.mxl' по шаблону
		И Я закрываю окно '$WindowTitleВарианта$'

	* Откатываем версию
		И Я октрываю сводную таблицу отчета с именем "VA - Manual entry for all analytics"
		И я нажимаю на кнопку с именем 'VersionsManagement'
		Тогда открылось окно "Indicator version management"
		И я нажимаю на кнопку с именем 'ListDeleteVersions'
		Тогда открылось окно "1C:Enterprise"
		И я нажимаю на кнопку с именем 'Button0'
		Тогда открылось окно "Indicator version management *"
		И Я закрываю окно "Indicator version management *"
		Тогда открылось окно '$WindowTitle$'
		И я нажимаю на гиперссылку с именем 'FilterHeading'
		И я нажимаю кнопку выбора у поля с именем 'DisplayCurrency'
		И из выпадающего списка с именем 'DisplayCurrency' я выбираю точное значение "RUB"
		И я нажимаю на кнопку с именем 'UpdateTabData1'
		И я жду открытия формы '$WindowTitle$ *' в течение 20 секунд
		Дано Табличный документ 'SpreadsheetFieldTemlate' равен макету '\\Макеты\ВА_ВидОтчетаСАналитиками_СводнаяТаблица1.mxl'						
