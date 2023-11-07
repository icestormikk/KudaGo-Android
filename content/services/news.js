.import "index.js" as API_TOOLS

function getAllNews(onSuccess = () => {}, onFailed = () => {}) {
    const fields = 'title,images,site_url,description'
    const actual_only = true
    const order_by = '-publication_date'

    const query = API_TOOLS.buildQueryParametersString({fields, actual_only, order_by})

    API_TOOLS.sendRequest(
        `news/${query}`,
        (response) => {
            onSuccess(response)
        },
        (response) => {
            onFailed(response)
        }
    )
}


function appendNews(newsLink, onSuccess = () => {}, onFailed = () => {}) {
    const query = newsLink.slice(newsLink.lastIndexOf('news'))

    API_TOOLS.sendRequest(
        query,
        (response) => {
            onSuccess(response.results, response.next)
        },
        (response) => {
            onFailed(response)
        }
    )
}
