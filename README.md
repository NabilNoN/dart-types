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

## Define Your Custom Choise

```dart
//define custom types example
class BoxSides{
  TypesBuilder builder;
  BoxSides._fromTypes(Types type){
    builder=TypesBuilder.build(type??Types.F);
  }

  static final BoxSides NoSides=BoxSides._fromTypes(Types.F);
  static final BoxSides TOP=BoxSides._fromTypes(Types.A);
  static final BoxSides LEFT=BoxSides._fromTypes(Types.B);
  static final BoxSides RIGHT=BoxSides._fromTypes(Types.C);
  static final BoxSides BOTTOM=BoxSides._fromTypes(Types.D);

  static final BoxSides TOP_LEFT=BoxSides._fromTypes(Types.AB);
  static final BoxSides TOP_RIGHT=BoxSides._fromTypes(Types.AC);

  static final BoxSides LEFT_RIGHT=BoxSides._fromTypes(Types.BC);

  static final BoxSides LEFT_BOTTOM=BoxSides._fromTypes(Types.BD);
  static final BoxSides RIGHT_BOTTOM=BoxSides._fromTypes(Types.CD);

  static final BoxSides TOP_BOTTOM=BoxSides._fromTypes(Types.AD);

  static final BoxSides TOP_LEFT_RIGHT=BoxSides._fromTypes(Types.ABC);
  static final BoxSides LEFT_RIGHT_BOTTOM=BoxSides._fromTypes(Types.BCD);
  static final BoxSides TOP_LEFT_BOTTOM=BoxSides._fromTypes(Types.ABD);
  static final BoxSides TOP_RIGHT_BOTTOM=BoxSides._fromTypes(Types.ACD);

  static final BoxSides TOP_LEFT_RIGHT_BOTTOM=BoxSides._fromTypes(Types.ABCD);

  bool get isNoSides=>(builder.type & Types.ABCD)==Types.F;
  bool get hasTOP=>builder.hasA;
  bool get hasLEFT=>builder.hasB;
  bool get hasRIGHT=>builder.hasC;
  bool get hasBOTTOM=>builder.hasD;

  BoxSides addSide(BoxSides side){
    builder.addType(side.builder.type);
    return this;
  }

  BoxSides removeSide(BoxSides side){
    builder.removeType(side.builder.type);
    return this;
  }

  operator +(BoxSides other){
    return this.addSide(other);
  }
  
  operator -(BoxSides other){
    return this.removeSide(other);
  }
  
  @override
  String toString() {
    String str="";
    if(this.hasTOP)str+="TOP";
    if(this.hasLEFT)str+=(str.length>0?" | ":"")+"LEFT";
    if(this.hasRIGHT)str+=(str.length>0?" | ":"")+"RIGHT";
    if(this.hasBOTTOM)str+=(str.length>0?" | ":"")+"BOTTOM";
    return "[ $str ]";
  }
}

...
//usage example
BoxSides sides=BoxSides.LEFT_RIGHT;//[ LEFT | RIGHT ]
sides.addSide(BoxSides.BOTTOM).addSide(BoxSides.TOP).removeSide(BoxSides.LEFT);//[ TOP | RIGHT | BOTTOM ]
```

## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.

## License
[BSD](https://choosealicense.com/licenses/bsd/)
