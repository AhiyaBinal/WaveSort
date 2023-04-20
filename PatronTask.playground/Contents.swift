
//Find remaining elements from array
func FindRemainingElements<genericType: Hashable & Comparable>(in array: [genericType]) -> [genericType] {
    var set: Set<genericType> = []
    return array.filter { !set.insert($0).inserted }.sorted()
}

//Find unique elements from array
func FindUniqueElements<genericType: Hashable & Comparable>(in array: [genericType]) -> [genericType] {
    return Array(Set(array)).sorted()
}

func FindResult<genericType: Hashable & Comparable>(tempArray: [genericType], sortedArray: inout [genericType], isReverse: inout Bool) {
    //Declare temporary unique and temporary remaining array
    var tempUniqueArray : [genericType]
    var tempRemainingArray : [genericType]
    
    /*Find Unique elements from input array using FindUniqueElements method and store it in temporary array*/
    tempUniqueArray = FindUniqueElements(in: tempArray)
    
    /*Find Remaining and duplicate elements from input array using FindRemainingElements method and store it in temporary array*/
    tempRemainingArray = FindRemainingElements(in: tempArray)
    
    /*The FindUniqueElements method gives us elements in a ascending order. If we want to make them appear in the opposite order every other time we get a result from the loop, we can use the "reversed()" function. To keep track of whether we need to use this function or not, we have a Boolean variable called "isReverse".*/
    sortedArray.append(contentsOf: isReverse ? tempUniqueArray.reversed() : tempUniqueArray)
    isReverse.toggle()
    
    /*This condition is used to stop the loop. When there are no more elements left in the "Remaining" array, the "FindResult" method won't be called and we will get the final result. */
    if !tempRemainingArray.isEmpty {
        FindResult(tempArray: tempRemainingArray, sortedArray: &sortedArray, isReverse: &isReverse)
    }
}
func TestIntegerArray() {
    //To test Integer Inputs
    let integersArray = [1, 2, 1, 2, 3, 7, 4, 9, 11, 3, 1, 2, 3, 1, 3, 7, 4, 9]
    var sortedIntegersArray = [Int]()
    var isReverse = false
    FindResult(tempArray: integersArray, sortedArray: &sortedIntegersArray, isReverse: &isReverse)
    print(sortedIntegersArray)
}
func TestStringsArray() {
    //To test String Inputs
    let stringsArray = ["cat", "fish", "ant", "ant", "elephant", "platypus", "platypus", "cat"]
    var sortedStringsArray = [String]()
    var isReverse2 = false
    FindResult(tempArray: stringsArray, sortedArray: &sortedStringsArray, isReverse: &isReverse2)
    print(sortedStringsArray)
}
func TestDoublesArray() {
    //To test Doubles Inputs
    let doubleArray = [50.0, 25000.0, 1.0, 1.0, 2.0, 100.0, 50.0, 2.0, -1.5]
    var sortedDoubleArray = [Double]()
    var isReverse3 = false
    FindResult(tempArray: doubleArray, sortedArray: &sortedDoubleArray, isReverse: &isReverse3)
    print(sortedDoubleArray)
}
func Solve () {
    TestIntegerArray()
    TestStringsArray()
    TestDoublesArray()
}

Solve()


