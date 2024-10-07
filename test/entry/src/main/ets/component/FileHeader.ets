/**
 * 文件名: FileHeader
 * 创建日期: 2024/10/7
 * 作者: hfc
 * 描述:
 *
 * 版权信息: (c) 2024 Your Company. All rights reserved.
 *
 * 修改记录:
 * 日期         作者        修改内容
 * ---------------------------------------------------
 * 2024/10/7     hfc     初始版本
 */

@Entry
@Component
@Preview
struct FileHeader {
  @State message: string = 'Hello World';

  build() {
    RelativeContainer() {
      Toggle({ type: ToggleType.Checkbox, isOn: true })
        .selectedColor(Color.Pink).border({ radius: 0 })
      Text(this.message)
        .id('HelloWorld')
        .fontSize(50)
        .fontWeight(FontWeight.Bold)
        .alignRules({
          center: { anchor: '__container__', align: VerticalAlign.Center },
          middle: { anchor: '__container__', align: HorizontalAlign.Center }
        })

      // Tabs(){
      //   TabContent()
      //     .tabBar(indicator)
      //
      // }.indicator()
      Toggle({ type: ToggleType.Checkbox, isOn: false })
      Toggle({ type: ToggleType.Checkbox, isOn: true })
    }
    .height('100%')
    .width('100%')
  }
  // layoutOptions: GridLayoutOptions = {
  //   regularSize: [1, 1],
  //   onGetRectByIndex: (index: number) => {
  //     if (index == key1) { // key1是“0”按键对应的index
  //       return [5, 0, 1, 2]
  //     } else if (index == key2) { // key2是“=”按键对应的index
  //       return [4, 3, 2, 1]
  //     }
  //     // ...
  //     // 这里需要根据具体布局返回其他item的位置
  //   }
  // }


}
