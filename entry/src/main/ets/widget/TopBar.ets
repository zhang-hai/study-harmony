
@Entry
@Component
struct TopBar{
  @State title:string = '个人中心'
  build() {
    Row(){
      Image($r('app.media.chevron_left'))
        .width(40)
        .height('100%')
        .padding(10)
        .onClick(()=>{
          console.log('@@@@点击了返回按钮')
        })
        // .backgroundColor(Color.Red)
      Text(`${this.title}`)
      Image($r('app.media.more'))
        .width(40)
        .height('100%')
        .padding(10)
        .onClick(()=>{
          console.log('@@@@点击了更多按钮')
        })
        // .backgroundColor(Color.Red)
    }
    .justifyContent(FlexAlign.SpaceBetween)
    .width('100%')
    .height(40)
    .backgroundColor(Color.Gray)
  }
}