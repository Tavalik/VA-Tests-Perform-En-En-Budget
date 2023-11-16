#language: ru

@tree

Функционал: 20. Тестирование подсистемы согласования

	Как Администратор я хочу
	Протестировать подсистему согласования 
	чтобы исключить ошибки при разработке   

Контекст:

	И я закрыл все окна клиентского приложения

Сценарий: 20.00 Определение типа приложения
	
	И я закрываю TestClient "CPM - Budget"
	И я подключаю TestClient "CPM - Budget" логин "Administrator" пароль ''
	Пусть Инициализация переменных

Сценарий: 20.01 Создание ролей

	* Создать роли и добавить их в матрицу адресации
		И Я создаю роль контактных лиц "VA - Addressing by Role"
		И Я создаю роль контактных лиц "VA - The role of extended addressing"

		И Я создаю элемент расширенной адресации "VA - Extended Addressing" роль "VA - The role of extended addressing"

		И Я добавляю строку в матрицу адресации роль "VA - Addressing by Role" пользователь "Budgeting2"
		И Я добавляю строку в матрицу адресации роль "VA - The role of extended addressing" пользователь "Budgeting3"

	* Создать роль Суперпользователя
		И Я создаю роль контактных лиц "Superuser"

		И В командном интерфейсе я выбираю "General catalogs and settings" "General settings"
		Тогда открылось окно "General settings*"
		И я нажимаю кнопку выбора у поля с именем 'RoleSuperUser'
		И Я в списке "Contact person roles" по полю "Description" ищу и выбираю элемент "Superuser" "Exact match"
		Тогда открылось окно "General settings *"
		И я нажимаю на кнопку с именем 'FormWriteAndClose'
		И я жду закрытия окна "General settings *" в течение 20 секунд
		
		И Я добавляю строку в матрицу адресации роль "Superuser" пользователь "Administrator"
		И Я добавляю строку в матрицу адресации роль "Superuser" пользователь "Budgeting4"

Сценарий: 20.02 Настройка документа ИБ	

	И В командном интерфейсе я выбираю "General catalogs and settings" "Documents"
	
	Тогда открылось окно "Current infobase documents"
	И в таблице 'List' я нажимаю на кнопку с именем 'ListFind'
	Тогда открылось окно "Find"
	И из выпадающего списка с именем 'FieldSelector' я выбираю точное значение "Document"
	И я меняю значение переключателя с именем 'CompareType' на "Anywhere in the line"
	И в поле с именем 'Pattern' я ввожу текст "Report instance"

	И я нажимаю на кнопку с именем 'Find'
	Тогда открылось окно "Current infobase documents"
	И я жду, что в таблице 'List' количество строк будет "равно" 1 в течение 20 секунд
	И в таблице 'List' я выбираю текущую строку

	Тогда открылось окно "Report instance (Infobase document)"
	И я перехожу к закладке с именем 'ApprovalGroup'
	И я устанавливаю флаг с именем 'ShouldDivideByCompanies'
	И я нажимаю на кнопку с именем 'FormWriteAndClose'
	И я жду закрытия окна "Report instance (Infobase document) *" в течение 20 секунд
	Тогда открылось окно "Current infobase documents"
	И Я закрываю окно "Current infobase documents"

Сценарий: 20.03 Создание вида отчета

	* Создаем вид отчета
		И Я создаю вид отчета с именем "VA - Coordination" и родителем "VA - Report group"

	* Настраиваем структуру
		И я открываю контруктор отчета с именем "VA - Coordination"
		И Я в конструкторе отчета добавляю строки
			| "Description" |
			| "Line 1"     |
			| "Line 2"     |
			| "Line 3"     |
		И Я в конструкторе отчета добавляю колонки
			| "Description" |
			| "Quantity"   |
			| "Price"         |
			| "Amount"        |

	* Настраиваем формулы
		И Я в конструкторе отчета для ячейки 'R2C4' задаю формулу произведение ячеек 'R2C2' 'R2C3'
		И Я в конструкторе отчета для ячейки 'R3C4' задаю формулу произведение ячеек 'R3C2' 'R3C3'
		И Я в конструкторе отчета для ячейки 'R4C4' задаю формулу произведение ячеек 'R4C2' 'R4C3'

	* Закрываем конструктор
		Когда открылось окно "Report wizard"
		И Я закрываю окно "Report wizard"
		
	* Создаем бланк
		И Я Для вида отчета "VA - Coordination" создаю бланк по умолчанию	

Сценарий: 20.04 Создание экземпляра отчета

	И Я создаю экземпляр отчета для вида отчета "VA - Coordination" сценарий "VA - Main scenario" период '1/1/2024' '3/31/2024' периодичность "Month" организация "Mercury LLC" проект '' аналитики '' '' '' '' '' ''

	И Я ввожу значение '3.00000' в ячейку 'R6C2'
	И Я ввожу значение '4.00000' в ячейку 'R7C2'
	И Я ввожу значение '5.00000' в ячейку 'R8C2'
	И Я ввожу значение '100.00000' в ячейку 'R6C3'
	И Я ввожу значение '200.00000' в ячейку 'R7C3'
	И Я ввожу значение '300.00000' в ячейку 'R8C3'

	Когда открылось окно '$WindowTitle$'
	И я нажимаю на кнопку с именем 'WriteAndClose'
	И я жду закрытия окна '$WindowTitle$' в течение 20 секунд

Сценарий: 20.05 Создание шаблона процесса согласования

	* Проверить наличие группы шаблонов
		И В командном интерфейсе я выбираю "Processes and approval" "Process templates"
		Тогда открылось окно "Universal process templates"
		И Я в списке "Universal process templates" по полю "Description" ищу элемент "VA - Approval Process Group" "Exact match"
		Если в таблице 'List' количество строк "=" 0 Тогда
			И я нажимаю на кнопку с именем 'FormCancelSearch'
			И я нажимаю на кнопку с именем 'FormCreateFolder'
			Тогда открылось окно "Universal process templates (create folder)"
			И в поле с именем 'Description' я ввожу текст "VA - Approval Process Group"
			И я нажимаю на кнопку с именем 'FormWriteAndClose'
			И я жду закрытия окна "Universal process templates (create folder) *" в течение 20 секунд

	* Удаляем существующие шаблоны
		Тогда открылось окно "Universal process templates"
		И Я в списке "Universal process templates" по полю "Description" ищу элемент "VA - Approval Process Template" "Exact match"
		И пока в таблице 'List' количество строк ">" 0 Тогда
			И в таблице 'List' я выбираю текущую строку
			Тогда открылось окно "Editing process stages: VA - Approval Process Template"
			И я нажимаю на кнопку с именем 'FormOpenProcessProperties'
			Тогда открылось окно "VA - Approval Process Template (Universal process template)"
			И Я запоминаю значение выражения '"DimenKind - (удалить) " + StrReplace(New UUID, "-", "")' в переменную 'UID_Description'
			И в поле с именем 'Description' я ввожу значение переменной 'UID_Description'
			И я нажимаю на кнопку с именем 'FormWrite'
			Тогда открылось окно "$UID_Description$ (Universal process template)"
			И я нажимаю на кнопку с именем 'FormSetDeletionMark'
			Тогда открылось окно "1C:Enterprise"
			И я нажимаю на кнопку с именем 'Button0'
			Тогда открылось окно "$UID_Description$ (Universal process template)"
			И я нажимаю на кнопку с именем 'FormWriteAndClose'
			И я жду закрытия окна "$UID_Description$ (Universal process template)" в течение 20 секунд
			Тогда открылось окно "Editing process stages: VA - Approval Process Template"
			И Я закрываю окно "Editing process stages: VA - Approval Process Template"

	* Создаем шаблон
		Тогда открылось окно "Universal process templates"
		И я нажимаю на кнопку с именем 'FormCreate'
		Тогда открылось окно "Universal process template (create)"
		И в поле с именем 'Description' я ввожу текст "VA - Approval Process Template"
		И из выпадающего списка с именем 'Parent' я выбираю по строке "VA - Approval Process Group"
		И из выпадающего списка с именем 'ProcessPurpose' я выбираю точное значение "Approval route"
		И из выпадающего списка с именем 'CatalogName' я выбираю точное значение "Current infobase document"
		И я нажимаю кнопку выбора у поля с именем 'ApprovalObjectType'
		И Я в списке "Infobase documents" по полю "Document" ищу и выбираю элемент "Report instance" "Anywhere in the line"
		Тогда открылось окно "Universal process template (create) *"
		И я нажимаю на кнопку с именем 'FormWrite'
		Тогда открылось окно "Editing process stages: VA - Approval Process Template"

	* Настраиваем схему процесса		
		И Я добавляю этап согласования с наименованием "Approval step 1" способ адресации "User" пользователь "Budgeting1" роль '' расширенная адресация ''
		И Я добавляю этап согласования с наименованием "Approval step 2" способ адресации "Role" пользователь "Budgeting2" роль "VA - Addressing by Role" расширенная адресация ''
		И Я добавляю этап согласования с наименованием "Approval step 3" способ адресации "Extended addressing" пользователь "Budgeting3" роль '' расширенная адресация "VA - Extended Addressing"
		И Я добавляю этап согласования с наименованием "Approval step 4" способ адресации "User" пользователь "Budgeting4" роль '' расширенная адресация ''
		И Я добавляю этап согласования с наименованием "Approval step 5" способ адресации "Role" пользователь "Budgeting2" роль "VA - Addressing by Role" расширенная адресация ''
		И Я добавляю этап согласования с наименованием "Approval step 6" способ адресации "Extended addressing" пользователь "Budgeting3" роль '' расширенная адресация "VA - Extended Addressing"
		И Я добавляю этап согласования с наименованием "Approval step 7" способ адресации "User" пользователь "Budgeting4" роль '' расширенная адресация ''
		И Я добавляю этап согласования с наименованием "Approval step 8" способ адресации "User" пользователь "Budgeting1" роль '' расширенная адресация ''
		И Я добавляю этап согласования с наименованием "Approval step 9" способ адресации "User" пользователь "Budgeting1" роль '' расширенная адресация ''

		И в табличном документе 'PossibleStepsTableBox' я перехожу к ячейке 'AutoConfirmation'
		И я нажимаю на кнопку с именем 'AddSelectedStep'
		Тогда открылось окно "Automatic document confirmation (Universal process step)"
		И я нажимаю на кнопку с именем 'FormWriteAndClose'
		И я жду закрытия окна "Automatic document confirmation (Universal process step)" в течение 20 секунд
		
		И в табличном документе 'PossibleStepsTableBox' я перехожу к ячейке 'ConditionalTransition'
		И я нажимаю на кнопку с именем 'AddSelectedStep'
		Тогда открылось окно "Conditional transition (Universal process step)"
		И в поле с именем 'Description' я ввожу текст "Conditional transition 1"
		И я нажимаю на кнопку с именем 'OpenConditionalTransitionSetting'
		Тогда открылось окно "Conditional transition settings"
		И в таблице 'FilterTree' я нажимаю на кнопку с именем 'FilterTreeAddDataSource'
		Тогда открылось окно "Data source (create)"
		И в поле с именем 'Description' я ввожу текст "Source 1"
		И я нажимаю кнопку выбора у поля с именем 'ReportTypeFilter'

		И Я в списке "Report types" по полю "Description" ищу элемент "VA - Coordination" "Exact match"
		И в таблице 'List' количество строк 'равно' 1
		И в таблице 'List' я выбираю текущую строку

		Тогда открылось окно "Data source (create) *"
		И я нажимаю кнопку выбора у поля с именем 'IndicatorFilter'
		Тогда открылось окно "Report indicators"
		И я меняю значение переключателя с именем 'IndicatorChoiceMode' на "Structure layout"				
		И в табличном документе 'SpreadsheetDocSelectIndicator' я перехожу к ячейке "Line3_Amount"
		И я нажимаю на кнопку с именем 'FormSelectItems'
		Тогда открылось окно "Data source (create) *"
		И я нажимаю на кнопку с именем 'FormWriteAndClose'
		И я жду закрытия окна "Data source (create) *" в течение 20 секунд
		Тогда открылось окно "Conditional transition settings *"
		И в таблице 'TransitionTableBox' я нажимаю на кнопку с именем 'TransitionTableBoxAddCondition'
		И в таблице 'FilterTree' я разворачиваю строку:
			| "Item"    |
			| "Source 1" |
		И в таблице 'FilterTree' я перехожу к строке:
			| "Item"                    |
			| "Indicator: Line 3 amount" |
		Когда открылось окно "Conditional transition settings *"
		И в таблице 'FilterTree' я нажимаю на кнопку с именем 'TransferConditionItem'
		Когда открылось окно "Conditional transition settings *"
		И в таблице 'TransitionTableBox' я активизирую поле с именем 'TransitionTableBoxValue'
		И в таблице 'TransitionTableBox' я выбираю текущую строку
		И в таблице 'TransitionTableBox' из выпадающего списка с именем 'TransitionTableBoxValue' я выбираю точное значение "Equal to"
		И в таблице 'TransitionTableBox' я активизирую поле с именем 'TransitionTableBoxFilterValue'
		И в таблице 'TransitionTableBox' в поле с именем 'TransitionTableBoxFilterValue' я ввожу текст '1536.7852'
		И в таблице 'TransitionTableBox' я завершаю редактирование строки
		Когда открылось окно "Conditional transition settings *"
		И в таблице 'TransitionTableBox' я перехожу к строке:
			| "Action" |
			| "Then"    |
		И в таблице 'TransitionTableBox' я активизирую поле с именем 'TransitionTableBoxActionDisplayText'
		И в таблице 'TransitionTableBox' я нажимаю на кнопку с именем 'TransitionTableBoxAddAction'
		И в таблице 'TransitionTableBox' я активизирую поле с именем 'TransitionTableBoxValue'
		И в таблице 'TransitionTableBox' я выбираю текущую строку
		
		И Я в списке "Universal process steps" по полю "Description" ищу элемент "Approval step 2" "Exact match"
		И в таблице 'List' количество строк 'равно' 1
		И в таблице 'List' я выбираю текущую строку

		Тогда открылось окно "Conditional transition settings *"
		И в таблице 'TransitionTableBox' я завершаю редактирование строки		
		Когда открылось окно "Conditional transition settings *"
		И в таблице 'TransitionTableBox' я перехожу к строке:
			| "Action" |
			| "Else"    |
		И в таблице 'TransitionTableBox' я активизирую поле с именем 'TransitionTableBoxActionDisplayText'
		И в таблице 'TransitionTableBox' я нажимаю на кнопку с именем 'TransitionTableBoxAddAction'
		И в таблице 'TransitionTableBox' я активизирую поле с именем 'TransitionTableBoxValue'
		И в таблице 'TransitionTableBox' я выбираю текущую строку
		
		И Я в списке "Universal process steps" по полю "Description" ищу элемент "Approval step 5" "Exact match"
		И в таблице 'List' количество строк 'равно' 1
		И в таблице 'List' я выбираю текущую строку

		Тогда открылось окно "Conditional transition settings *"
		И в таблице 'TransitionTableBox' я завершаю редактирование строки
		И я нажимаю на кнопку с именем 'FormApply'
		Тогда открылось окно "Conditional transition (Universal process step) *"
		И я нажимаю на кнопку с именем 'FormWriteAndClose'
		И я жду закрытия окна "Conditional transition (Universal process step) *" в течение 20 секунд
		
		И Я добавляю связь этапа "Approval step 1" с этапом "Approval step 9"
		И Я добавляю связь этапа "Approval step 9" с этапом "Approval step 8"
		И Я добавляю связь этапа "Approval step 8" с этапом "Conditional transition 1"
		И Я добавляю связь этапа "Approval step 2" с этапом "Approval step 3"
		И Я добавляю связь этапа "Approval step 3" с этапом "Approval step 4"
		И Я добавляю связь этапа "Approval step 4" с этапом "Automatic document confirmation"
		И Я добавляю связь этапа "Approval step 5" с этапом "Approval step 6"
		И Я добавляю связь этапа "Approval step 6" с этапом "Approval step 7"
		И Я добавляю связь этапа "Approval step 7" с этапом "Automatic document confirmation"

		И Я закрываю окно "Editing process stages: VA - Approval Process Template"
		Тогда открылось окно "VA - Approval Process Template (Universal process template)"
		И в таблице 'ProcessParameters' я активизирую поле с именем 'ProcessParametersDefaultValue'
		И я нажимаю на кнопку с именем 'FormWriteAndClose'
		И я жду закрытия окна "VA - Approval Process Template (Universal process template)" в течение 20 секунд

Сценарий: 20.06 Настройка матрицы полномочий
	
	И В командном интерфейсе я выбираю "Processes and approval" "Responsibility assignment matrix"
	Тогда открылось окно "Responsibility assignment matrix"
	И я нажимаю кнопку выбора у поля с именем 'DocumentTypeSelection'
	И Я в списке "Infobase documents" по полю "Document" ищу и выбираю элемент "Report instance" "Anywhere in the line"
	Тогда открылось окно "Responsibility assignment matrix"
	И я нажимаю кнопку выбора у поля с именем 'RegulationVersion'
	И Я в списке "Regulations for preparing reports" по полю "Description" ищу и выбираю элемент "VA - Main regulations" "Exact match"
	
	Когда открылось окно "Responsibility assignment matrix"
	И я перехожу к закладке с именем 'GroupList'

	* Удаляем существующие записи
		И в таблице 'ResponsibilitiesRegister' я нажимаю на кнопку с именем 'ResponsibilitiesRegisterListSettings'	
		Тогда открылось окно "List Options"
		И я удаляю все строки таблицы 'SettingsComposerUserSettingsItem0Filter'
		И в таблице 'SettingsComposerUserSettingsItem0Filter' я нажимаю на кнопку с именем 'SettingsComposerUserSettingsItem0FilterAddFilterItem'
		И в таблице 'SettingsComposerUserSettingsItem0Filter' я перехожу к последней строке
		И в таблице 'SettingsComposerUserSettingsItem0Filter' из выпадающего списка с именем 'SettingsComposerUserSettingsItem0FilterLeftValue' я выбираю точное значение "Database document template"
		И в таблице 'SettingsComposerUserSettingsItem0Filter' я активизирую поле с именем 'SettingsComposerUserSettingsItem0FilterComparisonType'
		И в таблице 'SettingsComposerUserSettingsItem0Filter' из выпадающего списка с именем 'SettingsComposerUserSettingsItem0FilterComparisonType' я выбираю точное значение "Equal to"
		И в таблице 'SettingsComposerUserSettingsItem0Filter' я нажимаю кнопку выбора у реквизита с именем 'SettingsComposerUserSettingsItem0FilterRightValue'
		Тогда открылось окно "Select data type"
		И в таблице "" я перехожу к строке:
			| ''             |
			| "Report types" |
		И в таблице "" я выбираю текущую строку
		И Я в списке "Report types" по полю "Description" ищу и выбираю элемент "VA - Coordination" "Exact match"
		И я нажимаю на кнопку с именем 'FormEndEdit'

		И Пока в таблице 'ResponsibilitiesRegister' количество строк ">" 0 Тогда
			Когда открылось окно "Responsibility assignment matrix"
			И в таблице 'ResponsibilitiesRegister' я нажимаю на кнопку с именем 'ResponsibilitiesRegisterDelete'
			Тогда открылось окно "1C:Enterprise"
			И я нажимаю на кнопку с именем 'Button0'

		Когда открылось окно "Responsibility assignment matrix"
		И в таблице 'ResponsibilitiesRegister' я нажимаю на кнопку с именем 'ResponsibilitiesRegisterListSettings'
		И Я снимаю все отборы в форме списка
			
	* Создаем новый элемент
		И в таблице 'ResponsibilitiesRegister' я нажимаю на кнопку с именем 'ResponsibilitiesRegisterCreate'
		Тогда открылось окно "Register of responsibility assignment matrix (create)"
		И я нажимаю кнопку выбора у поля с именем 'DBDocumentTemplate'
		Тогда открылось окно "Select data type"
		И в таблице "" я перехожу к строке:
			| ''             |
			| "Report types" |
		И в таблице "" я выбираю текущую строку
		И Я в списке "Report types" по полю "Description" ищу и выбираю элемент "VA - Coordination" "Exact match"
		
		Тогда открылось окно "Register of responsibility assignment matrix (create) *"
		И я нажимаю кнопку выбора у поля с именем 'Organization'
		И Я выбираю организацию "Mercury LLC"

		Тогда открылось окно "Register of responsibility assignment matrix (create) *"
		И я нажимаю кнопку выбора у поля с именем 'Approval'
		Тогда открылось окно "Select data type"
		И в таблице "" я перехожу к строке:
			| ''                               |
			| "Universal process template" |
		И в таблице "" я выбираю текущую строку
		И Я в списке "Universal process templates" по полю "Description" ищу и выбираю элемент "VA - Approval Process Template" "Exact match"

		Тогда открылось окно "Register of responsibility assignment matrix (create) *"
		И я нажимаю на кнопку с именем 'FormWriteAndClose'
		И я жду закрытия окна "Register of responsibility assignment matrix (create) *" в течение 20 секунд	

Сценарий: 20.07 Сохранение настроек формы списка экземпляров отчетов	

	* Откроем экземпляры отчетов
		И В командном интерфейсе я выбираю "Budgeting, reporting, and analysis" "Report instances"
		Тогда открылось окно "Report instances"
		Тогда я устанавливаю флаг с именем 'ShouldShowStandardFilters'
		И в таблице 'Filter' я нажимаю на кнопку с именем 'FilterUncheckAll'

	* Установим фильтры
		И я перехожу к закладке с именем 'Standard1'

		И в таблице 'Filter' я перехожу к строке:
			| "Comparison type" | "Use" | "Left value"        | "Display mode" |
			| "Equal to"         | "No"           | "Company" | "Quick access"    |
		И в таблице 'Filter' из выпадающего списка с именем 'FilterRightValue' я выбираю по строке "Mercury LLC"
		
		И в таблице 'Filter' я перехожу к строке:
			| "Comparison type" | "Use" | "Left value"          | "Display mode" |
			| "Equal to"         | "No"           | "Report period" | "Quick access"    |
		И в таблице 'Filter' я нажимаю кнопку выбора у реквизита с именем 'FilterRightValue'
		И Я в списке "Periods" по полю "Description" ищу и выбираю элемент "January 2024" "At beginning of line"
	
		Тогда открылось окно "Report instances"
		И в таблице 'Filter' я перехожу к строке:
			| "Comparison type" | "Use" | "Left value"     | "Display mode" |
			| "Equal to"         | "No"           | "Scenario" | "Quick access"    |
		И в таблице 'Filter' из выпадающего списка с именем 'FilterRightValue' я выбираю по строке "VA - Main scenario"
		
		И в таблице 'Filter' я перехожу к строке:
			| "Comparison type" | "Use" | "Left value"       | "Display mode" |
			| "Equal to"         | "No"           | "Report type" | "Quick access"    |
		И в таблице 'Filter' из выпадающего списка с именем 'FilterRightValue' я выбираю по строке "VA - Coordination"

	* Сохраним настройку
		Когда открылось окно "Report instances"
		И я нажимаю на кнопку с именем 'SaveSettingAs'	
		И Я в списке "Saved settings" по полю "Description" ищу элемент "VA - Coordination - Mercury LLC" "Exact match"
		И Пока в таблице 'List' количество строк 'больше' 0 Тогда
			И Я запоминаю значение выражения '"Delete_" + StrReplace(New UUID, "-", "")' в переменную 'UID'
			И я выбираю пункт контекстного меню с именем 'ListContextMenuChange' на элементе формы с именем 'List'
			Тогда открылось окно "VA - Coordination - Mercury LLC (Setup option)"
			И в поле с именем 'Description' я ввожу значение переменной 'UID'
			И я нажимаю на кнопку с именем 'FormWriteAndClose'
			И я жду закрытия окна "VA - Manual entry for all analytics - Venus LLC *" в течение 20 секунд
			
	Тогда открылось окно "Saved settings"
	И в поле с именем 'Description' я ввожу текст "VA - Coordination - Mercury LLC"
	И я нажимаю на кнопку с именем 'FormSaveVariant'

	Когда открылось окно "Report instances"
	И я нажимаю на кнопку открытия поля с именем 'SavedSetting'

	* Настраиваем пользователей
		Когда открылось окно "VA - Coordination - Mercury LLC (Setup option)"
		И в таблице 'Users' я нажимаю на кнопку с именем 'UsersAdd'
		И в таблице 'Users' я нажимаю кнопку выбора у реквизита с именем 'UsersUser'
		Тогда открылось окно "Select data type"
		И в таблице "" я перехожу к строке:
			| ''                     |
			| "User group" |
		И в таблице "" я выбираю текущую строку
		И Я в списке "Select user group" по полю "Description" ищу и выбираю элемент "VA - Budgeting" "Exact match"
		Тогда открылось окно "VA - Coordination - Mercury LLC (Setup option) *"
		И я нажимаю на кнопку с именем 'FormWriteAndClose'
		И я жду закрытия окна "VA - Coordination - Mercury LLC (Setup option) *" в течение 20 секунд				

Сценарий: 20.08 Настройка прав для пользователей

	И Я добавляю право "Read, write" для вида отчета "VA - Coordination" пользователя "Budgeting1" по всем организациям
	И Я добавляю право "Read, write" для вида отчета "VA - Coordination" пользователя "Budgeting2" по всем организациям
	И Я добавляю право "Read, write" для вида отчета "VA - Coordination" пользователя "Budgeting3" по всем организациям
	И Я добавляю право "Read, write" для вида отчета "VA - Coordination" пользователя "Budgeting4" по всем организациям

Сценарий: 20.09 Согласование по пользователеми

	* Согласование 1 (часть 1)
		И я закрываю TestClient "CPM - Budget"
		И я подключаю TestClient "CPM - Budget" логин "Budgeting1" пароль ''

		И Я открываю экземпляр отчета по сохраненной настройке "VA - Coordination - Mercury LLC"
		И Открылся экземпляр отчета для вида отчета "VA - Coordination" валюта 'RUB' организация "Mercury LLC" сценарий "VA - Main scenario" периодичность "Month" проект '' аналитики '' '' '' '' '' ''

		И я нажимаю на кнопку с именем 'AcceptForApproval'
		
//		И я нажимаю на кнопку с именем 'ApprovalRoute'
//		И табличный документ 'ProcessSprDoc' содержит строки из макета "Макеты\20\ВА_ТестированиеСогласованияЭтап1_Меркурий.mxl" по шаблону
//		И Я закрываю окно "Approval: Report instance * from *"
		
		Тогда открылось окно '$WindowTitle$'
		И я нажимаю на кнопку с именем 'ApproveDocument'
		Тогда открылось окно "Approval"
		И я нажимаю на кнопку с именем 'MarkReportAsApproved'

//		Тогда открылось окно '$WindowTitle$'
//		И я нажимаю на кнопку с именем 'ApprovalRoute'
//		И табличный документ 'ProcessSprDoc' содержит строки из макета "Макеты\20\ВА_ТестированиеСогласованияЭтап2_Меркурий.mxl" по шаблону
//		И Я закрываю окно "Approval: Report instance * from *"

	* Добавим заместителя
		И Для пользователя 'Budgeting1' я добавляю заместителя 'Budgeting3'
		
	* Согласование3 (заместитель)
		И я закрываю TestClient "CPM - Budget"
		И я подключаю TestClient "CPM - Budget" логин "Budgeting3" пароль ''

		И Я открываю экземпляр отчета по сохраненной настройке "VA - Coordination - Mercury LLC"
		И Открылся экземпляр отчета для вида отчета "VA - Coordination" валюта 'RUB' организация "Mercury LLC" сценарий "VA - Main scenario" периодичность "Month" проект '' аналитики '' '' '' '' '' ''
		
		И я нажимаю на кнопку с именем 'ApproveDocument'
		Тогда открылось окно "Approval"
		И я нажимаю на кнопку с именем 'MarkReportAsApproved'
		
//		Тогда открылось окно '$WindowTitle$'
//		И я нажимаю на кнопку с именем 'ApprovalRoute'
//		И табличный документ 'ProcessSprDoc' содержит строки из макета "Макеты\20\ВА_ТестированиеСогласованияЭтап4_Меркурий.mxl" по шаблону
//		И Я закрываю окно "Approval: Report instance * from *"

	* Согласование 1 (часть 2)
		И я закрываю TestClient "CPM - Budget"
		И я подключаю TestClient "CPM - Budget" логин "Budgeting1" пароль ''

		И Я открываю экземпляр отчета по сохраненной настройке "VA - Coordination - Mercury LLC"
		И Открылся экземпляр отчета для вида отчета "VA - Coordination" валюта 'RUB' организация "Mercury LLC" сценарий "VA - Main scenario" периодичность "Month" проект '' аналитики '' '' '' '' '' ''
		
		И я нажимаю на кнопку с именем 'ApproveDocument'
		Тогда открылось окно 'Approval'
		И я нажимаю на кнопку с именем 'AddApprovers'
		Тогда открылось окно "Additional approval"
		И я нажимаю на кнопку с именем 'FormAddApprovers'
		
		И Я в списке "Select user" по полю "Full name" ищу элемент 'Budgeting2' "Exact match"
		И в таблице 'UsersList' количество строк 'равно' 1
		И в таблице 'UsersList' я выбираю текущую строку

		Тогда открылось окно "Additional approval"
		И я нажимаю на кнопку с именем 'FormClose'
		Тогда открылось окно "Approval"
		И я нажимаю на кнопку с именем 'MarkReportAsApproved'
		Тогда открылось окно '$WindowTitle$'
		И я нажимаю на кнопку с именем 'ApprovalRoute'
		И Я закрываю окно "Approval: Report instance *"

		И Я закрываю окно '$WindowTitle$'
		Тогда открылось окно "Report instances"
		И Я закрываю окно "Report instances"
		
	* Согласование 2
		И я закрываю TestClient "CPM - Budget"
		И я подключаю TestClient "CPM - Budget" логин "Budgeting2" пароль ''

		И Я открываю экземпляр отчета по сохраненной настройке "VA - Coordination - Mercury LLC"
		И Открылся экземпляр отчета для вида отчета "VA - Coordination" валюта 'RUB' организация "Mercury LLC" сценарий "VA - Main scenario" периодичность "Month" проект '' аналитики '' '' '' '' '' ''
	
		И я нажимаю на кнопку с именем 'ApproveDocument'
		Тогда открылось окно "Approval"
		И я нажимаю на кнопку с именем 'MarkReportAsApproved'

		И я нажимаю на кнопку с именем 'ApproveDocument'
		Тогда открылось окно "Approval"
		И я нажимаю на кнопку с именем 'MarkReportAsApproved'

//		Тогда открылось окно '$WindowTitle$'
//		И я нажимаю на кнопку с именем 'ApprovalRoute'
//		И табличный документ 'ProcessSprDoc' содержит строки из макета "Макеты\20\ВА_ТестированиеСогласованияЭтап3_Меркурий.mxl" по шаблону
//		И Я закрываю окно "Approval: Report instance * from *"

	* Согласование 3
		И я закрываю TestClient "CPM - Budget"
		И я подключаю TestClient "CPM - Budget" логин "Budgeting3" пароль ''

		И Я открываю экземпляр отчета по сохраненной настройке "VA - Coordination - Mercury LLC"
		И Открылся экземпляр отчета для вида отчета "VA - Coordination" валюта 'RUB' организация "Mercury LLC" сценарий "VA - Main scenario" периодичность "Month" проект '' аналитики '' '' '' '' '' ''
		
		И я нажимаю на кнопку с именем 'ApproveDocument'
		Тогда открылось окно "Approval"
		И я нажимаю на кнопку с именем 'MarkReportAsApproved'

//		Тогда открылось окно '$WindowTitle$'
//		И я нажимаю на кнопку с именем 'ApprovalRoute'
//		И табличный документ 'ProcessSprDoc' содержит строки из макета "Макеты\20\ВА_ТестированиеСогласованияЭтап4_Меркурий.mxl" по шаблону
//		И Я закрываю окно "Approval: Report instance * from *"

	* Согласование 4
		И я закрываю TestClient "CPM - Budget"
		И я подключаю TestClient "CPM - Budget" логин "Budgeting4" пароль ''

		И Я открываю экземпляр отчета по сохраненной настройке "VA - Coordination - Mercury LLC"
		И Открылся экземпляр отчета для вида отчета "VA - Coordination" валюта 'RUB' организация "Mercury LLC" сценарий "VA - Main scenario" периодичность "Month" проект '' аналитики '' '' '' '' '' ''
		
		И я нажимаю на кнопку с именем 'ApproveDocument'
		Тогда открылось окно "Approval"
		И я нажимаю на кнопку с именем 'MarkReportAsApproved'

//		Тогда открылось окно '$WindowTitle$'
//		И я нажимаю на кнопку с именем 'ApprovalRoute'
//		И табличный документ 'ProcessSprDoc' содержит строки из макета "Макеты\20\ВА_ТестированиеСогласованияАвтоутверждение_Меркурий.mxl" по шаблону
//		И Я закрываю окно "Approval: Report instance * from *"

		Тогда открылось окно '$WindowTitle$'
		И я нажимаю на кнопку с именем 'CancelApproval'
		Если открылось окно "Причина отмены согласования" Тогда
			И я нажимаю на кнопку с именем 'OK'

	* История согласования
		Тогда открылось окно '$WindowTitle$'
		И я нажимаю на кнопку с именем 'ApprovalHistory'
		И табличный документ 'Result' равен макету "Макеты\20\ВА_ТестированиеСогласованияИстория_Меркурий.mxl" по шаблону			
