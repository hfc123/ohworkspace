@Builder
function MyBuilder(value: string, size: number) {
  Text(value)
    .fontSize(size)
}

let globalBuilder: WrappedBuilder<[string, number]> = wrapBuilder(MyBuilder);

@Entry
@Component
struct Index {
  @State message: string = 'Hello World';

  build() {
    Row() {
      Column() {
        MyBuilder('111',50)
        globalBuilder.builder(this.message, 50)
        //按引用方式传值才能触发ui刷新
        Button('Click me').onClick(() => {
          // After Click me is clicked, the UI text changes from Hello to ArkUI.
          this.message = 'ArkUI';
        })
      }
      .width('100%')
    }
    .height('100%')
  }
}