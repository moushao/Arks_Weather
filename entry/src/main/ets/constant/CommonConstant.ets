import { Clouds, Coord, Main, Sys, Weather, WeatherModel, Wind } from '../model/WeatherModel'

export const enum ContentType {
  JSON = 'application/json'
}

export default class CommonConstant {
  static readonly DELAY_TIME: number = 1000
  static readonly ANIMATION_DURATION: number = 2000
  static readonly HTTP_READ_TIMEOUT: number = 10000
  static readonly FULL: string = '100%'
  static readonly HTTP_CODE_200: number = 200
  static readonly SERVER_CODE_SUCCESS: string = 'success'
  static readonly URL_FUTURE_WEATHER = `https://api.openweathermap.org/data/2.5/forecast?appid=7ce48fbdedcc72653e589f93b4da7ee4&units=metric&lang=zh_cn&q=Chengdu,CN`
  static readonly URL_CURRENT_WEATHER: string = `https://api.openweathermap.org/data/2.5/weather?units=metric&lang=zh_cn&appid=7ce48fbdedcc72653e589f93b4da7ee4&q=Chengdu,CN`
}


