#language: ru
@tree

Функционал: 09. Валютные показатели

	Как Администратор я хочу
	Проверить что виды отчетов с валютными показателями расчитываются и записываются

Контекст: 
	
	И я закрыл все окна клиентского приложения

Сценарий: 09.00 Определение типа приложения

	И я закрываю TestClient "CPM - Budget"
	И я подключаю TestClient "CPM - Budget" логин "Administrator" пароль ''
	Пусть Инициализация переменных

Сценарий: 09.01 Создание группы отчетов "VA - Currency indicators (group)"

	И Я создаю группу видов отчетов с именем "VA - Currency indicators (group)" и родителем "VA - Report group"

Сценарий: 09.02 Создание вида отчета "VA - Currency indicators (source)"

	И Я создаю вид отчета с именем "VA - Currency indicators (source)" и родителем "VA - Currency indicators (group)"
	
	И Я открываю вид отчета с именем "VA - Currency indicators (source)"
	И я устанавливаю флаг с именем 'ProjectSeparation'	
	И я нажимаю на кнопку с именем 'RecordButtonForm'

	И я нажимаю на кнопку с именем 'EditTree'
	Когда открылось окно "Report wizard"

	И Я в конструкторе отчета добавляю строки
		| 'Description'      |
		| "Revenue"           |
		| "Revenue in currency"  |
		| "Revenue by currency" |
		| "Effective on"        |
		| "Rate [EUR]"        |
		| "Rate [USD]"        |
		
	И Я в конструкторе отчета добавляю колонку с именем "Value"

	И Я в конструкторе отчета в ячейке 'R5C2' меняю свойство показателя 'ValueType' на "Date"
	И Я в конструкторе отчета в ячейке 'R6C2' меняю свойство показателя 'NonFinancial' на "True"
	И Я в конструкторе отчета в ячейке 'R7C2' меняю свойство показателя 'NonFinancial' на "True"
	
	И Я в конструкторе отчета добавляю аналитику с кодом "VA0Counter" в ячейку 'R2C2'
	Когда открылось окно "Report wizard"
	И я нажимаю на кнопку с именем 'CopyDimension'
	И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R3C2'
	И я нажимаю на кнопку с именем 'InsertDimension'

	И Я в конструкторе отчета в ячейке 'R2C8' меняю аналитику валюта
	И Я в конструкторе отчета в ячейке 'R3C8' меняю аналитику валюта
	И Я в конструкторе отчета в ячейке 'R4C8' меняю аналитику валюта

	И Я в конструкторе отчета в ячейке 'R2C2' проверяю свойство показателя 'ShouldRecalculateForeignCurrencyAmount' на "False"
	И Я в конструкторе отчета в ячейке 'R2C2:R4C2' меняю свойства показателей 'ShouldRecalculateForeignCurrencyAmount' на "True"
	И Я в конструкторе отчета в ячейке 'R2C2' проверяю свойство показателя 'ShouldRecalculateForeignCurrencyAmount' на "True"

	И Я в конструкторе отчета в ячейке 'R2C8' меняю аналитику валюта
	И Я в конструкторе отчета в ячейке 'R2C2' проверяю свойство показателя 'ShouldRecalculateForeignCurrencyAmount' на "False"

Сценарий: 09.03 Создание многопериодного бланка для вида отчета "VA - Currency indicators (source)"

	И Я Для вида отчета "VA - Currency indicators (source)" создаю бланк по умолчанию

	* Открываем бланк
		И Я нахожу в списке вид отчета с именем "VA - Currency indicators (source)"
		Тогда открылось окно "Report types and templates"
		И в таблице 'List' я перехожу к строке:
			| "Description"                        |
			| "VA - Currency indicators (source)" |
		И в таблице 'List' я выбираю текущую строку
		И я запоминаю заголовок формы в переменную 'WindowTitle'		
	
	* Добавляем колонку с значением валюта
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'C4'
		И я нажимаю на кнопку с именем 'AddAreaToColumnInGroupingRight'				
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R5C4:R16C4'
		И я нажимаю на кнопку с именем 'CopyToClipboard'
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R5C5:R16C5'
		И я нажимаю на кнопку с именем 'PasteFromClipboard'
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R5C4:R5C5'
		И я нажимаю на кнопку с именем 'Union'
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R6C5'
		И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
		И в табличный документ 'SpreadsheetFieldTemlate' я ввожу текст 'Sum (вал)'
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R7C5:R10C5'
		И я нажимаю на кнопку с именем 'ClearContent'
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R11C5'
		И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
		Тогда открылось окно "Indicator value filter settings"
		И я изменяю флаг с именем 'AmountInAddlCurrency'
		И я нажимаю на кнопку с именем 'FormApply'
		Тогда открылось окно '$WindowTitle$ *'
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R12C5'
		И я нажимаю на кнопку с именем 'ClearContent'
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R13C5'
		И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
		Тогда открылось окно "Indicator value filter settings"
		И я изменяю флаг с именем 'AmountInAddlCurrency'
		И я нажимаю на кнопку с именем 'FormApply'
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R14C5:R16C5'
		И я нажимаю на кнопку с именем 'ClearContent'
	
	* Добавляем колонку с значением валюта для итога
		Когда открылось окно '$WindowTitle$ *'
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'C6'
		И я нажимаю на кнопку с именем 'AddAreaToColumnInGroupingRight'
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R5C6:R16C6'
		И я нажимаю на кнопку с именем 'CopyToClipboard'
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R5C7:R16C7'
		И я нажимаю на кнопку с именем 'PasteFromClipboard'
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R7C7:R10C7'
		И я нажимаю на кнопку с именем 'ClearContent'
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R11C7'
		И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
		Тогда открылось окно "Indicator value filter settings"
		И я изменяю флаг с именем 'AmountInAddlCurrency'
		И я нажимаю на кнопку с именем 'FormApply'
		Тогда открылось окно '$WindowTitle$ *'
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R12C7'
		И я нажимаю на кнопку с именем 'ClearContent'
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R13C7'
		И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
		Тогда открылось окно "Indicator value filter settings"
		И я изменяю флаг с именем 'AmountInAddlCurrency'
		И я нажимаю на кнопку с именем 'FormApply'
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R14C7:R16C7'
		И я нажимаю на кнопку с именем 'ClearContent'
	
	* Записываем макет
		Тогда открылось окно '$WindowTitle$ *'
		И я нажимаю на кнопку с именем 'FormButtonWriteAndClose'

Сценарий: 09.04 Создание вида отчета "VA - Currency indicators (recipient)"

	И Я создаю вид отчета с именем "VA - Currency indicators (recipient)" и родителем 'DimenKind - Currency показатели (group)'

	И Я открываю вид отчета с именем "VA - Currency indicators (recipient)"
	И я устанавливаю флаг с именем 'ProjectSeparation'	
	И я нажимаю на кнопку с именем 'RecordButtonForm'

	И я нажимаю на кнопку с именем 'EditTree'
	Когда открылось окно "Report wizard"

	* Добавляем строки
		И Я в конструкторе отчета добавляю строки
			| 'Description'                                                           |
			| "Revenue by currency"                                                      |
			| "Revenue by currency [Average rate for period]"                             |
			| "Revenue by currency [Average rate for IFRS period]"                        |
			| "Revenue by currency [Average rate for period CB]"                          |
			| "Revenue by currency [Exchange rate at the beginning of the period]"                             |
			| "Revenue by currency [Exchange rate at the end of the period]"                              |
			| "Revenue by currency [Average rate for the previous period]"                  |
			| "Revenue by currency [Exchange rate at the end of the previous period]"                  |
			| "Revenue by currency [Average rate for the previous period CB]"               |
			| "Effective on"                                                             |
			| "Revenue by currency [Exchange rate as of the date specified in the indicator]"                |
			| "Revenue by currency [Exchange rate as of the date specified in the indicator another report]" |
			| "Rate [EUR]"                                                             |
			| "Rate [USD]"                                                             |
			| "Revenue by currency [Rate specified in the indicator]"                        |
			| "Revenue by currency [Rate specified in the indicator another report]"         |
		
	* Добавляем колонки
		И Я в конструкторе отчета добавляю колонку с именем "Value"

	* Настраиваем показатели
		* Выручка по валюте [Средний курс за период]
			Тогда открылось окно "Report wizard"
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R2C2'
			И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
			Тогда открылось окно "* (Report indicators)"
			И я перехожу к закладке с именем 'CurrenciesConversion'
			Тогда элемент формы с именем 'CurrExchangeType' стал равен "Average rate for period"
			И я нажимаю кнопку очистить у поля с именем 'CurrExchangeType'
			И я нажимаю на кнопку с именем 'FormWriteAndClose'
			Тогда в логе сообщений TestClient есть строки:
				|"\"Exchange rate kind\" is a required field."|
			И из выпадающего списка с именем 'CurrExchangeType' я выбираю точное значение "Average rate for period"
			И я нажимаю на кнопку с именем 'FormWriteAndClose'
			И я жду закрытия окна "* (Report indicators) *" в течение 20 секунд												
		* Выручка по валюте [Средний курс за период]
			Тогда открылось окно "Report wizard"
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R3C2'
			И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
			Тогда открылось окно "* (Report indicators)"
			И я перехожу к закладке с именем 'CurrenciesConversion'
			И из выпадающего списка с именем 'CurrExchangeType' я выбираю точное значение "Average rate for period"
			И я нажимаю на кнопку с именем 'FormWriteAndClose'
			И я жду закрытия окна "* (Report indicators) *" в течение 20 секунд
		* Выручка по валюте [Средний курс за период МСФО]
			Тогда открылось окно "Report wizard"
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R4C2'
			И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
			Тогда открылось окно "* (Report indicators)"
			И я перехожу к закладке с именем 'CurrenciesConversion'
			И из выпадающего списка с именем 'CurrExchangeType' я выбираю точное значение "Average rate for IFRS period"
			И я нажимаю на кнопку с именем 'FormWriteAndClose'
			И я жду закрытия окна "* (Report indicators) *" в течение 20 секунд
		* Выручка по валюте [Средний курс за период ЦБ]
			Тогда открылось окно "Report wizard"
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R5C2'
			И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
			Тогда открылось окно "* (Report indicators)"
			И я перехожу к закладке с именем 'CurrenciesConversion'
			И из выпадающего списка с именем 'CurrExchangeType' я выбираю точное значение "Average rate for period CB"
			И я нажимаю на кнопку с именем 'FormWriteAndClose'
			И я жду закрытия окна "* (Report indicators) *" в течение 20 секунд
		* Выручка по валюте [Курс на начало периода]	
			Тогда открылось окно "Report wizard"
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R6C2'
			И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
			Тогда открылось окно "* (Report indicators)"
			И я перехожу к закладке с именем 'CurrenciesConversion'
			И из выпадающего списка с именем 'CurrExchangeType' я выбираю точное значение "Exchange rate at the beginning of the period"
			И я нажимаю на кнопку с именем 'FormWriteAndClose'
			И я жду закрытия окна "* (Report indicators) *" в течение 20 секунд
		* Выручка по валюте [Курс на конец периода]	
			Тогда открылось окно "Report wizard"
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R7C2'
			И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
			Тогда открылось окно "* (Report indicators)"
			И я перехожу к закладке с именем 'CurrenciesConversion'
			И из выпадающего списка с именем 'CurrExchangeType' я выбираю точное значение "Exchange rate at the end of the period"
			И я нажимаю на кнопку с именем 'FormWriteAndClose'
			И я жду закрытия окна '"* (Report indicators) *" в течение 20 секунд
		* Выручка по валюте [Средний курс за предыдущий период]	
			Тогда открылось окно "Report wizard"
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R8C2'
			И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
			Тогда открылось окно "* (Report indicators)"
			И я перехожу к закладке с именем 'CurrenciesConversion'
			И из выпадающего списка с именем 'CurrExchangeType' я выбираю точное значение "Average rate for the previous period"
			И я нажимаю на кнопку с именем 'FormWriteAndClose'
			И я жду закрытия окна "* (Report indicators) *" в течение 20 секунд
		* Выручка по валюте [Курс на конец предыдущего периода]	
			Тогда открылось окно "Report wizard"
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R9C2'
			И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
			Тогда открылось окно "* (Report indicators)"
			И я перехожу к закладке с именем 'CurrenciesConversion'
			И из выпадающего списка с именем 'CurrExchangeType' я выбираю точное значение "Exchange rate at the end of the previous period"
			И я нажимаю на кнопку с именем 'FormWriteAndClose'
			И я жду закрытия окна "* (Report indicators) *" в течение 20 секунд
		* Выручка по валюте [Средний курс за предыдущий период ЦБ]	
			Тогда открылось окно "Report wizard"
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R10C2'
			И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
			Тогда открылось окно "* (Report indicators)"
			И я перехожу к закладке с именем 'CurrenciesConversion'
			И из выпадающего списка с именем 'CurrExchangeType' я выбираю точное значение "Average rate for the previous period CB"
			И я нажимаю на кнопку с именем 'FormWriteAndClose'
			И я жду закрытия окна "* (Report indicators) *" в течение 20 секунд
		* Дата курса	
			Тогда открылось окно "Report wizard"
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R11C2'
			И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
			Тогда открылось окно "* (Report indicators)"
			И из выпадающего списка с именем 'ValueType' я выбираю точное значение "Date"
			И я нажимаю на кнопку с именем 'FormWriteAndClose'
			И я жду закрытия окна "* (Report indicators) *" в течение 20 секунд
		* Выручка по валюте [Курс на дату указанную в показателе]	
			Тогда открылось окно "Report wizard"
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R12C2'
			И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
			Тогда открылось окно "* (Report indicators)"
			И я перехожу к закладке с именем 'CurrenciesConversion'
			И из выпадающего списка с именем 'CurrExchangeType' я выбираю точное значение "Exchange rate as of the date specified in the indicator"
			И я нажимаю кнопку выбора у поля с именем 'LinkedIndicator'
			И Я выбираю показатель с кодом "EffectiveOn_Value"
			Тогда открылось окно "* (Report indicators) *"
			И я нажимаю на кнопку с именем 'FormWriteAndClose'
			И я жду закрытия окна "* (Report indicators) *" в течение 20 секунд
		* Выручка по валюте [Курс на дату указанную в показателе другого отчета]	
			Тогда открылось окно "Report wizard"
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R13C2'
			И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
			Тогда открылось окно "* (Report indicators)"
			И я перехожу к закладке с именем 'CurrenciesConversion'
			И из выпадающего списка с именем 'CurrExchangeType' я выбираю точное значение "Exchange rate as of the date specified in the indicator"
			И я нажимаю кнопку выбора у поля с именем 'LinkedIndicator'
			И Я выбираю показатель с кодом "EffectiveOn_Value" вида отчета "VA - Currency indicators (source)"
			Тогда открылось окно "* (Report indicators) *"
			И я нажимаю на кнопку с именем 'FormWriteAndClose'
			И я жду закрытия окна "* (Report indicators) *" в течение 20 секунд
		* Курс (EUR)	
			Тогда открылось окно "Report wizard"
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R14C2'
			И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
			Тогда открылось окно "* (Report indicators)"
			И из выпадающего списка с именем 'TotalKind' я выбираю точное значение "Total by dimensions is not calculated"
			И я изменяю флаг с именем 'NonFinancial'
			И я нажимаю на кнопку с именем 'FormWriteAndClose'
			И я жду закрытия окна "* (Report indicators) *" в течение 20 секунд
		* Курс (USD)	
			Тогда открылось окно "Report wizard"
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R15C2'
			И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
			Тогда открылось окно "* (Report indicators)"
			И из выпадающего списка с именем 'TotalKind' я выбираю точное значение "Total by dimensions is not calculated"
			И я изменяю флаг с именем 'NonFinancial'
			И я нажимаю на кнопку с именем 'FormWriteAndClose'
			И я жду закрытия окна "* (Report indicators) *" в течение 20 секунд
		* Выручка по валюте [Курс указанный в показателе]	
			Тогда открылось окно "Report wizard"
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R16C2'
			И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
			Тогда открылось окно "* (Report indicators)"
			И я перехожу к закладке с именем 'CurrenciesConversion'
			И из выпадающего списка с именем 'CurrExchangeType' я выбираю точное значение "Rate specified in the indicator"
			* EUR
				И в таблице 'IndicatorsForExchangeRates' я нажимаю на кнопку с именем 'IndicatorsForExchangeRatesAdd'
				И в таблице 'IndicatorsForExchangeRates' из выпадающего списка с именем 'IndicatorsForExchangeRatesCurrency' я выбираю точное значение "EUR"
				И я перехожу к следующему реквизиту
				И в таблице 'IndicatorsForExchangeRates' я нажимаю кнопку выбора у реквизита с именем 'IndicatorsForExchangeRatesRateIndicator'
				И Я выбираю показатель с кодом "RateEUR_Value" вида отчета "VA - Currency indicators (recipient)"
				Тогда открылось окно "* (Report indicators) *"
				И в таблице 'IndicatorsForExchangeRates' в поле с именем 'IndicatorsForExchangeRatesRepetition' я ввожу текст '1'
				И в таблице 'IndicatorsForExchangeRates' я завершаю редактирование строки
			* USD
				И в таблице 'IndicatorsForExchangeRates' я нажимаю на кнопку с именем 'IndicatorsForExchangeRatesAdd'
				И в таблице 'IndicatorsForExchangeRates' из выпадающего списка с именем 'IndicatorsForExchangeRatesCurrency' я выбираю точное значение "USD"
				И я перехожу к следующему реквизиту
				И в таблице 'IndicatorsForExchangeRates' я нажимаю кнопку выбора у реквизита с именем 'IndicatorsForExchangeRatesRateIndicator'
				И Я выбираю показатель с кодом "RateUSD_Value" вида отчета "VA - Currency indicators (recipient)"
				Тогда открылось окно "* (Report indicators) *"
				И в таблице 'IndicatorsForExchangeRates' в поле с именем 'IndicatorsForExchangeRatesRepetition' я ввожу текст '1'
				И в таблице 'IndicatorsForExchangeRates' я завершаю редактирование строки	
			И я нажимаю на кнопку с именем 'FormWriteAndClose'
			И я жду закрытия окна "* (Report indicators) *" в течение 20 секунд
		* Выручка по валюте [Курс указанный в показателе другого отчета]
			Тогда открылось окно "Report wizard"
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R17C2'
			И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
			Тогда открылось окно "* (Report indicators)"
			И я перехожу к закладке с именем 'CurrenciesConversion'
			И из выпадающего списка с именем 'CurrExchangeType' я выбираю точное значение "Rate specified in the indicator"
			* EUR
				И в таблице 'IndicatorsForExchangeRates' я нажимаю на кнопку с именем 'IndicatorsForExchangeRatesAdd'
				И в таблице 'IndicatorsForExchangeRates' из выпадающего списка с именем 'IndicatorsForExchangeRatesCurrency' я выбираю точное значение "EUR"
				И я перехожу к следующему реквизиту
				И в таблице 'IndicatorsForExchangeRates' я нажимаю кнопку выбора у реквизита с именем 'IndicatorsForExchangeRatesRateIndicator'
				И Я выбираю показатель с кодом "RateEUR_Value" вида отчета "VA - Currency indicators (source)"
				Тогда открылось окно "* (Report indicators) *"
				И в таблице 'IndicatorsForExchangeRates' в поле с именем 'IndicatorsForExchangeRatesRepetition' я ввожу текст '1'
				И в таблице 'IndicatorsForExchangeRates' я завершаю редактирование строки
			* USD
				И в таблице 'IndicatorsForExchangeRates' я нажимаю на кнопку с именем 'IndicatorsForExchangeRatesAdd'
				И в таблице 'IndicatorsForExchangeRates' из выпадающего списка с именем 'IndicatorsForExchangeRatesCurrency' я выбираю точное значение "USD"
				И я перехожу к следующему реквизиту
				И в таблице 'IndicatorsForExchangeRates' я нажимаю кнопку выбора у реквизита с именем 'IndicatorsForExchangeRatesRateIndicator'
				И Я выбираю показатель с кодом "RateUSD_Value" вида отчета "VA - Currency indicators (source)"
				Тогда открылось окно "* (Report indicators) *"
				И в таблице 'IndicatorsForExchangeRates' в поле с именем 'IndicatorsForExchangeRatesRepetition' я ввожу текст '1'
				И в таблице 'IndicatorsForExchangeRates' я завершаю редактирование строки	
			И я нажимаю на кнопку с именем 'FormWriteAndClose'
			И я жду закрытия окна "* (Report indicators) *" в течение 20 секунд

	* Устанавливаем аналитики отчета
		И Я в конструкторе отчета добавляю аналитику с кодом "VA0Counter" в ячейку 'R2C2'
		Когда открылось окно "Report wizard"
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R2C8'
		И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R3C8'
		И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R4C8'
		И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R5C8'
		И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R6C8'
		И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R7C8'
		И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R8C8'
		И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R9C8'
		И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R10C8'
		И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R12C8'
		И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R13C8'
		И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R16C8'
		И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R17C8'
		И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
		И Я в конструкторе отчета в ячейке 'R2C2:R17C2' меняю свойства показателей 'ShouldRecalculateForeignCurrencyAmount' на 'True'						

	* Вводим источники данных
		* Выручка по валюте
			И Я в конструкторе отчета для ячейки 'R2C2' настраиваю связь с показателем с кодом "RevenueInCurrency_Value" вида отчета "VA - Currency indicators (source)"
		* Выручка по валюте [Средний курс за период]
			И Я в конструкторе отчета для ячейки 'R3C2' настраиваю связь с показателем с кодом "RevenueByCurrency_Value" вида отчета "VA - Currency indicators (source)"	
		* Выручка по валюте [Средний курс за период МСФО]	
			Тогда открылось окно "Report wizard"
			И я нажимаю на кнопку с именем 'CopyFormula'
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R4C2'
			И я нажимаю на кнопку с именем 'InsertFormula'
		* Выручка по валюте [Средний курс за период ЦБ]	
			И я нажимаю на кнопку с именем 'CopyFormula'
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R5C2'
			И я нажимаю на кнопку с именем 'InsertFormula'
		* Выручка по валюте [Курс на начало периода]	
			И я нажимаю на кнопку с именем 'CopyFormula'
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R6C2'
			И я нажимаю на кнопку с именем 'InsertFormula'
		* Выручка по валюте [Курс на конец периода]	
			И я нажимаю на кнопку с именем 'CopyFormula'
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R7C2'
			И я нажимаю на кнопку с именем 'InsertFormula'
		* Выручка по валюте [Средний курс за предыдущий период]	
			И я нажимаю на кнопку с именем 'CopyFormula'
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R8C2'
			И я нажимаю на кнопку с именем 'InsertFormula'
		* Выручка по валюте [Курс на конец предыдущего периода]	
			И я нажимаю на кнопку с именем 'CopyFormula'
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R9C2'
			И я нажимаю на кнопку с именем 'InsertFormula'
		* Выручка по валюте [Средний курс за предыдущий период ЦБ]	
			И я нажимаю на кнопку с именем 'CopyFormula'
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R10C2'
			И я нажимаю на кнопку с именем 'InsertFormula'
		* Выручка по валюте [Курс на дату указанную в показателе]	
			И я нажимаю на кнопку с именем 'CopyFormula'
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R12C2'
			И я нажимаю на кнопку с именем 'InsertFormula'
		* Выручка по валюте [Курс на дату указанную в показателе другого отчета]	
			И я нажимаю на кнопку с именем 'CopyFormula'
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R13C2'
			И я нажимаю на кнопку с именем 'InsertFormula'
		* Выручка по валюте [Курс указанный в показателе]	
			И я нажимаю на кнопку с именем 'CopyFormula'
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R16C2'
			И я нажимаю на кнопку с именем 'InsertFormula'
		* Выручка по валюте [Курс указанный в показателе другого отчета]	
			И я нажимаю на кнопку с именем 'CopyFormula'
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R17C2'
			И я нажимаю на кнопку с именем 'InsertFormula'
		* Дата курса
			И Я в конструкторе отчета для ячейки 'R11C2' настраиваю связь с показателем с кодом "EffectiveOn_Value" вида отчета "VA - Currency indicators (source)"	
		* Курс (EUR)
			И Я в конструкторе отчета для ячейки 'R14C2' настраиваю связь с показателем с кодом "RateEUR_Value" вида отчета "VA - Currency indicators (source)"	
		* Курс (USD)
			И Я в конструкторе отчета для ячейки 'R15C2' настраиваю связь с показателем с кодом "RateUSD_Value" вида отчета "VA - Currency indicators (source)"	

	* Включим возможность редактирования показателей
		Когда открылось окно "Report wizard"
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке "R3C2"
		И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
		И я устанавливаю флаг с именем 'FormulaEditorEditingImpossible'
		И я нажимаю на кнопку с именем 'WriteAndCollapse'
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке "R4C2"
		И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
		И я устанавливаю флаг с именем 'FormulaEditorEditingImpossible'
		И я нажимаю на кнопку с именем 'WriteAndCollapse'
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке "R5C2"
		И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
		И я устанавливаю флаг с именем 'FormulaEditorEditingImpossible'
		И я нажимаю на кнопку с именем 'WriteAndCollapse'
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке "R6C2"
		И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
		И я устанавливаю флаг с именем 'FormulaEditorEditingImpossible'
		И я нажимаю на кнопку с именем 'WriteAndCollapse'
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке "R7C2"
		И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
		И я устанавливаю флаг с именем 'FormulaEditorEditingImpossible'
		И я нажимаю на кнопку с именем 'WriteAndCollapse'
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке "R8C2"
		И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
		И я устанавливаю флаг с именем 'FormulaEditorEditingImpossible'
		И я нажимаю на кнопку с именем 'WriteAndCollapse'
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке "R9C2"
		И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
		И я устанавливаю флаг с именем 'FormulaEditorEditingImpossible'
		И я нажимаю на кнопку с именем 'WriteAndCollapse'
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке "R10C2"
		И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
		И я устанавливаю флаг с именем 'FormulaEditorEditingImpossible'
		И я нажимаю на кнопку с именем 'WriteAndCollapse'
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке "R11C2"
		И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
		И я устанавливаю флаг с именем 'FormulaEditorEditingImpossible'
		И я нажимаю на кнопку с именем 'WriteAndCollapse'
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке "R12C2"
		И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
		И я устанавливаю флаг с именем 'FormulaEditorEditingImpossible'
		И я нажимаю на кнопку с именем 'WriteAndCollapse'
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке "R13C2"
		И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
		И я устанавливаю флаг с именем 'FormulaEditorEditingImpossible'
		И я нажимаю на кнопку с именем 'WriteAndCollapse'
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке "R14C2"
		И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
		И я устанавливаю флаг с именем 'FormulaEditorEditingImpossible'
		И я нажимаю на кнопку с именем 'WriteAndCollapse'
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке "R15C2"
		И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
		И я устанавливаю флаг с именем 'FormulaEditorEditingImpossible'
		И я нажимаю на кнопку с именем 'WriteAndCollapse'
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке "R16C2"
		И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
		И я устанавливаю флаг с именем 'FormulaEditorEditingImpossible'
		И я нажимаю на кнопку с именем 'WriteAndCollapse'
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке "R17C2"
		И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
		И я устанавливаю флаг с именем 'FormulaEditorEditingImpossible'
		И я нажимаю на кнопку с именем 'WriteAndCollapse'				

Сценарий: 09.05 Создание многопериодного бланка для вида отчета "VA - Currency indicators (recipient)"

	И Я Для вида отчета "VA - Currency indicators (recipient)" создаю бланк по умолчанию

	* Открываем бланк
		И Я нахожу в списке вид отчета с именем "VA - Currency indicators (recipient)"
		Тогда открылось окно "Report types and templates"
		И в таблице 'List' я перехожу к строке:
			| "Description"                        |
			| "VA - Currency indicators (recipient)" |
		И в таблице 'List' я выбираю текущую строку
		И я запоминаю заголовок формы в переменную 'WindowTitle'

	* Добавляем колонку с значением валюта
		* Период отчета
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R1C4'
			И я нажимаю на кнопку с именем 'AddAreaToColumnInGroupingRight'
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R5C4:R36C4'
			И я нажимаю на кнопку с именем 'CopyToClipboard'
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R5C5:R36C5'
			И я нажимаю на кнопку с именем 'PasteFromClipboard'
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R5C4:R5C5'
			И я нажимаю на кнопку с именем 'Union'
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R7C5:R8C5'
			И я нажимаю на кнопку с именем 'ClearContent'
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R9C5'
			И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
			Тогда открылось окно "Indicator value filter settings"
			И я изменяю флаг с именем 'AmountInAddlCurrency'
			И я нажимаю на кнопку с именем 'FormApply'
			Тогда открылось окно '$WindowTitle$ *'
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R10C5'
			И я нажимаю на кнопку с именем 'ClearContent'
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R11C5'
			И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
			Тогда открылось окно "Indicator value filter settings"
			И я изменяю флаг с именем 'AmountInAddlCurrency'
			И я нажимаю на кнопку с именем 'FormApply'
			Тогда открылось окно '$WindowTitle$ *'
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R12C5'
			И я нажимаю на кнопку с именем 'ClearContent'
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R13C5'
			И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
			Тогда открылось окно "Indicator value filter settings"
			И я изменяю флаг с именем 'AmountInAddlCurrency'
			И я нажимаю на кнопку с именем 'FormApply'
			Тогда открылось окно '$WindowTitle$ *'
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R14C5'
			И я нажимаю на кнопку с именем 'ClearContent'
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R15C5'
			И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
			Тогда открылось окно "Indicator value filter settings"
			И я изменяю флаг с именем 'AmountInAddlCurrency'
			И я нажимаю на кнопку с именем 'FormApply'
			Тогда открылось окно '$WindowTitle$ *'
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R16C5'
			И я нажимаю на кнопку с именем 'ClearContent'
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R17C5'
			И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
			Тогда открылось окно "Indicator value filter settings"
			И я изменяю флаг с именем 'AmountInAddlCurrency'
			И я нажимаю на кнопку с именем 'FormApply'
			Тогда открылось окно '$WindowTitle$ *'
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R18C5'
			И я нажимаю на кнопку с именем 'ClearContent'
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R19C5'
			И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
			Тогда открылось окно "Indicator value filter settings"
			И я изменяю флаг с именем 'AmountInAddlCurrency'
			И я нажимаю на кнопку с именем 'FormApply'
			Тогда открылось окно '$WindowTitle$ *'
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R20C5'
			И я нажимаю на кнопку с именем 'ClearContent'
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R21C5'
			И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
			Тогда открылось окно "Indicator value filter settings"
			И я изменяю флаг с именем 'AmountInAddlCurrency'
			И я нажимаю на кнопку с именем 'FormApply'
			Тогда открылось окно '$WindowTitle$ *'
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R22C5'
			И я нажимаю на кнопку с именем 'ClearContent'
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R23C5'
			И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
			Тогда открылось окно "Indicator value filter settings"
			И я изменяю флаг с именем 'AmountInAddlCurrency'
			И я нажимаю на кнопку с именем 'FormApply'
			Тогда открылось окно '$WindowTitle$ *'
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R24C5'
			И я нажимаю на кнопку с именем 'ClearContent'
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R25C5'
			И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
			Тогда открылось окно "Indicator value filter settings"
			И я изменяю флаг с именем 'AmountInAddlCurrency'
			И я нажимаю на кнопку с именем 'FormApply'
			Тогда открылось окно '$WindowTitle$ *'
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R26C5:R27C5'
			И я нажимаю на кнопку с именем 'ClearContent'
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R28C5'
			И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
			Тогда открылось окно "Indicator value filter settings"
			И я изменяю флаг с именем 'AmountInAddlCurrency'
			И я нажимаю на кнопку с именем 'FormApply'
			Тогда открылось окно '$WindowTitle$ *'
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R29C5'
			И я нажимаю на кнопку с именем 'ClearContent'
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R30C5'
			И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
			Тогда открылось окно "Indicator value filter settings"
			И я изменяю флаг с именем 'AmountInAddlCurrency'
			И я нажимаю на кнопку с именем 'FormApply'
			Тогда открылось окно '$WindowTitle$ *'
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R31C5:R33C5'
			И я нажимаю на кнопку с именем 'ClearContent'
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R34C5'
			И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
			Тогда открылось окно "Indicator value filter settings"
			И я изменяю флаг с именем 'AmountInAddlCurrency'
			И я нажимаю на кнопку с именем 'FormApply'
			Тогда открылось окно '$WindowTitle$ *'
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R35C5'
			И я нажимаю на кнопку с именем 'ClearContent'
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R36C5'
			И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
			Тогда открылось окно "Indicator value filter settings"
			И я изменяю флаг с именем 'AmountInAddlCurrency'
			И я нажимаю на кнопку с именем 'FormApply'
		* Итог	
			Тогда открылось окно '$WindowTitle$ *'
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R1C6'
			И я нажимаю на кнопку с именем 'AddAreaToColumnInGroupingRight'
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R5C6:R36C6'
			И я нажимаю на кнопку с именем 'CopyToClipboard'
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R5C7:R36C7'
			И я нажимаю на кнопку с именем 'PasteFromClipboard'
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R5C6:R5C7'
			И я нажимаю на кнопку с именем 'Union'
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R7C7:R8C7'
			И я нажимаю на кнопку с именем 'ClearContent'
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R9C7'
			И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
			Тогда открылось окно "Indicator value filter settings"
			И я изменяю флаг с именем 'AmountInAddlCurrency'
			И я нажимаю на кнопку с именем 'FormApply'
			Тогда открылось окно '$WindowTitle$ *'
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R10C7'
			И я нажимаю на кнопку с именем 'ClearContent'
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R11C7'
			И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
			Тогда открылось окно "Indicator value filter settings"
			И я изменяю флаг с именем 'AmountInAddlCurrency'
			И я нажимаю на кнопку с именем 'FormApply'
			Тогда открылось окно '$WindowTitle$ *'
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R12C7'
			И я нажимаю на кнопку с именем 'ClearContent'
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R13C7'
			И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
			Тогда открылось окно "Indicator value filter settings"
			И я изменяю флаг с именем 'AmountInAddlCurrency'
			И я нажимаю на кнопку с именем 'FormApply'
			Тогда открылось окно '$WindowTitle$ *'
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R14C7'
			И я нажимаю на кнопку с именем 'ClearContent'
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R15C7'
			И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
			Тогда открылось окно "Indicator value filter settings"
			И я изменяю флаг с именем 'AmountInAddlCurrency'
			И я нажимаю на кнопку с именем 'FormApply'
			Тогда открылось окно '$WindowTitle$ *'
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R16C7'
			И я нажимаю на кнопку с именем 'ClearContent'
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R17C7'
			И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
			Тогда открылось окно "Indicator value filter settings"
			И я изменяю флаг с именем 'AmountInAddlCurrency'
			И я нажимаю на кнопку с именем 'FormApply'
			Тогда открылось окно '$WindowTitle$ *'
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R18C7'
			И я нажимаю на кнопку с именем 'ClearContent'
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R19C7'
			И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
			Тогда открылось окно "Indicator value filter settings"
			И я изменяю флаг с именем 'AmountInAddlCurrency'
			И я нажимаю на кнопку с именем 'FormApply'
			Тогда открылось окно '$WindowTitle$ *'
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R20C7'
			И я нажимаю на кнопку с именем 'ClearContent'
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R21C7'
			И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
			Тогда открылось окно "Indicator value filter settings"
			И я изменяю флаг с именем 'AmountInAddlCurrency'
			И я нажимаю на кнопку с именем 'FormApply'
			Тогда открылось окно '$WindowTitle$ *'
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R22C7'
			И я нажимаю на кнопку с именем 'ClearContent'
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R23C7'
			И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
			Тогда открылось окно "Indicator value filter settings"
			И я изменяю флаг с именем 'AmountInAddlCurrency'
			И я нажимаю на кнопку с именем 'FormApply'
			Тогда открылось окно '$WindowTitle$ *'
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R24C7'
			И я нажимаю на кнопку с именем 'ClearContent'
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R25C7'
			И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
			Тогда открылось окно "Indicator value filter settings"
			И я изменяю флаг с именем 'AmountInAddlCurrency'
			И я нажимаю на кнопку с именем 'FormApply'
			Тогда открылось окно '$WindowTitle$ *'
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R26C7:R27C7'
			И я нажимаю на кнопку с именем 'ClearContent'
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R28C7'
			И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
			Тогда открылось окно "Indicator value filter settings"
			И я изменяю флаг с именем 'AmountInAddlCurrency'
			И я нажимаю на кнопку с именем 'FormApply'
			Тогда открылось окно '$WindowTitle$ *'
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R29C7'
			И я нажимаю на кнопку с именем 'ClearContent'
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R30C7'
			И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
			Тогда открылось окно "Indicator value filter settings"
			И я изменяю флаг с именем 'AmountInAddlCurrency'
			И я нажимаю на кнопку с именем 'FormApply'
			Тогда открылось окно '$WindowTitle$ *'
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R31C7:R33C7'
			И я нажимаю на кнопку с именем 'ClearContent'
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R34C7'
			И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
			Тогда открылось окно "Indicator value filter settings"
			И я изменяю флаг с именем 'AmountInAddlCurrency'
			И я нажимаю на кнопку с именем 'FormApply'
			Тогда открылось окно '$WindowTitle$ *'
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R35C7'
			И я нажимаю на кнопку с именем 'ClearContent'
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R36C7'
			И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
			Тогда открылось окно "Indicator value filter settings"
			И я изменяю флаг с именем 'AmountInAddlCurrency'
			И я нажимаю на кнопку с именем 'FormApply'	
				
	* Записываем бланк
		Когда открылось окно '$WindowTitle$ *'
		И я нажимаю на кнопку с именем 'FormButtonWriteAndClose'

Сценарий: 09.06 Настройка прав для пользователя "Budgeting1"

	И Я добавляю право "Read, write" для вида отчета "VA - Currency indicators (source)" пользователя "Budgeting1" по всем организациям
	И Я добавляю право "Read, write" для вида отчета "VA - Currency indicators (recipient)" пользователя "Budgeting1" по всем организациям
	И я закрываю TestClient "CPM - Budget"
	И я подключаю TestClient "CPM - Budget" логин "Budgeting1" пароль ''

Сценарий: 09.07 Создание экземпляра отчета - "VA - Currency indicators (source)" 

	И Я создаю экземпляр отчета для вида отчета "VA - Currency indicators (source)" сценарий "VA - Main scenario" период '1/1/2024' '3/31/2024' периодичность "Month" организация "Mercury LLC" проект "VA - Main project" аналитики '' '' '' '' '' '' 

	* Вводим значения невалютных показателей
		Когда открылось окно '$WindowTitle$'		
		И Я добавляю значения с раскрытием показателей в ячейку 'R6C2'
				| "VA0Counter"      | 'Value1'     |
				| "LLC \"Ganymede\"" | '100,000.00000' |
				| "LLC \"Io\""      | '200,000.00000' |

	* Вводим значения с аналитиками, проверяем пересчет в валюту
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R9C1'
		И я нажимаю на кнопку с именем 'DisplayADrilldown'
		Тогда открылось окно "Drill down indicators: *"
		И я заполняю таблицу 'IndicatorsDrilldown' данными
			| "Counterparties"     | "Currencies" | 'Period_1_Value1' | 'Period_1_ValueCurrency1' |
			| "LLC \"Ganymede\"" | 'RUB'    | ''                   | '100,000.00000'            |
			| "LLC \"Ganymede\"" | 'USD'    | '90,000.00000'       | ''                         |
			| "LLC \"Ganymede\"" | 'EUR'    | '110,000.00000'      | ''                         |
			| "LLC \"Io\""      | 'RUB'    | ''                   | '200,000.00000'            |
			| "LLC \"Io\""      | 'USD'    | '180,000.00000'      |                            |
			| "LLC \"Io\""      | 'EUR'    | '220,000.00000'      |                            |
		Тогда таблица 'IndicatorsDrilldown' стала равной:
			| "Counterparties"     | "Currencies" | 'Period_1_Value1' | 'Period_1_ValueCurrency1' | 'Period_2_Value1' | 'Period_2_ValueCurrency1' | 'Period_3_Value1' | 'Period_3_ValueCurrency1' |
			| "LLC \"Ganymede\"" | 'RUB'    | '100,000.00000'      | '100,000.00000'            | ''                   | ''                         | ''                   | ''                         |
			| "LLC \"Ganymede\"" | 'USD'    | '90,000.00000'       | '1,212.60462'              | ''                   | ''                         | ''                   | ''                         |
			| "LLC \"Ganymede\"" | 'EUR'    | '110,000.00000'      | '1,215.50856'              | ''                   | ''                         | ''                   | ''                         |
			| "LLC \"Io\""      | 'RUB'    | '200,000.00000'      | '200,000.00000'            | ''                   | ''                         | ''                   | ''                         |
			| "LLC \"Io\""      | 'USD'    | '180,000.00000'      | '2,425.20924'              | ''                   | ''                         | ''                   | ''                         |
			| "LLC \"Io\""      | 'EUR'    | '220,000.00000'      | '2,431.01713'              | ''                   | ''                         | ''                   | ''                         |
		И я нажимаю на кнопку с именем 'FormOKButton1'
		И я жду закрытия окна "Drill down indicators: *" в течение 20 секунд	

	* Вводим значения, проверяем пересчет в валюту			
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R18C2'
		И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
		Тогда открылось окно "Drill down indicators: *"
		И я заполняю таблицу 'IndicatorsDrilldown' данными
			| 'DimensionCurrency' | 'Value1' | 'ValueCurrency1' |
			| 'RUB'             | ''          | '300,000.00000'   |
			| 'USD'             | ''          | '3500'            |
			| 'EUR'             | ''          | '3600'            |
		И в поле с именем 'Accuracy' я ввожу текст '4'
		И из выпадающего списка с именем 'Divisor' я выбираю точное значение "thousands"
		Тогда таблица 'IndicatorsDrilldown' стала равной:
			| "Currencies" | 'Value1' | 'ValueCurrency1' |
			| 'RUB'    | '300.0000'  | '300.0000'        |
			| 'USD'    | '259.7714'  | '3.5000'          |
			| 'EUR'    | '325.7896'  | '3.6000'          |
		И в таблице 'IndicatorsDrilldown' я нажимаю на кнопку с именем 'IndicatorsDrilldownDelete'
		И я заполняю таблицу 'IndicatorsDrilldown' данными		
			| 'DimensionCurrency' | 'Value1'     |
			| 'RUB'             | '300,000.00000' |
			| 'USD'             | '270,000.00000' |
			| 'EUR'             | '330,000.00000' |
		Тогда таблица 'IndicatorsDrilldown' стала равной:
			| "Currencies" | 'Value1' | 'ValueCurrency1' |
			| 'RUB'    | '300.0000'  | '300.0000'        |
			| 'USD'    | '270.0000'  | '3.6378'          |
			| 'EUR'    | '330.0000'  | '3.6465'          |
		И я нажимаю на кнопку с именем 'FormOKButton1'
		И я жду закрытия окна "Drill down indicators: *" в течение 20 секунд

	* Копируем значения показателей
		Когда открылось окно '$WindowTitle$'
		И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R6C2:R21C2'
		И я нажимаю на кнопку с именем 'SpreadsheetFieldTemplateCopyDataOnRow'

	* Вводим значения для расчета курсов
		Когда открылось окно '$WindowTitle$'
		И Я ввожу значение '3/1/2024' в ячейку 'R22C2'
		И Я ввожу значение '2/1/2024' в ячейку 'R22C4'
		И Я ввожу значение '1/1/2024' в ячейку 'R22C6'
		И Я ввожу значение '90.00000' в ячейку 'R23C2'
		И Я ввожу значение '91.00000' в ячейку 'R23C4'
		И Я ввожу значение '92.00000' в ячейку 'R23C6'
		И Я ввожу значение '73.00000' в ячейку 'R24C2'
		И Я ввожу значение '74.00000' в ячейку 'R24C4'
		И Я ввожу значение '75.00000' в ячейку 'R24C6'

	* Сравниваем итоговый документ
		Тогда табличный документ 'SpreadsheetFieldTemlate' равен:
			| "VA - Currency indicators (source)" | ''               | ''            | ''                | ''            | ''             | ''            | ''          | ''         |
			| ''                                    | ''               | ''            | ''                | ''            | ''             | ''            | ''          | ''         |
			| ''                                    | "January 2024" | ''            | "February 2024" | ''            | "March 2024" | ''            | "TOTAL"     | "TOTAL"    |
			| ''                                    | "Value"       | 'Sum (вал)' | "Value"        | 'Sum (вал)' | "Value"     | 'Sum (вал)' | "Value"  | "Value" |
			| "Revenue"                             | '300,000'        | ''            | '300,000'         | ''            | '300,000'      | ''            | '900,000'   | ''         |
			| "LLC \"Ganymede\" "                    | '100,000'        | ''            | '100,000'         | ''            | '100,000'      | ''            | '300,000'   | ''         |
			| "LLC \"Io\" "                         | '200,000'        | ''            | '200,000'         | ''            | '200,000'      | ''            | '600,000'   | ''         |
			| "Revenue in currency"                    | '900,000'        | ''            | '900,000'         | ''            | '900,000'      | ''            | '2,700,000' | ''         |
			| "LLC \"Ganymede\" "                    | '300,000'        | ''            | '300,000'         | ''            | '300,000'      | ''            | '900,000'   | ''         |
			| 'EUR '                                | '110,000'        | '1,216'       | '110,000'         | '1,223'       | '110,000'      | '1,240'       | '330,000'   | '3,679'    |
			| 'RUB '                                | '100,000'        | '100,000'     | '100,000'         | '100,000'     | '100,000'      | '100,000'     | '300,000'   | '300,000'  |
			| 'USD '                                | '90,000'         | '1,213'       | '90,000'          | '1,210'       | '90,000'       | '1,210'       | '270,000'   | '3,632'    |
			| "LLC \"Io\" "                         | '600,000'        | ''            | '600,000'         | ''            | '600,000'      | ''            | '1,800,000' | ''         |
			| 'EUR '                                | '220,000'        | '2,431'       | '220,000'         | '2,446'       | '220,000'      | '2,481'       | '660,000'   | '7,358'    |
			| 'RUB '                                | '200,000'        | '200,000'     | '200,000'         | '200,000'     | '200,000'      | '200,000'     | '600,000'   | '600,000'  |
			| 'USD '                                | '180,000'        | '2,425'       | '180,000'         | '2,420'       | '180,000'      | '2,419'       | '540,000'   | '7,265'    |
			| "Revenue by currency"                   | '900,000'        | ''            | '900,000'         | ''            | '900,000'      | ''            | '2,700,000' | ''         |
			| 'EUR '                                | '330,000'        | '3,647'       | '330,000'         | '3,669'       | '330,000'      | '3,721'       | '990,000'   | '11,037'   |
			| 'RUB '                                | '300,000'        | '300,000'     | '300,000'         | '300,000'     | '300,000'      | '300,000'     | '900,000'   | '900,000'  |
			| 'USD '                                | '270,000'        | '3,638'       | '270,000'         | '3,630'       | '270,000'      | '3,629'       | '810,000'   | '10,897'   |
			| "Effective on"                          | '3/1/2024'     | ''            | '2/1/2024'      | ''            | '1/1/2024'   | ''            | ''          | ''         |
			| "Rate [EUR]"                          | '90'             | ''            | '91'              | ''            | '92'           | ''            | '273'       | ''         |
			| "Rate [USD]"                          | '73'             | ''            | '74'              | ''            | '75'           | ''            | '222'       | ''         |

	* Записываем документ	
		Когда открылось окно '$WindowTitle$'
		И я нажимаю на кнопку с именем 'Write'

	* Сравниваем движения	
		Тогда открылось окно '$WindowTitle$'
		И я нажимаю на кнопку с именем 'FormOpenDocumentRegisterRecordsFlatTab'
		Тогда открылось окно "Flat table of indicator values"
		И я жду когда в табличном документе 'ReportSpreadsheetDocument' заполнится ячейка 'R2C1' в течение 30 секунд
		Дано Табличный документ 'ReportSpreadsheetDocument' равен макету "Макеты\09\ВА_ВалютныеПоказатели_Источник_Движения.mxl" по шаблону

Сценарий: 09.08 Ручное заполнение экземпляра отчета - "VA - Currency indicators (recipient)" 

	И Я создаю экземпляр отчета для вида отчета "VA - Currency indicators (recipient)" сценарий "VA - Main scenario" период '1/1/2024' '3/31/2024' периодичность "Month" организация "Mercury LLC" проект "VA - Main project" аналитики '' '' '' '' '' '' 

	* Проверяем значения в форме редактирования показателей
		* Выручка по валюте [Средний курс за период]
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R7C2'
			И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
			Тогда открылось окно "Drill down indicators: *"
			И я заполняю таблицу 'IndicatorsDrilldown' данными
				| "Currencies" | 'Value1' | 'ValueCurrency1' |
				| 'RUB'    | '300,000'   | ''                |
				| 'USD'    | '270,000'   | ''                |
				| 'EUR'    | '330,000'   | ''                |
			Тогда таблица 'IndicatorsDrilldown' стала равной:
				| "Currencies" | 'Value1' | 'ValueCurrency1' |
				| 'RUB'    | '300,000'   | '300,000'         |
				| 'USD'    | '270,000'   | '3,638'           |
				| 'EUR'    | '330,000'   | '3,647'           |
			И я нажимаю на кнопку с именем 'FormOKButton1'
			И я жду закрытия окна "Drill down indicators: *" в течение 20 секунд
		* Выручка по валюте [Средний курс за период МСФО]
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R11C2'
			И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
			Тогда открылось окно "Drill down indicators: *"
			И я заполняю таблицу 'IndicatorsDrilldown' данными
				| "Currencies" | 'Value1' | 'ValueCurrency1' |
				| 'RUB'    | '300,000'   | ''                |
				| 'USD'    | '270,000'   | ''                |
				| 'EUR'    | '330,000'   | ''                |
			Тогда таблица 'IndicatorsDrilldown' стала равной:
				| "Currencies" | 'Value1' | 'ValueCurrency1' |
				| 'RUB'    | '300,000'   | '300,000'         |
				| 'USD'    | '270,000'   | '3,597'           |
				| 'EUR'    | '330,000'   | '3,605'           |
			И я нажимаю на кнопку с именем 'FormOKButton1'
			И я жду закрытия окна "Drill down indicators: *" в течение 20 секунд
		* Выручка по валюте [Средний курс за период ЦБ]
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R15C2'
			И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
			Тогда открылось окно "Drill down indicators: *"
			И я заполняю таблицу 'IndicatorsDrilldown' данными
				| "Currencies" | 'Value1' | 'ValueCurrency1' |
				| 'RUB'    | '300,000'   | ''                |
				| 'USD'    | '270,000'   | ''                |
				| 'EUR'    | '330,000'   | ''                |
			Тогда таблица 'IndicatorsDrilldown' стала равной:
				| "Currencies" | 'Value1' | 'ValueCurrency1' |
				| 'RUB'    | '300,000'   | '300,000'         |
				| 'USD'    | '270,000'   | '3,641'           |
				| 'EUR'    | '330,000'   | '3,648'           |
			И я нажимаю на кнопку с именем 'FormOKButton1'
			И я жду закрытия окна "Drill down indicators: *" в течение 20 секунд	
		* Выручка по валюте [Курс на начало периода]
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R19C2'
			И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
			Тогда открылось окно "Drill down indicators: *"
			И я заполняю таблицу 'IndicatorsDrilldown' данными
				| "Currencies" | 'Value1' | 'ValueCurrency1' |
				| 'RUB'    | '300,000'   | ''                |
				| 'USD'    | '270,000'   | ''                |
				| 'EUR'    | '330,000'   | ''                |
			Тогда таблица 'IndicatorsDrilldown' стала равной:
				| "Currencies" | 'Value1' | 'ValueCurrency1' |
				| 'RUB'    | '300,000'   | '300,000'         |
				| 'USD'    | '270,000'   | '3,655'           |
				| 'EUR'    | '330,000'   | '3,635'           |
			И я нажимаю на кнопку с именем 'FormOKButton1'
			И я жду закрытия окна "Drill down indicators: *" в течение 20 секунд
		* Выручка по валюте [Курс на конец периода]
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R23C2'
			И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
			Тогда открылось окно "Drill down indicators: *"
			И я заполняю таблицу 'IndicatorsDrilldown' данными
				| "Currencies" | 'Value1' | 'ValueCurrency1' |
				| 'RUB'    | '300,000'   | ''                |
				| 'USD'    | '270,000'   | ''                |
				| 'EUR'    | '330,000'   | ''                |
			Тогда таблица 'IndicatorsDrilldown' стала равной:
				| "Currencies" | 'Value1' | 'ValueCurrency1' |
				| 'RUB'    | '300,000'   | '300,000'         |
				| 'USD'    | '270,000'   | '3,541'           |
				| 'EUR'    | '330,000'   | '3,575'           |
			И я нажимаю на кнопку с именем 'FormOKButton1'
			И я жду закрытия окна "Drill down indicators: *" в течение 20 секунд
		* Выручка по валюте [Средний курс за предыдущий период]
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R27C4'
			И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
			Тогда открылось окно "Drill down indicators: *"
			И я заполняю таблицу 'IndicatorsDrilldown' данными
				| "Currencies" | 'Value1' | 'ValueCurrency1' |
				| 'RUB'    | '300,000'   | ''                |
				| 'USD'    | '270,000'   | ''                |
				| 'EUR'    | '330,000'   | ''                |
			Тогда таблица 'IndicatorsDrilldown' стала равной:
				| "Currencies" | 'Value1' | 'ValueCurrency1' |
				| 'RUB'    | '300,000'   | '300,000'         |
				| 'USD'    | '270,000'   | '3,638'           |
				| 'EUR'    | '330,000'   | '3,647'           |
			И я нажимаю на кнопку с именем 'FormOKButton1'
			И я жду закрытия окна "Drill down indicators: *" в течение 20 секунд
		* Выручка по валюте [Курс на конец предыдущего периода]
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R31C4'
			И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
			Тогда открылось окно "Drill down indicators: *"
			И я заполняю таблицу 'IndicatorsDrilldown' данными
				| "Currencies" | 'Value1' | 'ValueCurrency1' |
				| 'RUB'    | '300,000'   | ''                |
				| 'USD'    | '270,000'   | ''                |
				| 'EUR'    | '330,000'   | ''                |
			Тогда таблица 'IndicatorsDrilldown' стала равной:
				| "Currencies" | 'Value1' | 'ValueCurrency1' |
				| 'RUB'    | '300,000'   | '300,000'         |
				| 'USD'    | '270,000'   | '3,541'           |
				| 'EUR'    | '330,000'   | '3,575'           |
			И я нажимаю на кнопку с именем 'FormOKButton1'
			И я жду закрытия окна "Drill down indicators: *" в течение 20 секунд
		* Выручка по валюте [Средний курс за предыдущий период ЦБ]
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R35C4'
			И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
			Тогда открылось окно "Drill down indicators: *"
			И я заполняю таблицу 'IndicatorsDrilldown' данными
				| "Currencies" | 'Value1' | 'ValueCurrency1' |
				| 'RUB'    | '300,000'   | ''                |
				| 'USD'    | '270,000'   | ''                |
				| 'EUR'    | '330,000'   | ''                |
			Тогда таблица 'IndicatorsDrilldown' стала равной:
				| "Currencies" | 'Value1' | 'ValueCurrency1' |
				| 'RUB'    | '300,000'   | '300,000'         |
				| 'USD'    | '270,000'   | '3,641'           |
				| 'EUR'    | '330,000'   | '3,648'           |
			И я нажимаю на кнопку с именем 'FormOKButton1'
			И я жду закрытия окна "Drill down indicators: *" в течение 20 секунд
		* Дата курса
			И Я ввожу значение '3/1/2024' в ячейку 'R39C2'
		* Выручка по валюте [Курс на дату указанную в показателе]
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R40C2'
			И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
			Тогда открылось окно "Drill down indicators: *"
			И я заполняю таблицу 'IndicatorsDrilldown' данными
				| "Currencies" | 'Value1' | 'ValueCurrency1' |
				| 'RUB'    | '300,000'   | ''                |
				| 'USD'    | '270,000'   | ''                |
				| 'EUR'    | '330,000'   | ''                |
			Тогда таблица 'IndicatorsDrilldown' стала равной:
				| "Currencies" | 'Value1' | 'ValueCurrency1' |
				| 'RUB'    | '300,000'   | '300,000'         |
				| 'USD'    | '270,000'   | '3,627'           |
				| 'EUR'    | '330,000'   | '3,651'           |
			И я нажимаю на кнопку с именем 'FormOKButton1'
			И я жду закрытия окна "Drill down indicators: *" в течение 20 секунд
		* Выручка по валюте [Курс на дату указанную в показателе другого отчета]
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R44C2'
			И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
			Тогда открылось окно "Drill down indicators: *"
			И я заполняю таблицу 'IndicatorsDrilldown' данными
				| "Currencies" | 'Value1' | 'ValueCurrency1' |
				| 'RUB'    | '300,000'   | ''                |
				| 'USD'    | '270,000'   | ''                |
				| 'EUR'    | '330,000'   | ''                |
			Тогда таблица 'IndicatorsDrilldown' стала равной:
				| "Currencies" | 'Value1' | 'ValueCurrency1' |
				| 'RUB'    | '300,000'   | '300,000'         |
				| 'USD'    | '270,000'   | '3,627'           |
				| 'EUR'    | '330,000'   | '3,651'           |
			И я нажимаю на кнопку с именем 'FormOKButton1'
			И я жду закрытия окна "Drill down indicators: *" в течение 20 секунд	
		* Дата курса
			И Я ввожу значение '90' в ячейку 'R48C2'
		* Дата курса
			И Я ввожу значение '73' в ячейку 'R49C2'
		* Выручка по валюте [Курс указанный в показателе]
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R50C2'
			И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
			Тогда открылось окно "Drill down indicators: *"
			И я заполняю таблицу 'IndicatorsDrilldown' данными
				| "Currencies" | 'Value1' | 'ValueCurrency1' |
				| 'RUB'    | '300,000'   | ''                |
				| 'USD'    | '270,000'   | ''                |
				| 'EUR'    | '330,000'   | ''                 |
			Тогда таблица 'IndicatorsDrilldown' стала равной:
				| "Currencies" | 'Value1' | 'ValueCurrency1' |
				| 'RUB'    | '300,000'   | '300,000'         |
				| 'USD'    | '270,000'   | '3,699'           |
				| 'EUR'    | '330,000'   | '3,667'           |
			И я нажимаю на кнопку с именем 'FormOKButton1'
			И я жду закрытия окна "Drill down indicators: *" в течение 20 секунд
		* Выручка по валюте [Курс указанный в показателе другого отчета]
			И в табличном документе 'SpreadsheetFieldTemlate' я перехожу к ячейке 'R54C2'
			И в табличном документе 'SpreadsheetFieldTemlate' я делаю двойной клик на текущей ячейке
			Тогда открылось окно "Drill down indicators: *"
			И я заполняю таблицу 'IndicatorsDrilldown' данными
				| "Currencies" | 'Value1' | 'ValueCurrency1' |
				| 'RUB'    | '300,000'   | ''                |
				| 'USD'    | '270,000'   | ''                |
				| 'EUR'    | '330,000'   | ''                |
			Тогда таблица 'IndicatorsDrilldown' стала равной:
				| "Currencies" | 'Value1' | 'ValueCurrency1' |
				| 'RUB'    | '300,000'   | '300,000'         |
				| 'USD'    | '270,000'   | '3,699'           |
				| 'EUR'    | '330,000'   | '3,667'           |
			И я нажимаю на кнопку с именем 'FormOKButton1'
			И я жду закрытия окна "Drill down indicators: *" в течение 20 секунд

	* Проверяем результат
		Тогда табличный документ 'SpreadsheetFieldTemlate' равен:
			| "VA - Currency indicators (recipient)"                                    | ''               | ''         | ''                | ''         | ''             | ''         | ''         | ''         |
			| ''                                                                       | ''               | ''         | ''                | ''         | ''             | ''         | ''         | ''         |
			| ''                                                                       | "January 2024" | ''         | "February 2024" | ''         | "March 2024" | ''         | "TOTAL"    | ''         |
			| ''                                                                       | "Value"       | "Value" | "Value"        | "Value" | "Value"     | "Value" | "Value" | "Value" |
			| "Revenue by currency"                                                      | '0'              | ''         | '0'               | ''         | '0'            | ''         | '0'        | ''         |
			| "Revenue by currency [Average rate for period]"                             | '900,000'        | ''         | '0'               | ''         | '0'            | ''         | '900,000'  | ''         |
			| 'EUR '                                                                   | '330,000'        | '3,647'    | '0'               | '0'        | '0'            | '0'        | '330,000'  | '3,647'    |
			| 'RUB '                                                                   | '300,000'        | '300,000'  | '0'               | '0'        | '0'            | '0'        | '300,000'  | '300,000'  |
			| 'USD '                                                                   | '270,000'        | '3,638'    | '0'               | '0'        | '0'            | '0'        | '270,000'  | '3,638'    |
			| "Revenue by currency [Average rate for IFRS period]"                        | '900,000'        | ''         | '0'               | ''         | '0'            | ''         | '900,000'  | ''         |
			| 'EUR '                                                                   | '330,000'        | '3,605'    | '0'               | '0'        | '0'            | '0'        | '330,000'  | '3,605'    |
			| 'RUB '                                                                   | '300,000'        | '300,000'  | '0'               | '0'        | '0'            | '0'        | '300,000'  | '300,000'  |
			| 'USD '                                                                   | '270,000'        | '3,597'    | '0'               | '0'        | '0'            | '0'        | '270,000'  | '3,597'    |
			| "Revenue by currency [Average rate for period CB]"                          | '900,000'        | ''         | '0'               | ''         | '0'            | ''         | '900,000'  | ''         |
			| 'EUR '                                                                   | '330,000'        | '3,648'    | '0'               | '0'        | '0'            | '0'        | '330,000'  | '3,648'    |
			| 'RUB '                                                                   | '300,000'        | '300,000'  | '0'               | '0'        | '0'            | '0'        | '300,000'  | '300,000'  |
			| 'USD '                                                                   | '270,000'        | '3,641'    | '0'               | '0'        | '0'            | '0'        | '270,000'  | '3,641'    |
			| "Revenue by currency [Exchange rate at the beginning of the period]"                             | '900,000'        | ''         | '0'               | ''         | '0'            | ''         | '900,000'  | ''         |
			| 'EUR '                                                                   | '330,000'        | '3,635'    | '0'               | '0'        | '0'            | '0'        | '330,000'  | '3,635'    |
			| 'RUB '                                                                   | '300,000'        | '300,000'  | '0'               | '0'        | '0'            | '0'        | '300,000'  | '300,000'  |
			| 'USD '                                                                   | '270,000'        | '3,655'    | '0'               | '0'        | '0'            | '0'        | '270,000'  | '3,655'    |
			| "Revenue by currency [Exchange rate at the end of the period]"                              | '900,000'        | ''         | '0'               | ''         | '0'            | ''         | '900,000'  | ''         |
			| 'EUR '                                                                   | '330,000'        | '3,575'    | '0'               | '0'        | '0'            | '0'        | '330,000'  | '3,575'    |
			| 'RUB '                                                                   | '300,000'        | '300,000'  | '0'               | '0'        | '0'            | '0'        | '300,000'  | '300,000'  |
			| 'USD '                                                                   | '270,000'        | '3,541'    | '0'               | '0'        | '0'            | '0'        | '270,000'  | '3,541'    |
			| "Revenue by currency [Average rate for the previous period]"                  | '0'              | ''         | '900,000'         | ''         | '0'            | ''         | '900,000'  | ''         |
			| 'EUR '                                                                   | '0'              | '0'        | '330,000'         | '3,647'    | '0'            | '0'        | '330,000'  | '3,647'    |
			| 'RUB '                                                                   | '0'              | '0'        | '300,000'         | '300,000'  | '0'            | '0'        | '300,000'  | '300,000'  |
			| 'USD '                                                                   | '0'              | '0'        | '270,000'         | '3,638'    | '0'            | '0'        | '270,000'  | '3,638'    |
			| "Revenue by currency [Exchange rate at the end of the previous period]"                  | '0'              | ''         | '900,000'         | ''         | '0'            | ''         | '900,000'  | ''         |
			| 'EUR '                                                                   | '0'              | '0'        | '330,000'         | '3,575'    | '0'            | '0'        | '330,000'  | '3,575'    |
			| 'RUB '                                                                   | '0'              | '0'        | '300,000'         | '300,000'  | '0'            | '0'        | '300,000'  | '300,000'  |
			| 'USD '                                                                   | '0'              | '0'        | '270,000'         | '3,541'    | '0'            | '0'        | '270,000'  | '3,541'    |
			| "Revenue by currency [Average rate for the previous period CB]"               | '0'              | ''         | '900,000'         | ''         | '0'            | ''         | '900,000'  | ''         |
			| 'EUR '                                                                   | '0'              | '0'        | '330,000'         | '3,648'    | '0'            | '0'        | '330,000'  | '3,648'    |
			| 'RUB '                                                                   | '0'              | '0'        | '300,000'         | '300,000'  | '0'            | '0'        | '300,000'  | '300,000'  |
			| 'USD '                                                                   | '0'              | '0'        | '270,000'         | '3,641'    | '0'            | '0'        | '270,000'  | '3,641'    |
			| "Effective on"                                                             | '3/1/2024'     | ''         | ''                | ''         | ''             | ''         | ''         | ''         |
			| "Revenue by currency [Exchange rate as of the date specified in the indicator]"                | '900,000'        | ''         | '0'               | ''         | '0'            | ''         | '900,000'  | ''         |
			| 'EUR '                                                                   | '330,000'        | '3,651'    | '0'               | '0'        | '0'            | '0'        | '330,000'  | '3,651'    |
			| 'RUB '                                                                   | '300,000'        | '300,000'  | '0'               | '0'        | '0'            | '0'        | '300,000'  | '300,000'  |
			| 'USD '                                                                   | '270,000'        | '3,627'    | '0'               | '0'        | '0'            | '0'        | '270,000'  | '3,627'    |
			| "Revenue by currency [Exchange rate as of the date specified in the indicator another report]" | '900,000'        | ''         | '0'               | ''         | '0'            | ''         | '900,000'  | ''         |
			| 'EUR '                                                                   | '330,000'        | '3,651'    | '0'               | '0'        | '0'            | '0'        | '330,000'  | '3,651'    |
			| 'RUB '                                                                   | '300,000'        | '300,000'  | '0'               | '0'        | '0'            | '0'        | '300,000'  | '300,000'  |
			| 'USD '                                                                   | '270,000'        | '3,627'    | '0'               | '0'        | '0'            | '0'        | '270,000'  | '3,627'    |
			| "Rate [EUR]"                                                             | '90'             | ''         | '0'               | ''         | '0'            | ''         | '0'        | ''         |
			| "Rate [USD]"                                                             | '73'             | ''         | '0'               | ''         | '0'            | ''         | '0'        | ''         |
			| "Revenue by currency [Rate specified in the indicator]"                        | '900,000'        | ''         | '0'               | ''         | '0'            | ''         | '900,000'  | ''         |
			| 'EUR '                                                                   | '330,000'        | '3,667'    | '0'               | '0'        | '0'            | '0'        | '330,000'  | '3,667'    |
			| 'RUB '                                                                   | '300,000'        | '300,000'  | '0'               | '0'        | '0'            | '0'        | '300,000'  | '300,000'  |
			| 'USD '                                                                   | '270,000'        | '3,699'    | '0'               | '0'        | '0'            | '0'        | '270,000'  | '3,699'    |
			| "Revenue by currency [Rate specified in the indicator another report]"         | '900,000'        | ''         | '0'               | ''         | '0'            | ''         | '900,000'  | ''         |
			| 'EUR '                                                                   | '330,000'        | '3,667'    | '0'               | '0'        | '0'            | '0'        | '330,000'  | '3,667'    |
			| 'RUB '                                                                   | '300,000'        | '300,000'  | '0'               | '0'        | '0'            | '0'        | '300,000'  | '300,000'  |
			| 'USD '                                                                   | '270,000'        | '3,699'    | '0'               | '0'        | '0'            | '0'        | '270,000'  | '3,699'    |

	* Записываем и закрываем документ
		Когда открылось окно '$WindowTitle$'
		И я нажимаю на кнопку с именем 'WriteAndClose'
		И я жду закрытия окна '$WindowTitle$' в течение 20 секунд

Сценарий: 09.09 Расчет по правилу экземпляра отчета - "VA - Currency indicators (recipient)" 

	И Я открываю первый экземпляр отчета для вида отчета "VA - Currency indicators (recipient)"
	Тогда Открылся экземпляр отчета для вида отчета "VA - Currency indicators (recipient)" валюта 'RUB' организация "Mercury LLC" сценарий "VA - Main scenario" периодичность "Month" проект "VA - Main project" аналитики '' '' '' '' '' '' 

	* Проверяем результат
		Тогда табличный документ 'SpreadsheetFieldTemlate' равен:
			| "VA - Currency indicators (recipient)"                                    | ''               | ''         | ''                | ''         | ''             | ''         | ''         | ''         |
			| ''                                                                       | ''               | ''         | ''                | ''         | ''             | ''         | ''         | ''         |
			| ''                                                                       | "January 2024" | ''         | "February 2024" | ''         | "March 2024" | ''         | "TOTAL"    | ''         |
			| ''                                                                       | "Value"       | "Value" | "Value"        | "Value" | "Value"     | "Value" | "Value" | "Value" |
			| "Revenue by currency"                                                      | '0'              | ''         | '0'               | ''         | '0'            | ''         | '0'        | ''         |
			| "Revenue by currency [Average rate for period]"                             | '900,000'        | ''         | '0'               | ''         | '0'            | ''         | '900,000'  | ''         |
			| 'EUR '                                                                   | '330,000'        | '3,647'    | '0'               | '0'        | '0'            | '0'        | '330,000'  | '3,647'    |
			| 'RUB '                                                                   | '300,000'        | '300,000'  | '0'               | '0'        | '0'            | '0'        | '300,000'  | '300,000'  |
			| 'USD '                                                                   | '270,000'        | '3,638'    | '0'               | '0'        | '0'            | '0'        | '270,000'  | '3,638'    |
			| "Revenue by currency [Average rate for IFRS period]"                        | '900,000'        | ''         | '0'               | ''         | '0'            | ''         | '900,000'  | ''         |
			| 'EUR '                                                                   | '330,000'        | '3,605'    | '0'               | '0'        | '0'            | '0'        | '330,000'  | '3,605'    |
			| 'RUB '                                                                   | '300,000'        | '300,000'  | '0'               | '0'        | '0'            | '0'        | '300,000'  | '300,000'  |
			| 'USD '                                                                   | '270,000'        | '3,597'    | '0'               | '0'        | '0'            | '0'        | '270,000'  | '3,597'    |
			| "Revenue by currency [Average rate for period CB]"                          | '900,000'        | ''         | '0'               | ''         | '0'            | ''         | '900,000'  | ''         |
			| 'EUR '                                                                   | '330,000'        | '3,648'    | '0'               | '0'        | '0'            | '0'        | '330,000'  | '3,648'    |
			| 'RUB '                                                                   | '300,000'        | '300,000'  | '0'               | '0'        | '0'            | '0'        | '300,000'  | '300,000'  |
			| 'USD '                                                                   | '270,000'        | '3,641'    | '0'               | '0'        | '0'            | '0'        | '270,000'  | '3,641'    |
			| "Revenue by currency [Exchange rate at the beginning of the period]"                             | '900,000'        | ''         | '0'               | ''         | '0'            | ''         | '900,000'  | ''         |
			| 'EUR '                                                                   | '330,000'        | '3,635'    | '0'               | '0'        | '0'            | '0'        | '330,000'  | '3,635'    |
			| 'RUB '                                                                   | '300,000'        | '300,000'  | '0'               | '0'        | '0'            | '0'        | '300,000'  | '300,000'  |
			| 'USD '                                                                   | '270,000'        | '3,655'    | '0'               | '0'        | '0'            | '0'        | '270,000'  | '3,655'    |
			| "Revenue by currency [Exchange rate at the end of the period]"                              | '900,000'        | ''         | '0'               | ''         | '0'            | ''         | '900,000'  | ''         |
			| 'EUR '                                                                   | '330,000'        | '3,575'    | '0'               | '0'        | '0'            | '0'        | '330,000'  | '3,575'    |
			| 'RUB '                                                                   | '300,000'        | '300,000'  | '0'               | '0'        | '0'            | '0'        | '300,000'  | '300,000'  |
			| 'USD '                                                                   | '270,000'        | '3,541'    | '0'               | '0'        | '0'            | '0'        | '270,000'  | '3,541'    |
			| "Revenue by currency [Average rate for the previous period]"                  | '0'              | ''         | '900,000'         | ''         | '0'            | ''         | '900,000'  | ''         |
			| 'EUR '                                                                   | '0'              | '0'        | '330,000'         | '3,647'    | '0'            | '0'        | '330,000'  | '3,647'    |
			| 'RUB '                                                                   | '0'              | '0'        | '300,000'         | '300,000'  | '0'            | '0'        | '300,000'  | '300,000'  |
			| 'USD '                                                                   | '0'              | '0'        | '270,000'         | '3,638'    | '0'            | '0'        | '270,000'  | '3,638'    |
			| "Revenue by currency [Exchange rate at the end of the previous period]"                  | '0'              | ''         | '900,000'         | ''         | '0'            | ''         | '900,000'  | ''         |
			| 'EUR '                                                                   | '0'              | '0'        | '330,000'         | '3,575'    | '0'            | '0'        | '330,000'  | '3,575'    |
			| 'RUB '                                                                   | '0'              | '0'        | '300,000'         | '300,000'  | '0'            | '0'        | '300,000'  | '300,000'  |
			| 'USD '                                                                   | '0'              | '0'        | '270,000'         | '3,541'    | '0'            | '0'        | '270,000'  | '3,541'    |
			| "Revenue by currency [Average rate for the previous period CB]"               | '0'              | ''         | '900,000'         | ''         | '0'            | ''         | '900,000'  | ''         |
			| 'EUR '                                                                   | '0'              | '0'        | '330,000'         | '3,648'    | '0'            | '0'        | '330,000'  | '3,648'    |
			| 'RUB '                                                                   | '0'              | '0'        | '300,000'         | '300,000'  | '0'            | '0'        | '300,000'  | '300,000'  |
			| 'USD '                                                                   | '0'              | '0'        | '270,000'         | '3,641'    | '0'            | '0'        | '270,000'  | '3,641'    |
			| "Effective on"                                                             | '3/1/2024'     | ''         | ''                | ''         | ''             | ''         | ''         | ''         |
			| "Revenue by currency [Exchange rate as of the date specified in the indicator]"                | '900,000'        | ''         | '0'               | ''         | '0'            | ''         | '900,000'  | ''         |
			| 'EUR '                                                                   | '330,000'        | '3,651'    | '0'               | '0'        | '0'            | '0'        | '330,000'  | '3,651'    |
			| 'RUB '                                                                   | '300,000'        | '300,000'  | '0'               | '0'        | '0'            | '0'        | '300,000'  | '300,000'  |
			| 'USD '                                                                   | '270,000'        | '3,627'    | '0'               | '0'        | '0'            | '0'        | '270,000'  | '3,627'    |
			| "Revenue by currency [Exchange rate as of the date specified in the indicator another report]" | '900,000'        | ''         | '0'               | ''         | '0'            | ''         | '900,000'  | ''         |
			| 'EUR '                                                                   | '330,000'        | '3,651'    | '0'               | '0'        | '0'            | '0'        | '330,000'  | '3,651'    |
			| 'RUB '                                                                   | '300,000'        | '300,000'  | '0'               | '0'        | '0'            | '0'        | '300,000'  | '300,000'  |
			| 'USD '                                                                   | '270,000'        | '3,627'    | '0'               | '0'        | '0'            | '0'        | '270,000'  | '3,627'    |
			| "Rate [EUR]"                                                             | '90'             | ''         | '0'               | ''         | '0'            | ''         | '0'        | ''         |
			| "Rate [USD]"                                                             | '73'             | ''         | '0'               | ''         | '0'            | ''         | '0'        | ''         |
			| "Revenue by currency [Rate specified in the indicator]"                        | '900,000'        | ''         | '0'               | ''         | '0'            | ''         | '900,000'  | ''         |
			| 'EUR '                                                                   | '330,000'        | '3,667'    | '0'               | '0'        | '0'            | '0'        | '330,000'  | '3,667'    |
			| 'RUB '                                                                   | '300,000'        | '300,000'  | '0'               | '0'        | '0'            | '0'        | '300,000'  | '300,000'  |
			| 'USD '                                                                   | '270,000'        | '3,699'    | '0'               | '0'        | '0'            | '0'        | '270,000'  | '3,699'    |
			| "Revenue by currency [Rate specified in the indicator another report]"         | '900,000'        | ''         | '0'               | ''         | '0'            | ''         | '900,000'  | ''         |
			| 'EUR '                                                                   | '330,000'        | '3,667'    | '0'               | '0'        | '0'            | '0'        | '330,000'  | '3,667'    |
			| 'RUB '                                                                   | '300,000'        | '300,000'  | '0'               | '0'        | '0'            | '0'        | '300,000'  | '300,000'  |
			| 'USD '                                                                   | '270,000'        | '3,699'    | '0'               | '0'        | '0'            | '0'        | '270,000'  | '3,699'    |

	* Рассчитываем документ по правилу и сверяем результат
		Когда открылось окно '$WindowTitle$'
		И я нажимаю на кнопку с именем 'FormFillByDefault'
		Тогда табличный документ 'SpreadsheetFieldTemlate' равен:
			| "VA - Currency indicators (recipient)"                                    | ''               | ''         | ''                | ''         | ''             | ''         | ''          | ''         |
			| ''                                                                       | ''               | ''         | ''                | ''         | ''             | ''         | ''          | ''         |
			| ''                                                                       | "January 2024" | ''         | "February 2024" | ''         | "March 2024" | ''         | "TOTAL"     | ''         |
			| ''                                                                       | "Value"       | "Value" | "Value"        | "Value" | "Value"     | "Value" | "Value"  | "Value" |
			| "Revenue by currency"                                                      | '900,000'        | ''         | '900,000'         | ''         | '900,000'      | ''         | '2,700,000' | ''         |
			| "LLC \"Ganymede\" "                                                       | '300,000'        | ''         | '300,000'         | ''         | '300,000'      | ''         | '900,000'   | ''         |
			| 'EUR '                                                                   | '110,000'        | '1,216'    | '110,000'         | '1,223'    | '110,000'      | '1,240'    | '330,000'   | '3,679'    |
			| 'RUB '                                                                   | '100,000'        | '100,000'  | '100,000'         | '100,000'  | '100,000'      | '100,000'  | '300,000'   | '300,000'  |
			| 'USD '                                                                   | '90,000'         | '1,213'    | '90,000'          | '1,210'    | '90,000'       | '1,210'    | '270,000'   | '3,632'    |
			| "LLC \"Io\" "                                                            | '600,000'        | ''         | '600,000'         | ''         | '600,000'      | ''         | '1,800,000' | ''         |
			| 'EUR '                                                                   | '220,000'        | '2,431'    | '220,000'         | '2,446'    | '220,000'      | '2,481'    | '660,000'   | '7,358'    |
			| 'RUB '                                                                   | '200,000'        | '200,000'  | '200,000'         | '200,000'  | '200,000'      | '200,000'  | '600,000'   | '600,000'  |
			| 'USD '                                                                   | '180,000'        | '2,425'    | '180,000'         | '2,420'    | '180,000'      | '2,419'    | '540,000'   | '7,265'    |
			| "Revenue by currency [Average rate for period]"                             | '900,000'        | ''         | '900,000'         | ''         | '900,000'      | ''         | '2,700,000' | ''         |
			| 'EUR '                                                                   | '330,000'        | '3,647'    | '330,000'         | '3,669'    | '330,000'      | '3,721'    | '990,000'   | '11,037'   |
			| 'RUB '                                                                   | '300,000'        | '300,000'  | '300,000'         | '300,000'  | '300,000'      | '300,000'  | '900,000'   | '900,000'  |
			| 'USD '                                                                   | '270,000'        | '3,638'    | '270,000'         | '3,630'    | '270,000'      | '3,629'    | '810,000'   | '10,897'   |
			| "Revenue by currency [Average rate for IFRS period]"                        | '900,000'        | ''         | '900,000'         | ''         | '900,000'      | ''         | '2,700,000' | ''         |
			| 'EUR '                                                                   | '330,000'        | '3,605'    | '330,000'         | '3,613'    | '330,000'      | '3,682'    | '990,000'   | '10,900'   |
			| 'RUB '                                                                   | '300,000'        | '300,000'  | '300,000'         | '300,000'  | '300,000'      | '300,000'  | '900,000'   | '900,000'  |
			| 'USD '                                                                   | '270,000'        | '3,597'    | '270,000'         | '3,584'    | '270,000'      | '3,597'    | '810,000'   | '10,777'   |
			| "Revenue by currency [Average rate for period CB]"                          | '900,000'        | ''         | '900,000'         | ''         | '900,000'      | ''         | '2,700,000' | ''         |
			| 'EUR '                                                                   | '330,000'        | '3,648'    | '330,000'         | '3,667'    | '330,000'      | '3,719'    | '990,000'   | '11,034'   |
			| 'RUB '                                                                   | '300,000'        | '300,000'  | '300,000'         | '300,000'  | '300,000'      | '300,000'  | '900,000'   | '900,000'  |
			| 'USD '                                                                   | '270,000'        | '3,641'    | '270,000'         | '3,627'    | '270,000'      | '3,631'    | '810,000'   | '10,899'   |
			| "Revenue by currency [Exchange rate at the beginning of the period]"                             | '900,000'        | ''         | '900,000'         | ''         | '900,000'      | ''         | '2,700,000' | ''         |
			| 'EUR '                                                                   | '330,000'        | '3,635'    | '330,000'         | '3,575'    | '330,000'      | '3,651'    | '990,000'   | '10,862'   |
			| 'RUB '                                                                   | '300,000'        | '300,000'  | '300,000'         | '300,000'  | '300,000'      | '300,000'  | '900,000'   | '900,000'  |
			| 'USD '                                                                   | '270,000'        | '3,655'    | '270,000'         | '3,541'    | '270,000'      | '3,627'    | '810,000'   | '10,823'   |
			| "Revenue by currency [Exchange rate at the end of the period]"                              | '900,000'        | ''         | '900,000'         | ''         | '900,000'      | ''         | '2,700,000' | ''         |
			| 'EUR '                                                                   | '330,000'        | '3,575'    | '330,000'         | '3,651'    | '330,000'      | '3,713'    | '990,000'   | '10,940'   |
			| 'RUB '                                                                   | '300,000'        | '300,000'  | '300,000'         | '300,000'  | '300,000'      | '300,000'  | '900,000'   | '900,000'  |
			| 'USD '                                                                   | '270,000'        | '3,541'    | '270,000'         | '3,627'    | '270,000'      | '3,567'    | '810,000'   | '10,735'   |
			| "Revenue by currency [Average rate for the previous period]"                  | '0'              | ''         | '900,000'         | ''         | '900,000'      | ''         | '1,800,000' | ''         |
			| 'EUR '                                                                   | '0'              | '0'        | '330,000'         | '3,647'    | '330,000'      | '3,669'    | '660,000'   | '7,316'    |
			| 'RUB '                                                                   | '0'              | '0'        | '300,000'         | '300,000'  | '300,000'      | '300,000'  | '600,000'   | '600,000'  |
			| 'USD '                                                                   | '0'              | '0'        | '270,000'         | '3,638'    | '270,000'      | '3,630'    | '540,000'   | '7,268'    |
			| "Revenue by currency [Exchange rate at the end of the previous period]"                  | '0'              | ''         | '900,000'         | ''         | '900,000'      | ''         | '1,800,000' | ''         |
			| 'EUR '                                                                   | '0'              | '0'        | '330,000'         | '3,575'    | '330,000'      | '3,651'    | '660,000'   | '7,227'    |
			| 'RUB '                                                                   | '0'              | '0'        | '300,000'         | '300,000'  | '300,000'      | '300,000'  | '600,000'   | '600,000'  |
			| 'USD '                                                                   | '0'              | '0'        | '270,000'         | '3,541'    | '270,000'      | '3,627'    | '540,000'   | '7,168'    |
			| "Revenue by currency [Average rate for the previous period CB]"               | '0'              | ''         | '900,000'         | ''         | '900,000'      | ''         | '1,800,000' | ''         |
			| 'EUR '                                                                   | '0'              | '0'        | '330,000'         | '3,648'    | '330,000'      | '3,667'    | '660,000'   | '7,315'    |
			| 'RUB '                                                                   | '0'              | '0'        | '300,000'         | '300,000'  | '300,000'      | '300,000'  | '600,000'   | '600,000'  |
			| 'USD '                                                                   | '0'              | '0'        | '270,000'         | '3,641'    | '270,000'      | '3,627'    | '540,000'   | '7,268'    |
			| "Effective on"                                                             | '3/1/2024'     | ''         | '2/1/2024'      | ''         | '1/1/2024'   | ''         | ''          | ''         |
			| "Revenue by currency [Exchange rate as of the date specified in the indicator]"                | '900,000'        | ''         | '900,000'         | ''         | '900,000'      | ''         | '2,700,000' | ''         |
			| 'EUR '                                                                   | '330,000'        | '3,651'    | '330,000'         | '3,575'    | '330,000'      | '3,635'    | '990,000'   | '10,862'   |
			| 'RUB '                                                                   | '300,000'        | '300,000'  | '300,000'         | '300,000'  | '300,000'      | '300,000'  | '900,000'   | '900,000'  |
			| 'USD '                                                                   | '270,000'        | '3,627'    | '270,000'         | '3,541'    | '270,000'      | '3,655'    | '810,000'   | '10,823'   |
			| "Revenue by currency [Exchange rate as of the date specified in the indicator another report]" | '900,000'        | ''         | '900,000'         | ''         | '900,000'      | ''         | '2,700,000' | ''         |
			| 'EUR '                                                                   | '330,000'        | '3,651'    | '330,000'         | '3,575'    | '330,000'      | '3,635'    | '990,000'   | '10,862'   |
			| 'RUB '                                                                   | '300,000'        | '300,000'  | '300,000'         | '300,000'  | '300,000'      | '300,000'  | '900,000'   | '900,000'  |
			| 'USD '                                                                   | '270,000'        | '3,627'    | '270,000'         | '3,541'    | '270,000'      | '3,655'    | '810,000'   | '10,823'   |
			| "Rate [EUR]"                                                             | '90'             | ''         | '91'              | ''         | '92'           | ''         | '0'         | ''         |
			| "Rate [USD]"                                                             | '73'             | ''         | '74'              | ''         | '75'           | ''         | '0'         | ''         |
			| "Revenue by currency [Rate specified in the indicator]"                        | '900,000'        | ''         | '900,000'         | ''         | '900,000'      | ''         | '2,700,000' | ''         |
			| 'EUR '                                                                   | '330,000'        | '3,667'    | '330,000'         | '3,626'    | '330,000'      | '3,587'    | '990,000'   | '10,880'   |
			| 'RUB '                                                                   | '300,000'        | '300,000'  | '300,000'         | '300,000'  | '300,000'      | '300,000'  | '900,000'   | '900,000'  |
			| 'USD '                                                                   | '270,000'        | '3,699'    | '270,000'         | '3,649'    | '270,000'      | '3,600'    | '810,000'   | '10,947'   |
			| "Revenue by currency [Rate specified in the indicator another report]"         | '900,000'        | ''         | '900,000'         | ''         | '900,000'      | ''         | '2,700,000' | ''         |
			| 'EUR '                                                                   | '330,000'        | '3,667'    | '330,000'         | '3,626'    | '330,000'      | '3,587'    | '990,000'   | '10,880'   |
			| 'RUB '                                                                   | '300,000'        | '300,000'  | '300,000'         | '300,000'  | '300,000'      | '300,000'  | '900,000'   | '900,000'  |
			| 'USD '                                                                   | '270,000'        | '3,699'    | '270,000'         | '3,649'    | '270,000'      | '3,600'    | '810,000'   | '10,947'   |
	
	* Записываем документ	
		Когда открылось окно '$WindowTitle$'
		И я нажимаю на кнопку с именем 'Write'

	* Сравниваем движения
		Когда открылось окно '$WindowTitle$' 
		И я нажимаю на кнопку с именем 'FormOpenDocumentRegisterRecordsFlatTab'
		Тогда открылось окно "Flat table of indicator values"
		И я жду когда в табличном документе 'ReportSpreadsheetDocument' заполнится ячейка 'R2C1' в течение 30 секунд
		Дано Табличный документ 'ReportSpreadsheetDocument' равен макету "Макеты\09\ВА_ВалютныеПоказатели_Приемник_Движения.mxl" по шаблону
		И Я закрываю окно "Flat table of indicator values"

Сценарий: 09.10 Изменение курса через Периодические курсы валют

	И я закрываю TestClient "CPM - Budget"
	И я подключаю TestClient "CPM - Budget" логин "Administrator" пароль ''

	* Октрываем обработку
		И В командном интерфейсе я выбираю "Budgeting, reporting, and analysis" "Periodic exchange rates"
		Тогда открылось окно "Periodic exchange rates"
		И из выпадающего списка с именем 'Scenario' я выбираю по строке "VA - Main scenario"
		И из выпадающего списка с именем 'Periodicity' я выбираю точное значение "Month"
		И я нажимаю на кнопку с именем 'ChangePeriod'
		Тогда открылось окно "Select period"
		И в поле с именем 'DateBegin' я ввожу текст "1/1/2024"
		И я перехожу к следующему реквизиту
		И в поле с именем 'DateEnd' я ввожу текст "3/31/2024"
		И я нажимаю на кнопку с именем 'select'
		Тогда открылось окно "Periodic exchange rates"
		И из выпадающего списка с именем 'Currency' я выбираю точное значение "EUR"
		Тогда табличный документ 'SpreadsheetFieldTemlate' равен:
			| "Currency"          | "Exchange rate at the beginning of the period" | "Exchange rate at the end of the period" | "Average rate" | "Average rate IFRS" | "Average rate (CB)" | "Multiplying factor" |
			| "EUR"             | ''                       | ''                      | ''             | ''                  | ''                  | ''          |
			| "January 2024"  | '90.7932'                | '92.2963'               | '90.4971'      | '91.5448'           | '90.4537'           | '1.0000'    |
			| "February 2024" | '92.2963'                | '90.3743'               | '89.9321'      | '91.3353'           | '90.0038'           | '1.0000'    |
			| "March 2024"    | '90.3743'                | '88.8821'               | '88.6820'      | '89.6282'           | '88.7338'           | '1.0000'    |
	
	* Редактируем курс	
		// ДОДЕЛАТЬ		
				
Сценарий: 09.11 Изменение курса в документе Управления периодом сценария

	* Находим и открываем нужный документ
		И В командном интерфейсе я выбираю "Budgeting, reporting, and analysis" "Reporting period management"

		И Я в списке "Reporting period management" по полю "Scenario" ищу элемент "VA - Main scenario" "Exact match"
		И Я в списке "Reporting period management" по полю "Frequency" ищу элемент "Month" "Exact match" 
		И Я в списке "Reporting period management" по полю "Start period" ищу элемент "January 2024" "At beginning of line"

		Тогда в таблице 'List' количество строк "равно" 1
		И в таблице 'List' я выбираю текущую строку

		Тогда Открылся документ управления периодом для сценария "VA - Main scenario" периодичность "Month"

	* Редактируем курс
	// ДОДЕЛАТЬ
//		И я нажимаю на кнопку с именем 'FormGoForward'
//		И в таблице 'RatesViewTable' я нажимаю на кнопку с именем 'RatesTable_ChangeModeWithoutSave'
//		Когда открылось окно '$WindowTitle$'
//		И в таблице 'RatesEditTable' я перехожу к строке:
//			| "Currency" | "Current value" | "Multiplying factor" | "Rate period"   |
//			| 'EUR'    | '90.7932'          | '1.0000'    | "January 2024" |
//		И в таблице 'RatesEditTable' я выбираю текущую строку
//		И в таблице 'RatesEditTable' в поле с именем 'RatesEditTableRateAtPeriodStart_CurrentValue' я ввожу текст '90.7932'
//		И в таблице 'RatesEditTable' в поле с именем 'RatesEditTableRateAtPeriodEnd_CurrentValue' я ввожу текст '92.2963'
//		И в таблице 'RatesEditTable' в поле с именем 'RatesEditTableAverageRateForPeriod_CurrentValue' я ввожу текст '90.4971'
//		И в таблице 'RatesEditTable' в поле с именем 'RatesEditTableAverageRateForPeriodCentralBank_CurrentValue' я ввожу текст '90.4537'
//		И в таблице 'RatesEditTable' в поле с именем 'RatesEditTableAverageRateForPeriodIFRS_CurrentValue' я ввожу текст '91.5448'
//		И в таблице 'RatesEditTable' в поле с именем 'RatesEditTableRateAtPreviousPeriodEnd_CurrentValue' я ввожу текст '0'
//		И в таблице 'RatesEditTable' в поле с именем 'RatesEditTableAverageRateForPreviousPeriod_CurrentValue' я ввожу текст '0'
//		И в таблице 'RatesEditTable' в поле с именем 'RatesEditTableAverageRateForPreviousPeriodCentralBank_CurrentValue' я ввожу текст '0'
//		И в таблице 'RatesEditTable' я завершаю редактирование строки
//		И в таблице 'RatesEditTable' я нажимаю на кнопку с именем 'RatesEditTableRatesTable_Write'
		

