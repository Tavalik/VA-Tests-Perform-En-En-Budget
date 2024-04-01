#language: ru

@tree

Функционал: 02. Проверка работы сводной таблицы

Как Администратор я хочу
Проверить создание и работу сводных таблиц

Контекст: 

	И я закрыл все окна клиентского приложения	

Сценарий: 02.00 Определеняем тип приложения

	И я закрываю TestClient "CPM - Budget"
	И я подключаю TestClient "CPM - Budget" логин "Administrator" пароль ''
	Пусть Инициализация переменных

Сценарий: 02.01 Создаем вид отчета

	* Создаем вид отчета
		И Я создаю вид отчета с именем "VA - Recalculation in context" и родителем "VA - Report group"
		И Я открываю вид отчета с именем "VA - Recalculation in context"

	* Доработаем вид отчета
		И я изменяю флаг с именем 'IsChangeTrackingEnabled'
		И я перехожу к закладке с именем 'DimensionsOfReport'
		И из выпадающего списка с именем 'DimensionKind1' я выбираю по строке "VA0CFItems"
		И я перехожу к закладке с именем 'Main'
		И я нажимаю на кнопку с именем 'RecordButtonForm'
		Тогда открылось окно "Data restructuring"
		И я нажимаю на кнопку с именем 'FormOK'
	
	* Настраиваем структуру вида отчета
		И я нажимаю на кнопку с именем 'EditTree'
		И Я в конструкторе отчета добавляю строку с именем "Total"
		И Я в конструкторе отчета добавляю строку с именем "Goods"
		И Я в конструкторе отчета добавляю колонку с именем "Count"
		И Я в конструкторе отчета добавляю колонку с именем "Coefficient"
		И Я в конструкторе отчета добавляю колонку с именем "Total"
		И Я в конструкторе отчета добавляю колонку с именем "Date"
		И Я в конструкторе отчета добавляю колонку с именем "Line"

	* Меняем тип показателей
		И Я в конструкторе отчета в ячейке 'R2C3' меняю свойство показателя 'NonFinancial' на "False"
		И Я в конструкторе отчета в ячейке 'R2C5' меняю свойство показателя 'ValueType' на "Date"
		И Я в конструкторе отчета в ячейке 'R2C5' меняю свойство показателя 'TotalKind' на "Maximum"
		И Я в конструкторе отчета в ячейке 'R3C5' меняю свойство показателя 'ValueType' на "Date"
		И Я в конструкторе отчета в ячейке 'R3C5' меняю свойство показателя 'TotalKind' на "Minimum"
		И Я в конструкторе отчета в ячейке 'R3C3' меняю свойство показателя 'NonFinancial' на "True"
		И Я в конструкторе отчета в ячейке 'R2C6:R3C6' меняю свойства показателей 'ValueType' на "Line"

	* Устанавливаем аналитики
		И Я в конструкторе отчета добавляю аналитику с кодом "VA0Product" в ячейку 'R3C3'

	* Вводим формулы расчета
		Когда открылось окно "Report wizard"
		И из выпадающего списка с именем 'WorkMode' я выбираю точное значение "Indicators calculation formulas"
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R2C2'
		И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R3C2'
		И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
		И я нажимаю на кнопку с именем 'WriteAndCollapse'
		Тогда открылось окно "Report wizard"
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R2C3'
		И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R3C3'
		И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
		И я нажимаю на кнопку с именем 'WriteAndCollapse'
		Тогда открылось окно "Report wizard"
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R2C4'
		И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R2C2'
		И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
		И я нажимаю на кнопку с именем 'ButtonMultiply'
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R2C3'
		И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
		И я нажимаю на кнопку с именем 'WriteAndCollapse'
		Тогда открылось окно "Report wizard"
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R3C4'
		И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R3C2'
		И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
		И я нажимаю на кнопку с именем 'ButtonMultiply'
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R3C3'
		И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
		И я нажимаю на кнопку с именем 'WriteAndCollapse'
		Когда открылось окно "Report wizard"
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R2C5'
		И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R3C5'
		И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
		И я нажимаю на кнопку с именем 'WriteAndCollapse'		
		И Я закрываю окно "Report wizard"

Сценарий: 02.02 Создаем бланки для вида отчета				

	И Я для вида отчета "VA - Recalculation in context" создаю бланк по умолчанию
	
	И Я для вида отчета "VA - Recalculation in context" создаю бланк сводной таблицы по умолчанию с отборами "Cash flow items"

	И Я Для вида отчета "VA - Recalculation in context" открываю бланк сводной таблицы по умолчанию
	И я нажимаю на кнопку с именем 'ShowTableSettingsByAxes'
	Тогда открылось окно "Set up field location"
	И в таблице 'TableRows1' я перехожу к строке:
		| "Horizontally (in rows)" |
		| "Product range"               |
	И в таблице 'TableRows1' я выбираю текущую строку
	Тогда открылось окно "Dimension display parameters (Product range)"
	И я нажимаю кнопку выбора у поля с именем 'DCSettingsOrderSettings'
	Тогда открылось окно "Edit order"
	И в таблице 'Data' я перехожу к строке:
		| "Use" | "Field"                      |
		| "Yes"            | "Product range.Description" |
	И в таблице 'Data' из выпадающего списка с именем 'DataField' я выбираю точное значение "Product range.Product ID"
	И в таблице 'Data' я завершаю редактирование строки
	И я нажимаю на кнопку с именем 'OK'
	Тогда открылось окно "Dimension display parameters (Product range)"
	И я нажимаю на кнопку с именем 'FormApply'
	Тогда открылось окно "Set up field location"
	И я нажимаю на кнопку с именем 'ButtonApply'
	Когда открылось окно '$WindowTitle$'
	И я нажимаю на кнопку с именем 'FormWriteAndClose'
	И я жду закрытия окна '$WindowTitle$' в течение 20 секунд	

Сценарий: 02.03 Создаем новый сценарий для индексации

	И Я создаю сценарий с именем "VA - Script for indexing"
	И Я для сценария "VA - Script for indexing" на закладке 'Budgeting' для реквизита 'ScenarioOfAllocation' устанавливаю значение "True"

	* Документ управления перидом
		И В командном интерфейсе я выбираю "Budgeting, reporting, and analysis" "Reporting period management"
		Тогда открылось окно "Reporting period management"
		И я нажимаю на кнопку с именем 'FormCreate'
		Тогда открылось окно "Reporting period management (create)"
		И из выпадающего списка с именем 'Scenario' я выбираю по строке "VA - Script for indexing"
		И из выпадающего списка с именем 'ScenarioFrequency' я выбираю точное значение "Month"
		И я нажимаю на кнопку с именем 'ChangePeriod'
		Тогда открылось окно "Select period"
		И в поле с именем 'DateBegin' я ввожу текст '1/1/2024'
		И я перехожу к следующему реквизиту
		И в поле с именем 'DateEnd' я ввожу текст '3/31/2024'
		И я нажимаю на кнопку с именем 'select'
		Тогда открылось окно "Reporting period management (create) *"
		И из выпадающего списка с именем 'OrganizationalStructureVersion' я выбираю по строке "VA - Main regulations"
		И я нажимаю на кнопку с именем 'FormGoForward'
		Тогда открылось окно "1C:Enterprise"
		И я нажимаю на кнопку с именем 'Button0'
		И я запоминаю заголовок формы в переменную 'FormCaption'
		Тогда открылось окно '$FormCaption$'
		И Я заполняю таблицу курсов в управлении периодом сценария
		И я нажимаю на кнопку с именем 'FormGoForward'
		Тогда открылось окно "1C:Enterprise"
		И я нажимаю на кнопку с именем 'Button0'		
		Когда открылось окно '$FormCaption$'
		И я нажимаю на кнопку с именем 'FormGoForward'
		* Закрываем период
			И я нажимаю на кнопку с именем 'PeriodsManagement1'
			Тогда открылось окно "Manage period lock duration and indicator updates"
			И в табличном документе 'SpreadsheetFieldPeriodsManagement' я перехожу к ячейке 'R6C2'
			И я нажимаю на кнопку с именем 'ClosePeriod'
			И Я закрываю окно "Manage period lock duration and indicator updates"
		Тогда открылось окно '$FormCaption$'
		И я нажимаю на кнопку с именем 'FormClose'	

Сценарий: 02.04 Настройка прав для пользователя "Budgeting1"

	И Я добавляю право "Read, write" для вида отчета "VA - Recalculation in context" пользователя "Budgeting1" по всем организациям
	И я закрываю TestClient "CPM - Budget"
	И я подключаю TestClient "CPM - Budget" логин "Budgeting1" пароль ''			

Сценарий: 02.05 Вводим данные в сводную таблицу	

	* Открываем сводную таблицу
		И Я октрываю сводную таблицу отчета с именем "VA - Recalculation in context"
		И Я устанавливаю отборы сводной таблицы: дата начала '1/1/2024', дата конца '3/31/2024', валюта 'RUB', сценарий "VA - Main scenario", организация "Mercury LLC"		
		И Я устанавливаю отбор сводной таблицы "VA0CFItems" со значением "3Software sale"
		
	* Вводим значения вручную
		И Я добавляю значения с раскрытием показателей в ячейку 'R5C2'
			| "VA0Product"                                                     | 'Value1' |
			| "1C:ERP. Corporate performance management"                                   | '10.00000'  |
			| "2C:Corporation"                                                  | '20.00000'  |
			| "3C:Enterprise 8 CORP. Client license for 100 users" | '30.00000'  |
			| "4C:Enterprise 8.3 CORP. Server License (x86-64)"           | '40.00000'  |
			| "5C:Corporate performance management"                                      | '50.00000'  |		
		
		И Я ввожу значение '2.00000' в ячейку 'R6C3'
		И Я ввожу значение '1/1/2024' в ячейку 'R6C5'
		И Я ввожу значение "Line1" в ячейку 'R6C6'
	
	* Копируем значения по колонке
		Когда открылось окно '$WindowTitle$'
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R6C3'
		И я нажимаю на кнопку с именем 'CopyDataByColumn'
		Когда открылось окно '$WindowTitle$'
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R6C5'
		И я нажимаю на кнопку с именем 'CopyDataByColumn'
		Когда открылось окно '$WindowTitle$'
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R6C6'
		И я нажимаю на кнопку с именем 'CopyDataByColumn'
	
	* Копирование и вставка значений
		Когда открылось окно '$WindowTitle$'
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R4C2:R10C6'
		И я нажимаю на кнопку с именем 'CopyIntoClipboard'
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R4C7:R10C11'
		И я нажимаю на кнопку с именем 'PasteFromClipboard1'
		Когда открылось окно '$WindowTitle$'
		Тогда табличный документ 'SpreadsheetFieldTemlate' равен:
			| "VA - Recalculation in context (pivot table)"                    | "January 2024" | ''            | ''      | ''           | ''        | "February 2024" | ''            | ''      | ''           | ''        | "March 2024" | ''            | ''     | ''     | ''       | "TOTAL"      | ''            | ''      | ''           | ''       |
			| "VA - Recalculation in context (pivot table)"                    | "Count"     | "Coefficient" | "Total"  | "Date"       | "Line"  | "Count"      | "Coefficient" | "Total"  | "Date"       | "Line"  | "Count"   | "Coefficient" | "Total" | "Date" | "Line" | "Count" | "Coefficient" | "Total"  | "Date"       | "Line" |
			| "Total"                                                           | '150'            | '10'          | '1,500' | '1/1/2024' | ''        | '150'             | '10'          | '1,500' | '1/1/2024' | ''        | '0'            | '0'           | '0'    | ''     | ''       | '300'        | '20'          | '3,000' | '1/1/2024' | ''       |
			| "Goods"                                                         | '150'            | '10'          | '300'   | '1/1/2024' | ''        | '150'             | '10'          | '300'   | '1/1/2024' | ''        | '0'            | '0'           | '0'    | ''     | ''       | '300'        | '20'          | '600'   | '1/1/2024' | ''       |
			| "5C:Corporate performance management"                                      | '50'             | '2'           | '100'   | '1/1/2024' | "Line1" | '50'              | '2'           | '100'   | '1/1/2024' | "Line1" | '0'            | '0'           | '0'    | ''     | ''       | '100'        | '4'           | '200'   | '1/1/2024' | ''       |
			| "2C:Corporation"                                                  | '20'             | '2'           | '40'    | '1/1/2024' | "Line1" | '20'              | '2'           | '40'    | '1/1/2024' | "Line1" | '0'            | '0'           | '0'    | ''     | ''       | '40'         | '4'           | '80'    | '1/1/2024' | ''       |
			| "4C:Enterprise 8.3 CORP. Server License (x86-64)"           | '40'             | '2'           | '80'    | '1/1/2024' | "Line1" | '40'              | '2'           | '80'    | '1/1/2024' | "Line1" | '0'            | '0'           | '0'    | ''     | ''       | '80'         | '4'           | '160'   | '1/1/2024' | ''       |
			| "1C:ERP. Corporate performance management"                                   | '10'             | '2'           | '20'    | '1/1/2024' | "Line1" | '10'              | '2'           | '20'    | '1/1/2024' | "Line1" | '0'            | '0'           | '0'    | ''     | ''       | '20'         | '4'           | '40'    | '1/1/2024' | ''       |
			| "3C:Enterprise 8 CORP. Client license for 100 users" | '30'             | '2'           | '60'    | '1/1/2024' | "Line1" | '30'              | '2'           | '60'    | '1/1/2024' | "Line1" | '0'            | '0'           | '0'    | ''     | ''       | '60'         | '4'           | '120'   | '1/1/2024' | ''       |

	* Еще раз вводим значения 
		Когда открылось окно '$WindowTitle$'
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R6C10'
		И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
		И в табличный документ 'SpreadsheetFieldTemlate' я ввожу текст '1/1/2024'
		Когда открылось окно '$WindowTitle$'
		И я нажимаю на кнопку с именем 'CopyDataByColumn'
		Когда открылось окно '$WindowTitle$'
		И я нажимаю на кнопку с именем 'CopyDataByColumn'
		Когда открылось окно '$WindowTitle$'
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R6C11'
		И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
		И в табличный документ 'SpreadsheetFieldTemlate' я ввожу текст "Line1"
		Когда открылось окно '$WindowTitle$'
		И я нажимаю на кнопку с именем 'CopyDataByColumn'
	
	* Копируем значения по строке
		Когда открылось окно '$WindowTitle$'
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R4C7:R10C7'
		И я нажимаю на кнопку с именем 'CopyDataByRow'
		Когда открылось окно '$WindowTitle$'
		И я нажимаю на кнопку с именем 'CopyDataByRow'
		Когда открылось окно '$WindowTitle$'
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R4C8:R10C8'
		И я нажимаю на кнопку с именем 'CopyDataByRow'
		Когда открылось окно '$WindowTitle$'
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R4C10:R10C10'
		И я нажимаю на кнопку с именем 'CopyDataByRow'
		Когда открылось окно '$WindowTitle$'
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R4C11:R10C11'						
		И я нажимаю на кнопку с именем 'CopyDataByRow'

	* Изменяем показатели
		* На процент
			Когда открылось окно '$WindowTitle$'
			И Я изменяю значение на '100.00000' процентов в ячейке 'R6C7:R10C8'
			Тогда открылось окно '$WindowTitle$'
			И Я изменяю значение на '200.00000' процентов в ячейке 'R6C12:R10C12'
			* Нечисловые
				Тогда открылось окно '$WindowTitle$'
				И Я изменяю значение на '100.00000' процентов в ячейке 'R6C6:R10C6'
		* На значение
			Тогда открылось окно '$WindowTitle$'
			И Я изменяю значение на '4.00000' в ячейке 'R6C13:R10C13'
			* Нечисловые
				Когда открылось окно '$WindowTitle$'
				И Я изменяю значение на '200.00000' в ячейке 'R6C5:R10C5'

	* Очистка показателей
		Когда открылось окно '$WindowTitle$'
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R4C2:R10C16'
		И я нажимаю на кнопку с именем 'ClearRange'
		Когда открылось окно '$WindowTitle$'
		Тогда табличный документ 'SpreadsheetFieldTemlate' равен:
			| "VA - Recalculation in context (pivot table)" | "January 2024" | ''            | ''     | ''     | ''       | "February 2024" | ''            | ''     | ''     | ''       | "March 2024" | ''            | ''     | ''     | ''       | "TOTAL"      | ''            | ''     | ''     | ''       |
			| "VA - Recalculation in context (pivot table)" | "Count"     | "Coefficient" | "Total" | "Date" | "Line" | "Count"      | "Coefficient" | "Total" | "Date" | "Line" | "Count"   | "Coefficient" | "Total" | "Date" | "Line" | "Count" | "Coefficient" | "Total" | "Date" | "Line" |
			| "Total"                                        | '0'              | '0'           | '0'    | ''     | ''       | '0'               | '0'           | '0'    | ''     | ''       | '0'            | '0'           | '0'    | ''     | ''       | '0'          | '0'           | '0'    | ''     | ''       |
			| "Goods"                                      | '0'              | '0'           | '0'    | ''     | ''       | '0'               | '0'           | '0'    | ''     | ''       | '0'            | '0'           | '0'    | ''     | ''       | '0'          | '0'           | '0'    | ''     | ''       |

	* Кнопка отмена 
		Когда открылось окно '$WindowTitle$'
		И я делаю 24 раз
			И я нажимаю на кнопку с именем 'CancelAction'
		Когда открылось окно '$WindowTitle$'	
		Тогда табличный документ 'SpreadsheetFieldTemlate' равен:
			| "VA - Recalculation in context (pivot table)" | "January 2024" | ''            | ''     | ''     | ''       | "February 2024" | ''            | ''     | ''     | ''       | "March 2024" | ''            | ''     | ''     | ''       | "TOTAL"      | ''            | ''     | ''     | ''       |
			| "VA - Recalculation in context (pivot table)" | "Count"     | "Coefficient" | "Total" | "Date" | "Line" | "Count"      | "Coefficient" | "Total" | "Date" | "Line" | "Count"   | "Coefficient" | "Total" | "Date" | "Line" | "Count" | "Coefficient" | "Total" | "Date" | "Line" |
			| "Total"                                        | '0'              | '0'           | '0'    | ''     | ''       | '0'               | '0'           | '0'    | ''     | ''       | '0'            | '0'           | '0'    | ''     | ''       | '0'          | '0'           | '0'    | ''     | ''       |
			| "Goods"                                      | '0'              | '0'           | '0'    | ''     | ''       | '0'               | '0'           | '0'    | ''     | ''       | '0'            | '0'           | '0'    | ''     | ''       | '0'          | '0'           | '0'    | ''     | ''       |

	* Кнопка повторить действие	
		И я делаю 23 раз
			И я нажимаю на кнопку с именем 'RetryAction'

	* Отмена из списка
		Когда открылось окно '$WindowTitle$'
		И я нажимаю на кнопку с именем 'CancelApplyDetailed'
		Тогда открылось окно "Action history"
		И в таблице 'Transactions_' я выделяю все строки
		И я нажимаю на кнопку с именем 'FormApply'
		И я жду открытия формы '$WindowTitle$' в течение 20 секунд
		Тогда табличный документ 'SpreadsheetFieldTemlate' равен:
			| "VA - Recalculation in context (pivot table)" | "January 2024" | ''            | ''     | ''     | ''       | "February 2024" | ''            | ''     | ''     | ''       | "March 2024" | ''            | ''     | ''     | ''       | "TOTAL"      | ''            | ''     | ''     | ''       |
			| "VA - Recalculation in context (pivot table)" | "Count"     | "Coefficient" | "Total" | "Date" | "Line" | "Count"      | "Coefficient" | "Total" | "Date" | "Line" | "Count"   | "Coefficient" | "Total" | "Date" | "Line" | "Count" | "Coefficient" | "Total" | "Date" | "Line" |
			| "Total"                                        | '0'              | '0'           | '0'    | ''     | ''       | '0'               | '0'           | '0'    | ''     | ''       | '0'            | '0'           | '0'    | ''     | ''       | '0'          | '0'           | '0'    | ''     | ''       |
			| "Goods"                                      | '0'              | '0'           | '0'    | ''     | ''       | '0'               | '0'           | '0'    | ''     | ''       | '0'            | '0'           | '0'    | ''     | ''       | '0'          | '0'           | '0'    | ''     | ''       |

	* Повторить действие
		Когда открылось окно '$WindowTitle$'
		И я нажимаю на кнопку с именем 'RetryAction'								

	* Сложная последовательность отменить / повторить действие
		Когда открылось окно '$WindowTitle$'
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R6C2'
		И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
		И в табличный документ 'SpreadsheetFieldTemlate' я ввожу текст '100.00000'
		Когда открылось окно '$WindowTitle$'
		И я нажимаю на кнопку с именем 'CancelAction'
		И я нажимаю на кнопку с именем 'RetryAction'
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R6C5'
		И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
		И в табличный документ 'SpreadsheetFieldTemlate' я ввожу текст '2/2/2024'
		Когда открылось окно '$WindowTitle$'
		И я нажимаю на кнопку с именем 'CancelAction'
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R5C2'
		И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
		Тогда открылось окно "Drill down indicators: *"
		Тогда Таблица 'IndicatorsDrilldown' содержит '5' строк из списка:
			| "Product range"                                                   | 'Value1' |
			| "4C:Enterprise 8.3 CORP. Server License (x86-64)"           | '40'        |
			| "3C:Enterprise 8 CORP. Client license for 100 users" | '30'        |
			| "5C:Corporate performance management"                                      | '100'       |
			| "2C:Corporation"                                                  | '20'        |
			| "1C:ERP. Corporate performance management"                                   | '10'        |
					
		И я нажимаю на кнопку с именем 'FormCancel'
		Тогда открылось окно '$WindowTitle$'
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R5C2'
		И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
		Тогда открылось окно "Drill down indicators: *"
		И в таблице 'IndicatorsDrilldown' я перехожу к строке:
			| "Product range"              | 'Value1' |
			| "5C:Corporate performance management" | '100'       |
		И в таблице 'IndicatorsDrilldown' в поле с именем 'Value1' я ввожу текст '10.00000'
		И в таблице 'IndicatorsDrilldown' я завершаю редактирование строки
		И я нажимаю на кнопку с именем 'FormOKButton1'

	* Установим комментарии
		Когда открылось окно '$WindowTitle$'
		И Я ввожу комментарий "First cell" в ячейку 'R6C2'
		Тогда открылось окно '$WindowTitle$'
		И Я ввожу комментарий "Последняя ячейка" в ячейку 'R10C5'
		Тогда открылось окно '$WindowTitle$'
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R6C2'
		И я выбираю пункт контекстного меню с именем 'SpreadsheetFieldTemlateContextMenuInsertNote' на элементе формы с именем 'SpreadsheetFieldTemlate'
		Тогда открылось окно "Comments"
		И в поле с именем 'NewComment' я ввожу текст "First cell 2"
		И я нажимаю на кнопку с именем 'WriteComment'
		Тогда открылось окно '$WindowTitle$'
		И я нажимаю на кнопку с именем 'LeaveCommentToIndicator'
		Тогда элемент формы с именем 'CommentsHistory' стал равен по шаблону
			|'* (*): '      |
			|"First cell"|
			|'* (*): '        |
			|"First cell 2"|
		И элемент формы с именем 'NewComment' стал равен ''
		Когда открылось окно "Comments"
		И я закрываю окно "Comments"

	* Кнопки отмена / повторить действие с комментариями
		Тогда открылось окно '$WindowTitle$'
		И я нажимаю на кнопку с именем 'CancelAction'
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R6C2'
		И я нажимаю на кнопку с именем 'LeaveCommentToIndicator'
		Тогда открылось окно "Comments"
		Тогда элемент формы с именем 'CommentsHistory' стал равен по шаблону 
			|'* (*): '|
			|"First cell"|				
		И я закрываю окно "Comments"
		И я нажимаю на кнопку с именем 'CancelAction'
		И я нажимаю на кнопку с именем 'CancelAction'
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R6C2'
		И я нажимаю на кнопку с именем 'LeaveCommentToIndicator'
		Тогда открылось окно "Comments"
		Тогда элемент формы с именем 'CommentsHistory' стал равен ''								
		И я закрываю окно "Comments"
		Когда открылось окно '$WindowTitle$'
		И я нажимаю на кнопку с именем 'RetryAction'
		И я нажимаю на кнопку с именем 'RetryAction'
		И я нажимаю на кнопку с именем 'RetryAction'
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R6C2'
		И я выбираю пункт контекстного меню с именем 'SpreadsheetFieldTemlateContextMenuInsertNote' на элементе формы с именем 'SpreadsheetFieldTemlate'
		Тогда элемент формы с именем 'CommentsHistory' стал равен по шаблону
			|'* (*): '      |
			|"First cell"|
			|'* (*): '        |
			|"First cell 2"|		
		Когда открылось окно "Comments"
		И в поле с именем 'NewComment' я ввожу текст "First cell 3"
		И я нажимаю на кнопку с именем 'WriteComment'

	* Записываем значения покзателей
		Когда открылось окно '$WindowTitle$'
		И я нажимаю на кнопку с именем 'Apply'
		И я жду открытия формы "Pivot table: *" в течение 20 секунд

	* Сравниваем результат
		Тогда табличный документ 'SpreadsheetFieldTemlate' равен:
			| "VA - Recalculation in context (pivot table)"                    | "January 2024" | ''            | ''      | ''           | ''        | "February 2024" | ''            | ''      | ''           | ''        | "March 2024" | ''            | ''       | ''           | ''        | "TOTAL"      | ''            | ''       | ''           | ''       |
			| "VA - Recalculation in context (pivot table)"                    | "Count"     | "Coefficient" | "Total"  | "Date"       | "Line"  | "Count"      | "Coefficient" | "Total"  | "Date"       | "Line"  | "Count"   | "Coefficient" | "Total"   | "Date"       | "Line"  | "Count" | "Coefficient" | "Total"   | "Date"       | "Line" |
			| "Total"                                                           | '110'            | '10'          | '1,100' | '1/1/2024' | ''        | '300'             | '20'          | '6,000' | '1/1/2024' | ''        | '450'          | '30'          | '13,500' | '1/1/2024' | ''        | '860'        | '60'          | '20,600' | '1/1/2024' | ''       |
			| "Goods"                                                         | '110'            | '10'          | '220'   | '1/1/2024' | ''        | '300'             | '20'          | '1,200' | '1/1/2024' | ''        | '450'          | '30'          | '2,700'  | '1/1/2024' | ''        | '860'        | '60'          | '4,120'  | '1/1/2024' | ''       |
			| "5C:Corporate performance management"                                      | '10'             | '2'           | '20'    | '1/1/2024' | "Line1" | '100'             | '4'           | '400'   | '1/1/2024' | "Line1" | '150'          | '6'           | '900'    | '1/1/2024' | "Line1" | '260'        | '12'          | '1,320'  | '1/1/2024' | ''       |
			| "2C:Corporation"                                                  | '20'             | '2'           | '40'    | '1/1/2024' | "Line1" | '40'              | '4'           | '160'   | '1/1/2024' | "Line1" | '60'           | '6'           | '360'    | '1/1/2024' | "Line1" | '120'        | '12'          | '560'    | '1/1/2024' | ''       |
			| "4C:Enterprise 8.3 CORP. Server License (x86-64)"           | '40'             | '2'           | '80'    | '1/1/2024' | "Line1" | '80'              | '4'           | '320'   | '1/1/2024' | "Line1" | '120'          | '6'           | '720'    | '1/1/2024' | "Line1" | '240'        | '12'          | '1,120'  | '1/1/2024' | ''       |
			| "1C:ERP. Corporate performance management"                                   | '10'             | '2'           | '20'    | '1/1/2024' | "Line1" | '20'              | '4'           | '80'    | '1/1/2024' | "Line1" | '30'           | '6'           | '180'    | '1/1/2024' | "Line1" | '60'         | '12'          | '280'    | '1/1/2024' | ''       |
			| "3C:Enterprise 8 CORP. Client license for 100 users" | '30'             | '2'           | '60'    | '1/1/2024' | "Line1" | '60'              | '4'           | '240'   | '1/1/2024' | "Line1" | '90'           | '6'           | '540'    | '1/1/2024' | "Line1" | '180'        | '12'          | '840'    | '1/1/2024' | ''       |

Сценарий: 02.06 Выгрузка и загрузка из Excel

	* Открываем сводную таблицу
		И Я октрываю сводную таблицу отчета с именем "VA - Recalculation in context"
		
	* Грузим эталонный файл
		Когда открылось окно '$WindowTitle$'
		И я нажимаю на кнопку с именем 'ImportFromMSExcel'
		Тогда открылось окно "Import from Excel"
		И в поле с именем 'ExistingFile' я ввожу текст "$КаталогПроекта$\Макеты\02\ВА_КонтекстныйПересчетЭталон_En.xlsx"
		И я жду, что поле с именем 'SheetName' перестанет быть пустым в течение 30 секунд
		Тогда элемент формы с именем 'SheetName' стал равен 'TDSheet'		
		И я нажимаю на кнопку с именем 'Load'								
		И я жду открытия формы '$WindowTitle$' в течение 30 секунд	
		Тогда табличный документ 'SpreadsheetFieldTemlate' равен:
			| "VA - Recalculation in context (pivot table)"                    | "January 2024" | ''            | ''      | ''           | ''        | "February 2024" | ''            | ''      | ''           | ''        | "March 2024" | ''            | ''       | ''           | ''        | "TOTAL"      | ''            | ''       | ''           | ''       |
			| "VA - Recalculation in context (pivot table)"                    | "Count"     | "Coefficient" | "Total"  | "Date"       | "Line"  | "Count"      | "Coefficient" | "Total"  | "Date"       | "Line"  | "Count"   | "Coefficient" | "Total"   | "Date"       | "Line"  | "Count" | "Coefficient" | "Total"   | "Date"       | "Line" |
			| "Total"                                                           | '150'            | '10'          | '1,500' | '1/1/2024' | ''        | '300'             | '20'          | '6,000' | '1/1/2024' | ''        | '450'          | '30'          | '13,500' | '1/1/2024' | ''        | '900'        | '60'          | '21,000' | '1/1/2024' | ''       |
			| "Goods"                                                         | '150'            | '10'          | '300'   | '1/1/2024' | ''        | '300'             | '20'          | '1,200' | '1/1/2024' | ''        | '450'          | '30'          | '2,700'  | '1/1/2024' | ''        | '900'        | '60'          | '4,200'  | '1/1/2024' | ''       |
			| "5C:Corporate performance management"                                      | '10'             | '2'           | '20'    | '1/1/2024' | "Line1" | '20'              | '4'           | '80'    | '1/1/2024' | "Line1" | '30'           | '6'           | '180'    | '1/1/2024' | "Line1" | '60'         | '12'          | '280'    | '1/1/2024' | ''       |
			| "2C:Corporation"                                                  | '20'             | '2'           | '40'    | '1/1/2024' | "Line1" | '40'              | '4'           | '160'   | '1/1/2024' | "Line1" | '60'           | '6'           | '360'    | '1/1/2024' | "Line1" | '120'        | '12'          | '560'    | '1/1/2024' | ''       |
			| "4C:Enterprise 8.3 CORP. Server License (x86-64)"           | '30'             | '2'           | '60'    | '1/1/2024' | "Line1" | '60'              | '4'           | '240'   | '1/1/2024' | "Line1" | '90'           | '6'           | '540'    | '1/1/2024' | "Line1" | '180'        | '12'          | '840'    | '1/1/2024' | ''       |
			| "1C:ERP. Corporate performance management"                                   | '40'             | '2'           | '80'    | '1/1/2024' | "Line1" | '80'              | '4'           | '320'   | '1/1/2024' | "Line1" | '120'          | '6'           | '720'    | '1/1/2024' | "Line1" | '240'        | '12'          | '1,120'  | '1/1/2024' | ''       |
			| "3C:Enterprise 8 CORP. Client license for 100 users" | '50'             | '2'           | '100'   | '1/1/2024' | "Line1" | '100'             | '4'           | '400'   | '1/1/2024' | "Line1" | '150'          | '6'           | '900'    | '1/1/2024' | "Line1" | '300'        | '12'          | '1,400'  | '1/1/2024' | ''       |
 		И я нажимаю на кнопку с именем 'Apply'				

	* Выгражуем значения в файл
		Когда открылось окно '$WindowTitle$'
		И я нажимаю на кнопку с именем 'SaveAsExcel'
		Тогда открылось окно "Save in Excel"
		И я меняю значение переключателя с именем 'SavingOption' на "Create new file"				
		И в поле с именем 'Directory' я ввожу текст "$КаталогПроекта$\Макеты\02"
		И в поле с именем 'ExistingFile' я ввожу текст "ВА_КонтекстныйПересчетИсходный"
		И в поле с именем 'SheetName' я ввожу текст "Лист_123"				
		И я нажимаю на кнопку с именем 'Save'
		Затем я жду, что в сообщениях пользователю будет подстрока "saved successfully" в течение 60 секунд		
		И я очищаю окно сообщений пользователю	

	* Грузим подготовленный файл
		Когда открылось окно '$WindowTitle$'
		И я нажимаю на кнопку с именем 'ImportFromMSExcel'
		Тогда открылось окно "Import from Excel"
		И в поле с именем 'ExistingFile' я ввожу текст "$КаталогПроекта$\Макеты\02\ВА_КонтекстныйПересчетПодготовленный_En.xlsx"
		И я жду, что поле с именем 'SheetName' перестанет быть пустым в течение 30 секунд
		Тогда элемент формы с именем 'SheetName' стал равен 'TDSheet'
		И я нажимаю на кнопку с именем 'Load'
		И я жду открытия формы '$WindowTitle$' в течение 30 секунд
		Тогда табличный документ 'SpreadsheetFieldTemlate' равен:
			| "VA - Recalculation in context (pivot table)"                    | "January 2024" | ''            | ''       | ''           | ''         | "February 2024" | ''            | ''       | ''           | ''         | "March 2024" | ''            | ''     | ''     | ''       | "TOTAL"      | ''            | ''       | ''           | ''       |
			| "VA - Recalculation in context (pivot table)"                    | "Count"     | "Coefficient" | "Total"   | "Date"       | "Line"   | "Count"      | "Coefficient" | "Total"   | "Date"       | "Line"   | "Count"   | "Coefficient" | "Total" | "Date" | "Line" | "Count" | "Coefficient" | "Total"   | "Date"       | "Line" |
			| "Total"                                                           | '800'            | '60'          | '48,000' | '1/3/2024' | ''         | '600'             | '80'          | '48,000' | '2/2/2024' | ''         | '0'            | '0'           | '0'    | ''     | ''       | '1,400'      | '140'         | '96,000' | '2/2/2024' | ''       |
			| "Goods"                                                         | '800'            | '60'          | '16,000' | ''           | ''         | '600'             | '80'          | '16,000' | ''           | ''         | '0'            | '0'           | '0'    | ''     | ''       | '1,400'      | '140'         | '32,000' | ''           | ''       |
			| "5C:Corporate performance management"                                      | '100'            | '20'          | '2,000'  | '1/1/2024' | "Line11" | '200'             | '0'           | '0'      | ''           | ''         | '0'            | '0'           | '0'    | ''     | ''       | '300'        | '20'          | '2,000'  | ''           | ''       |
			| "2C:Corporation"                                                  | '200'            | '20'          | '4,000'  | '1/2/2024' | "Line12" | '400'             | '40'          | '16,000' | '2/2/2024' | "Line22" | '0'            | '0'           | '0'    | ''     | ''       | '600'        | '60'          | '20,000' | ''           | ''       |
			| "4C:Enterprise 8.3 CORP. Server License (x86-64)"           | '500'            | '20'          | '10,000' | '1/3/2024' | "Line13" | '0'               | '40'          | '0'      | ''           | "Line23" | '0'            | '0'           | '0'    | ''     | ''       | '500'        | '60'          | '10,000' | ''           | ''       |
			| "1C:ERP. Corporate performance management"                                   | '0'              | '0'           | '0'      | ''           | ''         | '0'               | '0'           | '0'      | ''           | ''         | '0'            | '0'           | '0'    | ''     | ''       | '0'          | '0'           | '0'      | ''           | ''       |
			| "3C:Enterprise 8 CORP. Client license for 100 users" | '0'              | '0'           | '0'      | ''           | ''         | '0'               | '0'           | '0'      | ''           | ''         | '0'            | '0'           | '0'    | ''     | ''       | '0'          | '0'           | '0'      | ''           | ''       |

	* Грузим исходный файл
		Когда открылось окно '$WindowTitle$'
		И я нажимаю на кнопку с именем 'ImportFromMSExcel'
		Тогда открылось окно "Import from Excel"
		И в поле с именем 'ExistingFile' я ввожу текст "$КаталогПроекта$\Макеты\02\ВА_КонтекстныйПересчетИсходный.xlsx"
		И я жду, что поле с именем 'SheetName' перестанет быть пустым в течение 30 секунд
		Тогда элемент формы с именем 'SheetName' стал равен "Лист_123"
		И я нажимаю на кнопку с именем 'Load'								
		И я жду открытия формы '$WindowTitle$' в течение 30 секунд
		Тогда табличный документ 'SpreadsheetFieldTemlate' равен:
			| "VA - Recalculation in context (pivot table)"                    | "January 2024" | ''            | ''      | ''           | ''        | "February 2024" | ''            | ''      | ''           | ''        | "March 2024" | ''            | ''       | ''           | ''        | "TOTAL"      | ''            | ''       | ''           | ''       |
			| "VA - Recalculation in context (pivot table)"                    | "Count"     | "Coefficient" | "Total"  | "Date"       | "Line"  | "Count"      | "Coefficient" | "Total"  | "Date"       | "Line"  | "Count"   | "Coefficient" | "Total"   | "Date"       | "Line"  | "Count" | "Coefficient" | "Total"   | "Date"       | "Line" |
			| "Total"                                                           | '150'            | '10'          | '1,500' | '1/1/2024' | ''        | '300'             | '20'          | '6,000' | '1/1/2024' | ''        | '450'          | '30'          | '13,500' | '1/1/2024' | ''        | '900'        | '60'          | '21,000' | '1/1/2024' | ''       |
			| "Goods"                                                         | '150'            | '10'          | '300'   | '1/1/2024' | ''        | '300'             | '20'          | '1,200' | '1/1/2024' | ''        | '450'          | '30'          | '2,700'  | '1/1/2024' | ''        | '900'        | '60'          | '4,200'  | '1/1/2024' | ''       |
			| "5C:Corporate performance management"                                      | '10'             | '2'           | '20'    | '1/1/2024' | "Line1" | '20'              | '4'           | '80'    | '1/1/2024' | "Line1" | '30'           | '6'           | '180'    | '1/1/2024' | "Line1" | '60'         | '12'          | '280'    | '1/1/2024' | ''       |
			| "2C:Corporation"                                                  | '20'             | '2'           | '40'    | '1/1/2024' | "Line1" | '40'              | '4'           | '160'   | '1/1/2024' | "Line1" | '60'           | '6'           | '360'    | '1/1/2024' | "Line1" | '120'        | '12'          | '560'    | '1/1/2024' | ''       |
			| "4C:Enterprise 8.3 CORP. Server License (x86-64)"           | '30'             | '2'           | '60'    | '1/1/2024' | "Line1" | '60'              | '4'           | '240'   | '1/1/2024' | "Line1" | '90'           | '6'           | '540'    | '1/1/2024' | "Line1" | '180'        | '12'          | '840'    | '1/1/2024' | ''       |
			| "1C:ERP. Corporate performance management"                                   | '40'             | '2'           | '80'    | '1/1/2024' | "Line1" | '80'              | '4'           | '320'   | '1/1/2024' | "Line1" | '120'          | '6'           | '720'    | '1/1/2024' | "Line1" | '240'        | '12'          | '1,120'  | '1/1/2024' | ''       |
			| "3C:Enterprise 8 CORP. Client license for 100 users" | '50'             | '2'           | '100'   | '1/1/2024' | "Line1" | '100'             | '4'           | '400'   | '1/1/2024' | "Line1" | '150'          | '6'           | '900'    | '1/1/2024' | "Line1" | '300'        | '12'          | '1,400'  | '1/1/2024' | ''       |

Сценарий: 02.07 Тестирование формы ввода показателей

	И Я октрываю сводную таблицу отчета с именем "VA - Recalculation in context"

	* Открытие формы редактирование, настройки отображения
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R5C1'
		И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
		Тогда открылось окно "Drill down indicators: *"
		И Таблица 'IndicatorsDrilldown' содержит '5' строк из списка:
			| "Product range"                                                   | 'Period_1_Value1' | 'Period_1_Value2' | 'Period_1_Value3' | 'Period_1_Value4' | 'Period_1_Value5' | 'Period_2_Value1' | 'Period_2_Value2' | 'Period_2_Value3' | 'Period_2_Value4' | 'Period_2_Value5' | 'Period_3_Value3' | 'Period_3_Value1' | 'Period_3_Value2' | 'Period_3_Value4' | 'Period_3_Value5' |
			| "4C:Enterprise 8.3 CORP. Server License (x86-64)"           | '30.00000'           | '2.00000'            | '60.00000'           | '1/1/2024'         | "Line1"            | '60.00000'           | '4.00000'            | '240.00000'          | '1/1/2024'         | "Line1"            | '540.00000'          | '90.00000'           | '6.00000'            | '1/1/2024'         | "Line1"            |
			| "3C:Enterprise 8 CORP. Client license for 100 users" | '50.00000'           | '2.00000'            | '100.00000'          | '1/1/2024'         | "Line1"            | '100.00000'          | '4.00000'            | '400.00000'          | '1/1/2024'         | "Line1"            | '900.00000'          | '150.00000'          | '6.00000'            | '1/1/2024'         | "Line1"            |
			| "5C:Corporate performance management"                                      | '10.00000'           | '2.00000'            | '20.00000'           | '1/1/2024'         | "Line1"            | '20.00000'           | '4.00000'            | '80.00000'           | '1/1/2024'         | "Line1"            | '180.00000'          | '30.00000'           | '6.00000'            | '1/1/2024'         | "Line1"            |
			| "2C:Corporation"                                                  | '20.00000'           | '2.00000'            | '40.00000'           | '1/1/2024'         | "Line1"            | '40.00000'           | '4.00000'            | '160.00000'          | '1/1/2024'         | "Line1"            | '360.00000'          | '60.00000'           | '6.00000'            | '1/1/2024'         | "Line1"            |
			| "1C:ERP. Corporate performance management"                                   | '40.00000'           | '2.00000'            | '80.00000'           | '1/1/2024'         | "Line1"            | '80.00000'           | '4.00000'            | '320.00000'          | '1/1/2024'         | "Line1"            | '720.00000'          | '120.00000'          | '6.00000'            | '1/1/2024'         | "Line1"            |
		И в таблице 'IndicatorsDrilldown' я нажимаю на кнопку с именем 'IndicatorsDrilldownPeriodsInColumns'
		И Таблица 'IndicatorsDrilldown' содержит '15' строк из списка:
			| "Report period"   | "Product range"                                                   | 'Value1' | 'Value3' | 'Value2' | 'Value4'  | 'Value5' |
			| "January 2024"  | "4C:Enterprise 8.3 CORP. Server License (x86-64)"           | '30.00000'  | '60.00000'  | '2.00000'   | '1/1/2024' | "Line1"   |
			| "January 2024"  | "3C:Enterprise 8 CORP. Client license for 100 users" | '50.00000'  | '100.00000' | '2.00000'   | '1/1/2024' | "Line1"   |
			| "January 2024"  | "5C:Corporate performance management"                                      | '10.00000'  | '20.00000'  | '2.00000'   | '1/1/2024' | "Line1"   |
			| "January 2024"  | "2C:Corporation"                                                  | '20.00000'  | '40.00000'  | '2.00000'   | '1/1/2024' | "Line1"   |
			| "January 2024"  | "1C:ERP. Corporate performance management"                                   | '40.00000'  | '80.00000'  | '2.00000'   | '1/1/2024' | "Line1"   |
			| "February 2024" | "4C:Enterprise 8.3 CORP. Server License (x86-64)"           | '60.00000'  | '240.00000' | '4.00000'   | '1/1/2024' | "Line1"   |
			| "February 2024" | "3C:Enterprise 8 CORP. Client license for 100 users" | '100.00000' | '400.00000' | '4.00000'   | '1/1/2024' | "Line1"   |
			| "February 2024" | "5C:Corporate performance management"                                      | '20.00000'  | '80.00000'  | '4.00000'   | '1/1/2024' | "Line1"   |
			| "February 2024" | "2C:Corporation"                                                  | '40.00000'  | '160.00000' | '4.00000'   | '1/1/2024' | "Line1"   |
			| "February 2024" | "1C:ERP. Corporate performance management"                                   | '80.00000'  | '320.00000' | '4.00000'   | '1/1/2024' | "Line1"   |
			| "March 2024"    | "4C:Enterprise 8.3 CORP. Server License (x86-64)"           | '90.00000'  | '540.00000' | '6.00000'   | '1/1/2024' | "Line1"   |
			| "March 2024"    | "3C:Enterprise 8 CORP. Client license for 100 users" | '150.00000' | '900.00000' | '6.00000'   | '1/1/2024' | "Line1"   |
			| "March 2024"    | "5C:Corporate performance management"                                      | '30.00000'  | '180.00000' | '6.00000'   | '1/1/2024' | "Line1"   |
			| "March 2024"    | "2C:Corporation"                                                  | '60.00000'  | '360.00000' | '6.00000'   | '1/1/2024' | "Line1"   |
			| "March 2024"    | "1C:ERP. Corporate performance management"                                   | '120.00000' | '720.00000' | '6.00000'   | '1/1/2024' | "Line1"   |
		И элемент формы с именем 'Accuracy' стал равен '0'
		И у элемента формы с именем 'Divisor' текст редактирования стал равен "units"
		И в поле с именем 'Accuracy' я ввожу текст '5'
		И из выпадающего списка с именем 'Divisor' я выбираю точное значение "thousands"
		И Таблица 'IndicatorsDrilldown' содержит '15' строк из списка:
			| "Report period"   | "Product range"                                                   | 'Value1' | 'Value3' | 'Value2' | 'Value4'  | 'Value5' |
			| "January 2024"  | "4C:Enterprise 8.3 CORP. Server License (x86-64)"           | '0.03000'   | '0.06000'   | '0.00200'   | '1/1/2024' | "Line1"   |
			| "January 2024"  | "3C:Enterprise 8 CORP. Client license for 100 users" | '0.05000'   | '0.10000'   | '0.00200'   | '1/1/2024' | "Line1"   |
			| "January 2024"  | "5C:Corporate performance management"                                      | '0.01000'   | '0.02000'   | '0.00200'   | '1/1/2024' | "Line1"   |
			| "January 2024"  | "2C:Corporation"                                                  | '0.02000'   | '0.04000'   | '0.00200'   | '1/1/2024' | "Line1"   |
			| "January 2024"  | "1C:ERP. Corporate performance management"                                   | '0.04000'   | '0.08000'   | '0.00200'   | '1/1/2024' | "Line1"   |
			| "February 2024" | "4C:Enterprise 8.3 CORP. Server License (x86-64)"           | '0.06000'   | '0.24000'   | '0.00400'   | '1/1/2024' | "Line1"   |
			| "February 2024" | "3C:Enterprise 8 CORP. Client license for 100 users" | '0.10000'   | '0.40000'   | '0.00400'   | '1/1/2024' | "Line1"   |
			| "February 2024" | "5C:Corporate performance management"                                      | '0.02000'   | '0.08000'   | '0.00400'   | '1/1/2024' | "Line1"   |
			| "February 2024" | "2C:Corporation"                                                  | '0.04000'   | '0.16000'   | '0.00400'   | '1/1/2024' | "Line1"   |
			| "February 2024" | "1C:ERP. Corporate performance management"                                   | '0.08000'   | '0.32000'   | '0.00400'   | '1/1/2024' | "Line1"   |
			| "March 2024"    | "4C:Enterprise 8.3 CORP. Server License (x86-64)"           | '0.09000'   | '0.54000'   | '0.00600'   | '1/1/2024' | "Line1"   |
			| "March 2024"    | "3C:Enterprise 8 CORP. Client license for 100 users" | '0.15000'   | '0.90000'   | '0.00600'   | '1/1/2024' | "Line1"   |
			| "March 2024"    | "5C:Corporate performance management"                                      | '0.03000'   | '0.18000'   | '0.00600'   | '1/1/2024' | "Line1"   |
			| "March 2024"    | "2C:Corporation"                                                  | '0.06000'   | '0.36000'   | '0.00600'   | '1/1/2024' | "Line1"   |
			| "March 2024"    | "1C:ERP. Corporate performance management"                                   | '0.12000'   | '0.72000'   | '0.00600'   | '1/1/2024' | "Line1"   |
		И элемент формы с именем 'Accuracy' стал равен '5'
		И у элемента формы с именем 'Divisor' текст редактирования стал равен "thousands"
		И я нажимаю на кнопку с именем 'FormOKButton1'
				
	* Режим таблицы по периодам
		Когда открылось окно '$WindowTitle$'
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R5C1'
		И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
		Когда открылось окно "Drill down indicators: *"
		И Таблица 'IndicatorsDrilldown' содержит '5' строк из списка:
			| "Product range"                                                   | 'Period_1_Value1' | 'Period_1_Value2' | 'Period_1_Value3' | 'Period_1_Value4' | 'Period_1_Value5' | 'Period_2_Value1' | 'Period_2_Value2' | 'Period_2_Value3' | 'Period_2_Value4' | 'Period_2_Value5' | 'Period_3_Value1' | 'Period_3_Value2' | 'Period_3_Value3' | 'Period_3_Value4' | 'Period_3_Value5' |
			| "4C:Enterprise 8.3 CORP. Server License (x86-64)"           | '30.00000'           | '2.00000'            | '60.00000'           | '1/1/2024'         | "Line1"            | '60.00000'           | '4.00000'            | '240.00000'          | '1/1/2024'         | "Line1"            | '90.00000'           | '6.00000'            | '540.00000'          | '1/1/2024'         | "Line1"            |
			| "3C:Enterprise 8 CORP. Client license for 100 users" | '50.00000'           | '2.00000'            | '100.00000'          | '1/1/2024'         | "Line1"            | '100.00000'          | '4.00000'            | '400.00000'          | '1/1/2024'         | "Line1"            | '150.00000'          | '6.00000'            | '900.00000'          | '1/1/2024'         | "Line1"            |
			| "5C:Corporate performance management"                                      | '10.00000'           | '2.00000'            | '20.00000'           | '1/1/2024'         | "Line1"            | '20.00000'           | '4.00000'            | '80.00000'           | '1/1/2024'         | "Line1"            | '30.00000'           | '6.00000'            | '180.00000'          | '1/1/2024'         | "Line1"            |
			| "2C:Corporation"                                                  | '20.00000'           | '2.00000'            | '40.00000'           | '1/1/2024'         | "Line1"            | '40.00000'           | '4.00000'            | '160.00000'          | '1/1/2024'         | "Line1"            | '60.00000'           | '6.00000'            | '360.00000'          | '1/1/2024'         | "Line1"            |
			| "1C:ERP. Corporate performance management"                                   | '40.00000'           | '2.00000'            | '80.00000'           | '1/1/2024'         | "Line1"            | '80.00000'           | '4.00000'            | '320.00000'          | '1/1/2024'         | "Line1"            | '120.00000'          | '6.00000'            | '720.00000'          | '1/1/2024'         | "Line1"            |

	* Удаление аналитики
		И в таблице 'IndicatorsDrilldown' я перехожу к строке:
			| "Product range"  |
			| "2C:Corporation" |
		И в таблице 'IndicatorsDrilldown' я нажимаю на кнопку с именем 'IndicatorsDrilldownDelete'
		И в таблице 'IndicatorsDrilldown' я перехожу к строке:
			| "Product range"                 |
			| "1C:ERP. Corporate performance management" |
		И в таблице 'IndicatorsDrilldown' я нажимаю на кнопку с именем 'IndicatorsDrilldownDelete'		
		И я нажимаю на кнопку с именем 'FormOKButton1'
		Когда открылось окно '$WindowTitle$'
		И я нажимаю на кнопку с именем 'FormRowsWithValues'
		И я нажимаю на кнопку с именем 'FormColumnsWithValues'
		Тогда табличный документ 'SpreadsheetFieldTemlate' равен:
			| "VA - Recalculation in context (pivot table)"                    | "January 2024" | ''            | ''     | ''           | ''        | "February 2024" | ''            | ''      | ''           | ''        | "March 2024" | ''            | ''      | ''           | ''        | "TOTAL"      | ''            | ''      | ''           | ''       |
			| "VA - Recalculation in context (pivot table)"                    | "Count"     | "Coefficient" | "Total" | "Date"       | "Line"  | "Count"      | "Coefficient" | "Total"  | "Date"       | "Line"  | "Count"   | "Coefficient" | "Total"  | "Date"       | "Line"  | "Count" | "Coefficient" | "Total"  | "Date"       | "Line" |
			| "Total"                                                           | '90'             | '6'           | '540'  | '1/1/2024' | ''        | '180'             | '12'          | '2,160' | '1/1/2024' | ''        | '270'          | '18'          | '4,860' | '1/1/2024' | ''        | '540'        | '36'          | '7,560' | '1/1/2024' | ''       |
			| "Goods"                                                         | '90'             | '6'           | '180'  | '1/1/2024' | ''        | '180'             | '12'          | '720'   | '1/1/2024' | ''        | '270'          | '18'          | '1,620' | '1/1/2024' | ''        | '540'        | '36'          | '2,520' | '1/1/2024' | ''       |
			| "5C:Corporate performance management"                                      | '10'             | '2'           | '20'   | '1/1/2024' | "Line1" | '20'              | '4'           | '80'    | '1/1/2024' | "Line1" | '30'           | '6'           | '180'   | '1/1/2024' | "Line1" | '60'         | '12'          | '280'   | '1/1/2024' | ''       |
			| "4C:Enterprise 8.3 CORP. Server License (x86-64)"           | '30'             | '2'           | '60'   | '1/1/2024' | "Line1" | '60'              | '4'           | '240'   | '1/1/2024' | "Line1" | '90'           | '6'           | '540'   | '1/1/2024' | "Line1" | '180'        | '12'          | '840'   | '1/1/2024' | ''       |
			| "3C:Enterprise 8 CORP. Client license for 100 users" | '50'             | '2'           | '100'  | '1/1/2024' | "Line1" | '100'             | '4'           | '400'   | '1/1/2024' | "Line1" | '150'          | '6'           | '900'   | '1/1/2024' | "Line1" | '300'        | '12'          | '1,400' | '1/1/2024' | ''       |

	* Добавляем аналитики
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R5C1'
		И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
		Когда открылось окно "Drill down indicators: *"
		* Очищаем поле "Строка"
			И в таблице 'IndicatorsDrilldown' я перехожу к строке:
				| "Product range"                                         |
				| "4C:Enterprise 8.3 CORP. Server License (x86-64)" |
			И в таблице 'IndicatorsDrilldown' в поле с именем 'Period_1_Value5' я ввожу текст ''
			И в таблице 'IndicatorsDrilldown' я перехожу к строке:
				| "Product range"                                                   |
				| "3C:Enterprise 8 CORP. Client license for 100 users" |
			И в таблице 'IndicatorsDrilldown' в поле с именем 'Period_1_Value5' я ввожу текст ''
			И в таблице 'IndicatorsDrilldown' я перехожу к строке:
				| "Product range"              |
				| "5C:Corporate performance management" |
			И в таблице 'IndicatorsDrilldown' в поле с именем 'Period_1_Value5' я ввожу текст ''
		* Добавляем строки
			И в таблице 'IndicatorsDrilldown' я нажимаю на кнопку с именем 'IndicatorsDrilldownAdd'
			И в таблице 'IndicatorsDrilldown' из выпадающего списка с именем "VA0Product" я выбираю точное значение "2C:Corporation"
			И в таблице 'IndicatorsDrilldown' в поле с именем 'Period_1_Value1' я ввожу текст '50.00000'
			И в таблице 'IndicatorsDrilldown' в поле с именем 'Period_1_Value2' я ввожу текст '2.00000'
			И в таблице 'IndicatorsDrilldown' в поле с именем 'Period_1_Value4' я ввожу текст '1/1/2024'
			И в таблице 'IndicatorsDrilldown' я нажимаю на кнопку с именем 'IndicatorsDrilldownAdd'
			И в таблице 'IndicatorsDrilldown' из выпадающего списка с именем "VA0Product" я выбираю точное значение "5C:Corporate performance management"
			И в таблице 'IndicatorsDrilldown' я нажимаю на кнопку с именем 'IndicatorsDrilldownAdd'
			И в таблице 'IndicatorsDrilldown' из выпадающего списка с именем "VA0Product" я выбираю точное значение "5C:Corporate performance management"
			И в таблице 'IndicatorsDrilldown' в поле с именем 'Period_1_Value1' я ввожу текст '20.00000'
			И в таблице 'IndicatorsDrilldown' в поле с именем 'Period_1_Value4' я ввожу текст '1/31/2024'
		* Сверяем результат
			И я нажимаю на кнопку с именем 'FormOKButton1'
			Когда открылось окно '$WindowTitle$'
			Тогда табличный документ 'SpreadsheetFieldTemlate' равен:
				| "VA - Recalculation in context (pivot table)"                    | "January 2024" | ''            | ''      | ''           | ''       | "February 2024" | ''            | ''      | ''           | ''        | "March 2024" | ''            | ''      | ''           | ''        | "TOTAL"      | ''            | ''      | ''           | ''       |
				| "VA - Recalculation in context (pivot table)"                    | "Count"     | "Coefficient" | "Total"  | "Date"       | "Line" | "Count"      | "Coefficient" | "Total"  | "Date"       | "Line"  | "Count"   | "Coefficient" | "Total"  | "Date"       | "Line"  | "Count" | "Coefficient" | "Total"  | "Date"       | "Line" |
				| "Total"                                                           | '160'            | '8'           | '1,280' | '1/31/2024' | ''       | '180'             | '12'          | '2,160' | '1/1/2024' | ''        | '270'          | '18'          | '4,860' | '1/1/2024' | ''        | '610'        | '38'          | '8,300' | '1/31/2024' | ''       |
				| "Goods"                                                         | '160'            | '8'           | '320'   | '1/1/2024' | ''       | '180'             | '12'          | '720'   | ''           | ''        | '270'          | '18'          | '1,620' | ''           | ''        | '610'        | '38'          | '2,660' | ''           | ''       |
				| "5C:Corporate performance management"                                      | '30'             | '2'           | '60'    | '1/31/2024' | ''       | '20'              | '4'           | '80'    | ''           | ''        | '30'           | '6'           | '180'   | ''           | ''        | '80'         | '12'          | '320'   | ''           | ''       |
				| "2C:Corporation"                                                  | '50'             | '2'           | '100'   | '1/1/2024' | ''       | '0'               | '0'           | '0'     | ''           | ''        | '0'            | '0'           | '0'     | ''           | ''        | '50'         | '2'           | '100'   | ''           | ''       |
				| "4C:Enterprise 8.3 CORP. Server License (x86-64)"           | '30'             | '2'           | '60'    | '1/1/2024' | ''       | '60'              | '4'           | '240'   | '1/1/2024' | "Line1" | '90'           | '6'           | '540'   | '1/1/2024' | "Line1" | '180'        | '12'          | '840'   | '1/1/2024' | ''       |
				| "3C:Enterprise 8 CORP. Client license for 100 users" | '50'             | '2'           | '100'   | '1/1/2024' | ''       | '100'             | '4'           | '400'   | '1/1/2024' | "Line1" | '150'          | '6'           | '900'   | '1/1/2024' | "Line1" | '300'        | '12'          | '1,400' | '1/1/2024' | ''       |

	* Октрываем форму для одного периода (Количество)
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R5C2'
		И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
		Когда открылось окно "Drill down indicators: *"	
		Тогда Таблица 'IndicatorsDrilldown' содержит '4' строк из списка:
			| "Product range"                                                   | 'Value1' |
			| "4C:Enterprise 8.3 CORP. Server License (x86-64)"           | '30'        |
			| "3C:Enterprise 8 CORP. Client license for 100 users" | '50'        |
			| "5C:Corporate performance management"                                      | '30'        |
			| "2C:Corporation"                                                  | '50'        |
		И в таблице 'IndicatorsDrilldown' я перехожу к строке:
			| "Product range"  |
			| "2C:Corporation" |
		И в таблице 'IndicatorsDrilldown' в поле с именем 'Value1' я ввожу текст '70.00000'
		И в таблице 'IndicatorsDrilldown' я нажимаю на кнопку с именем 'IndicatorsDrilldownAdd'
		И в таблице 'IndicatorsDrilldown' из выпадающего списка с именем "VA0Product" я выбираю точное значение "5C:Corporate performance management"
		И в таблице 'IndicatorsDrilldown' в поле с именем 'Value1' я ввожу текст '20.00000'			
		И я нажимаю на кнопку с именем 'FormButtonApply'
		И я нажимаю на кнопку с именем 'FormCancel'
		Тогда табличный документ 'SpreadsheetFieldTemlate' равен:
			| "VA - Recalculation in context (pivot table)"                    | "January 2024" | ''            | ''      | ''           | ''       | "February 2024" | ''            | ''      | ''           | ''        | "March 2024" | ''            | ''      | ''           | ''        | "TOTAL"      | ''            | ''      | ''           | ''       |
			| "VA - Recalculation in context (pivot table)"                    | "Count"     | "Coefficient" | "Total"  | "Date"       | "Line" | "Count"      | "Coefficient" | "Total"  | "Date"       | "Line"  | "Count"   | "Coefficient" | "Total"  | "Date"       | "Line"  | "Count" | "Coefficient" | "Total"  | "Date"       | "Line" |
			| "Total"                                                           | '200'            | '8'           | '1,600' | '1/31/2024' | ''       | '180'             | '12'          | '2,160' | '1/1/2024' | ''        | '270'          | '18'          | '4,860' | '1/1/2024' | ''        | '650'        | '38'          | '8,620' | '1/31/2024' | ''       |
			| "Goods"                                                         | '200'            | '8'           | '400'   | '1/1/2024' | ''       | '180'             | '12'          | '720'   | ''           | ''        | '270'          | '18'          | '1,620' | ''           | ''        | '650'        | '38'          | '2,740' | ''           | ''       |
			| "5C:Corporate performance management"                                      | '50'             | '2'           | '100'   | '1/31/2024' | ''       | '20'              | '4'           | '80'    | ''           | ''        | '30'           | '6'           | '180'   | ''           | ''        | '100'        | '12'          | '360'   | ''           | ''       |
			| "2C:Corporation"                                                  | '70'             | '2'           | '140'   | '1/1/2024' | ''       | '0'               | '0'           | '0'     | ''           | ''        | '0'            | '0'           | '0'     | ''           | ''        | '70'         | '2'           | '140'   | ''           | ''       |
			| "4C:Enterprise 8.3 CORP. Server License (x86-64)"           | '30'             | '2'           | '60'    | '1/1/2024' | ''       | '60'              | '4'           | '240'   | '1/1/2024' | "Line1" | '90'           | '6'           | '540'   | '1/1/2024' | "Line1" | '180'        | '12'          | '840'   | '1/1/2024' | ''       |
			| "3C:Enterprise 8 CORP. Client license for 100 users" | '50'             | '2'           | '100'   | '1/1/2024' | ''       | '100'             | '4'           | '400'   | '1/1/2024' | "Line1" | '150'          | '6'           | '900'   | '1/1/2024' | "Line1" | '300'        | '12'          | '1,400' | '1/1/2024' | ''       |

	* Октрываем форму для одного периода (Дата)
		Когда открылось окно '$WindowTitle$'
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке "R5C5"
		И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
		Когда открылось окно "Drill down indicators: *"	
		Тогда Таблица 'IndicatorsDrilldown' содержит '4' строк из списка:
			| "Product range"                                                   | 'Value1'  |
			| "4C:Enterprise 8.3 CORP. Server License (x86-64)"           | '1/1/2024' |
			| "3C:Enterprise 8 CORP. Client license for 100 users" | '1/1/2024' |
			| "5C:Corporate performance management"                                      | '1/31/2024' |
			| "2C:Corporation"                                                  | '1/1/2024' |
		* Меняем пустое значение
			И в таблице 'IndicatorsDrilldown' я нажимаю на кнопку с именем 'IndicatorsDrilldownAdd'
			И в таблице 'IndicatorsDrilldown' из выпадающего списка с именем "VA0Product" я выбираю точное значение "1C:ERP. Corporate performance management"	
			И в таблице 'IndicatorsDrilldown' в поле с именем 'Value1' я ввожу текст '2/5/2024'	
		* Меняем существующее значение
			И в таблице 'IndicatorsDrilldown' я перехожу к строке:
				| "Product range"  |
				| "2C:Corporation" |
			И в таблице 'IndicatorsDrilldown' в поле с именем 'Value1' я ввожу текст '2/5/2024'
		* Добавляем новое значение
			И в таблице 'IndicatorsDrilldown' я нажимаю на кнопку с именем 'IndicatorsDrilldownAdd'
			И в таблице 'IndicatorsDrilldown' из выпадающего списка с именем "VA0Product" я выбираю точное значение "5C:Corporate performance management"
			И в таблице 'IndicatorsDrilldown' в поле с именем 'Value1' я ввожу текст '2/5/2024'
			И в таблице 'IndicatorsDrilldown' я завершаю редактирование строки
		И я нажимаю на кнопку с именем 'FormOKButton1'
		Когда открылось окно '$WindowTitle$'
		Тогда табличный документ 'SpreadsheetFieldTemlate' равен:
			| "VA - Recalculation in context (pivot table)"                    | "January 2024" | ''            | ''      | ''           | ''       | "February 2024" | ''            | ''      | ''           | ''        | "March 2024" | ''            | ''      | ''           | ''        | "TOTAL"      | ''            | ''      | ''           | ''       |
			| "VA - Recalculation in context (pivot table)"                    | "Count"     | "Coefficient" | "Total"  | "Date"       | "Line" | "Count"      | "Coefficient" | "Total"  | "Date"       | "Line"  | "Count"   | "Coefficient" | "Total"  | "Date"       | "Line"  | "Count" | "Coefficient" | "Total"  | "Date"       | "Line" |
			| "Total"                                                           | '200'            | '8'           | '1,600' | '2/5/2024' | ''       | '180'             | '12'          | '2,160' | '1/1/2024' | ''        | '270'          | '18'          | '4,860' | '1/1/2024' | ''        | '650'        | '38'          | '8,620' | '2/5/2024' | ''       |
			| "Goods"                                                         | '200'            | '8'           | '400'   | '1/1/2024' | ''       | '180'             | '12'          | '720'   | ''           | ''        | '270'          | '18'          | '1,620' | ''           | ''        | '650'        | '38'          | '2,740' | ''           | ''       |
			| "5C:Corporate performance management"                                      | '50'             | '2'           | '100'   | '2/5/2024' | ''       | '20'              | '4'           | '80'    | ''           | ''        | '30'           | '6'           | '180'   | ''           | ''        | '100'        | '12'          | '360'   | ''           | ''       |
			| "2C:Corporation"                                                  | '70'             | '2'           | '140'   | '2/5/2024' | ''       | '0'               | '0'           | '0'     | ''           | ''        | '0'            | '0'           | '0'     | ''           | ''        | '70'         | '2'           | '140'   | ''           | ''       |
			| "4C:Enterprise 8.3 CORP. Server License (x86-64)"           | '30'             | '2'           | '60'    | '1/1/2024' | ''       | '60'              | '4'           | '240'   | '1/1/2024' | "Line1" | '90'           | '6'           | '540'   | '1/1/2024' | "Line1" | '180'        | '12'          | '840'   | '1/1/2024' | ''       |
			| "1C:ERP. Corporate performance management"                                   | '0'              | '0'           | '0'     | '2/5/2024' | ''       | '0'               | '0'           | '0'     | ''           | ''        | '0'            | '0'           | '0'     | ''           | ''        | '0'          | '0'           | '0'     | '2/5/2024' | ''       |
			| "3C:Enterprise 8 CORP. Client license for 100 users" | '50'             | '2'           | '100'   | '1/1/2024' | ''       | '100'             | '4'           | '400'   | '1/1/2024' | "Line1" | '150'          | '6'           | '900'   | '1/1/2024' | "Line1" | '300'        | '12'          | '1,400' | '1/1/2024' | ''       |

	* Открываем форму для одного периода (Строка)
		Когда открылось окно '$WindowTitle$'
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке "R5C6"
		И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
		Когда открылось окно "Drill down indicators: *"	
		И в таблице 'IndicatorsDrilldown' я нажимаю на кнопку с именем 'IndicatorsDrilldownDelete'
		И в таблице 'IndicatorsDrilldown' я нажимаю на кнопку с именем 'IndicatorsDrilldownDelete'
		И в таблице 'IndicatorsDrilldown' я нажимаю на кнопку с именем 'IndicatorsDrilldownDelete'
		И в таблице 'IndicatorsDrilldown' я нажимаю на кнопку с именем 'IndicatorsDrilldownDelete'
		И в таблице 'IndicatorsDrilldown' я нажимаю на кнопку с именем 'IndicatorsDrilldownAdd'
		И в таблице 'IndicatorsDrilldown' из выпадающего списка с именем "VA0Product" я выбираю точное значение "5C:Corporate performance management"
		И в таблице 'IndicatorsDrilldown' в поле с именем 'Value1' я ввожу текст 'String2'
		И в таблице 'IndicatorsDrilldown' я нажимаю на кнопку с именем 'IndicatorsDrilldownAdd'
		И в таблице 'IndicatorsDrilldown' из выпадающего списка с именем "VA0Product" я выбираю точное значение "5C:Corporate performance management"
		И в таблице 'IndicatorsDrilldown' в поле с именем 'Value1' я ввожу текст 'String3'
		И я нажимаю на кнопку с именем 'FormOKButton1'
		Когда открылось окно '$WindowTitle$'
		Тогда табличный документ 'SpreadsheetFieldTemlate' равен:
			| "VA - Recalculation in context (pivot table)"                    | "January 2024" | ''            | ''      | ''           | ''        | "February 2024" | ''            | ''      | ''           | ''        | "March 2024" | ''            | ''      | ''           | ''        | "TOTAL"      | ''            | ''      | ''           | ''       |
			| "VA - Recalculation in context (pivot table)"                    | "Count"     | "Coefficient" | "Total"  | "Date"       | "Line"  | "Count"      | "Coefficient" | "Total"  | "Date"       | "Line"  | "Count"   | "Coefficient" | "Total"  | "Date"       | "Line"  | "Count" | "Coefficient" | "Total"  | "Date"       | "Line" |
			| "Total"                                                           | '200'            | '8'           | '1,600' | '2/5/2024' | ''        | '180'             | '12'          | '2,160' | '1/1/2024' | ''        | '270'          | '18'          | '4,860' | '1/1/2024' | ''        | '650'        | '38'          | '8,620' | '2/5/2024' | ''       |
			| "Goods"                                                         | '200'            | '8'           | '400'   | '1/1/2024' | ''        | '180'             | '12'          | '720'   | ''           | ''        | '270'          | '18'          | '1,620' | ''           | ''        | '650'        | '38'          | '2,740' | ''           | ''       |
			| "5C:Corporate performance management"                                      | '50'             | '2'           | '100'   | '2/5/2024' | 'String3' | '20'              | '4'           | '80'    | ''           | ''        | '30'           | '6'           | '180'   | ''           | ''        | '100'        | '12'          | '360'   | ''           | ''       |
			| "2C:Corporation"                                                  | '70'             | '2'           | '140'   | '2/5/2024' | ''        | '0'               | '0'           | '0'     | ''           | ''        | '0'            | '0'           | '0'     | ''           | ''        | '70'         | '2'           | '140'   | ''           | ''       |
			| "4C:Enterprise 8.3 CORP. Server License (x86-64)"           | '30'             | '2'           | '60'    | '1/1/2024' | ''        | '60'              | '4'           | '240'   | '1/1/2024' | "Line1" | '90'           | '6'           | '540'   | '1/1/2024' | "Line1" | '180'        | '12'          | '840'   | '1/1/2024' | ''       |
			| "1C:ERP. Corporate performance management"                                   | '0'              | '0'           | '0'     | '2/5/2024' | ''        | '0'               | '0'           | '0'     | ''           | ''        | '0'            | '0'           | '0'     | ''           | ''        | '0'          | '0'           | '0'     | '2/5/2024' | ''       |
			| "3C:Enterprise 8 CORP. Client license for 100 users" | '50'             | '2'           | '100'   | '1/1/2024' | ''        | '100'             | '4'           | '400'   | '1/1/2024' | "Line1" | '150'          | '6'           | '900'   | '1/1/2024' | "Line1" | '300'        | '12'          | '1,400' | '1/1/2024' | ''       |
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке "R5C6"
		И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
		Когда открылось окно "Drill down indicators: *"	
		И в таблице 'IndicatorsDrilldown' я нажимаю на кнопку с именем 'IndicatorsDrilldownAdd'
		И в таблице 'IndicatorsDrilldown' из выпадающего списка с именем "VA0Product" я выбираю точное значение "1C:ERP. Corporate performance management"
		И в таблице 'IndicatorsDrilldown' в поле с именем 'Value1' я ввожу текст 'String4'
		И в таблице 'IndicatorsDrilldown' я перехожу к строке:
			| "Product range"              | 'Value1' |
			| "5C:Corporate performance management" | 'String3'   |
		И в таблице 'IndicatorsDrilldown' я нажимаю на кнопку с именем 'IndicatorsDrilldownDelete'
		И я нажимаю на кнопку с именем 'FormOKButton1'
		Когда открылось окно '$WindowTitle$'
		Тогда табличный документ 'SpreadsheetFieldTemlate' равен:
			| "VA - Recalculation in context (pivot table)"                    | "January 2024" | ''            | ''      | ''           | ''        | "February 2024" | ''            | ''      | ''           | ''        | "March 2024" | ''            | ''      | ''           | ''        | "TOTAL"      | ''            | ''      | ''           | ''       |
			| "VA - Recalculation in context (pivot table)"                    | "Count"     | "Coefficient" | "Total"  | "Date"       | "Line"  | "Count"      | "Coefficient" | "Total"  | "Date"       | "Line"  | "Count"   | "Coefficient" | "Total"  | "Date"       | "Line"  | "Count" | "Coefficient" | "Total"  | "Date"       | "Line" |
			| "Total"                                                           | '200'            | '8'           | '1,600' | '2/5/2024' | ''        | '180'             | '12'          | '2,160' | '1/1/2024' | ''        | '270'          | '18'          | '4,860' | '1/1/2024' | ''        | '650'        | '38'          | '8,620' | '2/5/2024' | ''       |
			| "Goods"                                                         | '200'            | '8'           | '400'   | '1/1/2024' | ''        | '180'             | '12'          | '720'   | ''           | ''        | '270'          | '18'          | '1,620' | ''           | ''        | '650'        | '38'          | '2,740' | ''           | ''       |
			| "5C:Corporate performance management"                                      | '50'             | '2'           | '100'   | '2/5/2024' | ''        | '20'              | '4'           | '80'    | ''           | ''        | '30'           | '6'           | '180'   | ''           | ''        | '100'        | '12'          | '360'   | ''           | ''       |
			| "2C:Corporation"                                                  | '70'             | '2'           | '140'   | '2/5/2024' | ''        | '0'               | '0'           | '0'     | ''           | ''        | '0'            | '0'           | '0'     | ''           | ''        | '70'         | '2'           | '140'   | ''           | ''       |
			| "4C:Enterprise 8.3 CORP. Server License (x86-64)"           | '30'             | '2'           | '60'    | '1/1/2024' | ''        | '60'              | '4'           | '240'   | '1/1/2024' | "Line1" | '90'           | '6'           | '540'   | '1/1/2024' | "Line1" | '180'        | '12'          | '840'   | '1/1/2024' | ''       |
			| "1C:ERP. Corporate performance management"                                   | '0'              | '0'           | '0'     | '2/5/2024' | 'String4' | '0'               | '0'           | '0'     | ''           | ''        | '0'            | '0'           | '0'     | ''           | ''        | '0'          | '0'           | '0'     | '2/5/2024' | ''       |
			| "3C:Enterprise 8 CORP. Client license for 100 users" | '50'             | '2'           | '100'   | '1/1/2024' | ''        | '100'             | '4'           | '400'   | '1/1/2024' | "Line1" | '150'          | '6'           | '900'   | '1/1/2024' | "Line1" | '300'        | '12'          | '1,400' | '1/1/2024' | ''       |

	* Открываем форму для итога по периодам
		Когда открылось окно '$WindowTitle$'
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке "R4C17"
		И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
		Когда открылось окно "Drill down indicators (read-only): *"	
		Тогда Таблица 'IndicatorsDrilldown' содержит '3' строк из списка:
			| "Report period"   | 'Value1' |
			| "February 2024" | '180'       |
			| "March 2024"    | '270'       |
			| "January 2024"  | '200'       |
		И я нажимаю на кнопку с именем 'FormCancel'
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке "R5C17"
		И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
		Когда открылось окно "Drill down indicators: *"
		* Удаляем строку
			И в таблице 'IndicatorsDrilldown' я перехожу к строке:
				| "Report period"  | "Product range"                                                   | 'Value1' |
				| "January 2024" | "3C:Enterprise 8 CORP. Client license for 100 users" | '50'        |
			И в таблице 'IndicatorsDrilldown' я нажимаю на кнопку с именем 'IndicatorsDrilldownDelete'
		* Меняем значение
			И в таблице 'IndicatorsDrilldown' я перехожу к строке:
				| "Report period"  | "Product range"              | 'Value1' |
				| "January 2024" | "5C:Corporate performance management" | '50'        |
			И в таблице 'IndicatorsDrilldown' в поле с именем 'Value1' я ввожу текст '100'
		* Добавляем значение		
			И в таблице 'IndicatorsDrilldown' я нажимаю на кнопку с именем 'IndicatorsDrilldownAdd'
			И в таблице 'IndicatorsDrilldown' из выпадающего списка с именем 'ReportPeriod' я выбираю по строке "January 2024"
			И в таблице 'IndicatorsDrilldown' я активизирую поле с именем "VA0Product"
			И в таблице 'IndicatorsDrilldown' из выпадающего списка с именем "VA0Product" я выбираю по строке "2C:Corporation"
			И в таблице 'IndicatorsDrilldown' в поле с именем 'Value1' я ввожу текст '30'
		И я нажимаю на кнопку с именем 'FormOKButton1'
		Тогда табличный документ 'SpreadsheetFieldTemlate' равен:
			| "VA - Recalculation in context (pivot table)"                    | "January 2024" | ''            | ''      | ''           | ''        | "February 2024" | ''            | ''      | ''           | ''        | "March 2024" | ''            | ''      | ''           | ''        | "TOTAL"      | ''            | ''      | ''           | ''       |
			| "VA - Recalculation in context (pivot table)"                    | "Count"     | "Coefficient" | "Total"  | "Date"       | "Line"  | "Count"      | "Coefficient" | "Total"  | "Date"       | "Line"  | "Count"   | "Coefficient" | "Total"  | "Date"       | "Line"  | "Count" | "Coefficient" | "Total"  | "Date"       | "Line" |
			| "Total"                                                           | '230'            | '8'           | '1,840' | '2/5/2024' | ''        | '180'             | '12'          | '2,160' | '1/1/2024' | ''        | '270'          | '18'          | '4,860' | '1/1/2024' | ''        | '680'        | '38'          | '8,860' | '2/5/2024' | ''       |
			| "Goods"                                                         | '230'            | '8'           | '460'   | '1/1/2024' | ''        | '180'             | '12'          | '720'   | ''           | ''        | '270'          | '18'          | '1,620' | ''           | ''        | '680'        | '38'          | '2,800' | ''           | ''       |
			| "5C:Corporate performance management"                                      | '100'            | '2'           | '200'   | '2/5/2024' | ''        | '20'              | '4'           | '80'    | ''           | ''        | '30'           | '6'           | '180'   | ''           | ''        | '150'        | '12'          | '460'   | ''           | ''       |
			| "2C:Corporation"                                                  | '100'            | '2'           | '200'   | '2/5/2024' | ''        | '0'               | '0'           | '0'     | ''           | ''        | '0'            | '0'           | '0'     | ''           | ''        | '100'        | '2'           | '200'   | ''           | ''       |
			| "4C:Enterprise 8.3 CORP. Server License (x86-64)"           | '30'             | '2'           | '60'    | '1/1/2024' | ''        | '60'              | '4'           | '240'   | '1/1/2024' | "Line1" | '90'           | '6'           | '540'   | '1/1/2024' | "Line1" | '180'        | '12'          | '840'   | '1/1/2024' | ''       |
			| "1C:ERP. Corporate performance management"                                   | '0'              | '0'           | '0'     | '2/5/2024' | 'String4' | '0'               | '0'           | '0'     | ''           | ''        | '0'            | '0'           | '0'     | ''           | ''        | '0'          | '0'           | '0'     | '2/5/2024' | ''       |
			| "3C:Enterprise 8 CORP. Client license for 100 users" | '0'              | '2'           | '0'     | '1/1/2024' | ''        | '100'             | '4'           | '400'   | '1/1/2024' | "Line1" | '150'          | '6'           | '900'   | '1/1/2024' | "Line1" | '250'        | '12'          | '1,300' | '1/1/2024' | ''       |

	* Открываем форму для итога по периодам (Дата)
		Когда открылось окно '$WindowTitle$'
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке "R5C20"
		И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
		Когда открылось окно "Drill down indicators: *"
		* Удаляем строку
			И в таблице 'IndicatorsDrilldown' я перехожу к строке:
				| "Report period"  | "Product range"                                                   | 'Value1'  |
				| "January 2024" | "3C:Enterprise 8 CORP. Client license for 100 users" | '1/1/2024' |
			И в таблице 'IndicatorsDrilldown' я нажимаю на кнопку с именем 'IndicatorsDrilldownDelete'
		* Меняем значение			
			И в таблице 'IndicatorsDrilldown' я перехожу к строке:
				| "Report period"  | "Product range"              | 'Value1'  |
				| "January 2024" | "5C:Corporate performance management" | '2/5/2024' |
			И в таблице 'IndicatorsDrilldown' в поле с именем 'Value1' я ввожу текст '3/10/2024'	
		* Добавляем значение
			И в таблице 'IndicatorsDrilldown' я нажимаю на кнопку с именем 'IndicatorsDrilldownAdd'
			И в таблице 'IndicatorsDrilldown' из выпадающего списка с именем 'ReportPeriod' я выбираю точное значение "January 2024"
			И в таблице 'IndicatorsDrilldown' из выпадающего списка с именем "VA0Product" я выбираю точное значение "2C:Corporation"
			И в таблице 'IndicatorsDrilldown' в поле с именем 'Value1' я ввожу текст '3/10/2024'
		И я нажимаю на кнопку с именем 'FormOKButton1'
		Когда открылось окно '$WindowTitle$'
		Тогда табличный документ 'SpreadsheetFieldTemlate' равен:
			| "VA - Recalculation in context (pivot table)"                    | "January 2024" | ''            | ''      | ''           | ''        | "February 2024" | ''            | ''      | ''           | ''        | "March 2024" | ''            | ''      | ''           | ''        | "TOTAL"      | ''            | ''      | ''           | ''       |
			| "VA - Recalculation in context (pivot table)"                    | "Count"     | "Coefficient" | "Total"  | "Date"       | "Line"  | "Count"      | "Coefficient" | "Total"  | "Date"       | "Line"  | "Count"   | "Coefficient" | "Total"  | "Date"       | "Line"  | "Count" | "Coefficient" | "Total"  | "Date"       | "Line" |
			| "Total"                                                           | '230'            | '8'           | '1,840' | '3/10/2024' | ''        | '180'             | '12'          | '2,160' | '1/1/2024' | ''        | '270'          | '18'          | '4,860' | '1/1/2024' | ''        | '680'        | '38'          | '8,860' | '3/10/2024' | ''       |
			| "Goods"                                                         | '230'            | '8'           | '460'   | '1/1/2024' | ''        | '180'             | '12'          | '720'   | ''           | ''        | '270'          | '18'          | '1,620' | ''           | ''        | '680'        | '38'          | '2,800' | ''           | ''       |
			| "5C:Corporate performance management"                                      | '100'            | '2'           | '200'   | '3/10/2024' | ''        | '20'              | '4'           | '80'    | ''           | ''        | '30'           | '6'           | '180'   | ''           | ''        | '150'        | '12'          | '460'   | ''           | ''       |
			| "2C:Corporation"                                                  | '100'            | '2'           | '200'   | '3/10/2024' | ''        | '0'               | '0'           | '0'     | ''           | ''        | '0'            | '0'           | '0'     | ''           | ''        | '100'        | '2'           | '200'   | ''           | ''       |
			| "4C:Enterprise 8.3 CORP. Server License (x86-64)"           | '30'             | '2'           | '60'    | '1/1/2024' | ''        | '60'              | '4'           | '240'   | '1/1/2024' | "Line1" | '90'           | '6'           | '540'   | '1/1/2024' | "Line1" | '180'        | '12'          | '840'   | '1/1/2024' | ''       |
			| "1C:ERP. Corporate performance management"                                   | '0'              | '0'           | '0'     | '2/5/2024' | 'String4' | '0'               | '0'           | '0'     | ''           | ''        | '0'            | '0'           | '0'     | ''           | ''        | '0'          | '0'           | '0'     | '2/5/2024' | ''       |
			| "3C:Enterprise 8 CORP. Client license for 100 users" | '0'              | '2'           | '0'     | ''           | ''        | '100'             | '4'           | '400'   | '1/1/2024' | "Line1" | '150'          | '6'           | '900'   | '1/1/2024' | "Line1" | '250'        | '12'          | '1,300' | '1/1/2024' | ''       |

	* Закрываем сводную таблицу не сохраняя
		Тогда открылось окно '$WindowTitle$'
		И Я закрываю окно '$WindowTitle$'
		Тогда открылось окно "1C:Enterprise"
		И я нажимаю на кнопку с именем 'Button1'		

Сценарий: 02.08 Факторный анализ

	И Я октрываю сводную таблицу отчета с именем "VA - Recalculation in context"

	// ДОДЕЛАТЬ: Не работает, если есть аналитики вида отчета

Сценарий: 02.09 Копируем все данные отчетного периода

	И Я октрываю сводную таблицу отчета с именем "VA - Recalculation in context"

	* Копируем данные
		И я нажимаю на кнопку с именем 'DataCopying'
		Тогда открылось окно "Copy values indicators отчетов"
		И из выпадающего списка с именем 'DataProcessorRunMode' я выбираю точное значение "All data for reporting period"
		И я нажимаю кнопку выбора у поля с именем 'UAboutPИсточник'
		Тогда открылось окно "Reporting period management"
		И в таблице 'List' я перехожу к строке:
			| "Scenario"               | "Start period"  | "Period окончание" | "Frequency" | "Regulation"               |
			| "VA - Main scenario" | "January 2024" | "March 2024"     | "Month"         | "VA - Main regulations" |
		И я нажимаю на кнопку с именем 'FormSelect'
		Тогда открылось окно "Copy values indicators отчетов"
		И в таблице 'AdvancedSettingFilter' я изменяю флаг с именем 'AdvancedSettingFilterIsBeingEdited'
		И в таблице 'AdvancedSettingFilter' я завершаю редактирование строки
		И в таблице 'AdvancedSettingFilter' я активизирую поле с именем 'FilterSource'
		И в таблице 'AdvancedSettingFilter' я выбираю текущую строку
		Тогда открылось окно "Dimension content filter"
		И в таблице 'SKDSelection' я перехожу к строке:
			| "Comparison type" | "Use" | "Left value"        | "Display mode" |
			| "Equal to"         | "Yes"            | "Companies" | "Quick access"    |
		И в таблице 'SKDSelection' я активизирую поле с именем 'SKDSelectionRightValue'
		И в таблице 'SKDSelection' я выбираю текущую строку
		И в таблице 'SKDSelection' из выпадающего списка с именем 'SKDSelectionRightValue' я выбираю по строке "Mercury LLC"
		И в таблице 'SKDSelection' я завершаю редактирование строки
		И я нажимаю на кнопку с именем 'Apply'
		Тогда открылось окно "Copy values indicators отчетов"
		И я нажимаю кнопку выбора у поля с именем 'UAboutPPриемник'
		Тогда открылось окно "Reporting period management"
		И в таблице 'List' я перехожу к строке:
			| "Scenario"                     | "Start period"  | "Period окончание" | "Frequency" | "Regulation"               |
			| "VA - Script for indexing" | "January 2024" | "March 2024"     | "Month"         | "VA - Main regulations" |
		И я нажимаю на кнопку с именем 'FormSelect'
		Тогда открылось окно "Copy values indicators отчетов"
		И в таблице 'AdvancedSettingFilterDestination' я выбираю текущую строку
		И в меню формы я выбираю 'Фиксированное значение'
		И я выбираю организацию "Venus LLC"
		И я устанавливаю флаг с именем 'TransferReportsInstances'
		И я нажимаю на кнопку с именем 'Execute'
		Затем я жду, что в сообщениях пользователю будет подстрока "Copy successful" в течение 60 секунд
		И я очищаю окно сообщений пользователю
		И я нажимаю на кнопку с именем 'Execute'
		Затем я жду, что в сообщениях пользователю будет подстрока "Copy successful" в течение 60 секунд		
		И Я закрываю окно "Copy values indicators отчетов"

	И Я устанавливаю отбор сводной таблицы 'Item_Scenario' со значением "VA - Script for indexing"
	И Я устанавливаю отбор сводной таблицы 'Organization' со значением "Venus LLC"				

	* Сверяем результат
		Тогда табличный документ 'SpreadsheetFieldTemlate' равен:
			| "VA - Recalculation in context (pivot table)"                    | "January 2024" | ''            | ''      | ''           | ''        | "February 2024" | ''            | ''      | ''           | ''        | "March 2024" | ''            | ''       | ''           | ''        | "TOTAL"      | ''            | ''       | ''           | ''       |
			| "VA - Recalculation in context (pivot table)"                    | "Count"     | "Coefficient" | "Total"  | "Date"       | "Line"  | "Count"      | "Coefficient" | "Total"  | "Date"       | "Line"  | "Count"   | "Coefficient" | "Total"   | "Date"       | "Line"  | "Count" | "Coefficient" | "Total"   | "Date"       | "Line" |
			| "Total"                                                           | '150'            | '10'          | '1,500' | '1/1/2024' | ''        | '300'             | '20'          | '6,000' | '1/1/2024' | ''        | '450'          | '30'          | '13,500' | '1/1/2024' | ''        | '900'        | '60'          | '21,000' | '1/1/2024' | ''       |
			| "Goods"                                                         | '150'            | '10'          | '300'   | '1/1/2024' | ''        | '300'             | '20'          | '1,200' | '1/1/2024' | ''        | '450'          | '30'          | '2,700'  | '1/1/2024' | ''        | '900'        | '60'          | '4,200'  | '1/1/2024' | ''       |
			| "5C:Corporate performance management"                                      | '10'             | '2'           | '20'    | '1/1/2024' | "Line1" | '20'              | '4'           | '80'    | '1/1/2024' | "Line1" | '30'           | '6'           | '180'    | '1/1/2024' | "Line1" | '60'         | '12'          | '280'    | '1/1/2024' | ''       |
			| "2C:Corporation"                                                  | '20'             | '2'           | '40'    | '1/1/2024' | "Line1" | '40'              | '4'           | '160'   | '1/1/2024' | "Line1" | '60'           | '6'           | '360'    | '1/1/2024' | "Line1" | '120'        | '12'          | '560'    | '1/1/2024' | ''       |
			| "4C:Enterprise 8.3 CORP. Server License (x86-64)"           | '30'             | '2'           | '60'    | '1/1/2024' | "Line1" | '60'              | '4'           | '240'   | '1/1/2024' | "Line1" | '90'           | '6'           | '540'    | '1/1/2024' | "Line1" | '180'        | '12'          | '840'    | '1/1/2024' | ''       |
			| "1C:ERP. Corporate performance management"                                   | '40'             | '2'           | '80'    | '1/1/2024' | "Line1" | '80'              | '4'           | '320'   | '1/1/2024' | "Line1" | '120'          | '6'           | '720'    | '1/1/2024' | "Line1" | '240'        | '12'          | '1,120'  | '1/1/2024' | ''       |
			| "3C:Enterprise 8 CORP. Client license for 100 users" | '50'             | '2'           | '100'   | '1/1/2024' | "Line1" | '100'             | '4'           | '400'   | '1/1/2024' | "Line1" | '150'          | '6'           | '900'    | '1/1/2024' | "Line1" | '300'        | '12'          | '1,400'  | '1/1/2024' | ''       |
									
Сценарий: 02.10 Копируем данные по показателям

	И Я октрываю сводную таблицу отчета с именем "VA - Recalculation in context"		

	* Копируем данные
		И я нажимаю на кнопку с именем 'DataCopying'

		Тогда открылось окно "Copy values indicators отчетов"
		И из выпадающего списка с именем 'ScenarioDestination' я выбираю по строке "VA - Script for indexing"
		И в таблице 'AdvancedSettingFilter' я перехожу к строке:
			| "Dimension"   | "Filter value" | "Being edited" |
			| "Companies" | "<Without filter>"    | "No"           |
		И в таблице 'AdvancedSettingFilter' я изменяю флаг с именем 'AdvancedSettingFilterIsBeingEdited'
		И в таблице 'AdvancedSettingFilter' я завершаю редактирование строки
		И в таблице 'AdvancedSettingFilter' я активизирую поле с именем 'FilterSource'
		И в таблице 'AdvancedSettingFilter' я выбираю текущую строку
		Тогда открылось окно "Dimension content filter"
		И в таблице 'SKDSelection' я перехожу к строке:
			| "Comparison type" | "Use" | "Left value"        | "Display mode" |
			| "Equal to"         | "Yes"            | "Companies" | "Quick access"    |
		И в таблице 'SKDSelection' я активизирую поле с именем 'SKDSelectionRightValue'
		И в таблице 'SKDSelection' я выбираю текущую строку
		И в таблице 'SKDSelection' из выпадающего списка с именем 'SKDSelectionRightValue' я выбираю по строке "Venus LLC"
		И в таблице 'SKDSelection' я завершаю редактирование строки
		И я нажимаю на кнопку с именем 'Apply'
		
		Тогда открылось окно "Copy values indicators отчетов"
		И в таблице 'AdvancedSettingFilterDestination' я выбираю текущую строку
		И в меню формы я выбираю "Fixed value"
		И Я выбираю организацию "Mercury LLC"
		Тогда открылось окно "Copy values indicators отчетов"

		И в таблице 'AdvancedSettingFilter' я перехожу к строке:
			| "Dimension"  | "Filter value" | "Being edited" |
			| "Cash flow items" | "<Without filter>"    | "No"           |
		И в таблице 'AdvancedSettingFilter' я активизирую поле с именем 'AdvancedSettingFilterIsBeingEdited'
		И в таблице 'AdvancedSettingFilter' я изменяю флаг с именем 'AdvancedSettingFilterIsBeingEdited'
		И в таблице 'AdvancedSettingFilter' я завершаю редактирование строки
		И в таблице 'AdvancedSettingFilter' я активизирую поле с именем 'FilterSource'
		И в таблице 'AdvancedSettingFilter' я выбираю текущую строку
		Тогда открылось окно "Dimension content filter"
		И в таблице 'SKDSelection' я перехожу к строке:
			| "Comparison type" | "Use" | "Left value"       | "Display mode" |
			| "Equal to"         | "Yes"            | "Cash flow items" | "Quick access"    |
		И в таблице 'SKDSelection' я активизирую поле с именем 'SKDSelectionRightValue'
		И в таблице 'SKDSelection' я выбираю текущую строку
		И в таблице 'SKDSelection' из выпадающего списка с именем 'SKDSelectionRightValue' я выбираю по строке "3Software sale"
		И в таблице 'SKDSelection' я завершаю редактирование строки
		И я нажимаю на кнопку с именем 'Apply'
		
		Тогда открылось окно "Copy values indicators отчетов"
		И в таблице 'AdvancedSettingFilterDestination' я выбираю текущую строку
		И в меню формы я выбираю "By source values"

		Тогда открылось окно "Copy values indicators отчетов"
		И в таблице 'AdvancedSettingFilter' я перехожу к строке:
			| "Dimension"    | "Filter value" | "Being edited" |
			| "Product range" | "<Without filter>"    | "No"           |
		И в таблице 'AdvancedSettingFilter' я активизирую поле с именем 'AdvancedSettingFilterIsBeingEdited'
		И в таблице 'AdvancedSettingFilter' я изменяю флаг с именем 'AdvancedSettingFilterIsBeingEdited'
		И в таблице 'AdvancedSettingFilter' я завершаю редактирование строки
		И в таблице 'AdvancedSettingFilter' я активизирую поле с именем 'FilterSource'
		И в таблице 'AdvancedSettingFilter' я выбираю текущую строку
		Тогда открылось окно "Dimension content filter"
		И в таблице 'SKDSelection' я перехожу к строке:
			| "Comparison type" | "Use" | "Left value"         | "Display mode" |
			| "Equal to"         | "Yes"            | "Product range" | "Quick access"    |
		И в таблице 'SKDSelection' я активизирую поле с именем 'SKDSelectionComparisonType'
		И в таблице 'SKDSelection' я выбираю текущую строку
		И в таблице 'SKDSelection' из выпадающего списка с именем 'SKDSelectionComparisonType' я выбираю точное значение "Not equal"
		И в таблице 'SKDSelection' я активизирую поле с именем 'SKDSelectionRightValue'
		И в таблице 'SKDSelection' из выпадающего списка с именем 'SKDSelectionRightValue' я выбираю по строке "5C:Corporate performance management"
		И в таблице 'SKDSelection' я завершаю редактирование строки
		И я нажимаю на кнопку с именем 'Apply'
		
		Тогда открылось окно "Copy values indicators отчетов"
		И я нажимаю на кнопку с именем 'Execute'

	* Должен появиться лог с ошибкой
		И я жду открытия окна "Protocol" в течение 60 секунд
		Тогда табличный документ 'SpreadsheetDocumentField' равен:
			| "Errors"                                                                                                                                                                                              |
			| "Cannot save indicator values. Block to change by parameters is set:\n	Scenario: \"VA - Script for indexing\",\n	Company: \"Mercury LLC\",\n	Period: \"January 2024\"" |
		И Я закрываю окно "Protocol"

	* Копируем со сдвигом периода
		Когда открылось окно "Copy values indicators отчетов"
		И я нажимаю на кнопку с именем 'ButtonChangePeriodSource'
		Тогда открылось окно "Select period"
		И в поле с именем 'DateBegin' я ввожу текст '1/1/2024'
		И я перехожу к следующему реквизиту
		И в поле с именем 'DateEnd' я ввожу текст '1/31/2024'
		И я нажимаю на кнопку с именем 'select'
		Тогда открылось окно "Copy values indicators отчетов"
		И я нажимаю на кнопку с именем 'ButtonChangePeriodDestination'
		Тогда открылось окно "Select period"
		И в поле с именем 'DateBegin' я ввожу текст '2/1/2024'
		И я перехожу к следующему реквизиту
		И в поле с именем 'DateEnd' я ввожу текст '2/28/2024'
		И я нажимаю на кнопку с именем 'select'
		Тогда открылось окно "Copy values indicators отчетов"
		И я нажимаю на кнопку с именем 'Execute'
		Затем я жду, что в сообщениях пользователю будет подстрока "Copy successful" в течение 60 секунд
		И я очищаю окно сообщений пользователю
		И я нажимаю на кнопку с именем 'Execute'
		Затем я жду, что в сообщениях пользователю будет подстрока "Copy successful" в течение 60 секунд		
		И Я закрываю окно "Copy values indicators отчетов"

	* Проверяем результат
		И Я устанавливаю отбор сводной таблицы 'Item_Organization' со значением "Mercury LLC"	
		Тогда табличный документ 'SpreadsheetFieldTemlate' равен:
			| "VA - Recalculation in context (pivot table)"                    | "January 2024" | ''            | ''     | ''     | ''       | "February 2024" | ''            | ''      | ''           | ''        | "March 2024" | ''            | ''       | ''           | ''        | "TOTAL"      | ''            | ''       | ''           | ''       |
			| "VA - Recalculation in context (pivot table)"                    | "Count"     | "Coefficient" | "Total" | "Date" | "Line" | "Count"      | "Coefficient" | "Total"  | "Date"       | "Line"  | "Count"   | "Coefficient" | "Total"   | "Date"       | "Line"  | "Count" | "Coefficient" | "Total"   | "Date"       | "Line" |
			| "Total"                                                           | '0'              | '0'           | '0'    | ''     | ''       | '150'             | '10'          | '1,500' | '1/1/2024' | ''        | '450'          | '30'          | '13,500' | '1/1/2024' | ''        | '600'        | '40'          | '15,000' | '1/1/2024' | ''       |
			| "Goods"                                                         | '0'              | '0'           | '0'    | ''     | ''       | '140'             | '8'           | '280'   | '1/1/2024' | ''        | '420'          | '24'          | '2,520'  | '1/1/2024' | ''        | '560'        | '32'          | '2,800'  | '1/1/2024' | ''       |
			| "2C:Corporation"                                                  | '0'              | '0'           | '0'    | ''     | ''       | '20'              | '2'           | '40'    | '1/1/2024' | "Line1" | '60'           | '6'           | '360'    | '1/1/2024' | "Line1" | '80'         | '8'           | '400'    | '1/1/2024' | ''       |
			| "4C:Enterprise 8.3 CORP. Server License (x86-64)"           | '0'              | '0'           | '0'    | ''     | ''       | '30'              | '2'           | '60'    | '1/1/2024' | "Line1" | '90'           | '6'           | '540'    | '1/1/2024' | "Line1" | '120'        | '8'           | '600'    | '1/1/2024' | ''       |
			| "1C:ERP. Corporate performance management"                                   | '0'              | '0'           | '0'    | ''     | ''       | '40'              | '2'           | '80'    | '1/1/2024' | "Line1" | '120'          | '6'           | '720'    | '1/1/2024' | "Line1" | '160'        | '8'           | '800'    | '1/1/2024' | ''       |
			| "3C:Enterprise 8 CORP. Client license for 100 users" | '0'              | '0'           | '0'    | ''     | ''       | '50'              | '2'           | '100'   | '1/1/2024' | "Line1" | '150'          | '6'           | '900'    | '1/1/2024' | "Line1" | '200'        | '8'           | '1,000'  | '1/1/2024' | ''       |
				
Сценарий: 02.11 Проверяем сводную таблицу

	И Я октрываю сводную таблицу отчета с именем "VA - Recalculation in context"

	* Меняем вид таблицы
		Когда открылось окно '$WindowTitle$'
		И я нажимаю на гиперссылку с именем 'FilterHeading'
		И из выпадающего списка с именем 'DisplayCurrency' я выбираю точное значение "USD"
		И из выпадающего списка с именем 'Divisor' я выбираю точное значение "thousands"
		И я перехожу к следующему реквизиту	
		И в поле с именем 'Accuracy' я ввожу текст '5'
		И я перехожу к следующему реквизиту
		И я нажимаю на кнопку с именем 'ShowPeriodsSettings'
		И я изменяю флаг с именем 'ShouldShowTotalQuarter'
		И я нажимаю на кнопку с именем 'FormApply'
		Тогда открылось окно '$WindowTitle$'
		И я нажимаю на кнопку с именем 'ShowTableSettingsByAxes'
		Тогда открылось окно "Set up field location"
		И я нажимаю на кнопку с именем 'DimensionsLayoutOption'
		И в меню формы я выбираю "Adjacent dimensions"
		И я нажимаю на кнопку с именем 'ButtonApply'
		Тогда открылось окно '$WindowTitle$'
		И я нажимаю на кнопку с именем 'ShowAdditionalFilters'
		И в таблице 'FiltersSettings' я перехожу к строке:
			| "Comparison type" | "Use" | "Field"         |
			| "Equal to"         | "No"          | "Product range" |
		И в таблице 'FiltersSettings' я устанавливаю флаг с именем 'FiltersSettingsUse'
		И в таблице 'FiltersSettings' я активизирую поле с именем 'FiltersSettingsComparisonType'
		И в таблице 'FiltersSettings' я выбираю текущую строку
		И в таблице 'FiltersSettings' из выпадающего списка с именем 'FiltersSettingsComparisonType' я выбираю точное значение "In list"
		И в таблице 'FiltersSettings' я активизирую поле с именем 'FiltersSettingsFilterValue'
		И в таблице 'FiltersSettings' я нажимаю кнопку выбора у реквизита с именем 'FiltersSettingsFilterValue'
		Тогда открылось окно "Value list"
		И я нажимаю на кнопку с именем 'Add'
		И в таблице 'ValueList' из выпадающего списка с именем 'value' я выбираю точное значение "1C:ERP. Corporate performance management"
		И я нажимаю на кнопку с именем 'Add'
		И в таблице 'ValueList' из выпадающего списка с именем 'value' я выбираю точное значение "5C:Corporate performance management"
		И я нажимаю на кнопку с именем 'OK'
		Тогда открылось окно '$WindowTitle$'
		И в таблице 'FiltersSettings' я завершаю редактирование строки
		И я нажимаю на кнопку с именем 'UpdateTabData'
		И я жду открытия формы "Pivot table: *" в течение 20 секунд
		
	* Сравниваем результат
		Тогда табличный документ 'SpreadsheetFieldTemlate' равен по шаблону:
			| "VA - Recalculation in context (pivot table)" | "Product range"                 | "January 2024" | ''            | ''     | ''     | ''       | "February 2024" | ''            | ''        | ''           | ''        | "March 2024" | ''            | ''        | ''           | ''        | "1 quarter of 2024" | ''            | ''        | ''           | ''        | "TOTAL"      | ''            | ''        | ''           | ''       |
			| "VA - Recalculation in context (pivot table)" | ''                             | "Count"     | "Coefficient" | "Total" | "Date" | "Line" | "Count"      | "Coefficient" | "Total"    | "Date"       | "Line"  | "Count"   | "Coefficient" | "Total"    | "Date"       | "Line"  | "Count"        | "Coefficient" | "Total"    | "Date"       | "Line"  | "Count" | "Coefficient" | "Total"    | "Date"       | "Line" |
			| "Total"                                        | ''                             | '0'              | '0'           | '0'    | ''     | ''       | '0'               | '0'           | '0'       | ''           | ''        | '0'            | '0'           | '0'       | ''           | ''        | '0'                 | '0'           | '0'       | ''           | ''        | '0'          | '0'           | '0'       | ''           | ''       |
			| "Goods"                                      | ''                             | '0'              | '0'           | '0'    | ''     | ''       | '0.0005*'         | '0.00200'     | '0.0010*' | '1/1/2024' | ''        | '0.0016*'      | '0.00600'     | '0.0096*' | '1/1/2024' | ''        | '0.0021*'           | '0.00800'     | '0.0107*' | '1/1/2024' | ''        | '0.0021*'    | '0.00800'     | '0.0107*' | '1/1/2024' | ''       |
			| ''                                            | "1C:ERP. Corporate performance management" | '0'              | '0'           | '0'    | ''     | ''       | '0.0005*'         | '0.00200'     | '0.0010*' | '1/1/2024' | "Line1" | '0.0016*'      | '0.00600'     | '0.0096*' | '1/1/2024' | "Line1" | '0.0021*'           | '0.00800'     | '0.0107*' | '1/1/2024' | "Line1" | '0.0021*'    | '0.00800'     | '0.0107*' | '1/1/2024' | ''       |

Сценарий: 02.12 Индексируем по сценарию

	* Открываем сводную таблицу
		И Я октрываю сводную таблицу отчета с именем "VA - Recalculation in context"
		И Я устанавливаю отбор сводной таблицы 'DisplayCurrency' со значением 'RUB'
		И Я устанавливаю отбор сводной таблицы 'Item_Scenario' со значением "VA - Main scenario"

	* Индексируем
		Когда открылось окно '$WindowTitle$'
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R4C2:R10C11'
		И я нажимаю на кнопку с именем 'ChangeIndicatorsIndexing'
		Тогда открылось окно "Change values"
		И из выпадающего списка с именем 'Deflator' я выбираю по строке "VA - Script for indexing"
		И я нажимаю на кнопку с именем 'Apply'
	* Отменяем действие
		Тогда открылось окно '$WindowTitle$'
		И я нажимаю на кнопку с именем 'CancelAction'
	* Индексируем
		И я нажимаю на кнопку с именем 'ChangeIndicatorsIndexing'
		Тогда открылось окно "Change values"
		И из выпадающего списка с именем 'Deflator' я выбираю по строке "VA - Script for indexing"
		И я нажимаю на кнопку с именем 'Apply'

	* Индексируем нечисловые
		Когда открылось окно '$WindowTitle$'
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R7C10:R9C11'
		И я нажимаю на кнопку с именем 'ChangeIndicatorsIndexing'
		Тогда открылось окно "Change values"
		И из выпадающего списка с именем 'Deflator' я выбираю по строке "VA - Script for indexing"
		И я нажимаю на кнопку с именем 'Apply'				

	* Проверяем результат
		Когда открылось окно '$WindowTitle$'
		Тогда табличный документ 'SpreadsheetFieldTemlate' равен:
			| "VA - Recalculation in context (pivot table)"                    | "January 2024" | ''            | ''      | ''           | ''        | "February 2024" | ''            | ''        | ''           | ''        | "March 2024" | ''            | ''       | ''           | ''        | "TOTAL"      | ''            | ''        | ''           | ''       |
			| "VA - Recalculation in context (pivot table)"                    | "Count"     | "Coefficient" | "Total"  | "Date"       | "Line"  | "Count"      | "Coefficient" | "Total"    | "Date"       | "Line"  | "Count"   | "Coefficient" | "Total"   | "Date"       | "Line"  | "Count" | "Coefficient" | "Total"    | "Date"       | "Line" |
			| "Total"                                                           | '150'            | '10'          | '1,500' | '1/1/2024' | ''        | '10,820'          | '36'          | '389,520' | '1/1/2024' | ''        | '450'          | '30'          | '13,500' | '1/1/2024' | ''        | '11,420'     | '76'          | '404,520' | '1/1/2024' | ''       |
			| "Goods"                                                         | '150'            | '10'          | '300'   | '1/1/2024' | ''        | '10,820'          | '36'          | '86,480'  | '1/1/2024' | ''        | '450'          | '30'          | '2,700'  | '1/1/2024' | ''        | '11,420'     | '76'          | '89,480'  | '1/1/2024' | ''       |
			| "5C:Corporate performance management"                                      | '10'             | '2'           | '20'    | '1/1/2024' | "Line1" | '20'              | '4'           | '80'      | '1/1/2024' | "Line1" | '30'           | '6'           | '180'    | '1/1/2024' | "Line1" | '60'         | '12'          | '280'     | '1/1/2024' | ''       |
			| "2C:Corporation"                                                  | '20'             | '2'           | '40'    | '1/1/2024' | "Line1" | '800'             | '8'           | '6,400'   | '1/1/2024' | "Line1" | '60'           | '6'           | '360'    | '1/1/2024' | "Line1" | '880'        | '16'          | '6,800'   | '1/1/2024' | ''       |
			| "4C:Enterprise 8.3 CORP. Server License (x86-64)"           | '30'             | '2'           | '60'    | '1/1/2024' | "Line1" | '1,800'           | '8'           | '14,400'  | '1/1/2024' | "Line1" | '90'           | '6'           | '540'    | '1/1/2024' | "Line1" | '1,920'      | '16'          | '15,000'  | '1/1/2024' | ''       |
			| "1C:ERP. Corporate performance management"                                   | '40'             | '2'           | '80'    | '1/1/2024' | "Line1" | '3,200'           | '8'           | '25,600'  | '1/1/2024' | "Line1" | '120'          | '6'           | '720'    | '1/1/2024' | "Line1" | '3,360'      | '16'          | '26,400'  | '1/1/2024' | ''       |
			| "3C:Enterprise 8 CORP. Client license for 100 users" | '50'             | '2'           | '100'   | '1/1/2024' | "Line1" | '5,000'           | '8'           | '40,000'  | '1/1/2024' | "Line1" | '150'          | '6'           | '900'    | '1/1/2024' | "Line1" | '5,200'      | '16'          | '41,000'  | '1/1/2024' | ''       |
		
	* Закрываем не сохраняя
		Когда открылось окно '$WindowTitle$'
		И Я закрываю окно '$WindowTitle$'
		Тогда открылось окно "1C:Enterprise"
		И я нажимаю на кнопку с именем 'Button1'

Сценарий: 02.13 Обратное распределение (равномерное)
	
	* Открываем сводную таблицу
		И Я октрываю сводную таблицу отчета с именем "VA - Recalculation in context"

	* Переходим в режим обратного распределния
		Когда открылось окно '$WindowTitle$'
		И я нажимаю на гиперссылку с именем 'FilterHeading'
		И из выпадающего списка с именем 'WorkMode' я выбираю точное значение "Reverse allocation (equally)"
		Тогда элемент формы с именем 'WorkMode' стал равен "Reverse allocation (equally)"				
		И я нажимаю на кнопку с именем 'UpdateTabData1'
		И я жду открытия формы "Pivot table: *" в течение 30 секунд

	* Распределяем показатели по одному периоду
		* Количество
			Когда открылось окно '$WindowTitle$'
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R7C2'
			И я выбираю пункт контекстного меню с именем 'SpreadsheetFieldTemlateContextMenuLockCellForDistribution' на элементе формы с именем 'SpreadsheetFieldTemlate'
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R5C2'
			И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
			И в табличный документ 'SpreadsheetFieldTemlate' я ввожу текст '1,000.00000'
		* Коэффициент
			Когда открылось окно '$WindowTitle$'
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R6C3:R10C3'
			И я выбираю пункт контекстного меню с именем 'SpreadsheetFieldTemlateContextMenuLockCellForDistribution' на элементе формы с именем 'SpreadsheetFieldTemlate'
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R5C3'
			И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
			И в табличный документ 'SpreadsheetFieldTemlate' я ввожу текст '100.00000'
			Когда открылось окно '$WindowTitle$'
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R7C3'
			И я выбираю пункт контекстного меню с именем 'SpreadsheetFieldTemlateContextMenuUnlockCellForDistribution' на элементе формы с именем 'SpreadsheetFieldTemlate'
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R5C3'
			И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
			И в табличный документ 'SpreadsheetFieldTemlate' я ввожу текст '100.00000'
		* Итог
			Когда открылось окно'$WindowTitle$'
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R5C4'
			И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
			И в табличный документ 'SpreadsheetFieldTemlate' я ввожу текст '100.00000'
		* Дата
			Когда открылось окно '$WindowTitle$'
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R5C5'
			И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
			И в табличный документ 'SpreadsheetFieldTemlate' я ввожу текст '100.00000'

	* Сравниваем результат
		Когда открылось окно '$WindowTitle$'
		Тогда табличный документ 'SpreadsheetFieldTemlate' равен:
			| "VA - Recalculation in context (pivot table)"                    | "January 2024" | ''            | ''        | ''           | ''        | "February 2024" | ''            | ''      | ''           | ''        | "March 2024" | ''            | ''       | ''           | ''        | "TOTAL"      | ''            | ''        | ''           | ''       |
			| "VA - Recalculation in context (pivot table)"                    | "Count"     | "Coefficient" | "Total"    | "Date"       | "Line"  | "Count"      | "Coefficient" | "Total"  | "Date"       | "Line"  | "Count"   | "Coefficient" | "Total"   | "Date"       | "Line"  | "Count" | "Coefficient" | "Total"    | "Date"       | "Line" |
			| "Total"                                                           | '1,000'          | '100'         | '100,000' | '1/1/2024' | ''        | '300'             | '20'          | '6,000' | '1/1/2024' | ''        | '450'          | '30'          | '13,500' | '1/1/2024' | ''        | '1,750'      | '150'         | '119,500' | '1/1/2024' | ''       |
			| "Goods"                                                         | '1,000'          | '100'         | '3,800'   | '1/1/2024' | ''        | '300'             | '20'          | '1,200' | '1/1/2024' | ''        | '450'          | '30'          | '2,700'  | '1/1/2024' | ''        | '1,750'      | '150'         | '7,700'   | '1/1/2024' | ''       |
			| "5C:Corporate performance management"                                      | '245'            | '2'           | '490'     | '1/1/2024' | "Line1" | '20'              | '4'           | '80'    | '1/1/2024' | "Line1" | '30'           | '6'           | '180'    | '1/1/2024' | "Line1" | '295'        | '12'          | '750'     | '1/1/2024' | ''       |
			| "2C:Corporation"                                                  | '20'             | '92'          | '1,840'   | '1/1/2024' | "Line1" | '40'              | '4'           | '160'   | '1/1/2024' | "Line1" | '60'           | '6'           | '360'    | '1/1/2024' | "Line1" | '120'        | '102'         | '2,360'   | '1/1/2024' | ''       |
			| "4C:Enterprise 8.3 CORP. Server License (x86-64)"           | '245'            | '2'           | '490'     | '1/1/2024' | "Line1" | '60'              | '4'           | '240'   | '1/1/2024' | "Line1" | '90'           | '6'           | '540'    | '1/1/2024' | "Line1" | '395'        | '12'          | '1,270'   | '1/1/2024' | ''       |
			| "1C:ERP. Corporate performance management"                                   | '245'            | '2'           | '490'     | '1/1/2024' | "Line1" | '80'              | '4'           | '320'   | '1/1/2024' | "Line1" | '120'          | '6'           | '720'    | '1/1/2024' | "Line1" | '445'        | '12'          | '1,530'   | '1/1/2024' | ''       |
			| "3C:Enterprise 8 CORP. Client license for 100 users" | '245'            | '2'           | '490'     | '1/1/2024' | "Line1" | '100'             | '4'           | '400'   | '1/1/2024' | "Line1" | '150'          | '6'           | '900'    | '1/1/2024' | "Line1" | '495'        | '12'          | '1,790'   | '1/1/2024' | ''       |
							
	* Распределение по периодам
		Когда открылось окно '$WindowTitle$'
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R7C2'
		И я выбираю пункт контекстного меню с именем 'SpreadsheetFieldTemlateContextMenuUnlockCellForDistribution' на элементе формы с именем 'SpreadsheetFieldTemlate'
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R7C3'
		И я выбираю пункт контекстного меню с именем 'SpreadsheetFieldTemlateContextMenuLockCellForDistribution' на элементе формы с именем 'SpreadsheetFieldTemlate'
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R5C17'
		И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
		И в табличный документ 'SpreadsheetFieldTemlate' я ввожу текст '15,000.00000'
		Когда открылось окно '$WindowTitle$'
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R6C18'
		И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
		И в табличный документ 'SpreadsheetFieldTemlate' я ввожу текст '42.00000'

	* Сравниваем результат
		Когда открылось окно '$WindowTitle$'
		Тогда табличный документ 'SpreadsheetFieldTemlate' равен:
			| "VA - Recalculation in context (pivot table)"                    | "January 2024" | ''            | ''        | ''           | ''        | "February 2024" | ''            | ''        | ''           | ''        | "March 2024" | ''            | ''        | ''           | ''        | "TOTAL"      | ''            | ''        | ''           | ''       |
			| "VA - Recalculation in context (pivot table)"                    | "Count"     | "Coefficient" | "Total"    | "Date"       | "Line"  | "Count"      | "Coefficient" | "Total"    | "Date"       | "Line"  | "Count"   | "Coefficient" | "Total"    | "Date"       | "Line"  | "Count" | "Coefficient" | "Total"    | "Date"       | "Line" |
			| "Total"                                                           | '5,000'          | '100'         | '500,000' | '1/1/2024' | ''        | '5,000'           | '36'          | '180,000' | '1/1/2024' | ''        | '5,000'        | '44'          | '220,000' | '1/1/2024' | ''        | '15,000'     | '180'         | '900,000' | '1/1/2024' | ''       |
			| "Goods"                                                         | '5,000'          | '100'         | '100,000' | '1/1/2024' | ''        | '5,000'           | '36'          | '36,000'  | '1/1/2024' | ''        | '5,000'        | '44'          | '44,000'  | '1/1/2024' | ''        | '15,000'     | '180'         | '180,000' | '1/1/2024' | ''       |
			| "5C:Corporate performance management"                                      | '1,000'          | '2'           | '2,000'   | '1/1/2024' | "Line1" | '1,000'           | '20'          | '20,000'  | '1/1/2024' | "Line1" | '1,000'        | '20'          | '20,000'  | '1/1/2024' | "Line1" | '3,000'      | '42'          | '42,000'  | '1/1/2024' | ''       |
			| "2C:Corporation"                                                  | '1,000'          | '92'          | '92,000'  | '1/1/2024' | "Line1" | '1,000'           | '4'           | '4,000'   | '1/1/2024' | "Line1" | '1,000'        | '6'           | '6,000'   | '1/1/2024' | "Line1" | '3,000'      | '102'         | '102,000' | '1/1/2024' | ''       |
			| "4C:Enterprise 8.3 CORP. Server License (x86-64)"           | '1,000'          | '2'           | '2,000'   | '1/1/2024' | "Line1" | '1,000'           | '4'           | '4,000'   | '1/1/2024' | "Line1" | '1,000'        | '6'           | '6,000'   | '1/1/2024' | "Line1" | '3,000'      | '12'          | '12,000'  | '1/1/2024' | ''       |
			| "1C:ERP. Corporate performance management"                                   | '1,000'          | '2'           | '2,000'   | '1/1/2024' | "Line1" | '1,000'           | '4'           | '4,000'   | '1/1/2024' | "Line1" | '1,000'        | '6'           | '6,000'   | '1/1/2024' | "Line1" | '3,000'      | '12'          | '12,000'  | '1/1/2024' | ''       |
			| "3C:Enterprise 8 CORP. Client license for 100 users" | '1,000'          | '2'           | '2,000'   | '1/1/2024' | "Line1" | '1,000'           | '4'           | '4,000'   | '1/1/2024' | "Line1" | '1,000'        | '6'           | '6,000'   | '1/1/2024' | "Line1" | '3,000'      | '12'          | '12,000'  | '1/1/2024' | ''       |
				
	* Снова распределяем по периодам
		* Коэффициент
			Когда открылось окно '$WindowTitle$'
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R7C18'
			И я выбираю пункт контекстного меню с именем 'SpreadsheetFieldTemlateContextMenuLockCellForDistribution' на элементе формы с именем 'SpreadsheetFieldTemlate'
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R5C18'
			И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
			И в табличный документ 'SpreadsheetFieldTemlate' я ввожу текст '2,100.00000'
		* Итог
			Когда открылось окно '$WindowTitle$'
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R5C19'
			И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
			И в табличный документ 'SpreadsheetFieldTemlate' я ввожу текст '100.00000'
		* Дата
			Когда открылось окно '$WindowTitle$'
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R5C20'
			И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
			И в табличный документ 'SpreadsheetFieldTemlate' я ввожу текст '100.00000'
		* Строка
			Когда открылось окно '$WindowTitle$'
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'C17'
			И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
			И в табличный документ 'SpreadsheetFieldTemlate' я ввожу текст '100.00000'
		* Столбец
			Когда открылось окно '$WindowTitle$'
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R5'
			И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
			И в табличный документ 'SpreadsheetFieldTemlate' я ввожу текст '100.00000'	

	* Сравниваем результат
		Когда открылось окно '$WindowTitle$'
		Тогда табличный документ 'SpreadsheetFieldTemlate' равен:
			| "VA - Recalculation in context (pivot table)"                    | "January 2024" | ''            | ''        | ''           | ''        | "February 2024" | ''            | ''          | ''           | ''        | "March 2024" | ''            | ''          | ''           | ''        | "TOTAL"      | ''            | ''           | ''           | ''       |
			| "VA - Recalculation in context (pivot table)"                    | "Count"     | "Coefficient" | "Total"    | "Date"       | "Line"  | "Count"      | "Coefficient" | "Total"      | "Date"       | "Line"  | "Count"   | "Coefficient" | "Total"      | "Date"       | "Line"  | "Count" | "Coefficient" | "Total"       | "Date"       | "Line" |
			| "Total"                                                           | '5,000'          | '100'         | '500,000' | '1/1/2024' | ''        | '5,000'           | '1,000'       | '5,000,000' | '1/1/2024' | ''        | '5,000'        | '1,000'       | '5,000,000' | '1/1/2024' | ''        | '15,000'     | '2,100'       | '10,500,000' | '1/1/2024' | ''       |
			| "Goods"                                                         | '5,000'          | '100'         | '100,000' | '1/1/2024' | ''        | '5,000'           | '1,000'       | '1,000,000' | '1/1/2024' | ''        | '5,000'        | '1,000'       | '1,000,000' | '1/1/2024' | ''        | '15,000'     | '2,100'       | '2,100,000'  | '1/1/2024' | ''       |
			| "5C:Corporate performance management"                                      | '1,000'          | '2'           | '2,000'   | '1/1/2024' | "Line1" | '1,000'           | '200'         | '200,000'   | '1/1/2024' | "Line1" | '1,000'        | '200'         | '200,000'   | '1/1/2024' | "Line1" | '3,000'      | '402'         | '402,000'    | '1/1/2024' | ''       |
			| "2C:Corporation"                                                  | '1,000'          | '92'          | '92,000'  | '1/1/2024' | "Line1" | '1,000'           | '200'         | '200,000'   | '1/1/2024' | "Line1" | '1,000'        | '200'         | '200,000'   | '1/1/2024' | "Line1" | '3,000'      | '492'         | '492,000'    | '1/1/2024' | ''       |
			| "4C:Enterprise 8.3 CORP. Server License (x86-64)"           | '1,000'          | '2'           | '2,000'   | '1/1/2024' | "Line1" | '1,000'           | '200'         | '200,000'   | '1/1/2024' | "Line1" | '1,000'        | '200'         | '200,000'   | '1/1/2024' | "Line1" | '3,000'      | '402'         | '402,000'    | '1/1/2024' | ''       |
			| "1C:ERP. Corporate performance management"                                   | '1,000'          | '2'           | '2,000'   | '1/1/2024' | "Line1" | '1,000'           | '200'         | '200,000'   | '1/1/2024' | "Line1" | '1,000'        | '200'         | '200,000'   | '1/1/2024' | "Line1" | '3,000'      | '402'         | '402,000'    | '1/1/2024' | ''       |
			| "3C:Enterprise 8 CORP. Client license for 100 users" | '1,000'          | '2'           | '2,000'   | '1/1/2024' | "Line1" | '1,000'           | '200'         | '200,000'   | '1/1/2024' | "Line1" | '1,000'        | '200'         | '200,000'   | '1/1/2024' | "Line1" | '3,000'      | '402'         | '402,000'    | '1/1/2024' | ''       |
	
Сценарий: 02.14 Обратное распределение (пропорциональное)

	* Открываем сводную таблицу
		И Я октрываю сводную таблицу отчета с именем "VA - Recalculation in context"

	* Переходим в режим обратного распределния
		И я нажимаю на гиперссылку с именем 'FilterHeading'
		И из выпадающего списка с именем 'WorkMode' я выбираю точное значение "Reverse allocation (proportionally)"
		И я нажимаю на кнопку с именем 'UpdateTabData1'
		И я жду открытия формы "Pivot table: *" в течение 30 секунд

	* Распределяем показатели по одному периоду
		* Количество
			Когда открылось окно '$WindowTitle$'
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R10C2'
			И я выбираю пункт контекстного меню с именем 'SpreadsheetFieldTemlateContextMenuLockCellForDistribution' на элементе формы с именем 'SpreadsheetFieldTemlate'
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R5C2'
			И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
			И в табличный документ 'SpreadsheetFieldTemlate' я ввожу текст '1,050.00000'
		* Блокируем группу ячеек
			Когда открылось окно '$WindowTitle$'
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R6C3:R10C6'
			И я выбираю пункт контекстного меню с именем 'SpreadsheetFieldTemlateContextMenuLockCellForDistribution' на элементе формы с именем 'SpreadsheetFieldTemlate'						
		* Коэффициент
			Когда открылось окно '$WindowTitle$'
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R5C3'
			И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
			И в табличный документ 'SpreadsheetFieldTemlate' я ввожу текст '200.00000'
			Когда открылось окно '$WindowTitle$'
			Тогда область 'R4C2:R10C6' табличного документа 'SpreadsheetFieldTemlate' равна:
				| '1,050'          | '10'          | '10,500' | '1/1/2024' | ''        |
				| '1,050'          | '10'          | '2,100'  | '1/1/2024' | ''        |
				| '100'            | '2'           | '200'    | '1/1/2024' | "Line1" |
				| '200'            | '2'           | '400'    | '1/1/2024' | "Line1" |
				| '300'            | '2'           | '600'    | '1/1/2024' | "Line1" |
				| '400'            | '2'           | '800'    | '1/1/2024' | "Line1" |
				| '50'             | '2'           | '100'    | '1/1/2024' | "Line1" |
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R6C3:R10C3'
			И я выбираю пункт контекстного меню с именем 'SpreadsheetFieldTemlateContextMenuUnlockCellForDistribution' на элементе формы с именем 'SpreadsheetFieldTemlate'
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R5C3'
			И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
			И в табличный документ 'SpreadsheetFieldTemlate' я ввожу текст '200.00000'
		* Итог
			Когда открылось окно '$WindowTitle$'
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R5C4'
			И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
			И в табличный документ 'SpreadsheetFieldTemlate' я ввожу текст '100.00000'
		* Строка
			Когда открылось окно '$WindowTitle$'
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R5C6'
			И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
			И в табличный документ 'SpreadsheetFieldTemlate' я ввожу текст '100.00000'
						
		* Сравниваем результат
			Когда открылось окно '$WindowTitle$'
			Тогда табличный документ 'SpreadsheetFieldTemlate' равен:
				| "VA - Recalculation in context (pivot table)"                    | "January 2024" | ''            | ''        | ''           | ''        | "February 2024" | ''            | ''      | ''           | ''        | "March 2024" | ''            | ''       | ''           | ''        | "TOTAL"      | ''            | ''        | ''           | ''       |
				| "VA - Recalculation in context (pivot table)"                    | "Count"     | "Coefficient" | "Total"    | "Date"       | "Line"  | "Count"      | "Coefficient" | "Total"  | "Date"       | "Line"  | "Count"   | "Coefficient" | "Total"   | "Date"       | "Line"  | "Count" | "Coefficient" | "Total"    | "Date"       | "Line" |
				| "Total"                                                           | '1,050'          | '200'         | '210,000' | '1/1/2024' | ''        | '300'             | '20'          | '6,000' | '1/1/2024' | ''        | '450'          | '30'          | '13,500' | '1/1/2024' | ''        | '1,800'      | '250'         | '229,500' | '1/1/2024' | ''       |
				| "Goods"                                                         | '1,050'          | '200'         | '42,000'  | '1/1/2024' | ''        | '300'             | '20'          | '1,200' | '1/1/2024' | ''        | '450'          | '30'          | '2,700'  | '1/1/2024' | ''        | '1,800'      | '250'         | '45,900'  | '1/1/2024' | ''       |
				| "5C:Corporate performance management"                                      | '100'            | '40'          | '4,000'   | '1/1/2024' | "Line1" | '20'              | '4'           | '80'    | '1/1/2024' | "Line1" | '30'           | '6'           | '180'    | '1/1/2024' | "Line1" | '150'        | '50'          | '4,260'   | '1/1/2024' | ''       |
				| "2C:Corporation"                                                  | '200'            | '40'          | '8,000'   | '1/1/2024' | "Line1" | '40'              | '4'           | '160'   | '1/1/2024' | "Line1" | '60'           | '6'           | '360'    | '1/1/2024' | "Line1" | '300'        | '50'          | '8,520'   | '1/1/2024' | ''       |
				| "4C:Enterprise 8.3 CORP. Server License (x86-64)"           | '300'            | '40'          | '12,000'  | '1/1/2024' | "Line1" | '60'              | '4'           | '240'   | '1/1/2024' | "Line1" | '90'           | '6'           | '540'    | '1/1/2024' | "Line1" | '450'        | '50'          | '12,780'  | '1/1/2024' | ''       |
				| "1C:ERP. Corporate performance management"                                   | '400'            | '40'          | '16,000'  | '1/1/2024' | "Line1" | '80'              | '4'           | '320'   | '1/1/2024' | "Line1" | '120'          | '6'           | '720'    | '1/1/2024' | "Line1" | '600'        | '50'          | '17,040'  | '1/1/2024' | ''       |
				| "3C:Enterprise 8 CORP. Client license for 100 users" | '50'             | '40'          | '2,000'   | '1/1/2024' | "Line1" | '100'             | '4'           | '400'   | '1/1/2024' | "Line1" | '150'          | '6'           | '900'    | '1/1/2024' | "Line1" | '300'        | '50'          | '3,300'   | '1/1/2024' | ''       |
		
		* Распределение по периодам
			* Количество						
				Когда открылось окно '$WindowTitle$'
				И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R5C17'
				И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
				И в табличный документ 'SpreadsheetFieldTemlate' я ввожу текст '3,550.00000'
			* Коэффициент
				Когда открылось окно '$WindowTitle$'
				И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R5C18'
				И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
				И в табличный документ 'SpreadsheetFieldTemlate' я ввожу текст '500.00000'
			* Итог
				Когда открылось окно '$WindowTitle$'
				И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R5C19'
				И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
				И в табличный документ 'SpreadsheetFieldTemlate' я ввожу текст '100.00000'
			* Дата
				Когда открылось окно '$WindowTitle$'
				И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R5C20'
				И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
				И в табличный документ 'SpreadsheetFieldTemlate' я ввожу текст '100.00000'
			* Строка
				Когда открылось окно '$WindowTitle$'
				И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'C17'
				И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
				И в табличный документ 'SpreadsheetFieldTemlate' я ввожу текст '100.00000'
			* Столбец
				Когда открылось окно '$WindowTitle$'
				И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R5'
				И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
				И в табличный документ 'SpreadsheetFieldTemlate' я ввожу текст '100.00000'						
																
		* Сравниваем результат
			Когда открылось окно '$WindowTitle$'
			Тогда табличный документ 'SpreadsheetFieldTemlate' равен:
				| "VA - Recalculation in context (pivot table)"                    | "January 2024" | ''            | ''        | ''           | ''        | "February 2024" | ''            | ''       | ''           | ''        | "March 2024" | ''            | ''       | ''           | ''        | "TOTAL"      | ''            | ''        | ''           | ''       |
				| "VA - Recalculation in context (pivot table)"                    | "Count"     | "Coefficient" | "Total"    | "Date"       | "Line"  | "Count"      | "Coefficient" | "Total"   | "Date"       | "Line"  | "Count"   | "Coefficient" | "Total"   | "Date"       | "Line"  | "Count" | "Coefficient" | "Total"    | "Date"       | "Line" |
				| "Total"                                                           | '2,050'          | '400'         | '820,000' | '1/1/2024' | ''        | '600'             | '40'          | '24,000' | '1/1/2024' | ''        | '900'          | '60'          | '54,000' | '1/1/2024' | ''        | '3,550'      | '500'         | '898,000' | '1/1/2024' | ''       |
				| "Goods"                                                         | '2,050'          | '400'         | '164,000' | '1/1/2024' | ''        | '600'             | '40'          | '4,800'  | '1/1/2024' | ''        | '900'          | '60'          | '10,800' | '1/1/2024' | ''        | '3,550'      | '500'         | '179,600' | '1/1/2024' | ''       |
				| "5C:Corporate performance management"                                      | '200'            | '80'          | '16,000'  | '1/1/2024' | "Line1" | '40'              | '8'           | '320'    | '1/1/2024' | "Line1" | '60'           | '12'          | '720'    | '1/1/2024' | "Line1" | '300'        | '100'         | '17,040'  | '1/1/2024' | ''       |
				| "2C:Corporation"                                                  | '400'            | '80'          | '32,000'  | '1/1/2024' | "Line1" | '80'              | '8'           | '640'    | '1/1/2024' | "Line1" | '120'          | '12'          | '1,440'  | '1/1/2024' | "Line1" | '600'        | '100'         | '34,080'  | '1/1/2024' | ''       |
				| "4C:Enterprise 8.3 CORP. Server License (x86-64)"           | '600'            | '80'          | '48,000'  | '1/1/2024' | "Line1" | '120'             | '8'           | '960'    | '1/1/2024' | "Line1" | '180'          | '12'          | '2,160'  | '1/1/2024' | "Line1" | '900'        | '100'         | '51,120'  | '1/1/2024' | ''       |
				| "1C:ERP. Corporate performance management"                                   | '800'            | '80'          | '64,000'  | '1/1/2024' | "Line1" | '160'             | '8'           | '1,280'  | '1/1/2024' | "Line1" | '240'          | '12'          | '2,880'  | '1/1/2024' | "Line1" | '1,200'      | '100'         | '68,160'  | '1/1/2024' | ''       |
				| "3C:Enterprise 8 CORP. Client license for 100 users" | '50'             | '80'          | '4,000'   | '1/1/2024' | "Line1" | '200'             | '8'           | '1,600'  | '1/1/2024' | "Line1" | '300'          | '12'          | '3,600'  | '1/1/2024' | "Line1" | '550'        | '100'         | '9,200'   | '1/1/2024' | ''       |
							
Сценарий: 02.15 Изменение показателей в дополнительной валюте

	* Открываем сводную таблицу
		И Я октрываю сводную таблицу отчета с именем "VA - Recalculation in context"			
		И Я устанавливаю отбор сводной таблицы 'DisplayCurrency' со значением 'USD'

	* Меняем точность отображения
		Когда открылось окно '$WindowTitle$'
		И в поле с именем 'Accuracy' я ввожу текст '5'
		И я нажимаю на кнопку с именем 'UpdateTabData'				
		И я жду открытия формы "Pivot table: *" в течение 20 секунд	

	* Проверяем результат
		Тогда табличный документ 'SpreadsheetFieldTemlate' равен:
			| "VA - Recalculation in context (pivot table)"                    | "January 2024" | ''            | ''         | ''           | ''        | "February 2024" | ''            | ''         | ''           | ''        | "March 2024" | ''            | ''          | ''           | ''        | "TOTAL"      | ''            | ''          | ''           | ''       |
			| "VA - Recalculation in context (pivot table)"                    | "Count"     | "Coefficient" | "Total"     | "Date"       | "Line"  | "Count"      | "Coefficient" | "Total"     | "Date"       | "Line"  | "Count"   | "Coefficient" | "Total"      | "Date"       | "Line"  | "Count" | "Coefficient" | "Total"      | "Date"       | "Line" |
			| "Total"                                                           | '2.02102'        | '0.13474'     | '20.21007' | '1/1/2024' | ''        | '4.03362'         | '0.26890'     | '80.67260' | '1/1/2024' | ''        | '6.04810'      | '0.40320'     | '181.44307' | '1/1/2024' | ''        | '12.10274'   | '0.80684'     | '282.32574' | '1/1/2024' | ''       |
			| "Goods"                                                         | '2.02102'        | '10.00000'    | '4.04202'  | '1/1/2024' | ''        | '4.03363'         | '20.00000'    | '16.13452' | '1/1/2024' | ''        | '6.04808'      | '30.00000'    | '36.28862'  | '1/1/2024' | ''        | '12.10273'   | '60.00000'    | '56.46516'  | '1/1/2024' | ''       |
			| "5C:Corporate performance management"                                      | '0.13474'        | '2.00000'     | '0.26947'  | '1/1/2024' | "Line1" | '0.26891'         | '4.00000'     | '1.07563'  | '1/1/2024' | "Line1" | '0.40320'      | '6.00000'     | '2.41925'   | '1/1/2024' | "Line1" | '0.80685'    | '12.00000'    | '3.76435'   | '1/1/2024' | ''       |
			| "2C:Corporation"                                                  | '0.26947'        | '2.00000'     | '0.53894'  | '1/1/2024' | "Line1" | '0.53782'         | '4.00000'     | '2.15127'  | '1/1/2024' | "Line1" | '0.80641'      | '6.00000'     | '4.83848'   | '1/1/2024' | "Line1" | '1.61370'    | '12.00000'    | '7.52869'   | '1/1/2024' | ''       |
			| "4C:Enterprise 8.3 CORP. Server License (x86-64)"           | '0.40421'        | '2.00000'     | '0.80840'  | '1/1/2024' | "Line1" | '0.80673'         | '4.00000'     | '3.22690'  | '1/1/2024' | "Line1" | '1.20962'      | '6.00000'     | '7.25773'   | '1/1/2024' | "Line1" | '2.42056'    | '12.00000'    | '11.29303'  | '1/1/2024' | ''       |
			| "1C:ERP. Corporate performance management"                                   | '0.53893'        | '2.00000'     | '1.07787'  | '1/1/2024' | "Line1" | '1.07563'         | '4.00000'     | '4.30254'  | '1/1/2024' | "Line1" | '1.61282'      | '6.00000'     | '9.67696'   | '1/1/2024' | "Line1" | '3.22738'    | '12.00000'    | '15.05737'  | '1/1/2024' | ''       |
			| "3C:Enterprise 8 CORP. Client license for 100 users" | '0.67367'        | '2.00000'     | '1.34734'  | '1/1/2024' | "Line1" | '1.34454'         | '4.00000'     | '5.37818'  | '1/1/2024' | "Line1" | '2.01603'      | '6.00000'     | '12.09620'  | '1/1/2024' | "Line1" | '4.03424'    | '12.00000'    | '18.82172'  | '1/1/2024' | ''       |
							
	* Изменяем показатели
		* Количество
			Когда открылось окно '$WindowTitle$'
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R6C2'
			И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
			И в табличный документ 'SpreadsheetFieldTemlate' я ввожу текст '1,000.00000'
			Когда открылось окно '$WindowTitle$'
			И я нажимаю на кнопку с именем 'CopyDataByRow'
			Когда открылось окно '$WindowTitle$'
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R6C4'
			И я нажимаю на кнопку с именем 'CopyDataByRow'
		* Количество (зануление)
			Когда открылось окно '$WindowTitle$'
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R7C2'
			И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
			И в табличный документ 'SpreadsheetFieldTemlate' я ввожу текст '0.00000'
		* Дата
			Когда открылось окно '$WindowTitle$'
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R7C5'
			И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
			И в табличный документ 'SpreadsheetFieldTemlate' я ввожу текст '1/31/2024'
		* Строка
			Когда открылось окно '$WindowTitle$'
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R7C6'
			И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
			И в табличный документ 'SpreadsheetFieldTemlate' я ввожу текст "LineUSD"
			Когда открылось окно '$WindowTitle$'
			И я нажимаю на кнопку с именем 'CopyDataByRow'
		* Коэффициент
			Когда открылось окно '$WindowTitle$'
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R8C3'
			И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
			И в табличный документ 'SpreadsheetFieldTemlate' я ввожу текст '1.00000'
			Когда открылось окно '$WindowTitle$'
			И я нажимаю на кнопку с именем 'CopyDataByColumn'
		* Количество (отмена / возврат)
			Когда открылось окно '$WindowTitle$'
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R10C2'
			И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
			И в табличный документ 'SpreadsheetFieldTemlate' я ввожу текст '1.00000'
			Когда открылось окно '$WindowTitle$'
			И я нажимаю на кнопку с именем 'CancelAction'
			Когда открылось окно '$WindowTitle$'
			И я нажимаю на кнопку с именем 'RetryAction'

	* Сверяем результат
		Когда открылось окно '$WindowTitle$'
		Тогда табличный документ 'SpreadsheetFieldTemlate' равен:
			| "VA - Recalculation in context (pivot table)"                    | "January 2024" | ''            | ''            | ''           | ''          | "February 2024" | ''            | ''            | ''           | ''          | "March 2024" | ''            | ''            | ''           | ''          | "TOTAL"       | ''            | ''             | ''           | ''       |
			| "VA - Recalculation in context (pivot table)"                    | "Count"     | "Coefficient" | "Total"        | "Date"       | "Line"    | "Count"      | "Coefficient" | "Total"        | "Date"       | "Line"    | "Count"   | "Coefficient" | "Total"        | "Date"       | "Line"    | "Count"  | "Coefficient" | "Total"         | "Date"       | "Line" |
			| "Total"                                                           | '1,001.94314'    | '7.00000'     | '7,013.60198' | '1/31/2024' | ''          | '1,003.76472'     | '0.26890'     | '269.91233'   | '1/1/2024' | ''          | '1,005.64488'  | '0.40320'     | '405.47602'   | '1/1/2024' | ''          | '3,011.35274' | '7.67210'     | '7,688.99033'  | '1/31/2024' | ''       |
			| "Goods"                                                         | '1,001.94314'    | '7.00000'     | '2,001.94314' | '1/1/2024' | ''          | '1,003.76472'     | '20.00000'    | '4,015.05888' | '1/1/2024' | ''          | '1,005.64488'  | '30.00000'    | '6,033.86928' | '1/1/2024' | ''          | '3,011.35274' | '57.00000'    | '12,050.87130' | '1/1/2024' | ''       |
			| "5C:Corporate performance management"                                      | '1,000.00000'    | '2.00000'     | '2,000.00000' | '1/1/2024' | "Line1"   | '1,000.00000'     | '4.00000'     | '4,000.00000' | '1/1/2024' | "Line1"   | '1,000.00000'  | '6.00000'     | '6,000.00000' | '1/1/2024' | "Line1"   | '3,000.00000' | '12.00000'    | '12,000.00000' | '1/1/2024' | ''       |
			| "2C:Corporation"                                                  | '0'              | '2.00000'     | '0'           | '1/31/2024' | "LineUSD" | '0.53782'         | '4.00000'     | '2.15128'     | '1/1/2024' | "LineUSD" | '0.80641'      | '6.00000'     | '4.83846'     | '1/1/2024' | "LineUSD" | '1.34423'     | '12.00000'    | '6.98974'      | '1/1/2024' | ''       |
			| "4C:Enterprise 8.3 CORP. Server License (x86-64)"           | '0.40421'        | '1.00000'     | '0.40421'     | '1/1/2024' | "Line1"   | '0.80673'         | '4.00000'     | '3.22692'     | '1/1/2024' | "Line1"   | '1.20962'      | '6.00000'     | '7.25772'     | '1/1/2024' | "Line1"   | '2.42056'     | '11.00000'    | '10.88885'     | '1/1/2024' | ''       |
			| "1C:ERP. Corporate performance management"                                   | '0.53893'        | '1.00000'     | '0.53893'     | '1/1/2024' | "Line1"   | '1.07563'         | '4.00000'     | '4.30252'     | '1/1/2024' | "Line1"   | '1.61282'      | '6.00000'     | '9.67692'     | '1/1/2024' | "Line1"   | '3.22738'     | '11.00000'    | '14.51837'     | '1/1/2024' | ''       |
			| "3C:Enterprise 8 CORP. Client license for 100 users" | '1.00000'        | '1.00000'     | '1.00000'     | '1/1/2024' | "Line1"   | '1.34454'         | '4.00000'     | '5.37816'     | '1/1/2024' | "Line1"   | '2.01603'      | '6.00000'     | '12.09618'    | '1/1/2024' | "Line1"   | '4.36057'     | '11.00000'    | '18.47434'     | '1/1/2024' | ''       |
					
	* Меняем валюту на Евро
		И Я устанавливаю отбор сводной таблицы 'DisplayCurrency' со значением 'EUR'				
						
	* Сверяем результат
		Тогда табличный документ 'SpreadsheetFieldTemlate' равен:
			| "VA - Recalculation in context (pivot table)"                    | "January 2024" | ''            | ''            | ''           | ''          | "February 2024" | ''            | ''            | ''           | ''          | "March 2024" | ''            | ''            | ''           | ''          | "TOTAL"       | ''            | ''             | ''           | ''       |
			| "VA - Recalculation in context (pivot table)"                    | "Count"     | "Coefficient" | "Total"        | "Date"       | "Line"    | "Count"      | "Coefficient" | "Total"        | "Date"       | "Line"    | "Count"   | "Coefficient" | "Total"        | "Date"       | "Line"    | "Count"  | "Coefficient" | "Total"         | "Date"       | "Line" |
			| "Total"                                                           | '821.73483'      | '5.74098'     | '5,752.14393' | '1/31/2024' | ''          | '830.12297'       | '0.22240'     | '223.22005'   | '1/1/2024' | ''          | '843.72814'    | '0.33828'     | '340.19120'   | '1/1/2024' | ''          | '2,495.58594' | '6.30166'     | '6,315.55518'  | '1/31/2024' | ''       |
			| "Goods"                                                         | '821.73482'      | '7.00000'     | '1,641.87604' | '1/1/2024' | ''          | '830.12298'       | '20.00000'    | '3,320.49179' | '1/1/2024' | ''          | '843.72813'    | '30.00000'    | '5,062.36882' | '1/1/2024' | ''          | '2,495.58593' | '57.00000'    | '10,024.73665' | '1/1/2024' | ''       |
			| "5C:Corporate performance management"                                      | '820.14118'      | '2.00000'     | '1,640.28240' | '1/1/2024' | "Line1"   | '827.00950'       | '4.00000'     | '3,308.03796' | '1/1/2024' | "Line1"   | '838.99213'    | '6.00000'     | '5,033.95276' | '1/1/2024' | "Line1"   | '2,486.14281' | '12.00000'    | '9,982.27312'  | '1/1/2024' | ''       |
			| "2C:Corporation"                                                  | '0'              | '2.00000'     | '-0.00001'    | '1/31/2024' | "LineUSD" | '0.44478'         | '4.00000'     | '1.77913'     | '1/1/2024' | "LineUSD" | '0.67657'      | '6.00000'     | '4.05943'     | '1/1/2024' | "LineUSD" | '1.12135'     | '12.00000'    | '5.83855'      | '1/1/2024' | ''       |
			| "4C:Enterprise 8.3 CORP. Server License (x86-64)"           | '0.33150'        | '1.00000'     | '0.33152'     | '1/1/2024' | "Line1"   | '0.66717'         | '4.00000'     | '2.66870'     | '1/1/2024' | "Line1"   | '1.01486'      | '6.00000'     | '6.08917'     | '1/1/2024' | "Line1"   | '2.01353'     | '11.00000'    | '9.08939'      | '1/1/2024' | ''       |
			| "1C:ERP. Corporate performance management"                                   | '0.44200'        | '1.00000'     | '0.44199'     | '1/1/2024' | "Line1"   | '0.88957'         | '4.00000'     | '3.55822'     | '1/1/2024' | "Line1"   | '1.35314'      | '6.00000'     | '8.11886'     | '1/1/2024' | "Line1"   | '2.68471'     | '11.00000'    | '12.11907'     | '1/1/2024' | ''       |
			| "3C:Enterprise 8 CORP. Client license for 100 users" | '0.82014'        | '1.00000'     | '0.82014'     | '1/1/2024' | "Line1"   | '1.11196'         | '4.00000'     | '4.44778'     | '1/1/2024' | "Line1"   | '1.69143'      | '6.00000'     | '10.14860'    | '1/1/2024' | "Line1"   | '3.62353'     | '11.00000'    | '15.41652'     | '1/1/2024' | ''       |
	
	* Записываем
		Когда открылось окно '$WindowTitle$'
		И я нажимаю на кнопку с именем 'Apply'

	* Меняем валюту на Рубли
		И Я устанавливаю отбор сводной таблицы 'DisplayCurrency' со значением 'RUB'
				
	* Сверяем результат
		Тогда табличный документ 'SpreadsheetFieldTemlate' равен:
			| "VA - Recalculation in context (pivot table)"                    | "January 2024" | ''            | ''              | ''           | ''          | "February 2024" | ''            | ''              | ''           | ''          | "March 2024" | ''            | ''              | ''           | ''          | "TOTAL"         | ''            | ''              | ''           | ''       |
			| "VA - Recalculation in context (pivot table)"                    | "Count"     | "Coefficient" | "Total"          | "Date"       | "Line"    | "Count"      | "Coefficient" | "Total"          | "Date"       | "Line"    | "Count"   | "Coefficient" | "Total"          | "Date"       | "Line"    | "Count"    | "Coefficient" | "Total"          | "Date"       | "Line" |
			| "Total"                                                           | '74,364.61971'   | '519.54234'   | '520,552.34491' | '1/31/2024' | ''          | '74,654.70064'    | '20.00000'    | '20,074.64815'  | '1/1/2024' | ''          | '74,823.49902' | '30.00000'    | '30,168.83560'  | '1/1/2024' | ''          | '223,842.81937' | '569.54234'   | '570,795.82866' | '1/31/2024' | ''       |
			| "Goods"                                                         | '74,364.61971'   | '7.00000'     | '148,585.02028' | '1/1/2024' | ''          | '74,654.69990'    | '20.00000'    | '298,618.79959' | '1/1/2024' | ''          | '74,823.50051' | '30.00000'    | '448,940.99263' | '1/1/2024' | ''          | '223,842.82012' | '57.00000'    | '896,144.81250' | '1/1/2024' | ''       |
			| "5C:Corporate performance management"                                      | '74,220.39954'   | '2.00000'     | '148,440.79983' | '1/1/2024' | "Line1"   | '74,374.69990'    | '4.00000'     | '297,498.80034' | '1/1/2024' | "Line1"   | '74,403.50051' | '6.00000'     | '446,420.99933' | '1/1/2024' | "Line1"   | '222,998.59995' | '12.00000'    | '892,360.59950' | '1/1/2024' | ''       |
			| "2C:Corporation"                                                  | '-0.00017'       | '2.00000'     | '-0.00034'      | '1/31/2024' | "LineUSD" | '40.00000'        | '4.00000'     | '160.00074'     | '1/1/2024' | "LineUSD" | '60.00000'     | '6.00000'     | '359.99851'     | '1/1/2024' | "LineUSD" | '99.99983'      | '12.00000'    | '519.99891'     | '1/1/2024' | ''       |
			| "4C:Enterprise 8.3 CORP. Server License (x86-64)"           | '30.00000'       | '1.00000'     | '30.00085'      | '1/1/2024' | "Line1"   | '60.00000'        | '4.00000'     | '240.00149'     | '1/1/2024' | "Line1"   | '90.00000'     | '6.00000'     | '539.99926'     | '1/1/2024' | "Line1"   | '180.00000'     | '11.00000'    | '810.00160'     | '1/1/2024' | ''       |
			| "1C:ERP. Corporate performance management"                                   | '40.00000'       | '1.00000'     | '39.99966'      | '1/1/2024' | "Line1"   | '80.00000'        | '4.00000'     | '319.99851'     | '1/1/2024' | "Line1"   | '120.00000'    | '6.00000'     | '719.99702'     | '1/1/2024' | "Line1"   | '240.00000'     | '11.00000'    | '1,079.99519'   | '1/1/2024' | ''       |
			| "3C:Enterprise 8 CORP. Client license for 100 users" | '74.22034'       | '1.00000'     | '74.22028'      | '1/1/2024' | "Line1"   | '100.00000'       | '4.00000'     | '399.99851'     | '1/1/2024' | "Line1"   | '150.00000'    | '6.00000'     | '899.99851'     | '1/1/2024' | "Line1"   | '324.22034'     | '11.00000'    | '1,374.21730'   | '1/1/2024' | ''       |
									
Сценарий: 02.16 Изменение показателей в валюте не из регламента

	* Открываем сводную таблицу
		И Я октрываю сводную таблицу отчета с именем "VA - Recalculation in context"	
		И Я устанавливаю отбор сводной таблицы 'DisplayCurrency' со значением 'KZT'

	* Проверяем результат
		Тогда табличный документ 'SpreadsheetFieldTemlate' равен:
			| "VA - Recalculation in context (pivot table)" | "January 2024" | ''            | ''     | ''     | ''       | "February 2024" | ''            | ''     | ''     | ''       | "March 2024" | ''            | ''     | ''     | ''       | "TOTAL"      | ''            | ''     | ''     | ''       |
			| "VA - Recalculation in context (pivot table)" | "Count"     | "Coefficient" | "Total" | "Date" | "Line" | "Count"      | "Coefficient" | "Total" | "Date" | "Line" | "Count"   | "Coefficient" | "Total" | "Date" | "Line" | "Count" | "Coefficient" | "Total" | "Date" | "Line" |
			| "Total"                                        | '0'              | '0'           | '0'    | ''     | ''       | '0'               | '0'           | '0'    | ''     | ''       | '0'            | '0'           | '0'    | ''     | ''       | '0'          | '0'           | '0'    | ''     | ''       |
			| "Goods"                                      | '0'              | '0'           | '0'    | ''     | ''       | '0'               | '0'           | '0'    | ''     | ''       | '0'            | '0'           | '0'    | ''     | ''       | '0'          | '0'           | '0'    | ''     | ''       |
		
	* Добавлеям значения
		Когда открылось окно '$WindowTitle$'
		И Я добавляю значения с раскрытием показателей в ячейку 'R5C2'
			| "VA0Product"                | 'Value1' |
			| "5C:Corporate performance management" | '100.00000' |

	* Должен появиться протокол
		Тогда открылось окно "Protocol"
		Тогда табличный документ 'SpreadsheetDocumentField' равен:
			| "Errors"                                                                                                                                                                                  |
			| "The selected currency KZT does not correspond to the currencies set in parameter regulation:\n	Scenario: \"VA - Main scenario\",\n	Company: \"Mercury LLC\",\n	Period: \"January 2024\"" |
		Когда открылось окно "Protocol"
		И Я закрываю окно "Protocol"

	* Проверяем результат
		Когда открылось окно '$WindowTitle$'
		Тогда табличный документ 'SpreadsheetFieldTemlate' равен:
			| "VA - Recalculation in context (pivot table)" | "January 2024" | ''            | ''     | ''     | ''       | "February 2024" | ''            | ''     | ''     | ''       | "March 2024" | ''            | ''     | ''     | ''       | "TOTAL"      | ''            | ''     | ''     | ''       |
			| "VA - Recalculation in context (pivot table)" | "Count"     | "Coefficient" | "Total" | "Date" | "Line" | "Count"      | "Coefficient" | "Total" | "Date" | "Line" | "Count"   | "Coefficient" | "Total" | "Date" | "Line" | "Count" | "Coefficient" | "Total" | "Date" | "Line" |
			| "Total"                                        | '0'              | '0'           | '0'    | ''     | ''       | '0'               | '0'           | '0'    | ''     | ''       | '0'            | '0'           | '0'    | ''     | ''       | '0'          | '0'           | '0'    | ''     | ''       |
			| "Goods"                                      | '0'              | '0'           | '0'    | ''     | ''       | '0'               | '0'           | '0'    | ''     | ''       | '0'            | '0'           | '0'    | ''     | ''       | '0'          | '0'           | '0'    | ''     | ''       |
