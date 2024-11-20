import router from '@ohos.router'
@Entry
@Component
struct Second {
  @State message: string = '我是第二个页面'

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)

        //添加一个按钮
        Button(){
          Text('点我返回')
        }
        .type(ButtonType.Normal)
        .margin({top:20})
        .width('20%')
        .onClick((v)=>{
          router.back()
        })
      }
      .width('100%')
    }
    .height('100%')
  }
}