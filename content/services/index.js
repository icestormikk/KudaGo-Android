const ROW_API_URL = 'https://kudago.com/public-api'
const DEFAULT_API_VERSION = 'v1.4'


const API_URL = `${ROW_API_URL}/${DEFAULT_API_VERSION}/`

function sendRequest(
    address,
    onSuccess = () => {},
    onFailed = () => {},
    httpMethod = "GET"
) {
    const request = new XMLHttpRequest();
    const url = `${API_URL}/${address}`;
    console.log(url)

    request.onreadystatechange = function() {
        if (request.readyState === XMLHttpRequest.DONE) {
            if (request.status && request.status === 200) {
                var result = JSON.parse(request.responseText)
                onSuccess(result)
            } else {
                onFailed(result)
            }
        }
    }

    request.open(httpMethod, url, true);
    request.send();
}

function buildQueryParametersString(paramsObj) {
    return '?' + Object.entries(paramsObj).map(([key, value]) => `${key}=${value}`).join('&')
}
