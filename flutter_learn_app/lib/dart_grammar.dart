
main() {
  // 1.无论是数字，函数和 null 都是对象。所有对象继承自 Object 类
  var number = 42; // 声明并初始化一个变量。
  const a = "11";
  print('The number is $number.');
  //2.未初始化的变量默认值是 null。即使变量是数字 类型默认值也是 null，因为在 Dart 中一切都是对象，数字类型 也不例外。
  int lineCount;
  assert(lineCount == null);
  //3.内建类型
  //  Number
  //  String
  //  Boolean
  //  List (也被称为 Array)
  //  Map
  //  Set
  //  Rune (用于在字符串中表示 Unicode 字符)
  //  Symbol

  // number 类型 有int 和 double
  double d2 = 1;
  // list 类型
  var list = [1,2,3];
  // set
  var halogens = {'fluorine', 'chlorine', 'bromine', 'iodine', 'astatine'};
  var set1 = Set<String>();
  //map
  var gift = Map<String,String>();
  final gifts = {"1":"1","2":"2"};

}
