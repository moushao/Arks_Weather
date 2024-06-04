
export class CurrentWeatherState {
  currentTemp: number
  icon: string
  main: string
  feelTemp: string
  futureTemp: string

  constructor(
    currentTemp: number,
    icon: string,
    main: string,
    feelTemp: string,
    futureTemp: string
  ) {
    this.currentTemp = currentTemp
    this.icon = icon
    this.main = main
    this.feelTemp = feelTemp
    this.futureTemp = futureTemp
  }
}

export class FutureWeatherState {
  temp: number
  icon: string
  time: string

  constructor(
    temp: number,
    icon: string,
    time: string
  ) {
    this.temp = temp
    this.icon = icon
    this.time = time
  }
}