#language: ru

@tree

Функционал: 10. Расчет показателей с заполнением по ADO

Как Администратор я хочу
Проверить, что данные по ADO загружаются в экземпляры отчетов

Контекст: 

	И я подключаю TestClient "CPM - Budget" логин "Administrator" пароль ''
	И я закрыл все окна клиентского приложения

Сценарий: 10.00 Определение типа приложения

	Пусть Инициализация переменных

Сценарий: 10.01 Загрузка методической модели

	* Загрузка модели
		И В командном интерфейсе я выбираю "Budgeting, reporting, and analysis" "Export and import instructional models"
		Тогда открылось окно "Instructional model exchange"
		И я перехожу к закладке с именем 'GroupImport'
		Если '$$ЭтоPerform$$' Тогда
			Если '$$LanguageИнтерфейса$$ = "Ru"' Тогда
				И в поле с именем 'ImportFileName' я ввожу текст '$КаталогПроекта$\Макеты\ADO\Model_ADO_Perform.xml'
			Иначе
				И в поле с именем 'ImportFileName' я ввожу текст '$КаталогПроекта$\Макеты\ADO_En\Model_ADO_Perform_En_En.xml'
		ИначеЕсли '$$IsCPM$$' Тогда
			И в поле с именем 'ImportFileName' я ввожу текст '$КаталогПроекта$\Макеты\ADO\Model_ADO_УХ32.xml'	
		ИначеЕсли '$$IsERPCPM$$' Тогда
			И в поле с именем 'ImportFileName' я ввожу текст '$КаталогПроекта$\Макеты\ADO\Model_ADO_ERP.xml'
		И я нажимаю на кнопку с именем 'ImportData'
		Затем я жду, что в сообщениях пользователю будет подстрока "Data is imported successfully" в течение 60 секунд
		И Я закрываю окно "Instructional model exchange"

	* Устанавливаем группу отчетов
		И Я открываю вид отчета с именем "VA - Download test by ADO"
		И из выпадающего списка с именем 'Parent' я выбираю по строке "VA - Report group"
		И я нажимаю на кнопку с именем 'RecordButtonForm'

	* Настроим соответствия имен файлов
		Когда открылось окно "VA - Download test by ADO (Report kinds)"
		И я перехожу к закладке с именем 'DefaultSettings'
		И я нажимаю на кнопку открытия поля с именем 'DefaultProcessingRule'
		Тогда Открылась правило расчета для вида отчета "VA - Download test by ADO"
		И я нажимаю на кнопку открытия поля с именем 'DBType'
		Тогда открылось окно "VA - ADO tables (Infobase type)"
		И я нажимаю на кнопку открытия поля с именем 'DefaultEIB'
		Тогда открылось окно "VA - ADO tables (External infobases)"
		И в поле с именем 'ReferenceDirectory' я ввожу текст "$КаталогПроекта$\Макеты\ADO_En"
		И в поле с именем 'NameBeginning' я ввожу текст "$КаталогПроекта$\Макеты\ADO_En"
	
		* Добавляем или обновляем запись в РС
			И я нажимаю на кнопку с именем 'OpenCompaniesFilesExchangeSettings'
			Тогда открылось окно "Company file path items: List form"
			И я перехожу к закладке с именем 'Page_ReportType'
			Когда открылось окно "Company file path items: List form"
			И в таблице 'List_ReportType' я нажимаю на кнопку с именем 'List_ReportTypeFind'
			Тогда открылась форма с именем 'UniversalListFindExtForm'
			И из выпадающего списка с именем 'FieldSelector' я выбираю точное значение "Object"						
			И в поле с именем 'Pattern' я ввожу текст "VA - Download test by ADO"
			И я нажимаю на кнопку с именем 'Find'
			Тогда открылось окно "Company file path items: List form"
			Если в таблице 'List_ReportType' количество строк 'равно' 0 Тогда
				И в таблице 'List_ReportType' я нажимаю на кнопку с именем 'List_ReportTypeCreate'
			Иначе
				И в таблице 'List_ReportType' я выбираю текущую строку								
			Тогда открылось окно "Company file path items*"
			И из выпадающего списка с именем 'Object' я выбираю по строке "VA - Download test by ADO"
			И в поле с именем 'Name' я ввожу текст "VA_LoadingADO_En"
			И я нажимаю на кнопку с именем 'FormWriteAndClose'
			И я жду закрытия окна "Company file path items *" в течение 20 секунд
		
		* Проверяем подключение
			Когда открылось окно "Company file path items: List form"
			И Я закрываю окно "Company file path items: List form"
			Тогда открылось окно "VA - ADO tables (External infobases) *"
			И я нажимаю на кнопку с именем 'Write'
			Тогда открылось окно "VA - ADO tables (External infobases)"
			И я нажимаю на кнопку с именем 'TestConnection'
			Тогда открылось окно "1C:Enterprise"
			И я нажимаю на кнопку с именем 'Button0'
			Тогда открылось окно "VA - ADO tables (External infobases)"
			И я нажимаю на кнопку с именем 'WriteAndClose'
			И я жду закрытия окна "VA - ADO tables (External infobases)" в течение 20 секунд
		
		* Закрываем формы
			Когда открылось окно "VA - ADO tables (Infobase type)"
			И я нажимаю на кнопку с именем 'FormWriteAndClose'
			И я жду закрытия окна "VA - ADO tables (Infobase type)" в течение 20 секунд
			Тогда открылось окно "VA - Download test by ADO (Calculation rules)"
			И я нажимаю на кнопку с именем 'FormWriteAndClose'
			И я жду закрытия окна "VA - Download test by ADO (Calculation rules)" в течение 20 секунд

	* Перезапишем правила трансляции
		* Номенклатура
			Когда открылось окно "VA - Download test by ADO (Report kinds)"
			И я нажимаю на кнопку открытия поля с именем 'DefaultProcessingRule'
			Тогда открылось окно "VA - Download test by ADO (Calculation rules)"
			И я нажимаю на кнопку открытия поля с именем 'DBType'
			Тогда открылось окно "VA - ADO tables (Infobase type)"
			И я нажимаю на кнопку с именем 'FormConfigureMappings'
			Тогда открылось окно "Correspondence with external infobases"
			И в таблице 'List' я перехожу к строке:
				| "File name"           | "Description"                                  |
				| "VA_LoadingADO_En.xlsx" | "ВидСубконто.Product range -> ADOTable.Sheet1$" |
			И в таблице 'List' я выбираю текущую строку
			Тогда открылось окно "ВидСубконто.Product range -> ADOTable.Sheet1$ (Correspondence with external infobases)"
			Если '$$IsCPM$$' Тогда
				И я нажимаю кнопку выбора у поля с именем 'RootDirectory1'
				Тогда открылось окно 'Catalog.Products'
				И в таблице 'List' я перехожу к строке:
					| "Reference"            |
					| "VA - Products" |
				И в таблице 'List' я нажимаю на кнопку с именем 'ListChoose'
				Тогда открылось окно "ВидСубконто.Product range -> ADOTable.Sheet1*"
			Если '$$ЭтоPerform$$' Тогда
				И в таблице 'ComplianceTable' я перехожу к строке:
					| "Field"                  |
					| "Product range group" |	
			Иначе						
				И в таблице 'ComplianceTable' я перехожу к строке:
					| "Field"             |
					| "Kind номенклатуры" |
			И в таблице 'ComplianceTable' я активизирую поле с именем 'ComplianceTableFillingMethod'
			И в таблице 'ComplianceTable' я выбираю текущую строку
			И в таблице 'ComplianceTable' из выпадающего списка с именем 'ComplianceTableFillingMethod' я выбираю точное значение "Fixed value"
			И в таблице 'ComplianceTable' я завершаю редактирование строки
			И в таблице 'ComplianceTable' я активизирую поле с именем 'MappingTableEIBAlias'
			И в таблице 'ComplianceTable' я выбираю текущую строку
			Тогда открылось окно "Enter a value"
			И я нажимаю на кнопку с именем 'FormFind'
			Тогда открылась форма с именем 'UniversalListFindExtForm'
			Если '$$ЭтоPerform$$' Тогда
				И в поле с именем 'Pattern' я ввожу текст "VA - Product range group"
			Иначе
				И в поле с именем 'Pattern' я ввожу текст "VA - Products"
			И я меняю значение переключателя с именем 'CompareType' на "Exact match"
			И я нажимаю на кнопку с именем 'Find'
			Тогда открылось окно "Enter a value"
			И в таблице 'List' я выбираю текущую строку
			Тогда открылось окно "ВидСубконто.Product range -> ADOTable.Sheet1*"
			Если '$$IsCPM$$' Тогда
				И в таблице 'ComplianceTable' я перехожу к строке:
					| "Field"    |
					| "Unit" |
			Если '$$IsERPCPM$$' Тогда
				И в таблице 'ComplianceTable' я перехожу к строке:
					| "Field"             |
					| "Unit хранения" |		
			И в таблице 'ComplianceTable' я активизирую поле с именем 'ComplianceTableFillingMethod'
			И в таблице 'ComplianceTable' я выбираю текущую строку
			И в таблице 'ComplianceTable' из выпадающего списка с именем 'ComplianceTableFillingMethod' я выбираю точное значение "Fixed value"
			И в таблице 'ComplianceTable' я завершаю редактирование строки
			И в таблице 'ComplianceTable' я активизирую поле с именем 'MappingTableEIBAlias'
			И в таблице 'ComplianceTable' я выбираю текущую строку
			Тогда открылось окно "Enter a value"
			И я нажимаю на кнопку с именем 'FormFind'
			Тогда открылась форма с именем 'UniversalListFindExtForm'
			Если '$$IsCPM$$' Тогда
				И из выпадающего списка с именем 'FieldSelector' я выбираю точное значение "Code"
				И в поле с именем 'Pattern' я ввожу текст '796'
				И я меняю значение переключателя с именем 'CompareType' на "Exact match"
			Если '$$IsERPCPM$$' Тогда
				И из выпадающего списка с именем 'FieldSelector' я выбираю точное значение "Международное сокращение"
				И в поле с именем 'Pattern' я ввожу текст 'PCE'
				И я меняю значение переключателя с именем 'CompareType' на "Exact match"	
			И я нажимаю на кнопку с именем 'Find'
			Тогда открылось окно "Enter a value"
			И в таблице 'List' я выбираю текущую строку	
			Тогда открылось окно "ВидСубконто.Product range -> ADOTable.Sheet1*"	
			И я нажимаю на кнопку с именем 'FormWriteAndClose'
			И я жду закрытия окна "ВидСубконто.Product range -> ADOTable.Sheet1*" в течение 20 секунд			
		* Статьи ДДС
			Тогда открылось окно "Correspondence with external infobases"
			И в таблице 'List' я перехожу к строке:
				| "File name"           | "Description"                                |
				| "VA_LoadingADO_En.xlsx" | "ВидСубконто.Cash flow items -> ADOTable.Sheet1$" |
			И в таблице 'List' я выбираю текущую строку
			Тогда открылось окно "ВидСубконто.Cash flow items -> ADOTable.Sheet1$ (Correspondence with external infobases)"
			И я нажимаю на кнопку с именем 'FormWriteAndClose'
			И я жду закрытия окна "ВидСубконто.Cash flow items -> ADOTable.Sheet1*" в течение 20 секунд

Сценарий: 10.02 Создаем экземпляр отчета

	* Ищем существующий экземпляр отчета
		И В командном интерфейсе я выбираю "Budgeting, reporting, and analysis" "Report kinds and templates"
		Тогда открылось окно "Report kinds and templates"
		И в таблице 'ReportKindList' я нажимаю на кнопку с именем 'ReportKindListFind'
		Тогда открылась форма с именем 'UniversalListFindExtForm'
		И из выпадающего списка с именем 'Pattern' я выбираю по строке "VA - Download test by ADO"
		И я нажимаю на кнопку с именем 'Find'
		Тогда открылось окно "Report kinds and templates"
		И в таблице 'ReportKindList' я нажимаю на кнопку с именем 'ReportKindListOpenInstancesList'
		Когда открылось окно "Report instances"
		* Отбора по сценарию
			И я устанавливаю флаг с именем 'UseScenario'
			И я нажимаю кнопку выбора у поля с именем 'FilteringByScenario'
			Тогда открылось окно "Value list"
			И в таблице 'ValueList' я выбираю текущую строку
			И в таблице 'ValueList' из выпадающего списка с именем 'Value' я выбираю по строке "VA - Main scenario"
			И в таблице 'ValueList' я завершаю редактирование строки
			И я нажимаю на кнопку с именем 'OK'
		* Отбор по организации
			И я устанавливаю флаг с именем 'UseCompanies'
			И в таблице 'Companies' я перехожу к строке:
				| "Value"    | "Use" |
				| "System LLC" | "No"          |
			И в таблице 'Companies' я разворачиваю текущую строку
			И в таблице 'Companies' я перехожу к строке:
				| "Value"     | "Use" |
				| "Mercury LLC" | "No"          |
			И в таблице 'Companies' я устанавливаю флаг с именем 'CompaniesUse'
			И в таблице 'Companies' я завершаю редактирование строки
		
		Если в таблице 'List' количество строк 'равно' 0 Тогда
			И Я создаю экземпляр отчета для вида отчета "VA - Download test by ADO" сценарий "VA - Main scenario" период '1/1/2021' '3/31/2021' периодичность "Month" организация "Mercury LLC" проект '' аналитики '' '' '' '' '' '' 
		Иначе
			И в таблице 'List' я выбираю текущую строку
			И Открылся экземпляр отчета для вида отчета "VA - Download test by ADO" валюта 'RUB' организация "Mercury LLC" сценарий "VA - Main scenario" периодичность "Month" проект '' аналитики '' '' '' '' '' '' 
			И я нажимаю на кнопку с именем 'EnableEdit'		
		И я нажимаю на кнопку с именем 'Clear'
		Тогда открылось окно '1C:Предприятие'
		И я нажимаю на кнопку с именем 'Button0'
		Тогда открылось окно '$WindowTitle$'
		И я нажимаю на кнопку с именем 'Write'
		Тогда открылось окно '$WindowTitle$'
		И я нажимаю на кнопку с именем 'FormRefreshСУчетомВерсий'
		Тогда табличный документ 'SpreadsheetFieldTemlate' равен:
			| "VA - Download test by ADO" | ''               | ''           | ''     | ''      | ''                | ''           | ''     | ''      | ''             | ''           | ''     | ''      | ''        | ''           | ''     | ''      |
			| ''                          | ''               | ''           | ''     | ''      | ''                | ''           | ''     | ''      | ''             | ''           | ''     | ''      | ''        | ''           | ''     | ''      |
			| ''                          | "January 2021" | ''           | ''     | ''      | "February 2021" | ''           | ''     | ''      | "March 2021" | ''           | ''     | ''      | "TOTAL"   | ''           | ''     | ''      |
			| ''                          | "Product ID"        | "Quantity" | "Price" | "Amount" | "Product ID"         | "Quantity" | "Price" | "Amount" | "Product ID"      | "Quantity" | "Price" | "Amount" | "Product ID" | "Quantity" | "Price" | "Amount" |
			| "Line1"                   | ''               | '0'          | '0'    | '0'     | ''                | '0'          | '0'    | '0'     | ''             | '0'          | '0'    | '0'     | ''        | '0'          | '0'    | '0'     |
		* Сверим движения
			Когда открылось окно '$WindowTitle$'
			И я нажимаю на кнопку с именем 'FormOpenDocumentRegisterRecordsFlatTab'
			И я жду открытия формы "Flat table of indicator values" в течение 30 секунд
			И я жду когда в табличном документе 'ReportSpreadsheetDocument' заполнится ячейка 'R2C1' в течение 60 секунд
			Дано Табличный документ 'ReportSpreadsheetDocument' равен макету 'Templates\RegisterRecords_Empty1.mxl' по шаблону
			И Я закрываю окно "Flat table of indicator values"
			
	* Рассчитываем документ по правилу
		И я нажимаю на кнопку с именем 'FormFillByDefault'

	* Сверяем результат
		Тогда открылось окно '$WindowTitle$'
		Тогда табличный документ 'SpreadsheetFieldTemlate' равен:
			| "VA - Download test by ADO"                                       | ''               | ''           | ''          | ''           | ''                | ''           | ''          | ''           | ''              | ''           | ''          | ''           | ''        | ''           | ''     | ''            |
			| ''                                                                | ''               | ''           | ''          | ''           | ''                | ''           | ''          | ''           | ''              | ''           | ''          | ''           | ''        | ''           | ''     | ''            |
			| ''                                                                | "January 2021" | ''           | ''          | ''           | "February 2021" | ''           | ''          | ''           | "March 2021"  | ''           | ''          | ''           | "TOTAL"   | ''           | ''     | ''            |
			| ''                                                                | "Product ID"        | "Quantity" | "Price"      | "Amount"      | "Product ID"         | "Quantity" | "Price"      | "Amount"      | "Product ID"       | "Quantity" | "Price"      | "Amount"      | "Product ID" | "Quantity" | "Price" | "Amount"       |
			| "Line1"                                                         | ''               | '36'         | '839,627'   | '15,965,000' | ''                | '61'         | '958,752'   | '34,723,000' | ''              | '86'         | '1,072,802' | '58,228,400' | ''        | '183'        | '0'    | '108,916,400' |
			| "3Software sale "                               | '4601546106674'  | '15'         | '1,206,000' | '15,340,000' | '4601546106674'   | '30'         | '1,326,600' | '33,748,000' | '4601546106674' | '45'         | '1,499,080' | '57,203,400' | ''        | '90'         | '0'    | '106,291,400' |
			| "5C:Corporate performance management "                                      | '2900001871389'  | '1'          | '1,250,000' | '1,250,000'  | '2900001871389'   | '2'          | '1,375,000' | '2,750,000'  | '2900001871389' | '3'          | '1,553,800' | '4,661,400'  | ''        | '6'          | '0'    | '8,661,400'   |
			| "2C:Corporation "                                                  | '2900001871419'  | '2'          | '2,050,000' | '4,100,000'  | '2900001871419'   | '4'          | '2,255,000' | '9,020,000'  | '2900001871419' | '6'          | '2,548,200' | '15,289,200' | ''        | '12'         | '0'    | '28,409,200'  |
			| "4C:Enterprise 8.3 CORP. Server License (x86-64) "           | '2900001916059'  | '3'          | '180,000'   | '540,000'    | '2900001916059'   | '6'          | '198,000'   | '1,188,000'  | '2900001916059' | '9'          | '223,700'   | '2,013,300'  | ''        | '18'         | '0'    | '3,741,300'   |
			| "1C:ERP. Corporate performance management "                                   | '2900001970198'  | '3'          | '1,950,000' | '5,850,000'  | '2900001970198'   | '6'          | '2,145,000' | '12,870,000' | '2900001970198' | '9'          | '2,423,900' | '21,815,100' | ''        | '18'         | '0'    | '40,535,100'  |
			| "3C:Enterprise 8 CORP. Client license for 100 users " | '4601546106674'  | '6'          | '600,000'   | '3,600,000'  | '4601546106674'   | '12'         | '660,000'   | '7,920,000'  | '4601546106674' | '18'         | '745,800'   | '13,424,400' | ''        | '36'         | '0'    | '24,944,400'  |
			| "2Software implementation "                                | "KPGUProf6"      | '20'         | '31,006'    | '0'          | "KPGUProf6"       | '30'         | '31,006'    | '0'          | "KPGUProf6"     | '40'         | '31,006'    | '0'          | ''        | '90'         | '0'    | '0'           |
			| "1C:KP GU PROF for 12 months "                                    | "KPGUProf12"     | '10'         | '40,572'    | '0'          | "KPGUProf12"      | '15'         | '40,572'    | '0'          | "KPGUProf12"    | '20'         | '40,572'    | '0'          | ''        | '45'         | '0'    | '0'           |
			| "1C:KP GU PROF for 6 months "                                     | "KPGUProf6"      | '10'         | '21,440'    | '0'          | "KPGUProf6"       | '15'         | '21,440'    | '0'          | "KPGUProf6"     | '20'         | '21,440'    | '0'          | ''        | '45'         | '0'    | '0'           |
			| "1Software upgrade "                                  | '2900001871389'  | '1'          | '625,000'   | '625,000'    | '2900001970198'   | '1'          | '975,000'   | '975,000'    | '2900001871419' | '1'          | '1,025,000' | '1,025,000'  | ''        | '3'          | '0'    | '2,625,000'   |
			| "5C:Corporate performance management "                                      | '2900001871389'  | '1'          | '625,000'   | '625,000'    | ''                | '0'          | '0'         | '0'          | ''              | '0'          | '0'         | '0'          | ''        | '1'          | '0'    | '625,000'     |
			| "2C:Corporation "                                                  | ''               | '0'          | '0'         | '0'          | ''                | '0'          | '0'         | '0'          | '2900001871419' | '1'          | '1,025,000' | '1,025,000'  | ''        | '1'          | '0'    | '1,025,000'   |
			| "1C:ERP. Corporate performance management "                                   | ''               | '0'          | '0'         | '0'          | '2900001970198'   | '1'          | '975,000'   | '975,000'    | ''              | '0'          | '0'         | '0'          | ''        | '1'          | '0'    | '975,000'     |

	* Сверим движения
		Когда открылось окно '$WindowTitle$'
		И я нажимаю на кнопку с именем 'FormOpenDocumentRegisterRecordsFlatTab'
		Тогда открылось окно "1C:Enterprise"
		И я нажимаю на кнопку с именем 'Button0'
		И я жду открытия формы "Flat table of indicator values" в течение 30 секунд
		И я жду когда в табличном документе 'ReportSpreadsheetDocument' заполнится ячейка 'R2C1' в течение 60 секунд
		Дано Табличный документ 'ReportSpreadsheetDocument' равен макету 'Макеты\ВА_ТестЗагрузкиПоADO_Движения.mxl' по шаблону
		И Я закрываю окно "Flat table of indicator values"

	* Рассчитываем документ по правилу еще раз
		Когда открылось окно '$WindowTitle$'
		И я нажимаю на кнопку с именем 'FormFillByDefault'

	* Сверяем результат еще раз
		Тогда табличный документ 'SpreadsheetFieldTemlate' равен:
			| "VA - Download test by ADO"                                       | ''               | ''           | ''          | ''           | ''                | ''           | ''          | ''           | ''              | ''           | ''          | ''           | ''        | ''           | ''     | ''            |
			| ''                                                                | ''               | ''           | ''          | ''           | ''                | ''           | ''          | ''           | ''              | ''           | ''          | ''           | ''        | ''           | ''     | ''            |
			| ''                                                                | "January 2021" | ''           | ''          | ''           | "February 2021" | ''           | ''          | ''           | "March 2021"  | ''           | ''          | ''           | "TOTAL"   | ''           | ''     | ''            |
			| ''                                                                | "Product ID"        | "Quantity" | "Price"      | "Amount"      | "Product ID"         | "Quantity" | "Price"      | "Amount"      | "Product ID"       | "Quantity" | "Price"      | "Amount"      | "Product ID" | "Quantity" | "Price" | "Amount"       |
			| "Line1"                                                         | ''               | '36'         | '839,627'   | '15,965,000' | ''                | '61'         | '958,752'   | '34,723,000' | ''              | '86'         | '1,072,802' | '58,228,400' | ''        | '183'        | '0'    | '108,916,400' |
			| "3Software sale "                               | '4601546106674'  | '15'         | '1,206,000' | '15,340,000' | '4601546106674'   | '30'         | '1,326,600' | '33,748,000' | '4601546106674' | '45'         | '1,499,080' | '57,203,400' | ''        | '90'         | '0'    | '106,291,400' |
			| "5C:Corporate performance management "                                      | '2900001871389'  | '1'          | '1,250,000' | '1,250,000'  | '2900001871389'   | '2'          | '1,375,000' | '2,750,000'  | '2900001871389' | '3'          | '1,553,800' | '4,661,400'  | ''        | '6'          | '0'    | '8,661,400'   |
			| "2C:Corporation "                                                  | '2900001871419'  | '2'          | '2,050,000' | '4,100,000'  | '2900001871419'   | '4'          | '2,255,000' | '9,020,000'  | '2900001871419' | '6'          | '2,548,200' | '15,289,200' | ''        | '12'         | '0'    | '28,409,200'  |
			| "4C:Enterprise 8.3 CORP. Server License (x86-64) "           | '2900001916059'  | '3'          | '180,000'   | '540,000'    | '2900001916059'   | '6'          | '198,000'   | '1,188,000'  | '2900001916059' | '9'          | '223,700'   | '2,013,300'  | ''        | '18'         | '0'    | '3,741,300'   |
			| "1C:ERP. Corporate performance management "                                   | '2900001970198'  | '3'          | '1,950,000' | '5,850,000'  | '2900001970198'   | '6'          | '2,145,000' | '12,870,000' | '2900001970198' | '9'          | '2,423,900' | '21,815,100' | ''        | '18'         | '0'    | '40,535,100'  |
			| "3C:Enterprise 8 CORP. Client license for 100 users " | '4601546106674'  | '6'          | '600,000'   | '3,600,000'  | '4601546106674'   | '12'         | '660,000'   | '7,920,000'  | '4601546106674' | '18'         | '745,800'   | '13,424,400' | ''        | '36'         | '0'    | '24,944,400'  |
			| "2Software implementation "                                | "KPGUProf6"      | '20'         | '31,006'    | '0'          | "KPGUProf6"       | '30'         | '31,006'    | '0'          | "KPGUProf6"     | '40'         | '31,006'    | '0'          | ''        | '90'         | '0'    | '0'           |
			| "1C:KP GU PROF for 12 months "                                    | "KPGUProf12"     | '10'         | '40,572'    | '0'          | "KPGUProf12"      | '15'         | '40,572'    | '0'          | "KPGUProf12"    | '20'         | '40,572'    | '0'          | ''        | '45'         | '0'    | '0'           |
			| "1C:KP GU PROF for 6 months "                                     | "KPGUProf6"      | '10'         | '21,440'    | '0'          | "KPGUProf6"       | '15'         | '21,440'    | '0'          | "KPGUProf6"     | '20'         | '21,440'    | '0'          | ''        | '45'         | '0'    | '0'           |
			| "1Software upgrade "                                  | '2900001871389'  | '1'          | '625,000'   | '625,000'    | '2900001970198'   | '1'          | '975,000'   | '975,000'    | '2900001871419' | '1'          | '1,025,000' | '1,025,000'  | ''        | '3'          | '0'    | '2,625,000'   |
			| "5C:Corporate performance management "                                      | '2900001871389'  | '1'          | '625,000'   | '625,000'    | ''                | '0'          | '0'         | '0'          | ''              | '0'          | '0'         | '0'          | ''        | '1'          | '0'    | '625,000'     |
			| "2C:Corporation "                                                  | ''               | '0'          | '0'         | '0'          | ''                | '0'          | '0'         | '0'          | '2900001871419' | '1'          | '1,025,000' | '1,025,000'  | ''        | '1'          | '0'    | '1,025,000'   |
			| "1C:ERP. Corporate performance management "                                   | ''               | '0'          | '0'         | '0'          | '2900001970198'   | '1'          | '975,000'   | '975,000'    | ''              | '0'          | '0'         | '0'          | ''        | '1'          | '0'    | '975,000'     |

	* Сверим движения еще раз
		Когда открылось окно '$WindowTitle$'
		И я нажимаю на кнопку с именем 'FormOpenDocumentRegisterRecordsFlatTab'
		Тогда открылось окно "1C:Enterprise"
		И я нажимаю на кнопку с именем 'Button0'
		И я жду открытия формы "Flat table of indicator values" в течение 30 секунд
		И я жду когда в табличном документе 'ReportSpreadsheetDocument' заполнится ячейка 'R2C1' в течение 30 секунд
		Дано Табличный документ 'ReportSpreadsheetDocument' равен макету 'Макеты\ВА_ТестЗагрузкиПоADO_Движения.mxl' по шаблону
		И Я закрываю окно "Flat table of indicator values"		

Сценарий: 10.03 Изменим вид номенклатуры

	Если '$$ЭтоPerform$$' Тогда
		И Я Для номенклатуры с именем "1C:KP GU PROF for 12 months" для реквизита 'Product_Category' выбираю значение '' в группе ''
		И Я Для номенклатуры с именем "1C:KP GU PROF for 6 months" для реквизита 'Product_Category' выбираю значение '' в группе ''

	ИначеЕсли '$$IsCPM$$' Тогда 
		И В командном интерфейсе я выбираю "Catalogs" "Product range"
		Тогда открылось окно "Product range"
		И в таблице 'List' я перехожу к строке:
			| "Description"      |
			| "VA - Products" |
		И в таблице  'List' я перехожу на один уровень вниз

		* 1С:КП ГУ ПРОФ на 12 месяцев
			Если в таблице 'List' есть строка Тогда
				| "Product ID"    | "Unit" | "Description"                |
				| "KPGUProf12" | "PCs"      | "1C:KP GU PROF for 12 months" |			
				И в таблице 'List' я перехожу к строке:
					| "Product ID"    | "Unit" | "Description"                |
					| "KPGUProf12" | "PCs"      | "1C:KP GU PROF for 12 months" |
				И в таблице 'List' я выбираю текущую строку
				Тогда открылось окно "1C:KP GU PROF for 12 months (Product range)"
				И из выпадающего списка с именем 'ProductKind' я выбираю по строке "VA - Other"
				И я нажимаю на кнопку с именем 'FormWriteAndClose'
				И я жду закрытия окна "1C:KP GU PROF for 12 months (Product range) *" в течение 20 секунд

		* 1С:КП ГУ ПРОФ на 6 месяцев
			Если в таблице 'List' есть строка Тогда
				| "Product ID"   | "Unit" | "Description"               |
				| "KPGUProf6" | "PCs"      | "1C:KP GU PROF for 6 months" |
				И в таблице 'List' я перехожу к строке:
					| "Product ID"   | "Unit" | "Description"               |
					| "KPGUProf6" | "PCs"      | "1C:KP GU PROF for 6 months" |
				И в таблице 'List' я выбираю текущую строку
				Тогда открылось окно "1C:KP GU PROF for 6 months (Product range)"
				И из выпадающего списка с именем 'ProductKind' я выбираю по строке "VA - Other"
				И я нажимаю на кнопку с именем 'FormWriteAndClose'
				И я жду закрытия окна "1C:KP GU PROF for 6 months (Product range) *" в течение 20 секунд	
		
	ИначеЕсли '$$IsERPCPM$$' Тогда
		И В командном интерфейсе я выбираю "Quick menu" "Product range"
		Тогда открылось окно "Product range"
		
		* 1С:КП ГУ ПРОФ на 6 месяцев
			И в таблице 'KindsНоменклатуры' я перехожу к строке:
				| "Description"      |
				| "VA - Products" |
			Если в таблице 'ListAdvancedSearchProducts' есть строка Тогда
				| "Product ID "  | "Description"               |
				| "KPGUProf6" | "1C:KP GU PROF for 6 months" |
				И в таблице 'ListAdvancedSearchProducts' я перехожу к строке:
					| "Product ID "  | "Description"               |
					| "KPGUProf6" | "1C:KP GU PROF for 6 months" |
				И в таблице 'ListAdvancedSearchProducts' я выбираю текущую строку
				Тогда открылось окно "1C:KP GU PROF for 6 months (Product range)"
				И я перехожу к закладке с именем 'PageProductAttributes'
				Если открылось окно 'Полезный совет' Тогда
					И я нажимаю на кнопку с именем 'Button0'
				Тогда открылось окно "1C:KP GU PROF for 6 months (Product range)"
				И я разворачиваю группу с именем 'СворачиваемаяMainParametersGroupУчета'
				И из выпадающего списка с именем 'ProductKind' я выбираю по строке "VA - Other"
				И я нажимаю на кнопку с именем 'FormWriteAndClose'				
				Если открылось окно 'Rate1 VAT применZ2етFrom1Z2 From1:' Тогда
					И в поле с именем 'InputFld' я ввожу текст '1/1/2021'
					И я нажимаю на кнопку с именем 'OK'
					Тогда открылось окно "1С:FN ГУ PРОФ for * месяцев (Product range)"
					И я нажимаю на кнопку с именем 'FormWriteAndClose'
				И я жду закрытия окна "1C:KP GU PROF for 6 months (Product range) *" в течение 20 секунд
		
		* 1С:КП ГУ ПРОФ на 12 месяцев
			И в таблице 'KindsНоменклатуры' я перехожу к строке:
				| "Description"      |
				| "VA - Products" |
			Если в таблице 'ListAdvancedSearchProducts' есть строка Тогда
				| "Product ID "   | "Description"                |
				| "KPGUProf12" | "1C:KP GU PROF for 12 months" |
				И в таблице 'ListAdvancedSearchProducts' я перехожу к строке:
					| "Product ID "   | "Description"                |
					| "KPGUProf12" | "1C:KP GU PROF for 12 months" |
				И в таблице 'ListAdvancedSearchProducts' я выбираю текущую строку
				Тогда открылось окно "1C:KP GU PROF for 12 months (Product range)"
				И я перехожу к закладке с именем 'PageProductAttributes'
				Тогда открылось окно "1C:KP GU PROF for 12 months (Product range)"
				И я разворачиваю группу с именем 'СворачиваемаяMainParametersGroupУчета'
				И из выпадающего списка с именем 'ProductKind' я выбираю по строке "VA - Other"
				И я нажимаю на кнопку с именем 'FormWriteAndClose'
				Если открылось окно 'Rate1 VAT применZ2етFrom1Z2 From1:' Тогда
					И в поле с именем 'InputFld' я ввожу текст '1/1/2021'
					И я нажимаю на кнопку с именем 'OK'
					Тогда открылось окно "1С:FN ГУ PРОФ for * месяцев (Product range)"
					И я нажимаю на кнопку с именем 'FormWriteAndClose'
				И я жду закрытия окна "1C:KP GU PROF for 12 months (Product range) *" в течение 20 секунд
