#language: ru

@ExportScenarios
@IgnoreOnCIMainBuild

Функционал: Экспортные сценарии для работы с подсистемой 'Budgeting'
		
Сценарий: Я открываю вид отчета с именем 'TheReportKindName'

	И Я нахожу в списке вид отчета с именем '[TheReportKindName]'
	И в таблице 'ReportKindList' я выбираю текущую строку
	Тогда открылось окно "* (Report types)"

Сценарий: Я выбираю показатель с кодом 'TheIndicatorCode' вида отчета 'TheReportKindName'

	Когда открылось окно "Report indicators"
	И я нажимаю кнопку выбора у поля с именем 'ReportKind'
	Тогда открылось окно "Report types"
	И я нажимаю на кнопку с именем 'FormFind'
	Тогда открылось окно "Find"
	И из выпадающего списка с именем 'FieldSelector' я выбираю точное значение "Description"
	И я меняю значение переключателя с именем 'CompareType' на "Exact match"
	И в поле с именем 'Pattern' я ввожу текст '[TheReportKindName]'
	И я нажимаю на кнопку с именем 'Find'
	Тогда открылось окно "Report types"
	И в таблице 'List' я выбираю текущую строку

	И Я выбираю показатель с кодом '[TheIndicatorCode]'

Сценарий: Я Для вида отчета 'TheReportKindName' открываю бланк сводной таблицы по умолчанию

	* Откроем вид отчета
		// Вариант открытия из формы
		Если текущее окно имеет заголовок "[TheReportKindName] (Report types)" Тогда
			// Форма уже открыта
		Иначе
			И Я нахожу в списке вид отчета с именем '[TheReportKindName]'
			И в таблице 'ReportKindList' я выбираю текущую строку
		Когда открылось окно "[TheReportKindName] (Report types)"
		И я перехожу к закладке с именем 'DefaultSettings'
		И я нажимаю на кнопку открытия поля с именем 'DefaultPivotTableTemplate'

	* Формируем Бланк сводной таблиц
		Тогда Открылся бланк сводной таблицы для вида отчета '[TheReportKindName]'

Сценарий: Я открываю новую корректировку значений показателей сценарий "TheScenario" период "TheStartDate" периодичность "TheFrequency" организация "TheBusinessUnit"

	И В командном интерфейсе я выбираю "Budgeting, reporting, and analysis" "Indicator value adjustment"
	Тогда открылось окно "Indicator value adjustment"

	И я нажимаю на кнопку с именем 'FormCreate'
	Тогда открылось окно "Indicator value adjustment (create)"

	И я нажимаю кнопку выбора у поля с именем 'PeriodManagement'
	И Я в списке "Reporting period management" по полю "Scenario" ищу элемент "[TheScenario]" "Exact match"
	И Я в списке "Reporting period management" по полю "Frequency" ищу элемент "[TheFrequency]" "Exact match" 
	И Я в списке "Reporting period management" по полю "Start period" ищу и выбираю элемент "[TheStartDate]" "At beginning of line"

	Когда открылось окно "Indicator value adjustment (create) *"
	И я нажимаю кнопку выбора у поля с именем 'Organization'
	И Я выбираю организацию "[TheBusinessUnit]"
