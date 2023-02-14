#language: ru

@ExportScenarios
@IgnoreOnCIMainBuild

Функционал: Экспортные сценарии для работы с подсистемой 'Budgeting'
		
Сценарий: Я нахожу в списке вид отчета с именем 'TheReportKindDescription'

	И В командном интерфейсе я выбираю "Budgeting, reporting, and analysis" "Report kinds and templates"
	Тогда открылось окно "Report kinds and templates"
	И в таблице 'ListOfReportTypes' я нажимаю на кнопку с именем 'ListOfReportTypesFind'
	Тогда открылась форма с именем 'UniversalListFindExtForm'
	И из выпадающего списка с именем 'FieldSelector' я выбираю точное значение "Report kind"
	И я меняю значение переключателя с именем 'CompareType' на "Anywhere in the line"
	И в поле с именем 'Pattern' я ввожу текст '[TheReportKindDescription]'
	И я нажимаю на кнопку с именем 'Find'
	Тогда в таблице 'ListOfReportTypes' количество строк 'равно' 1

Сценарий: Открылся экземпляр отчета для вида отчета 'TheReportKind' валюта 'TheCurrency' организация 'TheBusinessUnit' сценарий 'TheScenario' периодичность 'TheFrequency' проект 'TheProject' аналитики 'TheDimension1' 'TheDimension2' 'TheDimension3' 'TheDimension4' 'TheDimension5' 'TheDimension6' 

	Если '$$LanguageИнтерфейса$$ = "Ru"' Тогда
		И я запоминаю строку 'Instance report \"[TheReportKind]\": <[TheCurrency]> <[TheBusinessUnit]> <* - * (Periodicity: [TheFrequency]) <[TheScenario]>>' в переменную 'WindowTitle'
	ИначеЕсли '$$LanguageИнтерфейса$$ = "En"' Тогда
		И я запоминаю строку 'Report instance \"[TheReportKind]\": <[TheCurrency]> <[TheBusinessUnit]> <* - * (Frequency: [TheFrequency]) <[TheScenario]>>' в переменную 'WindowTitle'		

	Если 'NOT IsBlankString("[TheProject]")' Тогда
		И я запоминаю строку '$WindowTitle$ <[TheProject]>' в переменную 'WindowTitle'
	Если 'NOT IsBlankString("[TheDimension1]")' Тогда
		И я запоминаю строку '$WindowTitle$ <[TheDimension1]>' в переменную 'WindowTitle'
	Если 'NOT IsBlankString("[TheDimension2]")' Тогда
		И я запоминаю строку '$WindowTitle$ <[TheDimension2]>' в переменную 'WindowTitle'
	Если 'NOT IsBlankString("[TheDimension3]")' Тогда
		И я запоминаю строку '$WindowTitle$ <[TheDimension3]>' в переменную 'WindowTitle'
	Если 'NOT IsBlankString("[TheDimension4]")' Тогда
		И я запоминаю строку '$WindowTitle$ <[TheDimension4]>' в переменную 'WindowTitle'	
	Если 'NOT IsBlankString("[TheDimension5]")' Тогда
		И я запоминаю строку '$WindowTitle$ <[TheDimension5]>' в переменную 'WindowTitle'
	Если 'NOT IsBlankString("[TheDimension6]")' Тогда
		И я запоминаю строку '$WindowTitle$ <[TheDimension6]>' в переменную 'WindowTitle'

	И я запоминаю строку '$WindowTitle$*' в переменную 'WindowTitle'
	И открылось окно '$WindowTitle$'

Сценарий: Открылся документ управления периодом для сценария 'TheScenario' периодичность 'TheFrequency' 

	Если '$$LanguageИнтерфейса$$ = "Ru"' Тогда
		И я запоминаю строку '* - * (Periodicity: [TheFrequency]) <[TheScenario]>' в переменную 'WindowTitle'
	ИначеЕсли '$$LanguageИнтерфейса$$ = "En"' Тогда
		И я запоминаю строку '* - * (Frequency: [TheFrequency]) <[TheScenario]>' в переменную 'WindowTitle'

	И открылось окно '$WindowTitle$'

Сценарий: Открылся регламент подготовки отчетности 'TheDescription' 

	Если '$$LanguageИнтерфейса$$ = "Ru"' Тогда
		Если 'IsBlankString("[TheDescription]")' Тогда
			И я запоминаю строку 'Regulation dated * (Creating)*' в переменную 'WindowTitle'
		Иначе
			И я запоминаю строку '[TheDescription] dated * (Regulation подгdatedовки datedчетности)*' в переменную 'WindowTitle'
	ИначеЕсли '$$LanguageИнтерфейса$$ = "En"' Тогда
		Если 'IsBlankString("[TheDescription]")' Тогда
			И я запоминаю строку 'Regulation from * (Create)*' в переменную 'WindowTitle'
		Иначе
			И я запоминаю строку '[TheDescription] from * (Regulation for preparing reports)*' в переменную 'WindowTitle'

	И открылось окно '$WindowTitle$'	

Сценарий: Открылся бланк для вида отчета 'TheReportKind'

	И открылось окно "Template [TheReportKind] report kind: [TheReportKind]*"

Сценарий: Открылся бланк сводной таблицы для вида отчета 'TheReportKind'

	И я запоминаю строку "Pivot table template: [TheReportKind] (pivot table)*" в переменную 'WindowTitle'
	И открылось окно '$WindowTitle$'

Сценарий: Открылась сводная таблица для вида отчета 'TheReportKind'

	И я запоминаю строку "Pivot table: [TheReportKind] (pivot table)*" в переменную 'WindowTitle'
	И открылось окно '$WindowTitle$'

Сценарий: Открылась сводная таблица для варианта 'TheVariant'

	И открылось окно "Pivot table: [TheVariant]*"

Сценарий: Открылась правило расчета для вида отчета 'TheReportKind'

	И открылось окно "[TheReportKind] (Calculation rules)*"
	
Сценарий: Я подставляю в строку 'TheLine' параметры 'TheParameter1' 'TheParameter2' 'TheParameter3'

	И Я запоминаю значение выражения 'Page1Template("[TheLine]", "[TheParameter1]", "[TheParameter2]", "[TheParameter3]")' в переменную 'TotalString'

Сценарий: Я выбираю показатель с кодом 'TheIndicatorCode'

	Если '$$LanguageИнтерфейса$$ = "Ru"' Тогда
		Тогда открылось окно "Report indicators"
		И я меняю значение переключателя с именем 'IndicatorChoiceMode' на "Structure layout"
		И в табличном документе 'SpreadsheetDocSelectIndicator' я перехожу к ячейке '[TheIndicatorCode]'
		И в табличном документе 'SpreadsheetDocSelectIndicator' я делаю двойной клик на текущей ячейке
	Иначе
		Тогда открылось окно "Report indicators"
		И я меняю значение переключателя с именем 'IndicatorChoiceMode' на "Indicator list"
		И в таблице 'List' я нажимаю на кнопку с именем 'ListFind'
		Тогда открылось окно "Find"
		И из выпадающего списка с именем 'FieldSelector' я выбираю точное значение "Code"
		И я меняю значение переключателя с именем 'CompareType' на "Exact match"
		И в поле с именем 'Pattern' я ввожу текст '[TheIndicatorCode]'
		И я нажимаю на кнопку с именем 'Find'
		Тогда открылось окно "Report indicators"
		И в таблице 'List' я выбираю текущую строку
				
