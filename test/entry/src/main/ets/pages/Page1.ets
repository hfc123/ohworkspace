/*
 * Copyright (c) 2024. Lorem ipsum dolor sit amet, consectetur adipiscing elit.
 * Morbi non lorem porttitor neque feugiat blandit. Ut vitae ipsum eget quam lacinia accumsan.
 * Etiam sed turpis ac ipsum condimentum fringilla. Maecenas magna.
 * Proin dapibus sapien vel ante. Aliquam erat volutpat. Pellentesque sagittis ligula eget metus.
 * Vestibulum commodo. Ut rhoncus gravida arcu.
 */
import { MyButtonAttribute } from '../style/MyButtonAttribute';

/**
 * 文件名: Page1
 * 创建日期: 2024/10/16
 * 作者: hfc
 * 描述:
 *
 * 版权信息: (c) 2024 Your Company. All rights reserved.
 *
 * 修改记录:
 * 日期         作者        修改内容
 * ---------------------------------------------------
 * 2024/10/16     hfc     初始版本
 */
@Builder
function Page1Builder() {
  Page1()
}

@Entry
@Component
struct Page1 {
  @State message: string = 'Hello World';
  pageInfos: NavPathStack = new NavPathStack()

  build() {
    NavDestination() {
      Column() {
        Text(this.message)
          .id('HelloWorld')
          .fontSize(15)
          .fontWeight(FontWeight.Bold)
          .alignRules({
            center: { anchor: '__container__', align: VerticalAlign.Center },
            middle: { anchor: '__container__', align: HorizontalAlign.Center }
          })
        Button('show info').attributeModifier(new MyButtonAttribute())
          .onClick(() => {

            this.message = String()
                .concat('-------------------\n')
                .concat('获取栈中所有NavDestination页面的名称' + JSON.stringify(this.pageInfos.getAllPathName()))
                .concat('\n-------------------\n')
                .concat('获取index指定的NavDestination页面的参数信息' +
                JSON.stringify(this.pageInfos.getParamByIndex(0)))
                .concat('\n-------------------\n')
                .concat('获取全部名为name的NavDestination页面的位置索引' +
                JSON.stringify(this.pageInfos.getIndexByName('pageOne')))
                .concat('\n-------------------\n')
                .concat('获取栈大小'+ JSON.stringify(this.pageInfos.size()));
          })
      }
    }
    .height('100%')
    .width('100%')
    .onReady((context: NavDestinationContext) => {
      this.pageInfos = context.pathStack;
      console.log("current page config info is " + JSON.stringify(context.getConfigInRouteMap()))
    })
  }
}