#language: ru

@ExportScenarios
@IgnoreOnCIMainBuild

Функционал: Экспортные сценарии общие

Сценарий: Инициализация переменных

	И Я запоминаю значение выражения 'CommonClientServerCPM.ConfigurationName() = "Perform"' в переменную '$$ЭтоPerform$$'

	И Я запоминаю значение выражения 'CommonClientServerCPM.ConfigurationName() = "CorporatePerformanceManagement" OR $$ЭтоPerform$$' в переменную '$$IsCPM$$'
			
	И Я запоминаю значение выражения 'CommonClientServerCPM.ConfigurationName() = "CorporatePerformanceManagementERP"' в переменную '$$IsERPCPM$$'

	Если в панели разделов есть команда 'Budgeting, отчетность и анализ' Тогда
		И Я запоминаю значение выражения 'Ru' в переменную '$$InterfaceLanguage$$'
	ИначеЕсли в панели разделов есть команда 'Budgeting, reporting, and analysis' Тогда
		И Я запоминаю значение выражения 'En' в переменную '$$InterfaceLanguage$$'
		
Сценарий: Я устанавливаю отбор в форме списка 'TheField' 'TheComparisonType' 'TheValue' 

	Тогда открылось окно "List Options"
	И я удаляю все строки таблицы 'SettingsComposerUserSettingsItem0Filter'		
	И в таблице 'SettingsComposerUserSettingsItem0Filter' я нажимаю на кнопку с именем 'SettingsComposerUserSettingsItem0FilterAddFilterItem'
	И в таблице 'SettingsComposerUserSettingsItem0Filter' я перехожу к последней строке
	Если 'StrFind("[TheField]", ".") > 0' Тогда
		И в таблице 'SettingsComposerUserSettingsItem0Filter' в поле с именем 'SettingsComposerUserSettingsItem0FilterLeftValue' я ввожу текст '[TheField]'
	И в таблице 'SettingsComposerUserSettingsItem0Filter' из выпадающего списка с именем 'SettingsComposerUserSettingsItem0FilterLeftValue' я выбираю точное значение '[TheField]'
	И в таблице 'SettingsComposerUserSettingsItem0Filter' я активизирую поле с именем 'SettingsComposerUserSettingsItem0FilterComparisonType'
	И в таблице 'SettingsComposerUserSettingsItem0Filter' из выпадающего списка с именем 'SettingsComposerUserSettingsItem0FilterComparisonType' я выбираю точное значение '[TheComparisonType]'
	И в таблице 'SettingsComposerUserSettingsItem0Filter' я активизирую поле с именем 'SettingsComposerUserSettingsItem0FilterRightValue'
	Если 'StrFind(Lower("[TheComparisonType]"),"From1одержит")>0 OR StrFind(Lower("[TheComparisonType]"),"начинаетFrom1Z2 From1")>0 OR StrFind(Lower("[TheComparisonType]"),"contain")>0 OR StrFind(Lower("[TheComparisonType]"),"begin with")>0' Тогда 
		И в таблице 'SettingsComposerUserSettingsItem0Filter' в поле с именем 'SettingsComposerUserSettingsItem0FilterRightValue' я ввожу текст '[TheValue]'
	Иначе
		И в таблице 'SettingsComposerUserSettingsItem0Filter' из выпадающего списка с именем 'SettingsComposerUserSettingsItem0FilterRightValue' я выбираю точное значение '[TheValue]'
	И в таблице 'SettingsComposerUserSettingsItem0Filter' я завершаю редактирование строки
	И я нажимаю на кнопку с именем 'FormEndEdit'

Сценарий: Я добавляю отбор в форме списка 'TheField' 'TheComparisonType' 'TheValue' 

	Тогда открылось окно "List Options"
	И в таблице 'SettingsComposerUserSettingsItem0Filter' я нажимаю на кнопку с именем 'SettingsComposerUserSettingsItem0FilterAddFilterItem'
	Если 'StrFind("[TheField]", ".") > 0' Тогда
		И в таблице 'SettingsComposerUserSettingsItem0Filter' в поле с именем 'SettingsComposerUserSettingsItem0FilterLeftValue' я ввожу текст '[TheField]'
	И в таблице 'SettingsComposerUserSettingsItem0Filter' из выпадающего списка с именем 'SettingsComposerUserSettingsItem0FilterLeftValue' я выбираю точное значение '[TheField]'
	И в таблице 'SettingsComposerUserSettingsItem0Filter' я активизирую поле с именем 'SettingsComposerUserSettingsItem0FilterComparisonType'
	И в таблице 'SettingsComposerUserSettingsItem0Filter' из выпадающего списка с именем 'SettingsComposerUserSettingsItem0FilterComparisonType' я выбираю точное значение '[TheComparisonType]'
	И в таблице 'SettingsComposerUserSettingsItem0Filter' я активизирую поле с именем 'SettingsComposerUserSettingsItem0FilterRightValue'
	Если 'StrFind(Lower("[TheComparisonType]"),"From1одержит")>0 OR StrFind(Lower("[TheComparisonType]"),"начинаетFrom1Z2 From1")>0 OR StrFind(Lower("[TheComparisonType]"),"contain")>0 OR StrFind(Lower("[TheComparisonType]"),"begin with")>0' Тогда 
		И в таблице 'SettingsComposerUserSettingsItem0Filter' в поле с именем 'SettingsComposerUserSettingsItem0FilterRightValue' я ввожу текст '[TheValue]'
	Иначе
		И в таблице 'SettingsComposerUserSettingsItem0Filter' из выпадающего списка с именем 'SettingsComposerUserSettingsItem0FilterRightValue' я выбираю точное значение '[TheValue]'
	И в таблице 'SettingsComposerUserSettingsItem0Filter' я завершаю редактирование строки
	И я нажимаю на кнопку с именем 'FormEndEdit'	

Сценарий: Я снимаю все отборы в форме списка

	Тогда открылось окно "List Options"
	И я перехожу к закладке с именем 'SettingsComposerUserSettingsItem0'
	И я удаляю все строки таблицы 'SettingsComposerUserSettingsItem0Filter'
	И я нажимаю на кнопку с именем 'FormEndEdit'

Сценарий: Таблица 'TheTable' содержит 'TheNumberOfLines' строк из списка:

	Тогда в таблице '[TheTable]' количество строк 'равно' '[TheNumberOfLines]'

	Тогда таблица '[TheTable]' содержит строки:
		| 'Table' |	

Сценарий: Я в списке "TheListName" по полю "TheField" ищу элемент "ThePattern" "TheCompareType" 

	Тогда открылось окно '[TheListName]'
	Если кнопка с именем 'FormFind' существует Тогда
		И я нажимаю на кнопку с именем 'FormFind'
	Иначе
		И я выбираю пункт контекстного меню с именем 'ListContextMenuFind' на элементе формы с именем 'List'
	Тогда открылось окно "Find"
	И из выпадающего списка с именем 'FieldSelector' я выбираю точное значение '[TheField]'
	И я меняю значение переключателя с именем 'CompareType' на '[TheCompareType]'	
	И я жду открытия окна "Find" в течение 10 секунд				
	И в поле с именем 'Pattern' я ввожу текст '[ThePattern]'
	И я нажимаю на кнопку с именем 'Find'
	И я жду открытия окна '[TheListName]' в течение 10 секунд

Сценарий: Я в списке "TheListName" по полю "TheField" ищу и выбираю элемент "ThePattern" "TheCompareType" 

	Тогда открылось окно '[TheListName]'
	Если кнопка с именем 'FormFind' существует Тогда
		И я нажимаю на кнопку с именем 'FormFind'
	Иначе
		И я выбираю пункт контекстного меню с именем 'ListContextMenuFind' на элементе формы с именем 'List'
	Тогда открылось окно "Find"
	И из выпадающего списка с именем 'FieldSelector' я выбираю точное значение '[TheField]'
	И я меняю значение переключателя с именем 'CompareType' на '[TheCompareType]'
	И я жду открытия окна "Find" в течение 10 секунд				
	И в поле с именем 'Pattern' я ввожу текст '[ThePattern]'
	И я нажимаю на кнопку с именем 'Find'
	И я жду открытия окна '[TheListName]' в течение 10 секунд
	И Я запоминаю в переменную 'VarField' значение '[TheField]'
	И Я запоминаю в переменную 'VarPattern' значение '[ThePattern]'	
	И в таблице 'List' я перехожу к строке:
		| '$VarField$'   |
		| '$VarPattern$' |
	И в таблице 'List' я выбираю текущую строку	

Сценарий: Я для реквизита 'TheProperty' устанавливаю значение 'TheValue'

	Если 'Upper("[TheValue]") = "TRUE" OR Upper("[TheValue]") = "TRUE"' Тогда
		И я устанавливаю флаг с именем '[TheProperty]'
	ИначеЕсли 'Upper("[TheValue]") = "FALSE" OR Upper("[TheValue]") = "FALSE"' Тогда
		И я снимаю флаг с именем '[TheProperty]'
	Иначе
		И из выпадающего списка с именем '[TheProperty]' я выбираю точное значение "[TheValue]"

Сценарий: Я удаляю текущую строку в списке 'TheList'

	И я выбираю пункт контекстного меню с именем '[TheList]ContextMenuSetDeletionMark' на элементе формы с именем '[TheList]'
	Тогда открылось окно "1C:Enterprise"
	Если элемент формы с именем 'Message' стал равен "Mark * for deletion?" по шаблону Тогда
		И я нажимаю на кнопку с именем 'Button0'
	Иначе
		И я нажимаю на кнопку с именем 'Button1'
	И я жду доступности элемента с именем '[TheList]' в течение 20 секунд

Сценарий: Я удаляю текущий элемент в окне 'TheWindowName' очищая 'TheFieldName1' 'TheFieldName2' 'TheFieldName3'

	Когда открылось окно "[TheWindowName]"	

	И я нажимаю на кнопку с именем 'FormSetDeletionMark'
	Когда открылось окно "1C:Enterprise"
	Если элемент формы с именем 'Message' стал равен "Mark * for deletion?" по шаблону Тогда
		И я нажимаю на кнопку с именем 'Button0'
	Иначе
		И я нажимаю на кнопку с именем 'Button1'

	И Я запоминаю значение выражения 'StrReplace(New UUID, "-", "")' в переменную 'UID'	
	Тогда в поле с именем 'Description' я ввожу значение переменной 'UID'
	
	Если 'NOT StrStartsWith("[TheFieldName1]", "[") AND NOT IsBlankString("[TheFieldName1]")' Тогда
		Тогда в поле с именем '[TheFieldName1]' я ввожу текст ' '			
	Если 'NOT StrStartsWith("[TheFieldName2]", "[") AND NOT IsBlankString("[TheFieldName2]")' Тогда
		Тогда в поле с именем '[TheFieldName2]' я ввожу текст ' '
	Если 'NOT StrStartsWith("[TheFieldName3]", "[") AND NOT IsBlankString("[TheFieldName3]")' Тогда
		Тогда в поле с именем '[TheFieldName3]' я ввожу текст ' '

	Тогда открылось окно "[TheWindowName]*"		
	И я нажимаю на кнопку с именем 'FormWriteAndClose'
	И я жду закрытия окна "[TheWindowName]*" в течение 20 секунд
			
