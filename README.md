# dart-types

Helping developers to add up to different 5 types(choices)

## Installation

Download the '/lib/types.dart' file,  
add file to your project lib directory, and import it.

```bash
import 'types.dart';
```

## Usage

```dart
import 'types.dart';
...

TypesBuilders.build().addA.addB.addC.addE.addD;//=Types.ABCDE
TypesBuilders.build().addC.addE.addD;//=Types.CDE
TypesBuilders.build(Types.ABDE).addC.removeB;//=Types.ACDE
...

TypesBuilder type = TypesBuilder.build().addC.addE.addD;//=Types.CDE
type.hasB;//=false
type.hasE;//=true
type.hasA;//=false
type.contains(Types.E);//=true

type.type - Types.E;//=Types.CD
type.hasE;//=false

type.type + Types.AB;//=Types.ABCD
type.hasA;//=true
type.hasB;//=true
type.hasE;//=false
```
or you can use Types directly without Builder.

```dart
Types type = Types.ABCD;
type + Types.E;//=Types.ABCDE
type - Types.A;//=Types.BCDE
type.toString();//69904_BCDE
```
remember Types.F ACTS as Null or Undefined.

## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.

## License
[BSD](https://choosealicense.com/licenses/bsd/)
