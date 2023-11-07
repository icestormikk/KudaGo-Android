import QtQuick 2.15
import QtQuick.LocalStorage

QtObject {
    readonly property var database: LocalStorage.openDatabaseSync(
        'favourite_events_database',
        '',
        'Database for storing information about events taking place in a number of Russian cities',
        undefined,
        (db) => {
            db.transaction(
                function (tx) {
                    tx.executeSql(`
                        CREATE TABLE IF NOT EXISTS favourite_events (
                            event_id INTEGER PRIMARY KEY,
                            data JSON
                        )`
                    )
                }
            )
        }
    )
}
