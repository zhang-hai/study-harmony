@Component
export struct ActivityItem{
  build() {
    Row(){
      Column({space:8}){
        Text('玩一玩').fontColor($r('app.color.title')).fontSize(20)
        Text('签到兑礼|超多大奖 超好玩').fontColor($r('app.color.sub_title')).fontSize(14)
      }
      .alignItems(HorizontalAlign.Start)
      Row({space:8}){
        Image($r('app.media.ic_tree'))
          .width(50)
          .height(50)
          .backgroundColor('#efefef')
          .padding(5)
          .borderRadius(5)
        Image($r('app.media.chevron_right')).width(15)
      }
    }
    .width('100%')
    .backgroundColor(Color.White)
    .borderRadius(5)
    .padding(15)
    .justifyContent(FlexAlign.SpaceBetween)
  }
}