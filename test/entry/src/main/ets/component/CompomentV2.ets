@ObservedV2
class Tmp {
  @Trace paramA1: string = ''
}
class Tmp2 {
  paramA1: string = ''
  paramA2?: Tmp = new Tmp()

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
    Text(`UseStateVarByReference3: ${params.paramA1} `)
  }
}
@Entry
@ComponentV2
@Preview
struct Parent {
  @Local label: string = 'Hello';
  @Local temp:Tmp = new Tmp()
  build() {
    Column() {
      // Pass the this.label reference to the overBuilder component when the overBuilder component is called in the Parent component.
      overBuilder({ paramA1: this.label })
      overBuilder(this.temp)
      // 参数是两个或两个以上，不会触发动态渲染UI。
      overBuilder2({ paramA1: this.label },{ paramA1: this.label })
      overBuilder3({ paramA1: this.label, })
      Button('Click me').onClick(() => {
        // After Click me is clicked, the UI text changes from Hello to ArkUI.
        this.label = 'ArkUI';
        this.temp.paramA1 ='ArkUI';
      })
    }
  }
}