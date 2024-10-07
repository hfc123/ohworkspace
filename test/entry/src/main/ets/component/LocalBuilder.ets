

@Entry
@Component
@Preview
struct Parent {
  label: string = `Parent`;
  @Builder componentBuilder() {
    Text(`${this.label}`)
  }

  @LocalBuilder componentBuilder2() {
    Text(`${this.label}`)
  }

  build() {
    Column() {
      Child({ customBuilderParam: this.componentBuilder })
      Child({ customBuilderParam: this.componentBuilder2 })
    }
  }
}
@Component
struct Child {
  label: string = `Child`;
  @Builder customBuilder() {};

  @BuilderParam customBuilderParam: () => void =this.customBuilder
  //If a component attribute supports local initialization, a valid, runtime-independent default value should be set for it.
  //  @Require @BuilderParam customBuilderParam: () => void
  //  @BuilderParam customBuilderParam: () => void
  build() {
    Column() {
      this.customBuilderParam()
    }
  }
}