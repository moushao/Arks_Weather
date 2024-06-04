export class Coord {
  lon: number
  lat: number

  constructor(lon: number, lat: number) {
    this.lon = lon
    this.lat = lat
  }
}

export class Weather {
  id: number
  main: string
  description: string
  icon: string

  constructor(id: number, main: string, description: string, icon: string) {
    this.id = id
    this.main = main
    this.description = description
    this.icon = icon
  }
}

export class Main {
  temp: number
  feels_like: number
  temp_min: number
  temp_max: number
  pressure: number
  humidity: number

  constructor(
    temp: number,
    feels_like: number,
    temp_min: number,
    temp_max: number,
    pressure: number,
    humidity: number
  ) {
    this.temp = temp
    this.feels_like = feels_like
    this.temp_min = temp_min
    this.temp_max = temp_max
    this.pressure = pressure
    this.humidity = humidity
  }
}

export class Wind {
  speed: number
  deg: number

  constructor(speed: number, deg: number) {
    this.speed = speed
    this.deg = deg
  }
}

export class Clouds {
  all: number

  constructor(all: number) {
    this.all = all
  }
}

export class Sys {
  type: number
  id: number
  country: string
  sunrise: number
  sunset: number

  constructor(type: number, id: number, country: string, sunrise: number, sunset: number) {
    this.type = type
    this.id = id
    this.country = country
    this.sunrise = sunrise
    this.sunset = sunset
  }
}

export class WeatherModel {
  coord: Coord
  weather: Weather[]
  base: string
  main: Main
  visibility: number
  wind: Wind
  clouds: Clouds
  dt: number
  sys: Sys
  timezone: number
  id: number
  name: string
  cod: number
  dt_txt:string
  constructor(
    coord: Coord,
    weather: Weather[],
    base: string,
    main: Main,
    visibility: number,
    wind: Wind,
    clouds: Clouds,
    dt: number,
    sys: Sys,
    timezone: number,
    id: number,
    name: string,
    cod: number,
    dt_txt:string
  ) {
    this.coord = coord
    this.weather = weather
    this.base = base
    this.main = main
    this.visibility = visibility
    this.wind = wind
    this.clouds = clouds
    this.dt = dt
    this.sys = sys
    this.timezone = timezone
    this.id = id
    this.name = name
    this.cod = cod
    this.dt_txt = dt_txt
  }
}

export class City {
  id: number
  name: string
  coord: Coord
  country: string
  population: number
  timezone: number
  sunrise: number
  sunset: number

  constructor(
    id: number,
    name: string,
    coord: Coord,
    country: string,
    population: number,
    timezone: number,
    sunrise: number,
    sunset: number
  ) {
    this.id = id
    this.name = name
    this.coord = coord
    this.country = country
    this.population = population
    this.timezone = timezone
    this.sunrise = sunrise
    this.sunset = sunset
  }
}

export class FutureWeatherModel {
  cod: string
  message: number
  cnt: number
  list: WeatherModel[]
  city: City

  constructor(
    cod: string,
    message: number,
    cnt: number,
    list: WeatherModel[],
    city: City
  ) {
    this.cod = cod
    this.message = message
    this.cnt = cnt
    this.list = list
    this.city = city
  }
}