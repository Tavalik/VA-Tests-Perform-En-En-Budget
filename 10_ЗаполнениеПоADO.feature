#language: ru
@tree


Функционал: 10. Расчет показателей с заполнением по ADO

	Как Администратор я хочу
	Проверить, что данные по ADO загружаются в экземпляры отчетов

Контекст: 

	И я закрыл все окна клиентского приложения

Сценарий: 10.00 Определение типа приложения

	И я закрываю TestClient "CPM - Budget"
	И я подключаю TestClient "CPM - Budget" логин "Administrator" пароль ''
	Пусть Инициализация переменных

Сценарий: 10.01 Создание информационных баз

	И Я создаю тип информационной базы с именем "VA - ADO Import (Excel)" с версией "Connect via ADO"

	И Я создаю внешнюю информационную базу "VA - ADO Import (Excel)" тип "VA - ADO Import (Excel)" каталог "$КаталогПроекта$\Макеты\10\ADO_En" тип хранилища 'Excel'

Сценарий: 10.02 Настройка информационных баз

	* Включение управления НСИ
		И В командном интерфейсе я выбираю "General catalogs and settings" "General settings"
		Тогда открылось окно "General settings*"
		И я устанавливаю флаг с именем 'UseMasterDataManagement'
		И я нажимаю на кнопку с именем 'FormWriteAndClose'
		И я жду закрытия окна "General settings*" в течение 20 секунд

	И В командном интерфейсе я выбираю "Integration and master data management" "Infobase types"
	И Я в списке "Infobase types" по полю "Description" ищу и выбираю элемент "VA - ADO Import (Excel)" "At beginning of line"
	Тогда открылось окно "VA - ADO Import (Excel) (Infobase type)"
	И из выпадающего списка с именем 'DefaultEIB' я выбираю по строке "VA - ADO Import (Excel)"
	И я нажимаю на кнопку с именем 'FormWrite'
	Тогда открылось окно "VA - ADO Import (Excel) (Infobase type)"
	И В текущем окне я нажимаю кнопку командного интерфейса "ADO tables"
	И в таблице 'List' я нажимаю на кнопку с именем 'UpdateListOfTables'
	Когда открылось окно "VA - ADO Import (Excel) (Infobase type)"
	И В текущем окне я нажимаю кнопку командного интерфейса "Correspondence with external infobases"
	
	* Номенклатура
		И я нажимаю на кнопку с именем 'FormCreate'
		Тогда открылось окно "Correspondence with external infobases (create)"
		И я нажимаю кнопку выбора у поля с именем 'ObjectDetailsEIB'
		Тогда открылось окно "ADO tables"
		И в таблице 'List' я выбираю текущую строку
		Тогда открылось окно "Correspondence with external infobases (create) *"
		И из выпадающего списка с именем 'ConsolidationObjectType' я выбираю точное значение "Catalog"
		И я нажимаю кнопку выбора у поля с именем 'CrntObjectDetails'
		Тогда открылось окно "Infobase catalogs"
		И в таблице 'List' я перехожу к строке:
			| "Not in the configuration" | "Under approval" | "Catalog"   |
			| "No"                        | "No"         | "Product range" |
		И в таблице 'List' я выбираю текущую строку
		* Наименование
			Тогда открылось окно "Correspondence with external infobases (create) *"
			И в таблице 'ComplianceTable' я перехожу к строке:
				| "Field"         |
				| "Description" |
			И в таблице 'ComplianceTable' я активизирую поле с именем 'ComplianceTableFillingMethod'
			И в таблице 'DBDimensionsTableBox' я перехожу к строке:
				| "Used in mapping" | "Field"         |
				| "No"                          | "Product range" |
			И я выбираю пункт контекстного меню с именем 'ComplianceTableContextMenuCommandBarMapsButtonMapDimensions' на элементе формы с именем 'ComplianceTable'
		* Артикул
			И в таблице 'ComplianceTable' я перехожу к строке:
				| "Field"    |
				| "Product ID" |
			И в таблице 'ComplianceTable' я активизирую поле с именем 'ComplianceTableFillingMethod'
			И в таблице 'DBDimensionsTableBox' я перехожу к строке:
				| "Used in mapping" | "Field"    |
				| "No"                          | "Product ID" |
			И я выбираю пункт контекстного меню с именем 'ComplianceTableContextMenuCommandBarMapsButtonMapDimensions' на элементе формы с именем 'ComplianceTable'	
			И в таблице 'ComplianceTable' я перехожу к строке:
				| "Source" | "Key" | "Field"    | "Filling method" |
				| "Product ID"  | "No"      | "Product ID" | "Source field"    |
			И в таблице 'ComplianceTable' я активизирую поле с именем 'MapTableOfKeyOne'
			И в таблице 'ComplianceTable' я изменяю флаг с именем 'MapTableOfKeyOne'
			И в таблице 'ComplianceTable' я завершаю редактирование строки
		* Вид номенклатуры
			Если 'NOT $$ЭтоPerform$$' Тогда
				Когда открылось окно "Correspondence with external infobases (create) *"
				И в таблице 'ComplianceTable' я перехожу к строке:
					| "Field"             |
					| "Вид номенклатуры" |
				И в таблице 'ComplianceTable' я активизирую поле с именем 'ComplianceTableFillingMethod'
				И в таблице 'ComplianceTable' я выбираю текущую строку
				И в таблице 'ComplianceTable' из выпадающего списка с именем 'ComplianceTableFillingMethod' я выбираю точное значение "Fixed value"
				И в таблице 'ComplianceTable' я завершаю редактирование строки
				И в таблице 'ComplianceTable' я активизирую поле с именем 'MappingTableEIBAlias'
				И в таблице 'ComplianceTable' я выбираю текущую строку
				И Я в списке "Enter a value" по полю "Description" ищу и выбираю элемент "VA - Products" "At beginning of line"
		* Номенклатурная группа
			Если 'NOT $$IsERPCPM$$' Тогда
				Когда открылось окно "Correspondence with external infobases (create) *"
				И в таблице 'ComplianceTable' я перехожу к строке:
					| "Field"                  |
					| "Product range group" |
				И в таблице 'ComplianceTable' я активизирую поле с именем 'ComplianceTableFillingMethod'
				И в таблице 'ComplianceTable' я выбираю текущую строку
				И в таблице 'ComplianceTable' из выпадающего списка с именем 'ComplianceTableFillingMethod' я выбираю точное значение "Fixed value"
				И в таблице 'ComplianceTable' я завершаю редактирование строки
				И в таблице 'ComplianceTable' я активизирую поле с именем 'MappingTableEIBAlias'
				И в таблице 'ComplianceTable' я выбираю текущую строку
				И Я в списке "Enter a value" по полю "Description" ищу и выбираю элемент "VA - Product range group" "At beginning of line"	
		* Единица измерения
			Когда открылось окно "Correspondence with external infobases (create) *"
			Если '$$IsERPCPM$$' Тогда
				И в таблице 'ComplianceTable' я перехожу к строке:
					| "Field"             |
					| "Unit хранения" |
			Иначе
				И в таблице 'ComplianceTable' я перехожу к строке:
					| "Field"    |
					| "Unit" |
			И в таблице 'ComplianceTable' я активизирую поле с именем 'ComplianceTableFillingMethod'
			И в таблице 'ComplianceTable' я выбираю текущую строку
			И в таблице 'ComplianceTable' из выпадающего списка с именем 'ComplianceTableFillingMethod' я выбираю точное значение "Fixed value"
			И в таблице 'ComplianceTable' я завершаю редактирование строки
			И в таблице 'ComplianceTable' я активизирую поле с именем 'MappingTableEIBAlias'
			И в таблице 'ComplianceTable' я выбираю текущую строку
			Если '$$IsERPCPM$$' Тогда
				И Я в списке "Enter a value" по полю "Description" ищу и выбираю элемент "PCs" "At beginning of line"	
			Иначе
				И Я в списке "Enter a value" по полю "Description" ищу и выбираю элемент "Piece" "At beginning of line"
		* Корневой каталог
			Если '$$IsCPM$$' Тогда				
				И я нажимаю кнопку выбора у поля с именем 'RootDirectory1'
				И Я в списке 'Catalog.Products' по полю "Reference" ищу элемент "VA - Products" "At beginning of line"
				И в таблице 'List' я нажимаю на кнопку с именем 'ListChoose'
				Тогда элемент формы с именем 'RootDirectory1' стал равен "VA - Products"			
		И я нажимаю на кнопку с именем 	'FormWriteAndClose'
		И я жду закрытия окна "Correspondence with external infobases (create) *" в течение 20 секунд

	Когда открылось окно "VA - ADO Import (Excel) (Infobase type)"
	И я нажимаю на кнопку с именем 'FormCreate'
	Тогда открылось окно "Correspondence with external infobases (create)"
	И из выпадающего списка с именем 'ObjectDetailsEIB' я выбираю точное значение "Sheet1$"
	И из выпадающего списка с именем 'ConsolidationObjectType' я выбираю точное значение "Catalog"
	И я нажимаю кнопку выбора у поля с именем 'CrntObjectDetails'
	Тогда открылось окно "Infobase catalogs"
	И в таблице 'List' я перехожу к строке:
		| "Not in the configuration" | "Under approval" | "Catalog"                |
		| "No"                        | "Yes"          | "Income and expense items" |
	И в таблице 'List' я выбираю текущую строку
	Тогда открылось окно "Correspondence with external infobases (create) *"
	И в таблице 'DBDimensionsTableBox' я перехожу к строке:
		| "Used in mapping" | "Field"         |
		| "No"                          | "Activity" |
	И в таблице 'ComplianceTable' я перехожу к строке:
		| "Field"         |
		| "Description" |
	И в таблице 'ComplianceTable' я активизирую поле с именем 'ComplianceTableFillingMethod'
	И я выбираю пункт контекстного меню с именем 'ComplianceTableContextMenuCommandBarMapsButtonMapDimensions' на элементе формы с именем 'ComplianceTable'
	И в таблице 'ComplianceTable' я перехожу к строке:
		| "Field" |
		| "Code"  |
	И в таблице 'ComplianceTable' я перехожу к строке:
		| "Source"     | "Key" | "Field"         | "Filling method" |
		| "Activity" | "No"      | "Description" | "Source field"    |
	И в таблице 'ComplianceTable' я активизирую поле с именем 'MapTableOfKeyOne'
	И в таблице 'ComplianceTable' я изменяю флаг с именем 'MapTableOfKeyOne'
	И в таблице 'ComplianceTable' я завершаю редактирование строки
	* Корневой каталог
		И я нажимаю кнопку выбора у поля с именем 'RootDirectory1'
		И Я в списке 'Catalog.IncomeAndExpenseItems' по полю "Reference" ищу элемент "VA - Income and expense items" "At beginning of line"
		И в таблице 'List' я нажимаю на кнопку с именем 'ListChoose'
		Тогда элемент формы с именем 'RootDirectory1' стал равен "VA - Income and expense items"
	И я нажимаю на кнопку с именем 'FormWriteAndClose'
	И я жду закрытия окна "Correspondence with external infobases (create) *" в течение 20 секунд
	
	Тогда открылось окно "VA - ADO Import (Excel) (Infobase type)"
	И В текущем окне я нажимаю кнопку командного интерфейса "Main"
	И В текущем окне я нажимаю кнопку командного интерфейса "ADO tables"
	И в таблице 'List' я нажимаю на кнопку с именем 'ListDataView'
	Тогда открылось окно "ADO table view form"
	И Я закрываю окно "ADO table view form"
	Тогда открылось окно "VA - ADO Import (Excel) (Infobase type)"
	И Я закрываю окно "VA - ADO Import (Excel) (Infobase type)"
	Тогда открылось окно "Infobase types"
	И Я закрываю окно "Infobase types"
			
Сценарий: 10.03 Создание вида отчета

	И Я создаю вид отчета с именем "VA - ADO Import (Excel)" и родителем "VA - Report group"

	* Настройка структуры отчета
		И Я открываю контруктор отчета с именем "VA - ADO Import (Excel)"
		И Я в конструкторе отчета добавляю строку с именем "Sales" 
		И Я в конструкторе отчета добавляю колонку с именем "Price" 
		И Я в конструкторе отчета добавляю колонку с именем "Count"
		И Я в конструкторе отчета добавляю колонку с именем "Product ID"
		И Я в конструкторе отчета в ячейке 'R2C4' меняю свойство показателя 'ValueType' на "Line"
		И Я в конструкторе отчета добавляю аналитику с кодом "VA0Product" в ячейку 'R2C2'
		И Я в конструкторе отчета добавляю аналитику с кодом "VA0IEItems" в ячейку 'R2C3'

	* Настройки обмена файлами
		Тогда открылось окно "Report wizard"
		И из выпадающего списка с именем 'WorkMode' я выбираю точное значение "Indicators calculation formulas"
		И я нажимаю на кнопку открытия поля с именем 'ProcessingRule'
		Тогда открылось окно "VA - ADO Import (Excel) (Calculation rules)"
		И из выпадающего списка с именем 'DBType' я выбираю по строке "VA - ADO Import (Excel)"
		И я нажимаю на кнопку открытия поля с именем 'DBType'
		Тогда открылось окно "VA - ADO Import (Excel) (Infobase type)"
		И я нажимаю на кнопку открытия поля с именем 'DefaultEIB'
		Тогда открылось окно "VA - ADO Import (Excel) (External infobases)"
		И я нажимаю на кнопку с именем 'OpenCompaniesFilesExchangeSettings'
		И Я добавляю элемент пути к файлам организаций для типа 'ReportKind' объект "VA - ADO Import (Excel)" значение "VA_LoadingADO"
		Тогда открылось окно "Company file path items: List form"
		И Я закрываю окно "Company file path items: List form"		
		Тогда открылось окно "VA - ADO Import (Excel) (External infobases)"
		И Я закрываю окно "VA - ADO Import (Excel) (External infobases)"
		Тогда открылось окно "VA - ADO Import (Excel) (Infobase type)"
		И я нажимаю на кнопку с именем 'FormWriteAndClose'
		И я жду закрытия окна "VA - ADO Import (Excel) (Infobase type)" в течение 20 секунд
		Тогда открылось окно "VA - ADO Import (Excel) (Calculation rules) *"
		И я нажимаю на кнопку с именем 'FormWriteAndClose'
		И я жду закрытия окна "VA - ADO Import (Excel) (Calculation rules) *" в течение 20 секунд

	* Настройка формул
		* Цена
			Тогда открылось окно "Report wizard"
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R2C2'
			И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
			И я нажимаю на кнопку с именем 'AddOperand1'
			Тогда открылось окно "Data sources"
			И я нажимаю на кнопку с именем 'FormCreate'
			Тогда открылось окно "Data source (create)"
			И из выпадающего списка с именем 'MethodOfObtaining' я выбираю точное значение "Tables from ADO connection"
			И я нажимаю кнопку выбора у поля с именем 'ADOTable'
			Тогда открылось окно "ADO tables"
			И в таблице 'List' я выбираю текущую строку
			Тогда открылось окно "Data source (create) *"
			И в таблице 'FieldsTreeDB' я разворачиваю текущую строку
			И в таблице 'FieldsTreeDB' я перехожу к строке:
				| "Field" |
				| "Price" |
			И в таблице 'ComplianceTable' я перехожу к строке:
				| "Destination dimension" | "Column name"  | "Filling method" |
				| "Value"            | "[Count]" | "Source field"    |
			И в таблице 'ComplianceTable' я активизирую поле с именем 'MapTableDBAlias'
			И я выбираю пункт контекстного меню с именем 'ButtonMapDimensions' на элементе формы с именем 'ComplianceTable'
			И я перехожу к закладке с именем 'FiltersPage'
			И в таблице 'FieldsTreeDB' я перехожу к строке:
				| "Field"   |
				| "Period" |
			И я нажимаю на кнопку с именем 'AddConditionItem'
			И в таблице 'TreeOfFilterParametersDB' я активизирую поле с именем 'ParameterCalculationMethod'
			И в таблице 'TreeOfFilterParametersDB' я выбираю текущую строку
			И в таблице 'TreeOfFilterParametersDB' из выпадающего списка с именем 'ParameterCalculationMethod' я выбираю точное значение "In interval"
			И в таблице 'TreeOfFilterParametersDB' я активизирую поле с именем 'DefiningMethodClarification'
			И в таблице 'TreeOfFilterParametersDB' я нажимаю кнопку выбора у реквизита с именем 'DefiningMethodClarification'
			Тогда открылось окно "Specify interval limit calculation methods"
			И я нажимаю на кнопку с именем 'FormWrite'
			Тогда открылось окно "Data source (create) *"
			И в таблице 'TreeOfFilterParametersDB' я завершаю редактирование строки
			И я нажимаю на кнопку с именем 'FormWriteAndClose'
			И я жду закрытия окна "Data source (create) *" в течение 20 секунд
			Тогда открылось окно "Data sources"
			И в таблице 'List' я выбираю текущую строку
			Тогда открылось окно "Report wizard *"
			И я нажимаю на кнопку с именем 'WriteAndCollapse'
		* Количества
			Тогда открылось окно "Report wizard"
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R2C3'
			И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
			И я нажимаю на кнопку с именем 'AddOperand1'
			Тогда открылось окно "Data sources"
			И я нажимаю на кнопку с именем 'FormCreate'
			Тогда открылось окно "Data source (create)"
			И из выпадающего списка с именем 'MethodOfObtaining' я выбираю точное значение "Tables from ADO connection"
			И из выпадающего списка с именем 'ADOTable' я выбираю точное значение "Sheet1$"
			И я перехожу к закладке с именем 'FiltersPage'
			И в таблице 'FieldsTreeDB' я разворачиваю текущую строку
			И в таблице 'FieldsTreeDB' я перехожу к строке:
				| "Field"   |
				| "Period" |
			И я нажимаю на кнопку с именем 'AddConditionItem'
			И в таблице 'TreeOfFilterParametersDB' я активизирую поле с именем 'ParameterCalculationMethod'
			И в таблице 'TreeOfFilterParametersDB' я выбираю текущую строку
			И в таблице 'TreeOfFilterParametersDB' из выпадающего списка с именем 'ParameterCalculationMethod' я выбираю точное значение "In interval"
			И в таблице 'TreeOfFilterParametersDB' я активизирую поле с именем 'DefiningMethodClarification'
			И в таблице 'TreeOfFilterParametersDB' я нажимаю кнопку выбора у реквизита с именем 'DefiningMethodClarification'
			Тогда открылось окно "Specify interval limit calculation methods"
			И я нажимаю на кнопку с именем 'FormWrite'
			Тогда открылось окно "Data source (create) *"
			И в таблице 'TreeOfFilterParametersDB' я завершаю редактирование строки
			И я нажимаю на кнопку с именем 'FormWriteAndClose'
			И я жду закрытия окна "Data source (create) *" в течение 20 секунд
			Тогда открылось окно "Data sources"
			И в таблице 'List' я выбираю текущую строку
			Тогда открылось окно "Report wizard *"
			И я нажимаю на кнопку с именем 'WriteAndCollapse'
		* Артикул
			Тогда открылось окно "Report wizard"
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R2C4'
			И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
			И я нажимаю на кнопку с именем 'AddOperand1'
			Тогда открылось окно "Data sources"
			И я нажимаю на кнопку с именем 'FormCreate'
			Тогда открылось окно "Data source (create)"
			И из выпадающего списка с именем 'MethodOfObtaining' я выбираю точное значение "Tables from ADO connection"
			И из выпадающего списка с именем 'ADOTable' я выбираю точное значение "Sheet1$"
			И в таблице 'FieldsTreeDB' я разворачиваю текущую строку
			И в таблице 'FieldsTreeDB' я перехожу к строке:
				| "Field"    |
				| "Product ID" |
			И в таблице 'ComplianceTable' я перехожу к строке:
				| "Destination dimension" | "Filling method" |
				| "Value"            | "Source field"    |
			И я выбираю пункт контекстного меню с именем 'ButtonMapDimensions' на элементе формы с именем 'ComplianceTable'
			И я перехожу к закладке с именем 'FiltersPage'
			И в таблице 'FieldsTreeDB' я разворачиваю текущую строку
			И в таблице 'FieldsTreeDB' я перехожу к строке:
				| "Field"   |
				| "Period" |
			И я нажимаю на кнопку с именем 'AddConditionItem'
			И в таблице 'TreeOfFilterParametersDB' я активизирую поле с именем 'ParameterCalculationMethod'
			И в таблице 'TreeOfFilterParametersDB' я выбираю текущую строку
			И в таблице 'TreeOfFilterParametersDB' из выпадающего списка с именем 'ParameterCalculationMethod' я выбираю точное значение "In interval"
			И в таблице 'TreeOfFilterParametersDB' я активизирую поле с именем 'DefiningMethodClarification'
			И в таблице 'TreeOfFilterParametersDB' я нажимаю кнопку выбора у реквизита с именем 'DefiningMethodClarification'
			Тогда открылось окно "Specify interval limit calculation methods"
			И я нажимаю на кнопку с именем 'FormWrite'
			Тогда открылось окно "Data source (create) *"
			И в таблице 'TreeOfFilterParametersDB' я завершаю редактирование строки
			И я нажимаю на кнопку с именем 'FormWriteAndClose'
			И я жду закрытия окна "Data source (create) *" в течение 20 секунд
			Тогда открылось окно "Data sources"
			И в таблице 'List' я выбираю текущую строку
			Тогда открылось окно "Report wizard *"
			И я нажимаю на кнопку с именем 'WriteAndCollapse'
			Тогда открылось окно "Report wizard"
			И Я закрываю окно "Report wizard"

	* Создаем бланк
		И Я Для вида отчета "VA - ADO Import (Excel)" создаю бланк по умолчанию		

Сценарий: 10.04 Настройка справочников ИБ

	И В командном интерфейсе я выбираю "General catalogs and settings" "Catalogs"
	Тогда открылось окно "Current infobase catalogs"	
	И в таблице 'List' я перехожу к строке:
		| "Catalog"   |
		| "Product range" |
	И в таблице 'List' я выбираю текущую строку
	Тогда открылось окно "Product range (Infobase catalogs)"
	И Для каждой строки таблицы 'Attributes' я выполняю
		И в таблице 'Attributes' я активизирую поле с именем 'AttributesIsRequired'
		И в таблице 'Attributes' я снимаю флаг с именем 'AttributesIsRequired'	
	И я нажимаю на кнопку с именем 'FormWriteAndClose'
	И я жду закрытия окна "Product range (Infobase catalogs) *" в течение 20 секунд
	Тогда открылось окно "Current infobase catalogs"
	И в таблице 'List' я перехожу к строке:
		| "Catalog"     |
		| "Income and expense items" |
	И в таблице 'List' я выбираю текущую строку
	Тогда открылось окно "Income and expense items (Infobase catalogs)"
	И Для каждой строки таблицы 'Attributes' я выполняю
		И в таблице 'Attributes' я активизирую поле с именем 'AttributesIsRequired'
		И в таблице 'Attributes' я снимаю флаг с именем 'AttributesIsRequired'	
	И я нажимаю на кнопку с именем 'FormWriteAndClose'
	И Я закрываю окно "Current infobase catalogs"

Сценарий: 10.05 Создание экземпляра отчета

	И Я создаю экземпляр отчета для вида отчета "VA - ADO Import (Excel)" сценарий "VA - Main scenario" период '1/1/2024' '3/31/2024' периодичность "Month" организация "Mercury LLC" проект '' аналитики '' '' '' '' '' '' 		
	
	* Устанавливаем ИБ
		Тогда открылось окно '$WindowTitle$'
		И я нажимаю на кнопку с именем 'FormOpenSettings'
		Тогда открылось окно "Settings документа"
		И я перехожу к закладке с именем 'GroupPageReportSettings'
		И я устанавливаю флаг с именем 'ИндивидуальныеSettings'
		Тогда открылось окно "1C:Enterprise"
		И я нажимаю на кнопку с именем 'Button0'				
		И из выпадающего списка с именем 'UsedIB' я выбираю точное значение "VA - ADO Import (Excel)"
		И я нажимаю на кнопку с именем 'FormApplyANDClose'
	
	* Делаем расчет
		Тогда открылось окно '$WindowTitle$'
		И я нажимаю на кнопку с именем 'FormFillByDefault'
		Тогда открылось окно '$WindowTitle$'
		Дано табличный документ 'SpreadsheetFieldTemlate' равен макету "Макеты\10\ВА_ИмпортADO.mxl"
		И я нажимаю на кнопку с именем 'Write'
		Тогда открылось окно '$WindowTitle$'
		И я нажимаю на кнопку с именем 'FormOpenDocumentRegisterRecordsFlatTab'
		Тогда открылось окно "Flat table of indicator values"
		И я жду когда в табличном документе 'ReportSpreadsheetDocument' заполнится ячейка 'R2C1' в течение 60 секунд
		Дано Табличный документ 'ReportSpreadsheetDocument' равен макету "Макеты\10\ВА_ИмпортADO_Движения.mxl" по шаблону
		И Я закрываю окно "Flat table of indicator values"
		Тогда открылось окно '$WindowTitle$'
		И Я закрываю окно '$WindowTitle$'

Сценарий: 10.06 Изменим вид номенклатуры

	Если '$$ЭтоPerform$$' Тогда
		И Я Для номенклатуры с именем "2C:KP GU PROF for 12 months" для реквизита 'Product_Category' выбираю значение '' в группе ''
		И Я Для номенклатуры с именем "2C:KP GU PROF for 6 months" для реквизита 'Product_Category' выбираю значение '' в группе ''

	ИначеЕсли '$$IsCPM$$' Тогда 
		И В командном интерфейсе я выбираю "Catalogs" "Product range"
		Тогда открылось окно "Product range"
		И в таблице 'List' я перехожу к строке:
			| "Description"      |
			| "VA - Products" |
		И в таблице  'List' я перехожу на один уровень вниз

		* 1С:КП ГУ ПРОФ на 12 месяцев
			Если в таблице 'List' есть строка Тогда
				| "Product ID"  | 'Unit' | "Description"                |
				| "30000012" | 'PCs'      | "2C:KP GU PROF for 12 months" |
				И в таблице 'List' я перехожу к строке:
					| "Product ID"  | 'Unit' | "Description"                |
					| "30000012" | 'PCs'      | "2C:KP GU PROF for 12 months" |
				И в таблице 'List' я выбираю текущую строку
				Тогда открылось окно "2C:KP GU PROF for 12 months (Product range)"
				И из выпадающего списка с именем 'ProductKind' я выбираю по строке 'DimenKind - Other'
				И я нажимаю на кнопку с именем 'FormWriteAndClose'
				И я жду закрытия окна "2C:KP GU PROF for 12 months (Product range) *" в течение 20 секунд

		* 1С:КП ГУ ПРОФ на 6 месяцев
			Если в таблице 'List' есть строка Тогда
				| "Product ID" | 'Unit' | "Description"               |
				| "3000006" | 'PCs'      | "2C:KP GU PROF for 6 months" |
				И в таблице 'List' я перехожу к строке:
					| "Product ID" | 'Unit' | "Description"               |
					| "3000006" | 'PCs'      | "2C:KP GU PROF for 6 months" |
				И в таблице 'List' я выбираю текущую строку
				Тогда открылось окно "2C:KP GU PROF for 6 months (Product range)"
				И из выпадающего списка с именем 'ProductKind' я выбираю по строке 'DimenKind - Other'
				И я нажимаю на кнопку с именем 'FormWriteAndClose'
				И я жду закрытия окна "2C:KP GU PROF for 6 months (Product range) *" в течение 20 секунд	
		
	ИначеЕсли '$$IsERPCPM$$' Тогда
		И В командном интерфейсе я выбираю "Quick menu" "Product range"
		Тогда открылось окно "Product range"
		
		* 1С:КП ГУ ПРОФ на 6 месяцев
			И в таблице 'KindsНоменклатуры' я перехожу к строке:
				| "Description"      |
				| "VA - Products" |
			Если в таблице 'ListAdvancedSearchProducts' есть строка Тогда
				| "Product ID" | "Description"               |
				| "3000006" | "2C:KP GU PROF for 6 months" |
				И в таблице 'ListAdvancedSearchProducts' я перехожу к строке:
					| "Product ID" | "Description"               |
					| "3000006" | "2C:KP GU PROF for 6 months" |
				И в таблице 'ListAdvancedSearchProducts' я выбираю текущую строку
				Тогда открылось окно "2C:KP GU PROF for 6 months (Product range)"
				И я перехожу к закладке с именем 'PageProductAttributes'
				Если открылось окно 'Полезный совет' Тогда
					И я нажимаю на кнопку с именем 'Button0'
				Тогда открылось окно "2C:KP GU PROF for 6 months (Product range)"
				И я разворачиваю группу с именем 'СворачиваемаяMainParametersGroupУчета'
				И из выпадающего списка с именем 'ProductKind' я выбираю по строке 'DimenKind - Other'
				И я нажимаю на кнопку с именем 'FormWriteAndClose'				
				Если открылось окно 'Rate1 VAT применZ2етFrom1Z2 From1:' Тогда
					И в поле с именем 'InputFld' я ввожу текст '1/1/2024'
					И я нажимаю на кнопку с именем 'OK'
					Тогда открылось окно "1С:FN ГУ PРОФ for * месяцев (Product range)"
					И я нажимаю на кнопку с именем 'FormWriteAndClose'
				И я жду закрытия окна "2C:KP GU PROF for 6 months (Product range) *" в течение 20 секунд
		
		* 1С:КП ГУ ПРОФ на 12 месяцев
			И в таблице 'KindsНоменклатуры' я перехожу к строке:
				| "Description"      |
				| "VA - Products" |
			Если в таблице 'ListAdvancedSearchProducts' есть строка Тогда
				| "Product ID"  | "Description"                |
				| "30000012" | "2C:KP GU PROF for 12 months" |
				И в таблице 'ListAdvancedSearchProducts' я перехожу к строке:
					| "Product ID"  | "Description"                |
					| "30000012" | "2C:KP GU PROF for 12 months" |
				И в таблице 'ListAdvancedSearchProducts' я выбираю текущую строку
				Тогда открылось окно "2C:KP GU PROF for 12 months (Product range)"
				И я перехожу к закладке с именем 'PageProductAttributes'
				Тогда открылось окно "2C:KP GU PROF for 12 months (Product range)"
				И я разворачиваю группу с именем 'СворачиваемаяMainParametersGroupУчета'
				И из выпадающего списка с именем 'ProductKind' я выбираю по строке 'DimenKind - Other'
				И я нажимаю на кнопку с именем 'FormWriteAndClose'
				Если открылось окно 'Rate1 VAT применZ2етFrom1Z2 From1:' Тогда
					И в поле с именем 'InputFld' я ввожу текст '1/1/2024'
					И я нажимаю на кнопку с именем 'OK'
					Тогда открылось окно "1С:FN ГУ PРОФ for * месяцев (Product range)"
					И я нажимаю на кнопку с именем 'FormWriteAndClose'
				И я жду закрытия окна "2C:KP GU PROF for 12 months (Product range) *" в течение 20 секунд
