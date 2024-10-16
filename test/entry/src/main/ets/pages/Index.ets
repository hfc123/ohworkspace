import { MyButtonAttribute } from '../style/MyButtonAttribute';

@Entry
@Component
struct Index {
  @State message: string = 'Hello World';
  pageInfos: NavPathStack = new NavPathStack()

  build() {
    Navigation(this.pageInfos) {
      Column() {
        Button('start page1')
          .attributeModifier(new MyButtonAttribute())
          .onClick(()=>{
            console.log('clicked')
            this.pageInfos.pushPath({name:'pageOne',param:'this is page1'})
          });
      }
    }
    .title('Navigation')
    .height('100%')
    .width('100%')
  }
}