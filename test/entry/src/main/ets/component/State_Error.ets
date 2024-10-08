//使用箭头函数改变状态变量未生效
export default class PlayDetailViewModel {
  coverUrl: string = '#00ff00'
  //coverUrl: string = '#00ff00'

  // 胖箭头指的是第二层对象时是不能改变
  // changeCoverUrl= ()=> {
  //   this.coverUrl = '#ffff0000';
  // }
  // 类似下面代码
  //  _this = this
  // changeCoverUrl(){
  //   this._this.coverUrl = '#ffff0000';
  // }
  changeCoverUrl(){
    this.coverUrl = '#ffff0000';
  }
}
@Entry
@Preview
@Component
struct PlayDetailPage {
  @State vm: PlayDetailViewModel = new PlayDetailViewModel();

  build() {
    Column() {
      Text(this.vm.coverUrl).width(100).height(100).backgroundColor(this.vm.coverUrl)
      Text(this.vm.coverUrl).width(100).height(100).backgroundColor(this.vm.coverUrl)

        Button('点击改变颜色')
          .onClick(() => {
            this.vm.changeCoverUrl();
            console.log(this.vm.coverUrl+"111")
          })
        Button('点击改变颜色2')
          .onClick(() => {
            this.vm.changeCoverUrl();
            let it =  this.vm.coverUrl
            this.vm.coverUrl =it;
          })
      Button('点击改变颜色3')
        .onClick(() => {
         // this.vm.changeCoverUrl();
          this.vm.coverUrl ='#ff007bff';
        })
      Button('点击改变颜色4')
        .onClick(() => {
          // this.vm.changeCoverUrl();
          this.vm.coverUrl = '#ffff0000';
        })
    }
    .width('100%')
    .height('100%')
  }
}