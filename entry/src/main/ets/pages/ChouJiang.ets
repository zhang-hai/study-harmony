interface ICard{
  id:number
  icon:string
  count:number
  text:string
}

@Entry
@Component
struct ChouJiang{
  @State cards :ICard[]= [
    {id:1,icon:'',count:0,text:'1111'},
    {id:2,icon:'',count:0,text:'2222'},
    {id:3,icon:'',count:0,text:'3333'},
    {id:4,icon:'',count:0,text:'4444'},
    {id:5,icon:'',count:0,text:'5555'},
    {id:6,icon:'',count:0,text:'6666'},
  ]
  @State popOpacity:number = 0
  @State popZIndex:number = -1
  @State popCardScaleX:number = 0
  @State popCardScaleY:number = 0

  @State cardIndex:number = -1

  build() {
    Stack({alignContent:Alignment.Top}){
      Column(){
        Grid(){
          ForEach(this.cards,(card:ICard,index:number)=>{
            GridItem(){
              Badge({
                count:card.count,
                position:BadgePosition.RightTop,
                style:{
                  badgeSize:20
                }
              }){
                Text(card.count > 0 ? card.text:'')
                  .cardStyle({width:80,height:'100%'})
                  .opacity(0.5)
              }
            }
            .padding({top:10})
            .width('100%')
            .height(120)
          },(item:ICard,index:number)=>{return `${index}_${item.id}_${item.count}`})
        }
        .margin({top:20})
        .columnsTemplate('1fr 1fr 1fr')
        .rowsGap(20)
        .height(300)

        Button('立即抽卡')
          .btnExtend({top:30})
          .onClick(()=>{
            this.popOpacity = 1
            this.popZIndex = 99
            this.popCardScaleX = 1
            this.popCardScaleY = 1
            this.cardIndex = Math.floor(Math.random() * this.cards.length)
            console.log('随机抽取卡片',this.cardIndex)
          })
      }
      .width('100%')
      .height('100%')

    //   抽卡层
      Column(){
        Text(this.cardIndex === -1 ? '':this.cards[this.cardIndex].text)
          .cardStyle({width:130,height:180})
          .scale({
            x:this.popCardScaleX,
            y:this.popCardScaleY
          })
          .animation({
            duration:500
          })
        Button('开心收下')
          .btnExtend({top:60})
          .onClick(()=>{
            const card = this.cards[this.cardIndex]
            card.count++
            this.cards[this.cardIndex] = JSON.parse(JSON.stringify(card))
            this.popOpacity = 0
            this.popZIndex = -1
            this.popCardScaleX = 0
            this.popCardScaleY = 0
          })
      }
      .backgroundColor('#b3000000')
      .width('100%')
      .height('100%')
      .justifyContent(FlexAlign.Center)
      .opacity(this.popOpacity)
      .zIndex(this.popZIndex)
      .animation({
        duration:300
      })
    }
  }
}

@Extend(Button)
function btnExtend(margin:Padding | Length | LocalizedPadding){
  .backgroundColor('#f04482')
  .margin(margin)
  .width('50%')
}

@Extend(Text)
function cardStyle(size: SizeOptions){
  .borderRadius(10)
  .textAlign(TextAlign.Center)
  .backgroundColor(Color.Pink)
  .size(size)
}