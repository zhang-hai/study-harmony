@Entry
@Component
struct Login{
  build() {
    Column(){
      Image($r('app.media.icon')).width(40)
      //手机号
      TextInput({
        placeholder:'请输入用户名'
      })
        .maxLength(10)
        .type(InputType.PhoneNumber)
        .margin({top:20})
      // 密码
      TextInput({
        placeholder:'请输入密码'
      })
        .maxLength(16)
        .type(InputType.Password)
        .margin({top:10})
      Row(){
        Checkbox().selectedColor($r('app.color.primary_color'))
        Text(){
          Span('我已知晓并同意xx的 ')
          Span('隐私保护协议')
            .fontColor($r('app.color.primary_color'))
            .fontSize(13)
            .onClick(()=>{
              console.log('@@@点击了隐私保护协议')
            })
          Span(' 用户协议').fontColor($r('app.color.primary_color'))
            .fontSize(13)
            .onClick(()=>{
              console.log('@@@点击了用户协议')
            })
        }
        .fontSize(13)
        .fontColor('#666')
      }.margin({top:10})
      .width('100%')
      // .backgroundColor(Color.Gray)
      Button(){
        Text('登录').fontColor(Color.White)
      }
      .width('80%')
      .padding(10)
      .margin({top:20})
      .onClick(()=>{
        console.log('@@@点击了登录按钮')
      })
    }
    .padding(10)
    .justifyContent(FlexAlign.Center)
  }
}