import {startWebSocketServer} from "./websocket/server.mjs";
import {startHttpServer} from "./http/server.mjs"

startHttpServer();
startWebSocketServer();
