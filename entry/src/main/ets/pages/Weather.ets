import CommonConstant from '../constant/CommonConstant';
import WeatherViewModel from '../viewmodel/WeatherViewModel';
import { CurrentWeatherState, FutureWeatherState } from './state/WeatherState';

@Entry
@Component
struct Weather {
  @State currentWeather?: CurrentWeatherState = null
  @State futureWeather: FutureWeatherState[] = null

  aboutToAppear() {
    WeatherViewModel.getCurrentWeather().then((weather: CurrentWeatherState) => {
      this.currentWeather = weather
    }).catch((weather: CurrentWeatherState) => {
      this.currentWeather = weather
    })
    WeatherViewModel.getFutureWeather().then((weather: FutureWeatherState[]) => {
      this.futureWeather = weather
    }).catch((weather: FutureWeatherState[]) => {
      this.futureWeather = weather
    })
  }

  build() {
    Column() {
      Row() {
        Column() {
          Row() {
            Text(`${this.currentWeather?.currentTemp}°`).boldStyle()
            Image(this.currentWeather?.icon)
              .objectFit(ImageFit.Contain)
              .size({ width: 50, height: 50 })
          }

          Text(this.currentWeather?.futureTemp).normalStyle()
        }.alignItems(HorizontalAlign.Start)

        Column({ space: 10 }) {
          Row() {
            Text(this.currentWeather?.main).boldStyle()
          }

          Text(this.currentWeather?.feelTemp).normalStyle()
        }.alignItems(HorizontalAlign.Center)
      }
      .justifyContent(FlexAlign.SpaceBetween)
      .padding(20)
      .alignItems(VerticalAlign.Top)
      .width(CommonConstant.FULL)
      .height(200)
      .backgroundImage($r("app.media.bg_header"))
      .backgroundImageSize(ImageSize.Cover)

      Text("3小时天气预报")
        .fontColor(Color.White)
        .normalStyle()
        .margin({ left: 10, top: 10 })

      List() {
        ForEach(this.futureWeather, (item: FutureWeatherState) => {
          ListItem() {
            Column() {
              Text(`${item.temp}°`).normalStyle()
              Image(item.icon)
                .objectFit(ImageFit.Contain)
                .size({ width: 50, height: 50 })
              Text(item.time).normalStyle()
            }
          }
        })
      }
      .listDirection(Axis.Horizontal)
      .width(CommonConstant.FULL)
      .backgroundColor(Color.Grey)
      .height(120)
      .margin({ top: 10 })
      .padding({ top: 3, bottom: 3 })
      .alignListItem(ListItemAlign.Center)
      .borderRadius(12)
    }
    .alignItems(HorizontalAlign.Start)
    .backgroundColor("#414852")
    .width(CommonConstant.FULL)
    .height(CommonConstant.FULL)
  }
}

@Extend(Text) function normalStyle() {
  .fontWeight(FontWeight.Medium)
  .fontSize(14)
}

@Extend(Text) function boldStyle() {
  .fontWeight(FontWeight.Bold)
  .fontSize(24)
}