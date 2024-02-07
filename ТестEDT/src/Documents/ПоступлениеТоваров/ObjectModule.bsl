#Если Сервер Или ТолстыйКлиентОбычноеПриложение Или ВнешнееСоединение Тогда

#Область ОбработчикиСобытий
Процедура ОбработкаПроведения(Отказ, Режим)
	//{{__КОНСТРУКТОР_ДВИЖЕНИЙ_РЕГИСТРОВ
	// Данный фрагмент построен конструктором.
	// При повторном использовании конструктора, внесенные вручную изменения будут утеряны!!!

	// регистр ОстаткиНоменклатуры Приход
	Движения.ОстаткиНоменклатуры.Записывать = Истина;
	Для Каждого ТекСтрокаТовары Из Товары Цикл
		Движение = Движения.ОстаткиНоменклатуры.Добавить();
		Движение.ВидДвижения = ВидДвиженияНакопления.Приход;
		Движение.Период = Дата;
		Движение.Организация = Организация;
		Движение.Склад = Склад;
		Движение.Номенклатура = ТекСтрокаТовары.Номенклатура;
		Движение.Характеристика = ТекСтрокаТовары.Характеристика;
		Движение.Серия = ТекСтрокаТовары.Серия;
		Движение.Количество = ТекСтрокаТовары.Количество;
		Движение.Сумма = ТекСтрокаТовары.Сумма;
	КонецЦикла;

	// регистр ОстаткиВзаиморасчетов Приход
	Движения.ОстаткиВзаиморасчетов.Записывать = Истина;
	Движение = Движения.ОстаткиВзаиморасчетов.Добавить();
	Движение.ВидДвижения = ВидДвиженияНакопления.Приход;
	Движение.Период = Дата;
	Движение.Контрагент = Контрагент;
	Движение.Договор = Договор;
	Движение.Сумма = СуммаДокумента;

	Движения.Основной.Записывать = Истина;
	Для Каждого ТекСтрокаТовары Из Товары Цикл
		Движение = Движения.Основной.Добавить();
		Движение.СчетДт = ПланыСчетов.Управленческий.Товары;
		Движение.СчетКт = ПланыСчетов.Управленческий.Поставщики;
		Движение.Период = Дата;
		Движение.Организация = Организация;
		Движение.Сумма = ТекСтрокаТовары.Сумма;
		Движение.СубконтоДт[ПланыВидовХарактеристик.Субконто.МестаХранения] = Склад;
		Движение.СубконтоДт[ПланыВидовХарактеристик.Субконто.Номенклатура] = ТекСтрокаТовары.Номенклатура;
		Движение.СубконтоКт[ПланыВидовХарактеристик.Субконто.Контрагент] = Контрагент;
	КонецЦикла;
	
	//}}__КОНСТРУКТОР_ДВИЖЕНИЙ_РЕГИСТРОВ
КонецПроцедуры


Процедура ПередЗаписью(Отказ, РежимЗаписи, РежимПроведения)
	Если ОбменДанными.Загрузка Тогда
		Возврат;
	КонецЕсли;
	СуммаДокумента=Товары.Итог("Сумма");
КонецПроцедуры
#КонецОбласти

#КонецЕсли