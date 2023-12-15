#language: ru
@tree
@IgnoreOnCIMainBuild

Функционал: 17. Тестирование Аналитических отчетов и панелей

	Как Администратор я хочу
	протестировать аналитические отчеты и аналитические панели 
	чтобы исключить ошибки при разработке   

Контекст:
	
	И я закрыл все окна клиентского приложения

Сценарий: 17.00 Определение типа приложения

	И я закрываю TestClient "CPM - Budget"
	И я подключаю TestClient "CPM - Budget" логин "Administrator" пароль ''
	Пусть Инициализация переменных

Сценарий: 17.01 Создание вида отчета

	* Создаем вид отчета
		И Я создаю вид отчета с именем "VA - Analytical reports" и родителем "VA - Report group"

	* Настраиваем структуру
		И я открываю контруктор отчета с именем "VA - Analytical reports"
		И Я в конструкторе отчета добавляю строки
			| 'Description' |
			| "Line 1"     |
			| "Line 2"     |
			| "Line 3"     |
		И Я в конструкторе отчета добавляю колонки
			| 'Description' |
			| "Count"   |
			| "Price"         |
			| "Amount"        |

	* Настраиваем формулы
		И Я в конструкторе отчета для ячейки 'R2C4' задаю формулу произведение ячеек 'R2C2' 'R2C3'
		И Я в конструкторе отчета для ячейки 'R3C4' задаю формулу произведение ячеек 'R3C2' 'R3C3'
		И Я в конструкторе отчета для ячейки 'R4C4' задаю формулу произведение ячеек 'R4C2' 'R4C3'

	* Закрываем конструктор
		Когда открылось окно "Report wizard"
		И Я закрываю окно "Report wizard"
		
	* Создаем бланк
		И Я Для вида отчета "VA - Analytical reports" создаю бланк по умолчанию

Сценарий: 17.02 Создание аналитических отчетов

	И Я создаю группу аналитических отчетов с кодом '100000000000' именем "VA - Analytical reports" родителем ''

	И Я создаю аналитический отчет с кодом '100000000001' вид отчета "VA - Analytical reports" период "January 2024" организация "Mercury LLC" родитель "VA - Analytical reports"
	И Я создаю аналитический отчет с кодом '100000000002' вид отчета"VA - Analytical reports" период "January 2024" организация "System LLC" родитель "VA - Analytical reports"

Сценарий: 17.03 Создание аналитической панели

	* Открытие формы
		И В командном интерфейсе я выбираю "Budgeting, reporting, and analysis" "Analytical dashboards"

	* Удаляем элемент
		И Я в списке "Analytical dashboards" по полю "Analytical dashboard" ищу элемент "VA - Analytical reports" "At beginning of line" 
		И Пока в таблице 'List' количество строк 'больше' 0 Тогда
			* Ставим пометку на удаление	
				И Я удаляю текущую строку в списке 'List'
			* Переименовываем
				И Я запоминаю значение выражения 'StrReplace(New UUID, "-", "")' в переменную 'UID'
				И в таблице 'List' я выбираю текущую строку
				Тогда открылось окно "* (Analytical dashboard)"
				И в поле с именем 'Description' я ввожу значение переменной 'UID'
				И я нажимаю на кнопку с именем 'FormWriteAndClose'
				И я жду закрытия окна "* (Analytical dashboard) *" в течение 20 секунд	
		И я выбираю пункт контекстного меню с именем 'ListContextMenuCancelSearch' на элементе формы с именем "List"

	* Создание элемента	
 		Тогда открылось окно "Analytical dashboards"
 		И я нажимаю на кнопку с именем 'FormCreate'
 		Тогда открылось окно "Analytical dashboard (create)"
 		И в поле с именем 'Description' я ввожу текст "VA - Analytical reports"
 		И я нажимаю на кнопку с именем 'FormWrite'
 	
	 * Настройка панели
		Тогда открылось окно "VA - Analytical reports (Analytical dashboard)"
		И в таблице 'PanelContent' я нажимаю на кнопку с именем 'PanelContentCreatePage'
		И в таблице 'PanelContent' я активизирую поле с именем 'PanelContentArea'
		И в таблице 'PanelContent' я выбираю текущую строку
		И в таблице 'PanelContent' в поле с именем 'PanelContentArea' я ввожу текст 'Page 1'
		И в таблице 'PanelContent' я завершаю редактирование строки
		И я выбираю пункт контекстного меню с именем 'PanelContentContextMenuCreateFolder' на элементе формы с именем 'PanelContent'
		И в таблице 'PanelContent' я разворачиваю текущую строку
		И в таблице 'PanelContent' я перехожу к строке:
			| "Use" | "Set up report" | "Area"        | "Display description" |
			| "Yes"            | "(By default)"   | "(New group)" | "Yes"                      |
		И в таблице 'PanelContent' я выбираю текущую строку
		И в таблице 'PanelContent' в поле с именем 'PanelContentArea' я ввожу текст "Group 1"
		И в таблице 'PanelContent' я завершаю редактирование строки
		И я нажимаю на кнопку с именем 'FormWrite'

		Когда открылось окно "VA - Analytical reports (Analytical dashboard)"
		И в таблице 'PanelContent' я нажимаю на кнопку с именем 'PanelContentAdd'
		И в меню формы я выбираю "Standard area"
		И Я в списке "Analytical reports" по полю "Description" ищу и выбираю элемент "VA - Analytical reports (Mercury LLC)" "Exact match"

	 	Тогда открылось окно 'DimenKind - Аналитические отчеты (Analytical dashboard)'
 		И в таблице "CompositionПанели" я нажимаю на кнопку с именем 'PanelContentAdd'		 
 		И в меню формы я выбираю 'Ordinary область'
		И Я в списке "Analytical reports" по полю "Description" ищу и выбираю элемент "VA - Analytical reports (System LLC)" "Exact match"
 		
 	Тогда открылось окно "VA - Analytical reports (Analytical dashboard)"
 	И я нажимаю на кнопку с именем 'FormWriteAndClose'

Сценарий: 17.04 Настройка прав для пользователя "Budgeting1"

	И Я добавляю право "Read, write" для вида отчета "VA - Analytical reports" пользователя "Budgeting1" по всем организациям
	И я закрываю TestClient "CPM - Budget"
	И я подключаю TestClient "CPM - Budget" логин "Budgeting1" пароль ''

Сценарий: 17.05 Создание экземпляров отчетов

	И Я создаю экземпляр отчета для вида отчета "VA - Analytical reports" сценарий "VA - Main scenario" период '1/1/2024' '3/31/2024' периодичность "Month" организация "Mercury LLC" проект '' аналитики '' '' '' '' '' ''

	И Я ввожу значение '3.00000' в ячейку 'R6C2'
	И Я ввожу значение '4.00000' в ячейку 'R7C2'
	И Я ввожу значение '5.00000' в ячейку 'R8C2'
	И Я ввожу значение '100.00000' в ячейку 'R6C3'
	И Я ввожу значение '200.00000' в ячейку 'R7C3'
	И Я ввожу значение '300.00000' в ячейку 'R8C3'

	Когда открылось окно '$WindowTitle$'
	И я нажимаю на кнопку с именем 'WriteAndClose'
	И я жду закрытия окна '$WindowTitle$' в течение 20 секунд

	И Я создаю экземпляр отчета для вида отчета "VA - Analytical reports" сценарий "VA - Main scenario" период '1/1/2024' '3/31/2024' периодичность "Month" организация "System LLC" проект '' аналитики '' '' '' '' '' ''
	И я нажимаю на кнопку с именем 'FormFillInUsingAnotherApproach'
	Тогда открылось окно "Select method to calculate indicators"
	И из выпадающего списка с именем 'ReportGenerationMethod' я выбираю точное значение "Consolidate perimeter (IFRS)"
	И я нажимаю на кнопку с именем 'FormSelect'

	Когда открылось окно '$WindowTitle$'
	И я нажимаю на кнопку с именем 'WriteAndClose'
	И я жду закрытия окна '$WindowTitle$' в течение 20 секунд	

Сценарий: 17.06 Просмотр аналитических отчетов

	И В командном интерфейсе я выбираю "Budgeting, reporting, and analysis" "Analytical reports"
	И Я в списке "Analytical reports" по полю "Description" ищу элемент "VA - Analytical reports (Mercury LLC)" "Exact match"
	И я нажимаю на кнопку с именем 'FormOpenReport'
	И табличный документ 'Result' равен макету "Templates\18\VA_АналитическийReport.mxl" по шаблону
	И Я закрываю окно "VA - Analytical reports (Mercury LLC) (Analytical report)"
	
	И Я в списке "Analytical reports" по полю "Description" ищу элемент "VA - Analytical reports (System LLC)" "Exact match"
	И я нажимаю на кнопку с именем 'FormOpenReport'
	И табличный документ 'Result' равен макету "Templates\18\VA_АналитическийReport.mxl" по шаблону
	И Я закрываю окно "VA - Analytical reports (System LLC) (Analytical report)"

	Тогда открылось окно "Analytical reports"
	И Я закрываю окно "Analytical reports"		
		
Сценарий: 17.07 Просмотр аналитических панелей		

	И В командном интерфейсе я выбираю "Budgeting, reporting, and analysis" "Analytical dashboards"
	И Я в списке "Analytical dashboards" по полю "Analytical dashboard" ищу элемент "VA - Analytical reports" "At beginning of line" 
	И я нажимаю на кнопку с именем 'FormShowPanel'

	И табличный документ 'Code_100000000001_1_Window' равен макету "Templates\18\VA_АналитическийReport.mxl" по шаблону
	И табличный документ 'Code_100000000002_2_Window' равен макету "Templates\18\VA_АналитическийReport.mxl" по шаблону
	
 	Тогда открылось окно "VA - Analytical reports (Analytical dashboard)"
 	И Я закрываю окно "VA - Analytical reports (Analytical dashboard)"
 	Тогда открылось окно "Analytical dashboards"
 	И Я закрываю окно "Analytical dashboards"	
	
