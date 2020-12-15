import Foundation

// ГЛАВА КНИГИ

open class SomeOpenClass {}
internal class SomeInternalClassExmpl {}
fileprivate class SomePrivateClassExmpl {}
public var somePublicVar = 0
private var somePrivateVar = 0
internal func someInternalFunc() {}

public class SomePublicClass {
    public var somePublicProperty = 0 // public
    var someInternalProperty = 0 // неявно выводится internal
    fileprivate func someFileprivateMethod() {}
}

class SomeInternalClass {
    var someInternalProperty = 0 // internal
    private func somePrivateMethod() {} // private
}

private class SomePrivateClass {
    var somePrivateProperty = 0 // private
    func somePrivateMethod() {} // private
}

//private func someFunction() -> (SomeInternalClass, SomePrivateClass) {}

// ЗАДАНИЯ
// ---------------------------------------------------------------

// 1

struct Thermometer {
    private var celsiusStorage: Float = 0
    var celsius: Float {
        get {
            self.celsiusStorage
        }
        set (cels) {
            self.celsiusStorage = cels
            self.fahrenheitStorage = ( 9 / 5 ) * cels + 32
        }
    }
    private var fahrenheitStorage: Float = 32
    var fahrenheit: Float {
        get {
            self.fahrenheitStorage
        }
        set (fahr) {
            self.fahrenheitStorage = fahr
            self.celsiusStorage = ( 5 / 9 ) * ( fahr - 32 )
        }
    }
}

var thermometer = Thermometer()
thermometer.celsius = 10
thermometer.fahrenheit
thermometer.fahrenheit = 75.2
thermometer.celsius
