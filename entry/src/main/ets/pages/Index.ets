import router from '@ohos.router'
@Entry
@Component
struct Index {
  @State message: string = '标题'

  build() {
    Row() {
      Column() {
        Text(this.message)
          .size({width:300,height:300})
          .backgroundColor(Color.Green)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
          .backgroundImage($r('app.media.app_icon'))
          .backgroundImagePosition(Alignment.Center)

        //添加一个按钮
        Button(){
          Text('点我')
        }
        .type(ButtonType.Capsule)
        .margin({top:20})
        .padding({top:5,bottom:5})
        .width(120)
        .onClick((v)=>{
          router.pushUrl({url:'pages/Second'})
        })

          Image($r('app.media.app_icon')).width(40).margin(10)
          TextInput({
            placeholder:'xxx'
          }).type(InputType.Password)
      }
      .width('100%')
    }
    .height('100%')
  }
}