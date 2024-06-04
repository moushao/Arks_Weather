import CommonConstant from '../constant/CommonConstant';
import { FutureWeatherModel, WeatherModel } from '../model/WeatherModel';
import { HttpRequestGet } from '../http/HttpRequest';
import { formatTime } from '../utils/TimeUtils';
import { CurrentWeatherState, FutureWeatherState } from '../pages/state/WeatherState';

class WeatherViewModel {
  public getCurrentWeather(): Promise<CurrentWeatherState> {
    return new Promise((resolve: Function) => {
      HttpRequestGet<WeatherModel>(CommonConstant.URL_CURRENT_WEATHER).then((data: WeatherModel) => {
        if (data !== null) {
          const currentWeatherState: CurrentWeatherState =
            new CurrentWeatherState(
              data.main.temp,
              `https://openweathermap.org/img/wn/${data.weather[0].icon}@2x.png`,
              data.weather[0].description,
              `体感温度: ${data.main.feels_like}°`,
              `未来24小时:${data.main.temp_min}°~${data.main.temp_max}°`
            )
          resolve(currentWeatherState)
        }
      }).catch(() => {
        console.log("getCurrentWeather exception")
      });
    });
  }

  public getFutureWeather(): Promise<FutureWeatherState[]> {
    return new Promise((resolve: Function) => {
      HttpRequestGet<FutureWeatherModel>(CommonConstant.URL_FUTURE_WEATHER).then((data: FutureWeatherModel) => {
        let futureWeathers: FutureWeatherState[] = []
        if (data !== null && data.list.length > 0) {
          data.list.forEach((item, index) => {
            futureWeathers.push(
              new FutureWeatherState(
                item.main.temp,
                `https://openweathermap.org/img/wn/${item.weather[0].icon}@2x.png`,
                formatTime(item.dt_txt)
              )
            )
          })
          resolve(futureWeathers)
        }
      }).catch(() => {
        console.log("getFutureWeather exception")
      });
    });
  }
}

export default new WeatherViewModel()