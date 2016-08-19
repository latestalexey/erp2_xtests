﻿Перем КонтекстЯдра;
Перем Ожидаем;
Перем Утверждения;
Перем ГенераторТестовыхДанных;
Перем ЗапросыИзБД;
Перем УтвержденияПроверкаТаблиц;

Перем СтруктураДанных;

#Область ЮнитТестирование

Процедура Инициализация(КонтекстЯдраПараметр) Экспорт
	
	КонтекстЯдра = КонтекстЯдраПараметр;
	Ожидаем = КонтекстЯдра.Плагин("УтвержденияBDD");
	Утверждения = КонтекстЯдра.Плагин("БазовыеУтверждения");
	ГенераторТестовыхДанных = КонтекстЯдра.Плагин("СериализаторMXL");
	ЗапросыИзБД = КонтекстЯдра.Плагин("ЗапросыИзБД");
	УтвержденияПроверкаТаблиц = КонтекстЯдра.Плагин("УтвержденияПроверкаТаблиц");
	
КонецПроцедуры

Процедура ЗаполнитьНаборТестов(НаборТестов) Экспорт
	НаборТестов.Добавить("СборкаТоваров");
КонецПроцедуры

Процедура ПередЗапускомТеста() Экспорт
	
КонецПроцедуры

Процедура ПослеЗапускаТеста() Экспорт
	
КонецПроцедуры

Функция РазрешенСлучайныйПорядокВыполненияТестов() Экспорт
	
	Возврат Ложь;
	
КонецФункции

#КонецОбласти

Процедура СборкаТоваров() Экспорт
	
	Структура = ГенераторТестовыхДанных.СоздатьДанныеПоМакетам(ЭтотОбъект, "Данные");
	
	МассивДокументов = Новый Массив;
	МассивДокументов.Добавить(Структура.СборкаТоваров1);
	
	Для каждого ДокументСсылка из МассивДокументов Цикл
		ДокументОбъект = ДокументСсылка.ПолучитьОбъект();
		ДокументОбъект.Записать(РежимЗаписиДокумента.Проведение);
	КонецЦикла;	
	
	Для каждого ДокументСсылка из МассивДокументов Цикл
		
		РеквизитыДокумента = ОбщегоНазначения.ЗначенияРеквизитовОбъекта(ДокументСсылка, "Дата, Организация");
		СтруктураРеквизиты = Новый Структура("Ссылка, Дата, Организация", ДокументСсылка, РеквизитыДокумента.Дата, РеквизитыДокумента.Организация);
		РеглУчетПроведениеСервер.ОтразитьДокумент(СтруктураРеквизиты, Истина);
		
	КонецЦикла;	
	
КонецПроцедуры

