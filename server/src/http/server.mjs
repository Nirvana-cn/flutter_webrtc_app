import Koa from "koa";
import {HTTP_PORT} from "../common/constant.mjs";
import handler from "./router.mjs";

const app = new Koa();

export function startHttpServer() {
    app.use(async ctx => {
        await handler(ctx);
    });

    app.listen(HTTP_PORT);
    console.log(`Http server is running at localhost:${HTTP_PORT}.`);
}