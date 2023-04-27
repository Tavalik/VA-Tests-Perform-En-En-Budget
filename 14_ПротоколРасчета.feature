#language: ru

@tree

Функционал: 14. Проверка отображения протокола

Как Администратор я хочу
Проверить что протокол расчета отображается
чтобы пользователь видел протокол расчета

Контекст: 

	И я подключаю TestClient "CPM - Budget" логин "Administrator" пароль ''
	И я закрыл все окна клиентского приложения	

Сценарий: 14.00 Определение типа приложения

	Пусть Инициализация переменных

Сценарий: 14.01 Создание вида отчета "VA - Calculation protocol"

	И Я создаю вид отчета с именем "VA - Calculation protocol" и родителем "VA - Report group"

	* Редактируем структуру отчета
		И Я открываю контруктор отчета с именем "VA - Calculation protocol"
		И Я в конструкторе отчета добавляю строку с именем "ReportLine"
		И Я в конструкторе отчета добавляю колонку с именем "Amount"
	
	* Вводим формулы расчета
		Тогда открылось окно "Edit tree"
		И из выпадающего списка с именем 'WorkMode' я выбираю точное значение "Indicators calculation formulas"
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R2C2'
		И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
		И я нажимаю на кнопку с именем 'ArbitraryCode'
		И в поле с именем 'TextDocumentFieldProcedure' я ввожу текст 
			|'Result = 123;'|
		И я нажимаю на кнопку с именем 'WriteAndCollapse'
		И Я закрываю окно "Edit tree"				

	И Я Для вида отчета "VA - Calculation protocol" я создаю бланк по умолчанию
	И Я для вида отчета "VA - Calculation protocol" я создаю бланк сводной таблицы по умолчанию с отборами ''	

Сценарий: 14.02 Создание экземпляра отчета "VA - Calculation protocol" для организации "Mercury LLC"	

	И Я создаю экземпляр отчета для вида отчета "VA - Calculation protocol" сценарий "VA - Main scenario" период '1/1/2021' '3/31/2021' периодичность "Month" организация "Mercury LLC" проект '' аналитики '' '' '' '' '' ''

	* Запишем документ
		Когда открылось окно '$WindowTitle$'
		И я нажимаю на кнопку с именем 'Write'				

	* Расчитаем документ
		И я нажимаю на кнопку с именем 'FormFillByDefault'		

	* Сверяем результат
		Когда открылось окно '$WindowTitle$'
		Тогда табличный документ 'SpreadsheetFieldTemlate' равен:
			| "VA - Calculation protocol" | ''               | ''                | ''             | ''      |
			| ''                      | ''               | ''                | ''             | ''      |
			| ''                      | "January 2021" | "February 2021" | "March 2021" | "TOTAL" |
			| ''                      | "Amount"          | "Amount"           | "Amount"        | "Amount" |
			| "ReportLine"          | '123'            | '123'             | '123'          | '369'   |
		
	* Закроем не сохраняя
		Когда открылось окно '$WindowTitle$'
		И Я закрываю окно '$WindowTitle$'
		Тогда открылось окно "1C:Enterprise"
		И я нажимаю на кнопку с именем 'Button1'

Сценарий: 14.03 Создание экземпляра отчета "VA - Calculation protocol" для организации "Earth LLC"	

	И Я создаю экземпляр отчета для вида отчета "VA - Calculation protocol" сценарий "VA - Main scenario" период '1/1/2021' '3/31/2021' периодичность "Month" организация "Earth LLC" проект '' аналитики '' '' '' '' '' ''

	* Запишем документ
		Когда открылось окно '$WindowTitle$'
		И я нажимаю на кнопку с именем 'Write'				

	* Расчитаем документ
		И я нажимаю на кнопку с именем 'FormFillByDefault'
		Когда открылось окно "Protocol"
		Тогда табличный документ 'SpreadsheetDocumentField' равен:
			| "Errors"                                                                                                                                                                                                       |
			| "Locked period is excluded from calculation by the following parameters:\n	Period: \"January 2021\"\n	Regulation: \"VA - Main regulations\",\n	Scenario: \"VA - Main scenario\",\n	Company: \"Earth LLC\""  |
			| "Locked period is excluded from calculation by the following parameters:\n	Period: \"February 2021\"\n	Regulation: \"VA - Main regulations\",\n	Scenario: \"VA - Main scenario\",\n	Company: \"Earth LLC\""  |
		И я нажимаю на кнопку с именем 'FormTechnicalInformation'
		И Я закрываю окно "Protocol"	

	* Сверяем результат
		Когда открылось окно '$WindowTitle$'
		Тогда табличный документ 'SpreadsheetFieldTemlate' равен:
			| "VA - Calculation protocol" | ''               | ''                | ''             | ''      |
			| ''                      | ''               | ''                | ''             | ''      |
			| ''                      | "January 2021" | "February 2021" | "March 2021" | "TOTAL" |
			| ''                      | "Amount"          | "Amount"           | "Amount"        | "Amount" |
			| "ReportLine"          | '0'              | '0'               | '123'          | '123'   |
		
	* Закроем не сохраняя
		Когда открылось окно '$WindowTitle$'
		И Я закрываю окно '$WindowTitle$'
		Тогда открылось окно "1C:Enterprise"
		И я нажимаю на кнопку с именем 'Button1'
				
Сценарий: 14.04 Выполняем расчет экземплятров отчетов из списка

	И Я нахожу в списке вид отчета с именем "VA - Calculation protocol"
	И в таблице 'ReportKindList' я нажимаю на кнопку с именем 'ReportKindListOpenInstancesList'
	
	* Выполняем расчет
		Тогда открылось окно "Report instances"
		И в таблице 'List' я выделяю все строки
		И я нажимаю на кнопку с именем 'ImportOfData'
		
	* Проверяем протокол
		Тогда открылось окно "Protocol"
		Тогда табличный документ 'SpreadsheetDocumentField' равен:
			| "Errors"                                                                                                                                                                                                       |
			| "Locked period is excluded from calculation by the following parameters:\n	Period: \"January 2021\"\n	Regulation: \"VA - Main regulations\",\n	Scenario: \"VA - Main scenario\",\n	Company: \"Earth LLC\""  |
			| "Locked period is excluded from calculation by the following parameters:\n	Period: \"February 2021\"\n	Regulation: \"VA - Main regulations\",\n	Scenario: \"VA - Main scenario\",\n	Company: \"Earth LLC\""  |
		И я нажимаю на кнопку с именем 'FormTechnicalInformation'
		И Я закрываю окно "Protocol"

	* Проверяем расчет для "Меркурий ООО"
		Тогда открылось окно "Report instances"
		И в таблице 'List' я перехожу к строке:
			| "Primary currency" | "Report type"            | "Company"  | "Report period"  | "End period" | "Scenario"               |
			| 'RUB'             | "VA - Calculation protocol" | "Mercury LLC" | "January 2021" | "March 2021"     | "VA - Main scenario" |
		И в таблице 'List' я выбираю текущую строку
		Тогда Открылся экземпляр отчета для вида отчета "VA - Calculation protocol" валюта 'RUB' организация "Mercury LLC" сценарий "VA - Main scenario" периодичность "Month" проект '' аналитики '' '' '' '' '' '' 
		Тогда табличный документ 'SpreadsheetFieldTemlate' равен:
			| "VA - Calculation protocol" | ''               | ''                | ''             | ''      |
			| ''                      | ''               | ''                | ''             | ''      |
			| ''                      | "January 2021" | "February 2021" | "March 2021" | "TOTAL" |
			| ''                      | "Amount"          | "Amount"           | "Amount"        | "Amount" |
			| "ReportLine"          | '123'            | '123'             | '123'          | '369'   |
		Когда открылось окно '$WindowTitle$'
		И Я закрываю окно '$WindowTitle$'				
		
	* Проверяем расчет для "Меркурий ООО"
		Тогда открылось окно "Report instances"
		И в таблице 'List' я перехожу к строке:
			| "Primary currency" | "Report type"            | "Company" | "Report period"  | "End period" | "Scenario"               |
			| 'RUB'             | "VA - Calculation protocol" | "Earth LLC"   | "January 2021" | "March 2021"     | "VA - Main scenario" |
		И в таблице 'List' я выбираю текущую строку
		Тогда Открылся экземпляр отчета для вида отчета "VA - Calculation protocol" валюта 'RUB' организация "Earth LLC" сценарий "VA - Main scenario" периодичность "Month" проект '' аналитики '' '' '' '' '' '' 
		Тогда табличный документ 'SpreadsheetFieldTemlate' равен:
			| "VA - Calculation protocol" | ''               | ''                | ''             | ''      |
			| ''                      | ''               | ''                | ''             | ''      |
			| ''                      | "January 2021" | "February 2021" | "March 2021" | "TOTAL" |
			| ''                      | "Amount"          | "Amount"           | "Amount"        | "Amount" |
			| "ReportLine"          | '0'              | '0'               | '123'          | '123'   |
		Когда открылось окно '$WindowTitle$'
		И Я закрываю окно '$WindowTitle$'	

Сценарий: 14.05 Выполняем расчет экземплятров отчетов из списка

	* Открываем сводную таблицу
		И Я октрываю сводную таблицу отчета с именем "VA - Calculation protocol"
		И Я устанавливаю отборы сводной таблицы: дата начала '1/1/2021', дата конца '3/31/2021', валюта 'RUB', сценарий "VA - Main scenario", организация "Earth LLC"		

	* Выполняем расчет
		Когда открылось окно '$WindowTitle$'
		И я нажимаю на кнопку с именем 'RecalculateAccordingToRegulations'

	* Проверяем протокол
		Тогда открылось окно "Protocol"
		Тогда табличный документ 'SpreadsheetDocumentField' равен:
			| "Errors"                                                                                                                                                                                                       |
			| "Locked period is excluded from calculation by the following parameters:\n	Period: \"January 2021\"\n	Regulation: \"VA - Main regulations\",\n	Scenario: \"VA - Main scenario\",\n	Company: \"Earth LLC\""  |
			| "Locked period is excluded from calculation by the following parameters:\n	Period: \"February 2021\"\n	Regulation: \"VA - Main regulations\",\n	Scenario: \"VA - Main scenario\",\n	Company: \"Earth LLC\""  |
		И я нажимаю на кнопку с именем 'FormTechnicalInformation'
		И Я закрываю окно "Protocol"

	* Сверяем результат
		Тогда табличный документ 'SpreadsheetFieldTemlate' равен:
			| "VA - Calculation protocol (pivot table)" | "January 2021" | "February 2021" | "March 2021" | "TOTAL" |
			| "VA - Calculation protocol (pivot table)" | "Amount"          | "Amount"           | "Amount"        | "Amount" |
			| "ReportLine"                            | '0'              | '0'               | '123'          | '123'   |
					
