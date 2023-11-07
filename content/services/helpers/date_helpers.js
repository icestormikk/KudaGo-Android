const days = ['Понедельник', 'Вторник', 'Среда', 'Четверг', 'Пятница', 'Суббота', 'Воскресенье']

function getBeautifiedSchedule(schedulesArray) {
    const result = {}

    schedulesArray.forEach((schedule) => {
        schedule.days_of_week.forEach((dayIndex) => {
            if (result[days[dayIndex]] === undefined) {
                result[days[dayIndex]] = []
            }

            result[days[dayIndex]].push(schedule.start_time)
        })
    })

    return result
}

function filterActualDates(datesArray) {
    return datesArray.filter((dateObj) => datesObj.end * 1000 < new Date().getTime())
}
