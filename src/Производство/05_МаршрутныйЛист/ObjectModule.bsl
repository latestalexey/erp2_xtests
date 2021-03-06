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
	
	СтруктураДанных = ПолучитьСтруктуруДанных();
	
КонецПроцедуры

Процедура ЗаполнитьНаборТестов(НаборТестов) Экспорт
	НаборТестов.Добавить("МаршрутныйЛист");
КонецПроцедуры

Процедура ПередЗапускомТеста() Экспорт
	
КонецПроцедуры

Процедура ПослеЗапускаТеста() Экспорт
	
КонецПроцедуры

Функция РазрешенСлучайныйПорядокВыполненияТестов() Экспорт
	
	Возврат Ложь;
	
КонецФункции

#КонецОбласти

Процедура МаршрутныйЛист() Экспорт
	
	Результат = ОперативныйУчетПроизводстваВызовСервера.СформироватьМаршрутныеЛистыПоЗаказам(СтруктураДанных.МассивЗаказов);
	Если НЕ Результат.Выполнено Тогда
	КонецЕсли;	
	
КонецПроцедуры

Функция ПолучитьСтруктуруДанных()
	
	Макет = ПолучитьМакет("ЗаказНаПроизводство");
	Структура = ГенераторТестовыхДанных.СоздатьДанныеПоТабличномуДокументу(Макет);
	
	МассивЗаказов = Новый Массив;
	МассивЗаказов.Добавить(Структура.ЗаказНаПроизводство1);
	
	Структура.Вставить("МассивЗаказов", МассивЗаказов);
	
	Возврат Структура;
	
КонецФункции




