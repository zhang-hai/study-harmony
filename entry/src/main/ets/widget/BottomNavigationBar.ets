
@Component
export struct BottomNavigationBar{
  build() {
    Row(){
      Image($r('app.media.alipay')).width(50).fillColor('#3c72f0')
      Column({space:3}){
        Image($r('app.media.pay')).width(26).fillColor('#4b4e4f')
        Text('理财').fontColor('#54565a').fontSize(14)
      }
      Column({space:3}){
        Image($r('app.media.life')).width(26).fillColor('#4b4e4f')
        Text('生活').fontColor('#54565a').fontSize(14)
      }
      Column({space:3}){
        Image($r('app.media.ellipsis_message')).width(26).fillColor('#4b4e4f')
        Text('消息').fontColor('#54565a').fontSize(14)
      }
      Column({space:3}){
        Image($r('app.media.portrait')).width(26).fillColor('#4b4e4f')
        Text('我的').fontColor('#54565a').fontSize(14)
      }
    }
    .backgroundColor(Color.White)
    .borderWidth({top:1})
    .borderColor('#e1e2e3')
    .width('100%')
    .height(70)
    .justifyContent(FlexAlign.SpaceAround)
  }
}