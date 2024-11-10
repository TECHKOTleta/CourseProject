use airport;
select * from races limit 2500;
#INSERT INTO `races` (`TypeRace`, `Price`, `FROM_place`, `TO_place`, `Time`, `Date`, `Duration`, `State`, `PLANES_ID_PLANE`) VALUE ('Пассажирский', 70000, 'SVO', 'JFK', '12:40', '2024-12-08', 120, 'Разбился ;)', 2);

INSERT INTO zones() VALUES
("Россия", 1),
("США", 2),
("Китай", 3),
("Индия", 3),
("Таиланд", 3),
("Египет", 4),
("Турция", 4),
("ОАЭ", 4),
("Франция", 5),
("Германия", 5),
("Италия", 5);


INSERT INTO places() VALUES       #--------------------------ГЛАВНЫЕ------------------
('SVO', 'Шереметьево', 'Москва', 'Россия', 1, 1),
('DME', 'Домодедово', 'Москва', 'Россия', 1, 1),
('VKO', 'Внуково', 'Москва', 'Россия', 1, 1),
('LED', 'Пулково', 'Санкт-Петербург', 'Россия', 1, 1),
('JFK', 'Международный аэропорт имени Джона Кеннеди', 'Нью-Йорк', 'США', 1, 1),
('SFO', 'Международный аэропорт Сан-Франциско', 'Сан-Франциско', 'США', 1, 1),
('LAX', 'Международный аэропорт Лос-Анджелес', 'Лос-Анджелес', 'США', 1, 1),
('ORD', 'Международный аэропорт О-Хара', 'Чикаго', 'США', 1, 1),
('PEK', 'Международный аэропорт Пекин', 'Пекин', 'Китай', 1, 1),
('PVG', 'Международный аэропорт Шанхай Пудун', 'Шанхай', 'Китай', 1, 1),
('IST', 'Международный аэропорт Стамбул', 'Стамбул', 'Турция', 1, 1),
('ESB', 'Международный аэропорт Анкара Эсенбога', 'Анкара', 'Турция', 1, 1),
('CAI', 'Международный аэропорт Каир', 'Каир', 'Египет', 1, 1),
('HRG', 'Международный аэропорт Хургада', 'Хургада', 'Египет', 1, 1),
('SSH', 'Международный аэропорт Шарм-эль-Шейх', 'Шарм-эль-Шейх', 'Египет', 1, 1),
('LXR', 'Международный аэропорт Луксор', 'Луксор', 'Египет', 1, 1),
('BKK', 'Международный аэропорт Суварнабхуми', 'Бангкок', 'Таиланд', 1, 1),
('DXB', 'Международный аэропорт Дубай', 'Дубай', 'ОАЭ', 1, 1),
('AUH', 'Международный аэропорт Абу-Даби', 'Абу-Даби', 'ОАЭ', 1, 1),
('SHJ', 'Международный аэропорт Шарджа', 'Шарджа', 'ОАЭ', 1, 1),
('DEL', 'Международный аэропорт Индиры Ганди', 'Дели', 'Индия', 1, 1),
('BOM', 'Международный аэропорт Чхатрапати Шиваджи', 'Мумбаи', 'Индия', 1, 1),
('COK', 'Международный аэропорт Кочи', 'Кочи', 'Индия', 1, 1),
('CDG', 'Международный аэропорт Шарля де Голля', 'Париж', 'Франция', 1, 1),
('ORY', 'Международный аэропорт Орли', 'Париж', 'Франция', 1, 1),
('MRS', 'Международный аэропорт Марсель-Прованс', 'Марсель', 'Франция', 1, 1),
('FRA', 'Международный аэропорт Франкфурта', 'Франкфурт', 'Германия', 1, 1),
('MUC', 'Международный аэропорт Мюнхена', 'Мюнхен', 'Германия', 1, 1),
('DUS', 'Международынй аэропорт Дюссельдорфа', 'Дюссельдорф', 'Германия', 1, 1),
('HAM', 'Международный аэропорт Гамбурга', 'Гамбург', 'Германия', 1, 1),
('FCO', 'Международный аэропорт Фьюмичино', 'Рим', 'Италия', 1, 1),
('MXP', 'Международный аэропорт Мальпенса', 'Милан', 'Италия', 1, 1),
('VCE', 'Международный аэропорт Венеции', 'Венеция', 'Италия', 1, 1);


INSERT INTO places (`ID_place`, `Name`, `City`, `Country`, `International`) VALUES           #-------------------РОССИЯ-----------------------------
('KZN', 'Казань', 'Казань', 'Россия', 1),
('SVX', 'Кольцово', 'Екатеринбург', 'Россия', 1),
('ROV', 'Платов', 'Ростов-на-Дону', 'Россия', 1),
('VVO', 'Угольный', 'Владивосток', 'Россия', 1),
('TJL', 'Тюмень', 'Тюмень', 'Россия', 1),
('AER', 'Сочи', 'Сочи', 'Россия', 1),
('GDX', 'Пулково', 'Горно-Алтайск', 'Россия', 1),
('UUS', 'Новый Уренгой', 'Новый Уренгой', 'Россия', 1),
('KJA', 'Емельяново', 'Красноярск', 'Россия', 1),
('NCG', 'Нижний Новгород', 'Нижний Новгород', 'Россия', 1),
('TAY', 'Тамбов', 'Тамбов', 'Россия', 1),
('YKS', 'Якутск', 'Якутск', 'Россия', 1),
('DZR', 'Дзержинск', 'Дзержинск', 'Россия', 1),
('BQT', 'Братск', 'Братск', 'Россия', 1),
('KHE', 'Хабаровск', 'Хабаровск', 'Россия', 1),
('GMP', 'Калуга', 'Калуга', 'Россия', 1),
('VOG', 'Волгоград', 'Волгоград', 'Россия', 1),
('KRR', 'Краснодар', 'Краснодар', 'Россия', 1),
('UFA', 'Уфа', 'Уфа', 'Россия', 1),
('RMZ', 'Рязань', 'Рязань', 'Россия', 1),
('ARJ', 'Архангельск', 'Архангельск', 'Россия', 1),
('KLF', 'Калуга', 'Калуга', 'Россия', 1),
('MQK', 'Магнитогорск', 'Магнитогорск', 'Россия', 1),
('OGZ', 'Геленджик', 'Геленджик', 'Россия', 1),
('DGA', 'Дагестан', 'Махачкала', 'Россия', 1),
('OVB', 'Толмачёво', 'Новосибирск', 'Россия', 1),
('KGO', 'Калининград', 'Калининград', 'Россия', 1),
('TYA', 'Тюмень', 'Тюмень', 'Россия', 1),
('EGO', 'Егорьевск', 'Егорьевск', 'Россия', 1),
('PES', 'Пенза', 'Пенза', 'Россия', 1),
('TJM', 'Тюмень', 'Тюмень', 'Россия', 1),
('SYC', 'Сургут', 'Сургут', 'Россия', 1),
('TGF', 'Томск', 'Томск', 'Россия', 1),
('KUF', 'Курмоч', 'Самара', 'Россия', 1),
('LNZ', 'Липецк', 'Липецк', 'Россия', 1),
('SIP', 'Симферополь', 'Симферополь', 'Россия', 1),
('ULY', 'Ульяновск', 'Ульяновск', 'Россия', 1),
('IKT', 'Иркутск', 'Иркутск', 'Россия', 1),
('MMK', 'Мурманск', 'Мурманск', 'Россия', 1);

INSERT INTO places (`ID_place`, `Name`, `City`, `Country`, `International`) VALUES  #----------------------Соединённые Штаты Америки-----------------------------
('ATL', 'Аэропорт Хартсфилд-Джексон Атланта', 'Атланта', 'США', 0),
('DFW', 'Международный аэропорт Даллас/Форт-Уэрт', 'Даллас', 'США', 1),
('DEN', 'Международный аэропорт Денвер', 'Денвер', 'США', 1),
('SEA', 'Международный аэропорт Сиэтл-Такома', 'Сиэтл', 'США', 1),
('LAS', 'Международный аэропорт Маккаран', 'Лас-Вегас', 'США', 1),
('PHX', 'Международный аэропорт Финикс Скай Харбор', 'Финикс', 'США', 1),
('IAH', 'Международный аэропорт Джорджа Буша', 'Хьюстон', 'США', 1),
('MIA', 'Международный аэропорт Майами', 'Майами', 'США', 1),
('CLT', 'Международный аэропорт Шарлотт Дуглас', 'Шарлотт', 'США', 1),
('MCO', 'Международный аэропорт Орландо', 'Орландо', 'США', 1),
('BOS', 'Международный аэропорт Логан', 'Бостон', 'США', 1),
('MSP', 'Международный аэропорт Миннеаполис-Сент-Пол', 'Миннеаполис', 'США', 1),
('TPA', 'Международный аэропорт Тампа', 'Тампа', 'США', 1),
('PDX', 'Международный аэропорт Портленд', 'Портленд', 'США', 1),
('SAN', 'Международный аэропорт Сан-Диего', 'Сан-Диего', 'США', 1),
('BWI', 'Международный аэропорт Балтимор/Вашингтон', 'Балтимор', 'США', 1),
('SLC', 'Международный аэропорт Солт-Лейк-Сити', 'Солт-Лейк-Сити', 'США', 1),
('FLL', 'Международный аэропорт Форт-Лодердейл', 'Форт-Лодердейл', 'США', 1),
('DTW', 'Международный аэропорт Детройт', 'Детройт', 'США', 1),
('PHL', 'Международный аэропорт Филадельфия', 'Филадельфия', 'США', 1),
('CVG', 'Международный аэропорт Цинциннати/Северный Кентукки', 'Цинциннати', 'США', 1),
('HNL', 'Международный аэропорт Дэниела К. Иноуэ', 'Гонолулу', 'США', 1);

INSERT INTO places (`ID_place`, `Name`, `City`, `Country`, `International`) VALUES  #-------------------КИТАЙ-----------------------------
('CAN', 'Международный аэропорт Гуанчжоу Байюнь', 'Гуанчжоу', 'Китай', 1),
('CTU', 'Международный аэропорт Сычуань Чэнду', 'Чэнду', 'Китай', 1),
('SHA', 'Международный аэропорт Шанхай Хунцяо', 'Шанхай', 'Китай', 1),
('XMN', 'Международный аэропорт Сямэнь Гаоци', 'Сямэнь', 'Китай', 1),
('HGH', 'Международный аэропорт Ханчжоу Санцзин', 'Ханчжоу', 'Китай', 1),
('KMG', 'Международный аэропорт Куньмин Чаншуй', 'Куньмин', 'Китай', 1),
('WUH', 'Международный аэропорт Ухань Тяньхэ', 'Ухань', 'Китай', 1),
('SZX', 'Международный аэропорт Шэньчжэнь Баоань', 'Шэньчжэнь', 'Китай', 1),
('NKG', 'Международный аэропорт Нанкин Луку', 'Нанкин', 'Китай', 1),
('HFE', 'Международный аэропорт Хэфэй Лукоу', 'Хэфэй', 'Китай', 1),
('TAO', 'Международный аэропорт Циндао Лиюн', 'Циндао', 'Китай', 1),
('CSX', 'Международный аэропорт Чанша Хуанхуай', 'Чанша', 'Китай', 1),
('CKG', 'Международный аэропорт Чунцин Джиацзин', 'Чунцин', 'Китай', 1),
('SHE', 'Международный аэропорт Шэньян Тяньхэ', 'Шэньян', 'Китай', 1),
('XIY', 'Международный аэропорт Сиань Сяньян', 'Сиань', 'Китай', 1),
('NGB', 'Международный аэропорт Нинбо Лунтянь', 'Нинбо', 'Китай', 1),
('YTY', 'Международный аэропорт Юйлинь Яньцзин', 'Юйлинь', 'Китай', 1),
('DLC', 'Международный аэропорт Далянь Жицзин', 'Далянь', 'Китай', 1),
('ZYI', 'Международный аэропорт Чжэцзянь Иву', 'Иву', 'Китай', 1),
('TYN', 'Международный аэропорт Тайюань Восань', 'Тайюань', 'Китай', 1),
('HRB', 'Международный аэропорт Харбин Таорун', 'Харбин', 'Китай', 1),
('SJW', 'Международный аэропорт Шицзячжуан Джаодун', 'Шицзячжуан', 'Китай', 1),
('WUS', 'Международный аэропорт Уси Шуошан', 'Уси', 'Китай', 1),
('LHE', 'Международный аэропорт Линьи', 'Линьи', 'Китай', 1);

INSERT INTO places (`ID_place`, `Name`, `City`, `Country`, `International`) VALUES  #-------------------ТУРЦИЯ-----------------------------
('ADB', 'Международный аэропорт Измир Аднан Мендерес', 'Измир', 'Турция', 1),
('DLM', 'Международный аэропорт Мугла Даламан', 'Мугла', 'Турция', 1),
('SAW', 'Международный аэропорт Стамбул Сабиха Гекчен', 'Стамбул', 'Турция', 1);

INSERT INTO places (`ID_place`, `Name`, `City`, `Country`, `International`) VALUES  #-------------------ЕГИПЕТ-----------------------------
('ALY', 'Международный аэропорт Асуан', 'Асуан', 'Египет', 1),
('DMS', 'Международный аэропорт Думьят', 'Думьят', 'Египет', 1),
('SPX', 'Сфинкс', 'Гиза', 'Египет', 1),
('SUX', 'Международный аэропорт Сувра', 'Сувра', 'Египет', 1),
('EDD', 'Международный аэропорт Эль-Дахар', 'Эль-Дахар', 'Египет', 1),
('RMF', 'Международный аэропорт Марса-Алам', 'Марса-Алам', 'Египет', 1);

INSERT INTO places (`ID_place`, `Name`, `City`, `Country`, `International`) VALUES  #-------------------ТАИЛАНД-----------------------------
('DMK', 'Международный аэропорт Донмыанг', 'Бангкок', 'Таиланд', 1),
('HKT', 'Международный аэропорт Пхукет', 'Пхукет', 'Таиланд', 1),
('CNX', 'Международный аэропорт Чиангмай', 'Чиангмай', 'Таиланд', 1),
('KBV', 'Международный аэропорт Краби', 'Краби', 'Таиланд', 1);

#INSERT INTO places () VALUES  #-------------------Объединённые Арабские Эмираты.....раньше были тут, но оказались все глаными--------------


INSERT INTO places (`ID_place`, `Name`, `City`, `Country`, `International`) VALUES  #-------------------ИНДИЯ-----------------------------
('BLR', 'Международный аэропорт Кемпеговда', 'Бенгалуру', 'Индия', 1),
('CCU', 'Международный аэропорт Нетаджи Субхас Чандра Бос', 'Калькутта', 'Индия', 1),
('MAA', 'Международный аэропорт Ченнаи', 'Ченнаи', 'Индия', 1),
('HYD', 'Международный аэропорт Раджива Ганди', 'Хайдарабад', 'Индия', 1),
('PNQ', 'Аэропорт Пуна', 'Пуна', 'Индия', 0),
('GOI', 'Международный аэропорт Даболим', 'Гоа', 'Индия', 1),
('TRV', 'Международный аэропорт Тривандрум', 'Тируванантапурам', 'Индия', 1);

INSERT INTO places (`ID_place`, `Name`, `City`, `Country`, `International`) VALUES  #-----------------------------------ФРАНЦИЯ-----------------------------
('LYS', 'Аэропорт Лион-Сен-Экзюпери', 'Лион', 'Франция', 0),
('NCE', 'Аэропорт Ницца', 'Ницца', 'Франция', 0),
('TLS', 'Аэропорт Тулуза-Бланьяк', 'Тулуза', 'Франция', 0),
('BOD', 'Аэропорт Бордо-Меригак', 'Бордо', 'Франция', 0),
('MUL', 'Аэропорт Мюлуз', 'Мюлуз', 'Франция', 0),
('RNS', 'Аэропорт Ренна', 'Ренн', 'Франция', 0),
('BIA', 'Аэропорт Бастии', 'Бастия', 'Франция', 0),
('AJA', 'Аэропорт Аяччо', 'Аяччо', 'Франция', 0),
('NTE', 'Аэропорт Нанта', 'Нант', 'Франция', 0),
('TLN', 'Аэропорт Тулона', 'Тулон', 'Франция', 0),
('LRH', 'Иль-де-Ре', 'Ла-Рошель', 'Франция', 0),
('FSC', 'Аэропорт Фигари', 'Фигари', 'Франция', 0),
('PGF', 'Аэропорт Перпиньян', 'Перпиньян', 'Франция', 0),
('BVE', 'Аэропорт Бове', 'Бове', 'Франция', 0),
('CFR', 'Аэропорт Корсика', 'Корсика', 'Франция', 0),
('CVF', 'Аэропорт Клермон-Феррана', 'Клермон-Ферран', 'Франция', 0),
('LBG', 'Аэропорт Ле Бурже', 'Париж', 'Франция', 0);

INSERT INTO places (`ID_place`, `Name`, `City`, `Country`, `International`) VALUES  #--------------------------------------------------ГЕРМАНИЯ-----------------------------
('TXL', 'Аэропорт Тегель', 'Берлин', 'Германия', 0),
('SXF', 'Аэропорт Шенефельд', 'Берлин', 'Германия', 0),
('CGN', 'Аэропорт Кельна/Бона', 'Кёльн', 'Германия', 0),
('STG', 'Аэропорт Штутгарта', 'Штутгарт', 'Германия', 0),
('NUE', 'Аэропорт Нюрнберга', 'Нюрнберг', 'Германия', 0),
('DRS', 'Аэропорт Дрезден', 'Дрезден', 'Германия', 0),
('LEJ', 'Аэропорт Лейпциг/Халле', 'Лейпциг', 'Германия', 0),
('SCN', 'Аэропорт Саарбрюккена', 'Саарбрюккен', 'Германия', 0),
('FDH', 'Аэропорт Фридрихсхафен', 'Фридрихсхафен', 'Германия', 0),
('HHN', 'Аэропорт Хан', 'Рейнланд-Пфальц', 'Германия', 0),
('HAJ', 'Аэропорт Ганновера', 'Ганновер', 'Германия', 0),
('TLL', 'Аэропорт Треви', 'Треви', 'Германия', 0),
('ZRH', 'Аэропорт Цюриха', 'Цюрих', 'Германия', 0),
('SGN', 'Аэропорт Штутгарта', 'Штутгарт', 'Германия', 0);

INSERT INTO places (`ID_place`, `Name`, `City`, `Country`, `International`) VALUES #-----------------------------------------ИТАЛИЯ--------------------------------------
('LIN', 'Аэропорт Линате', 'Милан', 'Италия', 0),
('BLQ', 'Аэропорт Болоньи', 'Болонья', 'Италия', 0),
('NAP', 'Международный аэропорт Неаполя', 'Неаполь', 'Италия', 1),
('CTA', 'Международный аэропорт Катании', 'Катания', 'Италия', 1),
('PMO', 'Аэропорт Палермо', 'Палермо', 'Италия', 0),
('TRN', 'Аэропорт Турина', 'Турин', 'Италия', 0),
('BRI', 'Аэропорт Бари', 'Бари', 'Италия', 0),
('AOI', 'Аэропорт Анконы', 'Анкона', 'Италия', 0),
('SAV', 'Аэропорт Сассари', 'Сассари', 'Италия', 0),
('FLR', 'Аэропорт Флоренции', 'Флоренция', 'Италия', 0),
('PSA', 'Аэропорт Пизы', 'Пиза', 'Италия', 0),
('BGY', 'Аэропорт Орьо аль Серио', 'Бергамо', 'Италия', 0),
('FAL', 'Аэропорт Фальконе', 'Лампедуза', 'Италия', 0),
('TRS', 'Аэропорт Триест', 'Триест', 'Италия', 0),
('REG', 'Аэропорт Реджо-Калабрия', 'Реджо-Калабрия', 'Италия', 0),
('CAG', 'Аэропорт Кальяри', 'Кальяри', 'Италия', 0);
 
 INSERT INTO plane_models VALUES
('Airbus A320', 150, 'Пассажирский'),
('Boeing 737', 160, 'Пассажирский'),
('Boeing 787', 242, 'Пассажирский'),
('Airbus A350', 300, 'Пассажирский'),
('Airbus A330', 250, 'Пассажирский'),
('Boeing 747', 416, 'Пассажирский'),
('Boeing 737 MAX', 178, 'Пассажирский'),
('Airbus A321', 220, 'Пассажирский'),
('Airbus A220', 120, 'Пассажирский'),
('Boeing 767', 216, 'Пассажирский'),
('Boeing 757', 200, 'Пассажирский'),
('Airbus A380', 555, 'Пассажирский'),
('Boeing 787-9', 296, 'Пассажирский'),
('Boeing 737-800', 162, 'Пассажирский'),
('Airbus A321neo', 206, 'Пассажирский'),
('Boeing 737 MAX 10', 230, 'Пассажирский'),
('Airbus A220-300', 130, 'Пассажирский'),
('Boeing 757-300', 280, 'Пассажирский'),
('Airbus A310', 280, 'Пассажирский'),
('Boeing 767-300', 216, 'Пассажирский'),
('Boeing 737 MAX 9', 197, 'Пассажирский'),
('Airbus A330neo', 260, 'Пассажирский'),
('Boeing 787-10', 318, 'Пассажирский'),
('Boeing 737-900ER', 180, 'Пассажирский'),
('Airbus A321XLR', 220, 'Пассажирский');

INSERT INTO planes VALUES
(1, 'Airbus A320', 'Исправен', 75.87, '2020-01-12', 4171),
(2, 'Boeing 737', 'Исправен', 80.23, '2020-04-23', 3763),
(3, 'Boeing 787', 'Исправен', 120.12, '2021-06-02', 2005),
(4, 'Airbus A350', 'В ремонте', 149.42, '2021-09-10', 1610),
(5, 'Airbus A330', 'Исправен', 99.89, '2022-01-15', 1290),
(6, 'Boeing 747', 'Неисправен', 249.78, '2022-04-05', 1105),
(7, 'Boeing 737 MAX', 'Исправен', 94.16, '2022-07-01', 981),
(8, 'Airbus A321', 'Исправен', 90.64, '2022-09-25', 903),
(9, 'Airbus A220', 'Исправен', 80.51, '2022-12-10', 801),
(10, 'Boeing 767', 'В ремонте', 70.49, '2023-02-05', 708),
(11, 'Boeing 757', 'Исправен', 60.32, '2023-03-15', 508),
(12, 'Airbus A380', 'Исправен', 399.27, '2023-05-28', 308),
(13, 'Boeing 787-9', 'Исправен', 129.91, '2023-08-02', 310),
(14, 'Boeing 737-800', 'Исправен', 86.34, '2023-09-20', 273),
(15, 'Airbus A321neo', 'В ремонте', 96.82, '2023-10-10', 255),
(16, 'Boeing 737 MAX 10', 'Исправен', 100.87, '2023-11-15', 231),
(17, 'Airbus A220-300', 'Исправен', 74.13, '2024-01-02', 121),
(18, 'Boeing 757-300', 'Исправен', 64.79, '2024-02-14', 114),
(19, 'Airbus A310', 'Исправен', 35.63, '2024-03-05', 105),
(20, 'Boeing 767-300', 'Неисправен', 80.92, '2024-04-18', 97),
(21, 'Boeing 737 MAX 9', 'Исправен', 89.68, '2024-05-11', 102),
(22, 'Airbus A330neo', 'Исправен', 99.22, '2024-06-30', 91),
(23, 'Boeing 787-10', 'Исправен', 151.14, '2024-07-15', 90),
(24, 'Boeing 737-900ER', 'Исправен', 84.88, '2024-08-20', 81),
(25, 'Airbus A321XLR', 'Исправен', 95.44, '2024-09-05', 79);
                          
 insert into repair_history values(1, "2020-05-17", 0, "Шасси 1 и 3", 72, "Ремонт окончен", 1),
						  (2, "2022-12-30", 0, "Грузовая рампа", 17, "Ремонт окончен", 4),
                          (3, "2023-01-01", 0, "Навигационная панель", 320, "Ремонт окончен", 1),
                          (4, "2024-09-23", 6, "Топливный бак", 503, "В процессе ремонта", 3),
                          (5, "2024-10-23", 36, "Правый основной двигатель", 112, "В очереди ремонта", 6);   
                      
select * from races;
