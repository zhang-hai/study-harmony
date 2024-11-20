import { BottomNavigationBar } from '../widget/BottomNavigationBar'
import {MusicItem} from '../widget/MusicItem'
import {ActivityItem} from '../widget/ActivityItem'
// 支付宝首页
@Entry
@Component
struct AlipayHome{
  build() {
    Stack(){
      MainContent()
      BottomNavigationBar()
    }
    .alignContent(Alignment.Bottom)
    .width('100%')
    .height('100%')
  }
}

@Component
struct MainContent{
  build() {
    Stack(){
      TopSearch()
      Scroll(){
        Column(){
          Row(){
            Column(){
              Image($r('app.media.ic_saoyisao')).width(33).fillColor(Color.White)
              Text('扫一扫').fontColor(Color.White)
            }
            Column(){
              Image($r('app.media.ic_shoufukuan')).width(30).fillColor(Color.White)
              Text('收付款').fontColor(Color.White)
            }
            Column(){
              Image($r('app.media.ic_chuxing')).width(40).height(40)
              Text('出行').fontColor(Color.White)
            }
            Column(){
              Image($r('app.media.ic_kabao')).width(38)
              Text('卡包').fontColor(Color.White)
            }
          }
          .width('100%')
          .padding({bottom:30})
          .backgroundColor('#4b74ef')
          .justifyContent(FlexAlign.SpaceAround)
          // 主内容
          Column(){
            MiddleMenuList()
            MusicItem()
              .margin({top:10})
            ActivityItem()
            Text('xxxxxxxxx').height(500)
            Text('xxxxxxxxx').height(500)
            Text('xxxxxxxxx').height(500)
          }
          .width('100%')
          .margin({top:-15})
          .backgroundColor('#f6f6f6')
          .borderRadius({topLeft:10,topRight:10})
        }
        .width('100%')
        .padding({top:60,bottom:70})
      }
    }
    .backgroundColor(Color.White)
    .alignContent(Alignment.Top)
    .width('100%')
    .height('100%')
  }
}

// 顶部搜索栏
@Component
struct TopSearch{
  build() {
    Row({space:10}){
      Column(){
        Row(){
          Text('北京').fontColor(Color.White).fontSize(16)
          Image($r('app.media.ic_arrow_down')).width(20).fillColor(Color.White)
        }
        Text('晴 2℃').fontColor(Color.White).fontSize(12)
      }
      .alignItems(HorizontalAlign.Start)
      Row({space:6}){
        Image($r('app.media.ic_search'))
          .width(20).fillColor('#a1a1a1')
        TextInput({placeholder:'北京交通一卡通'})
          .height(30)
          .padding({left:0,top:3,bottom:3})
          .fontSize(14)
          .placeholderColor('#6e6e6e')
          .layoutWeight(1)
          .backgroundColor(Color.Transparent)
        Line({width:1,height:20}).backgroundColor('#e4e4e4')
        Text('搜索').fontColor('#4b74ef')
      }
      .padding({left:5,right:5})
      .borderRadius(5)
      .backgroundColor(Color.White)
      .alignItems(VerticalAlign.Center)
      .layoutWeight(1)
      Image($r('app.media.ic_add')).width(30)
    }
    .backgroundColor('#4b74ef')
    .height(60)
    .padding({top:5,left:10,right:10})
    .width('100%')
    .zIndex(666)
  }
}

// 主菜单
@Component
struct MiddleMenuList{
  build() {
    Row({space:10}){
      Column({space:10}){
        Column({space:5}){
          Image($r('app.media.ic_ddchuxing')).width(25)
          Text('滴滴出行').fontSize(13)
        }
        Column({space:5}){
          Image($r('app.media.ic_yuebao')).width(25)
          Text('余额宝').fontSize(13)
        }
        Column({space:5}){
          Image($r('app.media.life')).width(25).fillColor('#84baf9')
          Text('读书听书').fontSize(13)
        }
      }
      Column({space:10}){
        Column({space:5}){
          Image($r('app.media.ic_shenghuojf')).width(25)
          Text('生活缴费').fontSize(13)
        }
        Column({space:5}){
          Image($r('app.media.ic_huabai')).width(25)
          Text('花呗').fontSize(13)
        }
        Column({space:5}){
          Image($r('app.media.ic_jijin')).width(25)
          Text('基金').fontSize(13)
        }
      }
      Column({space:10}){
        Column({space:5}){
          Image($r('app.media.ic_gupiao')).width(25)
          Text('股票').fontSize(13)
        }
        Column({space:5}){
          Image($r('app.media.ic_feizhu')).width(25)
          Text('飞猪旅行').fontSize(13)
        }
        Column({space:5}){
          Image($r('app.media.ic_zhibo')).width(25)
          Text('直播广场').fontSize(13)
        }
      }
      Column({space:10}){
        Column({space:5}){
          Image($r('app.media.ic_mayisenlin')).width(25)
          Text('蚂蚁森林').fontSize(13)
        }
        Column({space:5}){
          Image($r('app.media.ic_taobiaobiao')).width(25)
          Text('淘票票').fontSize(13)
        }
        Column({space:5}){
          Image($r('app.media.ic_health')).width(30)
          Text('医疗健康').fontSize(13)
        }
      }
      Column({space:10}){
        Column({space:5}){
          Image($r('app.media.ic_shoujichongzhi')).width(25)
          Text('手机充值').fontSize(13)
        }
        Column({space:5}){
          Image($r('app.media.ic_elma')).width(25)
          Text('饿了么').fontSize(13)
        }
        Column({space:5}){
          Image($r('app.media.more')).width(30)
          Text('更多').fontSize(13)
        }
      }
    }
    .justifyContent(FlexAlign.SpaceBetween)
    .width('100%')
    .padding({left:15,top:10,right:15})
  }
}