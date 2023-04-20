﻿#language: ru

@ExportScenarios
@IgnoreOnCIMainBuild

Функционал: Экспортные сценарии для создания НСИ в 1C:ERP УХ

Сценарий: Я создаю вид номенклатуры с именем '[CurNameВидаНоменклатуры]' тип '[CurType]' группа доступа '[CurGroupДоступа]' в 1C:ERPУХ

	* Удаляем товарные категории
		И В командном интерфейсе я выбираю "Корпоративные закупки" "Product categories"
		Когда открылось окно "Product categories"
		И я выбираю пункт контекстного меню с именем 'ListOfSpeciesНоменклатурыContextMenuFind' на элементе формы с именем 'ListOfSpeciesНоменклатуры'
		Тогда открылась форма с именем 'UniversalListFindExtForm'
		И из выпадающего списка с именем 'FieldSelector' я выбираю точное значение "Kind номенклатуры"
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
					И Я запоминаю значение выражения "'Delete_' + СтрЗаменить(Новый УникальныйИдентификатор, '-', '')" в переменную 'UID'
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
				Тогда открылось окно "[ТекNameВидаНоменклатуры] (Kind номенклатуры)"
				И я разворачиваю группу с именем 'PageGeneral'
				И Я запоминаю значение выражения "'Delete_' + СтрЗаменить(Новый УникальныйИдентификатор, '-', '')" в переменную 'UID'
				И в поле с именем 'Description' я ввожу значение переменной 'UID'
				И я нажимаю на кнопку с именем 'FormSetDeletionMark'
				Тогда открылось окно "1C:Enterprise"
				И я нажимаю на кнопку с именем 'Button0'
				И я нажимаю на кнопку с именем 'FormWriteAndClose'
				И я жду закрытия окна '[CurNameВидаНоменклатуры] (Kind номенклатуры) *' в течение 20 секунд
				Тогда открылось окно "Product categories"
				И Я закрываю окно "Product categories"

	* Открываем  форму списка	
		И В командном интерфейсе я выбираю "Quick menu" "Product range"
		Когда открылось окно "Product range"
	
	* Создаем новый элемент
		И я устанавливаю флаг с именем 'UseDisplayFilters'
		И я нажимаю на кнопку с именем 'CreateProductKind'
		Тогда открылось окно "Kind номенклатуры (create)"
		И у поля с именем 'TypeНоменклатуры' я нажимаю гиперссылку 'указать'
		Тогда открылось окно "Выберите тип номенклатуры"
		И я меняю значение переключателя с именем 'TypeНоменклатурыТовар' на '[CurType]'
		И я нажимаю на кнопку с именем 'OK'
		Тогда открылось окно "Kind номенклатуры (create) *"
		И в поле с именем 'Parent' я ввожу текст ''
		И из выпадающего списка с именем 'AccessGroup' я выбираю точное значение '[CurGroupДоступа]'
		И в поле с именем 'Description' я ввожу текст '[CurNameВидаНоменклатуры]'	
		И я разворачиваю группу с именем 'ValuePageDefault'
		И из выпадающего списка с именем 'VATRate' я выбираю точное значение '20%'
		И из выпадающего списка с именем 'UnitOfMeasure' я выбираю по строке "PCs"
		И я нажимаю на кнопку с именем 'FormWriteAndClose'
		И я жду закрытия окна 'Type номенклатуры (Create) *' в течение 20 секунд

	* Закрываем формы
		Когда открылось окно "Product range"
		И Я закрываю окно "Product range"

Сценарий: Я создаю соглашение с клиентом с именем '[CurNameСоглашения]' валютой '[CrntCurrency]' в 1C:ERPУХ

	* Открываем форму списка
		И В командном интерфейсе я выбираю "CRM и маркетинг" "Типовые Fromоглашения From клиентами"
		Тогда открылось окно "Типовые соглашения об условиях продаж"

	* Создаем типовое соглашение с клиентом			
		И в таблице 'List' я нажимаю на кнопку с именем 'ListFind'
		Тогда открылась форма с именем 'UniversalListFindExtForm'
		И из выпадающего списка с именем 'FieldSelector' я выбираю точное значение 'Description'
		И в поле с именем 'Pattern' я ввожу текст '[CurNameСоглашения]'
		И я меняю значение переключателя с именем 'CompareType' на 'On точному совпадению'
		И я нажимаю на кнопку с именем 'Find'
		Тогда открылось окно "Типовые соглашения об условиях продаж"
		И Пока в таблице 'List' количество строк 'больше' 0 Тогда
			* Ставим пометку на удаление
				Если в таблице 'List' текущая строка не помечена на удаление Тогда	
					И я выбираю пункт контекстного меню с именем 'ListContextMenuSetDeletionMark' на элементе формы с именем 'List'
					Тогда открылось окно "1C:Enterprise"
					И я нажимаю на кнопку с именем 'Button0'
			* Переименовываем
				И Я запоминаю значение выражения "'Delete_' + СтрЗаменить(Новый УникальныйИдентификатор, '-', '')" в переменную 'UID'		
				И в таблице 'List' я выбираю текущую строку
				Тогда открылось окно "Типовое соглашение об условиях продаж"
				И в поле с именем 'Description' я ввожу значение переменной 'UID'
				И я нажимаю на кнопку с именем 'FormWriteAndClose'
				И я жду закрытия окна 'Типовое соглашение об условиях продаж *' в течение 20 секунд

	* Создаем элемент
		Тогда открылось окно "Типовые соглашения об условиях продаж"
		И в таблице 'List' я нажимаю на кнопку с именем 'ListCreate'
		Тогда открылось окно "Типовое соглашение об условиях продаж (create)"
		И в поле с именем 'Description' я ввожу текст "VA - Agreement with the client"
		И я перехожу к закладке с именем 'PageConditionsПродаж'
		И из выпадающего списка с именем 'Currency' я выбираю точное значение 'RUB'
		И я изменяю флаг с именем 'PriceВключаетVAT'
		Тогда открылось окно "1C:Enterprise"
		И я нажимаю на кнопку с именем 'Button0'
		Тогда открылось окно "Типовое соглашение об условиях продаж (create) *"		
		И я нажимаю на кнопку с именем 'FormWriteAndClose'
		И я жду закрытия окна 'Типовое соглашение об условиях продаж (Create) *' в течение 20 секунд

	* Закрываем форму списка
		Тогда открылось окно "Типовые соглашения об условиях продаж"
		И я закрываю окно "Типовые соглашения об условиях продаж"

Сценарий: Я создаю партнера с именем '[CurNameПартнера]' тип '[CurType]' группа доступа '[CurGroupДоступа]' в 1C:ERPУХ		

	* Открываем форму списка
		И В командном интерфейсе я выбираю "Quick menu" "Партнеры"
		И я жду открытия окна 'Партнеры' в течение 20 секунд

	* Переименовываем партнера 'Ганимед'			
		И в таблице 'List' я нажимаю на кнопку с именем 'FormFind'
		Тогда открылась форма с именем 'UniversalListFindExtForm'
		И в поле с именем 'Pattern' я ввожу текст '[CurNameПартнера]'
		И из выпадающего списка с именем 'FieldSelector' я выбираю точное значение "Description"
		И я меняю значение переключателя с именем 'CompareType' на "Exact match"
		И я нажимаю на кнопку с именем 'Find'
		Тогда открылось окно "Партнеры"
		И Пока в таблице 'List' количество строк 'больше' 0 Тогда
			* Ставим пометку на удаление
				Если в таблице 'List' текущая строка не помечена на удаление Тогда
					И я выбираю пункт контекстного меню с именем 'ListContextMenuSetDeletionMark' на элементе формы с именем 'List'
					Тогда открылось окно "1C:Enterprise"
					И я нажимаю на кнопку с именем 'Button0'
			* Открываем
				И в таблице 'List' я выбираю текущую строку
				Тогда открылось окно "[ТекNameПартнера] (Партнер)"
				* Удаляем контрагентов
					И В текущем окне я нажимаю кнопку командного интерфейса "Counterparties"
					Когда открылось окно "[ТекNameПартнера] (Партнер)"
					И я нажимаю на кнопку с именем 'FormListSettings'
					И Я устанавливаю отбор в форме списка 'Рабочее наименование' 'Not начинаетFrom1Z2 From1' 'Delete_'
					И Пока в таблице 'List' количество строк 'больше' 0 Тогда
						* Ставим пометку на удаление
							Если в таблице 'List' текущая строка не помечена на удаление Тогда	
								И я выбираю пункт контекстного меню с именем 'ListContextMenuSetDeletionMark' на элементе формы с именем 'List'
								Тогда открылось окно "1C:Enterprise"
								И я нажимаю на кнопку с именем 'Button0'
						* Переименовываем
							И Я запоминаю значение выражения "'Delete_' + СтрЗаменить(Новый УникальныйИдентификатор, '-', '')" в переменную 'UID'
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
						* Ставим пометку на удаление
							Если в таблице 'List' текущая строка не помечена на удаление Тогда	
								И я выбираю пункт контекстного меню с именем 'ListContextMenuSetDeletionMark' на элементе формы с именем 'List'
								Тогда открылось окно "1C:Enterprise"
								И я нажимаю на кнопку с именем 'Button0'
						* Переименовываем
							И Я запоминаю значение выражения "'Delete_' + СтрЗаменить(Новый УникальныйИдентификатор, '-', '')" в переменную 'UID'
							И в таблице 'List' я выбираю текущую строку
							Тогда открылось окно "* (Contract*)"
							И в поле с именем 'Description' я ввожу значение переменной 'UID'
							И я нажимаю на кнопку с именем 'FormWrite'
							Тогда открылось окно "*"
							И Я закрываю окно "*"
					И в таблице 'List' я нажимаю на кнопку с именем 'ListListSettings'
					И Я снимаю все отборы в форме списка
				* Переименовываем
					И В текущем окне я нажимаю кнопку командного интерфейса "Main"
					И Я запоминаю значение выражения "'Delete_' + СтрЗаменить(Новый УникальныйИдентификатор, '-', '')" в переменную 'UID'
					Тогда открылось окно "* (Партнер)"
					И в поле с именем 'DescriptionFullКомпания' я ввожу значение переменной 'UID'
					И в поле с именем 'Description' я ввожу значение переменной 'UID'
					И я нажимаю на кнопку с именем 'FormWriteAndClose'
					И я жду закрытия окна '* (Партнер) *' в течение 20 секунд

	* Создаем элемент
		Тогда открылось окно "Партнеры"
		И в таблице 'List' я нажимаю на кнопку с именем 'CreateNew1'
		Тогда открылось окно "Партнер (create)"
		И в поле с именем 'DescriptionFullКомпания' я ввожу текст '[CurNameПартнера]'
		И я изменяю флаг с именем '[CurType]'
		И из выпадающего списка с именем 'AccessGroup' я выбираю точное значение '[CurGroupДоступа]'
		И я нажимаю на кнопку с именем 'FormWriteAndClose'
		И я жду закрытия окна 'Партнер (Create) *' в течение 20 секунд					

	* Закрываем формы
		Когда открылось окно "Партнеры"
		И Я закрываю окно "Партнеры"

Сценарий: Для партнера '[CurNameПартнера]' я создаю контрагента с именем '[CurNameКонтрагента]' вид '[ТекTypeКонтрагента]' в 1C:ERPУХ

	* Открываем форму списка
		И В командном интерфейсе я выбираю "Quick menu" "Партнеры"
		И я жду открытия окна 'Партнеры' в течение 20 секунд

	* Находим партнера			
		И в таблице 'List' я нажимаю на кнопку с именем 'FormFind'
		Тогда открылась форма с именем 'UniversalListFindExtForm'
		И в поле с именем 'Pattern' я ввожу текст '[CurNameПартнера]'
		И из выпадающего списка с именем 'FieldSelector' я выбираю точное значение "Description"
		И я меняю значение переключателя с именем 'CompareType' на "Exact match"
		И я нажимаю на кнопку с именем 'Find'
		Тогда открылось окно "Партнеры"
		И в таблице 'List' количество строк 'равно' 1
		И в таблице 'List' я выбираю текущую строку
		Тогда открылось окно "[ТекNameПартнера] (Партнер)"		
		И В текущем окне я нажимаю кнопку командного интерфейса "Counterparties"

	* Удаляем контрагентов
		И я нажимаю на кнопку с именем 'FormFind'
		Тогда открылась форма с именем 'UniversalListFindExtForm'
		И из выпадающего списка с именем 'FieldSelector' я выбираю точное значение 'Рабочее наименование'
		И в поле с именем 'Pattern' я ввожу текст '[CurNameКонтрагента]'
		И я меняю значение переключателя с именем 'CompareType' на 'On точному совпадению'
		И я нажимаю на кнопку с именем 'Find'
		И Пока в таблице 'List' количество строк 'больше' 0 Тогда
			* Ставим пометку на удаление
				Если в таблице 'List' текущая строка не помечена на удаление Тогда	
					И я выбираю пункт контекстного меню с именем 'ListContextMenuSetDeletionMark' на элементе формы с именем 'List'
					Тогда открылось окно "1C:Enterprise"
					И я нажимаю на кнопку с именем 'Button0'
			* Переименовываем
				И Я запоминаю значение выражения "'Delete_' + СтрЗаменить(Новый УникальныйИдентификатор, '-', '')" в переменную 'UID'
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
		И из выпадающего списка с именем 'TypeКонтрагента' я выбираю точное значение '[ТекTypeКонтрагента]'				
		И я нажимаю на кнопку с именем 'FormWriteAndClose'

	* Закрываем форму
		Когда открылось окно "[ТекNameПартнера] (Партнер)"
		И Я закрываю окно "[ТекNameПартнера] (Партнер)"
		Тогда открылось окно "Партнеры"
		И Я закрываю окно "Партнеры"

Сценарий: Для партнера '[CurNameПартнера]' контрагента '[CurNameКонтрагента]' я создаю договор с видом '[ТекTypeOfAgreement]' номер '[CurNumber]' от '[CurDate]' организация '[CurOrganization]' валюта '[CrntCurrency]' сумма '[ТекSum]' соглашение '[ТекСоглашение]' в 1C:ERPУХ

	* Открываем форму списка
		И В командном интерфейсе я выбираю "Quick menu" "Партнеры"
		И я жду открытия окна 'Партнеры' в течение 20 секунд

	* Находим партнера			
		И в таблице 'List' я нажимаю на кнопку с именем 'FormFind'
		Тогда открылась форма с именем 'UniversalListFindExtForm'
		И в поле с именем 'Pattern' я ввожу текст '[CurNameПартнера'
		И из выпадающего списка с именем 'FieldSelector' я выбираю точное значение "Description"
		И я меняю значение переключателя с именем 'CompareType' на "Exact match"
		И я нажимаю на кнопку с именем 'Find'
		Тогда открылось окно "Партнеры"
		И в таблице 'List' количество строк 'равно' 1
		И в таблице 'List' я выбираю текущую строку
		Тогда открылось окно "[ТекNameПартнера] (Партнер)"		
		И В текущем окне я нажимаю кнопку командного интерфейса "Counterparties"

	* Находим контрагента
		И я нажимаю на кнопку с именем 'FormFind'
		Тогда открылась форма с именем 'UniversalListFindExtForm'
		И из выпадающего списка с именем 'FieldSelector' я выбираю точное значение 'Рабочее наименование'
		И в поле с именем 'Pattern' я ввожу текст '[CurNameКонтрагента]'
		И я меняю значение переключателя с именем 'CompareType' на 'On точному совпадению'
		И я нажимаю на кнопку с именем 'Find'
		И в таблице 'List' количество строк 'равно' 1
		И в таблице 'List' я выбираю текущую строку
		Тогда открылось окно "[ТекNameКонтрагента] (Counterparty *)"
		И В текущем окне я нажимаю кнопку командного интерфейса "Contracts"

	* Удаляем договор
		И в таблице 'List' я нажимаю на кнопку с именем 'ListFind'
		Тогда открылась форма с именем 'UniversalListFindExtForm'
		И из выпадающего списка с именем 'FieldSelector' я выбираю точное значение 'Рабочее наименование'
		И в поле с именем 'Pattern' я ввожу текст '[CurNumber] dated [CurDate]'
		И я меняю значение переключателя с именем 'CompareType' на 'On точному совпадению'
		И я нажимаю на кнопку с именем 'Find'
		И Пока в таблице 'List' количество строк 'больше' 0 Тогда
			* Ставим пометку на удаление
				Если в таблице 'List' текущая строка не помечена на удаление Тогда	
					И я выбираю пункт контекстного меню с именем 'ListContextMenuSetDeletionMark' на элементе формы с именем 'List'
					Тогда открылось окно "1C:Enterprise"
					И я нажимаю на кнопку с именем 'Button0'
			* Переименовываем
				И Я запоминаю значение выражения "'Delete_' + СтрЗаменить(Новый УникальныйИдентификатор, '-', '')" в переменную 'UID'
				И в таблице 'List' я выбираю текущую строку
				Тогда открылось окно "* (Contract*)"
				И в поле с именем 'Description' я ввожу значение переменной 'UID'
				И я нажимаю на кнопку с именем 'FormWrite'
				Тогда открылось окно "*"
				И Я закрываю окно "*"

	* Создаем договор
		И в таблице 'List' я нажимаю на кнопку с именем 'ListCreate'
		Тогда открылось окно "Выберите вид договора"
		И в таблице 'KindsДоговоров' я перехожу к строке:
			| 'Type договора'     |
			| '[ТекTypeOfAgreement]' |
		И в таблице 'KindsДоговоров' я выбираю текущую строку
		Тогда открылось окно "Contract * (create)"
		И в поле с именем 'Number' я ввожу текст '[CurNumber]'
		И в поле с именем 'Date' я ввожу текст '[CurDate]'
		И из выпадающего списка с именем 'Organization' я выбираю по строке '[CurOrganization]'
		И из выпадающего списка с именем 'ARAPCurrency' я выбираю точное значение '[CrntCurrency]'
		И я изменяю флаг с именем 'FixedSumДоговора'
		И в поле с именем 'SumДоговора' я ввожу текст '[ТекSum]'		
		И я перехожу к закладке с именем 'GroupCalculations'
		И Пауза 1
		И из выпадающего списка с именем 'Соглашение' я выбираю по строке '[ТекСоглашение]'
		Тогда открылось окно "Contract From покупателем / заказчиком (create) *"
		И я нажимаю на кнопку с именем 'FormPostAndClose'
		И я жду закрытия окна 'Contract From1 покупателем / заказчиком (Create) *' в течение 20 секунд

	* Закрываем форму
		Когда открылось окно "[ТекNameКонтрагента] (Counterparty *)"
		И Я закрываю окно "[ТекNameКонтрагента] (Counterparty *)"				
		Когда открылось окно "[ТекNameПартнера] (Партнер)"
		И Я закрываю окно "[ТекNameПартнера] (Партнер)"
		Тогда открылось окно "Партнеры"
		И Я закрываю окно "Партнеры"				
