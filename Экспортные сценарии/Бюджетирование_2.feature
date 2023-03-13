#language: ru

@ExportScenarios
@IgnoreOnCIMainBuild

Функционал: Экспортные сценарии для работы с подсистемой 'Budgeting'
		
Сценарий: Я открываю вид отчета с именем 'TheReportKindName'

	И Я нахожу в списке вид отчета с именем '[TheReportKindName]'
	И в таблице 'ListOfReportTypes' я выбираю текущую строку
	Тогда открылось окно "* (Report kinds)"

Сценарий: Я выбираю показатель с кодом 'TheIndicatorCode' вида отчета 'TheReportKindName'

	Когда открылось окно "Report indicators"
	И я нажимаю кнопку выбора у поля с именем 'ReportKind'
	Тогда открылось окно "Report kinds"
	И я нажимаю на кнопку с именем 'FormFind'
	Тогда открылось окно "Find"
	И из выпадающего списка с именем 'FieldSelector' я выбираю точное значение "Description"
	И я меняю значение переключателя с именем 'CompareType' на "Exact match"
	И в поле с именем 'Pattern' я ввожу текст '[TheReportKindName]'
	И я нажимаю на кнопку с именем 'Find'
	Тогда открылось окно "Report kinds"
	И в таблице 'List' я выбираю текущую строку

	И  Я выбираю показатель с кодом '[TheIndicatorCode]'

Сценарий: Я Для вида отчета 'TheReportKindName' открываю бланк сводной таблицы по умолчанию

	* Откроем вид отчета
		// Вариант открытия из формы
		Если текущее окно имеет заголовок "[TheReportKindName] (Report kinds)" Тогда
			// Форма уже открыта
		Иначе
			И Я нахожу в списке вид отчета с именем '[TheReportKindName]'
			И в таблице 'ListOfReportTypes' я выбираю текущую строку
		Когда открылось окно "[TheReportKindName] (Report kinds)"
		И я перехожу к закладке с именем 'DefaultSettings'
		И я нажимаю на кнопку открытия поля с именем 'DefaultPivotTableTemplate'

	* Формируем Бланк сводной таблиц
		Тогда Открылся бланк сводной таблицы для вида отчета '[TheReportKindName]'
