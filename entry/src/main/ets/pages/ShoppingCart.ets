
import { IGoods } from '../entity/IGoods'
import {ICallback} from '../entity/ICallback'

let goodList:IGoods[] = [
  {id:'1',title:'冲销量1000ml缤纷八果水果捞', subTitle:'含1份折扣商品', price:40.4, discount:0.5, icon:'goods_hamburger' },
  {id:'2',title:'冲销量1000ml缤纷八果水果捞1', subTitle:'含1份折扣商品', price:40.4, discount:0.8, icon:'goods_food' },
  // {id:'3',title:'冲销量1000ml缤纷八果水果捞2', subTitle:'含1份折扣商品', price:40.4, discount:0.2, icon:'goods_cake' },
  // {id:'4',title:'冲销量1000ml缤纷八果水果捞2', subTitle:'含1份折扣商品', price:40.4, discount:0.9, icon:'goods_hamburger' },
  // {id:'5',title:'冲销量1000ml缤纷八果水果捞2', subTitle:'含1份折扣商品', price:40.4, discount:0.95, icon:'ic_tree' }
]

/**
 * 购物车页面
 */
@Entry
@Component
struct ShoppingCart{
  // 共减的金额
  @State totalReduction:number = 0
  // 合计金额
  @State totalPrice:number = 0
  //已选数量
  @State totalNum:number = 0
  build() {
    Column(){
      Scroll(){
        Column({space:10}){
          ForEach(goodList,(item:IGoods)=>{
            GoodsItem({good:item,callback:{update:(addOrNot:boolean)=>{
              if(addOrNot){
                this.totalPrice += item.price * item.discount
                this.totalNum+=1
                this.totalReduction += item.price * (1-item.discount)
              }else {
                this.totalPrice -= item.price * item.discount
                this.totalNum -= 1
                this.totalReduction -= item.price * (1-item.discount)
              }
            }}})
          })
        }
        .padding(10)
        .width('100%')
      }
      .align(Alignment.TopStart)
      .width('100%')
      .backgroundColor('#f3f3f3')
      .layoutWeight(1)
      Row({space:10}){
        Column({space:5}){
          Text(){
            Span(`已选 ${this.totalNum} 件，`)
            Span('合计：')
            Span(`¥${this.totalPrice.toFixed(1)}`).fontColor('#ac2d1f').fontSize(18)
          }
          Text(`共减 ¥${this.totalReduction.toFixed(1)}`).fontColor('#ac2d1f').fontSize(14)
        }
        .layoutWeight(1)
        .alignItems(HorizontalAlign.End)
        Button('结算外卖')
          .enabled(this.totalPrice > 0)
          .backgroundColor('#ffd441')
          .fontColor('#422b00')
          .onClick(()=>AlertDialog.show({
            message: `总价格 ¥${this.totalPrice}`,
            alignment:DialogAlignment.Center,
            buttons:[{value:'确定',action:()=>{}},{value:'取消',action:()=>{}}]
          }))

      }
      .padding({right:20})
      .backgroundColor(Color.White)
      .width('100%')
      .height(80)
    }
    .width('100%')
    .height('100%')
  }
}

@Component
struct GoodsItem{
  @Prop good:IGoods
  @Prop callback?:ICallback
  @State num:number = 0
  build() {
    Row(){
      Image($r(`app.media.${this.good.icon}`)).width(100).height(70).borderRadius(10).objectFit(ImageFit.Contain)
      Column(){
        Text(this.good.title).fontSize(16).fontColor('#2a3038')
        Text(this.good.subTitle).fontSize(12).fontColor('#7d7d7d').margin({top:5})
        Row(){
          Row(){
            Text((this.good.price * this.good.discount).toFixed(1)).fontColor('#ac2d1f').fontSize(18)
            // 增加删除线
            Text(this.good.price.toString()).fontColor('#7d7d7d').fontSize(16).margin({left:5}).decoration({type:TextDecorationType.LineThrough})
          }
          Row(){
            Button('-',{type:ButtonType.Normal})
              .borderRadius({topLeft:5,bottomLeft:5,topRight:0,bottomRight:0})
              .btnNumOp()
              .onClick(()=>this.changeNum('sub'))
            Text(this.num.toString()).fontSize(14).width(40).height(22).borderWidth({left:0,top:1,right:0,bottom:1}).textAlign(TextAlign.Center).borderColor('#cacaca')
            Button('+',{type:ButtonType.Normal})
              .borderRadius({topLeft:0,bottomLeft:0,topRight:5,bottomRight:5})
              .btnNumOp()
              .onClick(()=>this.changeNum('add'))
          }
        }
        .justifyContent(FlexAlign.SpaceBetween)
        .margin({top:15})
        .width('100%')
      }
      .layoutWeight(1)
      .alignItems(HorizontalAlign.Start)
    }
    .borderRadius(10)
    .padding({left:5,right:5})
    .width('100%')
    .height(150)
    .backgroundColor(Color.White)
  }
  /**
   * 点击加减数量事件
   */
  changeNum(flag:string){
    if(flag === 'add'){
      this.num++
      this.callback?.update(true)
    }
    else if(flag === 'sub'){
      if(this.num >= 1){
        this.num--
        this.callback?.update(false)
      }
    }
  }
}

@Extend(Button)
function btnNumOp(){
  .backgroundColor(Color.Transparent)
  .padding(0)
  .width(25)
  .height(22)
  .borderWidth({left:1,top:1,bottom:1,right:1,})
  .fontSize(18)
  .fontColor(Color.Black)
  .borderColor('#cacaca')
}