String capitalizeName(String name) => name.toUpperCase();
// 인자에 null을 넣고 싶은 경우에는?
String capitalizeNameNull(String? name) =>
    name != null ? name.toUpperCase() : "SOMDA";
// 더 짧게도 가능
// 왼쪽 항이 null이면 "SOMDA"를 return 해라
String capitalizeNameNullShorter(String? name) =>
    name?.toUpperCase() ?? "SOMDA";

// typedef
typedef ListOfInts = List<int>; // 이렇게 타입 지정을 하고 나면
// List<int> reverseListOfNumbers(List<int> list) {
//   var reversed = list.reversed;
//   return reversed.toList();
// }
// 👆🏻 함수를 👇🏻 이렇게 수정할 수 있음
ListOfInts reverseListOfNumbers(ListOfInts list) {
  var reversed = list.reversed;
  return reversed.toList();
  // toList를 꼭 붙이는 이유? 인자로 list를 보내주지만 reversed 로 데이터 요소를 역순으로 바꿀 때 itarable<T>로 데이터 형태가 변함 이 함수는 List<int>를 변환해야 한다고 앞에서 정의를 해주었으므로 itarable<T> 이 형태를 다시 리스트 형태로 바꿔줘야 함. 따라서 toList를 쓰는 것!
}

// typedef 는 간단한 형태의 데이터를 활용할 때 쓰인다 
// 그럼 구조화된 데이터 형태를 사용하려면 어떻게 해야할까?
// class의 활용이 여기서 나온다.