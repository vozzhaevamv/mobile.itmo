## Общая характеристика

Для объявления переменной или константы целочисленного типа используются ключевые слова UInt (для хранения только положительных значений) и Int (для хранения как положительных, так и отрицательных значений).
На 32-битных платформах Int имеет тот же размер, что и Int32, а на 64-битных платформах Int имеет тот же размер, что и Int64.


## Тип Int глубоко интегрирован в протокольную систему Swift. Согласно официальной документации Apple, он реализует более 40 протоколов:
- AdditiveArithmetic
- AtomicRepresentable
- BNNSGraph.Builder.SliceIndex
- BinaryInteger
- BindableData
- BitwiseCopyable
- CKRecordValueProtocol
- CVarArg
- CodingKeyRepresentable
- Comparable
- ConvertibleFromGeneratedContent
- ConvertibleToGeneratedContent
- Copyable
- CustomReflectable
- CustomStringConvertible
- CustomURLRepresentationParameterConvertible
- Decodable
- Encodable
-EntityIdentifierConvertible
-Equatable
-ExpressibleByIntegerLiteral
-FixedWidthInteger
- Generable
- Hashable
- InstructionsRepresentable
- LosslessStringConvertible
- MLDataValueConvertible
- MLIdentifier
- MLTensorRangeExpression
- MirrorPath
- Numeric
- Plottable
- PrimitivePlottableProtocol
- PromptRepresentable
- RangeComparableProperty
- SIMDScalar
- Sendable
- SendableMetatype
- SignedInteger
- SignedNumeric
- Strideable

Благодаря этому  Int является универсальным типом, пригодным для решения широкого круга задач — от простых вычислений до сложных структур данных и сетевого взаимодействия.

## Инициализация и литералы
- 1. Целочисленный литерал

let count = 42   

let index: Int = 0   

- 2.Из чисел с плавающей запятой
Swift позволяет создавать Int из типов с плавающей точкой. 

let x = Int(3.7)   // 3

let y = Int(-2.9)  // -2

- 3.Из строк

let num = Int("123")   // Optional(123)
let invalid = Int("abc") // nil

- 4.Генерация случайных чисел
Тип Int также предоставляет статические методы для генерации случайных значений:

let randomValue = Int.random(in: 1...100)

## Арифметические операции
Над целыми числами можно выполнять стандартные арифметические операции:

let a = 10

let b = 3

print(a + b) // 13

print(a - b) // 7

print(a * b) // 30

print(a / b) // 3 (целочисленное деление)

print(a % b) // 1 (остаток от деления)

## Работа с границами
Тип Int предоставляет свойства для работы с пределами:
print(Int.min) // минимальное значение
print(Int.max) // максимальное значение
print(Int.bitWidth) // 64 (на 64-битных устройствах)

НО в Swift защита от целочисленного переполнения по умолчанию включена: обычные арифметические операторы не переполняются, а вызывают ошибку, если результат превышает допустимые границы для данного типа.
