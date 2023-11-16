﻿#language: ru

@ExportScenarios
@IgnoreOnCIMainBuild

Функционал: Экспортные сценарии для создания НСИ в 1C:ERP УХ

Сценарий: Я создаю вид номенклатуры с именем 'CurNameВидаНоменклатуры' тип 'CurType' в 1C:ERPУХ

	* Удаляем товарные категории
		И В командном интерфейсе я выбираю "Корпоративные закупки" "Product categories"
		Когда открылось окно "Product categories"
		И я выбираю пункт контекстного меню с именем 'ListOfSpeciesНоменклатурыContextMenuFind' на элементе формы с именем 'ListOfSpeciesНоменклатуры'
		Тогда открылась форма с именем 'UniversalListFindExtForm'
		И из выпадающего списка с именем 'FieldSelector' я выбираю точное значение "Type номенклатуры"
		И в поле с именем 'Pattern' я ввожу текст '[CurNameВидаНоменклатуры]'
		И я меняю значение переключателя с именем 'CompareType' на "Exact match"
		И я нажимаю на кнопку с именем 'Find'
		Тогда открылось окно "Product categories"
		Если в таблице 'ListOfSpeciesНоменклатуры' количество строк 'больше' 0 Тогда
			И в таблице 'List' я нажимаю на кнопку с именем 'ListListSettings'
			И Я устанавливаю отбор в форме списка 'Description' 'Not начинаетFrom1Z2 From1' 'Delete_'
			И Пока в таблице 'List' количество строк 'больше' 0 Тогда
				* Ставим пометку на удаление
					Если в таблице 'List' текущая строка не помечена на удаление Тогда	
					И я выбираю пункт контекстного меню с именем 'ListContextMenuSetDeletionMark' на элементе формы с именем 'List'
					Тогда открылось окно "1C:Enterprise"
					И я нажимаю на кнопку с именем 'Button0'
				* Переименовываем
					И Я запоминаю значение выражения '"Delete_" + StrReplace(New UUID, "-", "")' в переменную 'UID'
					И в таблице 'List' я выбираю текущую строку
					Тогда открылось окно "* (Product categories)"
					И в поле с именем 'Description' я ввожу значение переменной 'UID'
					И я нажимаю на кнопку с именем 'FormWriteAndClose'
					И я жду закрытия окна '* (Product categories)' в течение 20 секунд						
			И в таблице 'List' я нажимаю на кнопку с именем 'ListListSettings'
			И Я снимаю все отборы в форме списка

			* Удаляем вид номенклатуры
				Когда открылось окно "Product categories"
				И в таблице 'ListOfSpeciesНоменклатуры' я выбираю текущую строку
				Тогда открылось окно "[ТекNameВидаНоменклатуры] (Type номенклатуры)"
				И я разворачиваю группу с именем 'PageGeneral'
				И Я запоминаю значение выражения '"Delete_" + StrReplace(New UUID, "-", "")' в переменную 'UID'
				И в поле с именем 'Description' я ввожу значение переменной 'UID'
				И я нажимаю на кнопку с именем 'FormSetDeletionMark'
				Тогда открылось окно "1C:Enterprise"
				И я нажимаю на кнопку с именем 'Button0'
				И я нажимаю на кнопку с именем 'FormWriteAndClose'
				И я жду закрытия окна '[CurNameВидаНоменклатуры] (Type номенклатуры) *' в течение 20 секунд
				Тогда открылось окно "Product categories"
				И Я закрываю окно "Product categories"

	* Открываем  форму списка	
		И В командном интерфейсе я выбираю "Quick menu" "Product range"
		Когда открылось окно "Product range"
	
	* Создаем новый элемент
		И я устанавливаю флаг с именем 'UseDisplayFilters'
		И я нажимаю на кнопку с именем 'CreateProductKind'
		Тогда открылось окно "Type номенклатуры (create)"
		И у поля с именем 'TypeНоменклатуры' я нажимаю гиперссылку 'указать'
		Тогда открылось окно "Выберите тип номенклатуры"
		И я меняю значение переключателя с именем 'TypeНоменклатурыOwnGoods' на '[CurType]'
		И я нажимаю на кнопку с именем 'OK'
		Тогда открылось окно "Type номенклатуры (create) *"
		И в поле с именем 'Parent' я ввожу текст ''
		И в поле с именем 'Description' я ввожу текст '[CurNameВидаНоменклатуры]'	
		И я разворачиваю группу с именем 'DefaultValuePage'
		И из выпадающего списка с именем 'VATRate' я выбираю точное значение '20%'
		И из выпадающего списка с именем 'UnitOfMeasure' я выбираю по строке "PCs"
		И я нажимаю на кнопку с именем 'FormWriteAndClose'
		И я жду закрытия окна 'Kind номенклатуры (Create) *' в течение 20 секунд

	* Закрываем формы
		Когда открылось окно "Product range"
		И Я закрываю окно "Product range"

Сценарий: Я создаю соглашение с клиентом с именем 'CurNameСоглашения' валютой 'CrntCurrency' в 1C:ERPУХ

	* Удаляем существующие элементы
		И В командном интерфейсе я выбираю "CRM и маркетинг" "Типовые Fromоглашения From клиентами"
		И Я в списке "Типовые соглашения об условиях продаж" по полю "Description" ищу элемент '[CurNameСоглашения]' "Exact match"
		И Пока в таблице 'List' количество строк 'больше' 0 Тогда
			И Я удаляю текущую строку в списке 'List'					
			И в таблице 'List' я выбираю текущую строку
			Тогда открылось окно "Типовое соглашение об условиях продаж"
			И Я запоминаю значение выражения 'StrReplace(New UUID, "-", "")' в переменную 'UID'
			И в поле с именем 'Description' я ввожу значение переменной 'UID'
			И я нажимаю на кнопку с именем 'FormWriteAndClose'
			И я жду закрытия окна 'Типовое соглашение turn условиях продаж *' в течение 20 секунд

	* Создаем элемент
		Тогда открылось окно "Типовые соглашения об условиях продаж"
		И в таблице 'List' я нажимаю на кнопку с именем 'ListCreate'
		Тогда открылось окно "Типовое соглашение об условиях продаж (create)"
		И в поле с именем 'Description' я ввожу текст '[CurNameСоглашения]'
		И я перехожу к закладке с именем 'PageConditionsПродаж'
		И из выпадающего списка с именем 'Currency' я выбираю точное значение '[CrntCurrency]'
		И я изменяю флаг с именем 'PriceВключаетVAT'
		Тогда открылось окно "1C:Enterprise"
		И я нажимаю на кнопку с именем 'Button0'
		Тогда открылось окно "Типовое соглашение об условиях продаж (create) *"		
		И я нажимаю на кнопку с именем 'FormWriteAndClose'
		И я жду закрытия окна "Типовое соглашение об условиях продаж (create) *" в течение 20 секунд

	* Закрываем форму списка
		Тогда открылось окно "Типовые соглашения об условиях продаж"
		И я закрываю окно "Типовые соглашения об условиях продаж"

Сценарий: Я создаю соглашение с поставщиком 'ТекVendor' с именем 'CurNameСоглашения' валютой 'CrntCurrency' в 1C:ERPУХ

	* Удаляем существующие элементы
		И В командном интерфейсе я выбираю "Purchases" "Соглашения From toFromтавщиками"
		И Я в списке "Соглашения об условиях закупок" по полю "Description" ищу элемент '[CurNameСоглашения]' "Exact match"
		И Пока в таблице 'List' количество строк 'больше' 0 Тогда
			И Я удаляю текущую строку в списке 'List'					
			И в таблице 'List' я выбираю текущую строку
			Тогда открылось окно "[ТекNameСоглашения] (Соглашение об условиях закупок)"
			И Я запоминаю значение выражения 'StrReplace(New UUID, "-", "")' в переменную 'UID'
			И в поле с именем 'Description' я ввожу значение переменной 'UID'
			И я нажимаю на кнопку с именем 'FormWriteAndClose'
			И я жду закрытия окна "[ТекNameСоглашения] (Соглашение об условиях закупок) *" в течение 20 секунд

	* Создаем элемент
		Тогда открылось окно "Соглашения об условиях закупок"
		И в таблице 'List' я нажимаю на кнопку с именем 'ListCreate'
		Тогда открылось окно "Соглашение об условиях закупок (create)"
		И в поле с именем 'Description' я ввожу текст '[CurNameСоглашения]'
		И из выпадающего списка с именем "Партнер" я выбираю по строке '[ТекVendor]'				
		И я перехожу к закладке с именем 'GroupConditionsЗакупок'
		И из выпадающего списка с именем 'Currency' я выбираю точное значение '[CrntCurrency]'
		И я изменяю флаг с именем 'PriceВключаетVAT'
		Тогда открылось окно "1C:Enterprise"
		И я нажимаю на кнопку с именем 'Button0'
		Тогда открылось окно "Соглашение об условиях закупок (create) *"		
		И я нажимаю на кнопку с именем 'FormWriteAndClose'
		И я жду закрытия окна "Соглашение об условиях закупок (create) *" в течение 20 секунд

	* Закрываем форму списка
		Тогда открылось окно "Соглашения об условиях закупок"
		И я закрываю окно "Соглашения об условиях закупок"		

Сценарий: Я создаю партнера с именем 'CurNameПартнера' тип 'CurType' в 1C:ERPУХ		

	* Открываем форму списка
		И В командном интерфейсе я выбираю "Quick menu" "Партнеры"
		И я жду открытия окна 'Partners' в течение 20 секунд

	* Удаляем существующие элементы	
		И Я в списке "Партнеры" по полю "Description" ищу элемент '[CurNameПартнера]' "Exact match"
		И Пока в таблице 'List' количество строк 'больше' 0 Тогда
			И Я удаляю текущую строку в списке 'List'	
			И Я запоминаю значение выражения '"Delete_" + StrReplace(New UUID, "-", "")' в переменную 'UID'
			И в таблице 'List' я выбираю текущую строку
			Тогда открылось окно "[ТекNameПартнера] (Партнер)"
			* Удаляем контрагентов
				И В текущем окне я нажимаю кнопку командного интерфейса "Counterparties"
				Когда открылось окно "[ТекNameПартнера] (Партнер)"
				И я нажимаю на кнопку с именем 'FormListSettings'
				И Я устанавливаю отбор в форме списка 'Рабочее наименование' 'Not начинаетFrom1Z2 From1' 'Delete_'
				И Пока в таблице 'List' количество строк 'больше' 0 Тогда
					И Я удаляю текущую строку в списке 'List'
					И в таблице 'List' я выбираю текущую строку
					Тогда открылось окно "* (Counterparty*)"
					И в поле с именем 'Description' я ввожу значение переменной 'UID'
					И я нажимаю на кнопку с именем 'FormWriteAndClose'
					И я жду закрытия окна '* (Counterparty*)' в течение 20 секунд
				И я нажимаю на кнопку с именем 'FormListSettings'
				И Я снимаю все отборы в форме списка
			* Удаляем договоры
				И В текущем окне я нажимаю кнопку командного интерфейса "Contracts"
				И в таблице 'List' я нажимаю на кнопку с именем 'ListListSettings'
				И Я устанавливаю отбор в форме списка 'Рабочее наименование' 'Not начинаетFrom1Z2 From1' 'Delete_'
				И Пока в таблице 'List' количество строк 'больше' 0 Тогда
					И Я удаляю текущую строку в списке 'List'
					И в таблице 'List' я выбираю текущую строку
					Тогда открылось окно "* (Contract*)"
					Если элемент 'EditВерсию' доступен для редактирования Тогда 
						И я нажимаю на кнопку с именем 'EditВерсию'
					И в поле с именем 'Description' я ввожу значение переменной 'UID'
					И я нажимаю на кнопку с именем 'FormWrite'
					Тогда открылось окно "*"
					И Я закрываю окно "*"
				И в таблице 'List' я нажимаю на кнопку с именем 'ListListSettings'
				И Я снимаю все отборы в форме списка
			* Переименовываем
				И В текущем окне я нажимаю кнопку командного интерфейса "Main"
				Тогда открылось окно "* (Партнер)"
				И в поле с именем 'DescriptionFullCompany' я ввожу значение переменной 'UID'
				И в поле с именем 'Description' я ввожу значение переменной 'UID'
				И я нажимаю на кнопку с именем 'FormWriteAndClose'
				И я жду закрытия окна '* (Partner) *' в течение 20 секунд

	* Создаем элемент
		Тогда открылось окно "Партнеры"
		И в таблице 'List' я нажимаю на кнопку с именем 'CreateNew1'
		Тогда открылось окно "Партнер (create)"
		И в поле с именем 'DescriptionFullCompany' я ввожу текст '[CurNameПартнера]'
		И я изменяю флаг с именем '[CurType]'
		И я нажимаю на кнопку с именем 'FormWriteAndClose'
		И я жду закрытия окна 'Partner (Create) *' в течение 20 секунд					

	* Закрываем формы
		Когда открылось окно "Партнеры"
		И Я закрываю окно "Партнеры"

Сценарий: Для партнера 'CurNameПартнера' я создаю контрагента с именем 'CurNameКонтрагента' вид 'ТекCounterpartyKind' в 1C:ERPУХ

	* Открываем форму списка
		И В командном интерфейсе я выбираю "Quick menu" "Партнеры"
		И я жду открытия окна 'Partners' в течение 20 секунд

	* Находим партнера			
		И Я в списке "Партнеры" по полю "Description" ищу и выбираю элемент '[CurNameПартнера]' "Exact match"
		//И в таблице 'List' количество строк 'равно' 1
		//И в таблице 'List' я выбираю текущую строку
		Тогда открылось окно "[ТекNameПартнера] (Партнер)"		

	* Удаляем существующие элементы
		И В текущем окне я нажимаю кнопку командного интерфейса "Counterparties"
		И Я в списке "[ТекNameПартнера] (Партнер)" по полю "Рабочее наименование" ищу элемент '[CurNameКонтрагента]' "Exact match"
		И Пока в таблице 'List' количество строк 'больше' 0 Тогда
			И Я удаляю текущую строку в списке 'List'
			И Я запоминаю значение выражения 'StrReplace(New UUID, "-", "")' в переменную 'UID'
			И в таблице 'List' я выбираю текущую строку
			Тогда открылось окно "* (Counterparty*)"
			И в поле с именем 'Description' я ввожу значение переменной 'UID'
			И я нажимаю на кнопку с именем 'FormWriteAndClose'
			И я жду закрытия окна '* (Counterparty*)' в течение 20 секунд

	* Создаем контрагента
		Тогда открылось окно "[ТекNameПартнера] (Партнер)"
		И я нажимаю на кнопку с именем 'FormCreate'
		Тогда открылось окно "Counterparty (create)"
		И в поле с именем 'Description' я ввожу текст '[CurNameКонтрагента]'
		Когда открылось окно "Counterparty (create)"
		И из выпадающего списка с именем 'CounterpartyKind' я выбираю точное значение '[ТекCounterpartyKind]'				
		И я нажимаю на кнопку с именем 'FormWriteAndClose'

	* Закрываем форму
		Когда открылось окно "[ТекNameПартнера] (Партнер)"
		И Я закрываю окно "[ТекNameПартнера] (Партнер)"
		Тогда открылось окно "Партнеры"
		И Я закрываю окно "Партнеры"

Сценарий: Для партнера 'CurNameПартнера' контрагента 'CurNameКонтрагента' я создаю договор с видом 'ТекTypeOfAgreement' номер 'CurNumber' от 'CurDate' организация 'CurOrganization' валюта 'CrntCurrency' сумма 'ТекSum' соглашение 'ТекСоглашение' в 1C:ERPУХ

	* Открываем форму списка
		И В командном интерфейсе я выбираю "Quick menu" "Партнеры"
		И я жду открытия окна 'Partners' в течение 20 секунд

	* Находим партнера
		И Я в списке "Партнеры" по полю "Description" ищу элемент '[CurNameПартнера]' "Exact match"			
		И в таблице 'List' количество строк 'равно' 1
		И в таблице 'List' я выбираю текущую строку
		Тогда открылось окно "[ТекNameПартнера] (Партнер)"		

	* Находим контрагента
		И В текущем окне я нажимаю кнопку командного интерфейса "Counterparties"
		И Я в списке "[ТекNameПартнера] (Партнер)" по полю "Рабочее наименование" ищу и выбираю элемент '[CurNameКонтрагента]' "Exact match"
		Тогда открылось окно "[ТекNameКонтрагента] (Counterparty *)"		

	* Удаляем договор
		И В текущем окне я нажимаю кнопку командного интерфейса "Contracts"
		Тогда открылось окно '[CurNameКонтрагента] (Counterparty *)'
		Если открылось окно 'Validation контрагентов' Тогда
			И я нажимаю на кнопку с именем 'РучнаяValidation'
		И Я в списке "[ТекNameКонтрагента] (Counterparty *)" по полю "Рабочее наименование" ищу элемент '[CurNumber] dated [CurDate]' "Exact match"
		И Пока в таблице 'List' количество строк 'больше' 0 Тогда
			И Я удаляю текущую строку в списке 'List'
			И Я запоминаю значение выражения 'StrReplace(New UUID, "-", "")' в переменную 'UID'
			И в таблице 'List' я выбираю текущую строку
			Тогда открылось окно "* (Contract*)"
			Если элемент 'EditВерсию' доступен для редактирования Тогда
				И я нажимаю на кнопку с именем 'EditВерсию'						
			И в поле с именем 'Description' я ввожу значение переменной 'UID'
			И я нажимаю на кнопку с именем 'FormWrite'
			Тогда открылось окно "*"
			И Я закрываю окно "*"

	* Создаем договор
		И в таблице 'List' я нажимаю на кнопку с именем 'ListCreate'
		Если открылось окно 'Validation контрагентов' Тогда
			И я нажимаю на кнопку с именем 'РучнаяValidation'
		Тогда открылось окно "Выберите вид договора"
		И в таблице 'KindsДоговоров' я перехожу к строке:
			| 'Kind договора'     |
			| '[ТекTypeOfAgreement]' |
		И в таблице 'KindsДоговоров' я выбираю текущую строку
		Тогда открылось окно "Contract * (create)"
		И в поле с именем 'Number' я ввожу текст '[CurNumber]'
		И в поле с именем 'Date' я ввожу текст '[CurDate]'
		И в поле с именем 'Description' я ввожу текст "[ТекНомер] from [ТекDate]"
		И из выпадающего списка с именем 'Organization' я выбираю по строке '[CurOrganization]'
		И из выпадающего списка с именем 'ARAPCurrency' я выбираю точное значение '[CrntCurrency]'
		И я устанавливаю флаг с именем 'FixedSumДоговора'
		И в поле с именем 'SumДоговора' я ввожу текст '[ТекSum]'		
		Тогда открылось окно "Contract From * (create) *"
		И я нажимаю на кнопку с именем 'FormPostAndClose'
		И я жду закрытия окна 'Contract From1 * (Create) *' в течение 20 секунд

	* Закрываем форму
		Когда открылось окно "[ТекNameКонтрагента] (Counterparty *)"
		И Я закрываю окно "[ТекNameКонтрагента] (Counterparty *)"				
		Когда открылось окно "[ТекNameПартнера] (Партнер)"
		И Я закрываю окно "[ТекNameПартнера] (Партнер)"
		Тогда открылось окно "Партнеры"
		И Я закрываю окно "Партнеры"

Сценарий: Я для организации "ТекCompany" создаю подразделение с именем "ТекNameDepartments" в 1C:ERPУХ

	* Удаляем существующие элементы
		И В командном интерфейсе я выбираю "Master data и администрирование" "Структура предприятия"
		И Я в списке "Структура предприятия" по полю "Description" ищу элемент '[CurNameDepartments]' "Exact match"
		И Пока в таблице 'List' количество строк 'больше' 0 Тогда
			И Я удаляю текущую строку в списке 'List'					
			И в таблице 'List' я выбираю текущую строку
			Тогда открылось окно "[ТекNameDepartments] (Department)"
			И Я запоминаю значение выражения 'StrReplace(New UUID, "-", "")' в переменную 'UID'
			И в поле с именем 'Description' я ввожу значение переменной 'UID'
			И я нажимаю на кнопку с именем 'FormWriteAndClose'

	* Создаем элемент
		Тогда открылось окно "Структура предприятия"
		И я нажимаю на кнопку с именем 'FormCreate'
		Тогда открылось окно "Department (create)"
		И в поле с именем 'Description' я ввожу текст '[CurNameDepartments]'
		И из выпадающего списка с именем 'OrganizationCPM' я выбираю по строке '[CurOrganization]'
		И из выпадающего списка с именем 'CenterForFinancialResponsibility' я выбираю по строке '[CurOrganization]'
		Тогда открылось окно "Department (create) *"		
		И я нажимаю на кнопку с именем 'FormWriteAndClose'
		И я жду закрытия окна "Department (create) *" в течение 20 секунд

	* Закрываем форму списка
		Тогда открылось окно "Структура предприятия"
		И я закрываю окно "Структура предприятия"		
