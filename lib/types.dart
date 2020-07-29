import 'dart:core';

class Types{
  static Types F=Types(0x00000000);
  static Types A=Types(0x00000001);
  static Types B=Types(0x00000010);

  //c
  static Types C=Types(0x00000100);
  static Types BC=Types(0x00000110);
  static Types AC=Types(0x00000101);

  //d
  static Types D=Types(0x00001000);
  static Types AD=Types(0x00001001);
  static Types BD=Types(0x00001010);
  static Types CD=Types(0x00001100);
  static Types ABD=Types(0x00001011);
  static Types ACD=Types(0x00001101);
  static Types BCD=Types(0x00001110);

  //e
  static Types E=Types(0x00010000);
  static Types AE=Types(0x00010001);
  static Types BE=Types(0x00010010);
  static Types CE=Types(0x00010100);
  static Types DE=Types(0x00011000);
  static Types ABE=Types(0x00010011);
  static Types ACE=Types(0x00010101);
  static Types ADE=Types(0x00011001);
  static Types BCE=Types(0x00010110);
  static Types BDE=Types(0x00011010);
  static Types CDE=Types(0x00011100);
  static Types ACDE=Types(0x00011101);
  static Types BCDE=Types(0x00011110);
  static Types ABDE=Types(0x00011011);
  static Types ABCE=Types(0x00010111);

  static Types AB=Types(0x00000011);
  static Types ABC=Types(0x00000111);
  static Types ABCD=Types(0x00001111);
  static Types ABCDE=Types(0x00011111);

  String name;
  final int id;
  Types(this.id){
    this.name=_getName(id);
  }

  ///add [other] to current [Types]
  operator |(Types other)=>Types(this.id|other.id);

  ///if exist [other] in [Types] remove from current [Types]<br/>
  ///else add [other] to current [Types]
  operator ^(Types other)=>Types(this.id^other.id);

  ///if exist [other] in [Types] only use [other]
  operator &(Types other)=>Types(this.id&other.id);

  ///see [|]
  operator +(Types other)=>Types(this.id|other.id);
  ///like [^] except this will not add [other] to current [Types] if not exist<br/>
  ///if not exist will return current [Types]<br/>
  ///see [^]
  operator -(Types other){
    //if exist subtract
    if(this.id&other.id!=0)return Types(this.id^other.id);
    return this;
  }


  @override
  int get hashCode {
    return this.name.hashCode+id.hashCode;
  }

  @override
  bool operator ==(other) {
    return (other is Types && other.id==this.id) ||
        (other is int && other==this.id) ||
        (other is String && other==this.name) ;
  }

  @override
  String toString()=>"${id}_$name";

  static String _getName(int id,[String ifUnknown="UNKNOWN"]){
    final Map _names={
      0x00000000:"F",
      0x00000001:"A",
      0x00000010:"B",
      0x00000100:"C", 0x00000110:"BC",0x00000101:"AC",
      0x00001000:"D", 0x00001001:"AD",0x00001010:"BD",0x00001100:"CD",0x00001011:"ABD",0x00001101:"ACD",0x00001110:"BCD",
      0x00010000:"E", 0x00010001:"AE",0x00010010:"BE",0x00010100:"CE",0x00011000:"DE",0x00010011:"ABE",0x00010101:"ACE",0x00011001:"ADE", 0x00010110:"CBE",0x00011010:"BDE",0x00011100:"CDE",0x00011101:"ACDE",0x00011110:"BCDE",0x00011011:"ABDE",0x00010111:"ABCE",
      0x00000011:"AB",0x00000111:"ABC",0x00001111:"ABCD",0x00011111:"ABCDE",
    };
    if(_names.containsKey(id))return _names[id];
    else return ifUnknown;
  }
}

class TypesBuilder<T extends Types>{
  T type;
  TypesBuilder.build([this.type]){
    if(type==null)type=Types.F;
  }
  int get id=>type.id;
  String get name=>type.name;
  bool contains(Types type)=>(type & this.type)!=0;
  bool get hasA=>(type & Types.A)!=Types.F;
  bool get hasB=>(type & Types.B)!=Types.F;
  bool get hasC=>(type & Types.C)!=Types.F;
  bool get hasD=>(type & Types.D)!=Types.F;
  bool get hasE=>(type & Types.E)!=Types.F;

  TypesBuilder addType(Types type){
    this.type+=type;
    return this;
  }
  TypesBuilder get addA{
    this.type+=Types.A;
    return this;
  }
  TypesBuilder get addB{
    this.type+=Types.B;
    return this;
  }
  TypesBuilder get addC{
    this.type+=Types.C;
    return this;
  }
  TypesBuilder get addD{
    this.type+=Types.D;
    return this;
  }
  TypesBuilder get addE{
    this.type+=Types.E;
    return this;
  }

  TypesBuilder removeType(Types type){
    this.type-=type;
    return this;
  }
  TypesBuilder get removeA{
    this.type-=Types.A;
    return this;
  }
  TypesBuilder get removeB{
    this.type-=Types.B;
    return this;
  }
  TypesBuilder get removeC{
    this.type-=Types.C;
    return this;
  }
  TypesBuilder get removeD{
    this.type-=Types.D;
    return this;
  }
  TypesBuilder get removeE{
    this.type-=Types.E;
    return this;
  }

  @override
  String toString() {
    return type.toString();
  }

  @override
  int get hashCode {
    return this.type.hashCode;
  }

  @override
  bool operator ==(other) {
    return (other is TypesBuilder && other.type==this.type) || (other is Types && other==this.type);
  }
}
