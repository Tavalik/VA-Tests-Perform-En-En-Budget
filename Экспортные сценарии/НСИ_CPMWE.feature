#language: ru

@ExportScenarios
@IgnoreOnCIMainBuild

Функционал: Экспортные сценарии для создания НСИ в 1C:CPMWE

Сценарий: Я создаю страну с кодом1 'CurCodeCountries1' кодом2 'CurCodeCountries2' кодом3 'CurCodeCountries3' именем1 'CurNameCountries1' именем2 'CurNameCountries2' именем3 'CurNameCountries3' если ее нет в 1C:CPMWE

	* Открываем форму справочника
		И я открываю основную форму списка справочника 'WorldCountries'

	* Ищем элемент
		Тогда открылось окно "Countries"
		И я выбираю пункт контекстного меню с именем 'ListContextMenuFind' на элементе формы с именем 'List'
		Тогда открылась форма с именем 'UniversalListFindExtForm'
		И из выпадающего списка с именем 'FieldSelector' я выбираю точное значение "Code"
		И в поле с именем 'Pattern' я ввожу текст '[CurCodeCountries1]'
		И я меняю значение переключателя с именем 'CompareType' на "Exact match"
		И я нажимаю на кнопку с именем 'Find'
		Тогда открылось окно "Countries"
		Если в таблице 'List' количество строк 'равно' 0 Тогда
			И я нажимаю на кнопку с именем 'ListCreate'
		Иначе
			И в таблице 'List' я выбираю текущую строку
	
	* Создаем элементм
		Тогда открылось окно "*Country*"		
		И в поле с именем 'Code' я ввожу текст '[CurCodeCountries1]'
		И в поле с именем 'CodeAlpha2' я ввожу текст '[CurCodeCountries2]'
		И в поле с именем 'CodeAlpha3' я ввожу текст '[CurCodeCountries3]'
		И в поле с именем 'Description' я ввожу текст '[CurNameCountries1]'
		И в поле с именем 'DescriptionFull' я ввожу текст '[CurNameCountries2]'
		И в поле с именем 'InternationalDescription' я ввожу текст '[CurNameCountries3]'
		Если '[CurCodeCountries1] = 643' Тогда
			И я устанавливаю флаг с именем 'EEUMember'
		И я нажимаю на кнопку с именем 'FormWriteAndClose'
		И я жду закрытия окна "Country (create)" в течение 20 секунд

	* Закрываем список
		Когда открылось окно "Countries"
		И Я закрываю окно "Countries"

Сценарий: Я устанавливаю цену с типом 'CurTypeЦены' номенклатуры 'CurNameНоменклатуры' на дату 'CurDateКурса' в значение 'CurValue' 'CrntCurrency' в 1C:CPMWE

	* Открываем список
		И В командном интерфейсе я выбираю "Quick menu" "Product range"
		Тогда открылось окно "Product range"

	* Ищем текущий элемент
		И я выбираю пункт контекстного меню с именем 'ListContextMenuFind' на элементе формы с именем 'List'
		Тогда открылась форма с именем 'UniversalListFindExtForm'
		И из выпадающего списка с именем 'FieldSelector' я выбираю точное значение "Description"
		И в поле с именем 'Pattern' я ввожу текст '[CurNameНоменклатуры]'
		И я меняю значение переключателя с именем 'CompareType' на "Exact match"
		И я нажимаю на кнопку с именем 'Find'
		Тогда открылось окно "Product range"
		Тогда в таблице 'List' количество строк 'равно' 1
		И в таблице 'List' я выбираю текущую строку		
		Тогда открылось окно "* (Product range)"
		И В текущем окне я нажимаю кнопку командного интерфейса "Product range prices"
		И я нажимаю на кнопку с именем 'FormFind'
		Тогда открылась форма с именем 'UniversalListFindExtForm'
		И из выпадающего списка с именем 'FieldSelector' я выбираю точное значение "Period"
		И в поле с именем 'Pattern' я ввожу текст '[CurDateКурса]'
		И я нажимаю на кнопку с именем 'Find'
		Тогда открылось окно "* (Product range)"
		И я нажимаю на кнопку с именем 'FormFind'
		Тогда открылась форма с именем 'UniversalListFindExtForm'
		И из выпадающего списка с именем 'FieldSelector' я выбираю точное значение "Price type"
		И из выпадающего списка с именем 'Pattern' я выбираю по строке '[CurTypeЦены]'
		И я нажимаю на кнопку с именем 'Find'
		Тогда открылось окно "* (Product range)"		
		Если в таблице 'List' количество строк 'равно' 0 Тогда
			И я нажимаю на кнопку с именем 'FormCreate'
		Иначе
			И в таблице 'List' я выбираю текущую строку

	* Создаем позицию
		Когда открылось окно "Product range prices*"
		И в поле с именем 'Period' я ввожу текст '[CurDateКурса]'
		И из выпадающего списка с именем 'PriceType_' я выбираю по строке '[CurTypeЦены]'
		И из выпадающего списка с именем 'Products' я выбираю по строке '[CurNameНоменклатуры]'
		И из выпадающего списка с именем 'Currency' я выбираю точное значение '[CrntCurrency]'
		И в поле с именем 'Price' я ввожу текст '[CurValue]'
		И я нажимаю на кнопку с именем 'FormWriteAndClose'
		И я жду закрытия окна "Product range prices (create) *" в течение 20 секунд

	* Закрываем формы
		Тогда открылось окно "* (Product range)"
		И Я закрываю окно "* (Product range)"
		Тогда открылось окно "Product range"
		И Я закрываю окно "Product range"
