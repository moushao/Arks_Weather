import http from '@ohos.net.http'
import CommonConstant, { ContentType } from '../constant/CommonConstant'

import { ResponseResult } from './HttpModel'
import { WeatherModel } from '../model/WeatherModel'

export function HttpRequestGet<T>(url: string): Promise<T> {
  let httpRequest = http.createHttp()
  let responseResult = httpRequest.request(url)
  return responseResult.then((value: http.HttpResponse) => {
    if (value.responseCode === CommonConstant.HTTP_CODE_200) {
      let result = `${value.result}`
      let obj: ResponseResult = JSON.parse(result)
      return obj
    } else {
      return null
    }
  }).catch(() => {
    return null
  })
}