//: [Previous](@previous)

import Foundation

class Animal {
    var name: String
    var health: Int
    var hunger: Int
    var thirst: Int
    var alive: Bool
    
    init(name: String) {
        self.name = name
        self.health = 100
        self.alive = true
        self.hunger = 0
        self.thirst = 0
    }
    func eat() {
        if hunger > 20 {
            hunger -= 10
            health += 5
            print("\(name) Поел")
        }
        else {
            print("\(name) Не хочет есть.")
        }
    }
    func drink() {
        if thirst > 20 {
            thirst -= 10
            health += 5
            print("\(name) Попил")
        }
        else {
            print("\(name) Не хочет пить")
        }
    }
    func walk() {
        hunger += 20
        thirst += 20
        if Int.random(in: 1...100) > 50 {
            health -= 50
            print("Беда! \(name) получил травму")
        }
        print("\(name) Погулял и голоден и хочет пить")
    }
    func reproduce() -> Animal? {
        if health > 80 && hunger < 10 && thirst < 10 {
            if Int.random(in: 1...100) > 30 {
                return nil
            }
            return createBaby(name: "Baby \(name)")
        }
        return nil
    }
    func createBaby(name: String) -> Animal {
        return Animal(name: name)
    }
    func die() {
        alive = false
        print("\(name) СМЕРТЬ.")
    }
    
    func nextDay() {
        hunger += 10
        thirst += 10
        health -= 10
        if health <= 10 {
            die()
        }
        print("\(name)'s Здоровье - \(health).")
        print("\(name)'s Голод - \(hunger).")
        print("\(name)'s Жажда - \(thirst).")
        if Int.random(in: 1...100) > 80 {
            health -= 60
            print("Беда! \(name) получил травму ")
        }
    }
    
}
class Hot_Dog: Animal {
    override func createBaby(name: String) -> Animal {
        return Hot_Dog(name: name)
    }
}
class Bobr_Kurwa: Animal {
    override func createBaby(name: String) -> Animal {
        return Bobr_Kurwa(name: name)
    }
}
class Bombardiro_Crocodilo: Animal {
    override func createBaby(name: String) -> Animal {
        return Bombardiro_Crocodilo(name: name)
    }
}
class Spioniro_Golubiro: Animal{
    override func createBaby(name: String) -> Animal {
        return Spioniro_Golubiro(name: name)
    }
}
class Chimpanzini_Bananini: Animal{
    override func createBaby(name: String) -> Animal {
        return Chimpanzini_Bananini(name: name)
    }
}
class Bombombini_Gusini: Animal{
    override func createBaby(name: String) -> Animal {
        return Bombombini_Gusini(name: name)
    }
}
class Zoo {
    var animals: [Animal] = []
    func populate(){
        for i in 1...Int.random(in: 1...10){
            animals.append(Hot_Dog(name: "ХотСобака_\(i)"))
        }
        for i in 1...Int.random(in: 1...10){
            animals.append(Bobr_Kurwa(name: "Бобр_\(i)"))
        }
        for i in 1...Int.random(in: 1...10){
            animals.append(Bombardiro_Crocodilo(name: "Крокодило_\(i)"))
        }
        for i in 1...Int.random(in: 1...10){
            animals.append(Spioniro_Golubiro(name: "Голубь_\(i)"))
        }
        for i in 1...Int.random(in: 1...10){
            animals.append(Chimpanzini_Bananini(name: "Обезьяна_\(i)"))
        }
        for i in 1...Int.random(in: 1...10){
            animals.append(Bombombini_Gusini(name: "Гусь_\(i)"))
        }
        print ("Зоопарк успешно заполнен! Всего в нем  \(animals.count) животных")
    }
    func simulateDay(day: Int){
        print("Начало дня \(day)")
        var newBabies: [Animal] = []
        
        for animal in animals{
            if !animal.alive{
                print("\(animal.name) умер")
                continue
            }
            let action = Int.random(in: 1...3)
            if action == 1{
                animal.eat()
            }
            else if action == 2{
                animal.drink()
            } else {
                animal.walk()
            }
            if let baby = animal.reproduce(){
                newBabies.append(baby)
                print("\(animal.name) родил детёныша: \(baby.name)")
            }
        }
        animals += newBabies
        print("Родилось \(newBabies.count) новых животных.")
        print("Всего животных: \(animals.count)\n")
    }
}
let zoo = Zoo()
zoo.populate()

for day in 1...10{
zoo.simulateDay(day: day)
}

