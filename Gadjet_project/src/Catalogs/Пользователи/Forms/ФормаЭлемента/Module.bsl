
// При создании на сервере.
// 
// Параметры:
//  Отказ - Булево - Отказ
//  СтандартнаяОбработка - Булево - Стандартная обработка
&НаСервере
Процедура ПриСозданииНаСервере(Отказ, СтандартнаяОбработка)
	ПользовательИБ = ПользователиИнформационнойБазы.НайтиПоИмени(Объект.Наименование);
	ПользовательОбъект = РеквизитФормыВЗначение("Объект");
	ПользовательОбъект.ЗаполнитьНаборПрав(ПользовательИБ);
	ЗначениеВРеквизитФормы(ПользовательОбъект, "Объект");
КонецПроцедуры
