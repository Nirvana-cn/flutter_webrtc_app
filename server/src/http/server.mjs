import Koa from "koa";
import {HTTP_PORT} from "../common/constant.mjs";

const app = new Koa();

export function startHttpServer() {
    app.use(async ctx => {
        ctx.body = 'Hello World';
    });

    app.listen(HTTP_PORT);
    console.log(`Http server is running at localhost:${HTTP_PORT}.`);
}