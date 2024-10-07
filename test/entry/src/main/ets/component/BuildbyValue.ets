@Builder function overBuilder(paramA1: string) {
  Row() {
    Text(`UseStateVarByValue: ${paramA1} `)
  }
}
@Entry
@Component
struct Parent {
  @State label: string = 'Hello';
  build() {
    Column() {
      overBuilder(this.label)
      Button('Click me').onClick(() => {
        //当传递的参数为状态变量时，状态变量的改变不会引起
        // @Builder方法内的UI刷新。所以当使用状态变量的时候，
        // 推荐使用按引用传递。
        this.label = 'ArkUI';
      })
    }

  }
}