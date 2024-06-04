export function formatTime(date: string) {
  const dateTime = new Date(date)
  let hour = dateTime.getHours().toString()
  let minute = dateTime.getMinutes().toString()
  if (hour.length === 1) {
    hour = "0" + hour
  }
  if (minute.length === 1) {
    minute = "0" + minute
  }
  return hour + ":" + minute
}