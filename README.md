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

## Define Your Custom Choice

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

  bool get isNoSides=>(builder.type & Types.ABCD)==Types.F;
  bool get hasTOP=>builder.hasA;
  bool get hasLEFT=>builder.hasB;
  bool get hasRIGHT=>builder.hasC;
  bool get hasBOTTOM=>builder.hasD;

  BoxSides addSide(BoxSides side){
    return this + side;
  }

  BoxSides removeSide(BoxSides side){
    return this - side;
  }

  operator +(BoxSides other){
    return BoxSides._fromTypes(this.builder.type+other.builder.type);
  }

  operator -(BoxSides other){
    return BoxSides._fromTypes(this.builder.type-other.builder.type);
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
```

```dart
class Corners{
  TypesBuilder builder;
  Corners._fromTypes(Types type){
    builder=TypesBuilder.build(type??Types.F);
  }

  static final Corners NoCorners=Corners._fromTypes(Types.F);
  static final Corners TOP_LEFT=Corners._fromTypes(Types.A);
  static final Corners TOP_RIGHT=Corners._fromTypes(Types.B);
  static final Corners BOTTOM_LEFT=Corners._fromTypes(Types.C);
  static final Corners BOTTOM_RIGHT=Corners._fromTypes(Types.D);

  bool get isNoCorners=>(builder.type & Types.ABCD)==Types.F;
  bool get hasTOP_LEFT=>builder.hasA;
  bool get hasTOP_RIGHT=>builder.hasB;
  bool get hasBOTTOM_LEFT=>builder.hasC;
  bool get hasBOTTOM_RIGHT=>builder.hasD;

  Corners addCorner(Corners corner){
    return this + corner;
  }

  Corners removeCorner(Corners corner){
    return this - corner;
  }

  operator +(Corners other){
    return Corners._fromTypes(this.builder.type+other.builder.type);
  }

  operator -(Corners other){
    return Corners._fromTypes(this.builder.type-other.builder.type);
  }

  @override
  String toString() {
    String str="";
    if(this.hasTOP_LEFT)str+="TOP_LEFT";
    if(this.hasTOP_RIGHT)str+=(str.length>0?" | ":"")+"TOP_RIGHT";
    if(this.hasBOTTOM_LEFT)str+=(str.length>0?" | ":"")+"BOTTOM_LEFT";
    if(this.hasBOTTOM_RIGHT)str+=(str.length>0?" | ":"")+"BOTTOM_RIGHT";
    return "< $str >";
  }

}
```

usage example:

```dart
BoxSides sides=BoxSides.LEFT + BoxSides.RIGHT;//[ LEFT | RIGHT ]
sides.addSide(BoxSides.BOTTOM).addSide(BoxSides.TOP).removeSide(BoxSides.LEFT);//[ TOP | RIGHT | BOTTOM ]
sides=sides - BoxSides.RIGHT;//[ TOP | BOTTOM ]

Corners corner = Corners.TOP_LEFT + Corners.BOTTOM_RIGHT;//< TOP_LEFT | BOTTOM_RIGHT >
corner+=Corners.BOTTOM_LEFT;//< TOP_LEFT | BOTTOM_LEFT | BOTTOM_RIGHT >
```

OR an easy enum

```dart
class Sizes{
  TypesBuilder builder;
  Sizes._fromTypes(Types type){
    builder=TypesBuilder.build(type??Types.F);
  }

  static final Sizes SMALL=Sizes._fromTypes(Types.A);
  static final Sizes MEDIUM=Sizes._fromTypes(Types.B);
  static final Sizes LARGE=Sizes._fromTypes(Types.C);

  bool get isNull=>(builder.type & Types.ABC)==Types.F;
  bool get isSmall=>builder.hasA;
  bool get isMedium=>builder.hasB;
  bool get isLarge=>builder.hasC;

  @override
  String toString() {
    String str="";
    if(this.isSmall)str+="SMALL";
    if(this.isMedium)str+=(str.length>0?" , ":"")+"MEDIUM";
    if(this.isLarge)str+=(str.length>0?" , ":"")+"LARGE";
    return "< $str | ${super.toString()}>";
  }
}

var size = Sizes.LARGE;
if(size.isLarge){
  print('is large');//is large
}
```

## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.

## License
[BSD](https://choosealicense.com/licenses/bsd/)
