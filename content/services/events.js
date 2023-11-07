.import "index.js" as API_TOOLS
.import KudaGo as Stores

function getEvents() {
    const parametersObj = Stores.EventsStore.events.filterParameters

    const location = parametersObj['location'].value.slug
    const actual_since = parametersObj['dates'].value[0].toISOString()
    const actual_until = parametersObj['dates'].value[1] ? parametersObj['dates'].value[1].toISOString() : ''
    const categories = parametersObj['category'].value.slug
    const title = parametersObj['title'].value
    const fields = 'id,title,slug,is_free,short_title'

    const query = API_TOOLS.buildQueryParametersString({actual_since, actual_until, location, categories, fields})

    Stores.EventsStore.events.isLoading = true

    API_TOOLS.sendRequest(
        title.length === 0 ? `events/${query}` : `search/${query}&q=${title}&ctype=event`,
        (response) => {
            const { results, next, previous, count } = response

            Stores.EventsStore.events = {
                items: results,
                isLoading: false,
                totalCount: count,
                filterParameters: Stores.EventsStore.events.filterParameters
            }
            Stores.EventsStore.next = next
            Stores.EventsStore.previous = previous
        }
    )
}

function getEventById(id, onSuccess = () => {}, onFailed = () => {}) {
    const lang = 'ru'
    const expand = 'images,dates,location,place'
    const text_format = 'text'

    const query = API_TOOLS.buildQueryParametersString({lang, expand, text_format})

    API_TOOLS.sendRequest(
        `events/${id}${query}`,
        (response) => {
            onSuccess(response)
        },
        (response) => {
            onFailed(response)
        }
    )
}

function getTodayEvents(onSuccess = () => {}, onFailed = () => {}) {
    const lang = 'ru'
    const fields = 'object'
    const expand = 'object'
    const date = new Date().toISOString()

    const query = API_TOOLS.buildQueryParametersString({lang, fields, date, expand})

    API_TOOLS.sendRequest(
        `events-of-the-day/${query}`,
        (response) => {
            const { results, next, previous } = response
            const events = results.map((event) => event['object'])

            onSuccess({events, next, previous})
        },
        (response) => {
            onFailed(response)
        }
    )
}

function appendEvents(linkToNext, onSuccess = () => {}) {
    const query = linkToNext.slice(Math.max(linkToNext.lastIndexOf('events'), linkToNext.lastIndexOf('search')))

    Stores.EventsStore.events.isLoading = true
    console.log('LINK: ' + linkToNext)
    console.log('QUERY: ' + query)

    API_TOOLS.sendRequest(
        query,
        (response) => {
            const { results, next, previous, count } = response

            Stores.EventsStore.events = {
                items: [...Stores.EventsStore.events.items, ...results],
                isLoading: false,
                totalCount: count,
                filterParameters: Stores.EventsStore.events.filterParameters
            }
            Stores.EventsStore.next = next
            Stores.EventsStore.previous = previous

            onSuccess()
        }
    )
}
