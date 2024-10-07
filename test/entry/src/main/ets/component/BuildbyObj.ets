class Tmp {
  paramA1: string = ''
}
class Tmp2 {
  paramA1: string = ''
  paramA2?: Tmp = new Tmp()

  // constructor(paramA1: string, paramA2: Tmp) {
  //   this.paramA1 = paramA1
  //   this.paramA2 = paramA2
  // }
}
@Builder function overBuilder(params: Tmp) {
  Row() {
    Text(`UseStateVarByReference: ${params.paramA1} `)
  }
}
@Builder function overBuilder2(params: Tmp,params2: Tmp) {
  Row() {
    Text(`UseStateVarByReference2: ${params.paramA1} `)
  }
}
@Builder function overBuilder3(params: Tmp2) {
  Row() {
    Text(`UseStateVarByReference3: ${params.paramA1}+"   "+ ${params.paramA2?.paramA1} `)
  }
}
@Entry
@Component
@Preview
struct Parent {
  @State label: string = 'Hello';
  @State temp:Tmp = new Tmp()
  build() {
    Column() {
      // Pass the this.label reference to the overBuilder component when the overBuilder component is called in the Parent component.
      overBuilder({ paramA1: this.label })
      overBuilder(this.temp)
      // 参数是两个或两个以上，不会触发动态渲染UI。
      overBuilder2({ paramA1: this.label },{ paramA1: this.label })
      // 同时包含按值传递和按引用传递两种方式，不会触发动态渲染UI
     // overBuilder3(new Tmp2(this.label,{paramA1: this.label}))
      //通过以对象字面量的形式传递参数
      overBuilder3({paramA1:this.label,paramA2: this.temp})
    //  overBuilder3({paramA1: this.label,paramA2:this.temp})

      Button('Click me').onClick(() => {
        // After Click me is clicked, the UI text changes from Hello to ArkUI.
        this.label = 'ArkUI';
        this.temp.paramA1 ='ArkUI';
      })
    }
  }
}