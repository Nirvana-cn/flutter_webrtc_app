import WebSocket from "ws";
import {WS_PORT} from "../common/constant.mjs";
import utils from "../utils/utils.mjs";
import db from "../database/database_operation.mjs";

let server = new WebSocket.Server({port: WS_PORT});
let count = 0;

export function startWebSocketServer() {
    server.on("connection", function connection(instance) {
        instance.onopen = function () {
            console.log(`Connection is open.`);
        };

        instance.onmessage = function (messageEvent) {
            console.log(messageEvent.data);
            db.queryOnline().then((userArr) => {
                instance.send(JSON.stringify(userArr));
            })
        };

        instance.onclose = function (closeEvent) {
            console.log(`Connection is closed: ${closeEvent.reason}`);
            utils.printConnectedCount(--count)
        };

        instance.onerror = function (errorEvent) {
            console.log(`Connection is error: ${errorEvent.error}`)
        };

        console.log(`WebSocket server has been connected.`);
        utils.printConnectedCount(++count);
    });

    console.log(`WebSocket server is running at localhost:${WS_PORT}.`);
}