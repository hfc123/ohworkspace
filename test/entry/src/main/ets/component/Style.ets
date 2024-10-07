// 全局
@Styles function functionName() {
  .height(100)//通用属性
  .onClick(()=>{})//通用事件
}

// 在组件内
@Component
struct FancyUse {
  @Styles fancy() {
    .height(100)
    .onClick(()=>{})
  }

  build() {
  }
}