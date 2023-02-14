#language: ru

@ExportScenarios
@IgnoreOnCIMainBuild

Функционал: Экспортные сценарии общие

Сценарий: Инициализация переменных

	И Я запоминаю значение выражения 'ProductIDCPMClientServer.IsCorpPerformanceManagement() AND NOT ProductIDCPMClientServer.IsERPCP()' в переменную '$$IsCPM$$'
	
	Если '$$IsCPM$$' Тогда
		Если в панели разделов есть команда 'Catalogs' Тогда
			И Я запоминаю значение выражения 'False' в переменную '$$ЭтоPerform$$'
		Иначе
			И Я запоминаю значение выражения 'True' в переменную '$$ЭтоPerform$$'
	Иначе
		И Я запоминаю значение выражения 'False' в переменную '$$ЭтоPerform$$'
		
	И Я запоминаю значение выражения 'ProductIDCPMClientServer.IsCorpPerformanceManagement() AND ProductIDCPMClientServer.IsERPCP()' в переменную '$$IsERPCPM$$'

	Если в панели разделов есть команда 'Budgeting, отчетность и анализ' Тогда
		И Я запоминаю значение выражения 'Ru' в переменную '$$LanguageИнтерфейса$$'
	ИначеЕсли в панели разделов есть команда 'Budgeting, reporting, and analysis' Тогда
		И Я запоминаю значение выражения 'En' в переменную '$$LanguageИнтерфейса$$'
		
Сценарий: Я устанавливаю отбор в форме списка 'TheField' 'TheComparisonType' 'TheValue' 

	Тогда открылось окно "List Options"
	И я удаляю все строки таблицы 'SettingsComposerUserSettingsItem0Filter'		
	И в таблице 'SettingsComposerUserSettingsItem0Filter' я нажимаю на кнопку с именем 'SettingsComposerUserSettingsItem0FilterAddFilterItem'
	И в таблице 'SettingsComposerUserSettingsItem0Filter' я перехожу к последней строке
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
