// @Observed //添加这个可以检测到二层属性变化
class Son {
  son: string = '000';

  constructor(son: string) {
    this.son = son;
  }

}

class Parent {
  son: Son = new Son('111');
}

@Entry
@Component
struct Test {
  @State son: Son = new Son('222');
  @State parent: Parent = new Parent();
  count =1
  aboutToAppear(): void {
     this.parent.son = this.son;

  }

  build() {
    Column() {
      Text(`${this.son.son}`);
      Text(`${this.parent.son.son}`);
      Button('change')
        .onClick(() => {

          //  this.parent.son = new Son('444');
          // 无法监测二层属性变化
            this.parent.son.son = '333'+(this.count++);
        })
    }
  }
}