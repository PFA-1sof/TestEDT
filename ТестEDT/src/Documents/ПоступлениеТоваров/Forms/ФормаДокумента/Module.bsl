
#Область ОбработчикиСобытийЭлементовТаблицыФормыТовары

&НаКлиенте
Процедура ТоварыКоличествоПриИзменении(Элемент)
	Стр=Элементы.Товары.ТекущиеДанные;
	Стр.Сумма=Стр.Количество*Стр.Цена;
	ФункцияТест();
КонецПроцедуры

#КонецОбласти

#Область СлужебныеПроцедурыИФункции
&НаСервере
Функция ФункцияТест()
	а = 1;
	б = 2;
	с = 3;
	д = а + б + с*2;
	Возврат д;
КонецФункции
#КонецОбласти