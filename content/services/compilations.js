.import "index.js" as API_TOOLS

function getAllCompilations(onSuccess = () => {}, onFailed = () => {}) {
    API_TOOLS.sendRequest(
        'lists',
        (response) => {
            onSuccess(response.results, response.next)
        },
        (response) => {
            onFailed(response)
        }
    )
}

function getCompilationById(id, onSuccess = () => {}, onFailed = () => {}) {
    const expand = 'images'

    const query = API_TOOLS.buildQueryParametersString({expand})
    API_TOOLS.sendRequest(
        `lists/${id}/${query}`,
        (response) => {
            onSuccess(response)
        },
        (response) => {
            onFailed(response)
        }
    )
}

function appendCompilations(address, onSuccess = () => {}, onFailed = () => {}) {
    const query = address.slice(address.lastIndexOf('lists'))

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
