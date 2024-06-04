export class ResponseResult {
  code: string;
  message: string | Resource
  list: string | Object | ArrayBuffer

  constructor() {
    this.code = ''
    this.message = ''
    this.list = ''
  }
}