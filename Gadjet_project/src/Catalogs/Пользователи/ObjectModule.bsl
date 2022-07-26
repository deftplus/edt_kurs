// Заполнить набор прав.
// 
// Параметры:
//  ПользовательИБ - ПользовательИнформационнойБазы
//@skip-check module-accessibility-at-client
Процедура ЗаполнитьНаборПрав(ПользовательИБ) Экспорт
	РолиИБ = Метаданные.Роли;
	ЭтотОбъект.НаборПрав.Очистить();
	Для Каждого Роль Из РолиИБ Цикл
		СтрокаНабораПрав = ЭтотОбъект.НаборПрав.Добавить();
		СтрокаНабораПрав.ИмяРоли			= Роль.Имя;
		СтрокаНабораПрав.ПредставлениеРоли	= Роль.Синоним;
		СтрокаНабораПрав.Активно			= ПользовательИБ.Роли.Содержит(Роль);
	КонецЦикла;
КонецПроцедуры

//@skip-check module-accessibility-at-client
Процедура ПриЗаписи(Отказ)
	
	Если ОбменДанными.Загрузка Тогда
		Возврат;
	КонецЕсли;
	
	ПользовательИБ = ПользователиИнформационнойБазы.НайтиПоИмени(ЭтотОбъект.Наименование);
	Если ПользовательИБ = Неопределено Тогда
		ПользовательИБ				= ПользователиИнформационнойБазы.СоздатьПользователя();
		ПользовательИБ.Имя			= ЭтотОбъект.Наименование;
		ПользовательИБ.ПолноеИмя	= ЭтотОбъект.ПолноеИмя;
	КонецЕсли;
	
	ПользовательИБ.Роли.Очистить();
	НаборПравПользвателя = ЭтотОбъект.НаборПрав.НайтиСтроки( Новый Структура("Активно", Истина));
	
	Для Каждого СтрокаРолиПользователя Из НаборПравПользвателя Цикл
		ТекущаяРоль = Метаданные.Роли.Найти(СтрокаРолиПользователя.ИмяРоли);
		ПользовательИБ.Роли.Добавить(ТекущаяРоль);
	КонецЦикла;
	ПользовательИБ.Записать();
КонецПроцедуры
