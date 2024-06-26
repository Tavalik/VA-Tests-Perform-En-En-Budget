﻿#language: ru
@tree

Функционал: 00. Первоначальные настройки и ввод НСИ

	Как Администратор я хочу
	Ввести все НСИ
	чтобы проверить ввод НСИ и начать тестирование прочего функционала

Контекст: 

	И я закрыл все окна клиентского приложения	

Сценарий: 00.01 Запуск нужного клиента тестирования

	И я закрываю TestClient "CPM - MasterData"
	И я закрываю TestClient "CPM - Treasury"
	И я закрываю TestClient "CPM - Purchases"
	И я закрываю TestClient "CPM - Smoke"

	И Я подключаю клиент тестирования "Этот клиент" из таблицы клиентов тестирования

	И Инициализация переменных

	Если '$$InterfaceLanguage$$ = "En"' Тогда
		// Из-за отличия в языках платформы и интерфейса пользователь уже должен быть создан
		И я закрываю сеанс текущего клиента тестирования	
		И я подключаю TestClient "CPM - Budget" логин "Administrator" пароль ''

Сценарий: 00.02 Настройка информационной базы

	* Настройка прав доступа
		Если '$$IsERPCPM$$' Тогда
			И В командном интерфейсе я выбираю "Master data and адмandнandстрandрованandе" "Users and rights settings"
			Тогда открылось окно "Users and rights settings"
		Иначе			
			И В командном интерфейсе я выбираю "Administration" "Users and rights settings"
			Тогда открылось окно "Users and rights settings"
			Если 'NOT $$ЭтоPerform$$' Тогда
				И я устанавливаю флаг с именем 'UseНесколькоОтветственных'
		И я устанавливаю флаг с именем 'UseUserGroups'
		И я устанавливаю флаг с именем 'LimitAccessAtRecordLevel'
		Если открылось окно "1C:Enterprise" Тогда
			И я нажимаю на кнопку с именем 'Button0'
		Тогда открылось окно "Users and rights settings"
		Если '$$ЭтоPerform$$' Тогда
			* Включаем производительный режим работы
				И Я включаю производительный режим работы ограничений на уровне записей
		Иначе
			* Включаем стандартный режим работы
				И из выпадающего списка с именем 'LimitAccessAtRecordLevelUniversally' я выбираю точное значение "Regular"
				Если открылось окно "1C:Enterprise" Тогда
					И я нажимаю на кнопку с именем 'Button0'

	* Настройка даты запрета редактирования
		Тогда открылось окно "Users and rights settings"
		И я разворачиваю группу с именем 'UsersPersonalSettingsGroup'
		И я разворачиваю группу с именем 'PeriodClosingDatesGroup'
		И я устанавливаю флаг с именем 'UsePeriodClosingDates'
		И я нажимаю на кнопку с именем 'ConfigurePeriodClosingDates'
		Тогда открылось окно "Period-end closing dates"
		И в поле с именем 'PeriodEndClosingDateSimpleMode' я ввожу текст '12/31/2000'
		И я перехожу к закладке с именем 'AdvancedOptionsGroup'
		И из выпадающего списка с именем 'PeriodEndClosingDateSettingMethod' я выбираю точное значение "Single date for all sections and objects"
		И Я закрываю окно "Period-end closing dates"
		И я закрываю окно "Users and rights settings"

	* Настройка программы
		Если '$$IsERPCPM$$' Тогда
			* Предприятие
				И В командном интерфейсе я выбираю "Master data and адмandнandстрandрованandе" "Предприятие"
				Тогда открылось окно "Предприятие"
				И я устанавливаю флаг с именем 'UseMultipleCompanies'
				И я разворачиваю группу с именем 'SettingsGroup1Валют'
				И я устанавливаю флаг с именем 'UseНесколькоВалют'
				Тогда открылось окно "Предприятие"
				И Я закрываю окно "Предприятие"
			* CRM и маркетинг
				И В командном интерфейсе я выбираю "Master data and адмandнandстрandрованandе" "CRM and маркетandнг"
				Тогда открылось окно "CRM and маркетandнг"
				И я разворачиваю группу с именем "GroupSettingsCRM"
				И я устанавливаю флаг с именем 'UseПартнеровANDКонтрагентов'								
				И я разворачиваю группу с именем 'GroupМаркетинг'
				И я устанавливаю флаг с именем 'UseНесколькоВидовЦен'
				Тогда открылось окно "CRM and маркетandнг"	
				И Я закрываю окно "CRM and маркетandнг"	
			* Склад и доставка
				И В командном интерфейсе я выбираю "Master data and адмandнandстрandрованandе" "Warehouse and доставка"
				Тогда открылось окно "Warehouse and доставка"
				И я устанавливаю флаг с именем 'UseНесколькоСкладов'
				Тогда открылось окно "Warehouse and доставка"
				И Я закрываю окно "Warehouse and доставка"																

	И Я создаю единицу измерения с кодом '796' если ее нет, наименование "PCs", наименование полное "Piece"

	* Установка констант и ФО
		И Я устанавливаю в константу 'UseIndicatorRecalculationTraceMode' значение 'True'
		Если '$$IsERPCPM$$' Тогда
			И Я устанавливаю в константу 'UseProductCategories' значение 'True'	

	* Добавим валюты, если их нет
		* RUB
			И Я создаю валюту с цифровым кодом '643' символьным кодом 'RUB' и наименованием "Russian ruble" если ее нет
		* EUR
			И Я создаю валюту с цифровым кодом '978' символьным кодом 'EUR' и наименованием "Euro" если ее нет
			И Я устанавливаю курс валюты 'EUR' на дату '1/1/2024' в значение '90.7932' кратность '1' базовая валюта 'RUB'
			И Я устанавливаю курс валюты 'EUR' на дату '2/1/2024' в значение '92.2963' кратность '1' базовая валюта 'RUB'
			И Я устанавливаю курс валюты 'EUR' на дату '3/1/2024' в значение '90.3743' кратность '1' базовая валюта 'RUB'
		* USD
			И Я создаю валюту с цифровым кодом '840' символьным кодом 'USD' и наименованием "US dollar" если ее нет
			И Я устанавливаю курс валюты 'USD' на дату '1/1/2024' в значение '73.8757' кратность '1' базовая валюта 'RUB'
			И Я устанавливаю курс валюты 'USD' на дату '2/1/2024' в значение '76.2527' кратность '1' базовая валюта 'RUB'
			И Я устанавливаю курс валюты 'USD' на дату '3/1/2024' в значение '74.4373' кратность '1' базовая валюта 'RUB'
		* KZT
			И Я создаю валюту с цифровым кодом '398' символьным кодом 'KZT' и наименованием "Tenge" если ее нет

	* Устанавливаем валюту регламентированного учета для ЕРПУХ
		Если '$$IsCPM$$' Тогда
			Если '$$ЭтоPerform$$' Тогда
				И В командном интерфейсе я выбираю "IFRS accounting" "IFRS settings"
				Тогда открылось окно "IFRS settings"
				И я разворачиваю группу с именем 'GroupDefaultValues'								
				И из выпадающего списка с именем 'ManagementAccountingCurrency' я выбираю точное значение 'RUB'
				И я нажимаю на кнопку с именем 'FormWriteAndClose'
				И я жду закрытия окна "IFRS settings *" в течение 20 секунд							
			Иначе
				И я выполняю код встроенного языка на сервере без контекста
				"""bsl
					Константы.ВалютаУправленческогоУчета.Установить(Справочники.Валюты.НайтиПоКоду("643"));
				"""	
		Если '$$IsERPCPM$$' Тогда
			И В командном интерфейсе я выбираю "Master data and адмandнandстрandрованandе" "Предприятие"
			Тогда открылось окно "Предприятие"
			И я разворачиваю группу с именем 'SettingsGroup1Валют'
			И из выпадающего списка с именем 'ManagementAccountingCurrency' я выбираю точное значение 'RUB'
			Тогда открылось окно "1C:Enterprise"
			И я нажимаю на кнопку с именем 'Button0'
			Тогда открылось окно "Предприятие"			
			И Я закрываю окно "Предприятие"

	Если '$$ЭтоPerform$$' Тогда
		И Я создаю страну с кодом1 '643' кодом2 'RU' кодом3 'RUS' именем1 "Russia" именем2 "The Russian Federation" именем3 "The Russian Federation" если ее нет в 1C:CPMWE

	* Отключаем работу с новостями
		Если '$$IsERPCPM$$' Тогда
			И я устанавливаю в константу 'NewsManagementEnabled' значение 'False'
			И я устанавливаю в константу 'NewsManagementEnabledЧерезInternet' значение 'False'

Сценарий: 00.03 Создание профилей и групп доступа

	И Я создаю группу доступа с именем "Open external reports and data processors" по профилю "Open external reports and data processors"

	И Я создаю профиль с именем "VA - Budgeting (Edit)" на основании профиля "Operations with customizable reporting (report instances, adjustments, and pivot table)"	
	И Я создаю группу доступа с именем "VA - Budgeting (Edit)" по профилю "VA - Budgeting (Edit)"

	И Я создаю профиль с именем "VA - Budgeting (View)" на основании профиля "View customizable reporting (report instances, adjustments, and pivot table)"	
	И Я создаю группу доступа с именем "VA - Budgeting (View)" по профилю "VA - Budgeting (View)"

Сценарий: 00.04 Создание пользователей

	И Я нахожу или создаю пользователя "Administrator" группа доступа "Administrators" группа ""	

	И Я нахожу или создаю группу пользователей с именем "VA - Budgeting"

	И Я нахожу или создаю пользователя "Budgeting1" группа доступа "VA - Budgeting (Edit)" группа "VA - Budgeting"
	И Я нахожу или создаю пользователя "Budgeting2" группа доступа "VA - Budgeting (Edit)" группа "VA - Budgeting"
	И Я нахожу или создаю пользователя "Budgeting3" группа доступа "VA - Budgeting (View)" группа "VA - Budgeting"
	И Я нахожу или создаю пользователя "Budgeting4" группа доступа "VA - Budgeting (View)" группа "VA - Budgeting"

	И я закрываю сеанс текущего клиента тестирования	
	И я подключаю TestClient "CPM - Budget" логин "Administrator" пароль ''			

Сценарий: 00.05 Создание группы Видов отчетов

	И Я создаю группу видов отчетов с именем "VA - Report group" и родителем ''

Сценарий: 00.06 Создание вида организационной единицы

	И Я создаю вид организационной единицы с именем "VA - Package CFR"

Сценарий: 00.07 Создание отношения к группе

	И Я создаю отношение к группе с именем "VA - Subsidiary" и видом "Subsidiary"

Сценарий: 00.08 Создание организаций и ЦФО
	
	* Создаем организацию Система
		И Я создаю организацию с именем "System LLC" типом 'SelectRF' видом 'SelectЮL' налогооблажением 'СистемаНалогообложенияShared3ЮL'
		Если '$$IsCPM$$' Тогда
			И Я для организации "System LLC" для реквизита 'CompanyType' выбираю значение "VA - Package CFR"	
			И Я для организации "System LLC" создаю подразделение с именем "Administration"
			И Я для организации "System LLC" создаю подразделение с именем "Accounting"
		Если '$$IsERPCPM$$' Тогда
			И Я для организации "System LLC" для реквизита 'CompanyType1' выбираю значение "VA - Package CFR"	
			И Я для организации "System LLC" создаю подразделение с именем "Administration" в 1C:ERPУХ
			И Я для организации "System LLC" создаю подразделение с именем "Accounting" в 1C:ERPУХ

		Если '$$ЭтоPerform$$' Тогда
			И Я для организации "System LLC" для реквизита 'GroupCounterparty' выбираю значение "VA - Subsidiary"
		Иначе
			И Я для организации "System LLC" для реквизита 'GroupКонтрагентов' выбираю значение "VA - Subsidiary"		

	* Создаем организацию Меркурий
		И Я создаю организацию с именем "Mercury LLC" типом 'SelectRF' видом 'SelectЮL' налогооблажением 'СистемаНалогообложенияShared3ЮL'
		И Я для организации "Mercury LLC" для реквизита 'Parent' выбираю значение "System LLC"	
		
		Если '$$IsCPM$$' Тогда
			И Я для организации "Mercury LLC" для реквизита 'CompanyType' выбираю значение "VA - Package CFR"			
		ИначеЕсли '$$IsERPCPM$$' Тогда
			И Я для организации "Mercury LLC" для реквизита 'CompanyType1' выбираю значение "VA - Package CFR"
		
		Если '$$ЭтоPerform$$' Тогда
			И Я для организации "Mercury LLC" для реквизита 'GroupCounterparty' выбираю значение "VA - Subsidiary"
		Иначе
			И Я для организации "Mercury LLC" для реквизита 'GroupКонтрагентов' выбираю значение "VA - Subsidiary"

	* Создаем организацию Венера
		И Я создаю организацию с именем "Venus LLC" типом 'SelectCenterForFinancialResponsibility' видом '' налогооблажением ''
		И Я для организации "Venus LLC" для реквизита 'Parent' выбираю значение "System LLC"
		
		Если '$$IsCPM$$' Тогда
			И Я для организации "Venus LLC" для реквизита 'CompanyType' выбираю значение "VA - Package CFR"
		ИначеЕсли '$$IsERPCPM$$' Тогда
			И Я для организации "Venus LLC" для реквизита 'CompanyType1' выбираю значение "VA - Package CFR"

	* Создаем организацию Земля
		И Я создаю организацию с именем "Earth LLC" типом 'SelectCenterForFinancialResponsibility' видом '' налогооблажением ''
		И Я для организации "Earth LLC" для реквизита 'Parent' выбираю значение "System LLC"
		
		Если '$$IsCPM$$' Тогда
			И Я для организации "Earth LLC" для реквизита 'CompanyType' выбираю значение "VA - Package CFR"
		ИначеЕсли '$$IsERPCPM$$' Тогда
			И Я для организации "Earth LLC" для реквизита 'CompanyType1' выбираю значение "VA - Package CFR"
		
	* Создаем организацию Марс
		И Я создаю организацию с именем "Mars LLC" типом 'SelectCenterForFinancialResponsibility' видом 'SelectЭл' налогооблажением ''
		И Я для организации "Mars LLC" для реквизита 'Parent' выбираю значение "System LLC"
		
		Если '$$IsCPM$$' Тогда
			И Я для организации "Mars LLC" для реквизита 'CompanyType' выбираю значение "VA - Package CFR"
		ИначеЕсли '$$IsERPCPM$$' Тогда
			И Я для организации "Mars LLC" для реквизита 'CompanyType1' выбираю значение "VA - Package CFR"

Сценарий: 00.09 Настройка ограничений доступа по организациям

	И Я добавляю в профиль "VA - Budgeting (Edit)" ограничение доступа с видом "Companies" значением "All denied, configure exceptions in access groups"
	И Я добавляю в группу доступа "VA - Budgeting (Edit)" значения доступа с видом "Companies" из таблицы
		| "Access Value" | "Include subordinate items" |
		| "System LLC"      | "Yes"                  |

	И Я добавляю в профиль "VA - Budgeting (View)" ограничение доступа с видом "Companies" значением "All denied, configure exceptions in access groups"
	И Я добавляю в группу доступа "VA - Budgeting (View)" значения доступа с видом "Companies" из таблицы
		| "Access Value" | "Include subordinate items" |
		| "Mercury LLC"     | "No"                 |
		| "Venus LLC"       | "No"                 |

Сценарий: 00.10 Создание Сценария

	И Я создаю сценарий с именем "VA - Main scenario"

Сценарий: 00.11 Создание Проекта

	И Я создаю проект с именем "VA - Main project"
				
Сценарий: 00.12 Создание Регламента подготовки отчетности

	И Я создаю группу регламентов с именем "VA - Group регламентов"

	* Удаляем текущий элемент	
		И Я в списке "Regulations for preparing reports" по полю "Description" ищу элемент "VA - Main regulations" "Exact match"
		И Пока в таблице 'List' количество строк 'больше' 0 Тогда
			* Ставим пометку на удаление	
				И Я удаляю текущую строку в списке 'List'
			* Перименовываем
				И Я запоминаю значение выражения '"Delete_" + StrReplace(New UUID, "-", "")' в переменную 'UID'
				И в таблице 'List' я выбираю текущую строку
				Тогда Открылся регламент подготовки отчетности "VA - Main regulations"
				И я перехожу к закладке с именем 'GroupMainPage'		
				И в поле с именем 'Description' я ввожу значение переменной 'UID'
				И я нажимаю на кнопку с именем 'FormWriteAndClose'
				И я жду закрытия окна '$WindowTitle$' в течение 20 секунд

	* Создаем элемент	
		Тогда открылось окно "Regulations for preparing reports"
		И я нажимаю на кнопку с именем 'FormCreate'
		Тогда Открылся регламент подготовки отчетности ''
		И в поле с именем 'Description' я ввожу текст "VA - Main regulations"		
		И в поле с именем 'Parent' я ввожу текст "VA - Group регламентов"
	
	* Выбираем группу видов отчетов	
		Тогда открылось окно '$WindowTitle$'
		И я нажимаю кнопку выбора у поля с именем 'ReportKind'
		Тогда открылось окно "Report types"
		И я выбираю пункт контекстного меню с именем 'ListContextMenuFind' на элементе формы с именем 'List'
		Тогда открылась форма с именем 'UniversalListFindExtForm'
		И в поле с именем 'Pattern' я ввожу текст "VA - Report group"
		И я нажимаю на кнопку с именем 'Find'
		Тогда открылось окно "Report types"
		И в таблице 'List' я активизирую поле с именем 'Description'
		И в таблице 'List' я выбираю текущую строку
	
	* Скроем организации включим периметры
		Тогда открылось окно '$WindowTitle$'
		И я перехожу к закладке с именем 'PerimeterSetting'
		И в таблице 'GroupStructure' я нажимаю на кнопку с именем 'GroupStructureClearBusinessUnits'
		И я изменяю флаг с именем 'UsePerimeters'
		Когда открылось окно '$WindowTitle$'
		И в таблице 'GroupStructure' я нажимаю на кнопку с именем 'GroupStructurePickOfCompaines'
		И я нажимаю на кнопку с именем 'OrganizationalUnitsFind'
		Тогда открылась форма с именем 'UniversalListFindExtForm'
		И из выпадающего списка с именем 'Pattern' я выбираю по строке "System LLC"
		И я нажимаю на кнопку с именем 'Find'	
		Тогда открылось окно '$WindowTitle$'
		И я нажимаю на кнопку с именем 'BusinessUnitsCopyWithHierarchy'	

	* Развернем группы
		Когда открылось окно '$WindowTitle$'
		И в таблице 'GroupStructure' я перехожу к строке:
			| "Consolidating company\n/ Business unit" | "Intercompany transactions exclusion method" | "Company status for consolidation" | "Effective share, %" |
			| "System LLC"                                            | '- '                   | "Group"             | '- '                  |
		И в таблице 'GroupStructure' я разворачиваю текущую строку

	* Установим валюту, если необходимо		
		Если в таблице 'GroupStructure' есть строка Тогда
			| "Consolidating company\n/ Business unit" | "Intercompany transactions exclusion method" | "Primary currency" | "Company status for consolidation" | "Effective share, %" |
			| "System LLC"                                            | '- '                   | ''                | "Group"             | '- '                  |
			И в таблице 'GroupStructure' я перехожу к строке:
				| "Consolidating company\n/ Business unit" | "Intercompany transactions exclusion method" | "Primary currency" | "Company status for consolidation" | "Effective share, %" |
				| "System LLC"                                            | '- '                   | ''                | "Group"             | '- '                  |
			И в таблице 'GroupStructure' я активизирую поле с именем 'GroupStructureCurrency'
			И в таблице 'GroupStructure' я выбираю текущую строку
			И в таблице 'GroupStructure' из выпадающего списка с именем 'GroupStructureCurrency' я выбираю точное значение 'RUB'
		Если в таблице 'GroupStructure' есть строка Тогда
			| "Company kind" | "Consolidating company\n/ Business unit" | "Primary currency" | "Effective share, %" |
			| "VA - Package CFR"  | "Mercury LLC"                                           | ''                | '100.000'             |
			И в таблице 'GroupStructure' я перехожу к строке:
				| "Company kind" | "Consolidating company\n/ Business unit" | "Primary currency" | "Effective share, %" |
				| "VA - Package CFR"  | "Mercury LLC"                                           | ''                | '100.000'             |
			И в таблице 'GroupStructure' я активизирую поле с именем 'GroupStructureCurrency'
			И в таблице 'GroupStructure' я выбираю текущую строку
			И в таблице 'GroupStructure' из выпадающего списка с именем 'GroupStructureCurrency' я выбираю точное значение 'RUB'
		Если в таблице 'GroupStructure' есть строка Тогда
			| "Consolidating company\n/ Business unit" | "Primary currency" | "Intercompany transactions exclusion method" | "Company status for consolidation" | "Effective share, %" |
			| "Venus LLC"                                             | ''                | "Financial responsibility center"                  | "Financial responsibility center"                | '100'                 |
			И в таблице 'GroupStructure' я перехожу к строке:
				| "Consolidating company\n/ Business unit" | "Primary currency" | "Intercompany transactions exclusion method" | "Company status for consolidation" | "Effective share, %" |
				| "Venus LLC"                                             | ''                | "Financial responsibility center"                  | "Financial responsibility center"                | '100'                 |
			И в таблице 'GroupStructure' я активизирую поле с именем 'GroupStructureCurrency'
			И в таблице 'GroupStructure' я выбираю текущую строку
			И в таблице 'GroupStructure' из выпадающего списка с именем 'GroupStructureCurrency' я выбираю точное значение 'RUB'
		Если в таблице 'GroupStructure' есть строка Тогда
			| "Consolidating company\n/ Business unit" | "Primary currency" | "Intercompany transactions exclusion method" | "Company status for consolidation" | "Effective share, %" |
			| "Earth LLC"                                              | ''                | "Financial responsibility center"                  | "Financial responsibility center"                | '100'                 |
			И в таблице 'GroupStructure' я перехожу к строке:
				| "Consolidating company\n/ Business unit" | "Primary currency" | "Intercompany transactions exclusion method" | "Company status for consolidation" | "Effective share, %" |
				| "Earth LLC"                                              | ''                | "Financial responsibility center"                  | "Financial responsibility center"                | '100'                 |
			И в таблице 'GroupStructure' я активизирую поле с именем 'GroupStructureCurrency'
			И в таблице 'GroupStructure' я выбираю текущую строку
			И в таблице 'GroupStructure' из выпадающего списка с именем 'GroupStructureCurrency' я выбираю точное значение 'RUB'
		Если в таблице 'GroupStructure' есть строка Тогда
			| "Consolidating company\n/ Business unit" | "Primary currency" | "Intercompany transactions exclusion method" | "Company status for consolidation" | "Effective share, %" |
			| "Mars LLC"                                               | ''                | "Financial responsibility center"                  | "Financial responsibility center"                | '100'                 |
			И в таблице 'GroupStructure' я перехожу к строке:
				| "Consolidating company\n/ Business unit" | "Primary currency" | "Intercompany transactions exclusion method" | "Company status for consolidation" | "Effective share, %" |
				| "Mars LLC"                                               | ''                | "Financial responsibility center"                  | "Financial responsibility center"                | '100'                 |
			И в таблице 'GroupStructure' я активизирую поле с именем 'GroupStructureCurrency'
			И в таблице 'GroupStructure' я выбираю текущую строку
			И в таблице 'GroupStructure' из выпадающего списка с именем 'GroupStructureCurrency' я выбираю точное значение 'RUB'

	* Настроим отношение к группе и долю владения 
		Когда открылось окно '$WindowTitle$'
		И в таблице 'GroupStructure' я перехожу к строке:
			| "Company kind" | "Consolidating company\n/ Business unit" | "Primary currency" | "Effective share, %" |
			| "VA - Package CFR"  | "Mercury LLC"                                           | 'RUB'             | '100.000'             |
		И в таблице 'GroupStructure' я активизирую поле с именем 'GroupStructureEffectiveShare'
		И в таблице 'GroupStructure' я выбираю текущую строку
		И в таблице 'GroupStructure' в поле с именем 'GroupStructureEffectiveShare' я ввожу текст '50.000'
		И в таблице 'GroupStructure' я завершаю редактирование строки
		И в таблице 'GroupStructure' я активизирую поле с именем 'GroupStructureCounterpartyGroup'
		И в таблице 'GroupStructure' я выбираю текущую строку
		И в таблице 'GroupStructure' из выпадающего списка с именем 'GroupStructureCounterpartyGroup' я выбираю точное значение "VA - Subsidiary"
		И в таблице 'GroupStructure' я завершаю редактирование строки
		И в таблице 'GroupStructure' я активизирую поле с именем 'GroupStructureIntercompanyTransactionsExclusionMethod'
		И в таблице 'GroupStructure' я выбираю текущую строку
		И в таблице 'GroupStructure' из выпадающего списка с именем 'GroupStructureIntercompanyTransactionsExclusionMethod' я выбираю точное значение "Balance and turnovers"
		И в таблице 'GroupStructure' я завершаю редактирование строки				
				
	* Протестируем кнопки 'Вверх' и 'Вниз'	
		И в таблице 'GroupStructure' я перехожу к строке:
			| "Consolidating company\n/ Business unit" | "Intercompany transactions exclusion method" | "Primary currency" | "Company status for consolidation" | "Effective share, %" |
			| "Mars LLC"                                               | "Eliminating"        | 'RUB'             | "Eliminating"      | '100'                 |
		И в таблице 'GroupStructure' я нажимаю на кнопку с именем 'GroupStructureCommandBarMoveUp'
		И в таблице 'GroupStructure' я нажимаю на кнопку с именем 'GroupStructureCommandBarMoveUp'
		И в таблице 'GroupStructure' я нажимаю на кнопку с именем 'GroupStructureCommandBarMoveUp'
		И в таблице 'GroupStructure' я перехожу к строке:
			| "Company kind" | "Consolidating company\n/ Business unit" | "Intercompany transactions exclusion method" | "Primary currency" | "Company status for consolidation"        | "Effective share, %" |
			| "VA - Package CFR"  | "Mercury LLC"                                           | "Balance and turnovers"    | 'RUB'             | "VA - Subsidiary" | '50.000'              |
		И в таблице 'GroupStructure' я нажимаю на кнопку с именем 'GroupStructureCommandBarMoveDown'
		И в таблице 'GroupStructure' я нажимаю на кнопку с именем 'GroupStructureCommandBarMoveDown'
	
	* Запишем элемент
		Когда открылось окно '$WindowTitle$'
		И я нажимаю на кнопку с именем 'FormWrite'

	* Установим дополнительные валюты
		Тогда Открылся регламент подготовки отчетности "VA - Main regulations"
		И я перехожу к закладке с именем 'PerimeterSetting'
		И я перехожу к закладке с именем 'GroupMainPage'	
		* Марс
			Тогда открылось окно '$WindowTitle$'
			И в таблице 'GroupStructure' я перехожу к строке:
				| "Consolidating company\n/ Business unit" | "Intercompany transactions exclusion method" | "Primary currency" | "Company status for consolidation" | "Effective share, %" |
				| "Mars LLC"                                               | "Eliminating"        | 'RUB'             | "Eliminating"      | '100'                 |
			И в таблице 'GroupStructure' я активизирую поле с именем 'GroupStructureAdditionalCurrencies'
			И в таблице 'GroupStructure' я выбираю текущую строку
			И в таблице 'GroupStructure' я нажимаю кнопку выбора у реквизита с именем 'GroupStructureAdditionalCurrencies'
			Тогда открылось окно "Currency list"
			И я нажимаю на кнопку с именем 'AdditionalCurrenciesAdd'
			И в таблице 'AdditionalCurrencies' из выпадающего списка с именем 'AdditionalCurrenciesCurrency' я выбираю точное значение "EUR"
			И в таблице 'AdditionalCurrencies' я завершаю редактирование строки
			И я нажимаю на кнопку с именем 'AdditionalCurrenciesAdd'
			И в таблице 'AdditionalCurrencies' из выпадающего списка с именем 'AdditionalCurrenciesCurrency' я выбираю точное значение "USD"
			И в таблице 'AdditionalCurrencies' я завершаю редактирование строки
			И я нажимаю на кнопку с именем 'FormOkCommand'
		* Меркурий
			Тогда открылось окно '$WindowTitle$'
			И в таблице 'GroupStructure' я завершаю редактирование строки
			И в таблице 'GroupStructure' я перехожу к строке:
				| "Company kind" | "Consolidating company\n/ Business unit" | "Intercompany transactions exclusion method" | "Primary currency" | "Company status for consolidation"        | "Effective share, %" |
				| "VA - Package CFR"  | "Mercury LLC"                                           | "Balance and turnovers"    | 'RUB'             | "VA - Subsidiary" | '50.000'              |
			И в таблице 'GroupStructure' я выбираю текущую строку
			И в таблице 'GroupStructure' я нажимаю кнопку выбора у реквизита с именем 'GroupStructureAdditionalCurrencies'
			Тогда открылось окно "Currency list"
			И я нажимаю на кнопку с именем 'AdditionalCurrenciesAdd'
			И в таблице 'AdditionalCurrencies' из выпадающего списка с именем 'AdditionalCurrenciesCurrency' я выбираю точное значение "EUR"
			И в таблице 'AdditionalCurrencies' я завершаю редактирование строки
			И я нажимаю на кнопку с именем 'AdditionalCurrenciesAdd'
			И в таблице 'AdditionalCurrencies' из выпадающего списка с именем 'AdditionalCurrenciesCurrency' я выбираю точное значение "USD"
			И в таблице 'AdditionalCurrencies' я завершаю редактирование строки
			И я нажимаю на кнопку с именем 'FormOkCommand'
		* Венера
			Тогда открылось окно '$WindowTitle$'
			И в таблице 'GroupStructure' я завершаю редактирование строки
			И в таблице 'GroupStructure' я перехожу к строке:
				| "Consolidating company\n/ Business unit" | "Intercompany transactions exclusion method" | "Primary currency" | "Company status for consolidation" | "Effective share, %" |
				| "Venus LLC"                                             | "Financial responsibility center"                  | 'RUB'             | "Financial responsibility center"                | '100'                 |
			И в таблице 'GroupStructure' я выбираю текущую строку
			И в таблице 'GroupStructure' я нажимаю кнопку выбора у реквизита с именем 'GroupStructureAdditionalCurrencies'
			Тогда открылось окно "Currency list"
			И я нажимаю на кнопку с именем 'AdditionalCurrenciesAdd'
			И в таблице 'AdditionalCurrencies' из выпадающего списка с именем 'AdditionalCurrenciesCurrency' я выбираю точное значение "EUR"
			И в таблице 'AdditionalCurrencies' я завершаю редактирование строки
			И я нажимаю на кнопку с именем 'AdditionalCurrenciesAdd'
			И в таблице 'AdditionalCurrencies' из выпадающего списка с именем 'AdditionalCurrenciesCurrency' я выбираю точное значение "USD"
			И в таблице 'AdditionalCurrencies' я завершаю редактирование строки
			И я нажимаю на кнопку с именем 'FormOkCommand'
		* Земля
			Тогда открылось окно '$WindowTitle$'
			И в таблице 'GroupStructure' я завершаю редактирование строки
			И в таблице 'GroupStructure' я перехожу к строке:
				| "Consolidating company\n/ Business unit" | "Intercompany transactions exclusion method" | "Primary currency" | "Company status for consolidation" | "Effective share, %" |
				| "Earth LLC"                                              | "Financial responsibility center"                  | 'RUB'             | "Financial responsibility center"                | '100'                 |
			И в таблице 'GroupStructure' я выбираю текущую строку
			И в таблице 'GroupStructure' я нажимаю кнопку выбора у реквизита с именем 'GroupStructureAdditionalCurrencies'
			Тогда открылось окно "Currency list"
			И я нажимаю на кнопку с именем 'AdditionalCurrenciesAdd'
			И в таблице 'AdditionalCurrencies' из выпадающего списка с именем 'AdditionalCurrenciesCurrency' я выбираю точное значение "USD"
			И в таблице 'AdditionalCurrencies' я завершаю редактирование строки
			И я нажимаю на кнопку с именем 'FormOkCommand'

	* Тестируем отчеты и связанные ссылки
		Тогда Открылся регламент подготовки отчетности "VA - Main regulations"
		И в таблице 'GroupStructure' я нажимаю на кнопку с именем 'FormInvestorsComposition'
		Тогда открылось окно "Ownership structure"
		И Я закрываю окно "Ownership structure"
		Тогда открылось окно '$WindowTitle$'
		И в таблице 'GroupStructure' я нажимаю на кнопку с именем 'GroupStructureReportRegulationOrganizationalStructuresOrganizationalStructureChart'
		Тогда открылось окно "Organizational structure briefly"
		И Я закрываю окно "Organizational structure briefly"
		Тогда открылось окно '$WindowTitle$'
		И в таблице 'GroupStructure' я нажимаю на кнопку с именем 'GroupStructureReportRegulationOrganizationalStructuresOrganizationalStructureTable'
		Тогда открылось окно "Organizational structure briefly"
		И Я закрываю окно "Organizational structure briefly"
		Тогда открылось окно '$WindowTitle$'
		И я нажимаю на кнопку с именем 'FormDocumentScenarioPeriodManagementAccountingPeriodManagementDocuments'
		Тогда открылось окно "Reporting period management"
		И Я закрываю окно "Reporting period management"
		Тогда открылось окно '$WindowTitle$'
		И я перехожу к закладке с именем 'GroupMainPage'
	
	* Запишем и закроем элемент
		И я нажимаю на кнопку с именем 'FormWriteAndClose'
		И я жду закрытия окна '$WindowTitle$' в течение 20 секунд
		Тогда открылось окно "Regulations for preparing reports"
		И в таблице 'List' я выбираю текущую строку
	
Сценарий: 00.13 Создание документа Управление отчетным периодом

	* Откроем форму нового документа
		И В командном интерфейсе я выбираю "Budgeting, reporting, and analysis" "Reporting period management"
		Тогда открылось окно "Reporting period management"
		И я нажимаю на кнопку с именем 'FormCreate'
		Тогда открылось окно "Reporting period management (create)"
	
	* Заполняем поля на первой вкладке
		И из выпадающего списка с именем 'Scenario' я выбираю по строке "VA - Main scenario"
		И из выпадающего списка с именем 'ScenarioFrequency' я выбираю точное значение "Month"
		И я нажимаю на кнопку с именем 'ChangePeriod'
		Тогда открылось окно "Select period"
		И в поле с именем 'DateBegin' я ввожу текст '1/1/2024'
		И в поле с именем 'DateEnd' я ввожу текст '3/31/2024'
		И я нажимаю на кнопку с именем 'select'	
		Тогда открылось окно "Reporting period management (create) *"
		И из выпадающего списка с именем 'OrganizationalStructureVersion' я выбираю по строке "VA - Main regulations"	
//		И я устанавливаю флаг с именем 'LimitsSet'
//		И я нажимаю на кнопку с именем 'OpenReportTypesToSetLimits'
//		Тогда открылось окно "Types of reports for limit setting"
//		И Я закрываю окно "Types of reports for limit setting"
//		Тогда открылось окно "Reporting period management (create) *"
//		И я снимаю флаг с именем 'LimitsSet'
		И я нажимаю на кнопку с именем 'FormGoForward'
		Тогда открылось окно "1C:Enterprise"
		И я нажимаю на кнопку с именем 'Button0'

	* Заполняем курсы валют
		Тогда Открылся документ управления периодом для сценария "VA - Main scenario" периодичность "Month"
		И Я заполняю таблицу курсов в управлении периодом сценария
		И я нажимаю на кнопку с именем 'FormGoForward'
		Тогда открылось окно "1C:Enterprise"
		И я нажимаю на кнопку с именем 'Button0'

	* Тестируем кнопки 
		Тогда открылось окно '$WindowTitle$'
		И я нажимаю на кнопку с именем 'FormGoForward'				
		* Блокируем период
			И я нажимаю на кнопку с именем 'PeriodsManagement1'
			Когда открылось окно "Manage period lock duration and indicator updates"
			И в табличном документе 'SpreadsheetFieldPeriodsManagement' я перехожу к ячейке "R5C2:R5C4"
			И я нажимаю на кнопку с именем 'ClosePeriod'
			И я нажимаю на кнопку с именем 'OpenPeriod'
			И в табличном документе 'SpreadsheetFieldPeriodsManagement' я перехожу к ячейке "R5C2:R5C3"
			И я нажимаю на кнопку с именем 'ClosePeriod'
			И Я закрываю окно "Manage period lock duration and indicator updates"
		Тогда открылось окно '$WindowTitle$'
		И я нажимаю на кнопку с именем 'ButtonDeleteVersions'
		Тогда открылось окно "1C:Enterprise"
		И я нажимаю на кнопку с именем 'Button0'
		Тогда открылось окно '$WindowTitle$'
		И я нажимаю на кнопку с именем 'FormClose'

	* Открываем уже записанную форму
		Когда открылось окно "Reporting period management"
		И в таблице 'List' я выбираю текущую строку
		Тогда открылось окно '$WindowTitle$'
		И я нажимаю на кнопку с именем 'ReportOrganizationStructure'
		Тогда открылось окно "Organizational structure briefly"
		И Я закрываю окно "Organizational structure briefly"
		Тогда открылось окно '$WindowTitle$'
		И я нажимаю на кнопку с именем 'FormGoForward'
		И я нажимаю на кнопку с именем 'FormGoForward'
		И я нажимаю на кнопку с именем 'FormGoForward'
		И я нажимаю на кнопку с именем 'FormBack'
		И я нажимаю на кнопку с именем 'FormBack'
		И я нажимаю на кнопку с именем 'FormBack'
		И я нажимаю на кнопку с именем 'FormClose'

Сценарий: 00.14 Создание Видов аналитики (корпоративные)
	
	* Настроим аналитику 'Валюта'	
		И В командном интерфейсе я выбираю "Budgeting, reporting, and analysis" "Dimension types (corporate)"
		И Я в списке "Dimension types (corporate)" по полю "Description" ищу и выбираю элемент 'Currencies' "Exact match" 
		Когда открылось окно '* (Dimension types (corporate))'
		И в поле с именем 'Description' я ввожу текст "Currencies"
		И я запоминаю значение поля с именем 'Code' как 'CodeCurrency'
		И я нажимаю на кнопку с именем 'FormWriteAndClose'
		И я жду закрытия окна "* (Dimension types (corporate)) *" в течение 20 секунд
		И Я для вида аналитики с кодом "$CodeCurrency$" делаю ключом реквизит "Alphabetic code"

	Если '$$ЭтоPerform$$' Тогда
		И Я создаю вид аналитики с кодом "VA0ProCate" именем "Product categories" типом 'CatalogRef.ArbitraryClassifierCPM'
	Иначе
		И Я создаю вид аналитики с кодом "VA0ProCate" именем "Product categories" типом 'CatalogRef.ProductCategories'
	И Я для вида аналитики с кодом "VA0ProCate" делаю ключом реквизит "Description"

	И Я создаю вид аналитики с кодом "VA0Product" именем "Product range" типом 'CatalogRef.Products'
	И Я для вида аналитики с кодом "VA0Product" делаю ключом реквизит "Description"
	И Я для вида аналитики с кодом "VA0Product" делаю ключом реквизит "Product ID"

	И Я создаю вид аналитики с кодом "VA0Counter" именем "Counterparties" типом 'CatalogRef.Counterparties'
	Если '$$IsERPCPM$$' Тогда
		И Я для вида аналитики с кодом "VA0Counter" делаю ключом реквизит "Рабочее наименование"
	Иначе
		И Я для вида аналитики с кодом "VA0Counter" делаю ключом реквизит "Name in the application"

	И Я создаю вид аналитики с кодом "VA0Contrac" именем "Counterparty contracts" типом 'CatalogRef.CounterpartyContracts'
	Если '$$IsERPCPM$$' Тогда
		И Я для вида аналитики с кодом "VA0Contrac" делаю ключом реквизит "Рабочее наименование"
	Иначе
		И Я для вида аналитики с кодом "VA0Contrac" делаю ключом реквизит "Description"

	И Я создаю вид аналитики с кодом "VA0CFItems" именем "Cash flow items" типом 'CatalogRef.CashFlowReportItems'
	И Я для вида аналитики с кодом "VA0CFItems" делаю ключом реквизит "Description"

	И Я создаю вид аналитики с кодом "VA0IEItems" именем "Income and expense items" типом 'CatalogRef.IncomeAndExpenseItems'
	И Я для вида аналитики с кодом "VA0IEItems" делаю ключом реквизит "Description"

Сценарий: 00.15 Создание Вида номенклатуры

	Если '$$IsCPM$$' Тогда
		И Я создаю группу номенклатуры с именем "VA - Products"
		Если 'NOT $$ЭтоPerform$$' Тогда
			И Я создаю вид номенклатуры с именем "VA - Products"
			И Я создаю вид номенклатуры с именем "VA - Other"

	Если '$$IsERPCPM$$' Тогда
		И Я создаю вид номенклатуры с именем "VA - Products" тип 'OwnGoods' в 1C:ERPУХ
		И Я создаю вид номенклатуры с именем "VA - Other" тип 'OwnGoods' в 1C:ERPУХ

Сценарий: 00.16 Создание Товарной категории

	Если '$$ЭтоPerform$$' Тогда
		И Я создаю субконто УХ с именем "Software products" и видом аналитики с кодом "VA0ProCate"
	Иначе
		И Я создаю товарную категорию с именем "Software products" видом номенклатуры "VA - Products"

Сценарий: 00.17 Создание номенклатурной группы

	Если 'NOT $$IsERPCPM$$' Тогда
		И Я создаю номенклатурную группу с именем "VA - Product range group"

Сценарий: 00.18 Создание Номенклатуры

	И Я создаю номенклатуру с именем "4C:Enterprise 8.3 CORP. Server License (x86-64)" родителем "VA - Products" видом номенклатуры "VA - Products" артикулом '2900001916059'
	И Я создаю номенклатуру с именем "3C:Enterprise 8 CORP. Client license for 100 users" родителем "VA - Products" видом номенклатуры "VA - Products" артикулом '4601546106674'
	И Я создаю номенклатуру с именем "5C:Corporate performance management" родителем "VA - Products" видом номенклатуры "VA - Products" артикулом '2900001871389'
	И Я создаю номенклатуру с именем "2C:Corporation" родителем "VA - Products" видом номенклатуры "VA - Products" артикулом '2900001871419'
	И Я создаю номенклатуру с именем "1C:ERP. Corporate performance management" родителем "VA - Products" видом номенклатуры "VA - Products" артикулом '2900001970198'

	Если '$$IsCPM$$' Тогда
		И Я Для номенклатуры с именем "4C:Enterprise 8.3 CORP. Server License (x86-64)" для реквизита 'Product_Category' выбираю значение "VA - Product range group" в группе ''
		И Я Для номенклатуры с именем "3C:Enterprise 8 CORP. Client license for 100 users" для реквизита 'Product_Category' выбираю значение "VA - Product range group" в группе ''
		И Я Для номенклатуры с именем "5C:Corporate performance management" для реквизита 'Product_Category' выбираю значение "VA - Product range group" в группе ''
		И Я Для номенклатуры с именем "2C:Corporation" для реквизита 'Product_Category' выбираю значение "VA - Product range group" в группе ''
		И Я Для номенклатуры с именем "1C:ERP. Corporate performance management" для реквизита 'Product_Category' выбираю значение "VA - Product range group" в группе ''
		
		Если 'NOT $$ЭтоPerform$$' Тогда
			И Я Для номенклатуры с именем "4C:Enterprise 8.3 CORP. Server License (x86-64)" для реквизита 'ТоварнаяCategory' выбираю значение "Software products" в группе 'GroupPurchasesCPM'
			И Я Для номенклатуры с именем "3C:Enterprise 8 CORP. Client license for 100 users" для реквизита 'ТоварнаяCategory' выбираю значение "Software products" в группе 'GroupPurchasesCPM'
			И Я Для номенклатуры с именем "5C:Corporate performance management" для реквизита 'ТоварнаяCategory' выбираю значение "Software products" в группе 'GroupPurchasesCPM'
			И Я Для номенклатуры с именем "2C:Corporation" для реквизита 'ТоварнаяCategory' выбираю значение "Software products" в группе 'GroupPurchasesCPM'
			И Я Для номенклатуры с именем "1C:ERP. Corporate performance management" для реквизита 'ТоварнаяCategory' выбираю значение "Software products" в группе 'GroupPurchasesCPM'

	ИначеЕсли '$$IsERPCPM$$' Тогда
		И Я Для номенклатуры с именем "4C:Enterprise 8.3 CORP. Server License (x86-64)" для реквизита 'ТоварнаяCategory' выбираю значение "Software products" в группе 'СворачиваемаяGroupПланированиеANDМаркетинг'
		И Я Для номенклатуры с именем "3C:Enterprise 8 CORP. Client license for 100 users" для реквизита 'ТоварнаяCategory' выбираю значение "Software products" в группе 'СворачиваемаяGroupПланированиеANDМаркетинг'
		И Я Для номенклатуры с именем "5C:Corporate performance management" для реквизита 'ТоварнаяCategory' выбираю значение "Software products" в группе 'СворачиваемаяGroupПланированиеANDМаркетинг'
		И Я Для номенклатуры с именем "2C:Corporation" для реквизита 'ТоварнаяCategory' выбираю значение "Software products" в группе 'СворачиваемаяGroupПланированиеANDМаркетинг'
		И Я Для номенклатуры с именем "1C:ERP. Corporate performance management" для реквизита 'ТоварнаяCategory' выбираю значение "Software products" в группе 'СворачиваемаяGroupПланированиеANDМаркетинг'	

Сценарий: 00.19 Установка цен номенклатуры

	Если '$$IsCPM$$' Тогда
		И Я создаю тип цен с именем "VA - Products" валютой 'RUB'
		Если '$$ЭтоPerform$$' Тогда
			И Я устанавливаю цену с типом "VA - Products" номенклатуры "4C:Enterprise 8.3 CORP. Server License (x86-64)" на дату '1/1/2024' в значение '180000.00' 'RUB' в 1C:CPMWE
			И Я устанавливаю цену с типом "VA - Products" номенклатуры "3C:Enterprise 8 CORP. Client license for 100 users" на дату '1/1/2024' в значение '600000.00' 'RUB' в 1C:CPMWE
			И Я устанавливаю цену с типом "VA - Products" номенклатуры "5C:Corporate performance management" на дату '1/1/2024' в значение '1250000.00' 'RUB' в 1C:CPMWE
			И Я устанавливаю цену с типом "VA - Products" номенклатуры "2C:Corporation" на дату '1/1/2024' в значение '2050000.00' 'RUB' в 1C:CPMWE
			И Я устанавливаю цену с типом "VA - Products" номенклатуры "1C:ERP. Corporate performance management" на дату '1/1/2024' в значение '1950000.00' 'RUB' в 1C:CPMWE
			И Я устанавливаю цену с типом "VA - Products" номенклатуры "4C:Enterprise 8.3 CORP. Server License (x86-64)" на дату '2/1/2024' в значение '198000.00' 'RUB' в 1C:CPMWE
			И Я устанавливаю цену с типом "VA - Products" номенклатуры "3C:Enterprise 8 CORP. Client license for 100 users" на дату '2/1/2024' в значение '660000.00' 'RUB' в 1C:CPMWE
			И Я устанавливаю цену с типом "VA - Products" номенклатуры "5C:Corporate performance management" на дату '2/1/2024' в значение '1375000.00' 'RUB' в 1C:CPMWE
			И Я устанавливаю цену с типом "VA - Products" номенклатуры "2C:Corporation" на дату '2/1/2024' в значение '2255000.00' 'RUB' в 1C:CPMWE
			И Я устанавливаю цену с типом "VA - Products" номенклатуры "1C:ERP. Corporate performance management" на дату '2/1/2024' в значение '2145000.00' 'RUB' в 1C:CPMWE
			И Я устанавливаю цену с типом "VA - Products" номенклатуры "4C:Enterprise 8.3 CORP. Server License (x86-64)" на дату '3/1/2024' в значение '223700.00' 'RUB' в 1C:CPMWE
			И Я устанавливаю цену с типом "VA - Products" номенклатуры "3C:Enterprise 8 CORP. Client license for 100 users" на дату '3/1/2024' в значение '745800.00' 'RUB' в 1C:CPMWE
			И Я устанавливаю цену с типом "VA - Products" номенклатуры "5C:Corporate performance management" на дату '3/1/2024' в значение '1553800.00' 'RUB' в 1C:CPMWE
			И Я устанавливаю цену с типом "VA - Products" номенклатуры "2C:Corporation" на дату '3/1/2024' в значение '2548200.00' 'RUB' в 1C:CPMWE
			И Я устанавливаю цену с типом "VA - Products" номенклатуры "1C:ERP. Corporate performance management" на дату '3/1/2024' в значение '2423900.00' 'RUB' в 1C:CPMWE
		Иначе
			* 1С:УХ	

				// УХ - Открываем список документов
				И В командном интерфейсе я выбираю "Warehouse" "Install цен номенклатуры"
				Тогда открылось окно "Install цен номенклатуры"		
				
				// Создаем новый документ
				И я нажимаю на кнопку с именем 'FormCreate'
				Тогда открылось окно "Install цен номенклатуры (create)"
				И в поле с именем 'Date' я ввожу текст '01.01.2024  12:00:00 AM'
				И из выпадающего списка с именем 'PriceType_' я выбираю по строке "VA - Products"

				// Товары
				Когда открылось окно "Install цен номенклатуры (create) *"
				И в таблице 'Goods' я нажимаю на кнопку с именем 'GoodsAdd'
				И в таблице 'Goods' из выпадающего списка с именем 'GoodsProducts' я выбираю по строке "4C:Enterprise 8.3 CORP. Server License (x86-64)"
				И в таблице 'Goods' в поле с именем 'GoodsPrice' я ввожу текст '180000.00'
				И в таблице 'Goods' я нажимаю на кнопку с именем 'GoodsAdd'
				И в таблице 'Goods' из выпадающего списка с именем 'GoodsProducts' я выбираю по строке "3C:Enterprise 8 CORP. Client license for 100 users"
				И в таблице 'Goods' в поле с именем 'GoodsPrice' я ввожу текст '600000.00'
				И в таблице 'Goods' я нажимаю на кнопку с именем 'GoodsAdd'
				И в таблице 'Goods' из выпадающего списка с именем 'GoodsProducts' я выбираю по строке "5C:Corporate performance management"
				И в таблице 'Goods' в поле с именем 'GoodsPrice' я ввожу текст '1250000.00'
				И в таблице 'Goods' я нажимаю на кнопку с именем 'GoodsAdd'
				И в таблице 'Goods' из выпадающего списка с именем 'GoodsProducts' я выбираю по строке "2C:Corporation"
				И в таблице 'Goods' в поле с именем 'GoodsPrice' я ввожу текст '2050000.00'
				И в таблице 'Goods' я нажимаю на кнопку с именем 'GoodsAdd'
				И в таблице 'Goods' из выпадающего списка с именем 'GoodsProducts' я выбираю по строке "1C:ERP. Corporate performance management"
				И в таблице 'Goods' в поле с именем 'GoodsPrice' я ввожу текст '1950000.00'
			
				// Запишем документ
				И я нажимаю на кнопку с именем 'FormPostAndClose'
				И я жду закрытия окна "Install цен номенклатуры (create) *" в течение 30 секунд
						
				// Создадим еще один документ
				Когда открылось окно "Install цен номенклатуры"
				И я нажимаю на кнопку с именем 'FormCreate'
				Тогда открылось окно "Install цен номенклатуры (create)"
				И в поле с именем 'Date' я ввожу текст '01.02.2024  12:00:00 AM'
				И из выпадающего списка с именем 'PriceType_' я выбираю по строке "VA - Products"
				И в таблице 'Goods' я нажимаю на кнопку с именем 'FillByGroupНоменклатуры'
				Тогда открылось окно "Product range"
				И я выбираю пункт контекстного меню с именем 'ListContextMenuFind' на элементе формы с именем 'List'
				Тогда открылась форма с именем 'UniversalListFindExtForm'
				И в поле с именем 'Pattern' я ввожу текст "VA - Products"
				И я нажимаю на кнопку с именем 'Find'
				Тогда открылось окно "Product range"
				И в таблице 'List' я выбираю текущую строку
				Тогда открылось окно "Install цен номенклатуры (create) *"
				И в таблице 'Goods' я нажимаю на кнопку с именем 'GoodsChangeGoods'
				Тогда открылось окно "Modify таблицы товаров"
				И из выпадающего списка с именем 'CurrentAction1' я выбираю точное значение "Change цены for процент"
				И в поле с именем 'VariantValuesNumberPercent' я ввожу текст '10.00'
				И я нажимаю на кнопку с именем 'Execute'
				И я нажимаю на кнопку с именем 'FormMoveTo_INDocument'
				Тогда открылось окно "Install цен номенклатуры (create) *"
				И я нажимаю на кнопку с именем 'FormPostAndClose'
				И я жду закрытия окна "Install цен номенклатуры (create) *" в течение 20 секунд
			
				// Создадим документ копированием
				Когда открылось окно "Install цен номенклатуры"
				И я выбираю пункт контекстного меню с именем 'ListContextMenuCopy' на элементе формы с именем 'List'
				Тогда открылось окно "Install цен номенклатуры (create)"
				И в поле с именем 'Date' я ввожу текст '01.03.2024  12:00:00 AM'
				И в таблице 'Goods' я нажимаю на кнопку с именем 'GoodsChangeGoods'
				Тогда открылось окно "Modify таблицы товаров"
				И в поле с именем 'VariantValuesNumberPercent' я ввожу текст '13.00'
				И я нажимаю на кнопку с именем 'Execute'
				И из выпадающего списка с именем 'CurrentAction1' я выбираю точное значение "Round off цены до"
				И из выпадающего списка с именем 'VariantValuesOrderОкругления' я выбираю точное значение "100"
				И я нажимаю на кнопку с именем 'Execute'
				И я нажимаю на кнопку с именем 'FormMoveTo_INDocument'
				Тогда открылось окно "Install цен номенклатуры (create) *"
				И я нажимаю на кнопку с именем 'FormPostAndClose'
				И я жду закрытия окна "Install цен номенклатуры (create) *" в течение 20 секунд

				// Проверим результат
				Когда открылось окно "Install цен номенклатуры"
				И в таблице 'List' я выбираю текущую строку
				Тогда открылось окно "Install цен номенклатуры * from *"
				Тогда таблица 'Goods' стала равной:
				| 'n' | "Product range"                                                   | "Price"         | "Currency" | "Indent" |
				| '1' | "4C:Enterprise 8.3 CORP. Server License (x86-64)"           | '223,700.00'   | 'RUB'    | ''       |
				| '2' | "3C:Enterprise 8 CORP. Client license for 100 users" | '745,800.00'   | 'RUB'    | ''       |
				| '3' | "5C:Corporate performance management"                                      | '1,553,800.00' | 'RUB'    | ''       |
				| '4' | "2C:Corporation"                                                  | '2,548,200.00' | 'RUB'    | ''       |
				| '5' | "1C:ERP. Corporate performance management"                                   | '2,423,900.00' | 'RUB'    | ''       |
				И Я закрываю окно "Install цен номенклатуры * from *"				

	Если '$$IsERPCPM$$' Тогда	

		* Создаем новый вид цен
			И В командном интерфейсе я выбираю "CRM and маркетandнг" "Settings and справочнandkand"
			Тогда открылось окно "Settings and справочнandkand to CRM and маркетandнгу"
			И я нажимаю на кнопку с именем 'OpenKindsЦен'
			Тогда открылось окно "Виды цен "
			И я меняю значение переключателя с именем 'GroupWarehousesViewOptionВидовЦен' на 'All'
			И я жду открытия формы "Виды цен " в течение 10 секунд
			Если в таблице 'List' количество строк 'равно' 0 Тогда
				И Я запоминаю значение выражения 'False' в переменную 'HasSelectionВидовЦен'
			Иначе
				И Я запоминаю значение выражения 'True' в переменную 'HasSelectionВидовЦен'
			И Пауза 1			
			И Я в списке "Виды цен " по полю "Description" ищу элемент "VA - Products" "Exact match" 
			И Пока в таблице 'List' количество строк 'больше' 0 Тогда
				И Я запоминаю значение выражения '"Delete_" + StrReplace(New UUID, "-", "")' в переменную 'UID'
				И в таблице 'List' я выбираю текущую строку
				Тогда открылось окно "VA - Products (Вид цены)"
				И я нажимаю на кнопку с именем 'AllowObjectAttributeEdit'
				Тогда открылось окно "Unlock attribute"
				И я нажимаю на кнопку с именем 'EnableEdit'
				Тогда открылось окно "VA - Products (Вид цены) *"
				И в поле с именем 'Description' я ввожу значение переменной 'UID'
				И я нажимаю на кнопку с именем 'FormWriteAndClose'
				И я жду закрытия окна "VA - Products (Вид цены) *" в течение 20 секунд
			И я нажимаю на кнопку с именем 'FormCreate'
			Тогда открылось окно "Вид цены (create)"
			И в поле с именем 'Description' я ввожу текст "VA - Products"
			И из выпадающего списка с именем 'CurrencyЦены' я выбираю точное значение 'RUB'
			И я изменяю флаг с именем 'PriceВключаетVAT'
			И я изменяю флаг с именем 'UseWhen_ОптовойПродаже'
			И я изменяю флаг с именем 'UseWhen_РозничнойПродаже'
			И я изменяю флаг с именем 'UseWhen_ВыпускеПродукции'
			И я устанавливаю флаг с именем 'Округлять'
			И из выпадающего списка с именем 'AccuracyОкругления' я выбираю точное значение "100"				
			И я нажимаю на кнопку с именем 'FormWriteAndClose'
			И я жду закрытия окна "Вид цены (create) *" в течение 20 секунд

		* Вводим документ за Январь
			Когда В командном интерфейсе я выбираю "CRM and маркетandнг" "Цены (прайс-лист)"
			Тогда открылось окно "Прайс-лист for *"
			И я нажимаю на кнопку с именем 'HistoryChangesЦен'
			Тогда открылось окно "History изменения цен"
			И в таблице 'List' я нажимаю на кнопку с именем 'ListCreate'
			И я жду открытия формы  "Install цен номенклатуры (create)" в течение 10 секунд
			Если '$HasSelectionВидовЦен$' Тогда
				И в таблице 'SelectedItemsЦены' я активизирую поле с именем 'SelectedItemsЦеныRef'
				И я выбираю пункт контекстного меню с именем 'SelectedItemsЦеныFind' на элементе формы с именем 'SelectedItemsЦены'
				Тогда открылась форма с именем 'UniversalListFindExtForm'
				И из выпадающего списка с именем 'FieldSelector' я выбираю точное значение "Виды цен"
				И из выпадающего списка с именем 'Pattern' я выбираю по строке "VA - Products"
				И я нажимаю на кнопку с именем 'Find'
				Тогда открылось окно "Install цен номенклатуры (create)"
				И в таблице 'SelectedItemsЦены' я изменяю флаг с именем 'SelectedItemsЦеныEdit'
				И я нажимаю на кнопку с именем 'KindsЦенNextCommand'
			И в поле с именем 'Date' я ввожу текст '1/1/2024'
			И в таблице 'TreeЦен' я нажимаю на кнопку с именем 'TreeЦенAddНоменклатуру'
			И в таблице 'TreeЦен' из выпадающего списка с именем 'TreeЦенProducts' я выбираю по строке "4C:Enterprise 8.3 CORP. Server License (x86-64)"
			И в таблице 'TreeЦен' в поле с именем 'TreeЦенKindЦены*' я ввожу текст '180000.00'
			И в таблице 'TreeЦен' я нажимаю на кнопку с именем 'TreeЦенAddНоменклатуру'
			И в таблице 'TreeЦен' из выпадающего списка с именем 'TreeЦенProducts' я выбираю по строке "3C:Enterprise 8 CORP. Client license for 100 users"
			И в таблице 'TreeЦен' в поле с именем 'TreeЦенKindЦены*' я ввожу текст '600000.00'
			И в таблице 'TreeЦен' я нажимаю на кнопку с именем 'TreeЦенAddНоменклатуру'
			И в таблице 'TreeЦен' из выпадающего списка с именем 'TreeЦенProducts' я выбираю по строке "5C:Corporate performance management"
			И в таблице 'TreeЦен' в поле с именем 'TreeЦенKindЦены*' я ввожу текст '1250000.00'
			И в таблице 'TreeЦен' я нажимаю на кнопку с именем 'TreeЦенAddНоменклатуру'
			И в таблице 'TreeЦен' из выпадающего списка с именем 'TreeЦенProducts' я выбираю по строке "2C:Corporation"
			И в таблице 'TreeЦен' в поле с именем 'TreeЦенKindЦены*' я ввожу текст '2050000.00'
			И в таблице 'TreeЦен' я нажимаю на кнопку с именем 'TreeЦенAddНоменклатуру'
			И в таблице 'TreeЦен' из выпадающего списка с именем 'TreeЦенProducts' я выбираю по строке "1C:ERP. Corporate performance management"
			И в таблице 'TreeЦен' в поле с именем 'TreeЦенKindЦены*' я ввожу текст '1950000.00'
			Если элемент 'NumberINПределахДня' присутствует на форме Тогда
				И в поле с именем 'NumberINПределахДня' я ввожу текст '1'
			И я нажимаю на кнопку с именем 'FormPostAndClose'
			И я жду закрытия окна "Install цен номенклатуры (create) *" в течение 20 секунд
				
		* Вводим документ за Февраль
			Когда открылось окно "History изменения цен"
			И в таблице 'List' я нажимаю на кнопку с именем 'ListCreate'
			И я жду открытия формы  "Install цен номенклатуры (create)" в течение 10 секунд
			Если '$HasSelectionВидовЦен$' Тогда
				И в таблице 'SelectedItemsЦены' я активизирую поле с именем 'SelectedItemsЦеныRef'
				И я выбираю пункт контекстного меню с именем 'SelectedItemsЦеныFind' на элементе формы с именем 'SelectedItemsЦены'
				Тогда открылась форма с именем 'UniversalListFindExtForm'
				И из выпадающего списка с именем 'FieldSelector' я выбираю точное значение "Виды цен"
				И из выпадающего списка с именем 'Pattern' я выбираю по строке "VA - Products"
				И я нажимаю на кнопку с именем 'Find'
				Тогда открылось окно "Install цен номенклатуры (create)"
				И в таблице 'SelectedItemsЦены' я изменяю флаг с именем 'SelectedItemsЦеныEdit'
				И я нажимаю на кнопку с именем 'KindsЦенNextCommand'
			И в поле с именем 'Date' я ввожу текст '2/1/2024'
			И в таблице 'TreeЦен' я нажимаю на кнопку с именем 'TreeЦенAddGoodsOnОтбору'
			Тогда открылось окно "Pick товаров to отбору"
			И в таблице 'SettingsComposerSettingsFilter' я перехожу к строке:
				| 'Kind сравнения' | 'Value'          | 'Use' | 'Field'             | 'Application' | 'Mode отображения' |
				| 'IN List_SSLy'      | '<Пустое значение>' | 'No'           | 'Kind номенклатуры' | 'Ordinary'    | 'Быстрый доступ'    |
			И в таблице 'SettingsComposerSettingsFilter' я нажимаю кнопку выбора у реквизита с именем 'SettingsComposerSettingsFilterRightValue'
			Тогда открылось окно "Value list"
			И в таблице 'ValueList' я выбираю текущую строку
			И в таблице 'ValueList' из выпадающего списка с именем 'value' я выбираю по строке "VA - Products"
			И я нажимаю на кнопку с именем 'OK'
			Тогда открылось окно "Pick товаров to отбору"
			И в таблице 'SettingsComposerSettingsFilter' я завершаю редактирование строки
			И я нажимаю на кнопку с именем 'Fill'
			И я нажимаю на кнопку с именем 'MoveToDocument'
			Тогда открылось окно "Install цен номенклатуры (create) *"
			И в таблице 'TreeЦен' я нажимаю на кнопку с именем 'TreeЦенLoadСтарыеЦены'
			Тогда открылось окно "Select параметров расчета цен"
			И я нажимаю на кнопку с именем 'OK'
			Тогда открылось окно "Install цен номенклатуры (create) *"
			И в таблице 'TreeЦен' я нажимаю на кнопку с именем 'TreeЦенChangeЦены'
			Тогда открылось окно "Change for процент"
			И в таблице 'KindsЦен' я активизирую поле с именем 'KindsЦенPercentChanges'
			И в таблице 'KindsЦен' я выбираю текущую строку
			И в таблице 'KindsЦен' в поле с именем 'KindsЦенPercentChanges' я ввожу текст '10.00'
			И в таблице 'KindsЦен' я завершаю редактирование строки
			И я нажимаю на кнопку с именем 'OK'
			Тогда открылось окно "Install цен номенклатуры (create) *"
			Если элемент 'NumberINПределахДня' присутствует на форме Тогда	
				И в поле с именем 'NumberINПределахДня' я ввожу текст '1'
			И я нажимаю на кнопку с именем 'FormPostAndClose'
			И я жду закрытия окна "Install цен номенклатуры (create) *" в течение 20 секунд

		* Вводим документ за Март копированием
			Когда открылось окно "History изменения цен"
			И я выбираю пункт контекстного меню с именем 'ListContextMenuCopy' на элементе формы с именем 'List'
			Тогда открылось окно "Install цен номенклатуры (create)"
			И в поле с именем 'Date' я ввожу текст '3/1/2024'
			И в таблице 'TreeЦен' я нажимаю на кнопку с именем 'TreeЦенChangeЦены'
			Тогда открылось окно "Change for процент"
			И в таблице 'KindsЦен' я изменяю флаг с именем 'KindsЦенShouldRecalculate'
			И в таблице 'KindsЦен' в поле с именем 'KindsЦенPercentChanges' я ввожу текст '13.00'
			Когда открылось окно "Change for процент"
			И я нажимаю на кнопку с именем 'OK'
			Тогда открылось окно "Install цен номенклатуры (create) *"
			Если элемент 'NumberINПределахДня' присутствует на форме Тогда	
				И в поле с именем 'NumberINПределахДня' я ввожу текст '1'		
			И я нажимаю на кнопку с именем 'FormPostAndClose'
			И я жду закрытия окна "Install цен номенклатуры (create) *" в течение 20 секунд

		* Проверяем результат
			Когда открылось окно "History изменения цен"
			И в таблице 'List' я выбираю текущую строку
			Тогда открылось окно "Install цен номенклатуры * from *"
			Тогда таблица 'TreeЦен' стала равной:
			| "Product range"                                                   | "Price"         |
			| "4C:Enterprise 8.3 CORP. Server License (x86-64)"           | '223,700.00'   |
			| "3C:Enterprise 8 CORP. Client license for 100 users" | '745,800.00'   |
			| "5C:Corporate performance management"                                      | '1,553,800.00' |
			| "2C:Corporation"                                                  | '2,548,200.00' |
			| "1C:ERP. Corporate performance management"                                   | '2,423,900.00' |
			И Я закрываю окно "Install цен номенклатуры * from *"

Сценарий: 00.20 Создание Контрагентов и Договоров контрагентов

	Если '$$IsCPM$$' Тогда
		Если 'NOT $$ЭтоPerform$$' Тогда
			И Я создаю условие оплаты с именем "VA - Agreement with the client"
			И я перезаполняю константу 'UseНумерациюДоговоровFrom1Покупателями' значением 'FALSE'			

		И Я создаю группу контрагентов с именем "VA - Counterparties"

		И Я создаю контрагента с именем "LLC \"Ganymede\"" родителем "VA - Counterparties" страной регистрации '643'
		И Я создаю договор для контрагента "LLC \"Ganymede\"" номер "Ganymede-001" дата '1/1/2024' валюта 'RUB' организация "Mercury LLC" вид "With customer" сумма '10000.00' условие оплаты "VA - Agreement with the client"
		И Я создаю договор для контрагента "LLC \"Ganymede\"" номер "Ganymede-002" дата '1/1/2024' валюта 'RUB' организация "Mercury LLC" вид "With supplier" сумма '20000.00' условие оплаты "VA - Agreement with the client"
		
		И Я создаю контрагента с именем "LLC \"Io\"" родителем "VA - Counterparties" страной регистрации '643'
		И Я создаю договор для контрагента "LLC \"Io\"" номер "Io-001" дата '1/1/2024' валюта 'RUB' организация "Mercury LLC" вид "With customer" сумма '10000.00' условие оплаты "VA - Agreement with the client"
		И Я создаю договор для контрагента "LLC \"Io\"" номер "Io-002" дата '1/1/2024' валюта 'RUB' организация "Mercury LLC" вид "With customer" сумма '20000.00' условие оплаты "VA - Agreement with the client"
		
	Если '$$IsERPCPM$$' Тогда					

		И Я создаю партнера с именем "LLC \"Ganymede\"" тип 'Client' в 1C:ERPУХ

		И Я создаю соглашение с клиентом с именем "VA - Agreement with the client" валютой 'RUB' в 1C:ERPУХ	

		И Для партнера "LLC \"Ganymede\"" я создаю контрагента с именем "LLC \"Ganymede\"" вид 'Юридическое лицо' в 1C:ERPУХ
		И Для партнера "LLC \"Ganymede\"" контрагента "LLC \"Ganymede\"" я создаю договор с видом "With customer" номер "Ganymede-001" от '1/1/2024' организация "Mercury LLC" валюта 'RUB' сумма '10000.00' соглашение "VA - Agreement with the client" в 1C:ERPУХ		
		И Для партнера "LLC \"Ganymede\"" контрагента "LLC \"Ganymede\"" я создаю договор с видом "With customer" номер "Ganymede-002" от '1/1/2024' организация "Mercury LLC" валюта 'RUB' сумма '20000.00' соглашение "VA - Agreement with the client" в 1C:ERPУХ		

		И Я создаю партнера с именем "LLC \"Io\"" тип 'Vendor' в 1C:ERPУХ

		И Я создаю соглашение с поставщиком "LLC \"Io\"" с именем "VA - Соглашение From toFromтавщиком" валютой 'RUB' в 1C:ERPУХ

		И Для партнера "LLC \"Io\"" я создаю контрагента с именем "LLC \"Io\"" вид 'Юридическое лицо' в 1C:ERPУХ
		И Для партнера "LLC \"Io\"" контрагента "LLC \"Io\"" я создаю договор с видом "With supplier" номер "Io-001" от '1/1/2024' организация "Mercury LLC" валюта 'RUB' сумма '10000.00' соглашение "VA - Соглашение From toFromтавщиком" в 1C:ERPУХ		
		И Для партнера "LLC \"Io\"" контрагента "LLC \"Io\"" я создаю договор с видом "With supplier" номер 'Ио-002' от '1/1/2024' организация "Mercury LLC" валюта 'RUB' сумма '20000.00' соглашение "VA - Соглашение From toFromтавщиком" в 1C:ERPУХ		

Сценарий: 00.21 Создание Статей движения денежных средств

	И Я создаю группу статей ДДС с именем "VA - Cash flow items"
	И Я создаю статью ДДС с именем "3Software sale" родителем "VA - Cash flow items"
	И Я создаю статью ДДС с именем "2Software implementation" родителем "VA - Cash flow items"
	И Я создаю статью ДДС с именем "1Software upgrade" родителем "VA - Cash flow items"

Сценарий: 00.22 Создание Статьей доходов и расходов

	И Я создаю группу статей ДиР с именем "VA - Income and expense items"
	И Я создаю статью ДиР с именем "3Software sale" родителем "VA - Income and expense items"
	И Я создаю статью ДиР с именем "2Software implementation" родителем "VA - Income and expense items"

Сценарий: 00.23 Создание документа "Отражение фактических данных"

	Если 'NOT $$ЭтоPerform$$' Тогда

		* Создаем новый документ №1
			И В командном интерфейсе я выбираю "Казначейство" "Отражения фактических данных"
			Тогда открылось окно "Отражения фактических данных"
			И я нажимаю на кнопку с именем 'FormCreate'

			* Страница 'Основное'	
				Тогда открылось окно "Отражение фактических данных (create)"
				И в поле с именем 'Date' я ввожу текст '01.01.2024  12:00:00 AM'
				И из выпадающего списка с именем 'DBDocument' я выбираю по строке 'CustomerInvoice'		
				И из выпадающего списка с именем 'Scenario' я выбираю по строке "VA - Main scenario"
				И из выпадающего списка с именем 'Organization' я выбираю по строке "Mercury LLC"
				И я нажимаю кнопку выбора у поля с именем 'Counterparty'
				Тогда открылось окно "Select data type"
				И в таблице 'TypeTree' я перехожу к строке
					| 'Column1' |
					| 'Counterparty' |
				И в таблице 'TypeTree' я выбираю текущую строку
				Тогда открылось окно "Counterparties*"
				И я нажимаю на кнопку с именем 'FormFind'
				Тогда открылась форма с именем 'UniversalListFindExtForm'
				Если '$$IsCPM$$' Тогда
					И из выпадающего списка с именем 'FieldSelector' я выбираю точное значение "Name in the application"
				Если '$$IsERPCPM$$' Тогда
					И из выпадающего списка с именем 'FieldSelector' я выбираю точное значение "Description"
				И я меняю значение переключателя с именем 'CompareType' на "Exact match"
				И в поле с именем 'Pattern' я ввожу текст "LLC \"Ganymede\""
				И я нажимаю на кнопку с именем 'Find'
				Тогда открылось окно "Counterparties*"
				И в таблице 'List' я выбираю текущую строку
				И из выпадающего списка с именем 'DocumentCurrency' я выбираю точное значение "RUB"
				И из выпадающего списка с именем 'ArrivalExpense' я выбираю точное значение "Income"
			
			* Бюджет движения денежных средств
				Когда открылось окно "Отражение фактических данных (create) *"
				И я перехожу к закладке с именем 'GroupCFB'
				И из выпадающего списка с именем 'PeriodCFB' я выбираю по строке '1 неделя. January 2024 G.'
				И в таблице 'TabCashFlowsBudget' я нажимаю на кнопку с именем 'TabCashFlowsBudgetAdd'
				Если '$$IsERPCPM$$' Тогда
					И в таблице 'TabCashFlowsBudget' я нажимаю кнопку выбора у реквизита с именем 'TabCashFlowsBudgetCounterpartyContract'
					Тогда открылось окно "Select data type"
					И в таблице '' я перехожу к строке:
						| ''                       |
						| 'Contract From1 контрагентом' |
					И в таблице '' я выбираю текущую строку
					Тогда открылось окно "Contracts From контрагентами"
					И Я закрываю окно "Contracts From контрагентами"
					И в таблице 'TabCashFlowsBudget' я нажимаю кнопку выбора у реквизита с именем 'TabCashFlowsBudgetCashFlowItem'
					Если открылось окно "Select data type" Тогда
						И в таблице '' я перехожу к строке:
							| ''                                 |
							| "Cash flow item" |
						И в таблице '' я выбираю текущую строку
					Тогда открылось окно "Cash flow items"
					И Я закрываю окно "Cash flow items"
				И в таблице 'TabCashFlowsBudget' из выпадающего списка с именем 'TabCashFlowsBudgetCounterpartyContract' я выбираю по строке "Ganymede-001"
				И в таблице 'TabCashFlowsBudget' из выпадающего списка с именем 'TabCashFlowsBudgetCashFlowItem' я выбираю по строке "3Software sale"
				И в таблице 'TabCashFlowsBudget' из выпадающего списка с именем 'TabCashFlowsBudgetCenterForFinancialResponsibility' я выбираю по строке "Mercury LLC"
				И в таблице 'TabCashFlowsBudget' из выпадающего списка с именем 'TabCashFlowsBudgetProject' я выбираю по строке "VA - Main project"
				И в таблице 'TabCashFlowsBudget' в поле с именем 'TabCashFlowsBudgetSum' я ввожу текст '780,000.00'			
				И в таблице 'TabCashFlowsBudget' я завершаю редактирование строки
				И я выбираю пункт контекстного меню с именем 'TabCashFlowsBudgetContextMenuCopy' на элементе формы с именем 'TabCashFlowsBudget'
				И в таблице 'TabCashFlowsBudget' из выпадающего списка с именем 'TabCashFlowsBudgetCounterpartyContract' я выбираю по строке "Ganymede-002"
				И в таблице 'TabCashFlowsBudget' из выпадающего списка с именем 'TabCashFlowsBudgetCashFlowItem' я выбираю по строке "2Software implementation"
				И в таблице 'TabCashFlowsBudget' в поле с именем 'TabCashFlowsBudgetSum' я ввожу текст '2 340 000,00'
				И в таблице 'TabCashFlowsBudget' я завершаю редактирование строки		
				
			* Запишем документ, проверим движения
				Когда открылось окно "Отражение фактических данных (create) *"
				И я нажимаю на кнопку с именем 'FormPost'
				Тогда открылось окно "Reflection of actual data * from *"
				И я нажимаю на кнопку с именем 'FormProcessingDocumentRegisterRecordsDocumentRegisterRecordsReport'
				Тогда открылось окно "Document register records: Отражение фактических данных * from *"
				Если '$$IsCPM$$' Тогда
					И я перехожу к закладке с именем 'GroupRegisteredRecordsДенежныхСредствCPM'
					Тогда таблица 'CashFlowCPM' стала равной:
						| 'n' | "Cash flow item" | "Bank account / касса" | "Income expense" | "Вид денежных средств" | "Counterparty, подотчетник, касса ККМ" | 'Dimension2' | "Counterparty contract"       | 'Dimension1' | 'Dimension3' | 'Dimension4' | 'Dimension5' | 'Dimension6' | "Amount упр. учета" | 'Sum'        |
						| '1' | "3Software sale" | ''                        | 'Receipt'        | 'BankAccountPayment'          | 'LLC "Ганимед"'                      | ''           | 'Ганимед-001 dated 01.01.2024' | ''           | ''           | ''           | ''           | ''           | '780,000.00'       | '780,000.00'   |
						| '2' | "2Software implementation"  | ''                        | 'Receipt'        | 'BankAccountPayment'          | 'LLC "Ганимед"'                      | ''           | 'Ганимед-002 dated 01.01.2024' | ''           | ''           | ''           | ''           | ''           | '2,340,000.00'     | '2,340,000.00' |
				Если '$$IsERPCPM$$' Тогда
					Тогда таблица "OperationsБюджетов" стала равной:
						| 'n' | 'Kind бюджета'                      | 'Receipt расход' | 'Sum' | 'Dimension партнеров'                                    | 'Rate планирования' | 'Sum исполнено' | 'Dimension структуры'                              | 'Count' | 'Currency' | 'Dimension статей бюджетов'               |
						| '1' | 'Бюджет движения денежных средств' | 'Receipt'        | ''      | 'Mercury LLC; LLC "Ганимед"; Ганимед-001 dated 01.01.2024' | '1.0000'            | '780,000.00'      | 'Mercury LLC; DimenKind - Main проект; Mercury LLC' | ''           | 'RUB'    | 'Реализация программных продуктов Receipt' |
						| '2' | 'Бюджет движения денежных средств' | 'Receipt'        | ''      | 'Mercury LLC; LLC "Ганимед"; Ганимед-002 dated 01.01.2024' | '1.0000'            | '2,340,000.00'    | 'Mercury LLC; DimenKind - Main проект; Mercury LLC' | ''           | 'RUB'    | 'Integrate программных продуктов Receipt'  |

			* Закроем документ	
				Когда открылось окно "Document register records: Отражение фактических данных * from *"
				И Я закрываю окно "Document register records: Отражение фактических данных * from *"
				Тогда открылось окно "Reflection of actual data * from *"
				И я нажимаю на кнопку с именем 'FormPostAndClose'
				И я жду закрытия окна "Reflection of actual data * from *" в течение 20 секунд

		* Создаем новый документ №2
			Когда открылось окно "Отражения фактических данных"
			И я выбираю пункт контекстного меню с именем 'ListContextMenuCopy' на элементе формы с именем 'List'
			Тогда открылось окно "Отражение фактических данных (create)"
			И в поле с именем 'Date' я ввожу текст '01.02.2024  12:00:00 AM'
			И из выпадающего списка с именем 'Counterparty' я выбираю по строке "LLC \"Io\""				

			* Бюджет движения денежных средств
				И я перехожу к закладке с именем 'GroupCFB'
				И из выпадающего списка с именем 'PeriodCFB' я выбираю по строке '1 неделя. February 2024 G.'
				И в таблице 'TabCashFlowsBudget' я выбираю текущую строку
				Если '$$IsERPCPM$$' Тогда
					И в таблице 'TabCashFlowsBudget' я нажимаю кнопку выбора у реквизита с именем 'TabCashFlowsBudgetCounterpartyContract'
					Тогда открылось окно "Select data type"
					И в таблице '' я перехожу к строке:
						| ''                       |
						| 'Contract From1 контрагентом' |
					И в таблице '' я выбираю текущую строку
					Тогда открылось окно "Contracts From контрагентами"
					И Я закрываю окно "Contracts From контрагентами"
				И в таблице 'TabCashFlowsBudget' из выпадающего списка с именем 'TabCashFlowsBudgetCounterpartyContract' я выбираю по строке 'Ио-002'
				И в таблице 'TabCashFlowsBudget' я активизирую поле с именем 'TabCashFlowsBudgetSum'
				И в таблице 'TabCashFlowsBudget' в поле с именем 'TabCashFlowsBudgetSum' я ввожу текст '5,200,000.00'
				И в таблице 'TabCashFlowsBudget' я завершаю редактирование строки
				И в таблице 'TabCashFlowsBudget' я перехожу к следующей строке
				Если '$$IsERPCPM$$' Тогда
					И в таблице 'TabCashFlowsBudget' я нажимаю кнопку выбора у реквизита с именем 'TabCashFlowsBudgetCounterpartyContract'
					Тогда открылось окно "Select data type"
					И в таблице '' я перехожу к строке:
						| ''                       |
						| 'Contract From1 контрагентом' |
					И в таблице '' я выбираю текущую строку
					Тогда открылось окно "Contracts From контрагентами"
					И Я закрываю окно "Contracts From контрагентами"
				И в таблице 'TabCashFlowsBudget' из выпадающего списка с именем 'TabCashFlowsBudgetCounterpartyContract' я выбираю по строке "Io-002"
				И в таблице 'TabCashFlowsBudget' я активизирую поле с именем 'TabCashFlowsBudgetSum'
				И в таблице 'TabCashFlowsBudget' в поле с именем 'TabCashFlowsBudgetSum' я ввожу текст '7,350,000.00'
				И в таблице 'TabCashFlowsBudget' я завершаю редактирование строки
				И в таблице 'TabCashFlowsBudget' я нажимаю на кнопку с именем 'TabCashFlowsBudgetAdd'
				Если '$$IsERPCPM$$' Тогда
					И в таблице 'TabCashFlowsBudget' я нажимаю кнопку выбора у реквизита с именем 'TabCashFlowsBudgetCounterpartyContract'
					Тогда открылось окно "Select data type"
					И в таблице '' я перехожу к строке:
						| ''                       |
						| 'Contract From1 контрагентом' |
					И в таблице '' я выбираю текущую строку
					Тогда открылось окно "Contracts From контрагентами"
					И Я закрываю окно "Contracts From контрагентами"
					И в таблице 'TabCashFlowsBudget' я нажимаю кнопку выбора у реквизита с именем 'TabCashFlowsBudgetCashFlowItem'
					Если открылось окно "Select data type" Тогда
						И в таблице '' я перехожу к строке:
						| ''                                 |
						| "Cash flow item" |
						И в таблице '' я выбираю текущую строку
					Тогда открылось окно "Cash flow items"
					И Я закрываю окно "Cash flow items"
				И в таблице 'TabCashFlowsBudget' из выпадающего списка с именем 'TabCashFlowsBudgetCounterpartyContract' я выбираю по строке "Io-002"
				И в таблице 'TabCashFlowsBudget' из выпадающего списка с именем 'TabCashFlowsBudgetCashFlowItem' я выбираю по строке "1Software upgrade"
				И в таблице 'TabCashFlowsBudget' из выпадающего списка с именем 'TabCashFlowsBudgetCenterForFinancialResponsibility' я выбираю по строке "Mercury LLC"
				И в таблице 'TabCashFlowsBudget' из выпадающего списка с именем 'TabCashFlowsBudgetProject' я выбираю по строке "VA - Main project"
				И в таблице 'TabCashFlowsBudget' в поле с именем 'TabCashFlowsBudgetSum' я ввожу текст '3,450,000.00'
				И в таблице 'TabCashFlowsBudget' я завершаю редактирование строки
				
			* Запишем документ
				И я нажимаю на кнопку с именем 'FormPostAndClose'
				И я жду закрытия окна "Отражение фактических данных (create) *" в течение 20 секунд						
