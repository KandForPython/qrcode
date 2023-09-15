import time
coffee = {
    "1": "эспрессо",
    "2": "латте",
    "3": "капучино"
}

menu = {
    1: {
        "ingredients": {
            "вода": 150,
            "кофе": 18
        },
        "cost": 100,
    },
    2: {
        "ingredients": {
            "вода": 100,
            "молоко": 100,
            "кофе": 18
        },
        "cost": 200,
    },
    3: {
        "ingredients": {
            "вода": 150,
            "молоко": 100,
            "кофе": 24,
        },
        "cost": 120,
    }
}
resourses = {
    "вода": 500,
    "молоко": 400,
    "кофе": 100,
}



def coffee(n):
    if n != 4:
        for key in menu[n]["ingredients"]:
            print(f'{key}: {menu[n]["ingredients"][key]}')
        print(f'цена - {menu[n]["cost"]}')
    elif n == 4:
        for key in resourses:
            print(f'{key} : {resourses[key]}')
def infinity():
    while True:
        sec = 5
        if resourses["вода"] <= 150 or resourses["молоко"] <= 100 or resourses["кофе"] <= 24:
            print("Извините, в аппарате не достаточно ингредиентов, приходите в другой раз")

            return False
        vibor = int(input("Чего вы желаете? \n1 - эспрессо\n2 - латте\n3 - капучино\n4 - отчет\n"))
        if vibor == 5:
            print("выключение...")
            return False
        coffee(vibor)
        if vibor == 4:
            return infinity()
        word_count = int(input("Вы хотите это заказать?\n1 - Да\n2 - Нет\n"))
        if word_count == 1:
            print("выполняем ваш заказ")
            if vibor == 1:
                resourses["вода"] = resourses["вода"] - 150
                resourses["кофе"] = resourses["кофе"] - 18
            elif vibor == 2:
                resourses["вода"] = resourses["вода"] - 100
                resourses["молоко"] = resourses["молоко"] - 100
                resourses["кофе"] = resourses["кофе"] - 18
            elif vibor == 3:
                resourses["вода"] = resourses["вода"] - 150
                resourses["молоко"] = resourses["молоко"] - 100
                resourses["кофе"] = resourses["кофе"] - 24
            while True:
                print(f'{sec}...')
                time.sleep(0.7)
                sec -= 1
                if sec == 0:
                    print("Ваш заказ готов!")
                    return infinity()
        elif word_count == 2:
            print("Выберите другой напиток или выведите отчет")
            return infinity()
        else:
            print("Вы ввели неправильную команду")
            return infinity()
infinity()
