.import "index.js" as API_TOOLS

function getCategories(onSuccess = (response) => {}, onFailed = (response) => {}, lang = 'ru', fields = [], order_by = ['name']) {
    const params = API_TOOLS.buildQueryParametersString({lang, fields, order_by})
    const category = 'event-categories'
    const url = `${category}${params}`

    API_TOOLS.sendRequest(url, onSuccess, onFailed)
}
